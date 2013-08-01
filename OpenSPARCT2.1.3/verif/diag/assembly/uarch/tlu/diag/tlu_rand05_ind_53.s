/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_53.s
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
# 360 "diag.j"
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
# 407 "diag.j"
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
	mov 0x31, %r14
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
	mov 0xb4, %r14
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
	mov 0xb4, %r14
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
	mov 0x32, %r14
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
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xab843e04  ! 1: WR_CLEAR_SOFTINT_I	wr	%r16, 0x1e04, %clear_softint
	bne,a	 skip_80_0
	.word 0x91a089d3  ! 1: FDIVd	fdivd	%f2, %f50, %f8
.align 1024
skip_80_0:
	.word 0xd838c007  ! 2: STD_R	std	%r12, [%r3 + %r7]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 3: LDX_R	ldx	[%r31 + %r0], %r18
intveclr_80_1:
	setx 0x873c820981c95424, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 4: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_80_2:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_80_2:
	mov 0x9fe, %r20
	mov 0x18, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0c0  ! 5: STDFA_I	stda	%f0, [0x00c0, %r31]
splash_lsu_80_3:
	set 0xfa964d35, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 6: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_80_4:
	setx 0x926f2a8cb96d534c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_80_5:
	setx 0x1b102f952ed856c2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 8: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_80_6:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdc00  ! 9: STDFA_R	stda	%f0, [%r0, %r31]
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_7:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 10: RDPC	rd	%pc, %r10
intveclr_80_8:
	setx 0xf8cf0ff8808e8b99, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 11: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_9
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_9:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 12: RDPC	rd	%pc, %r20
	.word 0xe81fc000  ! 13: LDD_R	ldd	[%r31 + %r0], %r20
unsupttte80_10:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x95b4c480  ! 14: FCMPLE32	fcmple32	%d50, %d0, %r10
	.word 0x9f803570  ! 15: SIR	sir	0x1570
	.word 0xe69fdf00  ! 16: LDDA_R	ldda	[%r31, %r0] 0xf8, %r19
	setx 0x2526490ea72a79d0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_11:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_80_12:
	setx 0x9e986b1b006800fc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 18: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_13
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_13:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 19: CASA_R	casa	[%r31] %asi, %r16, %r19
	.word 0xab828013  ! 20: WR_CLEAR_SOFTINT_R	wr	%r10, %r19, %clear_softint
	.word 0x91b34482  ! 21: FCMPLE32	fcmple32	%d44, %d2, %r8
intveclr_80_14:
	setx 0xfe38d0ee62a85329, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 22: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 23: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_80_15:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d90800c  ! 24: WRPR_WSTATE_R	wrpr	%r2, %r12, %wstate
jmptr_80_16:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 25: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_80_17:
	nop
	setx 0xfffffed5fffff00f, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd46fe059  ! 27: LDSTUB_I	ldstub	%r10, [%r31 + 0x0059]
	.word 0x93d020b5  ! 28: Tcc_I	tne	icc_or_xcc, %r0 + 181
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 29: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_80_18:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xc187db60  ! 30: LDFA_R	lda	[%r31, %r0], %f0
	setx 0xd9f7cffeff488284, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_19:
	.word 0x39400001  ! 31: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfdb60  ! 32: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x91d020b4  ! 33: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x87ac0a48  ! 34: FCMPd	fcmpd	%fcc<n>, %f16, %f8
splash_cmpr_80_20:
	setx 0xd7ef336c5b4e8251, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 35: WR_STICK_REG_R	wr	%r0, %r1, %-
jmptr_80_21:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 36: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_22:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 37: CASA_R	casa	[%r31] %asi, %r17, %r17
splash_hpstate_80_23:
	.word 0x81982cc7  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc7, %hpstate
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_24:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 39: CASA_R	casa	[%r31] %asi, %r17, %r17
mondo_80_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d90c002  ! 40: WRPR_WSTATE_R	wrpr	%r3, %r2, %wstate
	.word 0xe257c000  ! 41: LDSH_R	ldsh	[%r31 + %r0], %r17
splash_cmpr_80_26:
	setx 0x8ddbc44f0d7bed51, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 42: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe33fc000  ! 43: STDF_R	std	%f17, [%r0, %r31]
	.word 0xab816ac3  ! 44: WR_CLEAR_SOFTINT_I	wr	%r5, 0x0ac3, %clear_softint
splash_hpstate_80_27:
	.word 0x81982b2f  ! 45: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b2f, %hpstate
change_to_randtl_80_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_28:
	.word 0x8f902000  ! 46: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_80_29:
	setx 0xf43080b73ec42baf, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 47: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_30:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e008  ! 48: CASA_R	casa	[%r31] %asi, %r8, %r17
intveclr_80_31:
	setx 0xbba8ed551273c669, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 49: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_32) + 8, 16, 16)) -> intp(0,0,11)
intvec_80_32:
	.word 0x39400001  ! 50: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 51: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f8020c8  ! 52: SIR	sir	0x00c8
unsupttte80_33:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3ec8033  ! 53: PREFETCHA_R	prefetcha	[%r18, %r19] 0x01, #one_read
	.word 0x95b48492  ! 54: FCMPLE32	fcmple32	%d18, %d18, %r10
	.word 0x29800001  ! 55: FBL	fbl,a	<label_0x1>
	.word 0x9f8026bb  ! 56: SIR	sir	0x06bb
intveclr_80_35:
	setx 0x333e10f9058baecf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 57: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_80_36:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 58: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
memptr_80_37:
	set 0x60340000, %r31
	.word 0x85846d2d  ! 59: WRCCR_I	wr	%r17, 0x0d2d, %ccr
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_38:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 60: RDPC	rd	%pc, %r8
	.word 0xe44fc000  ! 61: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe537c000  ! 62: STQF_R	-	%f18, [%r0, %r31]
mondo_80_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d92800a  ! 63: WRPR_WSTATE_R	wrpr	%r10, %r10, %wstate
	.word 0xe46fe091  ! 64: LDSTUB_I	ldstub	%r18, [%r31 + 0x0091]
jmptr_80_40:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 65: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a0196c  ! 66: FqTOd	dis not found

	.word 0xd8800ac0  ! 67: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r12
	.word 0x9f803697  ! 68: SIR	sir	0x1697
intveclr_80_42:
	setx 0x801e684b03e36564, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_43:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e007  ! 70: CASA_R	casa	[%r31] %asi, %r7, %r12
splash_lsu_80_44:
	set 0xcea4c57d, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 71: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_80_45:
	nop
	setx 0xffffffaafffff173, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_80_46:
	setx 0xeae4f1dbea9e19c8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_80_47-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_47:
	.word 0x9195000d  ! 74: WRPR_PIL_R	wrpr	%r20, %r13, %pil
	.word 0x29800001  ! 75: FBL	fbl,a	<label_0x1>
	fbn skip_80_49
	bg  	 skip_80_49
.align 32
skip_80_49:
	.word 0x87acca47  ! 76: FCMPd	fcmpd	%fcc<n>, %f50, %f38
mondo_80_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d950000  ! 77: WRPR_WSTATE_R	wrpr	%r20, %r0, %wstate
	.word 0xa9a2c9d2  ! 78: FDIVd	fdivd	%f42, %f18, %f20
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_51
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_51
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_51:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 79: RDPC	rd	%pc, %r16
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_52:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e004  ! 80: CASA_R	casa	[%r31] %asi, %r4, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_53)+32, 16, 16)) -> intp(4,1,3)
xir_80_53:
	.word 0xa984b5af  ! 81: WR_SET_SOFTINT_I	wr	%r18, 0x15af, %set_softint
	.word 0xe8d7e030  ! 82: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r20
	.word 0x3e800001  ! 83: BVC	bvc,a	<label_0x1>
	.word 0xe937c000  ! 84: STQF_R	-	%f20, [%r0, %r31]
	.word 0xa9454000  ! 85: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0xda47e030  ! 86: LDSW_I	ldsw	[%r31 + 0x0030], %r13
pmu_80_54:
	nop
	setx 0xfffff970fffff36d, %g1, %g7
	.word 0xa3800007  ! 87: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f802b08  ! 88: SIR	sir	0x0b08
	setx 0x43833de6450df2a8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_55:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_56:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e004  ! 90: CASA_R	casa	[%r31] %asi, %r4, %r13
mondo_80_57:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d914013  ! 91: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
splash_hpstate_80_58:
	.word 0x819822c4  ! 92: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c4, %hpstate
	.word 0xda9fc3c0  ! 93: LDDA_R	ldda	[%r31, %r0] 0x1e, %r13
	.word 0xa9a00170  ! 94: FABSq	dis not found

	.word 0xd26fe0e4  ! 95: LDSTUB_I	ldstub	%r9, [%r31 + 0x00e4]
	setx 0x784dfb0226d6057d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_59:
	.word 0x39400001  ! 96: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd26fe07b  ! 97: LDSTUB_I	ldstub	%r9, [%r31 + 0x007b]
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 98: Tcc_R	tne	icc_or_xcc, %r0 + %r30
fpinit_80_60:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82448  ! 99: PREFETCHA_I	prefetcha	[%r0, + 0x0448] %asi, #one_read
	.word 0x93a449b4  ! 100: FDIVs	fdivs	%f17, %f20, %f9
DS_80_61:
	.word 0x93a409c0  ! 1: FDIVd	fdivd	%f16, %f0, %f40
	pdist %f0, %f30, %f24
	.word 0xa9b0c313  ! 101: ALIGNADDRESS	alignaddr	%r3, %r19, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01964  ! 102: FqTOd	dis not found

pmu_80_63:
	nop
	setx 0xfffffef4fffff1d8, %g1, %g7
	.word 0xa3800007  ! 103: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_80_64:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd347429a	! Random illegal ?
	.word 0xd510c00d  ! 1: LDQF_R	-	[%r3, %r13], %f10
	.word 0xa1a10833  ! 104: FADDs	fadds	%f4, %f19, %f16
	.word 0x99902000  ! 105: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xc3ec0032  ! 106: PREFETCHA_R	prefetcha	[%r16, %r18] 0x01, #one_read
	.word 0x9f802f60  ! 107: SIR	sir	0x0f60
	.word 0xd827e0e9  ! 108: STW_I	stw	%r12, [%r31 + 0x00e9]
debug_80_65:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_80_65:
	mov 0x89a, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd920  ! 109: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd81fc000  ! 110: LDD_R	ldd	[%r31 + %r0], %r12
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_66:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 111: CASA_R	casa	[%r31] %asi, %r16, %r12
change_to_randtl_80_67:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_67:
	.word 0x8f902000  ! 112: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_80_68:
	setx 0xf01a3721053b0162, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 113: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_80_69:
	setx 0x61d422b4ba662892, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 114: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_70
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_70:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 115: RDPC	rd	%pc, %r16
pmu_80_71:
	nop
	setx 0xfffffd6dfffff6e0, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01970  ! 117: FqTOd	dis not found

	.word 0xe527e04c  ! 118: STF_I	st	%f18, [0x004c, %r31]
mondo_80_73:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d924004  ! 119: WRPR_WSTATE_R	wrpr	%r9, %r4, %wstate
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_74:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 120: CASA_R	casa	[%r31] %asi, %r13, %r18
splash_lsu_80_75:
	set 0xa8114d75, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 121: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9804001  ! 122: WR_SET_SOFTINT_R	wr	%r1, %r1, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_76) + 24, 16, 16)) -> intp(1,0,2)
intvec_80_76:
	.word 0x39400001  ! 123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_80_77:
	nop
	setx 0xfffff891fffff8b6, %g1, %g7
	.word 0xa3800007  ! 124: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_80_78:
	nop
	setx 0xfffff48ffffff7bf, %g1, %g7
	.word 0xa3800007  ! 125: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_79
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_79:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 126: CASA_R	casa	[%r31] %asi, %r19, %r18
pmu_80_80:
	nop
	setx 0xfffff363fffff3c2, %g1, %g7
	.word 0xa3800007  ! 127: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_80_81:
	set 0x26b6f8ee, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 128: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_80_82:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 129: RESTORE_R	restore	%r31, %r0, %r31
debug_80_83:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_80_83:
	mov 0xe90, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdc00  ! 130: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916ca780  ! 131: SDIVX_I	sdivx	%r18, 0x0780, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 132: LDX_R	ldx	[%r31 + %r0], %r16
change_to_randtl_80_85:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_85:
	.word 0x8f902000  ! 133: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_80_86:
	setx 0x6646f72b7d758aad, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 134: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9a409d0  ! 135: FDIVd	fdivd	%f16, %f16, %f20
cwp_80_87:
    set user_data_start, %o7
	.word 0x93902006  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x26700001  ! 137: BPL	<illegal instruction>
	.word 0xd69fe000  ! 138: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r11
mondo_80_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d930014  ! 139: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916d2ec7  ! 140: SDIVX_I	sdivx	%r20, 0x0ec7, %r8
	.word 0xc1bfe060  ! 141: STDFA_I	stda	%f0, [0x0060, %r31]
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_90:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e004  ! 142: CASA_R	casa	[%r31] %asi, %r4, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a0196b  ! 143: FqTOd	dis not found

	.word 0xd41fe030  ! 144: LDD_I	ldd	[%r31 + 0x0030], %r10
splash_tba_80_92:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 145: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	bg  	 skip_80_93
	.word 0xe43c8012  ! 1: STD_R	std	%r18, [%r18 + %r18]
.align 2048
skip_80_93:
	.word 0xe9e20032  ! 146: CASA_I	casa	[%r8] 0x 1, %r18, %r20
	.word 0xa7800012  ! 147: WR_GRAPHICS_STATUS_REG_R	wr	%r0, %r18, %-
	.word 0xc187e0a0  ! 148: LDFA_I	lda	[%r31, 0x00a0], %f0
	.word 0xd08008a0  ! 149: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x97454000  ! 150: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
pmu_80_95:
	nop
	setx 0xfffff063fffff66d, %g1, %g7
	.word 0xa3800007  ! 151: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa5a409ec  ! 152: FDIVq	dis not found

splash_lsu_80_96:
	set 0x4f1f62ff, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 153: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_97:
	setx 0x6ad4134bc940ac21, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 154: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab830000  ! 155: WR_CLEAR_SOFTINT_R	wr	%r12, %r0, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_98) + 0, 16, 16)) -> intp(0,0,14)
intvec_80_98:
	.word 0x39400001  ! 156: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 157: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_99
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_99:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e007  ! 159: CASA_R	casa	[%r31] %asi, %r7, %r18
	.word 0xa5a249cd  ! 160: FDIVd	fdivd	%f40, %f44, %f18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_100) + 40, 16, 16)) -> intp(7,0,27)
intvec_80_100:
	.word 0x39400001  ! 161: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93454000  ! 162: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0x81460000  ! 163: RD_STICK_REG	stbar
	.word 0xc3eac030  ! 164: PREFETCHA_R	prefetcha	[%r11, %r16] 0x01, #one_read
mondo_80_101:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d940013  ! 165: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_102
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_102:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 166: RDPC	rd	%pc, %r10
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_103:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 167: CASA_R	casa	[%r31] %asi, %r6, %r9
	rd %pc, %r19
	add %r19, (ivw_80_104-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_104:
	.word 0x91918013  ! 168: WRPR_PIL_R	wrpr	%r6, %r19, %pil
	.word 0xa784800b  ! 169: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r11, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_106)+24, 16, 16)) -> intp(4,1,3)
xir_80_106:
	.word 0xa9842e17  ! 170: WR_SET_SOFTINT_I	wr	%r16, 0x0e17, %set_softint
	.word 0xd327c000  ! 171: STF_R	st	%f9, [%r0, %r31]
	.word 0xd2800c60  ! 172: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 173: LDX_R	ldx	[%r31 + %r0], %r9
	rd %pc, %r19
	add %r19, (ivw_80_107-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_107:
	.word 0x9194c010  ! 174: WRPR_PIL_R	wrpr	%r19, %r16, %pil
	.word 0xd2800b40  ! 175: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r9
splash_lsu_80_108:
	set 0x321965ca, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 176: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_109:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 177: CASA_R	casa	[%r31] %asi, %r6, %r9
pmu_80_110:
	nop
	setx 0xfffff43cfffffb1e, %g1, %g7
	.word 0xa3800007  ! 178: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_80_111:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xc187d920  ! 179: LDFA_R	lda	[%r31, %r0], %f0
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_112:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 180: CASA_R	casa	[%r31] %asi, %r6, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_113)+48, 16, 16)) -> intp(4,1,3)
xir_80_113:
	.word 0xa98125ba  ! 181: WR_SET_SOFTINT_I	wr	%r4, 0x05ba, %set_softint
memptr_80_114:
	set user_data_start, %r31
	.word 0x8583322c  ! 182: WRCCR_I	wr	%r12, 0x122c, %ccr
mondo_80_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d930014  ! 183: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_116) + 48, 16, 16)) -> intp(0,0,7)
intvec_80_116:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_80_117:
	set 0xa85dc8c1, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_118:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 186: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0xd237e08a  ! 187: STH_I	sth	%r9, [%r31 + 0x008a]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 188: LDX_R	ldx	[%r31 + %r0], %r9
jmptr_80_119:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 189: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd2800b00  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r9
	.word 0xc187e0a0  ! 191: LDFA_I	lda	[%r31, 0x00a0], %f0
cwp_80_120:
    set user_data_start, %o7
	.word 0x93902005  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
mondo_80_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d94c012  ! 193: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
mondo_80_122:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d930013  ! 194: WRPR_WSTATE_R	wrpr	%r12, %r19, %wstate
DS_80_123:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa7b2c310  ! 195: ALIGNADDRESS	alignaddr	%r11, %r16, %r19
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 196: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_124
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_124:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 197: RDPC	rd	%pc, %r12
	.word 0x9b50c000  ! 198: RDPR_TT	rdpr	%tt, %r13
	.word 0x29800001  ! 199: FBL	fbl,a	<label_0x1>
DS_80_126:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 200: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_80_127-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_127:
	.word 0x91908002  ! 201: WRPR_PIL_R	wrpr	%r2, %r2, %pil
mondo_80_128:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d924007  ! 202: WRPR_WSTATE_R	wrpr	%r9, %r7, %wstate
splash_lsu_80_129:
	set 0x149727e1, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 203: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_80_130:
	set 0x1c18ddc6, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 204: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 205: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_80_131:
	setx 0xeffc080f1f6fc23f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 206: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_132
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_132:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e007  ! 207: CASA_R	casa	[%r31] %asi, %r7, %r13
splash_cmpr_80_133:
	setx 0x8699a8993432a68e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_80_134:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_134-donret_80_134), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b1b200 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x385, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_134:
	.word 0xdaffe06c  ! 209: SWAPA_I	swapa	%r13, [%r31 + 0x006c] %asi
	.word 0xa7804002  ! 210: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r2, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_136) + 16, 16, 16)) -> intp(3,0,8)
intvec_80_136:
	.word 0x39400001  ! 211: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	bg,a	 skip_80_137
	fbn,a,pn	%fcc0,  skip_80_137
.align 128
skip_80_137:
	.word 0x87a94a53  ! 212: FCMPd	fcmpd	%fcc<n>, %f36, %f50
splash_cmpr_80_138:
	setx 0xbfa4d21fdc72e2b6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 213: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_80_139:
	set 0x47bfdc41, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 214: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9024ca  ! 215: WRPR_PSTATE_I	wrpr	%r0, 0x04ca, %pstate
	.word 0xd88008a0  ! 216: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xd88fe010  ! 217: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_140
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_140:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 218: RDPC	rd	%pc, %r16
	.word 0x9f802517  ! 219: SIR	sir	0x0517
mondo_80_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d90c014  ! 220: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
jmptr_80_142:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 221: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe46fe0f3  ! 222: LDSTUB_I	ldstub	%r18, [%r31 + 0x00f3]
	.word 0xe48008a0  ! 223: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x9f803903  ! 224: SIR	sir	0x1903
intveclr_80_143:
	setx 0xb1733eea2e3ea0d6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_144:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 226: CASA_R	casa	[%r31] %asi, %r0, %r18
splash_lsu_80_145:
	set 0x1623b60c, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 227: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_146
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_146
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_146:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 228: RDPC	rd	%pc, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 229: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe6800be0  ! 230: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r19
intveclr_80_147:
	setx 0x52a8ace9d35cf0bc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 231: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	fbe,a,pn	%fcc0,  skip_80_148
	brlez,a,pt	%r13, skip_80_148
.align 2048
skip_80_148:
	.word 0xda398013  ! 232: STD_R	std	%r13, [%r6 + %r19]
splash_cmpr_80_149:
	setx 0xf3b7ea868ec822c8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 233: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_150) + 16, 16, 16)) -> intp(1,0,0)
intvec_80_150:
	.word 0x39400001  ! 234: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_80_151:
	nop
	setx 0xffffff8dfffff488, %g1, %g7
	.word 0xa3800007  ! 235: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02032  ! 236: Tcc_I	ta	icc_or_xcc, %r0 + 50
intveclr_80_152:
	setx 0x817ab716cc11ce86, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 237: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9569254d  ! 238: SDIVX_I	sdivx	%r4, 0x054d, %r10
pmu_80_154:
	nop
	setx 0xfffff9e3fffff87f, %g1, %g7
	.word 0xa3800007  ! 239: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe28008a0  ! 240: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x87ad0a4b  ! 241: FCMPd	fcmpd	%fcc<n>, %f20, %f42
	.word 0xd727c000  ! 242: STF_R	st	%f11, [%r0, %r31]
	.word 0xc187e060  ! 243: LDFA_I	lda	[%r31, 0x0060], %f0
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_155:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r11
	.word 0x99902004  ! 245: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
DS_80_156:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe531361a  ! 1: STQF_I	-	%f18, [0x161a, %r4]
	normalw
	.word 0x91458000  ! 246: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xa3a049a9  ! 247: FDIVs	fdivs	%f1, %f9, %f17
	fbg skip_80_157
	brlz,pn  	%r19, skip_80_157
.align 32
skip_80_157:
	.word 0x24cb4001  ! 248: BRLEZ	brlez,a,pt	%r13,<label_0xb4001>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 249: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd527c000  ! 250: STF_R	st	%f10, [%r0, %r31]
	.word 0x93d020b4  ! 251: Tcc_I	tne	icc_or_xcc, %r0 + 180
intveclr_80_158:
	setx 0x159d35a2b650f60a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 252: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_159:
	setx 0xb501affda9e3a607, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_80_160:
	setx 0x1dbdd9d6f4a453ea, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 254: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f8020c3  ! 255: SIR	sir	0x00c3
intveclr_80_161:
	setx 0x6e676b970dec59f4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 256: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_80_162:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xb57f38f0	! Random illegal ?
	.word 0xa1a00554  ! 1: FSQRTd	fsqrt	
	.word 0xa1a50832  ! 257: FADDs	fadds	%f20, %f18, %f16
	.word 0x9f803e72  ! 258: SIR	sir	0x1e72
	.word 0xe257c000  ! 259: LDSH_R	ldsh	[%r31 + %r0], %r17
splash_lsu_80_163:
	set 0xd132fc89, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 260: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	brlez,pn  	%r17, skip_80_164
	fbue,a,pn	%fcc0,  skip_80_164
.align 2048
skip_80_164:
	.word 0xe3e44021  ! 261: CASA_I	casa	[%r17] 0x 1, %r1, %r17
	.word 0x81460000  ! 262: RD_STICK_REG	stbar
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956ceb39  ! 263: SDIVX_I	sdivx	%r19, 0x0b39, %r10
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_166:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 264: CASA_R	casa	[%r31] %asi, %r19, %r9
	.word 0xa3a509c6  ! 265: FDIVd	fdivd	%f20, %f6, %f48
intveclr_80_167:
	setx 0x94f046e41b7294da, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 266: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3450000  ! 267: RD_SET_SOFTINT	rd	%set_softint, %r17
splash_hpstate_80_168:
	.word 0x81982374  ! 268: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0374, %hpstate
splash_htba_80_169:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 269: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_80_170:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe5344004  ! 1: STQF_R	-	%f18, [%r4, %r17]
	normalw
	.word 0xa1458000  ! 270: RD_SOFTINT_REG	rd	%softint, %r16
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_171
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_171:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 271: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0x91d02032  ! 272: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_80_172:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d944006  ! 273: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
	.word 0xa5a00171  ! 274: FABSq	dis not found

	setx 0x6d67d3de2f8e7663, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_173:
	.word 0x39400001  ! 275: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_80_174:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_174-donret_80_174), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009e85ae | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xfd7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_174:
	.word 0xe6ffe07a  ! 276: SWAPA_I	swapa	%r19, [%r31 + 0x007a] %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01970  ! 277: FqTOd	dis not found

splash_cmpr_80_176:
	setx 0x58351faf62751d48, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_80_177:
	setx 0xeb5ce14cb0c4d3a1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 279: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 280: LDX_R	ldx	[%r31 + %r0], %r18
fpinit_80_178:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82bf0  ! 281: PREFETCHA_I	prefetcha	[%r0, + 0x0bf0] %asi, #one_read
	.word 0xe48008a0  ! 282: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x91d02035  ! 283: Tcc_I	ta	icc_or_xcc, %r0 + 53
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_179
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_179:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 284: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0x99b34489  ! 285: FCMPLE32	fcmple32	%d44, %d40, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_180) + 48, 16, 16)) -> intp(3,0,0)
intvec_80_180:
	.word 0x39400001  ! 286: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9b450000  ! 287: RD_SET_SOFTINT	rd	%set_softint, %r13
fpinit_80_181:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 288: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xe28fe010  ! 289: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_182
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_182:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 290: RDPC	rd	%pc, %r9
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 291: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0x9f803c09  ! 292: SIR	sir	0x1c09
splash_cmpr_80_184:
	setx 0x3ccc69a41e2be298, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 293: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_80_185:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_185-donret_80_185-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00983a8d | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x65d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_185:
	.word 0xd6ffe036  ! 294: SWAPA_I	swapa	%r11, [%r31 + 0x0036] %asi
	.word 0xd737c000  ! 295: STQF_R	-	%f11, [%r0, %r31]
	.word 0xd727e0f8  ! 296: STF_I	st	%f11, [0x00f8, %r31]
	.word 0xd66fe0c1  ! 297: LDSTUB_I	ldstub	%r11, [%r31 + 0x00c1]
splash_lsu_80_186:
	set 0x4abade22, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc187e0c0  ! 299: LDFA_I	lda	[%r31, 0x00c0], %f0
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 300: LDX_R	ldx	[%r31 + %r0], %r11
intveclr_80_187:
	setx 0xddd7806f007948d1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_80_188:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_80_188:
	mov 0xfc0, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc187d920  ! 302: LDFA_R	lda	[%r31, %r0], %f0
	setx 0x24b6279f5f44cb3e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_189:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9032ff  ! 304: WRPR_PSTATE_I	wrpr	%r0, 0x12ff, %pstate
DS_80_190:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb3528df  ! 1: STQF_I	-	%f13, [0x08df, %r20]
	normalw
	.word 0xa1458000  ! 305: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0xe65fe010  ! 306: LDX_I	ldx	[%r31 + 0x0010], %r19
	.word 0xe6bfe0d1  ! 307: STDA_I	stda	%r19, [%r31 + 0x00d1] %asi
pmu_80_191:
	nop
	setx 0xfffffae1fffff151, %g1, %g7
	.word 0xa3800007  ! 308: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe727e0e3  ! 309: STF_I	st	%f19, [0x00e3, %r31]
pmu_80_192:
	nop
	setx 0xfffff2ccfffffca6, %g1, %g7
	.word 0xa3800007  ! 310: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68008a0  ! 311: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
pmu_80_193:
	nop
	setx 0xfffffc15fffffee3, %g1, %g7
	.word 0xa3800007  ! 312: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_80_194-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_194:
	.word 0x91950012  ! 313: WRPR_PIL_R	wrpr	%r20, %r18, %pil
mondo_80_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d92c014  ! 314: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
	.word 0xa984c008  ! 315: WR_SET_SOFTINT_R	wr	%r19, %r8, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_196) + 56, 16, 16)) -> intp(2,0,6)
intvec_80_196:
	.word 0x39400001  ! 316: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_197
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_197:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 317: RDPC	rd	%pc, %r16
mondo_80_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d930014  ! 318: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
fpinit_80_199:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 319: FCMPLE32	fcmple32	%d0, %d4, %r4
intveclr_80_200:
	setx 0x8a2f11aee0fde1cd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 320: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1a00171  ! 321: FABSq	dis not found

intveclr_80_201:
	setx 0x0200176561095c25, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_202) + 16, 16, 16)) -> intp(4,0,9)
intvec_80_202:
	.word 0x39400001  ! 323: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_203:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 324: RDPC	rd	%pc, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_204) + 24, 16, 16)) -> intp(5,0,13)
intvec_80_204:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_205:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 326: RDPC	rd	%pc, %r18
	fbu skip_80_206
	bn,a	 skip_80_206
.align 512
skip_80_206:
	.word 0x87acca40  ! 327: FCMPd	fcmpd	%fcc<n>, %f50, %f0
	.word 0xdac7e008  ! 328: LDSWA_I	ldswa	[%r31, + 0x0008] %asi, %r13
	.word 0x93d020b2  ! 329: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0xc187d960  ! 330: LDFA_R	lda	[%r31, %r0], %f0
	.word 0x91d02034  ! 331: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xda8008a0  ! 332: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	fbug skip_80_207
	fbug skip_80_207
.align 1024
skip_80_207:
	.word 0x87a88a53  ! 333: FCMPd	fcmpd	%fcc<n>, %f2, %f50
	fbl,a,pn	%fcc0,  skip_80_208
	fbg,a,pn	%fcc0,  skip_80_208
.align 32
skip_80_208:
	.word 0xa3b404d3  ! 334: FCMPNE32	fcmpne32	%d16, %d50, %r17
intveclr_80_209:
	setx 0x0f7ba8c58a5a1259, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 335: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_210
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_210
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_210:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 336: RDPC	rd	%pc, %r20
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_211
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_211:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 337: CASA_R	casa	[%r31] %asi, %r19, %r11
pmu_80_212:
	nop
	setx 0xfffff5bdfffff90c, %g1, %g7
	.word 0xa3800007  ! 338: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87ac0a40  ! 339: FCMPd	fcmpd	%fcc<n>, %f16, %f0
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_213
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_213:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 340: CASA_R	casa	[%r31] %asi, %r18, %r16
intveclr_80_214:
	setx 0xd88e83d526ffe521, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 341: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_215
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_215:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 342: CASA_R	casa	[%r31] %asi, %r18, %r16
	.word 0xe08008a0  ! 343: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_80_216:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d924013  ! 344: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
DS_80_217:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 345: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_218:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 346: RDPC	rd	%pc, %r8
mondo_80_219:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d95000a  ! 347: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
	.word 0x99500000  ! 348: RDPR_TPC	rdpr	%tpc, %r12
	.word 0xda6fe07a  ! 349: LDSTUB_I	ldstub	%r13, [%r31 + 0x007a]
	.word 0xda57c000  ! 350: LDSH_R	ldsh	[%r31 + %r0], %r13
jmptr_80_220:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 351: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_80_221:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 352: FDIVs	fdivs	%f0, %f4, %f6
intveclr_80_222:
	setx 0x8665841d9bac1cdf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 353: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_223
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_223
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_223:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 354: RDPC	rd	%pc, %r17
	.word 0x9f802a87  ! 355: SIR	sir	0x0a87
donret_80_224:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_224-donret_80_224), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e4b991 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x88e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_224:
	.word 0xe6ffe02c  ! 356: SWAPA_I	swapa	%r19, [%r31 + 0x002c] %asi
	.word 0x9f802d14  ! 357: SIR	sir	0x0d14
debug_80_225:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfc3e0  ! 358: STDFA_R	stda	%f16, [%r0, %r31]
	rd %pc, %r19
	add %r19, (ivw_80_226-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_226:
	.word 0x91950012  ! 359: WRPR_PIL_R	wrpr	%r20, %r18, %pil
	.word 0x9ba149d4  ! 360: FDIVd	fdivd	%f36, %f20, %f44
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_227:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e008  ! 361: CASA_R	casa	[%r31] %asi, %r8, %r8
	.word 0xa9a00170  ! 362: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_228
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_228
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_228:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 363: RDPC	rd	%pc, %r18
	fble skip_80_229
	.word 0xd1e00030  ! 1: CASA_I	casa	[%r0] 0x 1, %r16, %r8
.align 32
skip_80_229:
	.word 0xa5a349c6  ! 364: FDIVd	fdivd	%f44, %f6, %f18
	.word 0xd137e098  ! 365: STQF_I	-	%f8, [0x0098, %r31]
donret_80_230:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_230-donret_80_230), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b78783 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x18f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_230:
	.word 0xd0ffe0ea  ! 366: SWAPA_I	swapa	%r8, [%r31 + 0x00ea] %asi
change_to_randtl_80_231:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_231:
	.word 0x8f902001  ! 367: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xad8462cb  ! 368: WR_SOFTINT_REG_I	wr	%r17, 0x02cb, %softint
	.word 0xa9840012  ! 369: WR_SET_SOFTINT_R	wr	%r16, %r18, %set_softint
	.word 0x8d902fd7  ! 370: WRPR_PSTATE_I	wrpr	%r0, 0x0fd7, %pstate
splash_lsu_80_232:
	set 0x12103dee, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 371: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd137e0c8  ! 372: STQF_I	-	%f8, [0x00c8, %r31]
unsupttte80_233:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3e88030  ! 373: PREFETCHA_R	prefetcha	[%r2, %r16] 0x01, #one_read
memptr_80_234:
	set user_data_start, %r31
	.word 0x8580bf47  ! 374: WRCCR_I	wr	%r2, 0x1f47, %ccr
mondo_80_235:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d94c004  ! 375: WRPR_WSTATE_R	wrpr	%r19, %r4, %wstate
	.word 0xd337c000  ! 376: STQF_R	-	%f9, [%r0, %r31]
	.word 0xd317c000  ! 377: LDQF_R	-	[%r31, %r0], %f9
    set 0x1744, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b347eb  ! 378: PDISTN	fmean16	%d44, %d42, %d16
	bvc,a	 skip_80_236
	.word 0xd438c00c  ! 1: STD_R	std	%r10, [%r3 + %r12]
.align 512
skip_80_236:
	.word 0x39400001  ! 379: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x4726093c7d57236d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_237:
	.word 0x39400001  ! 380: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f8032e7  ! 381: SIR	sir	0x12e7
	.word 0x95a00170  ! 382: FABSq	dis not found

intveclr_80_238:
	setx 0xe7650245e0fc7b37, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 383: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3a0016c  ! 384: FABSq	dis not found

	.word 0x8d903eba  ! 385: WRPR_PSTATE_I	wrpr	%r0, 0x1eba, %pstate
splash_htba_80_239:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 386: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_240
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_240:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 387: RDPC	rd	%pc, %r18
	.word 0xd05fe028  ! 388: LDX_I	ldx	[%r31 + 0x0028], %r8
splash_cmpr_80_241:
	setx 0x463da1cda18dd790, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 390: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_lsu_80_242:
	set 0xf78f7671, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 391: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_243
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_243
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_243:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 392: RDPC	rd	%pc, %r13
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_244
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_244:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e001  ! 393: CASA_R	casa	[%r31] %asi, %r1, %r9
debug_80_245:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_80_245:
	mov 0xad2, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdb60  ! 394: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd257c000  ! 395: LDSH_R	ldsh	[%r31 + %r0], %r9
	.word 0x9f802eb6  ! 396: SIR	sir	0x0eb6
mondo_80_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d94c009  ! 397: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
	.word 0xd26fe099  ! 398: LDSTUB_I	ldstub	%r9, [%r31 + 0x0099]
	.word 0xa1a00171  ! 399: FABSq	dis not found

	.word 0xe2bfe02e  ! 400: STDA_I	stda	%r17, [%r31 + 0x002e] %asi
	.word 0xe20fc000  ! 401: LDUB_R	ldub	[%r31 + %r0], %r17
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 402: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe317c000  ! 403: LDQF_R	-	[%r31, %r0], %f17
pmu_80_247:
	nop
	setx 0xfffff6b7fffffde3, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_80_248:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 405: FCMPLE32	fcmple32	%d0, %d4, %r8
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 406: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa5703269  ! 407: POPC_I	popc	0x1269, %r18
	.word 0xa984000a  ! 408: WR_SET_SOFTINT_R	wr	%r16, %r10, %set_softint
	.word 0x29800001  ! 409: FBL	fbl,a	<label_0x1>
intveclr_80_250:
	setx 0x1315d6c9f26568e4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 410: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5a309d2  ! 411: FDIVd	fdivd	%f12, %f18, %f18
	rd %pc, %r19
	add %r19, (ivw_80_251-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_251:
	.word 0x91950011  ! 412: WRPR_PIL_R	wrpr	%r20, %r17, %pil
	.word 0x9f8020ba  ! 413: SIR	sir	0x00ba
    set 0x2cb1, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b107e3  ! 414: PDISTN	fmean16	%d4, %d34, %d42
	rd %pc, %r19
	add %r19, (ivw_80_252-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_252:
	.word 0x91934010  ! 415: WRPR_PIL_R	wrpr	%r13, %r16, %pil
	.word 0xe48fe030  ! 416: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r18
	.word 0x2a700001  ! 417: BPCS	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 418: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xc187de00  ! 420: LDFA_R	lda	[%r31, %r0], %f0
change_to_randtl_80_253:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_253:
	.word 0x8f902002  ! 421: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x97a0016a  ! 422: FABSq	dis not found

splash_hpstate_80_254:
	.word 0x81982a87  ! 423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a87, %hpstate
mondo_80_255:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d918009  ! 424: WRPR_WSTATE_R	wrpr	%r6, %r9, %wstate
	.word 0x9f803ecd  ! 425: SIR	sir	0x1ecd
	.word 0xa5454000  ! 426: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
intveclr_80_256:
	setx 0x8be15d31cae6fde3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 427: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_257:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 428: RDPC	rd	%pc, %r11
	rd %pc, %r19
	add %r19, (ivw_80_258-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_258:
	.word 0x91940013  ! 429: WRPR_PIL_R	wrpr	%r16, %r19, %pil
splash_cmpr_80_259:
	setx 0x1f9a61d3c8149b40, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 430: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7800002  ! 431: WR_GRAPHICS_STATUS_REG_R	wr	%r0, %r2, %-
	.word 0xe857c000  ! 432: LDSH_R	ldsh	[%r31 + %r0], %r20
	.word 0x91540000  ! 433: RDPR_GL	<illegal instruction>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_261
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_261:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 434: CASA_R	casa	[%r31] %asi, %r16, %r9
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_262
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_262:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 435: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01973  ! 436: FqTOd	dis not found

	.word 0xa7a00173  ! 437: FABSq	dis not found

change_to_randtl_80_264:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_264:
	.word 0x8f902000  ! 438: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_80_265:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_265:
	.word 0x8f902001  ! 439: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_80_266:
	setx 0x78cfd66c47447107, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9368667c  ! 441: SDIVX_I	sdivx	%r1, 0x067c, %r9
splash_cmpr_80_268:
	setx 0x42ccaa7960f26794, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 442: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd127e01c  ! 443: STF_I	st	%f8, [0x001c, %r31]
	.word 0x91d02033  ! 444: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 445: Tcc_R	te	icc_or_xcc, %r0 + %r30
jmptr_80_269:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 446: JMPL_R	jmpl	%r27 + %r0, %r27
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
	.word 0x9b414000  ! 447: RDPC	rd	%pc, %r13
	.word 0xd937e019  ! 448: STQF_I	-	%f12, [0x0019, %r31]
pmu_80_271:
	nop
	setx 0xffffff25fffff459, %g1, %g7
	.word 0xa3800007  ! 449: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_80_272:
	nop
	setx 0xfffffa2afffffeb7, %g1, %g7
	.word 0xa3800007  ! 450: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_htba_80_273:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 451: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd89fe000  ! 452: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r12
	.word 0x8d903001  ! 453: WRPR_PSTATE_I	wrpr	%r0, 0x1001, %pstate
	.word 0x99902005  ! 454: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
pmu_80_274:
	nop
	setx 0xfffff324fffff809, %g1, %g7
	.word 0xa3800007  ! 455: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_80_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d92c011  ! 456: WRPR_WSTATE_R	wrpr	%r11, %r17, %wstate
	.word 0xd88008a0  ! 457: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	bcc,a	 skip_80_276
	.word 0x87ac4a47  ! 1: FCMPd	fcmpd	%fcc<n>, %f48, %f38
.align 128
skip_80_276:
	.word 0x87a80a4d  ! 458: FCMPd	fcmpd	%fcc<n>, %f0, %f44
splash_lsu_80_277:
	set 0x2fa20e68, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 459: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd31fc000  ! 460: LDDF_R	ldd	[%r31, %r0], %f9
	rd %pc, %r19
	add %r19, (ivw_80_278-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_278:
	.word 0x9191c012  ! 461: WRPR_PIL_R	wrpr	%r7, %r18, %pil
	.word 0xd277e03c  ! 462: STX_I	stx	%r9, [%r31 + 0x003c]
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
	.word 0xa7414000  ! 463: RDPC	rd	%pc, %r19
	fbo skip_80_280
	brlez,pt  	%r18, skip_80_280
.align 2048
skip_80_280:
	.word 0xd43cc011  ! 464: STD_R	std	%r10, [%r19 + %r17]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01971  ! 465: FqTOd	dis not found

splash_hpstate_80_282:
	.word 0x819822be  ! 466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02be, %hpstate
change_to_randtl_80_283:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_283:
	.word 0x8f902001  ! 467: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xda3fc000  ! 468: STD_R	std	%r13, [%r31 + %r0]
	.word 0x91d02033  ! 469: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x83d020b3  ! 470: Tcc_I	te	icc_or_xcc, %r0 + 179
intveclr_80_284:
	setx 0xcd1023da3c806a7e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 471: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_80_285:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d928013  ! 472: WRPR_WSTATE_R	wrpr	%r10, %r19, %wstate
	.word 0xda77c000  ! 473: STX_R	stx	%r13, [%r31 + %r0]
pmu_80_286:
	nop
	setx 0xfffff3a3fffffa29, %g1, %g7
	.word 0xa3800007  ! 474: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xdacfe008  ! 475: LDSBA_I	ldsba	[%r31, + 0x0008] %asi, %r13
	.word 0x9f8038c0  ! 476: SIR	sir	0x18c0
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 477: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xdb37e0d4  ! 478: STQF_I	-	%f13, [0x00d4, %r31]
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_287
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_287
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_287:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 479: RDPC	rd	%pc, %r20
splash_cmpr_80_288:
	setx 0x6bdd8589049cf88a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 480: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97480000  ! 481: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	rd %pc, %r19
	add %r19, (ivw_80_289-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_289:
	.word 0x91950011  ! 482: WRPR_PIL_R	wrpr	%r20, %r17, %pil
donret_80_290:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_290-donret_80_290), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001dc8bb | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x215, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_290:
	.word 0xe8ffe05c  ! 483: SWAPA_I	swapa	%r20, [%r31 + 0x005c] %asi
	bgu,a	 skip_80_291
	.word 0xd83c8000  ! 1: STD_R	std	%r12, [%r18 + %r0]
.align 128
skip_80_291:
	.word 0xe9e0c033  ! 484: CASA_I	casa	[%r3] 0x 1, %r19, %r20
	.word 0xd497e000  ! 485: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
	.word 0xd51fc000  ! 486: LDDF_R	ldd	[%r31, %r0], %f10
	.word 0xa7850011  ! 487: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r17, %-
	.word 0xd527c000  ! 488: STF_R	st	%f10, [%r0, %r31]
splash_hpstate_80_293:
	.word 0x81982e96  ! 489: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e96, %hpstate
	.word 0xd46fe0f2  ! 490: LDSTUB_I	ldstub	%r10, [%r31 + 0x00f2]
jmptr_80_294:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 491: JMPL_R	jmpl	%r27 + %r0, %r27
debug_80_295:
	nop
	ta T_CHANGE_HPRIV
debug_iva_80_295:
	mov 0x7ed, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+0), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe080  ! 492: STDFA_I	stda	%f16, [0x0080, %r31]
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_296
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_296:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 493: RDPC	rd	%pc, %r11
	.word 0x9f802954  ! 494: SIR	sir	0x0954
pmu_80_297:
	nop
	setx 0xfffff5e2fffff4f8, %g1, %g7
	.word 0xa3800007  ! 495: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_80_298:
	setx 0xc01a04fc69acc7b3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 496: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_80_299:
	setx 0x9a834c800b724559, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 497: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe80fe018  ! 498: LDUB_I	ldub	[%r31 + 0x0018], %r20
	.word 0x97a00171  ! 499: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01970  ! 500: FqTOd	dis not found

splash_cmpr_80_301:
	setx 0xd49317c216154443, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 501: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_80_302:
	setx 0xb9bceb709ab412a2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 502: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9945c000  ! 503: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0xd537c000  ! 504: STQF_R	-	%f10, [%r0, %r31]
	.word 0x9f803fd7  ! 505: SIR	sir	0x1fd7
	rd %pc, %r19
	add %r19, (ivw_80_303-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_303:
	.word 0x9195000d  ! 506: WRPR_PIL_R	wrpr	%r20, %r13, %pil
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 507: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_80_304:
	setx 0x6a7ec7642b684105, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 508: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_80_305:
	.word 0xa5a449d4  ! 1: FDIVd	fdivd	%f48, %f20, %f18
	pdist %f6, %f20, %f16
	.word 0x9bb30311  ! 509: ALIGNADDRESS	alignaddr	%r12, %r17, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_306) + 0, 16, 16)) -> intp(6,0,2)
intvec_80_306:
	.word 0x39400001  ! 510: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_307:
	setx 0x0d5ef703c95246c5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 511: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f8026ae  ! 512: SIR	sir	0x06ae
splash_lsu_80_308:
	set 0xb7c67aec, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 513: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_80_309:
	setx 0x5713b0cfb0390a0d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 514: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 515: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda800b40  ! 516: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r13
pmu_80_310:
	nop
	setx 0xfffff574ffffff8f, %g1, %g7
	.word 0xa3800007  ! 517: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38700001  ! 518: BPGU	<illegal instruction>
	.word 0xa7850008  ! 519: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r8, %-
	.word 0xda6fe070  ! 520: LDSTUB_I	ldstub	%r13, [%r31 + 0x0070]
    set 0x3e5c, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b2c7f3  ! 521: PDISTN	fmean16	%d42, %d50, %d40
mondo_80_312:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d940014  ! 522: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
donret_80_313:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_313-donret_80_313-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004d21f6 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xdde, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_313:
	.word 0xdaffe0e3  ! 523: SWAPA_I	swapa	%r13, [%r31 + 0x00e3] %asi
	.word 0x9f802ca9  ! 524: SIR	sir	0x0ca9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01973  ! 525: FqTOd	dis not found

	.word 0xdacfe038  ! 526: LDSBA_I	ldsba	[%r31, + 0x0038] %asi, %r13
	.word 0xc3ea8025  ! 527: PREFETCHA_R	prefetcha	[%r10, %r5] 0x01, #one_read
mondo_80_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d92c014  ! 528: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
	.word 0xd41fe008  ! 529: LDD_I	ldd	[%r31 + 0x0008], %r10
	.word 0xd537e078  ! 530: STQF_I	-	%f10, [0x0078, %r31]
DS_80_316:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe9307bfe  ! 1: STQF_I	-	%f20, [0x1bfe, %r1]
	normalw
	.word 0xa3458000  ! 531: RD_SOFTINT_REG	rd	%softint, %r17
cwp_80_317:
    set user_data_start, %o7
	.word 0x93902006  ! 532: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_cmpr_80_318:
	setx 0x52572c35a9bd7768, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 533: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_80_319:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_319-donret_80_319-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0021b693 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x24f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_319:
	.word 0xdaffe006  ! 534: SWAPA_I	swapa	%r13, [%r31 + 0x0006] %asi
	.word 0x93a00174  ! 535: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 536: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xe28008a0  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
mondo_80_320:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d918011  ! 538: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
unsupttte80_321:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87a90a51  ! 539: FCMPd	fcmpd	%fcc<n>, %f4, %f48
jmptr_80_322:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 540: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe48008a0  ! 541: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
pmu_80_323:
	nop
	setx 0xfffffefffffffdee, %g1, %g7
	.word 0xa3800007  ! 542: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_80_324:
	set 0x7402a72a, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 543: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_80_325:
	nop
	ta T_CHANGE_HPRIV
debug_iva_80_325:
	mov 0x665, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+40), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe187d960  ! 544: LDFA_R	lda	[%r31, %r0], %f16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_326) + 56, 16, 16)) -> intp(7,0,28)
intvec_80_326:
	.word 0x39400001  ! 545: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_80_327:
	setx 0xab7c601c436ea1c2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 546: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_80_328:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d944012  ! 547: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	.word 0x94d43410  ! 548: UMULcc_I	umulcc 	%r16, 0xfffff410, %r10
memptr_80_329:
	set 0x60540000, %r31
	.word 0x858535d5  ! 549: WRCCR_I	wr	%r20, 0x15d5, %ccr
	.word 0x9f803747  ! 550: SIR	sir	0x1747
memptr_80_330:
	set user_data_start, %r31
	.word 0x8582aba7  ! 551: WRCCR_I	wr	%r10, 0x0ba7, %ccr
	.word 0xc1bfd960  ! 552: STDFA_R	stda	%f0, [%r0, %r31]
	bleu,a	 skip_80_331
	be,a	 skip_80_331
.align 512
skip_80_331:
	.word 0x87ad0a43  ! 553: FCMPd	fcmpd	%fcc<n>, %f20, %f34
splash_cmpr_80_332:
	setx 0x54b555e3492354e5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 554: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9a209cc  ! 555: FDIVd	fdivd	%f8, %f12, %f20
jmptr_80_333:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 556: JMPL_R	jmpl	%r27 + %r0, %r27
unsupttte80_334:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x93a509cb  ! 557: FDIVd	fdivd	%f20, %f42, %f40
	.word 0xd4800c40  ! 558: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196a  ! 559: FqTOd	dis not found

	.word 0xa5a309c8  ! 560: FDIVd	fdivd	%f12, %f8, %f18
debug_80_336:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xc187dc00  ! 561: LDFA_R	lda	[%r31, %r0], %f0
	.word 0x91d020b5  ! 562: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xda1fc000  ! 563: LDD_R	ldd	[%r31 + %r0], %r13
mondo_80_337:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d924008  ! 564: WRPR_WSTATE_R	wrpr	%r9, %r8, %wstate
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_338
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_338
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_338:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 565: RDPC	rd	%pc, %r20
	fbue skip_80_339
	.word 0xd83a8013  ! 1: STD_R	std	%r12, [%r10 + %r19]
.align 512
skip_80_339:
	.word 0xdbe04020  ! 566: CASA_I	casa	[%r1] 0x 1, %r0, %r13
	.word 0xe657e030  ! 567: LDSH_I	ldsh	[%r31 + 0x0030], %r19
splash_hpstate_80_340:
	.word 0x8198225c  ! 568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025c, %hpstate
	.word 0xe64fc000  ! 569: LDSB_R	ldsb	[%r31 + %r0], %r19
splash_lsu_80_341:
	set 0xd62258c8, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 570: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
fpinit_80_342:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 571: FDIVd	fdivd	%f0, %f4, %f8
splash_lsu_80_343:
	set 0x2284ef7a, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 572: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01971  ! 573: FqTOd	dis not found

	.word 0xd68008a0  ! 574: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_345)+56, 16, 16)) -> intp(4,1,3)
xir_80_345:
	.word 0xa9846b72  ! 575: WR_SET_SOFTINT_I	wr	%r17, 0x0b72, %set_softint
	.word 0xd677e054  ! 576: STX_I	stx	%r11, [%r31 + 0x0054]
jmptr_80_346:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 577: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x5346189e82fa0820, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_347:
	.word 0x39400001  ! 578: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 579: LDX_R	ldx	[%r31 + %r0], %r11
pmu_80_348:
	nop
	setx 0xfffff794fffff7ec, %g1, %g7
	.word 0xa3800007  ! 580: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f80325d  ! 581: SIR	sir	0x125d
	.word 0x83d02035  ! 582: Tcc_I	te	icc_or_xcc, %r0 + 53
DS_80_349:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 583: SAVE_R	save	%r31, %r0, %r31
pmu_80_350:
	nop
	setx 0xfffff936ffffff68, %g1, %g7
	.word 0xa3800007  ! 584: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_80_351:
	taddcctv %r2, 0x12d2, %r16
	.word 0xd607e034  ! 585: LDUW_I	lduw	[%r31 + 0x0034], %r11
	.word 0xc3e90033  ! 586: PREFETCHA_R	prefetcha	[%r4, %r19] 0x01, #one_read
	fbn,a,pn	%fcc0,  skip_80_352
	fbn,a,pn	%fcc0,  skip_80_352
.align 2048
skip_80_352:
	.word 0x39400001  ! 587: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	fbe,a,pn	%fcc0,  skip_80_353
	bvc,a	 skip_80_353
.align 128
skip_80_353:
	.word 0x9ba509c8  ! 588: FDIVd	fdivd	%f20, %f8, %f44
splash_hpstate_80_354:
	.word 0x81982d4f  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4f, %hpstate
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 590: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_80_355:
	setx 0x5a7b73ee35a9d094, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 591: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4c7e010  ! 592: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r18
	.word 0x8d903e33  ! 593: WRPR_PSTATE_I	wrpr	%r0, 0x1e33, %pstate
mondo_80_356:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d934014  ! 594: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
jmptr_80_357:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 595: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe4800b40  ! 596: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r18
jmptr_80_358:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 597: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_80_359:
	setx 0x44c74d3edafdd8ce, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 598: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_80_360:
	nop
	setx 0xfffffccbfffff580, %g1, %g7
	.word 0xa3800007  ! 599: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_361
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_361:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 600: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0xe4800be0  ! 601: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r18
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_362
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_362:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 602: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0x9f802d66  ! 603: SIR	sir	0x0d66
	.word 0xe53fe050  ! 604: STDF_I	std	%f18, [0x0050, %r31]
	.word 0xe537c000  ! 605: STQF_R	-	%f18, [%r0, %r31]
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 606: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe51fe030  ! 607: LDDF_I	ldd	[%r31, 0x0030], %f18
	.word 0x8d903f71  ! 608: WRPR_PSTATE_I	wrpr	%r0, 0x1f71, %pstate
jmptr_80_363:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 609: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc3ea8021  ! 610: PREFETCHA_R	prefetcha	[%r10, %r1] 0x01, #one_read
intveclr_80_364:
	setx 0x32acb5d8cda2a582, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 611: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_365:
	setx 0x1828284870f6384c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 612: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_80_366:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd920  ! 613: STDFA_R	stda	%f16, [%r0, %r31]
splash_cmpr_80_367:
	setx 0x831f3fc590e0c46c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 614: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe1bfe020  ! 615: STDFA_I	stda	%f16, [0x0020, %r31]
	.word 0xe25fe028  ! 616: LDX_I	ldx	[%r31 + 0x0028], %r17
	.word 0x9545c000  ! 617: RD_TICK_CMPR_REG	rd	%-, %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_368) + 32, 16, 16)) -> intp(0,0,6)
intvec_80_368:
	.word 0x39400001  ! 618: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda1fc000  ! 619: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xe187e0e0  ! 620: LDFA_I	lda	[%r31, 0x00e0], %f16
splash_tba_80_369:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 621: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x93454000  ! 622: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
tagged_80_370:
	tsubcctv %r9, 0x19a1, %r20
	.word 0xe007e08e  ! 623: LDUW_I	lduw	[%r31 + 0x008e], %r16
memptr_80_371:
	set 0x60540000, %r31
	.word 0x8584f57f  ! 624: WRCCR_I	wr	%r19, 0x157f, %ccr
mondo_80_372:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d94c00b  ! 625: WRPR_WSTATE_R	wrpr	%r19, %r11, %wstate
	.word 0x91d02033  ! 626: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_htba_80_373:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 627: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_374
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_374:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00b  ! 628: CASA_R	casa	[%r31] %asi, %r11, %r16
	.word 0x91454000  ! 629: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0x93a00163  ! 630: FABSq	dis not found

	.word 0xa1a409cc  ! 631: FDIVd	fdivd	%f16, %f12, %f16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 632: LDX_R	ldx	[%r31 + %r0], %r19
cwp_80_375:
    set user_data_start, %o7
	.word 0x93902002  ! 633: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x81510000  ! 635: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe6800b80  ! 636: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r19
	rd %pc, %r19
	add %r19, (ivw_80_376-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_376:
	.word 0x9192c007  ! 637: WRPR_PIL_R	wrpr	%r11, %r7, %pil
intveclr_80_377:
	setx 0x9229f54b3743f815, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 638: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 639: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_80_378:
	set 0xe4658189, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 640: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe68008a0  ! 641: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe627e054  ! 642: STW_I	stw	%r19, [%r31 + 0x0054]
	.word 0x91d02034  ! 643: Tcc_I	ta	icc_or_xcc, %r0 + 52
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_379
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_379:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 644: CASA_R	casa	[%r31] %asi, %r16, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_380) + 56, 16, 16)) -> intp(0,0,1)
intvec_80_380:
	.word 0x39400001  ! 645: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa784c010  ! 646: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r16, %-
mondo_80_382:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d948010  ! 647: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa169ea19  ! 648: SDIVX_I	sdivx	%r7, 0x0a19, %r16
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
	.word 0xa9414000  ! 649: RDPC	rd	%pc, %r20
	.word 0xd42fe08f  ! 650: STB_I	stb	%r10, [%r31 + 0x008f]
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 651: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6cb483  ! 652: SDIVX_I	sdivx	%r18, 0xfffff483, %r13
splash_lsu_80_386:
	set 0x2714d477, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 653: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	bgu  	 skip_80_387
	.word 0x93b204d1  ! 1: FCMPNE32	fcmpne32	%d8, %d48, %r9
.align 32
skip_80_387:
	.word 0x95a409d1  ! 654: FDIVd	fdivd	%f16, %f48, %f10
	.word 0x9745c000  ! 655: RD_TICK_CMPR_REG	rd	%-, %r11
splash_lsu_80_388:
	set 0xd6e284f2, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 656: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9b45c000  ! 657: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0x9884aa2e  ! 658: ADDcc_I	addcc 	%r18, 0x0a2e, %r12
debug_80_389:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_80_389:
	mov 0xfd9, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfc2c0  ! 659: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe8800a80  ! 660: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r20
jmptr_80_390:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 661: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_80_391:
	nop
	setx 0xffffffadfffff461, %g1, %g7
	.word 0xa3800007  ! 662: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa9540000  ! 663: RDPR_GL	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_80_392-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_392:
	.word 0x91918014  ! 664: WRPR_PIL_R	wrpr	%r6, %r20, %pil
splash_lsu_80_393:
	set 0xc238e750, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 665: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_80_394:
	nop
	setx 0xfffff186fffff4b2, %g1, %g7
	.word 0xa3800007  ! 666: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_395
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_395:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 667: CASA_R	casa	[%r31] %asi, %r12, %r13
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_396
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_396:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 668: CASA_R	casa	[%r31] %asi, %r12, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 669: LDX_R	ldx	[%r31 + %r0], %r13
splash_cmpr_80_397:
	setx 0x8fe1964d024d5996, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 670: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_80_398:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 671: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_399
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_399
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_399:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 672: RDPC	rd	%pc, %r10
    set 0x1db2, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b0c7e9  ! 673: PDISTN	fmean16	%d34, %d40, %d50
	.word 0xa5a0016b  ! 674: FABSq	dis not found

mondo_80_400:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d94000b  ! 675: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
	rd %pc, %r19
	add %r19, (ivw_80_401-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_401:
	.word 0x91948010  ! 676: WRPR_PIL_R	wrpr	%r18, %r16, %pil
mondo_80_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d94c014  ! 677: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
fpinit_80_403:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82678  ! 678: PREFETCHA_I	prefetcha	[%r0, + 0x0678] %asi, #one_read
    set 0xb50, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b0c7ea  ! 679: PDISTN	fmean16	%d34, %d10, %d40
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01963  ! 680: FqTOd	dis not found

cwp_80_405:
    set user_data_start, %o7
	.word 0x93902002  ! 681: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_406
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_406:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 682: CASA_R	casa	[%r31] %asi, %r5, %r17
splash_cmpr_80_407:
	setx 0x6bff6d37b025e0d3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 683: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_80_408:
	set 0x5aecbbf3, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 684: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 685: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xa5500000  ! 686: RDPR_TPC	rdpr	%tpc, %r18
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_409:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 687: RDPC	rd	%pc, %r10
	.word 0x9b480000  ! 688: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_410
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_410:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 689: CASA_R	casa	[%r31] %asi, %r5, %r18
fpinit_80_411:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 690: FCMPLE32	fcmple32	%d0, %d4, %r8
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_412
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_412:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 691: CASA_R	casa	[%r31] %asi, %r5, %r18
jmptr_80_413:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 692: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_80_414:
	nop
	setx 0xfffff942fffff688, %g1, %g7
	.word 0xa3800007  ! 693: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_80_415-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_415:
	.word 0x91934004  ! 694: WRPR_PIL_R	wrpr	%r13, %r4, %pil
splash_hpstate_80_416:
	.word 0x8198230d  ! 695: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030d, %hpstate
donret_80_417:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_417-donret_80_417-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009f478c | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x2c4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_417:
	.word 0xe4ffe0be  ! 696: SWAPA_I	swapa	%r18, [%r31 + 0x00be] %asi
debug_80_418:
	nop
	ta T_CHANGE_HPRIV
debug_iva_80_418:
	mov 0x464, %r20
	mov 0x10, %r19
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
	.word 0xc1bfe040  ! 697: STDFA_I	stda	%f0, [0x0040, %r31]
pmu_80_419:
	nop
	setx 0xfffffc31fffffe8a, %g1, %g7
	.word 0xa3800007  ! 698: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_80_420:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d948001  ! 699: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
	.word 0x9b540000  ! 700: RDPR_GL	rdpr	%-, %r13
DS_80_421:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe934af7e  ! 1: STQF_I	-	%f20, [0x0f7e, %r18]
	normalw
	.word 0x99458000  ! 701: RD_SOFTINT_REG	rd	%softint, %r12
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xab84b03b  ! 1: WR_CLEAR_SOFTINT_I	wr	%r18, 0x103b, %clear_softint
	.word 0x39400001  ! 2: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 3: LDX_R	ldx	[%r31 + %r0], %r18
intveclr_40_1:
	setx 0x850b702773ef2a56, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 4: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_40_2:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_40_2:
	mov 0xcb9, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd920  ! 5: STDFA_R	stda	%f0, [%r0, %r31]
splash_lsu_40_3:
	set 0xca638875, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 6: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_40_4:
	setx 0x165a612395d3e8d9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_40_5:
	setx 0x802782215607a891, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 8: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_40_6:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdf20  ! 9: STDFA_R	stda	%f16, [%r0, %r31]
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_7:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 10: RDPC	rd	%pc, %r19
intveclr_40_8:
	setx 0xd291fd5db71c355a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 11: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_9
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_9:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 12: RDPC	rd	%pc, %r17
	.word 0xe81fc000  ! 13: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0xa9a509ca  ! 14: FDIVd	fdivd	%f20, %f10, %f20
	.word 0x9f8033ca  ! 15: SIR	sir	0x13ca
	.word 0xe69fd100  ! 16: LDDA_R	ldda	[%r31, %r0] 0x88, %r19
	setx 0xe5b4bdebbd972597, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_11:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_40_12:
	setx 0xb1ef75bc5dab36d9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 18: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_13
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_13:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 19: CASA_R	casa	[%r31] %asi, %r16, %r19
	.word 0xab840012  ! 20: WR_CLEAR_SOFTINT_R	wr	%r16, %r18, %clear_softint
	.word 0x95a009a5  ! 21: FDIVs	fdivs	%f0, %f5, %f10
intveclr_40_14:
	setx 0x692b37901b0308fc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 22: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 23: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_40_15:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d950005  ! 24: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
jmptr_40_16:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 25: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_40_17:
	nop
	setx 0xfffff92efffff83b, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd46fe096  ! 27: LDSTUB_I	ldstub	%r10, [%r31 + 0x0096]
	.word 0x91d02032  ! 28: Tcc_I	ta	icc_or_xcc, %r0 + 50
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 29: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_40_18:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe040  ! 30: STDFA_I	stda	%f16, [0x0040, %r31]
	setx 0xc9b8e6201a5d4fe7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_19:
	.word 0x39400001  ! 31: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfdc00  ! 32: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x91d02032  ! 33: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x95a349cb  ! 34: FDIVd	fdivd	%f44, %f42, %f10
splash_cmpr_40_20:
	setx 0xd18f2f3d13f4eb8b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 35: WR_STICK_REG_R	wr	%r0, %r1, %-
jmptr_40_21:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 36: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_22:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 37: CASA_R	casa	[%r31] %asi, %r17, %r17
splash_hpstate_40_23:
	.word 0x81982a04  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a04, %hpstate
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_24:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 39: CASA_R	casa	[%r31] %asi, %r17, %r17
mondo_40_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d92c001  ! 40: WRPR_WSTATE_R	wrpr	%r11, %r1, %wstate
	.word 0xe257c000  ! 41: LDSH_R	ldsh	[%r31 + %r0], %r17
splash_cmpr_40_26:
	setx 0x4b1b0995551189b4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 42: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe33fc000  ! 43: STDF_R	std	%f17, [%r0, %r31]
	.word 0xab852105  ! 44: WR_CLEAR_SOFTINT_I	wr	%r20, 0x0105, %clear_softint
splash_hpstate_40_27:
	.word 0x81982237  ! 45: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0237, %hpstate
change_to_randtl_40_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_28:
	.word 0x8f902000  ! 46: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_40_29:
	setx 0x43b71b596d16c78a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 47: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_30:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e008  ! 48: CASA_R	casa	[%r31] %asi, %r8, %r17
intveclr_40_31:
	setx 0xc86672e6a78c5b77, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 49: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_32) + 24, 16, 16)) -> intp(0,0,3)
intvec_40_32:
	.word 0x39400001  ! 50: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 51: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802e6d  ! 52: SIR	sir	0x0e6d
	.word 0x87acca51  ! 53: FCMPd	fcmpd	%fcc<n>, %f50, %f48
	.word 0x91a1c9ad  ! 54: FDIVs	fdivs	%f7, %f13, %f8
	.word 0x29800001  ! 55: FBL	fbl,a	<label_0x1>
	.word 0x9f802de0  ! 56: SIR	sir	0x0de0
intveclr_40_35:
	setx 0x04a529de06ab9a56, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 57: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_40_36:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 58: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
memptr_40_37:
	set 0x60340000, %r31
	.word 0x8584e698  ! 59: WRCCR_I	wr	%r19, 0x0698, %ccr
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_38:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 60: RDPC	rd	%pc, %r13
	.word 0xe44fc000  ! 61: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe537c000  ! 62: STQF_R	-	%f18, [%r0, %r31]
mondo_40_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d948006  ! 63: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
	.word 0xe46fe064  ! 64: LDSTUB_I	ldstub	%r18, [%r31 + 0x0064]
jmptr_40_40:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 65: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01971  ! 66: FqTOd	dis not found

	.word 0xd8800c40  ! 67: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r12
	.word 0x9f80342b  ! 68: SIR	sir	0x142b
intveclr_40_42:
	setx 0x7cc1fd2e2456994d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_43:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e007  ! 70: CASA_R	casa	[%r31] %asi, %r7, %r12
splash_lsu_40_44:
	set 0x7301bcee, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 71: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_40_45:
	nop
	setx 0xfffff857fffffa36, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_40_46:
	setx 0x1813d5bbb4ffd733, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_40_47-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_47:
	.word 0x9192c003  ! 74: WRPR_PIL_R	wrpr	%r11, %r3, %pil
	.word 0x29800001  ! 75: FBL	fbl,a	<label_0x1>
	.word 0xc36ca53f  ! 76: PREFETCH_I	prefetch	[%r18 + 0x053f], #one_read
mondo_40_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d944013  ! 77: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
	.word 0x95a0c9cb  ! 78: FDIVd	fdivd	%f34, %f42, %f10
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_51
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_51
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_51:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 79: RDPC	rd	%pc, %r12
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_52:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e004  ! 80: CASA_R	casa	[%r31] %asi, %r4, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_53)+32, 16, 16)) -> intp(4,1,3)
xir_40_53:
	.word 0xa9833bd6  ! 81: WR_SET_SOFTINT_I	wr	%r12, 0x1bd6, %set_softint
	.word 0xe8d7e020  ! 82: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r20
	.word 0x3e800001  ! 83: BVC	bvc,a	<label_0x1>
	.word 0xe937c000  ! 84: STQF_R	-	%f20, [%r0, %r31]
	.word 0x97454000  ! 85: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0xda47e008  ! 86: LDSW_I	ldsw	[%r31 + 0x0008], %r13
pmu_40_54:
	nop
	setx 0xfffff7dafffff5a0, %g1, %g7
	.word 0xa3800007  ! 87: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f802ea2  ! 88: SIR	sir	0x0ea2
	setx 0x0228cf0c1d895ec3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_55:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_56:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e004  ! 90: CASA_R	casa	[%r31] %asi, %r4, %r13
mondo_40_57:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d924009  ! 91: WRPR_WSTATE_R	wrpr	%r9, %r9, %wstate
splash_hpstate_40_58:
	.word 0x81982a15  ! 92: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a15, %hpstate
	.word 0xda9fd160  ! 93: LDDA_R	ldda	[%r31, %r0] 0x8b, %r13
	.word 0xa9a00170  ! 94: FABSq	dis not found

	.word 0xd26fe0a5  ! 95: LDSTUB_I	ldstub	%r9, [%r31 + 0x00a5]
	setx 0x5b5941d230b99f73, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_59:
	.word 0x39400001  ! 96: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd26fe04d  ! 97: LDSTUB_I	ldstub	%r9, [%r31 + 0x004d]
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 98: Tcc_R	ta	icc_or_xcc, %r0 + %r30
fpinit_40_60:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 99: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0x87a8ca49  ! 100: FCMPd	fcmpd	%fcc<n>, %f34, %f40
DS_40_61:
	.word 0xa5a4c9c3  ! 1: FDIVd	fdivd	%f50, %f34, %f18
	pdist %f24, %f10, %f18
	.word 0x99b34302  ! 101: ALIGNADDRESS	alignaddr	%r13, %r2, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a0196b  ! 102: FqTOd	dis not found

pmu_40_63:
	nop
	setx 0xfffff3a1fffffe4b, %g1, %g7
	.word 0xa3800007  ! 103: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_40_64:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbb5e15c2	! Random illegal ?
	.word 0xd111c001  ! 1: LDQF_R	-	[%r7, %r1], %f8
	.word 0x99a20828  ! 104: FADDs	fadds	%f8, %f8, %f12
	.word 0x99902005  ! 105: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xa7a409d2  ! 106: FDIVd	fdivd	%f16, %f18, %f50
	.word 0x9f80229e  ! 107: SIR	sir	0x029e
	.word 0xd827e0ae  ! 108: STW_I	stw	%r12, [%r31 + 0x00ae]
debug_40_65:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_40_65:
	mov 0x8b6, %r20
	mov 0x18, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdc00  ! 109: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd81fc000  ! 110: LDD_R	ldd	[%r31 + %r0], %r12
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_66:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 111: CASA_R	casa	[%r31] %asi, %r16, %r12
change_to_randtl_40_67:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_67:
	.word 0x8f902002  ! 112: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_40_68:
	setx 0xa1f12dba1d7b93fb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 113: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_40_69:
	setx 0x177bcfc061a1607d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 114: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_70
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_70:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 115: RDPC	rd	%pc, %r9
pmu_40_71:
	nop
	setx 0xfffff265fffffa74, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01974  ! 117: FqTOd	dis not found

	.word 0xe527e004  ! 118: STF_I	st	%f18, [0x0004, %r31]
mondo_40_73:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d94c011  ! 119: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_74:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 120: CASA_R	casa	[%r31] %asi, %r13, %r18
splash_lsu_40_75:
	set 0x32789821, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 121: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa982c011  ! 122: WR_SET_SOFTINT_R	wr	%r11, %r17, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_76) + 48, 16, 16)) -> intp(5,0,4)
intvec_40_76:
	.word 0x39400001  ! 123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_40_77:
	nop
	setx 0xfffff34cfffff234, %g1, %g7
	.word 0xa3800007  ! 124: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_40_78:
	nop
	setx 0xfffff2c1fffff50a, %g1, %g7
	.word 0xa3800007  ! 125: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_79
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_79:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 126: CASA_R	casa	[%r31] %asi, %r19, %r18
pmu_40_80:
	nop
	setx 0xfffff749fffff7ec, %g1, %g7
	.word 0xa3800007  ! 127: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_40_81:
	set 0x5da4da87, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 128: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_40_82:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 129: RESTORE_R	restore	%r31, %r0, %r31
debug_40_83:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_40_83:
	mov 0xc49, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe187dc00  ! 130: LDFA_R	lda	[%r31, %r0], %f16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6ca600  ! 131: SDIVX_I	sdivx	%r18, 0x0600, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 132: LDX_R	ldx	[%r31 + %r0], %r16
change_to_randtl_40_85:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_85:
	.word 0x8f902000  ! 133: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_40_86:
	setx 0xd9addf26e2a80267, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 134: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7a509d0  ! 135: FDIVd	fdivd	%f20, %f16, %f50
cwp_40_87:
    set user_data_start, %o7
	.word 0x93902002  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x26700001  ! 137: BPL	<illegal instruction>
	.word 0xd69fe008  ! 138: LDDA_I	ldda	[%r31, + 0x0008] %asi, %r11
mondo_40_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d900010  ! 139: WRPR_WSTATE_R	wrpr	%r0, %r16, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96cad90  ! 140: SDIVX_I	sdivx	%r18, 0x0d90, %r20
	.word 0xc1bfe020  ! 141: STDFA_I	stda	%f0, [0x0020, %r31]
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_90:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e004  ! 142: CASA_R	casa	[%r31] %asi, %r4, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01960  ! 143: FqTOd	dis not found

	.word 0xd41fe010  ! 144: LDD_I	ldd	[%r31 + 0x0010], %r10
splash_tba_40_92:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 145: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa3a009c9  ! 146: FDIVd	fdivd	%f0, %f40, %f48
	.word 0xa784000c  ! 147: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r12, %-
	.word 0xe187e0a0  ! 148: LDFA_I	lda	[%r31, 0x00a0], %f16
	.word 0xd0800bc0  ! 149: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r8
	.word 0x91454000  ! 150: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
pmu_40_95:
	nop
	setx 0xfffff07afffff024, %g1, %g7
	.word 0xa3800007  ! 151: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa9a489eb  ! 152: FDIVq	dis not found

splash_lsu_40_96:
	set 0xc7a4eb56, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 153: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_97:
	setx 0xd935e5ccb1d2a115, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 154: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab84c012  ! 155: WR_CLEAR_SOFTINT_R	wr	%r19, %r18, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_98) + 0, 16, 16)) -> intp(2,0,20)
intvec_40_98:
	.word 0x39400001  ! 156: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 157: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_99
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_99:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e007  ! 159: CASA_R	casa	[%r31] %asi, %r7, %r18
	.word 0xa7a089d1  ! 160: FDIVd	fdivd	%f2, %f48, %f50
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_100) + 16, 16, 16)) -> intp(6,0,21)
intvec_40_100:
	.word 0x39400001  ! 161: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5454000  ! 162: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0x81460000  ! 163: RD_STICK_REG	stbar
	.word 0xa1b40484  ! 164: FCMPLE32	fcmple32	%d16, %d4, %r16
mondo_40_101:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d944002  ! 165: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_102
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_102:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 166: RDPC	rd	%pc, %r8
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_103:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 167: CASA_R	casa	[%r31] %asi, %r6, %r9
	rd %pc, %r19
	add %r19, (ivw_40_104-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_104:
	.word 0x91948001  ! 168: WRPR_PIL_R	wrpr	%r18, %r1, %pil
	.word 0xa7830006  ! 169: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r6, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_106)+16, 16, 16)) -> intp(4,1,3)
xir_40_106:
	.word 0xa984ef84  ! 170: WR_SET_SOFTINT_I	wr	%r19, 0x0f84, %set_softint
	.word 0xd327c000  ! 171: STF_R	st	%f9, [%r0, %r31]
	.word 0xd28008a0  ! 172: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 173: LDX_R	ldx	[%r31 + %r0], %r9
	rd %pc, %r19
	add %r19, (ivw_40_107-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_107:
	.word 0x91920007  ! 174: WRPR_PIL_R	wrpr	%r8, %r7, %pil
	.word 0xd28008a0  ! 175: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_lsu_40_108:
	set 0x3ddb9943, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 176: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_109:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 177: CASA_R	casa	[%r31] %asi, %r6, %r9
pmu_40_110:
	nop
	setx 0xfffffdb1fffffda9, %g1, %g7
	.word 0xa3800007  ! 178: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_40_111:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xc187da00  ! 179: LDFA_R	lda	[%r31, %r0], %f0
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_112:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 180: CASA_R	casa	[%r31] %asi, %r6, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_113)+48, 16, 16)) -> intp(4,1,3)
xir_40_113:
	.word 0xa984a592  ! 181: WR_SET_SOFTINT_I	wr	%r18, 0x0592, %set_softint
memptr_40_114:
	set user_data_start, %r31
	.word 0x85833dfd  ! 182: WRCCR_I	wr	%r12, 0x1dfd, %ccr
mondo_40_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d90400c  ! 183: WRPR_WSTATE_R	wrpr	%r1, %r12, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_116) + 8, 16, 16)) -> intp(5,0,4)
intvec_40_116:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_40_117:
	set 0xc10c1e79, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_118:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 186: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0xd237e005  ! 187: STH_I	sth	%r9, [%r31 + 0x0005]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 188: LDX_R	ldx	[%r31 + %r0], %r9
jmptr_40_119:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 189: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd2800c40  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r9
	.word 0xc187e080  ! 191: LDFA_I	lda	[%r31, 0x0080], %f0
cwp_40_120:
    set user_data_start, %o7
	.word 0x93902000  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_40_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d93400c  ! 193: WRPR_WSTATE_R	wrpr	%r13, %r12, %wstate
mondo_40_122:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d94400d  ! 194: WRPR_WSTATE_R	wrpr	%r17, %r13, %wstate
DS_40_123:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa3b1c306  ! 195: ALIGNADDRESS	alignaddr	%r7, %r6, %r17
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 196: Tcc_R	te	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_124
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_124:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 197: RDPC	rd	%pc, %r13
	.word 0x9b50c000  ! 198: RDPR_TT	rdpr	%tt, %r13
	.word 0x29800001  ! 199: FBL	fbl,a	<label_0x1>
DS_40_126:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 200: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_40_127-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_127:
	.word 0x91928009  ! 201: WRPR_PIL_R	wrpr	%r10, %r9, %pil
mondo_40_128:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d90c013  ! 202: WRPR_WSTATE_R	wrpr	%r3, %r19, %wstate
splash_lsu_40_129:
	set 0x1820d61a, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 203: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_40_130:
	set 0xdb3fbc00, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 204: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 205: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_40_131:
	setx 0xb7ba694ff7daaf1d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 206: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_132
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_132:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e007  ! 207: CASA_R	casa	[%r31] %asi, %r7, %r13
splash_cmpr_40_133:
	setx 0x3bf79d1d425ceb89, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_40_134:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_134-donret_40_134), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0005c012 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x79c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_134:
	.word 0xdaffe004  ! 209: SWAPA_I	swapa	%r13, [%r31 + 0x0004] %asi
	.word 0xa7828005  ! 210: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r5, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_136) + 16, 16, 16)) -> intp(3,0,19)
intvec_40_136:
	.word 0x39400001  ! 211: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87ac8a54  ! 212: FCMPd	fcmpd	%fcc<n>, %f18, %f20
splash_cmpr_40_138:
	setx 0xdca53586a24fc82c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 213: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_40_139:
	set 0xc595a773, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 214: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903730  ! 215: WRPR_PSTATE_I	wrpr	%r0, 0x1730, %pstate
	.word 0xd8800be0  ! 216: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r12
	.word 0xd88fe028  ! 217: LDUBA_I	lduba	[%r31, + 0x0028] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_140
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_140:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 218: RDPC	rd	%pc, %r12
	.word 0x9f803923  ! 219: SIR	sir	0x1923
mondo_40_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d904011  ! 220: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
jmptr_40_142:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 221: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe46fe090  ! 222: LDSTUB_I	ldstub	%r18, [%r31 + 0x0090]
	.word 0xe48008a0  ! 223: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x9f80345c  ! 224: SIR	sir	0x145c
intveclr_40_143:
	setx 0x8df23e5f4bad8fb8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_144:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 226: CASA_R	casa	[%r31] %asi, %r0, %r18
splash_lsu_40_145:
	set 0x1fafe295, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 227: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_146
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_146
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_146:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 228: RDPC	rd	%pc, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 229: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe6800c80  ! 230: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r19
intveclr_40_147:
	setx 0x05ea96425606cf05, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 231: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd03ac013  ! 232: STD_R	std	%r8, [%r11 + %r19]
splash_cmpr_40_149:
	setx 0x1a1d95e156fed3f9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 233: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_150) + 40, 16, 16)) -> intp(5,0,31)
intvec_40_150:
	.word 0x39400001  ! 234: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_40_151:
	nop
	setx 0xfffff449fffffeba, %g1, %g7
	.word 0xa3800007  ! 235: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02033  ! 236: Tcc_I	ta	icc_or_xcc, %r0 + 51
intveclr_40_152:
	setx 0x2ea45bb975f33aec, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 237: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996b6323  ! 238: SDIVX_I	sdivx	%r13, 0x0323, %r12
pmu_40_154:
	nop
	setx 0xffffff43fffff7aa, %g1, %g7
	.word 0xa3800007  ! 239: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe2800c20  ! 240: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r17
	.word 0xa7b28484  ! 241: FCMPLE32	fcmple32	%d10, %d4, %r19
	.word 0xd727c000  ! 242: STF_R	st	%f11, [%r0, %r31]
	.word 0xe187e0a0  ! 243: LDFA_I	lda	[%r31, 0x00a0], %f16
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_155:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r11
	.word 0x99902000  ! 245: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
DS_40_156:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd1343979  ! 1: STQF_I	-	%f8, [0x1979, %r16]
	normalw
	.word 0xa5458000  ! 246: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0xa1a509a9  ! 247: FDIVs	fdivs	%f20, %f9, %f16
	.word 0x24c80001  ! 248: BRLEZ	brlez,a,pt	%r0,<label_0x80001>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 249: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd527c000  ! 250: STF_R	st	%f10, [%r0, %r31]
	.word 0x93d020b5  ! 251: Tcc_I	tne	icc_or_xcc, %r0 + 181
intveclr_40_158:
	setx 0xb591593419071545, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 252: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_159:
	setx 0xc138f39af9dd01c0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_40_160:
	setx 0xec803ebd271f40b1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 254: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803a8d  ! 255: SIR	sir	0x1a8d
intveclr_40_161:
	setx 0x362eda8f0f665d53, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 256: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_40_162:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9949504a	! Random illegal ?
	.word 0xa1a00550  ! 1: FSQRTd	fsqrt	
	.word 0x9ba1c826  ! 257: FADDs	fadds	%f7, %f6, %f13
	.word 0x9f803ba0  ! 258: SIR	sir	0x1ba0
	.word 0xe257c000  ! 259: LDSH_R	ldsh	[%r31 + %r0], %r17
splash_lsu_40_163:
	set 0x09e0bbd4, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 260: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe0394013  ! 261: STD_R	std	%r16, [%r5 + %r19]
	.word 0x81460000  ! 262: RD_STICK_REG	stbar
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996b2694  ! 263: SDIVX_I	sdivx	%r12, 0x0694, %r12
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_166:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 264: CASA_R	casa	[%r31] %asi, %r19, %r9
	.word 0xa7a109d0  ! 265: FDIVd	fdivd	%f4, %f16, %f50
intveclr_40_167:
	setx 0x3f8f174de8edecbe, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 266: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3450000  ! 267: RD_SET_SOFTINT	rd	%set_softint, %r17
splash_hpstate_40_168:
	.word 0x81982337  ! 268: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0337, %hpstate
splash_htba_40_169:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 269: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_40_170:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb300010  ! 1: STQF_R	-	%f13, [%r16, %r0]
	normalw
	.word 0xa3458000  ! 270: RD_SOFTINT_REG	rd	%softint, %r17
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_171
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_171:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 271: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0x91d02035  ! 272: Tcc_I	ta	icc_or_xcc, %r0 + 53
mondo_40_172:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d944014  ! 273: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0x93a00170  ! 274: FABSq	dis not found

	setx 0x95f24733752cd824, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_173:
	.word 0x39400001  ! 275: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_40_174:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_174-donret_40_174), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004de313 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x857, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_174:
	.word 0xe6ffe094  ! 276: SWAPA_I	swapa	%r19, [%r31 + 0x0094] %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01964  ! 277: FqTOd	dis not found

splash_cmpr_40_176:
	setx 0xa0f85b2cd3832ef7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_40_177:
	setx 0x4ff79557ea79f1b7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 279: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 280: LDX_R	ldx	[%r31 + %r0], %r18
fpinit_40_178:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82bf0  ! 281: PREFETCHA_I	prefetcha	[%r0, + 0x0bf0] %asi, #one_read
	.word 0xe4800b20  ! 282: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r18
	.word 0x91d02034  ! 283: Tcc_I	ta	icc_or_xcc, %r0 + 52
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_179
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_179:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 284: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0x93a109a0  ! 285: FDIVs	fdivs	%f4, %f0, %f9
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_180) + 40, 16, 16)) -> intp(4,0,29)
intvec_40_180:
	.word 0x39400001  ! 286: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97450000  ! 287: RD_SET_SOFTINT	rd	%set_softint, %r11
fpinit_40_181:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 288: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xe28fe020  ! 289: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_182
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_182:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 290: RDPC	rd	%pc, %r8
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 291: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0x9f8022a4  ! 292: SIR	sir	0x02a4
splash_cmpr_40_184:
	setx 0xe12ab0a0ff961561, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 293: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_40_185:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_185-donret_40_185-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008e714e | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_185:
	.word 0xd6ffe024  ! 294: SWAPA_I	swapa	%r11, [%r31 + 0x0024] %asi
	.word 0xd737c000  ! 295: STQF_R	-	%f11, [%r0, %r31]
	.word 0xd727e09f  ! 296: STF_I	st	%f11, [0x009f, %r31]
	.word 0xd66fe093  ! 297: LDSTUB_I	ldstub	%r11, [%r31 + 0x0093]
splash_lsu_40_186:
	set 0xdbc439d2, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc187e040  ! 299: LDFA_I	lda	[%r31, 0x0040], %f0
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 300: LDX_R	ldx	[%r31 + %r0], %r11
intveclr_40_187:
	setx 0x6f6ba1a3292dc30e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_40_188:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_40_188:
	mov 0xf59, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe187d960  ! 302: LDFA_R	lda	[%r31, %r0], %f16
	setx 0xac016ebc9c75d7dc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_189:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9034e9  ! 304: WRPR_PSTATE_I	wrpr	%r0, 0x14e9, %pstate
DS_40_190:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe5303055  ! 1: STQF_I	-	%f18, [0x1055, %r0]
	normalw
	.word 0xa3458000  ! 305: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0xe65fe020  ! 306: LDX_I	ldx	[%r31 + 0x0020], %r19
	.word 0xe6bfe0fc  ! 307: STDA_I	stda	%r19, [%r31 + 0x00fc] %asi
pmu_40_191:
	nop
	setx 0xfffff250fffff3c0, %g1, %g7
	.word 0xa3800007  ! 308: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe727e07c  ! 309: STF_I	st	%f19, [0x007c, %r31]
pmu_40_192:
	nop
	setx 0xfffff03bfffff29e, %g1, %g7
	.word 0xa3800007  ! 310: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68008a0  ! 311: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
pmu_40_193:
	nop
	setx 0xfffffb2efffff208, %g1, %g7
	.word 0xa3800007  ! 312: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_40_194-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_194:
	.word 0x91904002  ! 313: WRPR_PIL_R	wrpr	%r1, %r2, %pil
mondo_40_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d94800a  ! 314: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
	.word 0xa984c007  ! 315: WR_SET_SOFTINT_R	wr	%r19, %r7, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_196) + 56, 16, 16)) -> intp(5,0,18)
intvec_40_196:
	.word 0x39400001  ! 316: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_197
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_197:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 317: RDPC	rd	%pc, %r11
mondo_40_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d940010  ! 318: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
fpinit_40_199:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 319: FDIVs	fdivs	%f0, %f4, %f8
intveclr_40_200:
	setx 0xbf35bde83d940d2c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 320: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3a00160  ! 321: FABSq	dis not found

intveclr_40_201:
	setx 0x2ca80b6112d01bc4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_202) + 40, 16, 16)) -> intp(6,0,10)
intvec_40_202:
	.word 0x39400001  ! 323: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_203:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 324: RDPC	rd	%pc, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_204) + 48, 16, 16)) -> intp(2,0,3)
intvec_40_204:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_205:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 326: RDPC	rd	%pc, %r9
	.word 0x39400001  ! 327: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xdac7e018  ! 328: LDSWA_I	ldswa	[%r31, + 0x0018] %asi, %r13
	.word 0x91d02032  ! 329: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xc187df20  ! 330: LDFA_R	lda	[%r31, %r0], %f0
	.word 0x91d020b4  ! 331: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xda800b00  ! 332: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r13
	.word 0x95a349d2  ! 333: FDIVd	fdivd	%f44, %f18, %f10
	.word 0xa1b304c7  ! 334: FCMPNE32	fcmpne32	%d12, %d38, %r16
intveclr_40_209:
	setx 0x8acb63b9e4974355, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 335: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_210
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_210
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_210:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 336: RDPC	rd	%pc, %r10
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_211
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_211:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 337: CASA_R	casa	[%r31] %asi, %r19, %r11
pmu_40_212:
	nop
	setx 0xfffff8a6fffff501, %g1, %g7
	.word 0xa3800007  ! 338: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87ac4a4c  ! 339: FCMPd	fcmpd	%fcc<n>, %f48, %f12
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_213
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_213:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 340: CASA_R	casa	[%r31] %asi, %r18, %r16
intveclr_40_214:
	setx 0x50f2a664a0c78ecd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 341: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_215
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_215:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 342: CASA_R	casa	[%r31] %asi, %r18, %r16
	.word 0xe08008a0  ! 343: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_40_216:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d950010  ! 344: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
DS_40_217:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 345: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_218:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 346: RDPC	rd	%pc, %r20
mondo_40_219:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d928007  ! 347: WRPR_WSTATE_R	wrpr	%r10, %r7, %wstate
	.word 0x95500000  ! 348: RDPR_TPC	rdpr	%tpc, %r10
	.word 0xda6fe040  ! 349: LDSTUB_I	ldstub	%r13, [%r31 + 0x0040]
	.word 0xda57c000  ! 350: LDSH_R	ldsh	[%r31 + %r0], %r13
jmptr_40_220:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 351: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_40_221:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 352: FDIVd	fdivd	%f0, %f4, %f4
intveclr_40_222:
	setx 0x0299ba61446c073f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 353: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_223
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_223
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_223:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 354: RDPC	rd	%pc, %r19
	.word 0x9f803a92  ! 355: SIR	sir	0x1a92
donret_40_224:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_224-donret_40_224), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b28856 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x35f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_224:
	.word 0xe6ffe0e4  ! 356: SWAPA_I	swapa	%r19, [%r31 + 0x00e4] %asi
	.word 0x9f802b3b  ! 357: SIR	sir	0x0b3b
debug_40_225:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xc187de00  ! 358: LDFA_R	lda	[%r31, %r0], %f0
	rd %pc, %r19
	add %r19, (ivw_40_226-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_226:
	.word 0x9194400d  ! 359: WRPR_PIL_R	wrpr	%r17, %r13, %pil
	.word 0x93a049ca  ! 360: FDIVd	fdivd	%f32, %f10, %f40
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
	.word 0xd1e7e008  ! 361: CASA_R	casa	[%r31] %asi, %r8, %r8
	.word 0x99a00160  ! 362: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_228
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_228
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_228:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 363: RDPC	rd	%pc, %r17
	.word 0xd1e4c033  ! 364: CASA_I	casa	[%r19] 0x 1, %r19, %r8
	.word 0xd137e06d  ! 365: STQF_I	-	%f8, [0x006d, %r31]
donret_40_230:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_230-donret_40_230), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0089fa17 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x54c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_230:
	.word 0xd0ffe048  ! 366: SWAPA_I	swapa	%r8, [%r31 + 0x0048] %asi
change_to_randtl_40_231:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_231:
	.word 0x8f902001  ! 367: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xad846167  ! 368: WR_SOFTINT_REG_I	wr	%r17, 0x0167, %softint
	.word 0xa9844006  ! 369: WR_SET_SOFTINT_R	wr	%r17, %r6, %set_softint
	.word 0x8d902689  ! 370: WRPR_PSTATE_I	wrpr	%r0, 0x0689, %pstate
splash_lsu_40_232:
	set 0x11d3f57e, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 371: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd137e0df  ! 372: STQF_I	-	%f8, [0x00df, %r31]
	.word 0x87aa8a43  ! 373: FCMPd	fcmpd	%fcc<n>, %f10, %f34
memptr_40_234:
	set user_data_start, %r31
	.word 0x8580ed81  ! 374: WRCCR_I	wr	%r3, 0x0d81, %ccr
mondo_40_235:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d948004  ! 375: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
	.word 0xd337c000  ! 376: STQF_R	-	%f9, [%r0, %r31]
	.word 0xd317c000  ! 377: LDQF_R	-	[%r31, %r0], %f9
    set 0x11bd, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b1c7f0  ! 378: PDISTN	fmean16	%d38, %d16, %d8
	.word 0x9ba149c5  ! 379: FDIVd	fdivd	%f36, %f36, %f44
	setx 0x2fb5215927888426, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_237:
	.word 0x39400001  ! 380: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f8034fa  ! 381: SIR	sir	0x14fa
	.word 0xa9a0016a  ! 382: FABSq	dis not found

intveclr_40_238:
	setx 0xedfe9f3bd9c1cf31, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 383: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9a00171  ! 384: FABSq	dis not found

	.word 0x8d9036e5  ! 385: WRPR_PSTATE_I	wrpr	%r0, 0x16e5, %pstate
splash_htba_40_239:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 386: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_240
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_240:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 387: RDPC	rd	%pc, %r9
	.word 0xd05fe030  ! 388: LDX_I	ldx	[%r31 + 0x0030], %r8
splash_cmpr_40_241:
	setx 0xd950e1fae03c5e40, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b5  ! 390: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_lsu_40_242:
	set 0x4bef8efe, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 391: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_243
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_243
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_243:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 392: RDPC	rd	%pc, %r19
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_244
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_244:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e001  ! 393: CASA_R	casa	[%r31] %asi, %r1, %r9
debug_40_245:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_40_245:
	mov 0x939, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe187c2c0  ! 394: LDFA_R	lda	[%r31, %r0], %f16
	.word 0xd257c000  ! 395: LDSH_R	ldsh	[%r31 + %r0], %r9
	.word 0x9f8030a3  ! 396: SIR	sir	0x10a3
mondo_40_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d94c003  ! 397: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
	.word 0xd26fe0be  ! 398: LDSTUB_I	ldstub	%r9, [%r31 + 0x00be]
	.word 0xa1a00170  ! 399: FABSq	dis not found

	.word 0xe2bfe0c1  ! 400: STDA_I	stda	%r17, [%r31 + 0x00c1] %asi
	.word 0xe20fc000  ! 401: LDUB_R	ldub	[%r31 + %r0], %r17
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 402: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe317c000  ! 403: LDQF_R	-	[%r31, %r0], %f17
pmu_40_247:
	nop
	setx 0xfffffaa9fffffba4, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_40_248:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8307a  ! 405: PREFETCHA_I	prefetcha	[%r0, + 0xfffff07a] %asi, #one_read
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 406: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1702e29  ! 407: POPC_I	popc	0x0e29, %r16
	.word 0xa984800c  ! 408: WR_SET_SOFTINT_R	wr	%r18, %r12, %set_softint
	.word 0x29800001  ! 409: FBL	fbl,a	<label_0x1>
intveclr_40_250:
	setx 0x28fc14411250c75a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 410: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93a489c3  ! 411: FDIVd	fdivd	%f18, %f34, %f40
	rd %pc, %r19
	add %r19, (ivw_40_251-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_251:
	.word 0x9191800a  ! 412: WRPR_PIL_R	wrpr	%r6, %r10, %pil
	.word 0x9f803ea4  ! 413: SIR	sir	0x1ea4
    set 0x10f3, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b107e7  ! 414: PDISTN	fmean16	%d4, %d38, %d48
	rd %pc, %r19
	add %r19, (ivw_40_252-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_252:
	.word 0x9194c014  ! 415: WRPR_PIL_R	wrpr	%r19, %r20, %pil
	.word 0xe48fe000  ! 416: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
	.word 0x2a700001  ! 417: BPCS	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 418: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xc187df20  ! 420: LDFA_R	lda	[%r31, %r0], %f0
change_to_randtl_40_253:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_253:
	.word 0x8f902001  ! 421: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa9a00172  ! 422: FABSq	dis not found

splash_hpstate_40_254:
	.word 0x81982a8f  ! 423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8f, %hpstate
mondo_40_255:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d920007  ! 424: WRPR_WSTATE_R	wrpr	%r8, %r7, %wstate
	.word 0x9f8034d8  ! 425: SIR	sir	0x14d8
	.word 0x97454000  ! 426: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
intveclr_40_256:
	setx 0x0954e3ed66163781, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 427: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_257:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 428: RDPC	rd	%pc, %r11
	rd %pc, %r19
	add %r19, (ivw_40_258-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_258:
	.word 0x9190c014  ! 429: WRPR_PIL_R	wrpr	%r3, %r20, %pil
splash_cmpr_40_259:
	setx 0xc79f2e7aa64dff22, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 430: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7820012  ! 431: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r18, %-
	.word 0xe857c000  ! 432: LDSH_R	ldsh	[%r31 + %r0], %r20
	.word 0xa1540000  ! 433: RDPR_GL	<illegal instruction>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_261
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_261:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 434: CASA_R	casa	[%r31] %asi, %r16, %r9
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_262
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_262:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 435: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01974  ! 436: FqTOd	dis not found

	.word 0xa3a00172  ! 437: FABSq	dis not found

change_to_randtl_40_264:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_264:
	.word 0x8f902000  ! 438: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_40_265:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_265:
	.word 0x8f902001  ! 439: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_40_266:
	setx 0xb20cdaf2de1fc301, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93693a1c  ! 441: SDIVX_I	sdivx	%r4, 0xfffffa1c, %r9
splash_cmpr_40_268:
	setx 0x626bac5209d2326f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 442: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd127e0e4  ! 443: STF_I	st	%f8, [0x00e4, %r31]
	.word 0x91d020b3  ! 444: Tcc_I	ta	icc_or_xcc, %r0 + 179
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 445: Tcc_R	te	icc_or_xcc, %r0 + %r30
jmptr_40_269:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 446: JMPL_R	jmpl	%r27 + %r0, %r27
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
	.word 0x99414000  ! 447: RDPC	rd	%pc, %r12
	.word 0xd937e064  ! 448: STQF_I	-	%f12, [0x0064, %r31]
pmu_40_271:
	nop
	setx 0xfffffe24fffffee3, %g1, %g7
	.word 0xa3800007  ! 449: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_40_272:
	nop
	setx 0xfffff9dffffff5d0, %g1, %g7
	.word 0xa3800007  ! 450: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_htba_40_273:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 451: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd89fe038  ! 452: LDDA_I	ldda	[%r31, + 0x0038] %asi, %r12
	.word 0x8d903ffc  ! 453: WRPR_PSTATE_I	wrpr	%r0, 0x1ffc, %pstate
	.word 0x99902002  ! 454: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
pmu_40_274:
	nop
	setx 0xfffff3e0fffff86a, %g1, %g7
	.word 0xa3800007  ! 455: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_40_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d940013  ! 456: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
	.word 0xd88008a0  ! 457: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x87ab0a53  ! 458: FCMPd	fcmpd	%fcc<n>, %f12, %f50
splash_lsu_40_277:
	set 0xe9f6a955, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 459: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd31fc000  ! 460: LDDF_R	ldd	[%r31, %r0], %f9
	rd %pc, %r19
	add %r19, (ivw_40_278-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_278:
	.word 0x91944011  ! 461: WRPR_PIL_R	wrpr	%r17, %r17, %pil
	.word 0xd277e0f6  ! 462: STX_I	stx	%r9, [%r31 + 0x00f6]
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
	.word 0x99414000  ! 463: RDPC	rd	%pc, %r12
	.word 0x39400001  ! 464: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01960  ! 465: FqTOd	dis not found

splash_hpstate_40_282:
	.word 0x81982826  ! 466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0826, %hpstate
change_to_randtl_40_283:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_283:
	.word 0x8f902000  ! 467: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xda3fc000  ! 468: STD_R	std	%r13, [%r31 + %r0]
	.word 0x93d02032  ! 469: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x93d020b3  ! 470: Tcc_I	tne	icc_or_xcc, %r0 + 179
intveclr_40_284:
	setx 0x9924be61d42c3c9a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 471: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_40_285:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d948014  ! 472: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0xda77c000  ! 473: STX_R	stx	%r13, [%r31 + %r0]
pmu_40_286:
	nop
	setx 0xfffff17bfffff2b3, %g1, %g7
	.word 0xa3800007  ! 474: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xdacfe028  ! 475: LDSBA_I	ldsba	[%r31, + 0x0028] %asi, %r13
	.word 0x9f803e61  ! 476: SIR	sir	0x1e61
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 477: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xdb37e022  ! 478: STQF_I	-	%f13, [0x0022, %r31]
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_287
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_287
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_287:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 479: RDPC	rd	%pc, %r8
splash_cmpr_40_288:
	setx 0xb61becc61bb1c90c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 480: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97480000  ! 481: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	rd %pc, %r19
	add %r19, (ivw_40_289-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_289:
	.word 0x9194c003  ! 482: WRPR_PIL_R	wrpr	%r19, %r3, %pil
donret_40_290:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_290-donret_40_290), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006a29a4 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x49e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_290:
	.word 0xe8ffe0d8  ! 483: SWAPA_I	swapa	%r20, [%r31 + 0x00d8] %asi
	.word 0x24cc0001  ! 484: BRLEZ	brlez,a,pt	%r16,<label_0xc0001>
	.word 0xd497e008  ! 485: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r10
	.word 0xd51fc000  ! 486: LDDF_R	ldd	[%r31, %r0], %f10
	.word 0xa781000d  ! 487: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r13, %-
	.word 0xd527c000  ! 488: STF_R	st	%f10, [%r0, %r31]
splash_hpstate_40_293:
	.word 0x81982587  ! 489: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0587, %hpstate
	.word 0xd46fe01d  ! 490: LDSTUB_I	ldstub	%r10, [%r31 + 0x001d]
jmptr_40_294:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 491: JMPL_R	jmpl	%r27 + %r0, %r27
debug_40_295:
	nop
	ta T_CHANGE_HPRIV
debug_iva_40_295:
	mov 0x7e7, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+16), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0c0  ! 492: STDFA_I	stda	%f0, [0x00c0, %r31]
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_296
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_296:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 493: RDPC	rd	%pc, %r13
	.word 0x9f803c35  ! 494: SIR	sir	0x1c35
pmu_40_297:
	nop
	setx 0xfffff7d6fffff3b7, %g1, %g7
	.word 0xa3800007  ! 495: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_40_298:
	setx 0x9a05e09236587e1d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 496: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_40_299:
	setx 0x21ad73cd486c06d6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 497: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe80fe008  ! 498: LDUB_I	ldub	[%r31 + 0x0008], %r20
	.word 0xa1a00174  ! 499: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01968  ! 500: FqTOd	dis not found

splash_cmpr_40_301:
	setx 0x787c1cb8596cd03f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 501: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_40_302:
	setx 0x4aaac28129bed81b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 502: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9545c000  ! 503: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0xd537c000  ! 504: STQF_R	-	%f10, [%r0, %r31]
	.word 0x9f80327b  ! 505: SIR	sir	0x127b
	rd %pc, %r19
	add %r19, (ivw_40_303-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_303:
	.word 0x91950010  ! 506: WRPR_PIL_R	wrpr	%r20, %r16, %pil
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 507: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_40_304:
	setx 0xc04393869ae9efe7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 508: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_40_305:
	.word 0xa9a449d1  ! 1: FDIVd	fdivd	%f48, %f48, %f20
	pdist %f8, %f28, %f18
	.word 0xa1b0c308  ! 509: ALIGNADDRESS	alignaddr	%r3, %r8, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_306) + 16, 16, 16)) -> intp(2,0,5)
intvec_40_306:
	.word 0x39400001  ! 510: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_307:
	setx 0x611f2019bfbc7e66, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 511: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f8039ae  ! 512: SIR	sir	0x19ae
splash_lsu_40_308:
	set 0xb9d9ecea, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 513: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_40_309:
	setx 0x407fa68c742c0962, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 514: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 515: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda800aa0  ! 516: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r13
pmu_40_310:
	nop
	setx 0xfffff46cfffff5bb, %g1, %g7
	.word 0xa3800007  ! 517: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38700001  ! 518: BPGU	<illegal instruction>
	.word 0xa7848005  ! 519: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r5, %-
	.word 0xda6fe00c  ! 520: LDSTUB_I	ldstub	%r13, [%r31 + 0x000c]
    set 0x24ba, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b1c7ea  ! 521: PDISTN	fmean16	%d38, %d10, %d48
mondo_40_312:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d924009  ! 522: WRPR_WSTATE_R	wrpr	%r9, %r9, %wstate
donret_40_313:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_313-donret_40_313-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003d896b | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf56, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_313:
	.word 0xdaffe057  ! 523: SWAPA_I	swapa	%r13, [%r31 + 0x0057] %asi
	.word 0x9f803240  ! 524: SIR	sir	0x1240
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01970  ! 525: FqTOd	dis not found

	.word 0xdacfe030  ! 526: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
	.word 0x9ba489c4  ! 527: FDIVd	fdivd	%f18, %f4, %f44
mondo_40_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d948014  ! 528: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0xd41fe010  ! 529: LDD_I	ldd	[%r31 + 0x0010], %r10
	.word 0xd537e085  ! 530: STQF_I	-	%f10, [0x0085, %r31]
DS_40_316:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd5327b29  ! 1: STQF_I	-	%f10, [0x1b29, %r9]
	normalw
	.word 0x95458000  ! 531: RD_SOFTINT_REG	rd	%softint, %r10
cwp_40_317:
    set user_data_start, %o7
	.word 0x93902003  ! 532: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_cmpr_40_318:
	setx 0x6a7847085d878e17, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 533: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_40_319:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_319-donret_40_319-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005e8a0e | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x304, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_319:
	.word 0xdaffe064  ! 534: SWAPA_I	swapa	%r13, [%r31 + 0x0064] %asi
	.word 0xa5a0016d  ! 535: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 536: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xe28008a0  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
mondo_40_320:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d944007  ! 538: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
	.word 0xa7a189c5  ! 539: FDIVd	fdivd	%f6, %f36, %f50
jmptr_40_322:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 540: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe48008a0  ! 541: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
pmu_40_323:
	nop
	setx 0xfffff060fffff533, %g1, %g7
	.word 0xa3800007  ! 542: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_40_324:
	set 0x46e47433, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 543: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_40_325:
	nop
	ta T_CHANGE_HPRIV
debug_iva_40_325:
	mov 0x5bb, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+0), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd960  ! 544: STDFA_R	stda	%f16, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_326) + 24, 16, 16)) -> intp(0,0,3)
intvec_40_326:
	.word 0x39400001  ! 545: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_40_327:
	setx 0x7e66407e0d98b2db, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 546: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_40_328:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d940009  ! 547: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
	.word 0xa8d36008  ! 548: UMULcc_I	umulcc 	%r13, 0x0008, %r20
memptr_40_329:
	set 0x60340000, %r31
	.word 0x8581e59d  ! 549: WRCCR_I	wr	%r7, 0x059d, %ccr
	.word 0x9f803453  ! 550: SIR	sir	0x1453
memptr_40_330:
	set user_data_start, %r31
	.word 0x858024ba  ! 551: WRCCR_I	wr	%r0, 0x04ba, %ccr
	.word 0xe1bfdb60  ! 552: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x24c88001  ! 553: BRLEZ	brlez,a,pt	%r2,<label_0x88001>
splash_cmpr_40_332:
	setx 0x9583ae3e81771a50, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 554: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a049cd  ! 555: FDIVd	fdivd	%f32, %f44, %f48
jmptr_40_333:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 556: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc3ec4025  ! 557: PREFETCHA_R	prefetcha	[%r17, %r5] 0x01, #one_read
	.word 0xd4800c80  ! 558: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01970  ! 559: FqTOd	dis not found

	.word 0x95a289c7  ! 560: FDIVd	fdivd	%f10, %f38, %f10
debug_40_336:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd920  ! 561: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x83d020b5  ! 562: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xda1fc000  ! 563: LDD_R	ldd	[%r31 + %r0], %r13
mondo_40_337:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d94000b  ! 564: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_338
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_338
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_338:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 565: RDPC	rd	%pc, %r11
	.word 0x87aa4a53  ! 566: FCMPd	fcmpd	%fcc<n>, %f40, %f50
	.word 0xe657e000  ! 567: LDSH_I	ldsh	[%r31 + 0x0000], %r19
splash_hpstate_40_340:
	.word 0x81982015  ! 568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0015, %hpstate
	.word 0xe64fc000  ! 569: LDSB_R	ldsb	[%r31 + %r0], %r19
splash_lsu_40_341:
	set 0x11973857, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 570: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
fpinit_40_342:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 571: FDIVd	fdivd	%f0, %f4, %f4
splash_lsu_40_343:
	set 0xeff921a7, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 572: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01974  ! 573: FqTOd	dis not found

	.word 0xd68008a0  ! 574: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_345)+16, 16, 16)) -> intp(4,1,3)
xir_40_345:
	.word 0xa98436be  ! 575: WR_SET_SOFTINT_I	wr	%r16, 0x16be, %set_softint
	.word 0xd677e0d0  ! 576: STX_I	stx	%r11, [%r31 + 0x00d0]
jmptr_40_346:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 577: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xcc15202cacc0c9ed, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_347:
	.word 0x39400001  ! 578: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 579: LDX_R	ldx	[%r31 + %r0], %r11
pmu_40_348:
	nop
	setx 0xfffff0ccfffff2c0, %g1, %g7
	.word 0xa3800007  ! 580: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f8037cf  ! 581: SIR	sir	0x17cf
	.word 0x93d020b4  ! 582: Tcc_I	tne	icc_or_xcc, %r0 + 180
DS_40_349:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 583: SAVE_R	save	%r31, %r0, %r31
pmu_40_350:
	nop
	setx 0xfffff76bfffffd8b, %g1, %g7
	.word 0xa3800007  ! 584: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_40_351:
	taddcctv %r18, 0x1216, %r19
	.word 0xd607e00e  ! 585: LDUW_I	lduw	[%r31 + 0x000e], %r11
	.word 0x97a409a0  ! 586: FDIVs	fdivs	%f16, %f0, %f11
	.word 0xc36abb96  ! 587: PREFETCH_I	prefetch	[%r10 + 0xfffffb96], #one_read
	.word 0x24cb0001  ! 588: BRLEZ	brlez,a,pt	%r12,<label_0xb0001>
splash_hpstate_40_354:
	.word 0x8198202e  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x002e, %hpstate
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 590: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_40_355:
	setx 0x502ec958598c922d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 591: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4c7e018  ! 592: LDSWA_I	ldswa	[%r31, + 0x0018] %asi, %r18
	.word 0x8d9034ff  ! 593: WRPR_PSTATE_I	wrpr	%r0, 0x14ff, %pstate
mondo_40_356:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d924010  ! 594: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
jmptr_40_357:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 595: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe48008a0  ! 596: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
jmptr_40_358:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 597: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_40_359:
	setx 0xebf7d9c74e3f8159, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 598: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_40_360:
	nop
	setx 0xfffffce8fffff2c8, %g1, %g7
	.word 0xa3800007  ! 599: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_361
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_361:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 600: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0xe4800be0  ! 601: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r18
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_362
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_362:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 602: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0x9f8033d5  ! 603: SIR	sir	0x13d5
	.word 0xe53fe040  ! 604: STDF_I	std	%f18, [0x0040, %r31]
	.word 0xe537c000  ! 605: STQF_R	-	%f18, [%r0, %r31]
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 606: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe51fe008  ! 607: LDDF_I	ldd	[%r31, 0x0008], %f18
	.word 0x8d9023ac  ! 608: WRPR_PSTATE_I	wrpr	%r0, 0x03ac, %pstate
jmptr_40_363:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 609: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa1a449d2  ! 610: FDIVd	fdivd	%f48, %f18, %f16
intveclr_40_364:
	setx 0x775d2daec91f2a03, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 611: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_365:
	setx 0xd8ef149176bc4171, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 612: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_40_366:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0a0  ! 613: STDFA_I	stda	%f0, [0x00a0, %r31]
splash_cmpr_40_367:
	setx 0x5f745d79de59a867, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 614: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc1bfe060  ! 615: STDFA_I	stda	%f0, [0x0060, %r31]
	.word 0xe25fe008  ! 616: LDX_I	ldx	[%r31 + 0x0008], %r17
	.word 0xa745c000  ! 617: RD_TICK_CMPR_REG	rd	%-, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_368) + 32, 16, 16)) -> intp(0,0,30)
intvec_40_368:
	.word 0x39400001  ! 618: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda1fc000  ! 619: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xc187e060  ! 620: LDFA_I	lda	[%r31, 0x0060], %f0
splash_tba_40_369:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 621: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9b454000  ! 622: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
tagged_40_370:
	tsubcctv %r3, 0x18dc, %r13
	.word 0xe007e054  ! 623: LDUW_I	lduw	[%r31 + 0x0054], %r16
memptr_40_371:
	set 0x60740000, %r31
	.word 0x8584b7fe  ! 624: WRCCR_I	wr	%r18, 0x17fe, %ccr
mondo_40_372:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d948012  ! 625: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
	.word 0x93d020b2  ! 626: Tcc_I	tne	icc_or_xcc, %r0 + 178
splash_htba_40_373:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 627: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_374
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_374:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00b  ! 628: CASA_R	casa	[%r31] %asi, %r11, %r16
	.word 0x9b454000  ! 629: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	.word 0xa3a00173  ! 630: FABSq	dis not found

	.word 0x9ba4c9d2  ! 631: FDIVd	fdivd	%f50, %f18, %f44
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 632: LDX_R	ldx	[%r31 + %r0], %r19
cwp_40_375:
    set user_data_start, %o7
	.word 0x93902001  ! 633: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x81510000  ! 635: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe68008a0  ! 636: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	rd %pc, %r19
	add %r19, (ivw_40_376-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_376:
	.word 0x91924010  ! 637: WRPR_PIL_R	wrpr	%r9, %r16, %pil
intveclr_40_377:
	setx 0x52ffaa53e5158ccf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 638: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 639: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_40_378:
	set 0x8baef078, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 640: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe68008a0  ! 641: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe627e093  ! 642: STW_I	stw	%r19, [%r31 + 0x0093]
	.word 0x91d02032  ! 643: Tcc_I	ta	icc_or_xcc, %r0 + 50
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_379
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_379:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 644: CASA_R	casa	[%r31] %asi, %r16, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_380) + 0, 16, 16)) -> intp(4,0,15)
intvec_40_380:
	.word 0x39400001  ! 645: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7844012  ! 646: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r18, %-
mondo_40_382:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d944000  ! 647: WRPR_WSTATE_R	wrpr	%r17, %r0, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76ceca4  ! 648: SDIVX_I	sdivx	%r19, 0x0ca4, %r19
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
	.word 0x99414000  ! 649: RDPC	rd	%pc, %r12
	.word 0xd42fe00a  ! 650: STB_I	stb	%r10, [%r31 + 0x000a]
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 651: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996cff0b  ! 652: SDIVX_I	sdivx	%r19, 0xffffff0b, %r12
splash_lsu_40_386:
	set 0x7700345c, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 653: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87acca52  ! 654: FCMPd	fcmpd	%fcc<n>, %f50, %f18
	.word 0xa745c000  ! 655: RD_TICK_CMPR_REG	rd	%-, %r19
splash_lsu_40_388:
	set 0x924159d0, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 656: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa545c000  ! 657: RD_TICK_CMPR_REG	rd	%-, %r18
	.word 0x928324e1  ! 658: ADDcc_I	addcc 	%r12, 0x04e1, %r9
debug_40_389:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_40_389:
	mov 0xea3, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd960  ! 659: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe8800bc0  ! 660: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r20
jmptr_40_390:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 661: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_40_391:
	nop
	setx 0xfffff92efffff37c, %g1, %g7
	.word 0xa3800007  ! 662: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x95540000  ! 663: RDPR_GL	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_40_392-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_392:
	.word 0x91934006  ! 664: WRPR_PIL_R	wrpr	%r13, %r6, %pil
splash_lsu_40_393:
	set 0x4ec41918, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 665: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_40_394:
	nop
	setx 0xfffff10efffffdcf, %g1, %g7
	.word 0xa3800007  ! 666: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_395
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_395:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 667: CASA_R	casa	[%r31] %asi, %r12, %r13
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_396
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_396:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 668: CASA_R	casa	[%r31] %asi, %r12, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 669: LDX_R	ldx	[%r31 + %r0], %r13
splash_cmpr_40_397:
	setx 0x5170a33b95151838, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 670: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_40_398:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 671: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_399
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_399
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_399:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 672: RDPC	rd	%pc, %r12
    set 0x2b16, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b407f2  ! 673: PDISTN	fmean16	%d16, %d18, %d48
	.word 0xa5a00173  ! 674: FABSq	dis not found

mondo_40_400:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d928008  ! 675: WRPR_WSTATE_R	wrpr	%r10, %r8, %wstate
	rd %pc, %r19
	add %r19, (ivw_40_401-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_401:
	.word 0x9194c002  ! 676: WRPR_PIL_R	wrpr	%r19, %r2, %pil
mondo_40_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d944012  ! 677: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
fpinit_40_403:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 678: FDIVs	fdivs	%f0, %f4, %f4
    set 0x1114, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b007f0  ! 679: PDISTN	fmean16	%d0, %d16, %d16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01974  ! 680: FqTOd	dis not found

cwp_40_405:
    set user_data_start, %o7
	.word 0x93902002  ! 681: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_406
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_406:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 682: CASA_R	casa	[%r31] %asi, %r5, %r17
splash_cmpr_40_407:
	setx 0x8f5c8d46401a4253, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 683: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_40_408:
	set 0xc6763e0e, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 684: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 685: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x97500000  ! 686: RDPR_TPC	<illegal instruction>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_409:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 687: RDPC	rd	%pc, %r16
	.word 0xa1480000  ! 688: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_410
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_410:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 689: CASA_R	casa	[%r31] %asi, %r5, %r18
fpinit_40_411:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 690: FCMPLE32	fcmple32	%d0, %d4, %r4
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
	.word 0xe5e7e005  ! 691: CASA_R	casa	[%r31] %asi, %r5, %r18
jmptr_40_413:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 692: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_40_414:
	nop
	setx 0xfffffca5fffff0bb, %g1, %g7
	.word 0xa3800007  ! 693: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_40_415-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_415:
	.word 0x9190400d  ! 694: WRPR_PIL_R	wrpr	%r1, %r13, %pil
splash_hpstate_40_416:
	.word 0x81982185  ! 695: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0185, %hpstate
donret_40_417:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_417-donret_40_417-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005ed001 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x745, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_417:
	.word 0xe4ffe0cc  ! 696: SWAPA_I	swapa	%r18, [%r31 + 0x00cc] %asi
debug_40_418:
	nop
	ta T_CHANGE_HPRIV
debug_iva_40_418:
	mov 0x6fe, %r20
	mov 0xd, %r19
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
	.word 0xe187df20  ! 697: LDFA_R	lda	[%r31, %r0], %f16
pmu_40_419:
	nop
	setx 0xfffffe8afffff82b, %g1, %g7
	.word 0xa3800007  ! 698: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_40_420:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d944012  ! 699: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	.word 0x99540000  ! 700: RDPR_GL	rdpr	%-, %r12
DS_40_421:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe7342a9b  ! 1: STQF_I	-	%f19, [0x0a9b, %r16]
	normalw
	.word 0x99458000  ! 701: RD_SOFTINT_REG	rd	%softint, %r12
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xab8536b8  ! 1: WR_CLEAR_SOFTINT_I	wr	%r20, 0x16b8, %clear_softint
	brgez,pt  	%r0, skip_20_0
	.word 0x99a449c7  ! 1: FDIVd	fdivd	%f48, %f38, %f12
.align 1024
skip_20_0:
	.word 0xd0384006  ! 2: STD_R	std	%r8, [%r1 + %r6]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 3: LDX_R	ldx	[%r31 + %r0], %r18
intveclr_20_1:
	setx 0xfac5a94738db5e34, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 4: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_20_2:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_20_2:
	mov 0xa30, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfda00  ! 5: STDFA_R	stda	%f16, [%r0, %r31]
splash_lsu_20_3:
	set 0xcbd0b789, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 6: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_20_4:
	setx 0x6741304080bfedbf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_20_5:
	setx 0xd94920294a710f48, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 8: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_20_6:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe040  ! 9: STDFA_I	stda	%f0, [0x0040, %r31]
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_7:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 10: RDPC	rd	%pc, %r12
intveclr_20_8:
	setx 0xd6f57b3c3c05653f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 11: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_9
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_9:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 12: RDPC	rd	%pc, %r12
	.word 0xe81fc000  ! 13: LDD_R	ldd	[%r31 + %r0], %r20
unsupttte20_10:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87aa4a53  ! 14: FCMPd	fcmpd	%fcc<n>, %f40, %f50
	.word 0x9f802c10  ! 15: SIR	sir	0x0c10
	.word 0xe69fd920  ! 16: LDDA_R	ldda	[%r31, %r0] 0xc9, %r19
	setx 0x8dfc1b7953a3d22c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_11:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_20_12:
	setx 0x047fe35eff809f12, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 18: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_13
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_13:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 19: CASA_R	casa	[%r31] %asi, %r16, %r19
	.word 0xab804007  ! 20: WR_CLEAR_SOFTINT_R	wr	%r1, %r7, %clear_softint
	.word 0x97a489d3  ! 21: FDIVd	fdivd	%f18, %f50, %f42
intveclr_20_14:
	setx 0x445d142cc675aed0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 22: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 23: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_20_15:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d934011  ! 24: WRPR_WSTATE_R	wrpr	%r13, %r17, %wstate
jmptr_20_16:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 25: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_20_17:
	nop
	setx 0xfffff26afffff0d3, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd46fe09e  ! 27: LDSTUB_I	ldstub	%r10, [%r31 + 0x009e]
	.word 0x91d02032  ! 28: Tcc_I	ta	icc_or_xcc, %r0 + 50
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 29: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_20_18:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdb60  ! 30: STDFA_R	stda	%f0, [%r0, %r31]
	setx 0xdb7b1c2541c9452e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_19:
	.word 0x39400001  ! 31: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfde00  ! 32: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x91d02034  ! 33: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa7a349b0  ! 34: FDIVs	fdivs	%f13, %f16, %f19
splash_cmpr_20_20:
	setx 0xb4adce9f1bf155a4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 35: WR_STICK_REG_R	wr	%r0, %r1, %-
jmptr_20_21:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 36: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_22:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 37: CASA_R	casa	[%r31] %asi, %r17, %r17
splash_hpstate_20_23:
	.word 0x81982095  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0095, %hpstate
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_24:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 39: CASA_R	casa	[%r31] %asi, %r17, %r17
mondo_20_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d948009  ! 40: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
	.word 0xe257c000  ! 41: LDSH_R	ldsh	[%r31 + %r0], %r17
splash_cmpr_20_26:
	setx 0xd63e561f8b823df1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 42: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe33fc000  ! 43: STDF_R	std	%f17, [%r0, %r31]
	.word 0xab83789b  ! 44: WR_CLEAR_SOFTINT_I	wr	%r13, 0x189b, %clear_softint
splash_hpstate_20_27:
	.word 0x81982cc6  ! 45: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc6, %hpstate
change_to_randtl_20_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_28:
	.word 0x8f902001  ! 46: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_20_29:
	setx 0x01c23ae49f077f42, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 47: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
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
	.word 0xe3e7e008  ! 48: CASA_R	casa	[%r31] %asi, %r8, %r17
intveclr_20_31:
	setx 0xb15da36ba086bd29, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 49: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_32) + 48, 16, 16)) -> intp(5,0,8)
intvec_20_32:
	.word 0x39400001  ! 50: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 51: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f8034ed  ! 52: SIR	sir	0x14ed
unsupttte20_33:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa1b0c493  ! 53: FCMPLE32	fcmple32	%d34, %d50, %r16
	.word 0x87a88a43  ! 54: FCMPd	fcmpd	%fcc<n>, %f2, %f34
	.word 0x29800001  ! 55: FBL	fbl,a	<label_0x1>
	.word 0x9f80377b  ! 56: SIR	sir	0x177b
intveclr_20_35:
	setx 0xbda00b69449745ba, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 57: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_20_36:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 58: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
memptr_20_37:
	set 0x60140000, %r31
	.word 0x85816890  ! 59: WRCCR_I	wr	%r5, 0x0890, %ccr
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_38:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 60: RDPC	rd	%pc, %r18
	.word 0xe44fc000  ! 61: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe537c000  ! 62: STQF_R	-	%f18, [%r0, %r31]
mondo_20_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d928010  ! 63: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
	.word 0xe46fe00e  ! 64: LDSTUB_I	ldstub	%r18, [%r31 + 0x000e]
jmptr_20_40:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 65: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01968  ! 66: FqTOd	dis not found

	.word 0xd88008a0  ! 67: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x9f802e71  ! 68: SIR	sir	0x0e71
intveclr_20_42:
	setx 0xdba1b69b069c7da2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_43:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e007  ! 70: CASA_R	casa	[%r31] %asi, %r7, %r12
splash_lsu_20_44:
	set 0x81b021a1, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 71: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_20_45:
	nop
	setx 0xfffffb2affffff71, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_20_46:
	setx 0xf8322b09046b168b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_20_47-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_47:
	.word 0x91920010  ! 74: WRPR_PIL_R	wrpr	%r8, %r16, %pil
	.word 0x29800001  ! 75: FBL	fbl,a	<label_0x1>
	brgz,a,pn	%r9, skip_20_49
	bg  	 skip_20_49
.align 32
skip_20_49:
	.word 0x24cc4001  ! 76: BRLEZ	brlez,a,pt	%r17,<label_0xc4001>
mondo_20_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d950008  ! 77: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
	.word 0xa9a409d3  ! 78: FDIVd	fdivd	%f16, %f50, %f20
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_51
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_51
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_51:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 79: RDPC	rd	%pc, %r19
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_52:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e004  ! 80: CASA_R	casa	[%r31] %asi, %r4, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_53)+24, 16, 16)) -> intp(4,1,3)
xir_20_53:
	.word 0xa983355f  ! 81: WR_SET_SOFTINT_I	wr	%r12, 0x155f, %set_softint
	.word 0xe8d7e038  ! 82: LDSHA_I	ldsha	[%r31, + 0x0038] %asi, %r20
	.word 0x3e800001  ! 83: BVC	bvc,a	<label_0x1>
	.word 0xe937c000  ! 84: STQF_R	-	%f20, [%r0, %r31]
	.word 0xa3454000  ! 85: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0xda47e038  ! 86: LDSW_I	ldsw	[%r31 + 0x0038], %r13
pmu_20_54:
	nop
	setx 0xfffff485ffffffb8, %g1, %g7
	.word 0xa3800007  ! 87: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f803dae  ! 88: SIR	sir	0x1dae
	setx 0x713470407235436e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_55:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_56:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e004  ! 90: CASA_R	casa	[%r31] %asi, %r4, %r13
mondo_20_57:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d94c011  ! 91: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
splash_hpstate_20_58:
	.word 0x81982845  ! 92: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0845, %hpstate
	.word 0xda9fc2e0  ! 93: LDDA_R	ldda	[%r31, %r0] 0x17, %r13
	.word 0xa1a0016b  ! 94: FABSq	dis not found

	.word 0xd26fe0d7  ! 95: LDSTUB_I	ldstub	%r9, [%r31 + 0x00d7]
	setx 0xd80987aef6acbe60, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_59:
	.word 0x39400001  ! 96: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd26fe0c6  ! 97: LDSTUB_I	ldstub	%r9, [%r31 + 0x00c6]
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 98: Tcc_R	ta	icc_or_xcc, %r0 + %r30
fpinit_20_60:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 99: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0xa9a409d1  ! 100: FDIVd	fdivd	%f16, %f48, %f20
DS_20_61:
	.word 0x97a4c9d4  ! 1: FDIVd	fdivd	%f50, %f20, %f42
	pdist %f28, %f2, %f0
	.word 0xa3b4830b  ! 101: ALIGNADDRESS	alignaddr	%r18, %r11, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a0196b  ! 102: FqTOd	dis not found

pmu_20_63:
	nop
	setx 0xfffff9c1fffff8e9, %g1, %g7
	.word 0xa3800007  ! 103: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_20_64:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa950e77c	! Random illegal ?
	.word 0xd7150013  ! 1: LDQF_R	-	[%r20, %r19], %f11
	.word 0xa1a2c82a  ! 104: FADDs	fadds	%f11, %f10, %f16
	.word 0x99902003  ! 105: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xa3a449a3  ! 106: FDIVs	fdivs	%f17, %f3, %f17
	.word 0x9f802845  ! 107: SIR	sir	0x0845
	.word 0xd827e070  ! 108: STW_I	stw	%r12, [%r31 + 0x0070]
debug_20_65:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_20_65:
	mov 0xa38, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc187da00  ! 109: LDFA_R	lda	[%r31, %r0], %f0
	.word 0xd81fc000  ! 110: LDD_R	ldd	[%r31 + %r0], %r12
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_66:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 111: CASA_R	casa	[%r31] %asi, %r16, %r12
change_to_randtl_20_67:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_67:
	.word 0x8f902000  ! 112: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_20_68:
	setx 0xa6c759bdf1f26cf3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 113: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_20_69:
	setx 0x72243327f227d294, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 114: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_70
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_70:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 115: RDPC	rd	%pc, %r20
pmu_20_71:
	nop
	setx 0xfffff4c8fffff8b6, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a0196c  ! 117: FqTOd	dis not found

	.word 0xe527e090  ! 118: STF_I	st	%f18, [0x0090, %r31]
mondo_20_73:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d900011  ! 119: WRPR_WSTATE_R	wrpr	%r0, %r17, %wstate
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_74:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 120: CASA_R	casa	[%r31] %asi, %r13, %r18
splash_lsu_20_75:
	set 0x626d77eb, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 121: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9818014  ! 122: WR_SET_SOFTINT_R	wr	%r6, %r20, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_76) + 32, 16, 16)) -> intp(7,0,11)
intvec_20_76:
	.word 0x39400001  ! 123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_20_77:
	nop
	setx 0xfffffabbfffff6b8, %g1, %g7
	.word 0xa3800007  ! 124: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_20_78:
	nop
	setx 0xfffffdb5fffff952, %g1, %g7
	.word 0xa3800007  ! 125: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_79
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_79:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 126: CASA_R	casa	[%r31] %asi, %r19, %r18
pmu_20_80:
	nop
	setx 0xfffffaa7fffff8cd, %g1, %g7
	.word 0xa3800007  ! 127: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_20_81:
	set 0x9912826a, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 128: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_20_82:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 129: RESTORE_R	restore	%r31, %r0, %r31
debug_20_83:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_20_83:
	mov 0x82b, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc187df20  ! 130: LDFA_R	lda	[%r31, %r0], %f0
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16ce30b  ! 131: SDIVX_I	sdivx	%r19, 0x030b, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 132: LDX_R	ldx	[%r31 + %r0], %r16
change_to_randtl_20_85:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_85:
	.word 0x8f902002  ! 133: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_20_86:
	setx 0x9755a19d2f98412a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 134: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9ba409c9  ! 135: FDIVd	fdivd	%f16, %f40, %f44
cwp_20_87:
    set user_data_start, %o7
	.word 0x93902006  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x26700001  ! 137: BPL	<illegal instruction>
	.word 0xd69fe018  ! 138: LDDA_I	ldda	[%r31, + 0x0018] %asi, %r11
mondo_20_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d920011  ! 139: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916c60f3  ! 140: SDIVX_I	sdivx	%r17, 0x00f3, %r8
	.word 0xc1bfe0c0  ! 141: STDFA_I	stda	%f0, [0x00c0, %r31]
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_90:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e004  ! 142: CASA_R	casa	[%r31] %asi, %r4, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01972  ! 143: FqTOd	dis not found

	.word 0xd41fe010  ! 144: LDD_I	ldd	[%r31 + 0x0010], %r10
splash_tba_20_92:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 145: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	brgez,pn  	%r18, skip_20_93
	fbuge skip_20_93
.align 2048
skip_20_93:
	.word 0x24cc0001  ! 146: BRLEZ	brlez,a,pt	%r16,<label_0xc0001>
	.word 0xa7840012  ! 147: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r18, %-
	.word 0xc187e020  ! 148: LDFA_I	lda	[%r31, 0x0020], %f0
	.word 0xd0800c20  ! 149: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r8
	.word 0x91454000  ! 150: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
pmu_20_95:
	nop
	setx 0xffffff41fffff0fb, %g1, %g7
	.word 0xa3800007  ! 151: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9ba489f1  ! 152: FDIVq	dis not found

splash_lsu_20_96:
	set 0xdced271a, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 153: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_97:
	setx 0x8aeef5dad4ceb663, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 154: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab814000  ! 155: WR_CLEAR_SOFTINT_R	wr	%r5, %r0, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_98) + 16, 16, 16)) -> intp(6,0,30)
intvec_20_98:
	.word 0x39400001  ! 156: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 157: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4800b80  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r18
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_99
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_99:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e007  ! 159: CASA_R	casa	[%r31] %asi, %r7, %r18
	.word 0xa5a0c9ca  ! 160: FDIVd	fdivd	%f34, %f10, %f18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_100) + 48, 16, 16)) -> intp(5,0,10)
intvec_20_100:
	.word 0x39400001  ! 161: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5454000  ! 162: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0x81460000  ! 163: RD_STICK_REG	stbar
	.word 0x87ac4a51  ! 164: FCMPd	fcmpd	%fcc<n>, %f48, %f48
mondo_20_101:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d94c005  ! 165: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_102
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_102:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 166: RDPC	rd	%pc, %r18
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
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
	.word 0xd3e7e006  ! 167: CASA_R	casa	[%r31] %asi, %r6, %r9
	rd %pc, %r19
	add %r19, (ivw_20_104-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_104:
	.word 0x91904013  ! 168: WRPR_PIL_R	wrpr	%r1, %r19, %pil
	.word 0xa7840010  ! 169: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r16, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_106)+40, 16, 16)) -> intp(4,1,3)
xir_20_106:
	.word 0xa9817fe7  ! 170: WR_SET_SOFTINT_I	wr	%r5, 0x1fe7, %set_softint
	.word 0xd327c000  ! 171: STF_R	st	%f9, [%r0, %r31]
	.word 0xd28008a0  ! 172: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 173: LDX_R	ldx	[%r31 + %r0], %r9
	rd %pc, %r19
	add %r19, (ivw_20_107-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_107:
	.word 0x91950008  ! 174: WRPR_PIL_R	wrpr	%r20, %r8, %pil
	.word 0xd28008a0  ! 175: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_lsu_20_108:
	set 0x50dc2333, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 176: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_109:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 177: CASA_R	casa	[%r31] %asi, %r6, %r9
pmu_20_110:
	nop
	setx 0xfffff0c6fffff14f, %g1, %g7
	.word 0xa3800007  ! 178: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_20_111:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfc3e0  ! 179: STDFA_R	stda	%f16, [%r0, %r31]
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_112:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 180: CASA_R	casa	[%r31] %asi, %r6, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_113)+48, 16, 16)) -> intp(4,1,3)
xir_20_113:
	.word 0xa9846bd1  ! 181: WR_SET_SOFTINT_I	wr	%r17, 0x0bd1, %set_softint
memptr_20_114:
	set user_data_start, %r31
	.word 0x8581f3bc  ! 182: WRCCR_I	wr	%r7, 0x13bc, %ccr
mondo_20_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d918012  ! 183: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_116) + 0, 16, 16)) -> intp(1,0,13)
intvec_20_116:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_20_117:
	set 0x60828b82, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_118:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 186: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0xd237e0fa  ! 187: STH_I	sth	%r9, [%r31 + 0x00fa]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 188: LDX_R	ldx	[%r31 + %r0], %r9
jmptr_20_119:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 189: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd2800b80  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r9
	.word 0xe187e0e0  ! 191: LDFA_I	lda	[%r31, 0x00e0], %f16
cwp_20_120:
    set user_data_start, %o7
	.word 0x93902000  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_20_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d948013  ! 193: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
mondo_20_122:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d940008  ! 194: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
DS_20_123:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x93b14312  ! 195: ALIGNADDRESS	alignaddr	%r5, %r18, %r9
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 196: Tcc_R	te	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_124
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_124:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 197: RDPC	rd	%pc, %r17
	.word 0x9950c000  ! 198: RDPR_TT	rdpr	%tt, %r12
	.word 0x29800001  ! 199: FBL	fbl,a	<label_0x1>
DS_20_126:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 200: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_20_127-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_127:
	.word 0x9194c012  ! 201: WRPR_PIL_R	wrpr	%r19, %r18, %pil
mondo_20_128:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d904011  ! 202: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
splash_lsu_20_129:
	set 0x26983e98, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 203: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_20_130:
	set 0x963361eb, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 204: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 205: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_20_131:
	setx 0x6bf7cc239ee0f9f8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 206: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_132
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_132:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e007  ! 207: CASA_R	casa	[%r31] %asi, %r7, %r13
splash_cmpr_20_133:
	setx 0x1a756a4b3b4cc1a2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_20_134:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_134-donret_20_134), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001ede2d | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 15, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_134:
	.word 0xdaffe05a  ! 209: SWAPA_I	swapa	%r13, [%r31 + 0x005a] %asi
	.word 0xa7844004  ! 210: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r4, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_136) + 16, 16, 16)) -> intp(1,0,24)
intvec_20_136:
	.word 0x39400001  ! 211: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	bl,a	 skip_20_137
	bneg,a	 skip_20_137
.align 128
skip_20_137:
	.word 0x24cac001  ! 212: BRLEZ	brlez,a,pt	%r11,<label_0xac001>
splash_cmpr_20_138:
	setx 0x9148dcdb57cdf6fa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 213: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_20_139:
	set 0xfe9c7681, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 214: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9031b8  ! 215: WRPR_PSTATE_I	wrpr	%r0, 0x11b8, %pstate
	.word 0xd8800c60  ! 216: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r12
	.word 0xd88fe038  ! 217: LDUBA_I	lduba	[%r31, + 0x0038] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_140
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_140:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 218: RDPC	rd	%pc, %r10
	.word 0x9f802aee  ! 219: SIR	sir	0x0aee
mondo_20_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d920011  ! 220: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
jmptr_20_142:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 221: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe46fe06a  ! 222: LDSTUB_I	ldstub	%r18, [%r31 + 0x006a]
	.word 0xe4800b40  ! 223: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r18
	.word 0x9f802813  ! 224: SIR	sir	0x0813
intveclr_20_143:
	setx 0xf702a6f2b02a744f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_144:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 226: CASA_R	casa	[%r31] %asi, %r0, %r18
splash_lsu_20_145:
	set 0x317784b2, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 227: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_146
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_146
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_146:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 228: RDPC	rd	%pc, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 229: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe68008a0  ! 230: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
intveclr_20_147:
	setx 0x8c141fd47122fc90, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 231: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	fbne skip_20_148
	.word 0x91a2c9d2  ! 1: FDIVd	fdivd	%f42, %f18, %f8
.align 2048
skip_20_148:
	.word 0x91a409d4  ! 232: FDIVd	fdivd	%f16, %f20, %f8
splash_cmpr_20_149:
	setx 0x3d1804c86b95f7b8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 233: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_150) + 40, 16, 16)) -> intp(4,0,6)
intvec_20_150:
	.word 0x39400001  ! 234: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_20_151:
	nop
	setx 0xfffffaaafffff9fb, %g1, %g7
	.word 0xa3800007  ! 235: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02035  ! 236: Tcc_I	ta	icc_or_xcc, %r0 + 53
intveclr_20_152:
	setx 0x402b3505c33ca1c6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 237: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996b2967  ! 238: SDIVX_I	sdivx	%r12, 0x0967, %r12
pmu_20_154:
	nop
	setx 0xfffff4effffff79e, %g1, %g7
	.word 0xa3800007  ! 239: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe2800b00  ! 240: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r17
	.word 0x87aa8a45  ! 241: FCMPd	fcmpd	%fcc<n>, %f10, %f36
	.word 0xd727c000  ! 242: STF_R	st	%f11, [%r0, %r31]
	.word 0xe187e020  ! 243: LDFA_I	lda	[%r31, 0x0020], %f16
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_155:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r11
	.word 0x99902004  ! 245: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
DS_20_156:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe734affd  ! 1: STQF_I	-	%f19, [0x0ffd, %r18]
	normalw
	.word 0xa9458000  ! 246: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0xa9a449aa  ! 247: FDIVs	fdivs	%f17, %f10, %f20
	fbu,a,pn	%fcc0,  skip_20_157
	fblg skip_20_157
.align 32
skip_20_157:
	.word 0xe3e4c030  ! 248: CASA_I	casa	[%r19] 0x 1, %r16, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 249: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd527c000  ! 250: STF_R	st	%f10, [%r0, %r31]
	.word 0x91d020b3  ! 251: Tcc_I	ta	icc_or_xcc, %r0 + 179
intveclr_20_158:
	setx 0x8b7c8a25f86e9f86, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 252: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_159:
	setx 0x0826f2c767a5e3d1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_20_160:
	setx 0xd545c95a92dfff99, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 254: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803dfa  ! 255: SIR	sir	0x1dfa
intveclr_20_161:
	setx 0x3f4496cc94ad3356, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 256: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_20_162:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9140c7c3	! Random illegal ?
	.word 0xa1a0054a  ! 1: FSQRTd	fsqrt	
	.word 0xa1a40829  ! 257: FADDs	fadds	%f16, %f9, %f16
	.word 0x9f803f53  ! 258: SIR	sir	0x1f53
	.word 0xe257c000  ! 259: LDSH_R	ldsh	[%r31 + %r0], %r17
splash_lsu_20_163:
	set 0xd2239824, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 260: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	brgz,a,pn	%r10, skip_20_164
	fbe,a,pn	%fcc0,  skip_20_164
.align 2048
skip_20_164:
	.word 0xa3a409d3  ! 261: FDIVd	fdivd	%f16, %f50, %f48
	.word 0x81460000  ! 262: RD_STICK_REG	stbar
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa569b48b  ! 263: SDIVX_I	sdivx	%r6, 0xfffff48b, %r18
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_166:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 264: CASA_R	casa	[%r31] %asi, %r19, %r9
	.word 0xa3a409d2  ! 265: FDIVd	fdivd	%f16, %f18, %f48
intveclr_20_167:
	setx 0x36ef41c75e985d4a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 266: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3450000  ! 267: RD_SET_SOFTINT	rd	%set_softint, %r17
splash_hpstate_20_168:
	.word 0x81982a84  ! 268: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a84, %hpstate
splash_htba_20_169:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 269: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_20_170:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd731c010  ! 1: STQF_R	-	%f11, [%r16, %r7]
	normalw
	.word 0x97458000  ! 270: RD_SOFTINT_REG	rd	%softint, %r11
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_171
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_171:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 271: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0x91d02034  ! 272: Tcc_I	ta	icc_or_xcc, %r0 + 52
mondo_20_172:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d948014  ! 273: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0xa3a00172  ! 274: FABSq	dis not found

	setx 0xfeec081019f9a3a2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_173:
	.word 0x39400001  ! 275: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_20_174:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_174-donret_20_174), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d46695 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf9e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_174:
	.word 0xe6ffe053  ! 276: SWAPA_I	swapa	%r19, [%r31 + 0x0053] %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01971  ! 277: FqTOd	dis not found

splash_cmpr_20_176:
	setx 0x13773c3020f5ddac, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_20_177:
	setx 0xad656ca61db00040, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 279: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 280: LDX_R	ldx	[%r31 + %r0], %r18
fpinit_20_178:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 281: FDIVs	fdivs	%f0, %f4, %f8
	.word 0xe4800c40  ! 282: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r18
	.word 0x91d020b4  ! 283: Tcc_I	ta	icc_or_xcc, %r0 + 180
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_179
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_179:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 284: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0xa7a209aa  ! 285: FDIVs	fdivs	%f8, %f10, %f19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_180) + 48, 16, 16)) -> intp(7,0,14)
intvec_20_180:
	.word 0x39400001  ! 286: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93450000  ! 287: RD_SET_SOFTINT	rd	%set_softint, %r9
fpinit_20_181:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 288: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xe28fe010  ! 289: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_182
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_182:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 290: RDPC	rd	%pc, %r12
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 291: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0x9f802eac  ! 292: SIR	sir	0x0eac
splash_cmpr_20_184:
	setx 0xf601e0e1017fc038, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 293: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_20_185:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_185-donret_20_185-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009475a0 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x3d7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_185:
	.word 0xd6ffe0de  ! 294: SWAPA_I	swapa	%r11, [%r31 + 0x00de] %asi
	.word 0xd737c000  ! 295: STQF_R	-	%f11, [%r0, %r31]
	.word 0xd727e041  ! 296: STF_I	st	%f11, [0x0041, %r31]
	.word 0xd66fe086  ! 297: LDSTUB_I	ldstub	%r11, [%r31 + 0x0086]
splash_lsu_20_186:
	set 0xdfa5ffe8, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc187e0a0  ! 299: LDFA_I	lda	[%r31, 0x00a0], %f0
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 300: LDX_R	ldx	[%r31 + %r0], %r11
intveclr_20_187:
	setx 0x333f10c346b61fc2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_20_188:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_20_188:
	mov 0x9ea, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd960  ! 302: STDFA_R	stda	%f0, [%r0, %r31]
	setx 0xdf7e2422fa688dfd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_189:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90241d  ! 304: WRPR_PSTATE_I	wrpr	%r0, 0x041d, %pstate
DS_20_190:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd1342603  ! 1: STQF_I	-	%f8, [0x0603, %r16]
	normalw
	.word 0x93458000  ! 305: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xe65fe008  ! 306: LDX_I	ldx	[%r31 + 0x0008], %r19
	.word 0xe6bfe0f4  ! 307: STDA_I	stda	%r19, [%r31 + 0x00f4] %asi
pmu_20_191:
	nop
	setx 0xfffffb1dfffff3fe, %g1, %g7
	.word 0xa3800007  ! 308: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe727e0e8  ! 309: STF_I	st	%f19, [0x00e8, %r31]
pmu_20_192:
	nop
	setx 0xfffff4eefffff4f4, %g1, %g7
	.word 0xa3800007  ! 310: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe6800ae0  ! 311: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r19
pmu_20_193:
	nop
	setx 0xfffff57afffffdc1, %g1, %g7
	.word 0xa3800007  ! 312: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_20_194-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_194:
	.word 0x91910005  ! 313: WRPR_PIL_R	wrpr	%r4, %r5, %pil
mondo_20_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d94c00d  ! 314: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
	.word 0xa9840002  ! 315: WR_SET_SOFTINT_R	wr	%r16, %r2, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_196) + 16, 16, 16)) -> intp(2,0,16)
intvec_20_196:
	.word 0x39400001  ! 316: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_197
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_197:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 317: RDPC	rd	%pc, %r10
mondo_20_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d910012  ! 318: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
fpinit_20_199:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 319: FCMPLE32	fcmple32	%d0, %d4, %r6
intveclr_20_200:
	setx 0xf9d646357fc8a6b9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 320: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3a00163  ! 321: FABSq	dis not found

intveclr_20_201:
	setx 0x09205a1b51e244d5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_202) + 32, 16, 16)) -> intp(1,0,11)
intvec_20_202:
	.word 0x39400001  ! 323: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_203:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 324: RDPC	rd	%pc, %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_204) + 48, 16, 16)) -> intp(6,0,26)
intvec_20_204:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_205:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 326: RDPC	rd	%pc, %r9
	bvc  	 skip_20_206
	fbe,a,pn	%fcc0,  skip_20_206
.align 512
skip_20_206:
	.word 0xda390010  ! 327: STD_R	std	%r13, [%r4 + %r16]
	.word 0xdac7e038  ! 328: LDSWA_I	ldswa	[%r31, + 0x0038] %asi, %r13
	.word 0x91d020b4  ! 329: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xe187db60  ! 330: LDFA_R	lda	[%r31, %r0], %f16
	.word 0x91d02034  ! 331: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xda800b60  ! 332: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r13
	fbug skip_20_207
	bcc  	 skip_20_207
.align 1024
skip_20_207:
	.word 0x39400001  ! 333: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	brz,pn  	%r0, skip_20_208
	brlez,a,pn	%r6, skip_20_208
.align 32
skip_20_208:
	.word 0x39400001  ! 334: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_20_209:
	setx 0xb58fcae2d1d77f97, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 335: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_210
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_210
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_210:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 336: RDPC	rd	%pc, %r11
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_211
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_211:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 337: CASA_R	casa	[%r31] %asi, %r19, %r11
pmu_20_212:
	nop
	setx 0xfffff6e6fffff7f7, %g1, %g7
	.word 0xa3800007  ! 338: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91a209c6  ! 339: FDIVd	fdivd	%f8, %f6, %f8
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_213
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_213:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 340: CASA_R	casa	[%r31] %asi, %r18, %r16
intveclr_20_214:
	setx 0x356dbfbb128b0d64, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 341: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_215
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_215:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 342: CASA_R	casa	[%r31] %asi, %r18, %r16
	.word 0xe0800be0  ! 343: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r16
mondo_20_216:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d90c014  ! 344: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
DS_20_217:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 345: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_218:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 346: RDPC	rd	%pc, %r9
mondo_20_219:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d94c00d  ! 347: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
	.word 0x95500000  ! 348: RDPR_TPC	rdpr	%tpc, %r10
	.word 0xda6fe073  ! 349: LDSTUB_I	ldstub	%r13, [%r31 + 0x0073]
	.word 0xda57c000  ! 350: LDSH_R	ldsh	[%r31 + %r0], %r13
jmptr_20_220:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 351: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_20_221:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 352: FDIVs	fdivs	%f0, %f4, %f6
intveclr_20_222:
	setx 0x19a4bdc12e358d62, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 353: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_223
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_223
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_223:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 354: RDPC	rd	%pc, %r10
	.word 0x9f803fec  ! 355: SIR	sir	0x1fec
donret_20_224:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_224-donret_20_224), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c7cb0d | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x61f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_224:
	.word 0xe6ffe028  ! 356: SWAPA_I	swapa	%r19, [%r31 + 0x0028] %asi
	.word 0x9f803666  ! 357: SIR	sir	0x1666
debug_20_225:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xc187c3e0  ! 358: LDFA_R	lda	[%r31, %r0], %f0
	rd %pc, %r19
	add %r19, (ivw_20_226-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_226:
	.word 0x91918014  ! 359: WRPR_PIL_R	wrpr	%r6, %r20, %pil
	.word 0xa5a449cb  ! 360: FDIVd	fdivd	%f48, %f42, %f18
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_227:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e008  ! 361: CASA_R	casa	[%r31] %asi, %r8, %r8
	.word 0x99a0016d  ! 362: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_228
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_228
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_228:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 363: RDPC	rd	%pc, %r17
	fbn,a,pn	%fcc0,  skip_20_229
	.word 0xd43c0000  ! 1: STD_R	std	%r10, [%r16 + %r0]
.align 32
skip_20_229:
	.word 0x9bb044c8  ! 364: FCMPNE32	fcmpne32	%d32, %d8, %r13
	.word 0xd137e0e1  ! 365: STQF_I	-	%f8, [0x00e1, %r31]
donret_20_230:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_230-donret_20_230), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002d3ea6 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf05, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_230:
	.word 0xd0ffe03d  ! 366: SWAPA_I	swapa	%r8, [%r31 + 0x003d] %asi
change_to_randtl_20_231:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_231:
	.word 0x8f902000  ! 367: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xad80314b  ! 368: WR_SOFTINT_REG_I	wr	%r0, 0x114b, %softint
	.word 0xa980c012  ! 369: WR_SET_SOFTINT_R	wr	%r3, %r18, %set_softint
	.word 0x8d903fb8  ! 370: WRPR_PSTATE_I	wrpr	%r0, 0x1fb8, %pstate
splash_lsu_20_232:
	set 0x98cc3e2f, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 371: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd137e058  ! 372: STQF_I	-	%f8, [0x0058, %r31]
unsupttte20_233:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa5a449d0  ! 373: FDIVd	fdivd	%f48, %f16, %f18
memptr_20_234:
	set user_data_start, %r31
	.word 0x858537e4  ! 374: WRCCR_I	wr	%r20, 0x17e4, %ccr
mondo_20_235:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d920011  ! 375: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
	.word 0xd337c000  ! 376: STQF_R	-	%f9, [%r0, %r31]
	.word 0xd317c000  ! 377: LDQF_R	-	[%r31, %r0], %f9
    set 0x1b95, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b487ea  ! 378: PDISTN	fmean16	%d18, %d10, %d20
	fblg skip_20_236
	.word 0x87a8ca41  ! 1: FCMPd	fcmpd	%fcc<n>, %f34, %f32
.align 512
skip_20_236:
	.word 0xa1b204c0  ! 379: FCMPNE32	fcmpne32	%d8, %d0, %r16
	setx 0x682d772fbfdcad49, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_237:
	.word 0x39400001  ! 380: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f803469  ! 381: SIR	sir	0x1469
	.word 0xa3a00163  ! 382: FABSq	dis not found

intveclr_20_238:
	setx 0xd96c82855475e5c7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 383: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93a00163  ! 384: FABSq	dis not found

	.word 0x8d902e3d  ! 385: WRPR_PSTATE_I	wrpr	%r0, 0x0e3d, %pstate
splash_htba_20_239:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 386: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_240
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_240:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 387: RDPC	rd	%pc, %r13
	.word 0xd05fe000  ! 388: LDX_I	ldx	[%r31 + 0x0000], %r8
splash_cmpr_20_241:
	setx 0xc7101bcce3b12733, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d020b2  ! 390: Tcc_I	te	icc_or_xcc, %r0 + 178
splash_lsu_20_242:
	set 0x27c73d95, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 391: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_243
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_243
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_243:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 392: RDPC	rd	%pc, %r18
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_244
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_244:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e001  ! 393: CASA_R	casa	[%r31] %asi, %r1, %r9
debug_20_245:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_20_245:
	mov 0xecc, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdc00  ! 394: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd257c000  ! 395: LDSH_R	ldsh	[%r31 + %r0], %r9
	.word 0x9f802990  ! 396: SIR	sir	0x0990
mondo_20_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d928011  ! 397: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
	.word 0xd26fe080  ! 398: LDSTUB_I	ldstub	%r9, [%r31 + 0x0080]
	.word 0x97a00170  ! 399: FABSq	dis not found

	.word 0xe2bfe061  ! 400: STDA_I	stda	%r17, [%r31 + 0x0061] %asi
	.word 0xe20fc000  ! 401: LDUB_R	ldub	[%r31 + %r0], %r17
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 402: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe317c000  ! 403: LDQF_R	-	[%r31, %r0], %f17
pmu_20_247:
	nop
	setx 0xfffff46dfffff9c2, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_20_248:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 405: FDIVs	fdivs	%f0, %f4, %f8
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 406: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1702797  ! 407: POPC_I	popc	0x0797, %r16
	.word 0xa9840001  ! 408: WR_SET_SOFTINT_R	wr	%r16, %r1, %set_softint
	.word 0x29800001  ! 409: FBL	fbl,a	<label_0x1>
intveclr_20_250:
	setx 0xa74f0005af736347, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 410: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95a449cc  ! 411: FDIVd	fdivd	%f48, %f12, %f10
	rd %pc, %r19
	add %r19, (ivw_20_251-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_251:
	.word 0x91928003  ! 412: WRPR_PIL_R	wrpr	%r10, %r3, %pil
	.word 0x9f803c3f  ! 413: SIR	sir	0x1c3f
    set 0x7c7, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b4c7e3  ! 414: PDISTN	fmean16	%d50, %d34, %d50
	rd %pc, %r19
	add %r19, (ivw_20_252-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_252:
	.word 0x91904014  ! 415: WRPR_PIL_R	wrpr	%r1, %r20, %pil
	.word 0xe48fe008  ! 416: LDUBA_I	lduba	[%r31, + 0x0008] %asi, %r18
	.word 0x2a700001  ! 417: BPCS	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 418: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xc187dc00  ! 420: LDFA_R	lda	[%r31, %r0], %f0
change_to_randtl_20_253:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_253:
	.word 0x8f902000  ! 421: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9ba00172  ! 422: FABSq	dis not found

splash_hpstate_20_254:
	.word 0x8198248e  ! 423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048e, %hpstate
mondo_20_255:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d95000b  ! 424: WRPR_WSTATE_R	wrpr	%r20, %r11, %wstate
	.word 0x9f802e5d  ! 425: SIR	sir	0x0e5d
	.word 0xa9454000  ! 426: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
intveclr_20_256:
	setx 0x1941b307c0c474eb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 427: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_257:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 428: RDPC	rd	%pc, %r18
	rd %pc, %r19
	add %r19, (ivw_20_258-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_258:
	.word 0x91908006  ! 429: WRPR_PIL_R	wrpr	%r2, %r6, %pil
splash_cmpr_20_259:
	setx 0x2949e80035ee9f48, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 430: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7824002  ! 431: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r2, %-
	.word 0xe857c000  ! 432: LDSH_R	ldsh	[%r31 + %r0], %r20
	.word 0xa7540000  ! 433: RDPR_GL	<illegal instruction>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_261
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_261:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 434: CASA_R	casa	[%r31] %asi, %r16, %r9
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_262
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_262:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 435: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01971  ! 436: FqTOd	dis not found

	.word 0x95a00171  ! 437: FABSq	dis not found

change_to_randtl_20_264:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_264:
	.word 0x8f902000  ! 438: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_20_265:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_265:
	.word 0x8f902002  ! 439: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_20_266:
	setx 0x614eec12a63c7d55, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76cafbb  ! 441: SDIVX_I	sdivx	%r18, 0x0fbb, %r19
splash_cmpr_20_268:
	setx 0xaad3d736e5084b72, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 442: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd127e0f5  ! 443: STF_I	st	%f8, [0x00f5, %r31]
	.word 0x91d020b4  ! 444: Tcc_I	ta	icc_or_xcc, %r0 + 180
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 445: Tcc_R	te	icc_or_xcc, %r0 + %r30
jmptr_20_269:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 446: JMPL_R	jmpl	%r27 + %r0, %r27
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
	.word 0xa7414000  ! 447: RDPC	rd	%pc, %r19
	.word 0xd937e0a0  ! 448: STQF_I	-	%f12, [0x00a0, %r31]
pmu_20_271:
	nop
	setx 0xfffffae3fffff0a4, %g1, %g7
	.word 0xa3800007  ! 449: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_20_272:
	nop
	setx 0xfffff14efffffa32, %g1, %g7
	.word 0xa3800007  ! 450: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_htba_20_273:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 451: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd89fe020  ! 452: LDDA_I	ldda	[%r31, + 0x0020] %asi, %r12
	.word 0x8d903bcb  ! 453: WRPR_PSTATE_I	wrpr	%r0, 0x1bcb, %pstate
	.word 0x99902001  ! 454: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
pmu_20_274:
	nop
	setx 0xfffffe7afffff7fb, %g1, %g7
	.word 0xa3800007  ! 455: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_20_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d944012  ! 456: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	.word 0xd8800aa0  ! 457: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r12
	fbul,a,pn	%fcc0,  skip_20_276
	.word 0xe63c4000  ! 1: STD_R	std	%r19, [%r17 + %r0]
.align 128
skip_20_276:
	.word 0x95a109d3  ! 458: FDIVd	fdivd	%f4, %f50, %f10
splash_lsu_20_277:
	set 0xd17d74f4, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 459: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd31fc000  ! 460: LDDF_R	ldd	[%r31, %r0], %f9
	rd %pc, %r19
	add %r19, (ivw_20_278-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_278:
	.word 0x91948006  ! 461: WRPR_PIL_R	wrpr	%r18, %r6, %pil
	.word 0xd277e0d0  ! 462: STX_I	stx	%r9, [%r31 + 0x00d0]
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
	.word 0xa7414000  ! 463: RDPC	rd	%pc, %r19
	fbo,a,pn	%fcc0,  skip_20_280
	.word 0xc369a8b5  ! 1: PREFETCH_I	prefetch	[%r6 + 0x08b5], #one_read
.align 2048
skip_20_280:
	.word 0x91a109c4  ! 464: FDIVd	fdivd	%f4, %f4, %f8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a0196d  ! 465: FqTOd	dis not found

splash_hpstate_20_282:
	.word 0x81982837  ! 466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0837, %hpstate
change_to_randtl_20_283:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_283:
	.word 0x8f902001  ! 467: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xda3fc000  ! 468: STD_R	std	%r13, [%r31 + %r0]
	.word 0x91d020b3  ! 469: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x83d02035  ! 470: Tcc_I	te	icc_or_xcc, %r0 + 53
intveclr_20_284:
	setx 0xacc8b0c0a4dafaae, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 471: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_20_285:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d930012  ! 472: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
	.word 0xda77c000  ! 473: STX_R	stx	%r13, [%r31 + %r0]
pmu_20_286:
	nop
	setx 0xfffff398ffffff13, %g1, %g7
	.word 0xa3800007  ! 474: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xdacfe000  ! 475: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r13
	.word 0x9f803a4d  ! 476: SIR	sir	0x1a4d
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 477: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdb37e0b8  ! 478: STQF_I	-	%f13, [0x00b8, %r31]
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_287
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_287
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_287:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 479: RDPC	rd	%pc, %r17
splash_cmpr_20_288:
	setx 0x4fa44070321b0213, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 480: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93480000  ! 481: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	rd %pc, %r19
	add %r19, (ivw_20_289-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_289:
	.word 0x91948007  ! 482: WRPR_PIL_R	wrpr	%r18, %r7, %pil
donret_20_290:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_290-donret_20_290), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008d8867 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x3dc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_290:
	.word 0xe8ffe06c  ! 483: SWAPA_I	swapa	%r20, [%r31 + 0x006c] %asi
	bvs  	 skip_20_291
	fbuge,a,pn	%fcc0,  skip_20_291
.align 128
skip_20_291:
	.word 0x24ca8001  ! 484: BRLEZ	brlez,a,pt	%r10,<label_0xa8001>
	.word 0xd497e030  ! 485: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
	.word 0xd51fc000  ! 486: LDDF_R	ldd	[%r31, %r0], %f10
	.word 0xa7814010  ! 487: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r16, %-
	.word 0xd527c000  ! 488: STF_R	st	%f10, [%r0, %r31]
splash_hpstate_20_293:
	.word 0x8198238f  ! 489: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038f, %hpstate
	.word 0xd46fe056  ! 490: LDSTUB_I	ldstub	%r10, [%r31 + 0x0056]
jmptr_20_294:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 491: JMPL_R	jmpl	%r27 + %r0, %r27
debug_20_295:
	nop
	ta T_CHANGE_HPRIV
debug_iva_20_295:
	mov 0x690, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+8), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe187df20  ! 492: LDFA_R	lda	[%r31, %r0], %f16
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_296
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_296:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 493: RDPC	rd	%pc, %r18
	.word 0x9f8029be  ! 494: SIR	sir	0x09be
pmu_20_297:
	nop
	setx 0xfffffc71fffffd97, %g1, %g7
	.word 0xa3800007  ! 495: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_20_298:
	setx 0xb3aef278b7da405b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 496: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_20_299:
	setx 0xf426e44a28841701, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 497: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe80fe030  ! 498: LDUB_I	ldub	[%r31 + 0x0030], %r20
	.word 0xa9a00162  ! 499: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01973  ! 500: FqTOd	dis not found

splash_cmpr_20_301:
	setx 0xaee1e8bc182e075b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 501: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_20_302:
	setx 0xb8b01ceb6f1aee72, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 502: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa145c000  ! 503: RD_TICK_CMPR_REG	rd	%-, %r16
	.word 0xd537c000  ! 504: STQF_R	-	%f10, [%r0, %r31]
	.word 0x9f802577  ! 505: SIR	sir	0x0577
	rd %pc, %r19
	add %r19, (ivw_20_303-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_303:
	.word 0x91940014  ! 506: WRPR_PIL_R	wrpr	%r16, %r20, %pil
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 507: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_20_304:
	setx 0xd5241ddafc01688f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 508: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_20_305:
	.word 0xa1a209d0  ! 1: FDIVd	fdivd	%f8, %f16, %f16
	pdist %f22, %f12, %f16
	.word 0x97b40306  ! 509: ALIGNADDRESS	alignaddr	%r16, %r6, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_306) + 40, 16, 16)) -> intp(1,0,19)
intvec_20_306:
	.word 0x39400001  ! 510: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_307:
	setx 0x904870168f365fb9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 511: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f803977  ! 512: SIR	sir	0x1977
splash_lsu_20_308:
	set 0xac3c741a, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 513: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_20_309:
	setx 0xb3cf4783eb0e5115, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 514: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 515: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda800c40  ! 516: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r13
pmu_20_310:
	nop
	setx 0xfffffcd3fffff703, %g1, %g7
	.word 0xa3800007  ! 517: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38700001  ! 518: BPGU	<illegal instruction>
	.word 0xa7820005  ! 519: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r5, %-
	.word 0xda6fe08f  ! 520: LDSTUB_I	ldstub	%r13, [%r31 + 0x008f]
    set 0x1872, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b447f3  ! 521: PDISTN	fmean16	%d48, %d50, %d8
mondo_20_312:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d900012  ! 522: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
donret_20_313:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_313-donret_20_313-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002f3d58 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd0f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_313:
	.word 0xdaffe04c  ! 523: SWAPA_I	swapa	%r13, [%r31 + 0x004c] %asi
	.word 0x9f802cc6  ! 524: SIR	sir	0x0cc6
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01974  ! 525: FqTOd	dis not found

	.word 0xdacfe038  ! 526: LDSBA_I	ldsba	[%r31, + 0x0038] %asi, %r13
	.word 0x87ad0a50  ! 527: FCMPd	fcmpd	%fcc<n>, %f20, %f16
mondo_20_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d94c00d  ! 528: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
	.word 0xd41fe008  ! 529: LDD_I	ldd	[%r31 + 0x0008], %r10
	.word 0xd537e05f  ! 530: STQF_I	-	%f10, [0x005f, %r31]
DS_20_316:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd9343dfc  ! 1: STQF_I	-	%f12, [0x1dfc, %r16]
	normalw
	.word 0xa1458000  ! 531: RD_SOFTINT_REG	rd	%softint, %r16
cwp_20_317:
    set user_data_start, %o7
	.word 0x93902005  ! 532: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_cmpr_20_318:
	setx 0x0c6a62c503a1a2b9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 533: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_20_319:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_319-donret_20_319-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0054d827 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4c5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_319:
	.word 0xdaffe0c5  ! 534: SWAPA_I	swapa	%r13, [%r31 + 0x00c5] %asi
	.word 0xa5a00170  ! 535: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 536: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xe2800b40  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r17
mondo_20_320:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d948012  ! 538: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
unsupttte20_321:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87ac8a48  ! 539: FCMPd	fcmpd	%fcc<n>, %f18, %f8
jmptr_20_322:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 540: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe48008a0  ! 541: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
pmu_20_323:
	nop
	setx 0xffffff43fffffec0, %g1, %g7
	.word 0xa3800007  ! 542: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_20_324:
	set 0x0369d18c, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 543: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_20_325:
	nop
	ta T_CHANGE_HPRIV
debug_iva_20_325:
	mov 0x449, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+40), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc187dc00  ! 544: LDFA_R	lda	[%r31, %r0], %f0
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_326) + 16, 16, 16)) -> intp(5,0,28)
intvec_20_326:
	.word 0x39400001  ! 545: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_20_327:
	setx 0xcba5a5152d4a42f6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 546: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_20_328:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d94c003  ! 547: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
	.word 0x92d2327b  ! 548: UMULcc_I	umulcc 	%r8, 0xfffff27b, %r9
memptr_20_329:
	set 0x60540000, %r31
	.word 0x8581f440  ! 549: WRCCR_I	wr	%r7, 0x1440, %ccr
	.word 0x9f8038fe  ! 550: SIR	sir	0x18fe
memptr_20_330:
	set user_data_start, %r31
	.word 0x85847d27  ! 551: WRCCR_I	wr	%r17, 0x1d27, %ccr
	.word 0xe1bfdb60  ! 552: STDFA_R	stda	%f16, [%r0, %r31]
	bvc,a	 skip_20_331
	fbul skip_20_331
.align 512
skip_20_331:
	.word 0xc36d3b8f  ! 553: PREFETCH_I	prefetch	[%r20 + 0xfffffb8f], #one_read
splash_cmpr_20_332:
	setx 0x2e624586e75b1409, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 554: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a049d2  ! 555: FDIVd	fdivd	%f32, %f18, %f48
jmptr_20_333:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 556: JMPL_R	jmpl	%r27 + %r0, %r27
unsupttte20_334:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87ab0a45  ! 557: FCMPd	fcmpd	%fcc<n>, %f12, %f36
	.word 0xd48008a0  ! 558: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01963  ! 559: FqTOd	dis not found

	.word 0x95a289c7  ! 560: FDIVd	fdivd	%f10, %f38, %f10
debug_20_336:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdc00  ! 561: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x83d02033  ! 562: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xda1fc000  ! 563: LDD_R	ldd	[%r31 + %r0], %r13
mondo_20_337:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d934004  ! 564: WRPR_WSTATE_R	wrpr	%r13, %r4, %wstate
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_338
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_338
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_338:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 565: RDPC	rd	%pc, %r19
	ba  	 skip_20_339
	.word 0x97a509d3  ! 1: FDIVd	fdivd	%f20, %f50, %f42
.align 512
skip_20_339:
	.word 0xa7b244c5  ! 566: FCMPNE32	fcmpne32	%d40, %d36, %r19
	.word 0xe657e028  ! 567: LDSH_I	ldsh	[%r31 + 0x0028], %r19
splash_hpstate_20_340:
	.word 0x81982947  ! 568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0947, %hpstate
	.word 0xe64fc000  ! 569: LDSB_R	ldsb	[%r31 + %r0], %r19
splash_lsu_20_341:
	set 0xb4374a7b, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 570: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
fpinit_20_342:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83295  ! 571: PREFETCHA_I	prefetcha	[%r0, + 0xfffff295] %asi, #one_read
splash_lsu_20_343:
	set 0xc761c45e, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 572: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a0196a  ! 573: FqTOd	dis not found

	.word 0xd6800a60  ! 574: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_345)+40, 16, 16)) -> intp(4,1,3)
xir_20_345:
	.word 0xa982b0b6  ! 575: WR_SET_SOFTINT_I	wr	%r10, 0x10b6, %set_softint
	.word 0xd677e050  ! 576: STX_I	stx	%r11, [%r31 + 0x0050]
jmptr_20_346:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 577: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x5d42b5a41279c671, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_347:
	.word 0x39400001  ! 578: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 579: LDX_R	ldx	[%r31 + %r0], %r11
pmu_20_348:
	nop
	setx 0xffffff36fffffc44, %g1, %g7
	.word 0xa3800007  ! 580: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f8027d6  ! 581: SIR	sir	0x07d6
	.word 0x91d02032  ! 582: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_20_349:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 583: SAVE_R	save	%r31, %r0, %r31
pmu_20_350:
	nop
	setx 0xfffff66bffffffad, %g1, %g7
	.word 0xa3800007  ! 584: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_20_351:
	taddcctv %r17, 0x1b13, %r17
	.word 0xd607e069  ! 585: LDUW_I	lduw	[%r31 + 0x0069], %r11
	.word 0x95a4c9d1  ! 586: FDIVd	fdivd	%f50, %f48, %f10
	bcs  	 skip_20_352
	brnz,a,pt	%r20, skip_20_352
.align 2048
skip_20_352:
	.word 0xa3b444ca  ! 587: FCMPNE32	fcmpne32	%d48, %d10, %r17
	brgz,pn  	%r7, skip_20_353
	fble,a,pn	%fcc0,  skip_20_353
.align 128
skip_20_353:
	.word 0xc3692883  ! 588: PREFETCH_I	prefetch	[%r4 + 0x0883], #one_read
splash_hpstate_20_354:
	.word 0x819828cd  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cd, %hpstate
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 590: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_20_355:
	setx 0x0c0134cd2793665d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 591: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4c7e020  ! 592: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r18
	.word 0x8d90215b  ! 593: WRPR_PSTATE_I	wrpr	%r0, 0x015b, %pstate
mondo_20_356:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d94400b  ! 594: WRPR_WSTATE_R	wrpr	%r17, %r11, %wstate
jmptr_20_357:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 595: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe48008a0  ! 596: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
jmptr_20_358:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 597: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_20_359:
	setx 0xe8562f3330509e84, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 598: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_20_360:
	nop
	setx 0xfffff964fffff322, %g1, %g7
	.word 0xa3800007  ! 599: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_361
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_361:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 600: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0xe48008a0  ! 601: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_362
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_362:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 602: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0x9f802fb2  ! 603: SIR	sir	0x0fb2
	.word 0xe53fe001  ! 604: STDF_I	std	%f18, [0x0001, %r31]
	.word 0xe537c000  ! 605: STQF_R	-	%f18, [%r0, %r31]
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 606: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe51fe018  ! 607: LDDF_I	ldd	[%r31, 0x0018], %f18
	.word 0x8d903af9  ! 608: WRPR_PSTATE_I	wrpr	%r0, 0x1af9, %pstate
jmptr_20_363:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 609: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa3b5048d  ! 610: FCMPLE32	fcmple32	%d20, %d44, %r17
intveclr_20_364:
	setx 0x3a0cb89291a24241, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 611: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_365:
	setx 0x2a0cd31825f5b6b2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 612: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_20_366:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe187c3e0  ! 613: LDFA_R	lda	[%r31, %r0], %f16
splash_cmpr_20_367:
	setx 0xf248dd0f54ae90f6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 614: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe1bfe080  ! 615: STDFA_I	stda	%f16, [0x0080, %r31]
	.word 0xe25fe018  ! 616: LDX_I	ldx	[%r31 + 0x0018], %r17
	.word 0xa345c000  ! 617: RD_TICK_CMPR_REG	rd	%-, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_368) + 8, 16, 16)) -> intp(4,0,12)
intvec_20_368:
	.word 0x39400001  ! 618: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda1fc000  ! 619: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xc187e0a0  ! 620: LDFA_I	lda	[%r31, 0x00a0], %f0
splash_tba_20_369:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 621: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9b454000  ! 622: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
tagged_20_370:
	tsubcctv %r13, 0x14a9, %r2
	.word 0xe007e0e9  ! 623: LDUW_I	lduw	[%r31 + 0x00e9], %r16
memptr_20_371:
	set 0x60140000, %r31
	.word 0x8584b576  ! 624: WRCCR_I	wr	%r18, 0x1576, %ccr
mondo_20_372:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d908010  ! 625: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
	.word 0x83d020b2  ! 626: Tcc_I	te	icc_or_xcc, %r0 + 178
splash_htba_20_373:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 627: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_374
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_374:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00b  ! 628: CASA_R	casa	[%r31] %asi, %r11, %r16
	.word 0xa3454000  ! 629: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0x93a0016b  ! 630: FABSq	dis not found

	.word 0x97a449c6  ! 631: FDIVd	fdivd	%f48, %f6, %f42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 632: LDX_R	ldx	[%r31 + %r0], %r19
cwp_20_375:
    set user_data_start, %o7
	.word 0x93902005  ! 633: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x81510000  ! 635: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe6800b60  ! 636: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r19
	rd %pc, %r19
	add %r19, (ivw_20_376-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_376:
	.word 0x91940004  ! 637: WRPR_PIL_R	wrpr	%r16, %r4, %pil
intveclr_20_377:
	setx 0x03a45c11de4ac647, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 638: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 639: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_20_378:
	set 0xed86b7f2, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 640: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe68008a0  ! 641: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe627e08e  ! 642: STW_I	stw	%r19, [%r31 + 0x008e]
	.word 0x83d020b2  ! 643: Tcc_I	te	icc_or_xcc, %r0 + 178
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_379
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_379:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 644: CASA_R	casa	[%r31] %asi, %r16, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_380) + 56, 16, 16)) -> intp(4,0,31)
intvec_20_380:
	.word 0x39400001  ! 645: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa782c010  ! 646: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r16, %-
mondo_20_382:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d910014  ! 647: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16c6735  ! 648: SDIVX_I	sdivx	%r17, 0x0735, %r16
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
	.word 0xa1414000  ! 649: RDPC	rd	%pc, %r16
	.word 0xd42fe08d  ! 650: STB_I	stb	%r10, [%r31 + 0x008d]
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 651: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976c2ca6  ! 652: SDIVX_I	sdivx	%r16, 0x0ca6, %r11
splash_lsu_20_386:
	set 0x46451ca2, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 653: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	brgez,pt  	%r11, skip_20_387
	.word 0x93a089c7  ! 1: FDIVd	fdivd	%f2, %f38, %f40
.align 32
skip_20_387:
	.word 0xe83cc00c  ! 654: STD_R	std	%r20, [%r19 + %r12]
	.word 0x9545c000  ! 655: RD_TICK_CMPR_REG	rd	%-, %r10
splash_lsu_20_388:
	set 0x79c2356c, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 656: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9345c000  ! 657: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0xa88374f2  ! 658: ADDcc_I	addcc 	%r13, 0xfffff4f2, %r20
debug_20_389:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_20_389:
	mov 0xcc3, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe040  ! 659: STDFA_I	stda	%f0, [0x0040, %r31]
	.word 0xe8800ae0  ! 660: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r20
jmptr_20_390:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 661: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_20_391:
	nop
	setx 0xfffff35cfffff05a, %g1, %g7
	.word 0xa3800007  ! 662: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99540000  ! 663: RDPR_GL	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_20_392-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_392:
	.word 0x91900013  ! 664: WRPR_PIL_R	wrpr	%r0, %r19, %pil
splash_lsu_20_393:
	set 0xee07fce7, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 665: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_20_394:
	nop
	setx 0xfffff1ecfffffadd, %g1, %g7
	.word 0xa3800007  ! 666: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_395
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_395:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 667: CASA_R	casa	[%r31] %asi, %r12, %r13
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_396
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_396:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 668: CASA_R	casa	[%r31] %asi, %r12, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 669: LDX_R	ldx	[%r31 + %r0], %r13
splash_cmpr_20_397:
	setx 0xadd63b5ed60248f3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 670: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_20_398:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 671: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_399
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_399
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_399:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 672: RDPC	rd	%pc, %r8
    set 0x3ea, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b447f2  ! 673: PDISTN	fmean16	%d48, %d18, %d40
	.word 0xa5a00171  ! 674: FABSq	dis not found

mondo_20_400:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d944010  ! 675: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	rd %pc, %r19
	add %r19, (ivw_20_401-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_401:
	.word 0x9191400c  ! 676: WRPR_PIL_R	wrpr	%r5, %r12, %pil
mondo_20_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d918007  ! 677: WRPR_WSTATE_R	wrpr	%r6, %r7, %wstate
fpinit_20_403:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82678  ! 678: PREFETCHA_I	prefetcha	[%r0, + 0x0678] %asi, #one_read
    set 0x2dc4, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b347f1  ! 679: PDISTN	fmean16	%d44, %d48, %d8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01971  ! 680: FqTOd	dis not found

cwp_20_405:
    set user_data_start, %o7
	.word 0x93902006  ! 681: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_406
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_406:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 682: CASA_R	casa	[%r31] %asi, %r5, %r17
splash_cmpr_20_407:
	setx 0xa7ad50c1a31b3aa2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 683: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_20_408:
	set 0xfc7d3a05, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 684: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 685: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x97500000  ! 686: RDPR_TPC	<illegal instruction>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_409:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 687: RDPC	rd	%pc, %r16
	.word 0x95480000  ! 688: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_410
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_410:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 689: CASA_R	casa	[%r31] %asi, %r5, %r18
fpinit_20_411:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 690: FDIVs	fdivs	%f0, %f4, %f8
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_412
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_412:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 691: CASA_R	casa	[%r31] %asi, %r5, %r18
jmptr_20_413:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 692: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_20_414:
	nop
	setx 0xfffff375fffff245, %g1, %g7
	.word 0xa3800007  ! 693: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_20_415-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_415:
	.word 0x91950010  ! 694: WRPR_PIL_R	wrpr	%r20, %r16, %pil
splash_hpstate_20_416:
	.word 0x81982707  ! 695: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0707, %hpstate
donret_20_417:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_417-donret_20_417-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e74b30 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x406, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_417:
	.word 0xe4ffe0ec  ! 696: SWAPA_I	swapa	%r18, [%r31 + 0x00ec] %asi
debug_20_418:
	nop
	ta T_CHANGE_HPRIV
debug_iva_20_418:
	mov 0x61e, %r20
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
	.word 0xc1bfe000  ! 697: STDFA_I	stda	%f0, [0x0000, %r31]
pmu_20_419:
	nop
	setx 0xfffffb1affffff81, %g1, %g7
	.word 0xa3800007  ! 698: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_20_420:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d92800d  ! 699: WRPR_WSTATE_R	wrpr	%r10, %r13, %wstate
	.word 0x97540000  ! 700: RDPR_GL	rdpr	%-, %r11
DS_20_421:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe534fbba  ! 1: STQF_I	-	%f18, [0x1bba, %r19]
	normalw
	.word 0xa5458000  ! 701: RD_SOFTINT_REG	rd	%softint, %r18
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xab843d1a  ! 1: WR_CLEAR_SOFTINT_I	wr	%r16, 0x1d1a, %clear_softint
	.word 0x87ac0a54  ! 2: FCMPd	fcmpd	%fcc<n>, %f16, %f20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 3: LDX_R	ldx	[%r31 + %r0], %r18
intveclr_10_1:
	setx 0xf0863afb5f83eab8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 4: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_10_2:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_10_2:
	mov 0xb0a, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdb60  ! 5: STDFA_R	stda	%f16, [%r0, %r31]
splash_lsu_10_3:
	set 0x52cbdd1b, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 6: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_10_4:
	setx 0xa17d44cf0ec2db16, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_10_5:
	setx 0xc2ee1a68b7315ad9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 8: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_10_6:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_6:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_6
    nop
debug_wait10_6:
    ld [%r23], %r16
    brnz %r16, debug_wait10_6
    nop
    ba,a debug_startwait10_6
continue_debug_10_6:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_6:
    cmp %r13, %r17
    bne,a wait_for_stat_10_6
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_6:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_6
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x0000005030c000d4,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdf20  ! 9: STDFA_R	stda	%f0, [%r0, %r31]
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_7:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 10: RDPC	rd	%pc, %r10
intveclr_10_8:
	setx 0x3d625f92e4817034, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 11: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_9
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_9:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 12: RDPC	rd	%pc, %r16
	.word 0xe81fc000  ! 13: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0xa1b4c493  ! 14: FCMPLE32	fcmple32	%d50, %d50, %r16
	.word 0x9f8026d8  ! 15: SIR	sir	0x06d8
	.word 0xe69fc3c0  ! 16: LDDA_R	ldda	[%r31, %r0] 0x1e, %r19
	setx 0xba6563fb01d0b45b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_11:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_10_12:
	setx 0x6ed6dfb0c3211b53, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 18: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_13
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_13:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 19: CASA_R	casa	[%r31] %asi, %r16, %r19
	.word 0xab848012  ! 20: WR_CLEAR_SOFTINT_R	wr	%r18, %r18, %clear_softint
	.word 0x93a509b2  ! 21: FDIVs	fdivs	%f20, %f18, %f9
intveclr_10_14:
	setx 0x63aa0bc0ed0455bf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 22: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 23: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_10_15:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d950004  ! 24: WRPR_WSTATE_R	wrpr	%r20, %r4, %wstate
jmptr_10_16:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 25: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_10_17:
	nop
	setx 0xfffff727fffffe55, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd46fe04e  ! 27: LDSTUB_I	ldstub	%r10, [%r31 + 0x004e]
	.word 0x91d020b3  ! 28: Tcc_I	ta	icc_or_xcc, %r0 + 179
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 29: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_10_18:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_18:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_18
    nop
debug_wait10_18:
    ld [%r23], %r16
    brnz %r16, debug_wait10_18
    nop
    ba,a debug_startwait10_18
continue_debug_10_18:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_18:
    cmp %r13, %r17
    bne,a wait_for_stat_10_18
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_18:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_18
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x00000050fac0d440,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe000  ! 30: STDFA_I	stda	%f16, [0x0000, %r31]
	setx 0x8ab50a088247ce4c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_19:
	.word 0x39400001  ! 31: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfde00  ! 32: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x91d02033  ! 33: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa9b4c481  ! 34: FCMPLE32	fcmple32	%d50, %d32, %r20
splash_cmpr_10_20:
	setx 0x3e25637bc6a16bf2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 35: WR_STICK_REG_R	wr	%r0, %r1, %-
jmptr_10_21:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 36: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_22:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 37: CASA_R	casa	[%r31] %asi, %r17, %r17
splash_hpstate_10_23:
	.word 0x81982007  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0007, %hpstate
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_24:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 39: CASA_R	casa	[%r31] %asi, %r17, %r17
mondo_10_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d94c013  ! 40: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	.word 0xe257c000  ! 41: LDSH_R	ldsh	[%r31 + %r0], %r17
splash_cmpr_10_26:
	setx 0x69d922646760cd35, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 42: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe33fc000  ! 43: STDF_R	std	%f17, [%r0, %r31]
	.word 0xab84a4ed  ! 44: WR_CLEAR_SOFTINT_I	wr	%r18, 0x04ed, %clear_softint
splash_hpstate_10_27:
	.word 0x81982237  ! 45: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0237, %hpstate
change_to_randtl_10_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_28:
	.word 0x8f902000  ! 46: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_10_29:
	setx 0x2ecc39fccc0e9f3c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 47: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_30:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e008  ! 48: CASA_R	casa	[%r31] %asi, %r8, %r17
intveclr_10_31:
	setx 0x8c0778d44ba50f92, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 49: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_32) + 0, 16, 16)) -> intp(6,0,22)
intvec_10_32:
	.word 0x39400001  ! 50: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 51: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f803478  ! 52: SIR	sir	0x1478
	.word 0xa3a509b0  ! 53: FDIVs	fdivs	%f20, %f16, %f17
	.word 0x87a80a54  ! 54: FCMPd	fcmpd	%fcc<n>, %f0, %f20
	.word 0x29800001  ! 55: FBL	fbl,a	<label_0x1>
	.word 0x9f802a55  ! 56: SIR	sir	0x0a55
intveclr_10_35:
	setx 0xa5c72860a2ed780b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 57: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_10_36:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 58: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
memptr_10_37:
	set 0x60540000, %r31
	.word 0x85852f27  ! 59: WRCCR_I	wr	%r20, 0x0f27, %ccr
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_38:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 60: RDPC	rd	%pc, %r13
	.word 0xe44fc000  ! 61: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe537c000  ! 62: STQF_R	-	%f18, [%r0, %r31]
mondo_10_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d948006  ! 63: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
	.word 0xe46fe0c4  ! 64: LDSTUB_I	ldstub	%r18, [%r31 + 0x00c4]
jmptr_10_40:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 65: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01962  ! 66: FqTOd	dis not found

	.word 0xd88008a0  ! 67: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x9f8033cc  ! 68: SIR	sir	0x13cc
intveclr_10_42:
	setx 0x5aa79a93f5c0e5ff, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_43:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e007  ! 70: CASA_R	casa	[%r31] %asi, %r7, %r12
splash_lsu_10_44:
	set 0xd7bc149f, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 71: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_10_45:
	nop
	setx 0xfffff3a8fffffe37, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_10_46:
	setx 0x8a2b3b6644c3c7a1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_10_47-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_47:
	.word 0x9190c012  ! 74: WRPR_PIL_R	wrpr	%r3, %r18, %pil
	.word 0x29800001  ! 75: FBL	fbl,a	<label_0x1>
	.word 0xc369b41e  ! 76: PREFETCH_I	prefetch	[%r6 + 0xfffff41e], #one_read
mondo_10_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d944003  ! 77: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
	.word 0x97a489d1  ! 78: FDIVd	fdivd	%f18, %f48, %f42
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_51
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_51
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_51:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 79: RDPC	rd	%pc, %r17
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_52:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e004  ! 80: CASA_R	casa	[%r31] %asi, %r4, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_53)+24, 16, 16)) -> intp(4,1,3)
xir_10_53:
	.word 0xa98123c2  ! 81: WR_SET_SOFTINT_I	wr	%r4, 0x03c2, %set_softint
	.word 0xe8d7e008  ! 82: LDSHA_I	ldsha	[%r31, + 0x0008] %asi, %r20
	.word 0x3e800001  ! 83: BVC	bvc,a	<label_0x1>
	.word 0xe937c000  ! 84: STQF_R	-	%f20, [%r0, %r31]
	.word 0xa9454000  ! 85: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0xda47e028  ! 86: LDSW_I	ldsw	[%r31 + 0x0028], %r13
pmu_10_54:
	nop
	setx 0xfffff01afffff530, %g1, %g7
	.word 0xa3800007  ! 87: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f803faa  ! 88: SIR	sir	0x1faa
	setx 0xd939252bc15eb7bb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_55:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_56:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e004  ! 90: CASA_R	casa	[%r31] %asi, %r4, %r13
mondo_10_57:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d920011  ! 91: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
splash_hpstate_10_58:
	.word 0x81982e4f  ! 92: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4f, %hpstate
	.word 0xda9fc2c0  ! 93: LDDA_R	ldda	[%r31, %r0] 0x16, %r13
	.word 0xa3a00165  ! 94: FABSq	dis not found

	.word 0xd26fe073  ! 95: LDSTUB_I	ldstub	%r9, [%r31 + 0x0073]
	setx 0x8d01dc975dae13bb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_59:
	.word 0x39400001  ! 96: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd26fe0b8  ! 97: LDSTUB_I	ldstub	%r9, [%r31 + 0x00b8]
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 98: Tcc_R	te	icc_or_xcc, %r0 + %r30
fpinit_10_60:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 99: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0x97b48480  ! 100: FCMPLE32	fcmple32	%d18, %d0, %r11
DS_10_61:
	.word 0x91a289d4  ! 1: FDIVd	fdivd	%f10, %f20, %f8
	pdist %f24, %f20, %f8
	.word 0xa7b34314  ! 101: ALIGNADDRESS	alignaddr	%r13, %r20, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01961  ! 102: FqTOd	dis not found

pmu_10_63:
	nop
	setx 0xfffff44afffff9bc, %g1, %g7
	.word 0xa3800007  ! 103: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_10_64:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x8d4cceee	! Random illegal ?
	.word 0xd1148008  ! 1: LDQF_R	-	[%r18, %r8], %f8
	.word 0x93a48834  ! 104: FADDs	fadds	%f18, %f20, %f9
	.word 0x99902002  ! 105: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xa1b44492  ! 106: FCMPLE32	fcmple32	%d48, %d18, %r16
	.word 0x9f80258d  ! 107: SIR	sir	0x058d
	.word 0xd827e004  ! 108: STW_I	stw	%r12, [%r31 + 0x0004]
debug_10_65:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_10_65:
	mov 0x96c, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc187db60  ! 109: LDFA_R	lda	[%r31, %r0], %f0
	.word 0xd81fc000  ! 110: LDD_R	ldd	[%r31 + %r0], %r12
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_66:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 111: CASA_R	casa	[%r31] %asi, %r16, %r12
change_to_randtl_10_67:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_67:
	.word 0x8f902001  ! 112: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_10_68:
	setx 0xf2310662cfdeb281, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 113: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_10_69:
	setx 0x394715dc1991e33a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 114: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_70
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_70:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 115: RDPC	rd	%pc, %r13
pmu_10_71:
	nop
	setx 0xffffff36fffffbc1, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01963  ! 117: FqTOd	dis not found

	.word 0xe527e068  ! 118: STF_I	st	%f18, [0x0068, %r31]
mondo_10_73:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d900012  ! 119: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_74:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 120: CASA_R	casa	[%r31] %asi, %r13, %r18
splash_lsu_10_75:
	set 0x326449c1, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 121: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9844005  ! 122: WR_SET_SOFTINT_R	wr	%r17, %r5, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_76) + 32, 16, 16)) -> intp(3,0,10)
intvec_10_76:
	.word 0x39400001  ! 123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_10_77:
	nop
	setx 0xfffff58afffff75a, %g1, %g7
	.word 0xa3800007  ! 124: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_10_78:
	nop
	setx 0xfffff19dfffff3f7, %g1, %g7
	.word 0xa3800007  ! 125: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_79
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_79:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 126: CASA_R	casa	[%r31] %asi, %r19, %r18
pmu_10_80:
	nop
	setx 0xfffff985fffff919, %g1, %g7
	.word 0xa3800007  ! 127: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_10_81:
	set 0x9d350557, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 128: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_10_82:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 129: RESTORE_R	restore	%r31, %r0, %r31
debug_10_83:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_10_83:
	mov 0x872, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc187dc00  ! 130: LDFA_R	lda	[%r31, %r0], %f0
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96cbaa6  ! 131: SDIVX_I	sdivx	%r18, 0xfffffaa6, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 132: LDX_R	ldx	[%r31 + %r0], %r16
change_to_randtl_10_85:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_85:
	.word 0x8f902000  ! 133: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_10_86:
	setx 0x00138c9834b9eedf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 134: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a349d2  ! 135: FDIVd	fdivd	%f44, %f18, %f48
cwp_10_87:
    set user_data_start, %o7
	.word 0x93902003  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x26700001  ! 137: BPL	<illegal instruction>
	.word 0xd69fe038  ! 138: LDDA_I	ldda	[%r31, + 0x0038] %asi, %r11
mondo_10_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d928006  ! 139: WRPR_WSTATE_R	wrpr	%r10, %r6, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b68a9b8  ! 140: SDIVX_I	sdivx	%r2, 0x09b8, %r13
	.word 0xe1bfe080  ! 141: STDFA_I	stda	%f16, [0x0080, %r31]
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_90:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e004  ! 142: CASA_R	casa	[%r31] %asi, %r4, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a0196d  ! 143: FqTOd	dis not found

	.word 0xd41fe010  ! 144: LDD_I	ldd	[%r31 + 0x0010], %r10
splash_tba_10_92:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 145: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1b1c4d1  ! 146: FCMPNE32	fcmpne32	%d38, %d48, %r16
	.word 0xa7828010  ! 147: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r16, %-
	.word 0xe187e080  ! 148: LDFA_I	lda	[%r31, 0x0080], %f16
	.word 0xd0800b60  ! 149: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r8
	.word 0x9b454000  ! 150: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
pmu_10_95:
	nop
	setx 0xfffff1d6fffff385, %g1, %g7
	.word 0xa3800007  ! 151: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9ba1c9e4  ! 152: FDIVq	dis not found

splash_lsu_10_96:
	set 0xc19f9f8d, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 153: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_97:
	setx 0x0f4cb162a17e1b36, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 154: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab814000  ! 155: WR_CLEAR_SOFTINT_R	wr	%r5, %r0, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_98) + 16, 16, 16)) -> intp(7,0,25)
intvec_10_98:
	.word 0x39400001  ! 156: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 157: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4800ae0  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r18
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_99
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_99:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e007  ! 159: CASA_R	casa	[%r31] %asi, %r7, %r18
	.word 0xa5a509c1  ! 160: FDIVd	fdivd	%f20, %f32, %f18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_100) + 0, 16, 16)) -> intp(1,0,2)
intvec_10_100:
	.word 0x39400001  ! 161: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95454000  ! 162: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	.word 0x81460000  ! 163: RD_STICK_REG	stbar
	.word 0xc3ea002a  ! 164: PREFETCHA_R	prefetcha	[%r8, %r10] 0x01, #one_read
mondo_10_101:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d940011  ! 165: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_102
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_102:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 166: RDPC	rd	%pc, %r8
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_103:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 167: CASA_R	casa	[%r31] %asi, %r6, %r9
	rd %pc, %r19
	add %r19, (ivw_10_104-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_104:
	.word 0x91928010  ! 168: WRPR_PIL_R	wrpr	%r10, %r16, %pil
	.word 0xa781c002  ! 169: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r2, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_106)+48, 16, 16)) -> intp(4,1,3)
xir_10_106:
	.word 0xa985302b  ! 170: WR_SET_SOFTINT_I	wr	%r20, 0x102b, %set_softint
	.word 0xd327c000  ! 171: STF_R	st	%f9, [%r0, %r31]
	.word 0xd2800c60  ! 172: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 173: LDX_R	ldx	[%r31 + %r0], %r9
	rd %pc, %r19
	add %r19, (ivw_10_107-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_107:
	.word 0x91930008  ! 174: WRPR_PIL_R	wrpr	%r12, %r8, %pil
	.word 0xd28008a0  ! 175: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_lsu_10_108:
	set 0x89935c24, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 176: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_109:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 177: CASA_R	casa	[%r31] %asi, %r6, %r9
pmu_10_110:
	nop
	setx 0xfffff691fffffb51, %g1, %g7
	.word 0xa3800007  ! 178: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_10_111:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_111:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_111
    nop
debug_wait10_111:
    ld [%r23], %r16
    brnz %r16, debug_wait10_111
    nop
    ba,a debug_startwait10_111
continue_debug_10_111:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_111:
    cmp %r13, %r17
    bne,a wait_for_stat_10_111
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_111:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_111
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x00000050bed440e5,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc187c2c0  ! 179: LDFA_R	lda	[%r31, %r0], %f0
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_112:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 180: CASA_R	casa	[%r31] %asi, %r6, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_113)+40, 16, 16)) -> intp(4,1,3)
xir_10_113:
	.word 0xa984755f  ! 181: WR_SET_SOFTINT_I	wr	%r17, 0x155f, %set_softint
memptr_10_114:
	set user_data_start, %r31
	.word 0x85817f19  ! 182: WRCCR_I	wr	%r5, 0x1f19, %ccr
mondo_10_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d944010  ! 183: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_116) + 24, 16, 16)) -> intp(5,0,11)
intvec_10_116:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_10_117:
	set 0xf84a523a, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_118:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 186: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0xd237e0c0  ! 187: STH_I	sth	%r9, [%r31 + 0x00c0]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 188: LDX_R	ldx	[%r31 + %r0], %r9
jmptr_10_119:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 189: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd2800c00  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r9
	.word 0xe187e060  ! 191: LDFA_I	lda	[%r31, 0x0060], %f16
cwp_10_120:
    set user_data_start, %o7
	.word 0x93902006  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_10_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d940012  ! 193: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
mondo_10_122:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d934000  ! 194: WRPR_WSTATE_R	wrpr	%r13, %r0, %wstate
DS_10_123:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x97b2030d  ! 195: ALIGNADDRESS	alignaddr	%r8, %r13, %r11
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 196: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_124
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_124:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 197: RDPC	rd	%pc, %r12
	.word 0xa150c000  ! 198: RDPR_TT	rdpr	%tt, %r16
	.word 0x29800001  ! 199: FBL	fbl,a	<label_0x1>
DS_10_126:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 200: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_10_127-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_127:
	.word 0x91944003  ! 201: WRPR_PIL_R	wrpr	%r17, %r3, %pil
mondo_10_128:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d908010  ! 202: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
splash_lsu_10_129:
	set 0x77d09a85, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 203: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_10_130:
	set 0x71a76d6d, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 204: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 205: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_10_131:
	setx 0x97c94b6cdb1ddc61, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 206: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_132
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_132:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e007  ! 207: CASA_R	casa	[%r31] %asi, %r7, %r13
splash_cmpr_10_133:
	setx 0x0ff429f6fe0d1da2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_10_134:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_134-donret_10_134), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004665c1 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x3dc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_134:
	.word 0xdaffe04a  ! 209: SWAPA_I	swapa	%r13, [%r31 + 0x004a] %asi
	.word 0xa7808002  ! 210: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r2, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_136) + 8, 16, 16)) -> intp(5,0,2)
intvec_10_136:
	.word 0x39400001  ! 211: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a009d4  ! 212: FDIVd	fdivd	%f0, %f20, %f40
splash_cmpr_10_138:
	setx 0xfdb51325c7c76566, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 213: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_10_139:
	set 0x105d9ff6, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 214: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902dc1  ! 215: WRPR_PSTATE_I	wrpr	%r0, 0x0dc1, %pstate
	.word 0xd8800ba0  ! 216: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r12
	.word 0xd88fe020  ! 217: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_140
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_140:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 218: RDPC	rd	%pc, %r13
	.word 0x9f80298c  ! 219: SIR	sir	0x098c
mondo_10_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d924006  ! 220: WRPR_WSTATE_R	wrpr	%r9, %r6, %wstate
jmptr_10_142:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 221: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe46fe0e3  ! 222: LDSTUB_I	ldstub	%r18, [%r31 + 0x00e3]
	.word 0xe4800ba0  ! 223: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r18
	.word 0x9f8037f4  ! 224: SIR	sir	0x17f4
intveclr_10_143:
	setx 0x4bbd72e22ccbd117, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_144:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 226: CASA_R	casa	[%r31] %asi, %r0, %r18
splash_lsu_10_145:
	set 0xb46e9e0c, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 227: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_146
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_146
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_146:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 228: RDPC	rd	%pc, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 229: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe68008a0  ! 230: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
intveclr_10_147:
	setx 0x736b7e8ca1cff63b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 231: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc36cb1b5  ! 232: PREFETCH_I	prefetch	[%r18 + 0xfffff1b5], #one_read
splash_cmpr_10_149:
	setx 0xf2ec2c24d0d413c7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 233: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_150) + 8, 16, 16)) -> intp(7,0,31)
intvec_10_150:
	.word 0x39400001  ! 234: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_10_151:
	nop
	setx 0xfffffd7dfffffb96, %g1, %g7
	.word 0xa3800007  ! 235: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b3  ! 236: Tcc_I	ta	icc_or_xcc, %r0 + 179
intveclr_10_152:
	setx 0x50d6a4d16db6cad7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 237: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936cf759  ! 238: SDIVX_I	sdivx	%r19, 0xfffff759, %r9
pmu_10_154:
	nop
	setx 0xfffff2c4fffff2db, %g1, %g7
	.word 0xa3800007  ! 239: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe2800b80  ! 240: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r17
	.word 0xa7a009d3  ! 241: FDIVd	fdivd	%f0, %f50, %f50
	.word 0xd727c000  ! 242: STF_R	st	%f11, [%r0, %r31]
	.word 0xc187e0c0  ! 243: LDFA_I	lda	[%r31, 0x00c0], %f0
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_155:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r11
	.word 0x99902000  ! 245: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
DS_10_156:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe1316126  ! 1: STQF_I	-	%f16, [0x0126, %r5]
	normalw
	.word 0xa5458000  ! 246: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0x91a149a1  ! 247: FDIVs	fdivs	%f5, %f1, %f8
	.word 0x39400001  ! 248: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 249: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd527c000  ! 250: STF_R	st	%f10, [%r0, %r31]
	.word 0x91d020b5  ! 251: Tcc_I	ta	icc_or_xcc, %r0 + 181
intveclr_10_158:
	setx 0xff4091fe8e5a126d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 252: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_159:
	setx 0x2205bdae94469106, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_10_160:
	setx 0xff92d31bef1a9c84, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 254: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802e1c  ! 255: SIR	sir	0x0e1c
intveclr_10_161:
	setx 0x88af7991faf6aaef, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 256: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_10_162:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc95eabc8	! Random illegal ?
	.word 0x93a00551  ! 1: FSQRTd	fsqrt	
	.word 0x97a50833  ! 257: FADDs	fadds	%f20, %f19, %f11
	.word 0x9f802661  ! 258: SIR	sir	0x0661
	.word 0xe257c000  ! 259: LDSH_R	ldsh	[%r31 + %r0], %r17
splash_lsu_10_163:
	set 0x168222bf, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 260: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1b1c4cc  ! 261: FCMPNE32	fcmpne32	%d38, %d12, %r16
	.word 0x81460000  ! 262: RD_STICK_REG	stbar
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36a6547  ! 263: SDIVX_I	sdivx	%r9, 0x0547, %r17
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_166:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 264: CASA_R	casa	[%r31] %asi, %r19, %r9
	.word 0xa9a409d2  ! 265: FDIVd	fdivd	%f16, %f18, %f20
intveclr_10_167:
	setx 0x6e0dbd7d6486ba7a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 266: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91450000  ! 267: RD_SET_SOFTINT	rd	%set_softint, %r8
splash_hpstate_10_168:
	.word 0x81982aef  ! 268: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0aef, %hpstate
splash_htba_10_169:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 269: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_10_170:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe5344013  ! 1: STQF_R	-	%f18, [%r19, %r17]
	normalw
	.word 0xa9458000  ! 270: RD_SOFTINT_REG	rd	%softint, %r20
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_171
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_171:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 271: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0x91d020b2  ! 272: Tcc_I	ta	icc_or_xcc, %r0 + 178
mondo_10_172:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d91400d  ! 273: WRPR_WSTATE_R	wrpr	%r5, %r13, %wstate
	.word 0xa5a00164  ! 274: FABSq	dis not found

	setx 0xdf33d6bd9a376a34, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_173:
	.word 0x39400001  ! 275: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_10_174:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_174-donret_10_174), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b8d1b2 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x157, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_174:
	.word 0xe6ffe0b0  ! 276: SWAPA_I	swapa	%r19, [%r31 + 0x00b0] %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01971  ! 277: FqTOd	dis not found

splash_cmpr_10_176:
	setx 0x4bdc14e44c71bb6a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_10_177:
	setx 0xd9a99a4c36a21d41, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 279: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 280: LDX_R	ldx	[%r31 + %r0], %r18
fpinit_10_178:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 281: FDIVs	fdivs	%f0, %f4, %f8
	.word 0xe48008a0  ! 282: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x93d020b5  ! 283: Tcc_I	tne	icc_or_xcc, %r0 + 181
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_179
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_179:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 284: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0xa3a409d4  ! 285: FDIVd	fdivd	%f16, %f20, %f48
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_180) + 48, 16, 16)) -> intp(1,0,27)
intvec_10_180:
	.word 0x39400001  ! 286: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9b450000  ! 287: RD_SET_SOFTINT	rd	%set_softint, %r13
fpinit_10_181:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 288: FDIVd	fdivd	%f0, %f4, %f6
	.word 0xe28fe010  ! 289: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_182
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_182:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 290: RDPC	rd	%pc, %r13
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 291: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0x9f80215d  ! 292: SIR	sir	0x015d
splash_cmpr_10_184:
	setx 0x5d84f3055a2dd443, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 293: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_10_185:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_185-donret_10_185-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b30503 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xadc, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_185:
	.word 0xd6ffe0fc  ! 294: SWAPA_I	swapa	%r11, [%r31 + 0x00fc] %asi
	.word 0xd737c000  ! 295: STQF_R	-	%f11, [%r0, %r31]
	.word 0xd727e0dd  ! 296: STF_I	st	%f11, [0x00dd, %r31]
	.word 0xd66fe0ee  ! 297: LDSTUB_I	ldstub	%r11, [%r31 + 0x00ee]
splash_lsu_10_186:
	set 0xb43f6bc8, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc187e020  ! 299: LDFA_I	lda	[%r31, 0x0020], %f0
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 300: LDX_R	ldx	[%r31 + %r0], %r11
intveclr_10_187:
	setx 0x6522c46180b62dce, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_10_188:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_10_188:
	mov 0xb58, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe0a0  ! 302: STDFA_I	stda	%f16, [0x00a0, %r31]
	setx 0xe1d018ca2effc151, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_189:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9029f0  ! 304: WRPR_PSTATE_I	wrpr	%r0, 0x09f0, %pstate
DS_10_190:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe13328c9  ! 1: STQF_I	-	%f16, [0x08c9, %r12]
	normalw
	.word 0xa3458000  ! 305: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0xe65fe028  ! 306: LDX_I	ldx	[%r31 + 0x0028], %r19
	.word 0xe6bfe059  ! 307: STDA_I	stda	%r19, [%r31 + 0x0059] %asi
pmu_10_191:
	nop
	setx 0xfffffa43fffff4fe, %g1, %g7
	.word 0xa3800007  ! 308: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe727e0a4  ! 309: STF_I	st	%f19, [0x00a4, %r31]
pmu_10_192:
	nop
	setx 0xfffff188fffff619, %g1, %g7
	.word 0xa3800007  ! 310: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68008a0  ! 311: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
pmu_10_193:
	nop
	setx 0xfffffa09fffff302, %g1, %g7
	.word 0xa3800007  ! 312: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_10_194-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_194:
	.word 0x91920010  ! 313: WRPR_PIL_R	wrpr	%r8, %r16, %pil
mondo_10_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d944011  ! 314: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
	.word 0xa9810012  ! 315: WR_SET_SOFTINT_R	wr	%r4, %r18, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_196) + 32, 16, 16)) -> intp(5,0,8)
intvec_10_196:
	.word 0x39400001  ! 316: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_197
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_197:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 317: RDPC	rd	%pc, %r17
mondo_10_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d908011  ! 318: WRPR_WSTATE_R	wrpr	%r2, %r17, %wstate
fpinit_10_199:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 319: FDIVs	fdivs	%f0, %f4, %f8
intveclr_10_200:
	setx 0xed099dc4d22205f8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 320: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7a00170  ! 321: FABSq	dis not found

intveclr_10_201:
	setx 0x04156e541c6f05c8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_202) + 32, 16, 16)) -> intp(5,0,4)
intvec_10_202:
	.word 0x39400001  ! 323: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_203:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 324: RDPC	rd	%pc, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_204) + 56, 16, 16)) -> intp(5,0,8)
intvec_10_204:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_205:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 326: RDPC	rd	%pc, %r20
	.word 0x99a509d0  ! 327: FDIVd	fdivd	%f20, %f16, %f12
	.word 0xdac7e008  ! 328: LDSWA_I	ldswa	[%r31, + 0x0008] %asi, %r13
	.word 0x83d020b3  ! 329: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0xe187c3e0  ! 330: LDFA_R	lda	[%r31, %r0], %f16
	.word 0x91d020b2  ! 331: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xda8008a0  ! 332: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x24c98001  ! 333: BRLEZ	brlez,a,pt	%r6,<label_0x98001>
	.word 0xa7b404c8  ! 334: FCMPNE32	fcmpne32	%d16, %d8, %r19
intveclr_10_209:
	setx 0x0d18b5b46e74bfc5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 335: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_210
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_210
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_210:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 336: RDPC	rd	%pc, %r16
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_211
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_211:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 337: CASA_R	casa	[%r31] %asi, %r19, %r11
pmu_10_212:
	nop
	setx 0xfffff729fffffbe9, %g1, %g7
	.word 0xa3800007  ! 338: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa1b40490  ! 339: FCMPLE32	fcmple32	%d16, %d16, %r16
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_213
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_213:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 340: CASA_R	casa	[%r31] %asi, %r18, %r16
intveclr_10_214:
	setx 0xd20f3de458f7d201, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 341: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_215
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_215:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 342: CASA_R	casa	[%r31] %asi, %r18, %r16
	.word 0xe08008a0  ! 343: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_10_216:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d950014  ! 344: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
DS_10_217:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 345: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_218:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 346: RDPC	rd	%pc, %r16
mondo_10_219:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d924012  ! 347: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
	.word 0xa7500000  ! 348: RDPR_TPC	rdpr	%tpc, %r19
	.word 0xda6fe066  ! 349: LDSTUB_I	ldstub	%r13, [%r31 + 0x0066]
	.word 0xda57c000  ! 350: LDSH_R	ldsh	[%r31 + %r0], %r13
jmptr_10_220:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 351: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_10_221:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83f58  ! 352: PREFETCHA_I	prefetcha	[%r0, + 0xffffff58] %asi, #one_read
intveclr_10_222:
	setx 0xddc46c7faf4f6526, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 353: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_223
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_223
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_223:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 354: RDPC	rd	%pc, %r13
	.word 0x9f802277  ! 355: SIR	sir	0x0277
donret_10_224:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_224-donret_10_224), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004afa18 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb94, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_224:
	.word 0xe6ffe0b8  ! 356: SWAPA_I	swapa	%r19, [%r31 + 0x00b8] %asi
	.word 0x9f803f37  ! 357: SIR	sir	0x1f37
debug_10_225:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_225:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_225
    nop
debug_wait10_225:
    ld [%r23], %r16
    brnz %r16, debug_wait10_225
    nop
    ba,a debug_startwait10_225
continue_debug_10_225:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_225:
    cmp %r13, %r17
    bne,a wait_for_stat_10_225
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_225:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_225
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x00000050d9c0e5d2,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe187c3e0  ! 358: LDFA_R	lda	[%r31, %r0], %f16
	rd %pc, %r19
	add %r19, (ivw_10_226-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_226:
	.word 0x91914008  ! 359: WRPR_PIL_R	wrpr	%r5, %r8, %pil
	.word 0xc3e88031  ! 360: PREFETCHA_R	prefetcha	[%r2, %r17] 0x01, #one_read
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_227:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e008  ! 361: CASA_R	casa	[%r31] %asi, %r8, %r8
	.word 0x93a00173  ! 362: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_228
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_228
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_228:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 363: RDPC	rd	%pc, %r17
	.word 0xe5e20034  ! 364: CASA_I	casa	[%r8] 0x 1, %r20, %r18
	.word 0xd137e0a4  ! 365: STQF_I	-	%f8, [0x00a4, %r31]
donret_10_230:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_230-donret_10_230), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00bcabf1 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb8d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_230:
	.word 0xd0ffe063  ! 366: SWAPA_I	swapa	%r8, [%r31 + 0x0063] %asi
change_to_randtl_10_231:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_231:
	.word 0x8f902002  ! 367: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xad84a8bb  ! 368: WR_SOFTINT_REG_I	wr	%r18, 0x08bb, %softint
	.word 0xa981800b  ! 369: WR_SET_SOFTINT_R	wr	%r6, %r11, %set_softint
	.word 0x8d903d7c  ! 370: WRPR_PSTATE_I	wrpr	%r0, 0x1d7c, %pstate
splash_lsu_10_232:
	set 0xf6f34d9b, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 371: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd137e0fa  ! 372: STQF_I	-	%f8, [0x00fa, %r31]
	.word 0x95a289c6  ! 373: FDIVd	fdivd	%f10, %f6, %f10
memptr_10_234:
	set user_data_start, %r31
	.word 0x8584beb6  ! 374: WRCCR_I	wr	%r18, 0x1eb6, %ccr
mondo_10_235:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d92c00c  ! 375: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
	.word 0xd337c000  ! 376: STQF_R	-	%f9, [%r0, %r31]
	.word 0xd317c000  ! 377: LDQF_R	-	[%r31, %r0], %f9
    set 0x1b1b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b187e6  ! 378: PDISTN	fmean16	%d6, %d6, %d20
	.word 0xd5e2c029  ! 379: CASA_I	casa	[%r11] 0x 1, %r9, %r10
	setx 0x6954986b0bb077e9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_237:
	.word 0x39400001  ! 380: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f802568  ! 381: SIR	sir	0x0568
	.word 0x95a0016d  ! 382: FABSq	dis not found

intveclr_10_238:
	setx 0x5c0b82c55071d024, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 383: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99a00167  ! 384: FABSq	dis not found

	.word 0x8d902753  ! 385: WRPR_PSTATE_I	wrpr	%r0, 0x0753, %pstate
splash_htba_10_239:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 386: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_240
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_240:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 387: RDPC	rd	%pc, %r10
	.word 0xd05fe030  ! 388: LDX_I	ldx	[%r31 + 0x0030], %r8
splash_cmpr_10_241:
	setx 0xf4fafb56010479d1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d020b3  ! 390: Tcc_I	tne	icc_or_xcc, %r0 + 179
splash_lsu_10_242:
	set 0x04294621, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 391: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_243
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_243
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_243:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 392: RDPC	rd	%pc, %r8
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_244
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_244:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e001  ! 393: CASA_R	casa	[%r31] %asi, %r1, %r9
debug_10_245:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_10_245:
	mov 0xa71, %r20
	mov 0x3, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd920  ! 394: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd257c000  ! 395: LDSH_R	ldsh	[%r31 + %r0], %r9
	.word 0x9f802ffc  ! 396: SIR	sir	0x0ffc
mondo_10_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d928013  ! 397: WRPR_WSTATE_R	wrpr	%r10, %r19, %wstate
	.word 0xd26fe0ff  ! 398: LDSTUB_I	ldstub	%r9, [%r31 + 0x00ff]
	.word 0xa9a0016a  ! 399: FABSq	dis not found

	.word 0xe2bfe010  ! 400: STDA_I	stda	%r17, [%r31 + 0x0010] %asi
	.word 0xe20fc000  ! 401: LDUB_R	ldub	[%r31 + %r0], %r17
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 402: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe317c000  ! 403: LDQF_R	-	[%r31, %r0], %f17
pmu_10_247:
	nop
	setx 0xfffff5ccfffffa83, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_10_248:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 405: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 406: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa5702b3d  ! 407: POPC_I	popc	0x0b3d, %r18
	.word 0xa9848011  ! 408: WR_SET_SOFTINT_R	wr	%r18, %r17, %set_softint
	.word 0x29800001  ! 409: FBL	fbl,a	<label_0x1>
intveclr_10_250:
	setx 0x2bd798dbd909e93a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 410: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91a1c9d3  ! 411: FDIVd	fdivd	%f38, %f50, %f8
	rd %pc, %r19
	add %r19, (ivw_10_251-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_251:
	.word 0x9195000b  ! 412: WRPR_PIL_R	wrpr	%r20, %r11, %pil
	.word 0x9f802b94  ! 413: SIR	sir	0x0b94
    set 0xaf8, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b287f4  ! 414: PDISTN	fmean16	%d10, %d20, %d20
	rd %pc, %r19
	add %r19, (ivw_10_252-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_252:
	.word 0x91948002  ! 415: WRPR_PIL_R	wrpr	%r18, %r2, %pil
	.word 0xe48fe010  ! 416: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r18
	.word 0x2a700001  ! 417: BPCS	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 418: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4800ba0  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r18
	.word 0xc187c3e0  ! 420: LDFA_R	lda	[%r31, %r0], %f0
change_to_randtl_10_253:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_253:
	.word 0x8f902000  ! 421: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x97a00172  ! 422: FABSq	dis not found

splash_hpstate_10_254:
	.word 0x8198200c  ! 423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000c, %hpstate
mondo_10_255:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d908004  ! 424: WRPR_WSTATE_R	wrpr	%r2, %r4, %wstate
	.word 0x9f80230f  ! 425: SIR	sir	0x030f
	.word 0x91454000  ! 426: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
intveclr_10_256:
	setx 0x3da9018ef452fa75, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 427: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_257:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 428: RDPC	rd	%pc, %r18
	rd %pc, %r19
	add %r19, (ivw_10_258-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_258:
	.word 0x91944008  ! 429: WRPR_PIL_R	wrpr	%r17, %r8, %pil
splash_cmpr_10_259:
	setx 0xa1b472cb5865f702, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 430: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7834008  ! 431: WR_GRAPHICS_STATUS_REG_R	wr	%r13, %r8, %-
	.word 0xe857c000  ! 432: LDSH_R	ldsh	[%r31 + %r0], %r20
	.word 0xa3540000  ! 433: RDPR_GL	<illegal instruction>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_261
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_261:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 434: CASA_R	casa	[%r31] %asi, %r16, %r9
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_262
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_262:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 435: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01972  ! 436: FqTOd	dis not found

	.word 0xa1a00167  ! 437: FABSq	dis not found

change_to_randtl_10_264:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_264:
	.word 0x8f902001  ! 438: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_10_265:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_265:
	.word 0x8f902000  ! 439: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_10_266:
	setx 0xa4c110292fbf7d9e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96af46b  ! 441: SDIVX_I	sdivx	%r11, 0xfffff46b, %r20
splash_cmpr_10_268:
	setx 0xfba705f3802cb263, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 442: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd127e0f0  ! 443: STF_I	st	%f8, [0x00f0, %r31]
	.word 0x83d02033  ! 444: Tcc_I	te	icc_or_xcc, %r0 + 51
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 445: Tcc_R	tne	icc_or_xcc, %r0 + %r30
jmptr_10_269:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 446: JMPL_R	jmpl	%r27 + %r0, %r27
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
	.word 0xa3414000  ! 447: RDPC	rd	%pc, %r17
	.word 0xd937e050  ! 448: STQF_I	-	%f12, [0x0050, %r31]
pmu_10_271:
	nop
	setx 0xfffffef3ffffffe4, %g1, %g7
	.word 0xa3800007  ! 449: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_10_272:
	nop
	setx 0xfffff685fffff21e, %g1, %g7
	.word 0xa3800007  ! 450: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_htba_10_273:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 451: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd89fe010  ! 452: LDDA_I	ldda	[%r31, + 0x0010] %asi, %r12
	.word 0x8d903ad1  ! 453: WRPR_PSTATE_I	wrpr	%r0, 0x1ad1, %pstate
	.word 0x99902004  ! 454: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
pmu_10_274:
	nop
	setx 0xfffffc2efffffa3d, %g1, %g7
	.word 0xa3800007  ! 455: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_10_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d94000d  ! 456: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
	.word 0xd88008a0  ! 457: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xe3e20026  ! 458: CASA_I	casa	[%r8] 0x 1, %r6, %r17
splash_lsu_10_277:
	set 0xe00be728, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 459: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd31fc000  ! 460: LDDF_R	ldd	[%r31, %r0], %f9
	rd %pc, %r19
	add %r19, (ivw_10_278-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_278:
	.word 0x91918001  ! 461: WRPR_PIL_R	wrpr	%r6, %r1, %pil
	.word 0xd277e0c3  ! 462: STX_I	stx	%r9, [%r31 + 0x00c3]
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
	.word 0x93414000  ! 463: RDPC	rd	%pc, %r9
	.word 0x24ccc001  ! 464: BRLEZ	brlez,a,pt	%r19,<label_0xcc001>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196c  ! 465: FqTOd	dis not found

splash_hpstate_10_282:
	.word 0x81982944  ! 466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0944, %hpstate
change_to_randtl_10_283:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_283:
	.word 0x8f902001  ! 467: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xda3fc000  ! 468: STD_R	std	%r13, [%r31 + %r0]
	.word 0x91d02033  ! 469: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x91d02033  ! 470: Tcc_I	ta	icc_or_xcc, %r0 + 51
intveclr_10_284:
	setx 0xdc6852dcbac11370, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 471: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_10_285:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d92c00a  ! 472: WRPR_WSTATE_R	wrpr	%r11, %r10, %wstate
	.word 0xda77c000  ! 473: STX_R	stx	%r13, [%r31 + %r0]
pmu_10_286:
	nop
	setx 0xfffff8acfffff5d1, %g1, %g7
	.word 0xa3800007  ! 474: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xdacfe008  ! 475: LDSBA_I	ldsba	[%r31, + 0x0008] %asi, %r13
	.word 0x9f80278d  ! 476: SIR	sir	0x078d
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 477: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdb37e023  ! 478: STQF_I	-	%f13, [0x0023, %r31]
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_287
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_287
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_287:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 479: RDPC	rd	%pc, %r10
splash_cmpr_10_288:
	setx 0xc1868d4dd5064005, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 480: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7480000  ! 481: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	rd %pc, %r19
	add %r19, (ivw_10_289-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_289:
	.word 0x9195000d  ! 482: WRPR_PIL_R	wrpr	%r20, %r13, %pil
donret_10_290:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_290-donret_10_290), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0083d330 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x454, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_290:
	.word 0xe8ffe0c3  ! 483: SWAPA_I	swapa	%r20, [%r31 + 0x00c3] %asi
	.word 0xd7e10033  ! 484: CASA_I	casa	[%r4] 0x 1, %r19, %r11
	.word 0xd497e038  ! 485: LDUHA_I	lduha	[%r31, + 0x0038] %asi, %r10
	.word 0xd51fc000  ! 486: LDDF_R	ldd	[%r31, %r0], %f10
	.word 0xa7804009  ! 487: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r9, %-
	.word 0xd527c000  ! 488: STF_R	st	%f10, [%r0, %r31]
splash_hpstate_10_293:
	.word 0x8198279e  ! 489: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079e, %hpstate
	.word 0xd46fe055  ! 490: LDSTUB_I	ldstub	%r10, [%r31 + 0x0055]
jmptr_10_294:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 491: JMPL_R	jmpl	%r27 + %r0, %r27
debug_10_295:
	nop
	ta T_CHANGE_HPRIV
debug_iva_10_295:
	mov 0x5ce, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+56), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe040  ! 492: STDFA_I	stda	%f0, [0x0040, %r31]
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_296
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_296:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 493: RDPC	rd	%pc, %r10
	.word 0x9f802f08  ! 494: SIR	sir	0x0f08
pmu_10_297:
	nop
	setx 0xfffffc89fffff667, %g1, %g7
	.word 0xa3800007  ! 495: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_10_298:
	setx 0x47112be1ce50dfe9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 496: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_10_299:
	setx 0x2ea5708ffb2e0cc7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 497: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe80fe000  ! 498: LDUB_I	ldub	[%r31 + 0x0000], %r20
	.word 0xa3a00172  ! 499: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01974  ! 500: FqTOd	dis not found

splash_cmpr_10_301:
	setx 0xeaad25f0fd87c47d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 501: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_10_302:
	setx 0xc39506bd1b7541be, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 502: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa745c000  ! 503: RD_TICK_CMPR_REG	rd	%-, %r19
	.word 0xd537c000  ! 504: STQF_R	-	%f10, [%r0, %r31]
	.word 0x9f802836  ! 505: SIR	sir	0x0836
	rd %pc, %r19
	add %r19, (ivw_10_303-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_303:
	.word 0x91914005  ! 506: WRPR_PIL_R	wrpr	%r5, %r5, %pil
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 507: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_10_304:
	setx 0x318e4fb7aa103d4f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 508: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_10_305:
	.word 0xa1a449ca  ! 1: FDIVd	fdivd	%f48, %f10, %f16
	pdist %f20, %f14, %f0
	.word 0x93b50312  ! 509: ALIGNADDRESS	alignaddr	%r20, %r18, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_306) + 0, 16, 16)) -> intp(2,0,12)
intvec_10_306:
	.word 0x39400001  ! 510: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_307:
	setx 0x29a3cada212e7ef3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 511: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f803d14  ! 512: SIR	sir	0x1d14
splash_lsu_10_308:
	set 0x3cbc76d6, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 513: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_10_309:
	setx 0xc8d5e00338b030a8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 514: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 515: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda8008a0  ! 516: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
pmu_10_310:
	nop
	setx 0xfffff217fffff01f, %g1, %g7
	.word 0xa3800007  ! 517: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38700001  ! 518: BPGU	<illegal instruction>
	.word 0xa780c010  ! 519: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r16, %-
	.word 0xda6fe0f8  ! 520: LDSTUB_I	ldstub	%r13, [%r31 + 0x00f8]
    set 0x1540, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b107f3  ! 521: PDISTN	fmean16	%d4, %d50, %d10
mondo_10_312:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d900000  ! 522: WRPR_WSTATE_R	wrpr	%r0, %r0, %wstate
donret_10_313:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_313-donret_10_313-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e42d35 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xcf, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_313:
	.word 0xdaffe0f0  ! 523: SWAPA_I	swapa	%r13, [%r31 + 0x00f0] %asi
	.word 0x9f803e48  ! 524: SIR	sir	0x1e48
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01962  ! 525: FqTOd	dis not found

	.word 0xdacfe008  ! 526: LDSBA_I	ldsba	[%r31, + 0x0008] %asi, %r13
	.word 0x9ba449d1  ! 527: FDIVd	fdivd	%f48, %f48, %f44
mondo_10_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d948002  ! 528: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
	.word 0xd41fe018  ! 529: LDD_I	ldd	[%r31 + 0x0018], %r10
	.word 0xd537e0c0  ! 530: STQF_I	-	%f10, [0x00c0, %r31]
DS_10_316:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd334e505  ! 1: STQF_I	-	%f9, [0x0505, %r19]
	normalw
	.word 0x99458000  ! 531: RD_SOFTINT_REG	rd	%softint, %r12
cwp_10_317:
    set user_data_start, %o7
	.word 0x93902002  ! 532: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_cmpr_10_318:
	setx 0x89732806697dffaa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 533: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_10_319:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_319-donret_10_319-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00712dd6 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x74e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_319:
	.word 0xdaffe0c4  ! 534: SWAPA_I	swapa	%r13, [%r31 + 0x00c4] %asi
	.word 0xa9a00165  ! 535: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 536: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xe28008a0  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
mondo_10_320:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d908011  ! 538: WRPR_WSTATE_R	wrpr	%r2, %r17, %wstate
	.word 0xc3ed0023  ! 539: PREFETCHA_R	prefetcha	[%r20, %r3] 0x01, #one_read
jmptr_10_322:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 540: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe4800a80  ! 541: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r18
pmu_10_323:
	nop
	setx 0xfffff227fffffb0b, %g1, %g7
	.word 0xa3800007  ! 542: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_10_324:
	set 0xf18ac44a, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 543: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_10_325:
	nop
	ta T_CHANGE_HPRIV
debug_iva_10_325:
	mov 0x738, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+56), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc187d960  ! 544: LDFA_R	lda	[%r31, %r0], %f0
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_326) + 16, 16, 16)) -> intp(7,0,0)
intvec_10_326:
	.word 0x39400001  ! 545: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_10_327:
	setx 0xeb26a44d5d673d85, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 546: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_10_328:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d934011  ! 547: WRPR_WSTATE_R	wrpr	%r13, %r17, %wstate
	.word 0xa4d4fe59  ! 548: UMULcc_I	umulcc 	%r19, 0xfffffe59, %r18
memptr_10_329:
	set 0x60540000, %r31
	.word 0x85833533  ! 549: WRCCR_I	wr	%r12, 0x1533, %ccr
	.word 0x9f80266b  ! 550: SIR	sir	0x066b
memptr_10_330:
	set user_data_start, %r31
	.word 0x858376c6  ! 551: WRCCR_I	wr	%r13, 0x16c6, %ccr
	.word 0xe1bfd960  ! 552: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x91a449d3  ! 553: FDIVd	fdivd	%f48, %f50, %f8
splash_cmpr_10_332:
	setx 0xfc3d8ef6d4be7f9c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 554: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a409c2  ! 555: FDIVd	fdivd	%f16, %f2, %f48
jmptr_10_333:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 556: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x93a489a9  ! 557: FDIVs	fdivs	%f18, %f9, %f9
	.word 0xd4800c80  ! 558: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01961  ! 559: FqTOd	dis not found

	.word 0xa5a349c9  ! 560: FDIVd	fdivd	%f44, %f40, %f18
debug_10_336:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_336:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_336
    nop
debug_wait10_336:
    ld [%r23], %r16
    brnz %r16, debug_wait10_336
    nop
    ba,a debug_startwait10_336
continue_debug_10_336:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_336:
    cmp %r13, %r17
    bne,a wait_for_stat_10_336
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_336:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_336
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x0000005004e5d20c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe040  ! 561: STDFA_I	stda	%f0, [0x0040, %r31]
	.word 0x93d020b3  ! 562: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0xda1fc000  ! 563: LDD_R	ldd	[%r31 + %r0], %r13
mondo_10_337:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d91c007  ! 564: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_338
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_338
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_338:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 565: RDPC	rd	%pc, %r18
	.word 0xc3683295  ! 566: PREFETCH_I	prefetch	[%r0 + 0xfffff295], #one_read
	.word 0xe657e038  ! 567: LDSH_I	ldsh	[%r31 + 0x0038], %r19
splash_hpstate_10_340:
	.word 0x81982b8d  ! 568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8d, %hpstate
	.word 0xe64fc000  ! 569: LDSB_R	ldsb	[%r31 + %r0], %r19
splash_lsu_10_341:
	set 0x3fd802fc, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 570: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
fpinit_10_342:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 571: FDIVs	fdivs	%f0, %f4, %f8
splash_lsu_10_343:
	set 0xfc78c4f4, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 572: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01974  ! 573: FqTOd	dis not found

	.word 0xd68008a0  ! 574: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_345)+0, 16, 16)) -> intp(4,1,3)
xir_10_345:
	.word 0xa9842b0c  ! 575: WR_SET_SOFTINT_I	wr	%r16, 0x0b0c, %set_softint
	.word 0xd677e040  ! 576: STX_I	stx	%r11, [%r31 + 0x0040]
jmptr_10_346:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 577: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xbe9937a398fdfc5b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_347:
	.word 0x39400001  ! 578: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 579: LDX_R	ldx	[%r31 + %r0], %r11
pmu_10_348:
	nop
	setx 0xfffffe2bfffff32e, %g1, %g7
	.word 0xa3800007  ! 580: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f8039f6  ! 581: SIR	sir	0x19f6
	.word 0x93d02033  ! 582: Tcc_I	tne	icc_or_xcc, %r0 + 51
DS_10_349:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 583: SAVE_R	save	%r31, %r0, %r31
pmu_10_350:
	nop
	setx 0xfffffbd5fffff948, %g1, %g7
	.word 0xa3800007  ! 584: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_10_351:
	taddcctv %r12, 0x14bb, %r19
	.word 0xd607e0dc  ! 585: LDUW_I	lduw	[%r31 + 0x00dc], %r11
	.word 0x87ac0a54  ! 586: FCMPd	fcmpd	%fcc<n>, %f16, %f20
	.word 0x24cc4001  ! 587: BRLEZ	brlez,a,pt	%r17,<label_0xc4001>
	.word 0x9bb484d4  ! 588: FCMPNE32	fcmpne32	%d18, %d20, %r13
splash_hpstate_10_354:
	.word 0x81982aa5  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0aa5, %hpstate
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 590: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_10_355:
	setx 0x45cd46886ccdc355, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 591: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4c7e038  ! 592: LDSWA_I	ldswa	[%r31, + 0x0038] %asi, %r18
	.word 0x8d902d39  ! 593: WRPR_PSTATE_I	wrpr	%r0, 0x0d39, %pstate
mondo_10_356:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d934014  ! 594: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
jmptr_10_357:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 595: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe4800b40  ! 596: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r18
jmptr_10_358:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 597: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_10_359:
	setx 0x346ee71020f417e3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 598: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_10_360:
	nop
	setx 0xfffffe5cfffffbce, %g1, %g7
	.word 0xa3800007  ! 599: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_361
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_361:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 600: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0xe4800c00  ! 601: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r18
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_362
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_362:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 602: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0x9f802dc9  ! 603: SIR	sir	0x0dc9
	.word 0xe53fe0e3  ! 604: STDF_I	std	%f18, [0x00e3, %r31]
	.word 0xe537c000  ! 605: STQF_R	-	%f18, [%r0, %r31]
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 606: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe51fe018  ! 607: LDDF_I	ldd	[%r31, 0x0018], %f18
	.word 0x8d903e19  ! 608: WRPR_PSTATE_I	wrpr	%r0, 0x1e19, %pstate
jmptr_10_363:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 609: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa3a249d4  ! 610: FDIVd	fdivd	%f40, %f20, %f48
intveclr_10_364:
	setx 0x09ef271e2e5450ee, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 611: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_365:
	setx 0x284033dd6accc928, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 612: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_10_366:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_366:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_366
    nop
debug_wait10_366:
    ld [%r23], %r16
    brnz %r16, debug_wait10_366
    nop
    ba,a debug_startwait10_366
continue_debug_10_366:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_366:
    cmp %r13, %r17
    bne,a wait_for_stat_10_366
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_366:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_366
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x0000005092d20c3c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe187de00  ! 613: LDFA_R	lda	[%r31, %r0], %f16
splash_cmpr_10_367:
	setx 0x2c9bcd237588a14d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 614: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc1bfe0c0  ! 615: STDFA_I	stda	%f0, [0x00c0, %r31]
	.word 0xe25fe030  ! 616: LDX_I	ldx	[%r31 + 0x0030], %r17
	.word 0x9145c000  ! 617: RD_TICK_CMPR_REG	rd	%-, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_368) + 8, 16, 16)) -> intp(6,0,27)
intvec_10_368:
	.word 0x39400001  ! 618: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda1fc000  ! 619: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xc187e040  ! 620: LDFA_I	lda	[%r31, 0x0040], %f0
splash_tba_10_369:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 621: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x97454000  ! 622: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
tagged_10_370:
	tsubcctv %r17, 0x10fc, %r13
	.word 0xe007e01c  ! 623: LDUW_I	lduw	[%r31 + 0x001c], %r16
memptr_10_371:
	set 0x60340000, %r31
	.word 0x85843b21  ! 624: WRCCR_I	wr	%r16, 0x1b21, %ccr
mondo_10_372:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d94c011  ! 625: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
	.word 0x91d02033  ! 626: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_htba_10_373:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 627: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_374
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_374:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00b  ! 628: CASA_R	casa	[%r31] %asi, %r11, %r16
	.word 0xa7454000  ! 629: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	.word 0xa9a00172  ! 630: FABSq	dis not found

	.word 0x93a449c9  ! 631: FDIVd	fdivd	%f48, %f40, %f40
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 632: LDX_R	ldx	[%r31 + %r0], %r19
cwp_10_375:
    set user_data_start, %o7
	.word 0x93902004  ! 633: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x81510000  ! 635: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe68008a0  ! 636: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	rd %pc, %r19
	add %r19, (ivw_10_376-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_376:
	.word 0x91910007  ! 637: WRPR_PIL_R	wrpr	%r4, %r7, %pil
intveclr_10_377:
	setx 0x1f5acf73d6415985, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 638: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 639: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_10_378:
	set 0x886c4166, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 640: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe6800b60  ! 641: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r19
	.word 0xe627e02b  ! 642: STW_I	stw	%r19, [%r31 + 0x002b]
	.word 0x91d020b4  ! 643: Tcc_I	ta	icc_or_xcc, %r0 + 180
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_379
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_379:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 644: CASA_R	casa	[%r31] %asi, %r16, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_380) + 32, 16, 16)) -> intp(1,0,21)
intvec_10_380:
	.word 0x39400001  ! 645: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa781c010  ! 646: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r16, %-
mondo_10_382:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d928011  ! 647: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56d2a5e  ! 648: SDIVX_I	sdivx	%r20, 0x0a5e, %r18
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
	.word 0x93414000  ! 649: RDPC	rd	%pc, %r9
	.word 0xd42fe0af  ! 650: STB_I	stb	%r10, [%r31 + 0x00af]
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 651: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96cbc8c  ! 652: SDIVX_I	sdivx	%r18, 0xfffffc8c, %r20
splash_lsu_10_386:
	set 0x825c7203, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 653: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1e00031  ! 654: CASA_I	casa	[%r0] 0x 1, %r17, %r16
	.word 0x9745c000  ! 655: RD_TICK_CMPR_REG	rd	%-, %r11
splash_lsu_10_388:
	set 0x3f84cab6, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 656: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa745c000  ! 657: RD_TICK_CMPR_REG	rd	%-, %r19
	.word 0x9a852ebc  ! 658: ADDcc_I	addcc 	%r20, 0x0ebc, %r13
debug_10_389:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_10_389:
	mov 0xecb, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe060  ! 659: STDFA_I	stda	%f0, [0x0060, %r31]
	.word 0xe8800a80  ! 660: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r20
jmptr_10_390:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 661: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_10_391:
	nop
	setx 0xfffff08efffff6a9, %g1, %g7
	.word 0xa3800007  ! 662: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99540000  ! 663: RDPR_GL	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_10_392-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_392:
	.word 0x91924014  ! 664: WRPR_PIL_R	wrpr	%r9, %r20, %pil
splash_lsu_10_393:
	set 0x8537bdab, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 665: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_10_394:
	nop
	setx 0xfffffa9bfffffe28, %g1, %g7
	.word 0xa3800007  ! 666: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_395
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_395:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 667: CASA_R	casa	[%r31] %asi, %r12, %r13
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_396
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_396:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 668: CASA_R	casa	[%r31] %asi, %r12, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 669: LDX_R	ldx	[%r31 + %r0], %r13
splash_cmpr_10_397:
	setx 0xd3a2426fc6eb1473, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 670: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_10_398:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 671: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_399
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_399
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_399:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 672: RDPC	rd	%pc, %r10
    set 0x3a8b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b207e8  ! 673: PDISTN	fmean16	%d8, %d8, %d40
	.word 0x95a00172  ! 674: FABSq	dis not found

mondo_10_400:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d94c011  ! 675: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
	rd %pc, %r19
	add %r19, (ivw_10_401-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_401:
	.word 0x91948009  ! 676: WRPR_PIL_R	wrpr	%r18, %r9, %pil
mondo_10_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d948003  ! 677: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
fpinit_10_403:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82678  ! 678: PREFETCHA_I	prefetcha	[%r0, + 0x0678] %asi, #one_read
    set 0x12be, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b447f3  ! 679: PDISTN	fmean16	%d48, %d50, %d16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01969  ! 680: FqTOd	dis not found

cwp_10_405:
    set user_data_start, %o7
	.word 0x93902007  ! 681: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_406
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_406:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 682: CASA_R	casa	[%r31] %asi, %r5, %r17
splash_cmpr_10_407:
	setx 0xcd48625b8fcc7d87, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 683: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_10_408:
	set 0xd23ce35b, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 684: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 685: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x93500000  ! 686: RDPR_TPC	<illegal instruction>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_409:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 687: RDPC	rd	%pc, %r13
	.word 0x97480000  ! 688: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_410
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_410:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 689: CASA_R	casa	[%r31] %asi, %r5, %r18
fpinit_10_411:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82678  ! 690: PREFETCHA_I	prefetcha	[%r0, + 0x0678] %asi, #one_read
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_412
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_412:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 691: CASA_R	casa	[%r31] %asi, %r5, %r18
jmptr_10_413:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 692: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_10_414:
	nop
	setx 0xfffff31ffffff1eb, %g1, %g7
	.word 0xa3800007  ! 693: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_10_415-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_415:
	.word 0x91948011  ! 694: WRPR_PIL_R	wrpr	%r18, %r17, %pil
splash_hpstate_10_416:
	.word 0x819821c5  ! 695: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c5, %hpstate
donret_10_417:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_417-donret_10_417-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e1862b | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x595, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_417:
	.word 0xe4ffe078  ! 696: SWAPA_I	swapa	%r18, [%r31 + 0x0078] %asi
debug_10_418:
	nop
	ta T_CHANGE_HPRIV
debug_iva_10_418:
	mov 0x79e, %r20
	mov 0x19, %r19
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
	.word 0xe187dc00  ! 697: LDFA_R	lda	[%r31, %r0], %f16
pmu_10_419:
	nop
	setx 0xfffffda9fffffa4a, %g1, %g7
	.word 0xa3800007  ! 698: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_10_420:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d94c00a  ! 699: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
	.word 0x93540000  ! 700: RDPR_GL	rdpr	%-, %r9
DS_10_421:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe93432a5  ! 1: STQF_I	-	%f20, [0x12a5, %r16]
	normalw
	.word 0xa5458000  ! 701: RD_SOFTINT_REG	rd	%softint, %r18
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xab842828  ! 1: WR_CLEAR_SOFTINT_I	wr	%r16, 0x0828, %clear_softint
	fble skip_8_0
	.word 0xe03c000b  ! 1: STD_R	std	%r16, [%r16 + %r11]
.align 1024
skip_8_0:
	.word 0x24cc8001  ! 2: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 3: LDX_R	ldx	[%r31 + %r0], %r18
intveclr_8_1:
	setx 0x36a2c7a98e692b6c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 4: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_8_2:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_8_2:
	mov 0x8b9, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe187dc00  ! 5: LDFA_R	lda	[%r31, %r0], %f16
splash_lsu_8_3:
	set 0xfb48456e, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 6: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_8_4:
	setx 0x712bd1076032a67b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_8_5:
	setx 0x78a76ea9598b8ec0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 8: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_8_6:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe187c3e0  ! 9: LDFA_R	lda	[%r31, %r0], %f16
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_7:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 10: RDPC	rd	%pc, %r19
intveclr_8_8:
	setx 0x870ed09d9c9a5e1e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 11: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_9
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_9:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 12: RDPC	rd	%pc, %r8
	.word 0xe81fc000  ! 13: LDD_R	ldd	[%r31 + %r0], %r20
unsupttte8_10:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87aa4a41  ! 14: FCMPd	fcmpd	%fcc<n>, %f40, %f32
	.word 0x9f80238e  ! 15: SIR	sir	0x038e
	.word 0xe69fd920  ! 16: LDDA_R	ldda	[%r31, %r0] 0xc9, %r19
	setx 0x05449785dba5f45d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_11:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_8_12:
	setx 0x87d657e46e8e3377, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 18: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_13
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_13:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 19: CASA_R	casa	[%r31] %asi, %r16, %r19
	.word 0xab818012  ! 20: WR_CLEAR_SOFTINT_R	wr	%r6, %r18, %clear_softint
	.word 0x95a509a4  ! 21: FDIVs	fdivs	%f20, %f4, %f10
intveclr_8_14:
	setx 0xfdcb3d2826b7b554, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 22: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 23: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_8_15:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d90c013  ! 24: WRPR_WSTATE_R	wrpr	%r3, %r19, %wstate
jmptr_8_16:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 25: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_8_17:
	nop
	setx 0xfffff4b3fffff596, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd46fe025  ! 27: LDSTUB_I	ldstub	%r10, [%r31 + 0x0025]
	.word 0x83d02034  ! 28: Tcc_I	te	icc_or_xcc, %r0 + 52
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 29: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_8_18:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0c0  ! 30: STDFA_I	stda	%f0, [0x00c0, %r31]
	setx 0x2e1a5858c222d23b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_19:
	.word 0x39400001  ! 31: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfdc00  ! 32: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x91d020b4  ! 33: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xa9a349c8  ! 34: FDIVd	fdivd	%f44, %f8, %f20
splash_cmpr_8_20:
	setx 0xf698d239c4dc1378, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 35: WR_STICK_REG_R	wr	%r0, %r1, %-
jmptr_8_21:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 36: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_22:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 37: CASA_R	casa	[%r31] %asi, %r17, %r17
splash_hpstate_8_23:
	.word 0x8198249d  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049d, %hpstate
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_24:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 39: CASA_R	casa	[%r31] %asi, %r17, %r17
mondo_8_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d948002  ! 40: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
	.word 0xe257c000  ! 41: LDSH_R	ldsh	[%r31 + %r0], %r17
splash_cmpr_8_26:
	setx 0x1787b6b593be0bc7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 42: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe33fc000  ! 43: STDF_R	std	%f17, [%r0, %r31]
	.word 0xab842f8c  ! 44: WR_CLEAR_SOFTINT_I	wr	%r16, 0x0f8c, %clear_softint
splash_hpstate_8_27:
	.word 0x819820c7  ! 45: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c7, %hpstate
change_to_randtl_8_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_28:
	.word 0x8f902000  ! 46: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_8_29:
	setx 0x3b0030deb34b8d69, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 47: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_30:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e008  ! 48: CASA_R	casa	[%r31] %asi, %r8, %r17
intveclr_8_31:
	setx 0x7965837799fbcc95, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 49: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_32) + 40, 16, 16)) -> intp(7,0,28)
intvec_8_32:
	.word 0x39400001  ! 50: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 51: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9f802373  ! 52: SIR	sir	0x0373
unsupttte8_33:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87aa0a54  ! 53: FCMPd	fcmpd	%fcc<n>, %f8, %f20
	.word 0xa3b48492  ! 54: FCMPLE32	fcmple32	%d18, %d18, %r17
invtsb_8_34:
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
	.word 0x29800001  ! 55: FBL	fbl,a	<label_0x1>
	.word 0x9f803927  ! 56: SIR	sir	0x1927
intveclr_8_35:
	setx 0xa6f10927ec0cea10, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 57: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_8_36:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 58: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
memptr_8_37:
	set 0x60740000, %r31
	.word 0x8582a4ef  ! 59: WRCCR_I	wr	%r10, 0x04ef, %ccr
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_38:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 60: RDPC	rd	%pc, %r9
	.word 0xe44fc000  ! 61: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe537c000  ! 62: STQF_R	-	%f18, [%r0, %r31]
mondo_8_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d950005  ! 63: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	.word 0xe46fe0fe  ! 64: LDSTUB_I	ldstub	%r18, [%r31 + 0x00fe]
jmptr_8_40:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 65: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01973  ! 66: FqTOd	dis not found

	.word 0xd8800ac0  ! 67: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r12
	.word 0x9f802f60  ! 68: SIR	sir	0x0f60
intveclr_8_42:
	setx 0x9ac0675a90be7a08, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_43:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e007  ! 70: CASA_R	casa	[%r31] %asi, %r7, %r12
splash_lsu_8_44:
	set 0x1c30f9a8, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 71: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_8_45:
	nop
	setx 0xfffff553fffffe39, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_8_46:
	setx 0x82e649dbde720f9f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_8_47-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_47:
	.word 0x91950013  ! 74: WRPR_PIL_R	wrpr	%r20, %r19, %pil
invtsb_8_48:
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
	.word 0x29800001  ! 75: FBL	fbl,a	<label_0x1>
	bleu  	 skip_8_49
	fble,a,pn	%fcc0,  skip_8_49
.align 32
skip_8_49:
	.word 0x87a80a45  ! 76: FCMPd	fcmpd	%fcc<n>, %f0, %f36
mondo_8_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d948001  ! 77: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
	.word 0x91a449c6  ! 78: FDIVd	fdivd	%f48, %f6, %f8
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_51
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_51
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_51:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 79: RDPC	rd	%pc, %r9
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_52:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e004  ! 80: CASA_R	casa	[%r31] %asi, %r4, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_53)+8, 16, 16)) -> intp(4,1,3)
xir_8_53:
	.word 0xa984a729  ! 81: WR_SET_SOFTINT_I	wr	%r18, 0x0729, %set_softint
	.word 0xe8d7e020  ! 82: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r20
	.word 0x3e800001  ! 83: BVC	bvc,a	<label_0x1>
	.word 0xe937c000  ! 84: STQF_R	-	%f20, [%r0, %r31]
	.word 0xa7454000  ! 85: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	.word 0xda47e030  ! 86: LDSW_I	ldsw	[%r31 + 0x0030], %r13
pmu_8_54:
	nop
	setx 0xfffff86afffff427, %g1, %g7
	.word 0xa3800007  ! 87: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f803de3  ! 88: SIR	sir	0x1de3
	setx 0x49543f32453208df, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_55:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_56:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e004  ! 90: CASA_R	casa	[%r31] %asi, %r4, %r13
mondo_8_57:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d904004  ! 91: WRPR_WSTATE_R	wrpr	%r1, %r4, %wstate
splash_hpstate_8_58:
	.word 0x81982355  ! 92: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0355, %hpstate
	.word 0xda9fc400  ! 93: LDDA_R	ldda	[%r31, %r0] 0x20, %r13
	.word 0x9ba00162  ! 94: FABSq	dis not found

	.word 0xd26fe0fe  ! 95: LDSTUB_I	ldstub	%r9, [%r31 + 0x00fe]
	setx 0x96f03f3b6e9f9ee9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_59:
	.word 0x39400001  ! 96: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd26fe01f  ! 97: LDSTUB_I	ldstub	%r9, [%r31 + 0x001f]
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 98: Tcc_R	te	icc_or_xcc, %r0 + %r30
fpinit_8_60:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 99: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xc3ec402c  ! 100: PREFETCHA_R	prefetcha	[%r17, %r12] 0x01, #one_read
DS_8_61:
	.word 0xa1a149c9  ! 1: FDIVd	fdivd	%f36, %f40, %f16
	pdist %f30, %f28, %f6
	.word 0xa3b50312  ! 101: ALIGNADDRESS	alignaddr	%r20, %r18, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01970  ! 102: FqTOd	dis not found

pmu_8_63:
	nop
	setx 0xfffffe82fffffdcc, %g1, %g7
	.word 0xa3800007  ! 103: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_8_64:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x816d09bc	! Random illegal ?
	.word 0xd7148010  ! 1: LDQF_R	-	[%r18, %r16], %f11
	.word 0xa3a24833  ! 104: FADDs	fadds	%f9, %f19, %f17
	.word 0x99902004  ! 105: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xa3b00491  ! 106: FCMPLE32	fcmple32	%d0, %d48, %r17
	.word 0x9f802ad3  ! 107: SIR	sir	0x0ad3
	.word 0xd827e08d  ! 108: STW_I	stw	%r12, [%r31 + 0x008d]
debug_8_65:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_8_65:
	mov 0x92c, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd960  ! 109: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd81fc000  ! 110: LDD_R	ldd	[%r31 + %r0], %r12
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_66:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 111: CASA_R	casa	[%r31] %asi, %r16, %r12
change_to_randtl_8_67:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_67:
	.word 0x8f902002  ! 112: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_8_68:
	setx 0xaef4af4aaa19ed3f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 113: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_8_69:
	setx 0xc802f0111cdd0a97, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 114: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_70
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_70:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 115: RDPC	rd	%pc, %r17
pmu_8_71:
	nop
	setx 0xfffff2b9fffffb60, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01974  ! 117: FqTOd	dis not found

	.word 0xe527e0b8  ! 118: STF_I	st	%f18, [0x00b8, %r31]
mondo_8_73:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d91c00c  ! 119: WRPR_WSTATE_R	wrpr	%r7, %r12, %wstate
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_74:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 120: CASA_R	casa	[%r31] %asi, %r13, %r18
splash_lsu_8_75:
	set 0x7de05e7c, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 121: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa985000a  ! 122: WR_SET_SOFTINT_R	wr	%r20, %r10, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_76) + 56, 16, 16)) -> intp(6,0,25)
intvec_8_76:
	.word 0x39400001  ! 123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_8_77:
	nop
	setx 0xfffff05bfffff08f, %g1, %g7
	.word 0xa3800007  ! 124: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_8_78:
	nop
	setx 0xfffff15afffff5a8, %g1, %g7
	.word 0xa3800007  ! 125: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
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
	.word 0xe5e7e013  ! 126: CASA_R	casa	[%r31] %asi, %r19, %r18
pmu_8_80:
	nop
	setx 0xfffffcf2fffffe9f, %g1, %g7
	.word 0xa3800007  ! 127: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_8_81:
	set 0x86d52ab8, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 128: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_8_82:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 129: RESTORE_R	restore	%r31, %r0, %r31
debug_8_83:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_8_83:
	mov 0xa31, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe187d920  ! 130: LDFA_R	lda	[%r31, %r0], %f16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936d3491  ! 131: SDIVX_I	sdivx	%r20, 0xfffff491, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 132: LDX_R	ldx	[%r31 + %r0], %r16
change_to_randtl_8_85:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_85:
	.word 0x8f902000  ! 133: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_8_86:
	setx 0x94967ba003f4b106, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 134: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a089d0  ! 135: FDIVd	fdivd	%f2, %f16, %f48
cwp_8_87:
    set user_data_start, %o7
	.word 0x93902002  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x26700001  ! 137: BPL	<illegal instruction>
	.word 0xd69fe030  ! 138: LDDA_I	ldda	[%r31, + 0x0030] %asi, %r11
mondo_8_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d94c00a  ! 139: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9169f439  ! 140: SDIVX_I	sdivx	%r7, 0xfffff439, %r8
	.word 0xc1bfe080  ! 141: STDFA_I	stda	%f0, [0x0080, %r31]
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_90:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e004  ! 142: CASA_R	casa	[%r31] %asi, %r4, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01968  ! 143: FqTOd	dis not found

	.word 0xd41fe008  ! 144: LDD_I	ldd	[%r31 + 0x0008], %r10
splash_tba_8_92:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 145: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	bg,a	 skip_8_93
	.word 0x87ad0a54  ! 1: FCMPd	fcmpd	%fcc<n>, %f20, %f20
.align 2048
skip_8_93:
	.word 0x24cc0001  ! 146: BRLEZ	brlez,a,pt	%r16,<label_0xc0001>
splash_decr_8_94:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r9, [%r1] 0x45
	.word 0xa7848013  ! 147: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r19, %-
	.word 0xc187e040  ! 148: LDFA_I	lda	[%r31, 0x0040], %f0
	.word 0xd08008a0  ! 149: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x95454000  ! 150: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
pmu_8_95:
	nop
	setx 0xfffffe78fffff0aa, %g1, %g7
	.word 0xa3800007  ! 151: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa1a149e2  ! 152: FDIVq	dis not found

splash_lsu_8_96:
	set 0x3855a48c, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 153: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_97:
	setx 0x1826549babf790e3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 154: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab848013  ! 155: WR_CLEAR_SOFTINT_R	wr	%r18, %r19, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_98) + 24, 16, 16)) -> intp(1,0,11)
intvec_8_98:
	.word 0x39400001  ! 156: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 157: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_99
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_99:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e007  ! 159: CASA_R	casa	[%r31] %asi, %r7, %r18
	.word 0x91a249d4  ! 160: FDIVd	fdivd	%f40, %f20, %f8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_100) + 40, 16, 16)) -> intp(3,0,22)
intvec_8_100:
	.word 0x39400001  ! 161: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3454000  ! 162: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0x81460000  ! 163: RD_STICK_REG	stbar
	.word 0x87ad0a4c  ! 164: FCMPd	fcmpd	%fcc<n>, %f20, %f12
mondo_8_101:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d944009  ! 165: WRPR_WSTATE_R	wrpr	%r17, %r9, %wstate
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_102
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_102:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 166: RDPC	rd	%pc, %r18
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_103:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 167: CASA_R	casa	[%r31] %asi, %r6, %r9
	rd %pc, %r19
	add %r19, (ivw_8_104-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_104:
	.word 0x91950011  ! 168: WRPR_PIL_R	wrpr	%r20, %r17, %pil
splash_decr_8_105:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r20, [%r1] 0x45
	.word 0xa7848010  ! 169: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r16, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_106)+40, 16, 16)) -> intp(4,1,3)
xir_8_106:
	.word 0xa9853435  ! 170: WR_SET_SOFTINT_I	wr	%r20, 0x1435, %set_softint
	.word 0xd327c000  ! 171: STF_R	st	%f9, [%r0, %r31]
	.word 0xd2800c20  ! 172: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 173: LDX_R	ldx	[%r31 + %r0], %r9
	rd %pc, %r19
	add %r19, (ivw_8_107-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_107:
	.word 0x91930011  ! 174: WRPR_PIL_R	wrpr	%r12, %r17, %pil
	.word 0xd2800ae0  ! 175: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r9
splash_lsu_8_108:
	set 0x0e222c04, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 176: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_109:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 177: CASA_R	casa	[%r31] %asi, %r6, %r9
pmu_8_110:
	nop
	setx 0xfffffaf1fffffcf1, %g1, %g7
	.word 0xa3800007  ! 178: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_8_111:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd920  ! 179: STDFA_R	stda	%f16, [%r0, %r31]
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_112:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 180: CASA_R	casa	[%r31] %asi, %r6, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_113)+56, 16, 16)) -> intp(4,1,3)
xir_8_113:
	.word 0xa9852785  ! 181: WR_SET_SOFTINT_I	wr	%r20, 0x0785, %set_softint
memptr_8_114:
	set user_data_start, %r31
	.word 0x858474e3  ! 182: WRCCR_I	wr	%r17, 0x14e3, %ccr
mondo_8_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d90c014  ! 183: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_116) + 40, 16, 16)) -> intp(3,0,27)
intvec_8_116:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_8_117:
	set 0x5d13560c, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_118:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 186: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0xd237e0d3  ! 187: STH_I	sth	%r9, [%r31 + 0x00d3]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 188: LDX_R	ldx	[%r31 + %r0], %r9
jmptr_8_119:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 189: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd28008a0  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xe187e0a0  ! 191: LDFA_I	lda	[%r31, 0x00a0], %f16
cwp_8_120:
    set user_data_start, %o7
	.word 0x93902002  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
mondo_8_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d944010  ! 193: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
mondo_8_122:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d904012  ! 194: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
DS_8_123:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x93b08314  ! 195: ALIGNADDRESS	alignaddr	%r2, %r20, %r9
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 196: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_124
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_124:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 197: RDPC	rd	%pc, %r20
	.word 0xa750c000  ! 198: RDPR_TT	rdpr	%tt, %r19
invtsb_8_125:
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
	.word 0x29800001  ! 199: FBL	fbl,a	<label_0x1>
DS_8_126:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 200: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_8_127-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_127:
	.word 0x91924003  ! 201: WRPR_PIL_R	wrpr	%r9, %r3, %pil
mondo_8_128:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d900004  ! 202: WRPR_WSTATE_R	wrpr	%r0, %r4, %wstate
splash_lsu_8_129:
	set 0x6f0b25cd, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 203: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_8_130:
	set 0x4a2a442c, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 204: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 205: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_8_131:
	setx 0x4bd5a3f7ee837ade, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 206: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_132
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_132:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e007  ! 207: CASA_R	casa	[%r31] %asi, %r7, %r13
splash_cmpr_8_133:
	setx 0x05c9ed349985c53a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_8_134:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_134-donret_8_134), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d51a75 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x9d4, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_134:
	.word 0xdaffe0a8  ! 209: SWAPA_I	swapa	%r13, [%r31 + 0x00a8] %asi
splash_decr_8_135:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r19, [%r1] 0x45
	.word 0xa785000b  ! 210: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r11, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_136) + 16, 16, 16)) -> intp(3,0,11)
intvec_8_136:
	.word 0x39400001  ! 211: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	fbl skip_8_137
	fbule,a,pn	%fcc0,  skip_8_137
.align 128
skip_8_137:
	.word 0x24c9c001  ! 212: BRLEZ	brlez,a,pt	%r7,<label_0x9c001>
splash_cmpr_8_138:
	setx 0xaee3384e34feb53c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 213: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_8_139:
	set 0x0dff27df, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 214: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902a13  ! 215: WRPR_PSTATE_I	wrpr	%r0, 0x0a13, %pstate
	.word 0xd8800be0  ! 216: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r12
	.word 0xd88fe028  ! 217: LDUBA_I	lduba	[%r31, + 0x0028] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_140
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_140:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 218: RDPC	rd	%pc, %r9
	.word 0x9f803b29  ! 219: SIR	sir	0x1b29
mondo_8_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d924014  ! 220: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
jmptr_8_142:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 221: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe46fe03e  ! 222: LDSTUB_I	ldstub	%r18, [%r31 + 0x003e]
	.word 0xe4800b00  ! 223: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r18
	.word 0x9f8034a6  ! 224: SIR	sir	0x14a6
intveclr_8_143:
	setx 0x7de39f809fbf79e0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_144:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 226: CASA_R	casa	[%r31] %asi, %r0, %r18
splash_lsu_8_145:
	set 0x2b041300, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 227: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_146
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_146
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_146:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 228: RDPC	rd	%pc, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 229: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe6800bc0  ! 230: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r19
intveclr_8_147:
	setx 0xddd3b237c466d3dd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 231: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	brlz,pt  	%r5, skip_8_148
	brlez,pt  	%r17, skip_8_148
.align 2048
skip_8_148:
	.word 0x39400001  ! 232: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_149:
	setx 0x585ebfe74c74085a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 233: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_150) + 8, 16, 16)) -> intp(7,0,29)
intvec_8_150:
	.word 0x39400001  ! 234: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_8_151:
	nop
	setx 0xfffffc29fffff3cd, %g1, %g7
	.word 0xa3800007  ! 235: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b4  ! 236: Tcc_I	ta	icc_or_xcc, %r0 + 180
intveclr_8_152:
	setx 0xf3e5b4306e98e056, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 237: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36ce780  ! 238: SDIVX_I	sdivx	%r19, 0x0780, %r17
pmu_8_154:
	nop
	setx 0xfffff7fdfffffc13, %g1, %g7
	.word 0xa3800007  ! 239: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe28008a0  ! 240: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xc3ecc028  ! 241: PREFETCHA_R	prefetcha	[%r19, %r8] 0x01, #one_read
	.word 0xd727c000  ! 242: STF_R	st	%f11, [%r0, %r31]
	.word 0xe187e0c0  ! 243: LDFA_I	lda	[%r31, 0x00c0], %f16
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_155:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r11
	.word 0x99902003  ! 245: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
DS_8_156:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe934ffcb  ! 1: STQF_I	-	%f20, [0x1fcb, %r19]
	normalw
	.word 0x99458000  ! 246: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xa5a4c9a7  ! 247: FDIVs	fdivs	%f19, %f7, %f18
	fbo,a,pn	%fcc0,  skip_8_157
	fbg,a,pn	%fcc0,  skip_8_157
.align 32
skip_8_157:
	.word 0xe63c0005  ! 248: STD_R	std	%r19, [%r16 + %r5]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 249: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd527c000  ! 250: STF_R	st	%f10, [%r0, %r31]
	.word 0x83d020b5  ! 251: Tcc_I	te	icc_or_xcc, %r0 + 181
intveclr_8_158:
	setx 0x52d3fc09cce42991, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 252: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_159:
	setx 0xeb46570a711a667a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_8_160:
	setx 0xbcef321a55ca6233, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 254: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802074  ! 255: SIR	sir	0x0074
intveclr_8_161:
	setx 0xcf062db426466c7f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 256: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_8_162:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdd6f1bf5	! Random illegal ?
	.word 0x97a00551  ! 1: FSQRTd	fsqrt	
	.word 0x97a50822  ! 257: FADDs	fadds	%f20, %f2, %f11
	.word 0x9f80235b  ! 258: SIR	sir	0x035b
	.word 0xe257c000  ! 259: LDSH_R	ldsh	[%r31 + %r0], %r17
splash_lsu_8_163:
	set 0x68647c08, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 260: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	brgz,pn  	%r4, skip_8_164
	fbue skip_8_164
.align 2048
skip_8_164:
	.word 0x99a089d1  ! 261: FDIVd	fdivd	%f2, %f48, %f12
	.word 0x81460000  ! 262: RD_STICK_REG	stbar
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96cb0ec  ! 263: SDIVX_I	sdivx	%r18, 0xfffff0ec, %r20
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_166:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 264: CASA_R	casa	[%r31] %asi, %r19, %r9
	.word 0x9ba509d1  ! 265: FDIVd	fdivd	%f20, %f48, %f44
intveclr_8_167:
	setx 0x8a2db64fc92471e8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 266: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1450000  ! 267: RD_SET_SOFTINT	rd	%set_softint, %r16
splash_hpstate_8_168:
	.word 0x8198298f  ! 268: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098f, %hpstate
splash_htba_8_169:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 269: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_8_170:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe5348011  ! 1: STQF_R	-	%f18, [%r17, %r18]
	normalw
	.word 0x97458000  ! 270: RD_SOFTINT_REG	rd	%softint, %r11
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_171
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_171:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 271: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0x91d020b2  ! 272: Tcc_I	ta	icc_or_xcc, %r0 + 178
mondo_8_172:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d91c014  ! 273: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
	.word 0xa1a00163  ! 274: FABSq	dis not found

	setx 0x2f7c6b8e6610e42c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_173:
	.word 0x39400001  ! 275: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_8_174:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_174-donret_8_174), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e3d296 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd16, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_174:
	.word 0xe6ffe0b0  ! 276: SWAPA_I	swapa	%r19, [%r31 + 0x00b0] %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01963  ! 277: FqTOd	dis not found

splash_cmpr_8_176:
	setx 0xa4f1a7253a20c12e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_8_177:
	setx 0xf7a674b04e70b07d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 279: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 280: LDX_R	ldx	[%r31 + %r0], %r18
fpinit_8_178:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 281: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xe4800c20  ! 282: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r18
	.word 0x83d020b4  ! 283: Tcc_I	te	icc_or_xcc, %r0 + 180
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_179
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_179:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 284: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0xa7a009c9  ! 285: FDIVd	fdivd	%f0, %f40, %f50
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_180) + 8, 16, 16)) -> intp(3,0,2)
intvec_8_180:
	.word 0x39400001  ! 286: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91450000  ! 287: RD_SET_SOFTINT	rd	%set_softint, %r8
fpinit_8_181:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 288: FDIVd	fdivd	%f0, %f4, %f6
	.word 0xe28fe028  ! 289: LDUBA_I	lduba	[%r31, + 0x0028] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_182
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_182:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 290: RDPC	rd	%pc, %r12
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 291: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0x9f802d2a  ! 292: SIR	sir	0x0d2a
splash_cmpr_8_184:
	setx 0x835bb2875e2152a0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 293: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_8_185:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_185-donret_8_185-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008df2ef | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x647, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_185:
	.word 0xd6ffe0c0  ! 294: SWAPA_I	swapa	%r11, [%r31 + 0x00c0] %asi
	.word 0xd737c000  ! 295: STQF_R	-	%f11, [%r0, %r31]
	.word 0xd727e044  ! 296: STF_I	st	%f11, [0x0044, %r31]
	.word 0xd66fe0cc  ! 297: LDSTUB_I	ldstub	%r11, [%r31 + 0x00cc]
splash_lsu_8_186:
	set 0xb85e5d7c, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc187e0e0  ! 299: LDFA_I	lda	[%r31, 0x00e0], %f0
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 300: LDX_R	ldx	[%r31 + %r0], %r11
intveclr_8_187:
	setx 0x36e614cdf095ca18, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_8_188:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_8_188:
	mov 0x941, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe000  ! 302: STDFA_I	stda	%f0, [0x0000, %r31]
	setx 0xe0efb1446413da4e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_189:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90297e  ! 304: WRPR_PSTATE_I	wrpr	%r0, 0x097e, %pstate
DS_8_190:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd534fca6  ! 1: STQF_I	-	%f10, [0x1ca6, %r19]
	normalw
	.word 0xa7458000  ! 305: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0xe65fe000  ! 306: LDX_I	ldx	[%r31 + 0x0000], %r19
	.word 0xe6bfe0a0  ! 307: STDA_I	stda	%r19, [%r31 + 0x00a0] %asi
pmu_8_191:
	nop
	setx 0xfffff5f2fffff9fc, %g1, %g7
	.word 0xa3800007  ! 308: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe727e034  ! 309: STF_I	st	%f19, [0x0034, %r31]
pmu_8_192:
	nop
	setx 0xfffff1fefffff632, %g1, %g7
	.word 0xa3800007  ! 310: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe6800ac0  ! 311: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r19
pmu_8_193:
	nop
	setx 0xfffff368fffff402, %g1, %g7
	.word 0xa3800007  ! 312: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_8_194-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_194:
	.word 0x91904013  ! 313: WRPR_PIL_R	wrpr	%r1, %r19, %pil
mondo_8_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d94c00a  ! 314: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
	.word 0xa9848001  ! 315: WR_SET_SOFTINT_R	wr	%r18, %r1, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_196) + 32, 16, 16)) -> intp(5,0,10)
intvec_8_196:
	.word 0x39400001  ! 316: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_197
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_197:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 317: RDPC	rd	%pc, %r12
mondo_8_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d904003  ! 318: WRPR_WSTATE_R	wrpr	%r1, %r3, %wstate
fpinit_8_199:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 319: FCMPLE32	fcmple32	%d0, %d4, %r6
intveclr_8_200:
	setx 0xd24f4cc95e87ec9c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 320: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9a00173  ! 321: FABSq	dis not found

intveclr_8_201:
	setx 0xd29e5281ffc9f7c8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_202) + 8, 16, 16)) -> intp(2,0,5)
intvec_8_202:
	.word 0x39400001  ! 323: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_203:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 324: RDPC	rd	%pc, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_204) + 40, 16, 16)) -> intp(4,0,19)
intvec_8_204:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_205:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 326: RDPC	rd	%pc, %r12
	fbne skip_8_206
	fbue,a,pn	%fcc0,  skip_8_206
.align 512
skip_8_206:
	.word 0xd8398010  ! 327: STD_R	std	%r12, [%r6 + %r16]
	.word 0xdac7e008  ! 328: LDSWA_I	ldswa	[%r31, + 0x0008] %asi, %r13
	.word 0x83d020b3  ! 329: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0xe187dc00  ! 330: LDFA_R	lda	[%r31, %r0], %f16
	.word 0x83d02032  ! 331: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xda800a60  ! 332: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r13
	brz,a,pn	%r19, skip_8_207
	fbe,a,pn	%fcc0,  skip_8_207
.align 1024
skip_8_207:
	.word 0xe9e20025  ! 333: CASA_I	casa	[%r8] 0x 1, %r5, %r20
	brlz,a,pn	%r6, skip_8_208
	fbul,a,pn	%fcc0,  skip_8_208
.align 32
skip_8_208:
	.word 0x91a4c9d3  ! 334: FDIVd	fdivd	%f50, %f50, %f8
intveclr_8_209:
	setx 0x46dc55bfc7ac7ca5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 335: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_210
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_210
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_210:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 336: RDPC	rd	%pc, %r18
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_211
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_211:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 337: CASA_R	casa	[%r31] %asi, %r19, %r11
pmu_8_212:
	nop
	setx 0xfffff0a9ffffff11, %g1, %g7
	.word 0xa3800007  ! 338: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x95a489ab  ! 339: FDIVs	fdivs	%f18, %f11, %f10
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_213
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_213:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 340: CASA_R	casa	[%r31] %asi, %r18, %r16
intveclr_8_214:
	setx 0x737153a80e1378aa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 341: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_215
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_215:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 342: CASA_R	casa	[%r31] %asi, %r18, %r16
	.word 0xe0800bc0  ! 343: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r16
mondo_8_216:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d91c010  ! 344: WRPR_WSTATE_R	wrpr	%r7, %r16, %wstate
DS_8_217:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 345: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_218:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 346: RDPC	rd	%pc, %r19
mondo_8_219:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d950000  ! 347: WRPR_WSTATE_R	wrpr	%r20, %r0, %wstate
	.word 0x97500000  ! 348: RDPR_TPC	rdpr	%tpc, %r11
	.word 0xda6fe023  ! 349: LDSTUB_I	ldstub	%r13, [%r31 + 0x0023]
	.word 0xda57c000  ! 350: LDSH_R	ldsh	[%r31 + %r0], %r13
jmptr_8_220:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 351: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_8_221:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 352: FDIVs	fdivs	%f0, %f4, %f8
intveclr_8_222:
	setx 0x5f7453d6bc63e644, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 353: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_223
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_223
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_223:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 354: RDPC	rd	%pc, %r10
	.word 0x9f803b89  ! 355: SIR	sir	0x1b89
donret_8_224:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_224-donret_8_224), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d2b891 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc5c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_224:
	.word 0xe6ffe0f6  ! 356: SWAPA_I	swapa	%r19, [%r31 + 0x00f6] %asi
	.word 0x9f80294a  ! 357: SIR	sir	0x094a
debug_8_225:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xc187d960  ! 358: LDFA_R	lda	[%r31, %r0], %f0
	rd %pc, %r19
	add %r19, (ivw_8_226-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_226:
	.word 0x91950012  ! 359: WRPR_PIL_R	wrpr	%r20, %r18, %pil
	.word 0xc3eb4028  ! 360: PREFETCHA_R	prefetcha	[%r13, %r8] 0x01, #one_read
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
	.word 0xd1e7e008  ! 361: CASA_R	casa	[%r31] %asi, %r8, %r8
	.word 0x97a00170  ! 362: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_228
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_228
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_228:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 363: RDPC	rd	%pc, %r16
	bvc  	 skip_8_229
	.word 0xc36cfce3  ! 1: PREFETCH_I	prefetch	[%r19 + 0xfffffce3], #one_read
.align 32
skip_8_229:
	.word 0x91a489ca  ! 364: FDIVd	fdivd	%f18, %f10, %f8
	.word 0xd137e076  ! 365: STQF_I	-	%f8, [0x0076, %r31]
donret_8_230:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_230-donret_8_230), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009ede65 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb86, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_230:
	.word 0xd0ffe0a4  ! 366: SWAPA_I	swapa	%r8, [%r31 + 0x00a4] %asi
change_to_randtl_8_231:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_231:
	.word 0x8f902002  ! 367: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xad812a6a  ! 368: WR_SOFTINT_REG_I	wr	%r4, 0x0a6a, %softint
	.word 0xa980c00a  ! 369: WR_SET_SOFTINT_R	wr	%r3, %r10, %set_softint
	.word 0x8d903963  ! 370: WRPR_PSTATE_I	wrpr	%r0, 0x1963, %pstate
splash_lsu_8_232:
	set 0xdbcfd265, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 371: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd137e0cc  ! 372: STQF_I	-	%f8, [0x00cc, %r31]
unsupttte8_233:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa5a249b1  ! 373: FDIVs	fdivs	%f9, %f17, %f18
memptr_8_234:
	set user_data_start, %r31
	.word 0x8581f390  ! 374: WRCCR_I	wr	%r7, 0x1390, %ccr
mondo_8_235:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d948000  ! 375: WRPR_WSTATE_R	wrpr	%r18, %r0, %wstate
	.word 0xd337c000  ! 376: STQF_R	-	%f9, [%r0, %r31]
	.word 0xd317c000  ! 377: LDQF_R	-	[%r31, %r0], %f9
    set 0xe3f, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b507f4  ! 378: PDISTN	fmean16	%d20, %d20, %d40
	fbne skip_8_236
	.word 0xa1b444c4  ! 1: FCMPNE32	fcmpne32	%d48, %d4, %r16
.align 512
skip_8_236:
	.word 0xa3a449cb  ! 379: FDIVd	fdivd	%f48, %f42, %f48
	setx 0x6dd2f10bffc9369d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_237:
	.word 0x39400001  ! 380: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f803217  ! 381: SIR	sir	0x1217
	.word 0xa1a00173  ! 382: FABSq	dis not found

intveclr_8_238:
	setx 0xb0d4ccaca2219b77, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 383: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9a00166  ! 384: FABSq	dis not found

	.word 0x8d9024f5  ! 385: WRPR_PSTATE_I	wrpr	%r0, 0x04f5, %pstate
splash_htba_8_239:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 386: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_240
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_240:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 387: RDPC	rd	%pc, %r16
	.word 0xd05fe008  ! 388: LDX_I	ldx	[%r31 + 0x0008], %r8
splash_cmpr_8_241:
	setx 0xc3d192e3b6278bb0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b3  ! 390: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_lsu_8_242:
	set 0x52af1c6f, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 391: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_243
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_243
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_243:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 392: RDPC	rd	%pc, %r17
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_244
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_244:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e001  ! 393: CASA_R	casa	[%r31] %asi, %r1, %r9
debug_8_245:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_8_245:
	mov 0xd5c, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe020  ! 394: STDFA_I	stda	%f0, [0x0020, %r31]
	.word 0xd257c000  ! 395: LDSH_R	ldsh	[%r31 + %r0], %r9
	.word 0x9f8020a5  ! 396: SIR	sir	0x00a5
mondo_8_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d914004  ! 397: WRPR_WSTATE_R	wrpr	%r5, %r4, %wstate
	.word 0xd26fe085  ! 398: LDSTUB_I	ldstub	%r9, [%r31 + 0x0085]
	.word 0x91a00166  ! 399: FABSq	dis not found

	.word 0xe2bfe0e0  ! 400: STDA_I	stda	%r17, [%r31 + 0x00e0] %asi
	.word 0xe20fc000  ! 401: LDUB_R	ldub	[%r31 + %r0], %r17
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 402: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe317c000  ! 403: LDQF_R	-	[%r31, %r0], %f17
pmu_8_247:
	nop
	setx 0xfffffbe5fffff07c, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_8_248:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 405: FDIVs	fdivs	%f0, %f4, %f4
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 406: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95702222  ! 407: POPC_I	popc	0x0222, %r10
	.word 0xa9834006  ! 408: WR_SET_SOFTINT_R	wr	%r13, %r6, %set_softint
invtsb_8_249:
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
	.word 0x29800001  ! 409: FBL	fbl,a	<label_0x1>
intveclr_8_250:
	setx 0xfeec4681fcc481b4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 410: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7a489d4  ! 411: FDIVd	fdivd	%f18, %f20, %f50
	rd %pc, %r19
	add %r19, (ivw_8_251-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_251:
	.word 0x9194000a  ! 412: WRPR_PIL_R	wrpr	%r16, %r10, %pil
	.word 0x9f802403  ! 413: SIR	sir	0x0403
    set 0xd0a, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb487f1  ! 414: PDISTN	fmean16	%d18, %d48, %d44
	rd %pc, %r19
	add %r19, (ivw_8_252-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_252:
	.word 0x91948012  ! 415: WRPR_PIL_R	wrpr	%r18, %r18, %pil
	.word 0xe48fe018  ! 416: LDUBA_I	lduba	[%r31, + 0x0018] %asi, %r18
	.word 0x2a700001  ! 417: BPCS	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 418: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4800b40  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r18
	.word 0xe187da00  ! 420: LDFA_R	lda	[%r31, %r0], %f16
change_to_randtl_8_253:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_253:
	.word 0x8f902002  ! 421: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa5a00167  ! 422: FABSq	dis not found

splash_hpstate_8_254:
	.word 0x81982256  ! 423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0256, %hpstate
mondo_8_255:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d940001  ! 424: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
	.word 0x9f8029e1  ! 425: SIR	sir	0x09e1
	.word 0x97454000  ! 426: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
intveclr_8_256:
	setx 0xe0e799db9b57d692, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 427: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_257:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 428: RDPC	rd	%pc, %r13
	rd %pc, %r19
	add %r19, (ivw_8_258-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_258:
	.word 0x91920013  ! 429: WRPR_PIL_R	wrpr	%r8, %r19, %pil
splash_cmpr_8_259:
	setx 0x4a1cf39c880e4126, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 430: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_decr_8_260:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r6, [%r1] 0x45
	.word 0xa7824009  ! 431: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r9, %-
	.word 0xe857c000  ! 432: LDSH_R	ldsh	[%r31 + %r0], %r20
	.word 0xa5540000  ! 433: RDPR_GL	<illegal instruction>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_261
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_261:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 434: CASA_R	casa	[%r31] %asi, %r16, %r9
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_262
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_262:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 435: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01964  ! 436: FqTOd	dis not found

	.word 0xa1a00160  ! 437: FABSq	dis not found

change_to_randtl_8_264:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_264:
	.word 0x8f902000  ! 438: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_8_265:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_265:
	.word 0x8f902001  ! 439: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_8_266:
	setx 0x68f4d1d65fd2092a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916c7805  ! 441: SDIVX_I	sdivx	%r17, 0xfffff805, %r8
splash_cmpr_8_268:
	setx 0xacacd02911a52a9a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 442: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd127e030  ! 443: STF_I	st	%f8, [0x0030, %r31]
	.word 0x91d02032  ! 444: Tcc_I	ta	icc_or_xcc, %r0 + 50
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 445: Tcc_R	ta	icc_or_xcc, %r0 + %r30
jmptr_8_269:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 446: JMPL_R	jmpl	%r27 + %r0, %r27
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
	.word 0xa1414000  ! 447: RDPC	rd	%pc, %r16
	.word 0xd937e086  ! 448: STQF_I	-	%f12, [0x0086, %r31]
pmu_8_271:
	nop
	setx 0xfffff00cfffff0f0, %g1, %g7
	.word 0xa3800007  ! 449: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_8_272:
	nop
	setx 0xfffff021fffff1a7, %g1, %g7
	.word 0xa3800007  ! 450: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_htba_8_273:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 451: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd89fe000  ! 452: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r12
	.word 0x8d902813  ! 453: WRPR_PSTATE_I	wrpr	%r0, 0x0813, %pstate
	.word 0x99902002  ! 454: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
pmu_8_274:
	nop
	setx 0xfffffd1dfffff1c4, %g1, %g7
	.word 0xa3800007  ! 455: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_8_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d91c007  ! 456: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
	.word 0xd8800b20  ! 457: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r12
	bpos  	 skip_8_276
	.word 0xc36aacfa  ! 1: PREFETCH_I	prefetch	[%r10 + 0x0cfa], #one_read
.align 128
skip_8_276:
	.word 0x39400001  ! 458: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_8_277:
	set 0xd2aaea1f, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 459: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd31fc000  ! 460: LDDF_R	ldd	[%r31, %r0], %f9
	rd %pc, %r19
	add %r19, (ivw_8_278-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_278:
	.word 0x9194c000  ! 461: WRPR_PIL_R	wrpr	%r19, %r0, %pil
	.word 0xd277e079  ! 462: STX_I	stx	%r9, [%r31 + 0x0079]
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
	.word 0x95414000  ! 463: RDPC	rd	%pc, %r10
	brz,a,pn	%r18, skip_8_280
	fbuge,a,pn	%fcc0,  skip_8_280
.align 2048
skip_8_280:
	.word 0x93b004d0  ! 464: FCMPNE32	fcmpne32	%d0, %d16, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01971  ! 465: FqTOd	dis not found

splash_hpstate_8_282:
	.word 0x819822fd  ! 466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02fd, %hpstate
change_to_randtl_8_283:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_283:
	.word 0x8f902001  ! 467: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xda3fc000  ! 468: STD_R	std	%r13, [%r31 + %r0]
	.word 0x91d02034  ! 469: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x91d020b4  ! 470: Tcc_I	ta	icc_or_xcc, %r0 + 180
intveclr_8_284:
	setx 0xc4c92eefa1cbae3a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 471: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_8_285:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d92400c  ! 472: WRPR_WSTATE_R	wrpr	%r9, %r12, %wstate
	.word 0xda77c000  ! 473: STX_R	stx	%r13, [%r31 + %r0]
pmu_8_286:
	nop
	setx 0xfffff170fffff5e0, %g1, %g7
	.word 0xa3800007  ! 474: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xdacfe008  ! 475: LDSBA_I	ldsba	[%r31, + 0x0008] %asi, %r13
	.word 0x9f80244a  ! 476: SIR	sir	0x044a
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 477: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdb37e0b0  ! 478: STQF_I	-	%f13, [0x00b0, %r31]
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_287
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_287
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_287:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 479: RDPC	rd	%pc, %r18
splash_cmpr_8_288:
	setx 0x15cbe1fae79bad0a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 480: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91480000  ! 481: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	rd %pc, %r19
	add %r19, (ivw_8_289-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_289:
	.word 0x9191c005  ! 482: WRPR_PIL_R	wrpr	%r7, %r5, %pil
donret_8_290:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_290-donret_8_290), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005fb34f | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x99d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_290:
	.word 0xe8ffe00a  ! 483: SWAPA_I	swapa	%r20, [%r31 + 0x000a] %asi
	fbue,a,pn	%fcc0,  skip_8_291
	.word 0xd3e34025  ! 1: CASA_I	casa	[%r13] 0x 1, %r5, %r9
.align 128
skip_8_291:
	.word 0xd5e48020  ! 484: CASA_I	casa	[%r18] 0x 1, %r0, %r10
	.word 0xd497e008  ! 485: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r10
	.word 0xd51fc000  ! 486: LDDF_R	ldd	[%r31, %r0], %f10
splash_decr_8_292:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r20, [%r1] 0x45
	.word 0xa7844013  ! 487: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r19, %-
	.word 0xd527c000  ! 488: STF_R	st	%f10, [%r0, %r31]
splash_hpstate_8_293:
	.word 0x8198270e  ! 489: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070e, %hpstate
	.word 0xd46fe089  ! 490: LDSTUB_I	ldstub	%r10, [%r31 + 0x0089]
jmptr_8_294:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 491: JMPL_R	jmpl	%r27 + %r0, %r27
debug_8_295:
	nop
	ta T_CHANGE_HPRIV
debug_iva_8_295:
	mov 0x6b3, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+40), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd960  ! 492: STDFA_R	stda	%f0, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_296
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_296:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 493: RDPC	rd	%pc, %r17
	.word 0x9f803c16  ! 494: SIR	sir	0x1c16
pmu_8_297:
	nop
	setx 0xfffff77dfffff03f, %g1, %g7
	.word 0xa3800007  ! 495: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_8_298:
	setx 0x7ddd4a1e42f92ea8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 496: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_8_299:
	setx 0x97e802503a7efca5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 497: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe80fe030  ! 498: LDUB_I	ldub	[%r31 + 0x0030], %r20
	.word 0x9ba0016b  ! 499: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01973  ! 500: FqTOd	dis not found

splash_cmpr_8_301:
	setx 0xdcc52d8ee8e31674, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 501: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_8_302:
	setx 0x4a861206ea6d4ea2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 502: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9145c000  ! 503: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0xd537c000  ! 504: STQF_R	-	%f10, [%r0, %r31]
	.word 0x9f803c03  ! 505: SIR	sir	0x1c03
	rd %pc, %r19
	add %r19, (ivw_8_303-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_303:
	.word 0x91950007  ! 506: WRPR_PIL_R	wrpr	%r20, %r7, %pil
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 507: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_8_304:
	setx 0xab286de716727367, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 508: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_8_305:
	.word 0x9ba1c9c6  ! 1: FDIVd	fdivd	%f38, %f6, %f44
	pdist %f10, %f14, %f24
	.word 0x95b48304  ! 509: ALIGNADDRESS	alignaddr	%r18, %r4, %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_306) + 16, 16, 16)) -> intp(5,0,6)
intvec_8_306:
	.word 0x39400001  ! 510: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_307:
	setx 0x367687c660554277, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 511: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f8024da  ! 512: SIR	sir	0x04da
splash_lsu_8_308:
	set 0xe71ffc15, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 513: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_8_309:
	setx 0xc23f714faaa9ffdd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 514: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 515: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda8008a0  ! 516: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
pmu_8_310:
	nop
	setx 0xfffff89afffff408, %g1, %g7
	.word 0xa3800007  ! 517: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38700001  ! 518: BPGU	<illegal instruction>
splash_decr_8_311:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa7834011  ! 519: WR_GRAPHICS_STATUS_REG_R	wr	%r13, %r17, %-
	.word 0xda6fe0f1  ! 520: LDSTUB_I	ldstub	%r13, [%r31 + 0x00f1]
    set 0x140c, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b487f2  ! 521: PDISTN	fmean16	%d18, %d18, %d48
mondo_8_312:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d90c001  ! 522: WRPR_WSTATE_R	wrpr	%r3, %r1, %wstate
donret_8_313:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_313-donret_8_313-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b42c0a | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc5c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_313:
	.word 0xdaffe0dd  ! 523: SWAPA_I	swapa	%r13, [%r31 + 0x00dd] %asi
	.word 0x9f803cd7  ! 524: SIR	sir	0x1cd7
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01961  ! 525: FqTOd	dis not found

	.word 0xdacfe018  ! 526: LDSBA_I	ldsba	[%r31, + 0x0018] %asi, %r13
	.word 0xc3e94032  ! 527: PREFETCHA_R	prefetcha	[%r5, %r18] 0x01, #one_read
mondo_8_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d950011  ! 528: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
	.word 0xd41fe010  ! 529: LDD_I	ldd	[%r31 + 0x0010], %r10
	.word 0xd537e056  ! 530: STQF_I	-	%f10, [0x0056, %r31]
DS_8_316:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd3327d31  ! 1: STQF_I	-	%f9, [0x1d31, %r9]
	normalw
	.word 0xa1458000  ! 531: RD_SOFTINT_REG	rd	%softint, %r16
cwp_8_317:
    set user_data_start, %o7
	.word 0x93902005  ! 532: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_cmpr_8_318:
	setx 0x21e984ce7f2009e6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 533: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_8_319:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_319-donret_8_319-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f7f22c | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x2d6, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_319:
	.word 0xdaffe034  ! 534: SWAPA_I	swapa	%r13, [%r31 + 0x0034] %asi
	.word 0x99a0016c  ! 535: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 536: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xe28008a0  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
mondo_8_320:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d94400d  ! 538: WRPR_WSTATE_R	wrpr	%r17, %r13, %wstate
unsupttte8_321:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87a80a52  ! 539: FCMPd	fcmpd	%fcc<n>, %f0, %f18
jmptr_8_322:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 540: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe4800ac0  ! 541: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r18
pmu_8_323:
	nop
	setx 0xfffff512fffff0b7, %g1, %g7
	.word 0xa3800007  ! 542: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_8_324:
	set 0xfba0eb42, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 543: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_8_325:
	nop
	ta T_CHANGE_HPRIV
debug_iva_8_325:
	mov 0x7c1, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+16), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfda00  ! 544: STDFA_R	stda	%f16, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_326) + 32, 16, 16)) -> intp(3,0,12)
intvec_8_326:
	.word 0x39400001  ! 545: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_8_327:
	setx 0xd7a028b40a84bdf4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 546: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_8_328:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d918007  ! 547: WRPR_WSTATE_R	wrpr	%r6, %r7, %wstate
	.word 0xa0d4accc  ! 548: UMULcc_I	umulcc 	%r18, 0x0ccc, %r16
memptr_8_329:
	set 0x60740000, %r31
	.word 0x8584f855  ! 549: WRCCR_I	wr	%r19, 0x1855, %ccr
	.word 0x9f802135  ! 550: SIR	sir	0x0135
memptr_8_330:
	set user_data_start, %r31
	.word 0x8580be3e  ! 551: WRCCR_I	wr	%r2, 0x1e3e, %ccr
	.word 0xe1bfde00  ! 552: STDFA_R	stda	%f16, [%r0, %r31]
	bgu  	 skip_8_331
	fbul skip_8_331
.align 512
skip_8_331:
	.word 0xa7a009c2  ! 553: FDIVd	fdivd	%f0, %f2, %f50
splash_cmpr_8_332:
	setx 0x3570d52b5bbbc83d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 554: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7a509d0  ! 555: FDIVd	fdivd	%f20, %f16, %f50
jmptr_8_333:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 556: JMPL_R	jmpl	%r27 + %r0, %r27
unsupttte8_334:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x97a449a3  ! 557: FDIVs	fdivs	%f17, %f3, %f11
	.word 0xd48008a0  ! 558: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01969  ! 559: FqTOd	dis not found

	.word 0xa3a009ca  ! 560: FDIVd	fdivd	%f0, %f10, %f48
debug_8_336:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe187da00  ! 561: LDFA_R	lda	[%r31, %r0], %f16
	.word 0x91d02035  ! 562: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xda1fc000  ! 563: LDD_R	ldd	[%r31 + %r0], %r13
mondo_8_337:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d918007  ! 564: WRPR_WSTATE_R	wrpr	%r6, %r7, %wstate
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_338
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_338
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_338:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 565: RDPC	rd	%pc, %r11
	fble skip_8_339
	.word 0xa5a0c9d4  ! 1: FDIVd	fdivd	%f34, %f20, %f18
.align 512
skip_8_339:
	.word 0xe7e08030  ! 566: CASA_I	casa	[%r2] 0x 1, %r16, %r19
	.word 0xe657e038  ! 567: LDSH_I	ldsh	[%r31 + 0x0038], %r19
splash_hpstate_8_340:
	.word 0x8198280f  ! 568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080f, %hpstate
	.word 0xe64fc000  ! 569: LDSB_R	ldsb	[%r31 + %r0], %r19
splash_lsu_8_341:
	set 0x7bd6d355, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 570: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
fpinit_8_342:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 571: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_lsu_8_343:
	set 0x7f622a70, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 572: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01974  ! 573: FqTOd	dis not found

	.word 0xd68008a0  ! 574: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_345)+0, 16, 16)) -> intp(4,1,3)
xir_8_345:
	.word 0xa981e607  ! 575: WR_SET_SOFTINT_I	wr	%r7, 0x0607, %set_softint
	.word 0xd677e020  ! 576: STX_I	stx	%r11, [%r31 + 0x0020]
jmptr_8_346:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 577: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xc014f7949c757610, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_347:
	.word 0x39400001  ! 578: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 579: LDX_R	ldx	[%r31 + %r0], %r11
pmu_8_348:
	nop
	setx 0xfffff277fffff49c, %g1, %g7
	.word 0xa3800007  ! 580: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f80364d  ! 581: SIR	sir	0x164d
	.word 0x91d02032  ! 582: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_8_349:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 583: SAVE_R	save	%r31, %r0, %r31
pmu_8_350:
	nop
	setx 0xfffff3b2fffff7de, %g1, %g7
	.word 0xa3800007  ! 584: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_8_351:
	taddcctv %r18, 0x138f, %r18
	.word 0xd607e0db  ! 585: LDUW_I	lduw	[%r31 + 0x00db], %r11
	.word 0xc3ec802d  ! 586: PREFETCHA_R	prefetcha	[%r18, %r13] 0x01, #one_read
	bneg,a	 skip_8_352
	be  	 skip_8_352
.align 2048
skip_8_352:
	.word 0x24cc4001  ! 587: BRLEZ	brlez,a,pt	%r17,<label_0xc4001>
	brz,pn  	%r19, skip_8_353
	bn  	 skip_8_353
.align 128
skip_8_353:
	.word 0x87acca4a  ! 588: FCMPd	fcmpd	%fcc<n>, %f50, %f10
splash_hpstate_8_354:
	.word 0x819822a5  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02a5, %hpstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 590: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_8_355:
	setx 0xa5b3cfada8a4e31a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 591: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4c7e020  ! 592: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r18
	.word 0x8d9021d0  ! 593: WRPR_PSTATE_I	wrpr	%r0, 0x01d0, %pstate
mondo_8_356:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d940003  ! 594: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
jmptr_8_357:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 595: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe4800be0  ! 596: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r18
jmptr_8_358:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 597: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_8_359:
	setx 0x26e3f23b4ea97da8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 598: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_8_360:
	nop
	setx 0xfffffd59fffff298, %g1, %g7
	.word 0xa3800007  ! 599: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_361
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_361:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 600: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0xe48008a0  ! 601: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_362
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_362:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 602: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0x9f803d30  ! 603: SIR	sir	0x1d30
	.word 0xe53fe08a  ! 604: STDF_I	std	%f18, [0x008a, %r31]
	.word 0xe537c000  ! 605: STQF_R	-	%f18, [%r0, %r31]
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 606: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe51fe038  ! 607: LDDF_I	ldd	[%r31, 0x0038], %f18
	.word 0x8d90338d  ! 608: WRPR_PSTATE_I	wrpr	%r0, 0x138d, %pstate
jmptr_8_363:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 609: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x97a149ad  ! 610: FDIVs	fdivs	%f5, %f13, %f11
intveclr_8_364:
	setx 0x44f139383dbf14bd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 611: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_365:
	setx 0x182d6a336342b680, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 612: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_8_366:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfc3e0  ! 613: STDFA_R	stda	%f16, [%r0, %r31]
splash_cmpr_8_367:
	setx 0x46e917b557760158, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 614: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe1bfe0a0  ! 615: STDFA_I	stda	%f16, [0x00a0, %r31]
	.word 0xe25fe028  ! 616: LDX_I	ldx	[%r31 + 0x0028], %r17
	.word 0x9b45c000  ! 617: RD_TICK_CMPR_REG	rd	%-, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_368) + 48, 16, 16)) -> intp(3,0,31)
intvec_8_368:
	.word 0x39400001  ! 618: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda1fc000  ! 619: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xc187e020  ! 620: LDFA_I	lda	[%r31, 0x0020], %f0
splash_tba_8_369:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 621: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa7454000  ! 622: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
tagged_8_370:
	tsubcctv %r12, 0x1b18, %r6
	.word 0xe007e040  ! 623: LDUW_I	lduw	[%r31 + 0x0040], %r16
memptr_8_371:
	set 0x60140000, %r31
	.word 0x8582e936  ! 624: WRCCR_I	wr	%r11, 0x0936, %ccr
mondo_8_372:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d91c008  ! 625: WRPR_WSTATE_R	wrpr	%r7, %r8, %wstate
	.word 0x83d020b2  ! 626: Tcc_I	te	icc_or_xcc, %r0 + 178
splash_htba_8_373:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 627: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_374
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_374:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00b  ! 628: CASA_R	casa	[%r31] %asi, %r11, %r16
	.word 0xa7454000  ! 629: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	.word 0x9ba0016a  ! 630: FABSq	dis not found

	.word 0xa1a509d3  ! 631: FDIVd	fdivd	%f20, %f50, %f16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 632: LDX_R	ldx	[%r31 + %r0], %r19
cwp_8_375:
    set user_data_start, %o7
	.word 0x93902005  ! 633: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x81510000  ! 635: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe6800b00  ! 636: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r19
	rd %pc, %r19
	add %r19, (ivw_8_376-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_376:
	.word 0x91930013  ! 637: WRPR_PIL_R	wrpr	%r12, %r19, %pil
intveclr_8_377:
	setx 0xa1ed102d071cef28, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 638: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 639: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_8_378:
	set 0x673e6f2c, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 640: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe6800c20  ! 641: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r19
	.word 0xe627e040  ! 642: STW_I	stw	%r19, [%r31 + 0x0040]
	.word 0x91d020b3  ! 643: Tcc_I	ta	icc_or_xcc, %r0 + 179
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_379
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_379:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 644: CASA_R	casa	[%r31] %asi, %r16, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_380) + 24, 16, 16)) -> intp(6,0,27)
intvec_8_380:
	.word 0x39400001  ! 645: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_decr_8_381:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r11, [%r1] 0x45
	.word 0xa784c007  ! 646: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r7, %-
mondo_8_382:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d908013  ! 647: WRPR_WSTATE_R	wrpr	%r2, %r19, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996c7b64  ! 648: SDIVX_I	sdivx	%r17, 0xfffffb64, %r12
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
	.word 0xa9414000  ! 649: RDPC	rd	%pc, %r20
	.word 0xd42fe0d2  ! 650: STB_I	stb	%r10, [%r31 + 0x00d2]
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 651: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5683467  ! 652: SDIVX_I	sdivx	%r0, 0xfffff467, %r18
splash_lsu_8_386:
	set 0x58b6ce05, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 653: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	brgz,pt  	%r20, skip_8_387
	fbuge skip_8_387
.align 32
skip_8_387:
	.word 0x24ccc001  ! 654: BRLEZ	brlez,a,pt	%r19,<label_0xcc001>
	.word 0xa345c000  ! 655: RD_TICK_CMPR_REG	rd	%-, %r17
splash_lsu_8_388:
	set 0x41cd2ec3, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 656: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9145c000  ! 657: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0x9480a7a0  ! 658: ADDcc_I	addcc 	%r2, 0x07a0, %r10
debug_8_389:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_8_389:
	mov 0xfc8, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfc2c0  ! 659: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe8800c80  ! 660: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r20
jmptr_8_390:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 661: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_8_391:
	nop
	setx 0xfffffb9ffffff64a, %g1, %g7
	.word 0xa3800007  ! 662: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa7540000  ! 663: RDPR_GL	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_8_392-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_392:
	.word 0x91940010  ! 664: WRPR_PIL_R	wrpr	%r16, %r16, %pil
splash_lsu_8_393:
	set 0x0b53e2a8, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 665: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_8_394:
	nop
	setx 0xfffff5bbfffffc63, %g1, %g7
	.word 0xa3800007  ! 666: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_395
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_395:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 667: CASA_R	casa	[%r31] %asi, %r12, %r13
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_396
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_396:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 668: CASA_R	casa	[%r31] %asi, %r12, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 669: LDX_R	ldx	[%r31 + %r0], %r13
splash_cmpr_8_397:
	setx 0x9d12b675382e8d60, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 670: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_8_398:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 671: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_399
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_399
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_399:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 672: RDPC	rd	%pc, %r17
    set 0x3313, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b407f3  ! 673: PDISTN	fmean16	%d16, %d50, %d12
	.word 0x99a0016b  ! 674: FABSq	dis not found

mondo_8_400:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d948005  ! 675: WRPR_WSTATE_R	wrpr	%r18, %r5, %wstate
	rd %pc, %r19
	add %r19, (ivw_8_401-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_401:
	.word 0x91950009  ! 676: WRPR_PIL_R	wrpr	%r20, %r9, %pil
mondo_8_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d908011  ! 677: WRPR_WSTATE_R	wrpr	%r2, %r17, %wstate
fpinit_8_403:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 678: FCMPd	fcmpd	%fcc<n>, %f0, %f4
    set 0x24a6, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b287eb  ! 679: PDISTN	fmean16	%d10, %d42, %d16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a0196b  ! 680: FqTOd	dis not found

cwp_8_405:
    set user_data_start, %o7
	.word 0x93902007  ! 681: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_406
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_406:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 682: CASA_R	casa	[%r31] %asi, %r5, %r17
splash_cmpr_8_407:
	setx 0x1409980ab6106921, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 683: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_8_408:
	set 0xd318c5d7, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 684: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 685: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x93500000  ! 686: RDPR_TPC	<illegal instruction>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_409:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 687: RDPC	rd	%pc, %r18
	.word 0xa1480000  ! 688: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_410
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_410:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 689: CASA_R	casa	[%r31] %asi, %r5, %r18
fpinit_8_411:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 690: FCMPd	fcmpd	%fcc<n>, %f0, %f4
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_412
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_412:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 691: CASA_R	casa	[%r31] %asi, %r5, %r18
jmptr_8_413:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 692: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_8_414:
	nop
	setx 0xfffff474fffff226, %g1, %g7
	.word 0xa3800007  ! 693: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_8_415-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_415:
	.word 0x9194c000  ! 694: WRPR_PIL_R	wrpr	%r19, %r0, %pil
splash_hpstate_8_416:
	.word 0x81982fce  ! 695: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fce, %hpstate
donret_8_417:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_417-donret_8_417-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000dbf90 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x246, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_417:
	.word 0xe4ffe05c  ! 696: SWAPA_I	swapa	%r18, [%r31 + 0x005c] %asi
debug_8_418:
	nop
	ta T_CHANGE_HPRIV
debug_iva_8_418:
	mov 0x5db, %r20
	mov 0x19, %r19
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
	.word 0xc187df20  ! 697: LDFA_R	lda	[%r31, %r0], %f0
pmu_8_419:
	nop
	setx 0xfffff5bbfffffb22, %g1, %g7
	.word 0xa3800007  ! 698: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_8_420:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d930012  ! 699: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
	.word 0xa5540000  ! 700: RDPR_GL	rdpr	%-, %r18
DS_8_421:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe9306873  ! 1: STQF_I	-	%f20, [0x0873, %r1]
	normalw
	.word 0x95458000  ! 701: RD_SOFTINT_REG	rd	%softint, %r10
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xab84f830  ! 1: WR_CLEAR_SOFTINT_I	wr	%r19, 0x1830, %clear_softint
	.word 0xa3a449c2  ! 2: FDIVd	fdivd	%f48, %f2, %f48
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 3: LDX_R	ldx	[%r31 + %r0], %r18
intveclr_4_1:
	setx 0xee717a6d2f4a3781, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 4: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_2:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_4_2:
	mov 0xf98, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe187db60  ! 5: LDFA_R	lda	[%r31, %r0], %f16
splash_lsu_4_3:
	set 0xbdd1bbd9, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 6: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_4_4:
	setx 0x2bf1712e1184b2d9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_4_5:
	setx 0x7981b10fd5ab58d1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 8: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_6:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xc187da00  ! 9: LDFA_R	lda	[%r31, %r0], %f0
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_7:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 10: RDPC	rd	%pc, %r19
intveclr_4_8:
	setx 0xc236c2b9e8ed3d29, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 11: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_9
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_9:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 12: RDPC	rd	%pc, %r9
	.word 0xe81fc000  ! 13: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0xa7b30492  ! 14: FCMPLE32	fcmple32	%d12, %d18, %r19
	.word 0x9f802cf0  ! 15: SIR	sir	0x0cf0
	.word 0xe69fc240  ! 16: LDDA_R	ldda	[%r31, %r0] 0x12, %r19
	setx 0x6c8843fbcc080358, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_11:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_4_12:
	setx 0xe4aa1fa8659b3dea, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 18: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_13
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_13:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 19: CASA_R	casa	[%r31] %asi, %r16, %r19
	.word 0xab814006  ! 20: WR_CLEAR_SOFTINT_R	wr	%r5, %r6, %clear_softint
	.word 0x91a209c8  ! 21: FDIVd	fdivd	%f8, %f8, %f8
intveclr_4_14:
	setx 0xb7fc1aa7df6e872b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 22: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 23: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_4_15:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d948011  ! 24: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
jmptr_4_16:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 25: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_4_17:
	nop
	setx 0xffffff12fffff024, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd46fe000  ! 27: LDSTUB_I	ldstub	%r10, [%r31 + 0x0000]
	.word 0x83d020b4  ! 28: Tcc_I	te	icc_or_xcc, %r0 + 180
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 29: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_4_18:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfde00  ! 30: STDFA_R	stda	%f0, [%r0, %r31]
	setx 0x8c05fe469dabaa14, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_19:
	.word 0x39400001  ! 31: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfd920  ! 32: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x91d020b3  ! 33: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xa5b34491  ! 34: FCMPLE32	fcmple32	%d44, %d48, %r18
splash_cmpr_4_20:
	setx 0x219b55ed3a72dd8c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 35: WR_STICK_REG_R	wr	%r0, %r1, %-
jmptr_4_21:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 36: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_22:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 37: CASA_R	casa	[%r31] %asi, %r17, %r17
splash_hpstate_4_23:
	.word 0x819824d4  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d4, %hpstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_24:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 39: CASA_R	casa	[%r31] %asi, %r17, %r17
mondo_4_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d948013  ! 40: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
	.word 0xe257c000  ! 41: LDSH_R	ldsh	[%r31 + %r0], %r17
splash_cmpr_4_26:
	setx 0xe8ed6408c04065f4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 42: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe33fc000  ! 43: STDF_R	std	%f17, [%r0, %r31]
	.word 0xab84b420  ! 44: WR_CLEAR_SOFTINT_I	wr	%r18, 0x1420, %clear_softint
splash_hpstate_4_27:
	.word 0x8198268c  ! 45: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068c, %hpstate
change_to_randtl_4_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_28:
	.word 0x8f902000  ! 46: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_4_29:
	setx 0x2ea40ecf9b86aec5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 47: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_30:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e008  ! 48: CASA_R	casa	[%r31] %asi, %r8, %r17
intveclr_4_31:
	setx 0xd07e26c6226ae91e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 49: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_32) + 0, 16, 16)) -> intp(4,0,31)
intvec_4_32:
	.word 0x39400001  ! 50: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 51: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f803925  ! 52: SIR	sir	0x1925
	.word 0xa9a509d2  ! 53: FDIVd	fdivd	%f20, %f18, %f20
	.word 0x9ba049a9  ! 54: FDIVs	fdivs	%f1, %f9, %f13
	.word 0x29800001  ! 55: FBL	fbl,a	<label_0x1>
	.word 0x9f80391f  ! 56: SIR	sir	0x191f
intveclr_4_35:
	setx 0xb3b80ad755340d57, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 57: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_4_36:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 58: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
memptr_4_37:
	set 0x60340000, %r31
	.word 0x85843972  ! 59: WRCCR_I	wr	%r16, 0x1972, %ccr
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_38:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 60: RDPC	rd	%pc, %r13
	.word 0xe44fc000  ! 61: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe537c000  ! 62: STQF_R	-	%f18, [%r0, %r31]
mondo_4_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d904006  ! 63: WRPR_WSTATE_R	wrpr	%r1, %r6, %wstate
	.word 0xe46fe07b  ! 64: LDSTUB_I	ldstub	%r18, [%r31 + 0x007b]
jmptr_4_40:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 65: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196c  ! 66: FqTOd	dis not found

	.word 0xd88008a0  ! 67: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x9f802f49  ! 68: SIR	sir	0x0f49
intveclr_4_42:
	setx 0xcb49d51628b3a43f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_43:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e007  ! 70: CASA_R	casa	[%r31] %asi, %r7, %r12
splash_lsu_4_44:
	set 0xd1e894e1, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 71: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_4_45:
	nop
	setx 0xfffffb1bfffffea6, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_4_46:
	setx 0xb089e614d3184420, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_4_47-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_47:
	.word 0x91950000  ! 74: WRPR_PIL_R	wrpr	%r20, %r0, %pil
	.word 0x29800001  ! 75: FBL	fbl,a	<label_0x1>
	.word 0x91a1c9cc  ! 76: FDIVd	fdivd	%f38, %f12, %f8
mondo_4_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d94c00c  ! 77: WRPR_WSTATE_R	wrpr	%r19, %r12, %wstate
	.word 0x99a309d2  ! 78: FDIVd	fdivd	%f12, %f18, %f12
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_51
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_51
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_51:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 79: RDPC	rd	%pc, %r19
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_52:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e004  ! 80: CASA_R	casa	[%r31] %asi, %r4, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_53)+0, 16, 16)) -> intp(4,1,3)
xir_4_53:
	.word 0xa98473fd  ! 81: WR_SET_SOFTINT_I	wr	%r17, 0x13fd, %set_softint
	.word 0xe8d7e020  ! 82: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r20
	.word 0x3e800001  ! 83: BVC	bvc,a	<label_0x1>
	.word 0xe937c000  ! 84: STQF_R	-	%f20, [%r0, %r31]
	.word 0xa9454000  ! 85: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0xda47e030  ! 86: LDSW_I	ldsw	[%r31 + 0x0030], %r13
pmu_4_54:
	nop
	setx 0xffffff42fffff8a4, %g1, %g7
	.word 0xa3800007  ! 87: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f802f7f  ! 88: SIR	sir	0x0f7f
	setx 0x1784af5bcf8453b8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_55:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_56:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e004  ! 90: CASA_R	casa	[%r31] %asi, %r4, %r13
mondo_4_57:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d934008  ! 91: WRPR_WSTATE_R	wrpr	%r13, %r8, %wstate
splash_hpstate_4_58:
	.word 0x819823dc  ! 92: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03dc, %hpstate
	.word 0xda9fd100  ! 93: LDDA_R	ldda	[%r31, %r0] 0x88, %r13
	.word 0x95a00172  ! 94: FABSq	dis not found

	.word 0xd26fe0ff  ! 95: LDSTUB_I	ldstub	%r9, [%r31 + 0x00ff]
	setx 0x5ee9b9e27ac37067, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_59:
	.word 0x39400001  ! 96: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd26fe030  ! 97: LDSTUB_I	ldstub	%r9, [%r31 + 0x0030]
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 98: Tcc_R	ta	icc_or_xcc, %r0 + %r30
fpinit_4_60:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82448  ! 99: PREFETCHA_I	prefetcha	[%r0, + 0x0448] %asi, #one_read
	.word 0x95b44490  ! 100: FCMPLE32	fcmple32	%d48, %d16, %r10
DS_4_61:
	.word 0x91a109d4  ! 1: FDIVd	fdivd	%f4, %f20, %f8
	pdist %f20, %f4, %f22
	.word 0xa7b04308  ! 101: ALIGNADDRESS	alignaddr	%r1, %r8, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01965  ! 102: FqTOd	dis not found

pmu_4_63:
	nop
	setx 0xfffffdb9fffff2f4, %g1, %g7
	.word 0xa3800007  ! 103: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_4_64:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc15db115	! Random illegal ?
	.word 0xd9148011  ! 1: LDQF_R	-	[%r18, %r17], %f12
	.word 0x99a4c82c  ! 104: FADDs	fadds	%f19, %f12, %f12
	.word 0x99902000  ! 105: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xc3ed002d  ! 106: PREFETCHA_R	prefetcha	[%r20, %r13] 0x01, #one_read
	.word 0x9f802a35  ! 107: SIR	sir	0x0a35
	.word 0xd827e09d  ! 108: STW_I	stw	%r12, [%r31 + 0x009d]
debug_4_65:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_4_65:
	mov 0xe7c, %r20
	mov 0x1d, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdb60  ! 109: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd81fc000  ! 110: LDD_R	ldd	[%r31 + %r0], %r12
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_66:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 111: CASA_R	casa	[%r31] %asi, %r16, %r12
change_to_randtl_4_67:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_67:
	.word 0x8f902002  ! 112: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_4_68:
	setx 0x58e035b77607bd4e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 113: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_69:
	setx 0x6319a14a17fde77f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 114: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_70
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_70:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 115: RDPC	rd	%pc, %r13
pmu_4_71:
	nop
	setx 0xfffff3fffffff112, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01971  ! 117: FqTOd	dis not found

	.word 0xe527e0e0  ! 118: STF_I	st	%f18, [0x00e0, %r31]
mondo_4_73:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d94c013  ! 119: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_74:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 120: CASA_R	casa	[%r31] %asi, %r13, %r18
splash_lsu_4_75:
	set 0xa0015b0f, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 121: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa982c012  ! 122: WR_SET_SOFTINT_R	wr	%r11, %r18, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_76) + 56, 16, 16)) -> intp(1,0,27)
intvec_4_76:
	.word 0x39400001  ! 123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_4_77:
	nop
	setx 0xfffffb9bfffff9cf, %g1, %g7
	.word 0xa3800007  ! 124: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_4_78:
	nop
	setx 0xfffff534fffff50a, %g1, %g7
	.word 0xa3800007  ! 125: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_79
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_79:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 126: CASA_R	casa	[%r31] %asi, %r19, %r18
pmu_4_80:
	nop
	setx 0xfffffcb3fffff9eb, %g1, %g7
	.word 0xa3800007  ! 127: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_4_81:
	set 0x2d08e57f, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 128: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_4_82:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 129: RESTORE_R	restore	%r31, %r0, %r31
debug_4_83:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_4_83:
	mov 0xd78, %r20
	mov 0x1d, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc187d960  ! 130: LDFA_R	lda	[%r31, %r0], %f0
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6d24b2  ! 131: SDIVX_I	sdivx	%r20, 0x04b2, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 132: LDX_R	ldx	[%r31 + %r0], %r16
change_to_randtl_4_85:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_85:
	.word 0x8f902000  ! 133: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_4_86:
	setx 0x0f49b61be6123020, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 134: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5a009d1  ! 135: FDIVd	fdivd	%f0, %f48, %f18
cwp_4_87:
    set user_data_start, %o7
	.word 0x93902001  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x26700001  ! 137: BPL	<illegal instruction>
	.word 0xd69fe000  ! 138: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r11
mondo_4_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d948004  ! 139: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76cf82c  ! 140: SDIVX_I	sdivx	%r19, 0xfffff82c, %r19
	.word 0xe1bfe060  ! 141: STDFA_I	stda	%f16, [0x0060, %r31]
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_90:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e004  ! 142: CASA_R	casa	[%r31] %asi, %r4, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196d  ! 143: FqTOd	dis not found

	.word 0xd41fe020  ! 144: LDD_I	ldd	[%r31 + 0x0020], %r10
splash_tba_4_92:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 145: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa9b4c4d2  ! 146: FCMPNE32	fcmpne32	%d50, %d18, %r20
	.word 0xa7818012  ! 147: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r18, %-
	.word 0xe187e020  ! 148: LDFA_I	lda	[%r31, 0x0020], %f16
	.word 0xd0800b40  ! 149: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r8
	.word 0xa9454000  ! 150: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
pmu_4_95:
	nop
	setx 0xfffff981fffff19a, %g1, %g7
	.word 0xa3800007  ! 151: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa1a409ea  ! 152: FDIVq	dis not found

splash_lsu_4_96:
	set 0x63b7b4d7, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 153: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_97:
	setx 0x96a170d6d8e09ca3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 154: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab840013  ! 155: WR_CLEAR_SOFTINT_R	wr	%r16, %r19, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_98) + 8, 16, 16)) -> intp(6,0,29)
intvec_4_98:
	.word 0x39400001  ! 156: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 157: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4800c00  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r18
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_99
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_99:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e007  ! 159: CASA_R	casa	[%r31] %asi, %r7, %r18
	.word 0xa1a0c9cc  ! 160: FDIVd	fdivd	%f34, %f12, %f16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_100) + 32, 16, 16)) -> intp(3,0,10)
intvec_4_100:
	.word 0x39400001  ! 161: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3454000  ! 162: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0x81460000  ! 163: RD_STICK_REG	stbar
	.word 0x91b08480  ! 164: FCMPLE32	fcmple32	%d2, %d0, %r8
mondo_4_101:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d950008  ! 165: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_102
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_102:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 166: RDPC	rd	%pc, %r19
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_103:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 167: CASA_R	casa	[%r31] %asi, %r6, %r9
	rd %pc, %r19
	add %r19, (ivw_4_104-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_104:
	.word 0x91930012  ! 168: WRPR_PIL_R	wrpr	%r12, %r18, %pil
	.word 0xa784c013  ! 169: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r19, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_106)+8, 16, 16)) -> intp(4,1,3)
xir_4_106:
	.word 0xa980e01d  ! 170: WR_SET_SOFTINT_I	wr	%r3, 0x001d, %set_softint
	.word 0xd327c000  ! 171: STF_R	st	%f9, [%r0, %r31]
	.word 0xd2800ac0  ! 172: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 173: LDX_R	ldx	[%r31 + %r0], %r9
	rd %pc, %r19
	add %r19, (ivw_4_107-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_107:
	.word 0x91950011  ! 174: WRPR_PIL_R	wrpr	%r20, %r17, %pil
	.word 0xd28008a0  ! 175: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_lsu_4_108:
	set 0xcd6059e3, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 176: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_109:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 177: CASA_R	casa	[%r31] %asi, %r6, %r9
pmu_4_110:
	nop
	setx 0xfffff376ffffff89, %g1, %g7
	.word 0xa3800007  ! 178: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_4_111:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe187df20  ! 179: LDFA_R	lda	[%r31, %r0], %f16
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_112:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 180: CASA_R	casa	[%r31] %asi, %r6, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_113)+40, 16, 16)) -> intp(4,1,3)
xir_4_113:
	.word 0xa9852bb9  ! 181: WR_SET_SOFTINT_I	wr	%r20, 0x0bb9, %set_softint
memptr_4_114:
	set user_data_start, %r31
	.word 0x85836f73  ! 182: WRCCR_I	wr	%r13, 0x0f73, %ccr
mondo_4_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d908012  ! 183: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_116) + 24, 16, 16)) -> intp(1,0,21)
intvec_4_116:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_4_117:
	set 0x1ec10621, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_118:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 186: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0xd237e02e  ! 187: STH_I	sth	%r9, [%r31 + 0x002e]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 188: LDX_R	ldx	[%r31 + %r0], %r9
jmptr_4_119:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 189: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd2800c00  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r9
	.word 0xe187e0a0  ! 191: LDFA_I	lda	[%r31, 0x00a0], %f16
cwp_4_120:
    set user_data_start, %o7
	.word 0x93902004  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
mondo_4_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d94c012  ! 193: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
mondo_4_122:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d90400c  ! 194: WRPR_WSTATE_R	wrpr	%r1, %r12, %wstate
DS_4_123:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x95b48301  ! 195: ALIGNADDRESS	alignaddr	%r18, %r1, %r10
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 196: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_124
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_124:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 197: RDPC	rd	%pc, %r19
	.word 0x9150c000  ! 198: RDPR_TT	<illegal instruction>
	.word 0x29800001  ! 199: FBL	fbl,a	<label_0x1>
DS_4_126:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 200: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_4_127-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_127:
	.word 0x91940012  ! 201: WRPR_PIL_R	wrpr	%r16, %r18, %pil
mondo_4_128:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d944009  ! 202: WRPR_WSTATE_R	wrpr	%r17, %r9, %wstate
splash_lsu_4_129:
	set 0xba04286c, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 203: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_4_130:
	set 0xf6ab1c4c, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 204: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 205: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_4_131:
	setx 0x046fac4d41d763b3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 206: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_132
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_132:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e007  ! 207: CASA_R	casa	[%r31] %asi, %r7, %r13
splash_cmpr_4_133:
	setx 0x1c3362acef4f0665, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_4_134:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_134-donret_4_134), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005f52e8 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd8f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_134:
	.word 0xdaffe050  ! 209: SWAPA_I	swapa	%r13, [%r31 + 0x0050] %asi
	.word 0xa7850011  ! 210: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r17, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_136) + 16, 16, 16)) -> intp(7,0,21)
intvec_4_136:
	.word 0x39400001  ! 211: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a489d3  ! 212: FDIVd	fdivd	%f18, %f50, %f40
splash_cmpr_4_138:
	setx 0xb01f7f9c8807daf1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 213: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_4_139:
	set 0xf8703c6e, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 214: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902b90  ! 215: WRPR_PSTATE_I	wrpr	%r0, 0x0b90, %pstate
	.word 0xd8800c20  ! 216: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r12
	.word 0xd88fe028  ! 217: LDUBA_I	lduba	[%r31, + 0x0028] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_140
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_140:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 218: RDPC	rd	%pc, %r8
	.word 0x9f803cd7  ! 219: SIR	sir	0x1cd7
mondo_4_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d914002  ! 220: WRPR_WSTATE_R	wrpr	%r5, %r2, %wstate
jmptr_4_142:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 221: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe46fe013  ! 222: LDSTUB_I	ldstub	%r18, [%r31 + 0x0013]
	.word 0xe4800c20  ! 223: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r18
	.word 0x9f8038c4  ! 224: SIR	sir	0x18c4
intveclr_4_143:
	setx 0x422761ed23f10507, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_144:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 226: CASA_R	casa	[%r31] %asi, %r0, %r18
splash_lsu_4_145:
	set 0x1fbcd485, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 227: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_146
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_146
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_146:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 228: RDPC	rd	%pc, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 229: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe6800ac0  ! 230: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r19
intveclr_4_147:
	setx 0xb5ee38904d3c17ae, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 231: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe3e4c034  ! 232: CASA_I	casa	[%r19] 0x 1, %r20, %r17
splash_cmpr_4_149:
	setx 0x3c7b823835a35408, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 233: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_150) + 0, 16, 16)) -> intp(6,0,14)
intvec_4_150:
	.word 0x39400001  ! 234: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_4_151:
	nop
	setx 0xfffff9a0fffff6bc, %g1, %g7
	.word 0xa3800007  ! 235: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b4  ! 236: Tcc_I	ta	icc_or_xcc, %r0 + 180
intveclr_4_152:
	setx 0x10f00cf57f72f506, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 237: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96b6f43  ! 238: SDIVX_I	sdivx	%r13, 0x0f43, %r20
pmu_4_154:
	nop
	setx 0xfffff837fffff099, %g1, %g7
	.word 0xa3800007  ! 239: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe28008a0  ! 240: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xa1a289a5  ! 241: FDIVs	fdivs	%f10, %f5, %f16
	.word 0xd727c000  ! 242: STF_R	st	%f11, [%r0, %r31]
	.word 0xc187e0a0  ! 243: LDFA_I	lda	[%r31, 0x00a0], %f0
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_155:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r11
	.word 0x99902002  ! 245: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
DS_4_156:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd130b7fb  ! 1: STQF_I	-	%f8, [0x17fb, %r2]
	normalw
	.word 0x9b458000  ! 246: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xa9a4c9b4  ! 247: FDIVs	fdivs	%f19, %f20, %f20
	.word 0xa9a449c2  ! 248: FDIVd	fdivd	%f48, %f2, %f20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 249: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd527c000  ! 250: STF_R	st	%f10, [%r0, %r31]
	.word 0x91d02032  ! 251: Tcc_I	ta	icc_or_xcc, %r0 + 50
intveclr_4_158:
	setx 0x55c75d7860a1a553, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 252: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_159:
	setx 0x3c3ecc0a7f0e0670, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_160:
	setx 0xdf5f16bb043d6d5f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 254: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f8031d8  ! 255: SIR	sir	0x11d8
intveclr_4_161:
	setx 0xfca0e3a7a5e2e520, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 256: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_4_162:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc35d4610	! Random illegal ?
	.word 0xa3a00551  ! 1: FSQRTd	fsqrt	
	.word 0xa3a44820  ! 257: FADDs	fadds	%f17, %f0, %f17
	.word 0x9f80231d  ! 258: SIR	sir	0x031d
	.word 0xe257c000  ! 259: LDSH_R	ldsh	[%r31 + %r0], %r17
splash_lsu_4_163:
	set 0x304b56c9, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 260: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2384013  ! 261: STD_R	std	%r17, [%r1 + %r19]
	.word 0x81460000  ! 262: RD_STICK_REG	stbar
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936ceca6  ! 263: SDIVX_I	sdivx	%r19, 0x0ca6, %r9
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_166:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 264: CASA_R	casa	[%r31] %asi, %r19, %r9
	.word 0xa3a109d0  ! 265: FDIVd	fdivd	%f4, %f16, %f48
intveclr_4_167:
	setx 0x9e0471d36e75f474, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 266: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97450000  ! 267: RD_SET_SOFTINT	rd	%set_softint, %r11
splash_hpstate_4_168:
	.word 0x81982edd  ! 268: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edd, %hpstate
splash_htba_4_169:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 269: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_4_170:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb31400d  ! 1: STQF_R	-	%f13, [%r13, %r5]
	normalw
	.word 0xa7458000  ! 270: RD_SOFTINT_REG	rd	%softint, %r19
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_171
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_171:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 271: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0x83d020b2  ! 272: Tcc_I	te	icc_or_xcc, %r0 + 178
mondo_4_172:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d90400b  ! 273: WRPR_WSTATE_R	wrpr	%r1, %r11, %wstate
	.word 0x99a00165  ! 274: FABSq	dis not found

	setx 0xb6061ac08c5e1af7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_173:
	.word 0x39400001  ! 275: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_4_174:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_174-donret_4_174), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b7c7fa | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x44f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_174:
	.word 0xe6ffe04f  ! 276: SWAPA_I	swapa	%r19, [%r31 + 0x004f] %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01973  ! 277: FqTOd	dis not found

splash_cmpr_4_176:
	setx 0x9c8cd02d9b0d2618, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_177:
	setx 0x09bb361636078fb6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 279: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 280: LDX_R	ldx	[%r31 + %r0], %r18
fpinit_4_178:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 281: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0xe4800c80  ! 282: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r18
	.word 0x91d02032  ! 283: Tcc_I	ta	icc_or_xcc, %r0 + 50
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_179
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_179:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 284: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0x87ac4a53  ! 285: FCMPd	fcmpd	%fcc<n>, %f48, %f50
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_180) + 8, 16, 16)) -> intp(2,0,8)
intvec_4_180:
	.word 0x39400001  ! 286: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95450000  ! 287: RD_SET_SOFTINT	rd	%set_softint, %r10
fpinit_4_181:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 288: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xe28fe038  ! 289: LDUBA_I	lduba	[%r31, + 0x0038] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_182
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_182:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 290: RDPC	rd	%pc, %r20
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 291: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0x9f803559  ! 292: SIR	sir	0x1559
splash_cmpr_4_184:
	setx 0xd9267fa173bd0fb0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 293: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_4_185:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_185-donret_4_185-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004a89da | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb0f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_185:
	.word 0xd6ffe0e8  ! 294: SWAPA_I	swapa	%r11, [%r31 + 0x00e8] %asi
	.word 0xd737c000  ! 295: STQF_R	-	%f11, [%r0, %r31]
	.word 0xd727e057  ! 296: STF_I	st	%f11, [0x0057, %r31]
	.word 0xd66fe0fb  ! 297: LDSTUB_I	ldstub	%r11, [%r31 + 0x00fb]
splash_lsu_4_186:
	set 0xcdf056fc, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe187e0e0  ! 299: LDFA_I	lda	[%r31, 0x00e0], %f16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 300: LDX_R	ldx	[%r31 + %r0], %r11
intveclr_4_187:
	setx 0x81a1e9c173e8ce84, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_188:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_4_188:
	mov 0xfb0, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe187de00  ! 302: LDFA_R	lda	[%r31, %r0], %f16
	setx 0xd3b29632d1740066, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_189:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9032e8  ! 304: WRPR_PSTATE_I	wrpr	%r0, 0x12e8, %pstate
DS_4_190:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb34e0d8  ! 1: STQF_I	-	%f13, [0x00d8, %r19]
	normalw
	.word 0x93458000  ! 305: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xe65fe038  ! 306: LDX_I	ldx	[%r31 + 0x0038], %r19
	.word 0xe6bfe0dc  ! 307: STDA_I	stda	%r19, [%r31 + 0x00dc] %asi
pmu_4_191:
	nop
	setx 0xfffffd39fffff9e1, %g1, %g7
	.word 0xa3800007  ! 308: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe727e054  ! 309: STF_I	st	%f19, [0x0054, %r31]
pmu_4_192:
	nop
	setx 0xfffff594fffffeba, %g1, %g7
	.word 0xa3800007  ! 310: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68008a0  ! 311: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
pmu_4_193:
	nop
	setx 0xfffff341fffffe05, %g1, %g7
	.word 0xa3800007  ! 312: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_4_194-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_194:
	.word 0x91950012  ! 313: WRPR_PIL_R	wrpr	%r20, %r18, %pil
mondo_4_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d904011  ! 314: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
	.word 0xa9840014  ! 315: WR_SET_SOFTINT_R	wr	%r16, %r20, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_196) + 24, 16, 16)) -> intp(4,0,1)
intvec_4_196:
	.word 0x39400001  ! 316: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_197
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_197:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 317: RDPC	rd	%pc, %r9
mondo_4_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d904013  ! 318: WRPR_WSTATE_R	wrpr	%r1, %r19, %wstate
fpinit_4_199:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 319: FCMPd	fcmpd	%fcc<n>, %f0, %f4
intveclr_4_200:
	setx 0xaaf17fb5dcfc730d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 320: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9a00173  ! 321: FABSq	dis not found

intveclr_4_201:
	setx 0xc2d8416f6dd8d34e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_202) + 16, 16, 16)) -> intp(5,0,15)
intvec_4_202:
	.word 0x39400001  ! 323: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_203:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 324: RDPC	rd	%pc, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_204) + 24, 16, 16)) -> intp(6,0,25)
intvec_4_204:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_205:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 326: RDPC	rd	%pc, %r20
	.word 0xda3c800a  ! 327: STD_R	std	%r13, [%r18 + %r10]
	.word 0xdac7e020  ! 328: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r13
	.word 0x93d02032  ! 329: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xc187da00  ! 330: LDFA_R	lda	[%r31, %r0], %f0
	.word 0x91d02034  ! 331: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xda8008a0  ! 332: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x87ac4a50  ! 333: FCMPd	fcmpd	%fcc<n>, %f48, %f16
	.word 0x24c8c001  ! 334: BRLEZ	brlez,a,pt	%r3,<label_0x8c001>
intveclr_4_209:
	setx 0xf116fc3b6cd21649, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 335: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_210
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_210
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_210:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 336: RDPC	rd	%pc, %r11
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_211
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_211:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 337: CASA_R	casa	[%r31] %asi, %r19, %r11
pmu_4_212:
	nop
	setx 0xfffff7cbfffff2af, %g1, %g7
	.word 0xa3800007  ! 338: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc3ea8028  ! 339: PREFETCHA_R	prefetcha	[%r10, %r8] 0x01, #one_read
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_213
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_213:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 340: CASA_R	casa	[%r31] %asi, %r18, %r16
intveclr_4_214:
	setx 0x0dcc144f051f9048, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 341: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_215
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_215:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 342: CASA_R	casa	[%r31] %asi, %r18, %r16
	.word 0xe08008a0  ! 343: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_4_216:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d94c000  ! 344: WRPR_WSTATE_R	wrpr	%r19, %r0, %wstate
DS_4_217:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 345: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_218:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 346: RDPC	rd	%pc, %r17
mondo_4_219:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d930006  ! 347: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
	.word 0x93500000  ! 348: RDPR_TPC	rdpr	%tpc, %r9
	.word 0xda6fe043  ! 349: LDSTUB_I	ldstub	%r13, [%r31 + 0x0043]
	.word 0xda57c000  ! 350: LDSH_R	ldsh	[%r31 + %r0], %r13
jmptr_4_220:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 351: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_4_221:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 352: FCMPd	fcmpd	%fcc<n>, %f0, %f4
intveclr_4_222:
	setx 0xd784d10bd223e363, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 353: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_223
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_223
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_223:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 354: RDPC	rd	%pc, %r18
	.word 0x9f802a93  ! 355: SIR	sir	0x0a93
donret_4_224:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_224-donret_4_224), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fc859e | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xad4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_224:
	.word 0xe6ffe0c4  ! 356: SWAPA_I	swapa	%r19, [%r31 + 0x00c4] %asi
	.word 0x9f8032a7  ! 357: SIR	sir	0x12a7
debug_4_225:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfc3e0  ! 358: STDFA_R	stda	%f16, [%r0, %r31]
	rd %pc, %r19
	add %r19, (ivw_4_226-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_226:
	.word 0x91934010  ! 359: WRPR_PIL_R	wrpr	%r13, %r16, %pil
	.word 0x91a409b1  ! 360: FDIVs	fdivs	%f16, %f17, %f8
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
	.word 0xd1e7e008  ! 361: CASA_R	casa	[%r31] %asi, %r8, %r8
	.word 0x93a0016c  ! 362: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_228
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_228
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_228:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 363: RDPC	rd	%pc, %r10
	.word 0x87aa4a4b  ! 364: FCMPd	fcmpd	%fcc<n>, %f40, %f42
	.word 0xd137e09c  ! 365: STQF_I	-	%f8, [0x009c, %r31]
donret_4_230:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_230-donret_4_230), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0011cd8f | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc1e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_230:
	.word 0xd0ffe04a  ! 366: SWAPA_I	swapa	%r8, [%r31 + 0x004a] %asi
change_to_randtl_4_231:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_231:
	.word 0x8f902000  ! 367: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xad803b55  ! 368: WR_SOFTINT_REG_I	wr	%r0, 0x1b55, %softint
	.word 0xa984c002  ! 369: WR_SET_SOFTINT_R	wr	%r19, %r2, %set_softint
	.word 0x8d903ce5  ! 370: WRPR_PSTATE_I	wrpr	%r0, 0x1ce5, %pstate
splash_lsu_4_232:
	set 0x15fb267a, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 371: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd137e000  ! 372: STQF_I	-	%f8, [0x0000, %r31]
	.word 0x87aa0a51  ! 373: FCMPd	fcmpd	%fcc<n>, %f8, %f48
memptr_4_234:
	set user_data_start, %r31
	.word 0x8584b785  ! 374: WRCCR_I	wr	%r18, 0x1785, %ccr
mondo_4_235:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d94c010  ! 375: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0xd337c000  ! 376: STQF_R	-	%f9, [%r0, %r31]
	.word 0xd317c000  ! 377: LDQF_R	-	[%r31, %r0], %f9
    set 0x1c29, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb347f0  ! 378: PDISTN	fmean16	%d44, %d16, %d44
	.word 0xc3693693  ! 379: PREFETCH_I	prefetch	[%r4 + 0xfffff693], #one_read
	setx 0x3bace85555e40332, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_237:
	.word 0x39400001  ! 380: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f802c51  ! 381: SIR	sir	0x0c51
	.word 0xa1a00172  ! 382: FABSq	dis not found

intveclr_4_238:
	setx 0x34f9c93a0c119c1f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 383: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97a00174  ! 384: FABSq	dis not found

	.word 0x8d9035b9  ! 385: WRPR_PSTATE_I	wrpr	%r0, 0x15b9, %pstate
splash_htba_4_239:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 386: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_240
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_240:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 387: RDPC	rd	%pc, %r16
	.word 0xd05fe018  ! 388: LDX_I	ldx	[%r31 + 0x0018], %r8
splash_cmpr_4_241:
	setx 0xa4f043935380701f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02034  ! 390: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_lsu_4_242:
	set 0x4b578d07, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 391: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_243
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_243
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_243:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 392: RDPC	rd	%pc, %r10
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_244
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_244:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e001  ! 393: CASA_R	casa	[%r31] %asi, %r1, %r9
debug_4_245:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_4_245:
	mov 0x864, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfc2c0  ! 394: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd257c000  ! 395: LDSH_R	ldsh	[%r31 + %r0], %r9
	.word 0x9f802c21  ! 396: SIR	sir	0x0c21
mondo_4_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d92800a  ! 397: WRPR_WSTATE_R	wrpr	%r10, %r10, %wstate
	.word 0xd26fe0e4  ! 398: LDSTUB_I	ldstub	%r9, [%r31 + 0x00e4]
	.word 0xa3a00170  ! 399: FABSq	dis not found

	.word 0xe2bfe020  ! 400: STDA_I	stda	%r17, [%r31 + 0x0020] %asi
	.word 0xe20fc000  ! 401: LDUB_R	ldub	[%r31 + %r0], %r17
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 402: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe317c000  ! 403: LDQF_R	-	[%r31, %r0], %f17
pmu_4_247:
	nop
	setx 0xffffff58ffffff0e, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_4_248:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8307a  ! 405: PREFETCHA_I	prefetcha	[%r0, + 0xfffff07a] %asi, #one_read
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 406: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7702134  ! 407: POPC_I	popc	0x0134, %r19
	.word 0xa982000b  ! 408: WR_SET_SOFTINT_R	wr	%r8, %r11, %set_softint
	.word 0x29800001  ! 409: FBL	fbl,a	<label_0x1>
intveclr_4_250:
	setx 0xb7bc8cfb27011b60, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 410: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9a089cb  ! 411: FDIVd	fdivd	%f2, %f42, %f20
	rd %pc, %r19
	add %r19, (ivw_4_251-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_251:
	.word 0x91900002  ! 412: WRPR_PIL_R	wrpr	%r0, %r2, %pil
	.word 0x9f80335b  ! 413: SIR	sir	0x135b
    set 0x3363, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b447e0  ! 414: PDISTN	fmean16	%d48, %d0, %d40
	rd %pc, %r19
	add %r19, (ivw_4_252-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_252:
	.word 0x9191c013  ! 415: WRPR_PIL_R	wrpr	%r7, %r19, %pil
	.word 0xe48fe000  ! 416: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
	.word 0x2a700001  ! 417: BPCS	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 418: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4800c20  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r18
	.word 0xe187d920  ! 420: LDFA_R	lda	[%r31, %r0], %f16
change_to_randtl_4_253:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_253:
	.word 0x8f902002  ! 421: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x97a00174  ! 422: FABSq	dis not found

splash_hpstate_4_254:
	.word 0x8198281e  ! 423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081e, %hpstate
mondo_4_255:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d934014  ! 424: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
	.word 0x9f8025ea  ! 425: SIR	sir	0x05ea
	.word 0x93454000  ! 426: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
intveclr_4_256:
	setx 0x0cf31e49f4059e79, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 427: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_257:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 428: RDPC	rd	%pc, %r18
	rd %pc, %r19
	add %r19, (ivw_4_258-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_258:
	.word 0x91928013  ! 429: WRPR_PIL_R	wrpr	%r10, %r19, %pil
splash_cmpr_4_259:
	setx 0xec13476c2d4bf59e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 430: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7848011  ! 431: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r17, %-
	.word 0xe857c000  ! 432: LDSH_R	ldsh	[%r31 + %r0], %r20
	.word 0x91540000  ! 433: RDPR_GL	<illegal instruction>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_261
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_261:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 434: CASA_R	casa	[%r31] %asi, %r16, %r9
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_262
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_262:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 435: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01965  ! 436: FqTOd	dis not found

	.word 0xa3a00163  ! 437: FABSq	dis not found

change_to_randtl_4_264:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_264:
	.word 0x8f902001  ! 438: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_4_265:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_265:
	.word 0x8f902001  ! 439: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_4_266:
	setx 0x5c16de2d383735de, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916c3d26  ! 441: SDIVX_I	sdivx	%r16, 0xfffffd26, %r8
splash_cmpr_4_268:
	setx 0xde163af12fba72f4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 442: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd127e004  ! 443: STF_I	st	%f8, [0x0004, %r31]
	.word 0x83d02035  ! 444: Tcc_I	te	icc_or_xcc, %r0 + 53
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 445: Tcc_R	ta	icc_or_xcc, %r0 + %r30
jmptr_4_269:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 446: JMPL_R	jmpl	%r27 + %r0, %r27
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
	.word 0x91414000  ! 447: RDPC	rd	%pc, %r8
	.word 0xd937e008  ! 448: STQF_I	-	%f12, [0x0008, %r31]
pmu_4_271:
	nop
	setx 0xfffffcb8fffffe7f, %g1, %g7
	.word 0xa3800007  ! 449: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_4_272:
	nop
	setx 0xfffffa7efffff967, %g1, %g7
	.word 0xa3800007  ! 450: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_htba_4_273:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 451: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd89fe020  ! 452: LDDA_I	ldda	[%r31, + 0x0020] %asi, %r12
	.word 0x8d903756  ! 453: WRPR_PSTATE_I	wrpr	%r0, 0x1756, %pstate
	.word 0x99902003  ! 454: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
pmu_4_274:
	nop
	setx 0xfffffb4afffffac7, %g1, %g7
	.word 0xa3800007  ! 455: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_4_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d94c009  ! 456: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
	.word 0xd88008a0  ! 457: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xd238400c  ! 458: STD_R	std	%r9, [%r1 + %r12]
splash_lsu_4_277:
	set 0xc94e97a9, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 459: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd31fc000  ! 460: LDDF_R	ldd	[%r31, %r0], %f9
	rd %pc, %r19
	add %r19, (ivw_4_278-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_278:
	.word 0x91944011  ! 461: WRPR_PIL_R	wrpr	%r17, %r17, %pil
	.word 0xd277e071  ! 462: STX_I	stx	%r9, [%r31 + 0x0071]
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
	.word 0xa7414000  ! 463: RDPC	rd	%pc, %r19
	.word 0x39400001  ! 464: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01973  ! 465: FqTOd	dis not found

splash_hpstate_4_282:
	.word 0x81982cac  ! 466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cac, %hpstate
change_to_randtl_4_283:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_283:
	.word 0x8f902002  ! 467: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xda3fc000  ! 468: STD_R	std	%r13, [%r31 + %r0]
	.word 0x91d020b3  ! 469: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x93d020b4  ! 470: Tcc_I	tne	icc_or_xcc, %r0 + 180
intveclr_4_284:
	setx 0x9e10309d60402df3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 471: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_285:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d948010  ! 472: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	.word 0xda77c000  ! 473: STX_R	stx	%r13, [%r31 + %r0]
pmu_4_286:
	nop
	setx 0xfffff05afffff3ff, %g1, %g7
	.word 0xa3800007  ! 474: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xdacfe000  ! 475: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r13
	.word 0x9f8025c0  ! 476: SIR	sir	0x05c0
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 477: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdb37e0f9  ! 478: STQF_I	-	%f13, [0x00f9, %r31]
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_287
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_287
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_287:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 479: RDPC	rd	%pc, %r18
splash_cmpr_4_288:
	setx 0x70d5f157b44a0dfb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 480: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9480000  ! 481: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	rd %pc, %r19
	add %r19, (ivw_4_289-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_289:
	.word 0x91928001  ! 482: WRPR_PIL_R	wrpr	%r10, %r1, %pil
donret_4_290:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_290-donret_4_290), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002e6dc2 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x316, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_290:
	.word 0xe8ffe044  ! 483: SWAPA_I	swapa	%r20, [%r31 + 0x0044] %asi
	.word 0x39400001  ! 484: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd497e030  ! 485: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
	.word 0xd51fc000  ! 486: LDDF_R	ldd	[%r31, %r0], %f10
	.word 0xa7840002  ! 487: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r2, %-
	.word 0xd527c000  ! 488: STF_R	st	%f10, [%r0, %r31]
splash_hpstate_4_293:
	.word 0x81982f4c  ! 489: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4c, %hpstate
	.word 0xd46fe0a0  ! 490: LDSTUB_I	ldstub	%r10, [%r31 + 0x00a0]
jmptr_4_294:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 491: JMPL_R	jmpl	%r27 + %r0, %r27
debug_4_295:
	nop
	ta T_CHANGE_HPRIV
debug_iva_4_295:
	mov 0x552, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+8), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd960  ! 492: STDFA_R	stda	%f0, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_296
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_296:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 493: RDPC	rd	%pc, %r17
	.word 0x9f802747  ! 494: SIR	sir	0x0747
pmu_4_297:
	nop
	setx 0xfffff64efffffb4e, %g1, %g7
	.word 0xa3800007  ! 495: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_4_298:
	setx 0x23764f4178803bba, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 496: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_299:
	setx 0x7b2af278389e7bc8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 497: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe80fe000  ! 498: LDUB_I	ldub	[%r31 + 0x0000], %r20
	.word 0x95a00170  ! 499: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01972  ! 500: FqTOd	dis not found

splash_cmpr_4_301:
	setx 0x4941fa85cba7c345, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 501: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_302:
	setx 0x8829446e4e8bd3bc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 502: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9b45c000  ! 503: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xd537c000  ! 504: STQF_R	-	%f10, [%r0, %r31]
	.word 0x9f802008  ! 505: SIR	sir	0x0008
	rd %pc, %r19
	add %r19, (ivw_4_303-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_303:
	.word 0x91934001  ! 506: WRPR_PIL_R	wrpr	%r13, %r1, %pil
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 507: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_4_304:
	setx 0x7c8091231c479181, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 508: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_4_305:
	.word 0xa7a189d3  ! 1: FDIVd	fdivd	%f6, %f50, %f50
	pdist %f6, %f4, %f2
	.word 0x97b4c311  ! 509: ALIGNADDRESS	alignaddr	%r19, %r17, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_306) + 24, 16, 16)) -> intp(6,0,24)
intvec_4_306:
	.word 0x39400001  ! 510: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_307:
	setx 0x87b9959ff1204b1f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 511: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f8020f3  ! 512: SIR	sir	0x00f3
splash_lsu_4_308:
	set 0x05dabeec, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 513: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_4_309:
	setx 0x1f965706b7825857, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 514: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 515: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda800c80  ! 516: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r13
pmu_4_310:
	nop
	setx 0xfffff636fffff6c0, %g1, %g7
	.word 0xa3800007  ! 517: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38700001  ! 518: BPGU	<illegal instruction>
	.word 0xa7850002  ! 519: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r2, %-
	.word 0xda6fe02f  ! 520: LDSTUB_I	ldstub	%r13, [%r31 + 0x002f]
    set 0x1ae8, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b187e0  ! 521: PDISTN	fmean16	%d6, %d0, %d20
mondo_4_312:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d934009  ! 522: WRPR_WSTATE_R	wrpr	%r13, %r9, %wstate
donret_4_313:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_313-donret_4_313-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004bc798 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe8f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_313:
	.word 0xdaffe0d8  ! 523: SWAPA_I	swapa	%r13, [%r31 + 0x00d8] %asi
	.word 0x9f80287f  ! 524: SIR	sir	0x087f
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01974  ! 525: FqTOd	dis not found

	.word 0xdacfe038  ! 526: LDSBA_I	ldsba	[%r31, + 0x0038] %asi, %r13
	.word 0x9ba2c9b4  ! 527: FDIVs	fdivs	%f11, %f20, %f13
mondo_4_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d904013  ! 528: WRPR_WSTATE_R	wrpr	%r1, %r19, %wstate
	.word 0xd41fe038  ! 529: LDD_I	ldd	[%r31 + 0x0038], %r10
	.word 0xd537e07d  ! 530: STQF_I	-	%f10, [0x007d, %r31]
DS_4_316:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd5353fb6  ! 1: STQF_I	-	%f10, [0x1fb6, %r20]
	normalw
	.word 0xa1458000  ! 531: RD_SOFTINT_REG	rd	%softint, %r16
cwp_4_317:
    set user_data_start, %o7
	.word 0x93902007  ! 532: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_cmpr_4_318:
	setx 0x6f326d41ac6d2902, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 533: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_4_319:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_319-donret_4_319-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00050e3a | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf45, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_319:
	.word 0xdaffe081  ! 534: SWAPA_I	swapa	%r13, [%r31 + 0x0081] %asi
	.word 0xa9a00169  ! 535: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 536: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xe2800a80  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r17
mondo_4_320:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d900007  ! 538: WRPR_WSTATE_R	wrpr	%r0, %r7, %wstate
	.word 0x87a8ca4d  ! 539: FCMPd	fcmpd	%fcc<n>, %f34, %f44
jmptr_4_322:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 540: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe4800ae0  ! 541: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r18
pmu_4_323:
	nop
	setx 0xfffff050fffff140, %g1, %g7
	.word 0xa3800007  ! 542: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_4_324:
	set 0xa94289f9, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 543: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_4_325:
	nop
	ta T_CHANGE_HPRIV
debug_iva_4_325:
	mov 0x5ab, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+40), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfde00  ! 544: STDFA_R	stda	%f0, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_326) + 24, 16, 16)) -> intp(3,0,7)
intvec_4_326:
	.word 0x39400001  ! 545: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_4_327:
	setx 0x91f762ad0e03a739, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 546: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_328:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d924013  ! 547: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
	.word 0x94d12ea4  ! 548: UMULcc_I	umulcc 	%r4, 0x0ea4, %r10
memptr_4_329:
	set 0x60740000, %r31
	.word 0x8584b3c8  ! 549: WRCCR_I	wr	%r18, 0x13c8, %ccr
	.word 0x9f8030ac  ! 550: SIR	sir	0x10ac
memptr_4_330:
	set user_data_start, %r31
	.word 0x8584b5cc  ! 551: WRCCR_I	wr	%r18, 0x15cc, %ccr
	.word 0xc1bfde00  ! 552: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x93b444d4  ! 553: FCMPNE32	fcmpne32	%d48, %d20, %r9
splash_cmpr_4_332:
	setx 0xc0c3cdcbd82aa059, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 554: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a1c9c2  ! 555: FDIVd	fdivd	%f38, %f2, %f48
jmptr_4_333:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 556: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x93a149a6  ! 557: FDIVs	fdivs	%f5, %f6, %f9
	.word 0xd48008a0  ! 558: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01974  ! 559: FqTOd	dis not found

	.word 0x95a489c3  ! 560: FDIVd	fdivd	%f18, %f34, %f10
debug_4_336:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe000  ! 561: STDFA_I	stda	%f16, [0x0000, %r31]
	.word 0x91d020b5  ! 562: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xda1fc000  ! 563: LDD_R	ldd	[%r31 + %r0], %r13
mondo_4_337:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d91c012  ! 564: WRPR_WSTATE_R	wrpr	%r7, %r18, %wstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_338
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_338
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_338:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 565: RDPC	rd	%pc, %r19
	.word 0x24cc8001  ! 566: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	.word 0xe657e020  ! 567: LDSH_I	ldsh	[%r31 + 0x0020], %r19
splash_hpstate_4_340:
	.word 0x81982b57  ! 568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b57, %hpstate
	.word 0xe64fc000  ! 569: LDSB_R	ldsb	[%r31 + %r0], %r19
splash_lsu_4_341:
	set 0x9fd2f9ab, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 570: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
fpinit_4_342:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 571: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_lsu_4_343:
	set 0xe07c291a, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 572: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01971  ! 573: FqTOd	dis not found

	.word 0xd6800b80  ! 574: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_345)+56, 16, 16)) -> intp(4,1,3)
xir_4_345:
	.word 0xa9843c6c  ! 575: WR_SET_SOFTINT_I	wr	%r16, 0x1c6c, %set_softint
	.word 0xd677e01c  ! 576: STX_I	stx	%r11, [%r31 + 0x001c]
jmptr_4_346:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 577: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x061d88c2c3a52aa6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_347:
	.word 0x39400001  ! 578: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 579: LDX_R	ldx	[%r31 + %r0], %r11
pmu_4_348:
	nop
	setx 0xffffff3ffffffb6e, %g1, %g7
	.word 0xa3800007  ! 580: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f803638  ! 581: SIR	sir	0x1638
	.word 0x83d02035  ! 582: Tcc_I	te	icc_or_xcc, %r0 + 53
DS_4_349:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 583: SAVE_R	save	%r31, %r0, %r31
pmu_4_350:
	nop
	setx 0xfffff220fffff458, %g1, %g7
	.word 0xa3800007  ! 584: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_4_351:
	taddcctv %r11, 0x1dea, %r11
	.word 0xd607e0d9  ! 585: LDUW_I	lduw	[%r31 + 0x00d9], %r11
	.word 0x87acca50  ! 586: FCMPd	fcmpd	%fcc<n>, %f50, %f16
	.word 0x39400001  ! 587: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x24cc4001  ! 588: BRLEZ	brlez,a,pt	%r17,<label_0xc4001>
splash_hpstate_4_354:
	.word 0x8198270c  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070c, %hpstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 590: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_4_355:
	setx 0x9298e3cdf2207b91, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 591: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4c7e010  ! 592: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r18
	.word 0x8d902aff  ! 593: WRPR_PSTATE_I	wrpr	%r0, 0x0aff, %pstate
mondo_4_356:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d94c009  ! 594: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
jmptr_4_357:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 595: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe48008a0  ! 596: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
jmptr_4_358:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 597: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_4_359:
	setx 0xa592c7862eab1fa6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 598: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_4_360:
	nop
	setx 0xfffff683fffff244, %g1, %g7
	.word 0xa3800007  ! 599: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_361
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_361:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 600: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0xe4800aa0  ! 601: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r18
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_362
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_362:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 602: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0x9f803438  ! 603: SIR	sir	0x1438
	.word 0xe53fe045  ! 604: STDF_I	std	%f18, [0x0045, %r31]
	.word 0xe537c000  ! 605: STQF_R	-	%f18, [%r0, %r31]
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 606: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe51fe020  ! 607: LDDF_I	ldd	[%r31, 0x0020], %f18
	.word 0x8d902487  ! 608: WRPR_PSTATE_I	wrpr	%r0, 0x0487, %pstate
jmptr_4_363:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 609: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x87ad0a4c  ! 610: FCMPd	fcmpd	%fcc<n>, %f20, %f12
intveclr_4_364:
	setx 0x8c709ba6028ccaaa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 611: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_365:
	setx 0xa829bb47ff114245, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 612: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_366:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe060  ! 613: STDFA_I	stda	%f16, [0x0060, %r31]
splash_cmpr_4_367:
	setx 0x1e1de9be7d4daaed, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 614: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe1bfe040  ! 615: STDFA_I	stda	%f16, [0x0040, %r31]
	.word 0xe25fe030  ! 616: LDX_I	ldx	[%r31 + 0x0030], %r17
	.word 0xa145c000  ! 617: RD_TICK_CMPR_REG	rd	%-, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_368) + 24, 16, 16)) -> intp(2,0,25)
intvec_4_368:
	.word 0x39400001  ! 618: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda1fc000  ! 619: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xe187e040  ! 620: LDFA_I	lda	[%r31, 0x0040], %f16
splash_tba_4_369:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 621: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x93454000  ! 622: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
tagged_4_370:
	tsubcctv %r20, 0x124a, %r3
	.word 0xe007e03d  ! 623: LDUW_I	lduw	[%r31 + 0x003d], %r16
memptr_4_371:
	set 0x60740000, %r31
	.word 0x85843ff5  ! 624: WRCCR_I	wr	%r16, 0x1ff5, %ccr
mondo_4_372:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d94c003  ! 625: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
	.word 0x83d020b3  ! 626: Tcc_I	te	icc_or_xcc, %r0 + 179
splash_htba_4_373:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 627: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_374
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_374:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00b  ! 628: CASA_R	casa	[%r31] %asi, %r11, %r16
	.word 0x95454000  ! 629: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	.word 0x91a00173  ! 630: FABSq	dis not found

	.word 0x93a4c9d3  ! 631: FDIVd	fdivd	%f50, %f50, %f40
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 632: LDX_R	ldx	[%r31 + %r0], %r19
cwp_4_375:
    set user_data_start, %o7
	.word 0x93902002  ! 633: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x81510000  ! 635: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe6800be0  ! 636: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r19
	rd %pc, %r19
	add %r19, (ivw_4_376-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_376:
	.word 0x91900013  ! 637: WRPR_PIL_R	wrpr	%r0, %r19, %pil
intveclr_4_377:
	setx 0xc52f9e56a0238c1b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 638: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 639: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_4_378:
	set 0xea1454e9, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 640: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe68008a0  ! 641: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe627e0a9  ! 642: STW_I	stw	%r19, [%r31 + 0x00a9]
	.word 0x91d02034  ! 643: Tcc_I	ta	icc_or_xcc, %r0 + 52
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_379
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_379:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 644: CASA_R	casa	[%r31] %asi, %r16, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_380) + 48, 16, 16)) -> intp(3,0,6)
intvec_4_380:
	.word 0x39400001  ! 645: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7850013  ! 646: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r19, %-
mondo_4_382:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d94400b  ! 647: WRPR_WSTATE_R	wrpr	%r17, %r11, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b69b7b5  ! 648: SDIVX_I	sdivx	%r6, 0xfffff7b5, %r13
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
	.word 0xa7414000  ! 649: RDPC	rd	%pc, %r19
	.word 0xd42fe093  ! 650: STB_I	stb	%r10, [%r31 + 0x0093]
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 651: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5693e1b  ! 652: SDIVX_I	sdivx	%r4, 0xfffffe1b, %r18
splash_lsu_4_386:
	set 0x6479778a, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 653: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x39400001  ! 654: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa345c000  ! 655: RD_TICK_CMPR_REG	rd	%-, %r17
splash_lsu_4_388:
	set 0x4981f831, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 656: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9745c000  ! 657: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0x9284f208  ! 658: ADDcc_I	addcc 	%r19, 0xfffff208, %r9
debug_4_389:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_4_389:
	mov 0xc09, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdc00  ! 659: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe88008a0  ! 660: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
jmptr_4_390:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 661: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_4_391:
	nop
	setx 0xfffff605fffff1bb, %g1, %g7
	.word 0xa3800007  ! 662: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa3540000  ! 663: RDPR_GL	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_4_392-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_392:
	.word 0x9190800c  ! 664: WRPR_PIL_R	wrpr	%r2, %r12, %pil
splash_lsu_4_393:
	set 0x8cc4f9b8, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 665: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_4_394:
	nop
	setx 0xfffff9acfffffaa4, %g1, %g7
	.word 0xa3800007  ! 666: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_395
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_395:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 667: CASA_R	casa	[%r31] %asi, %r12, %r13
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_396
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_396:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 668: CASA_R	casa	[%r31] %asi, %r12, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 669: LDX_R	ldx	[%r31 + %r0], %r13
splash_cmpr_4_397:
	setx 0x597c558881d3aa48, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 670: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_398:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 671: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_399
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_399
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_399:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 672: RDPC	rd	%pc, %r19
    set 0x7da, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b047e9  ! 673: PDISTN	fmean16	%d32, %d40, %d16
	.word 0x97a00174  ! 674: FABSq	dis not found

mondo_4_400:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d950010  ! 675: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
	rd %pc, %r19
	add %r19, (ivw_4_401-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_401:
	.word 0x9192c011  ! 676: WRPR_PIL_R	wrpr	%r11, %r17, %pil
mondo_4_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d910011  ! 677: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
fpinit_4_403:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 678: FDIVs	fdivs	%f0, %f4, %f4
    set 0x20cf, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b507ed  ! 679: PDISTN	fmean16	%d20, %d44, %d8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01967  ! 680: FqTOd	dis not found

cwp_4_405:
    set user_data_start, %o7
	.word 0x93902002  ! 681: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_406
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_406:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 682: CASA_R	casa	[%r31] %asi, %r5, %r17
splash_cmpr_4_407:
	setx 0x980ef5af05c36d1b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 683: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_4_408:
	set 0xd3ed6ad4, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 684: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 685: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x93500000  ! 686: RDPR_TPC	<illegal instruction>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_409:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 687: RDPC	rd	%pc, %r19
	.word 0x97480000  ! 688: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_410
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_410:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 689: CASA_R	casa	[%r31] %asi, %r5, %r18
fpinit_4_411:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82678  ! 690: PREFETCHA_I	prefetcha	[%r0, + 0x0678] %asi, #one_read
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
	.word 0xe5e7e005  ! 691: CASA_R	casa	[%r31] %asi, %r5, %r18
jmptr_4_413:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 692: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_4_414:
	nop
	setx 0xfffffc9afffff2b2, %g1, %g7
	.word 0xa3800007  ! 693: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_4_415-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_415:
	.word 0x91948004  ! 694: WRPR_PIL_R	wrpr	%r18, %r4, %pil
splash_hpstate_4_416:
	.word 0x81982a04  ! 695: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a04, %hpstate
donret_4_417:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_417-donret_4_417-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a547ac | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x2cc, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_417:
	.word 0xe4ffe03c  ! 696: SWAPA_I	swapa	%r18, [%r31 + 0x003c] %asi
debug_4_418:
	nop
	ta T_CHANGE_HPRIV
debug_iva_4_418:
	mov 0x46e, %r20
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
	.word 0xe1bfe0c0  ! 697: STDFA_I	stda	%f16, [0x00c0, %r31]
pmu_4_419:
	nop
	setx 0xfffffd7bfffff1bc, %g1, %g7
	.word 0xa3800007  ! 698: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_4_420:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d94000b  ! 699: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
	.word 0x93540000  ! 700: RDPR_GL	<illegal instruction>
DS_4_421:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe9343f49  ! 1: STQF_I	-	%f20, [0x1f49, %r16]
	normalw
	.word 0x97458000  ! 701: RD_SOFTINT_REG	rd	%softint, %r11
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xab813a71  ! 1: WR_CLEAR_SOFTINT_I	wr	%r4, 0x1a71, %clear_softint
	.word 0xa9a409c9  ! 2: FDIVd	fdivd	%f16, %f40, %f20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 3: LDX_R	ldx	[%r31 + %r0], %r18
intveclr_2_1:
	setx 0xf86bcb479fb39a33, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 4: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_2:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_2_2:
	mov 0xbc4, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdb60  ! 5: STDFA_R	stda	%f16, [%r0, %r31]
splash_lsu_2_3:
	set 0xd4d64898, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 6: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_2_4:
	setx 0xc114f0e5ed77ba7d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_2_5:
	setx 0x1689c9046bfe9948, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 8: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_6:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe187c3e0  ! 9: LDFA_R	lda	[%r31, %r0], %f16
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_7:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 10: RDPC	rd	%pc, %r16
intveclr_2_8:
	setx 0xe0e4239bcc998107, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 11: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_9
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_9:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 12: RDPC	rd	%pc, %r9
	.word 0xe81fc000  ! 13: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0x87ab0a52  ! 14: FCMPd	fcmpd	%fcc<n>, %f12, %f18
	.word 0x9f8039a0  ! 15: SIR	sir	0x19a0
	.word 0xe69fd100  ! 16: LDDA_R	ldda	[%r31, %r0] 0x88, %r19
	setx 0x44487fb69f595541, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_11:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_2_12:
	setx 0x48027dbd1bbc4ff0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 18: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_13
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_13:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 19: CASA_R	casa	[%r31] %asi, %r16, %r19
	.word 0xab82c005  ! 20: WR_CLEAR_SOFTINT_R	wr	%r11, %r5, %clear_softint
	.word 0x97a009d1  ! 21: FDIVd	fdivd	%f0, %f48, %f42
intveclr_2_14:
	setx 0x0a6dc94aaabfe47a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 22: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 23: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_2_15:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d928002  ! 24: WRPR_WSTATE_R	wrpr	%r10, %r2, %wstate
jmptr_2_16:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 25: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_2_17:
	nop
	setx 0xfffff803fffff87a, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd46fe027  ! 27: LDSTUB_I	ldstub	%r10, [%r31 + 0x0027]
	.word 0x83d020b2  ! 28: Tcc_I	te	icc_or_xcc, %r0 + 178
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 29: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_2_18:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe080  ! 30: STDFA_I	stda	%f16, [0x0080, %r31]
	setx 0x2832c96eb7b6914b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_19:
	.word 0x39400001  ! 31: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfdf20  ! 32: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x83d020b3  ! 33: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0xa9a089d3  ! 34: FDIVd	fdivd	%f2, %f50, %f20
splash_cmpr_2_20:
	setx 0x44d6a587d9d3237a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 35: WR_STICK_REG_R	wr	%r0, %r1, %-
jmptr_2_21:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 36: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_22:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 37: CASA_R	casa	[%r31] %asi, %r17, %r17
splash_hpstate_2_23:
	.word 0x8198200e  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000e, %hpstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_24:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 39: CASA_R	casa	[%r31] %asi, %r17, %r17
mondo_2_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d90000a  ! 40: WRPR_WSTATE_R	wrpr	%r0, %r10, %wstate
	.word 0xe257c000  ! 41: LDSH_R	ldsh	[%r31 + %r0], %r17
splash_cmpr_2_26:
	setx 0x77bd933b6c70693e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 42: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe33fc000  ! 43: STDF_R	std	%f17, [%r0, %r31]
	.word 0xab837f94  ! 44: WR_CLEAR_SOFTINT_I	wr	%r13, 0x1f94, %clear_softint
splash_hpstate_2_27:
	.word 0x81982fa7  ! 45: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fa7, %hpstate
change_to_randtl_2_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_28:
	.word 0x8f902000  ! 46: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_2_29:
	setx 0x648ebb4466e237c1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 47: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_30:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e008  ! 48: CASA_R	casa	[%r31] %asi, %r8, %r17
intveclr_2_31:
	setx 0x8d05e7ae1ba66fdf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 49: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_32) + 0, 16, 16)) -> intp(7,0,7)
intvec_2_32:
	.word 0x39400001  ! 50: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 51: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802099  ! 52: SIR	sir	0x0099
	.word 0x87ad0a47  ! 53: FCMPd	fcmpd	%fcc<n>, %f20, %f38
	.word 0xa3a409b2  ! 54: FDIVs	fdivs	%f16, %f18, %f17
	.word 0x29800001  ! 55: FBL	fbl,a	<label_0x1>
	.word 0x9f802ee8  ! 56: SIR	sir	0x0ee8
intveclr_2_35:
	setx 0xc78a4f5df201bef4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 57: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_2_36:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 58: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
memptr_2_37:
	set 0x60140000, %r31
	.word 0x8580b8ea  ! 59: WRCCR_I	wr	%r2, 0x18ea, %ccr
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_38:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 60: RDPC	rd	%pc, %r17
	.word 0xe44fc000  ! 61: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe537c000  ! 62: STQF_R	-	%f18, [%r0, %r31]
mondo_2_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d95000d  ! 63: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
	.word 0xe46fe055  ! 64: LDSTUB_I	ldstub	%r18, [%r31 + 0x0055]
jmptr_2_40:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 65: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01966  ! 66: FqTOd	dis not found

	.word 0xd88008a0  ! 67: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x9f803335  ! 68: SIR	sir	0x1335
intveclr_2_42:
	setx 0x3a78f1424116553e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_43:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e007  ! 70: CASA_R	casa	[%r31] %asi, %r7, %r12
splash_lsu_2_44:
	set 0x10f5929f, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 71: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_2_45:
	nop
	setx 0xfffff644fffff285, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_2_46:
	setx 0xab8814629bfb0e49, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_2_47-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_47:
	.word 0x91918003  ! 74: WRPR_PIL_R	wrpr	%r6, %r3, %pil
	.word 0x29800001  ! 75: FBL	fbl,a	<label_0x1>
	.word 0xc36cff8d  ! 76: PREFETCH_I	prefetch	[%r19 + 0xffffff8d], #one_read
mondo_2_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d908012  ! 77: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
	.word 0xa1a309c2  ! 78: FDIVd	fdivd	%f12, %f2, %f16
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_51
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_51
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_51:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 79: RDPC	rd	%pc, %r19
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_52:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e004  ! 80: CASA_R	casa	[%r31] %asi, %r4, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_53)+24, 16, 16)) -> intp(4,1,3)
xir_2_53:
	.word 0xa984294d  ! 81: WR_SET_SOFTINT_I	wr	%r16, 0x094d, %set_softint
	.word 0xe8d7e038  ! 82: LDSHA_I	ldsha	[%r31, + 0x0038] %asi, %r20
	.word 0x3e800001  ! 83: BVC	bvc,a	<label_0x1>
	.word 0xe937c000  ! 84: STQF_R	-	%f20, [%r0, %r31]
	.word 0x97454000  ! 85: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0xda47e028  ! 86: LDSW_I	ldsw	[%r31 + 0x0028], %r13
pmu_2_54:
	nop
	setx 0xfffff22dfffff0f1, %g1, %g7
	.word 0xa3800007  ! 87: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f8035e7  ! 88: SIR	sir	0x15e7
	setx 0xd656e8cc4b8b732a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_55:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_56:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e004  ! 90: CASA_R	casa	[%r31] %asi, %r4, %r13
mondo_2_57:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d944014  ! 91: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
splash_hpstate_2_58:
	.word 0x8198218c  ! 92: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018c, %hpstate
	.word 0xda9fc240  ! 93: LDDA_R	ldda	[%r31, %r0] 0x12, %r13
	.word 0x95a00173  ! 94: FABSq	dis not found

	.word 0xd26fe0cf  ! 95: LDSTUB_I	ldstub	%r9, [%r31 + 0x00cf]
	setx 0x255571d9c235f098, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_59:
	.word 0x39400001  ! 96: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd26fe0a1  ! 97: LDSTUB_I	ldstub	%r9, [%r31 + 0x00a1]
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 98: Tcc_R	tne	icc_or_xcc, %r0 + %r30
fpinit_2_60:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 99: FDIVs	fdivs	%f0, %f4, %f6
	.word 0x87ad0a51  ! 100: FCMPd	fcmpd	%fcc<n>, %f20, %f48
DS_2_61:
	.word 0xa9a449cc  ! 1: FDIVd	fdivd	%f48, %f12, %f20
	pdist %f18, %f4, %f4
	.word 0xa1b4c308  ! 101: ALIGNADDRESS	alignaddr	%r19, %r8, %r16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01961  ! 102: FqTOd	dis not found

pmu_2_63:
	nop
	setx 0xfffff8a4fffffa7d, %g1, %g7
	.word 0xa3800007  ! 103: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_2_64:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd967b593	! Random illegal ?
	.word 0xd1148008  ! 1: LDQF_R	-	[%r18, %r8], %f8
	.word 0x97a10832  ! 104: FADDs	fadds	%f4, %f18, %f11
	.word 0x99902002  ! 105: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xa1b48492  ! 106: FCMPLE32	fcmple32	%d18, %d18, %r16
	.word 0x9f803c9a  ! 107: SIR	sir	0x1c9a
	.word 0xd827e064  ! 108: STW_I	stw	%r12, [%r31 + 0x0064]
debug_2_65:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_2_65:
	mov 0xdb1, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfc2c0  ! 109: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd81fc000  ! 110: LDD_R	ldd	[%r31 + %r0], %r12
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_66:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 111: CASA_R	casa	[%r31] %asi, %r16, %r12
change_to_randtl_2_67:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_67:
	.word 0x8f902002  ! 112: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_2_68:
	setx 0x906e3ef0f4471696, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 113: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_69:
	setx 0xbed1bd398ea809fb, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 114: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_70
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_70:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 115: RDPC	rd	%pc, %r16
pmu_2_71:
	nop
	setx 0xfffff95bfffff8d5, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01973  ! 117: FqTOd	dis not found

	.word 0xe527e010  ! 118: STF_I	st	%f18, [0x0010, %r31]
mondo_2_73:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d930014  ! 119: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_74:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 120: CASA_R	casa	[%r31] %asi, %r13, %r18
splash_lsu_2_75:
	set 0xa128ef4a, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 121: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9818008  ! 122: WR_SET_SOFTINT_R	wr	%r6, %r8, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_76) + 16, 16, 16)) -> intp(2,0,25)
intvec_2_76:
	.word 0x39400001  ! 123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_2_77:
	nop
	setx 0xfffff97efffff850, %g1, %g7
	.word 0xa3800007  ! 124: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_2_78:
	nop
	setx 0xffffff9ffffff42c, %g1, %g7
	.word 0xa3800007  ! 125: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_79
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_79:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 126: CASA_R	casa	[%r31] %asi, %r19, %r18
pmu_2_80:
	nop
	setx 0xfffffe8cfffffc7d, %g1, %g7
	.word 0xa3800007  ! 127: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_2_81:
	set 0x19fb246e, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 128: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_2_82:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 129: RESTORE_R	restore	%r31, %r0, %r31
debug_2_83:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_2_83:
	mov 0x9d1, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc187da00  ! 130: LDFA_R	lda	[%r31, %r0], %f0
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916ca79b  ! 131: SDIVX_I	sdivx	%r18, 0x079b, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 132: LDX_R	ldx	[%r31 + %r0], %r16
change_to_randtl_2_85:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_85:
	.word 0x8f902000  ! 133: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_2_86:
	setx 0x267f9905909cd6d3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 134: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9a4c9d2  ! 135: FDIVd	fdivd	%f50, %f18, %f20
cwp_2_87:
    set user_data_start, %o7
	.word 0x93902006  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x26700001  ! 137: BPL	<illegal instruction>
	.word 0xd69fe008  ! 138: LDDA_I	ldda	[%r31, + 0x0008] %asi, %r11
mondo_2_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d920003  ! 139: WRPR_WSTATE_R	wrpr	%r8, %r3, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96b2b4b  ! 140: SDIVX_I	sdivx	%r12, 0x0b4b, %r20
	.word 0xe1bfe0e0  ! 141: STDFA_I	stda	%f16, [0x00e0, %r31]
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_90:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e004  ! 142: CASA_R	casa	[%r31] %asi, %r4, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01966  ! 143: FqTOd	dis not found

	.word 0xd41fe010  ! 144: LDD_I	ldd	[%r31 + 0x0010], %r10
splash_tba_2_92:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 145: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd0384005  ! 146: STD_R	std	%r8, [%r1 + %r5]
	.word 0xa7824013  ! 147: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r19, %-
	.word 0xc187e080  ! 148: LDFA_I	lda	[%r31, 0x0080], %f0
	.word 0xd0800a80  ! 149: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r8
	.word 0x9b454000  ! 150: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
pmu_2_95:
	nop
	setx 0xfffff525fffffc0a, %g1, %g7
	.word 0xa3800007  ! 151: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9ba349e4  ! 152: FDIVq	dis not found

splash_lsu_2_96:
	set 0x9555101d, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 153: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_97:
	setx 0xa035ba116c857f4e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 154: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab844014  ! 155: WR_CLEAR_SOFTINT_R	wr	%r17, %r20, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_98) + 40, 16, 16)) -> intp(3,0,0)
intvec_2_98:
	.word 0x39400001  ! 156: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 157: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_99
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_99:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e007  ! 159: CASA_R	casa	[%r31] %asi, %r7, %r18
	.word 0x97a1c9d3  ! 160: FDIVd	fdivd	%f38, %f50, %f42
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_100) + 8, 16, 16)) -> intp(4,0,5)
intvec_2_100:
	.word 0x39400001  ! 161: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93454000  ! 162: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0x81460000  ! 163: RD_STICK_REG	stbar
	.word 0xc3e9402a  ! 164: PREFETCHA_R	prefetcha	[%r5, %r10] 0x01, #one_read
mondo_2_101:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d94c00c  ! 165: WRPR_WSTATE_R	wrpr	%r19, %r12, %wstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_102
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_102:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 166: RDPC	rd	%pc, %r19
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_103:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 167: CASA_R	casa	[%r31] %asi, %r6, %r9
	rd %pc, %r19
	add %r19, (ivw_2_104-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_104:
	.word 0x91904009  ! 168: WRPR_PIL_R	wrpr	%r1, %r9, %pil
	.word 0xa782c013  ! 169: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r19, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_106)+24, 16, 16)) -> intp(4,1,3)
xir_2_106:
	.word 0xa9846c1a  ! 170: WR_SET_SOFTINT_I	wr	%r17, 0x0c1a, %set_softint
	.word 0xd327c000  ! 171: STF_R	st	%f9, [%r0, %r31]
	.word 0xd2800c20  ! 172: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 173: LDX_R	ldx	[%r31 + %r0], %r9
	rd %pc, %r19
	add %r19, (ivw_2_107-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_107:
	.word 0x91944012  ! 174: WRPR_PIL_R	wrpr	%r17, %r18, %pil
	.word 0xd2800a80  ! 175: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r9
splash_lsu_2_108:
	set 0x2f6d979c, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 176: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_109:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 177: CASA_R	casa	[%r31] %asi, %r6, %r9
pmu_2_110:
	nop
	setx 0xfffff42ffffff31a, %g1, %g7
	.word 0xa3800007  ! 178: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_2_111:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe020  ! 179: STDFA_I	stda	%f16, [0x0020, %r31]
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_112:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 180: CASA_R	casa	[%r31] %asi, %r6, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_113)+32, 16, 16)) -> intp(4,1,3)
xir_2_113:
	.word 0xa981345a  ! 181: WR_SET_SOFTINT_I	wr	%r4, 0x145a, %set_softint
memptr_2_114:
	set user_data_start, %r31
	.word 0x8580687d  ! 182: WRCCR_I	wr	%r1, 0x087d, %ccr
mondo_2_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d924014  ! 183: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_116) + 56, 16, 16)) -> intp(6,0,13)
intvec_2_116:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_2_117:
	set 0xc83157f8, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_118:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 186: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0xd237e0df  ! 187: STH_I	sth	%r9, [%r31 + 0x00df]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 188: LDX_R	ldx	[%r31 + %r0], %r9
jmptr_2_119:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 189: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd28008a0  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xc187e0a0  ! 191: LDFA_I	lda	[%r31, 0x00a0], %f0
cwp_2_120:
    set user_data_start, %o7
	.word 0x93902006  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_2_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d904004  ! 193: WRPR_WSTATE_R	wrpr	%r1, %r4, %wstate
mondo_2_122:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d908009  ! 194: WRPR_WSTATE_R	wrpr	%r2, %r9, %wstate
DS_2_123:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa9b18313  ! 195: ALIGNADDRESS	alignaddr	%r6, %r19, %r20
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 196: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_124
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_124:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 197: RDPC	rd	%pc, %r20
	.word 0xa750c000  ! 198: RDPR_TT	<illegal instruction>
	.word 0x29800001  ! 199: FBL	fbl,a	<label_0x1>
DS_2_126:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 200: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_2_127-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_127:
	.word 0x91950014  ! 201: WRPR_PIL_R	wrpr	%r20, %r20, %pil
mondo_2_128:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d90c011  ! 202: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
splash_lsu_2_129:
	set 0xf8c34095, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 203: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_2_130:
	set 0x93c4dd1d, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 204: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 205: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_2_131:
	setx 0x0705ce84254d7717, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 206: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_132
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_132:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e007  ! 207: CASA_R	casa	[%r31] %asi, %r7, %r13
splash_cmpr_2_133:
	setx 0xede625a19821e1a1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_2_134:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_134-donret_2_134), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00194a10 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf94, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_134:
	.word 0xdaffe058  ! 209: SWAPA_I	swapa	%r13, [%r31 + 0x0058] %asi
	.word 0xa7844014  ! 210: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r20, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_136) + 40, 16, 16)) -> intp(7,0,25)
intvec_2_136:
	.word 0x39400001  ! 211: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe03c4012  ! 212: STD_R	std	%r16, [%r17 + %r18]
splash_cmpr_2_138:
	setx 0x44e6ba0a2b3f137e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 213: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_2_139:
	set 0x04454668, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 214: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d90267f  ! 215: WRPR_PSTATE_I	wrpr	%r0, 0x067f, %pstate
	.word 0xd8800b20  ! 216: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r12
	.word 0xd88fe030  ! 217: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_140
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_140:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 218: RDPC	rd	%pc, %r10
	.word 0x9f8032cd  ! 219: SIR	sir	0x12cd
mondo_2_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d93000d  ! 220: WRPR_WSTATE_R	wrpr	%r12, %r13, %wstate
jmptr_2_142:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 221: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe46fe06e  ! 222: LDSTUB_I	ldstub	%r18, [%r31 + 0x006e]
	.word 0xe4800a80  ! 223: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r18
	.word 0x9f802dd8  ! 224: SIR	sir	0x0dd8
intveclr_2_143:
	setx 0xd274589b18d0627e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_144:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 226: CASA_R	casa	[%r31] %asi, %r0, %r18
splash_lsu_2_145:
	set 0xc6879800, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 227: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_146
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_146
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_146:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 228: RDPC	rd	%pc, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 229: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe68008a0  ! 230: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
intveclr_2_147:
	setx 0x7e5578893d25b4f2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 231: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe63c8012  ! 232: STD_R	std	%r19, [%r18 + %r18]
splash_cmpr_2_149:
	setx 0x7084c5277d45dac9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 233: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_150) + 48, 16, 16)) -> intp(5,0,6)
intvec_2_150:
	.word 0x39400001  ! 234: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_2_151:
	nop
	setx 0xfffff2a9fffff93f, %g1, %g7
	.word 0xa3800007  ! 235: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b5  ! 236: Tcc_I	ta	icc_or_xcc, %r0 + 181
intveclr_2_152:
	setx 0xcb07f0cb9d38a1ee, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 237: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa968fa0d  ! 238: SDIVX_I	sdivx	%r3, 0xfffffa0d, %r20
pmu_2_154:
	nop
	setx 0xffffffdcfffffc2c, %g1, %g7
	.word 0xa3800007  ! 239: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe2800b80  ! 240: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r17
	.word 0x95a089a2  ! 241: FDIVs	fdivs	%f2, %f2, %f10
	.word 0xd727c000  ! 242: STF_R	st	%f11, [%r0, %r31]
	.word 0xc187e040  ! 243: LDFA_I	lda	[%r31, 0x0040], %f0
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_155:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r11
	.word 0x99902003  ! 245: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
DS_2_156:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe131f224  ! 1: STQF_I	-	%f16, [0x1224, %r7]
	normalw
	.word 0x9b458000  ! 246: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x91a309ac  ! 247: FDIVs	fdivs	%f12, %f12, %f8
	.word 0x93a209d1  ! 248: FDIVd	fdivd	%f8, %f48, %f40
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 249: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd527c000  ! 250: STF_R	st	%f10, [%r0, %r31]
	.word 0x91d02035  ! 251: Tcc_I	ta	icc_or_xcc, %r0 + 53
intveclr_2_158:
	setx 0xe12ad2d9a574a5d5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 252: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_159:
	setx 0xe26cc966a967a8bf, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_160:
	setx 0x9f371de299db3d85, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 254: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802659  ! 255: SIR	sir	0x0659
intveclr_2_161:
	setx 0x8366d894425e5e3f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 256: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_2_162:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa568b5eb	! Random illegal ?
	.word 0xa3a00554  ! 1: FSQRTd	fsqrt	
	.word 0xa1a44831  ! 257: FADDs	fadds	%f17, %f17, %f16
	.word 0x9f802ea6  ! 258: SIR	sir	0x0ea6
	.word 0xe257c000  ! 259: LDSH_R	ldsh	[%r31 + %r0], %r17
splash_lsu_2_163:
	set 0x9f2ab43a, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 260: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9bb284ca  ! 261: FCMPNE32	fcmpne32	%d10, %d10, %r13
	.word 0x81460000  ! 262: RD_STICK_REG	stbar
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76b3361  ! 263: SDIVX_I	sdivx	%r12, 0xfffff361, %r19
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_166:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 264: CASA_R	casa	[%r31] %asi, %r19, %r9
	.word 0x97a289d1  ! 265: FDIVd	fdivd	%f10, %f48, %f42
intveclr_2_167:
	setx 0xc7775fe36cc71df6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 266: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93450000  ! 267: RD_SET_SOFTINT	rd	%set_softint, %r9
splash_hpstate_2_168:
	.word 0x81982bc5  ! 268: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc5, %hpstate
splash_htba_2_169:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 269: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_2_170:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb328014  ! 1: STQF_R	-	%f13, [%r20, %r10]
	normalw
	.word 0x95458000  ! 270: RD_SOFTINT_REG	rd	%softint, %r10
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_171
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_171:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 271: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0x83d02035  ! 272: Tcc_I	te	icc_or_xcc, %r0 + 53
mondo_2_172:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d924008  ! 273: WRPR_WSTATE_R	wrpr	%r9, %r8, %wstate
	.word 0x91a00162  ! 274: FABSq	dis not found

	setx 0x95c7882b9f2f6a96, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_173:
	.word 0x39400001  ! 275: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_2_174:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_174-donret_2_174), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0089dadc | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf95, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_174:
	.word 0xe6ffe01a  ! 276: SWAPA_I	swapa	%r19, [%r31 + 0x001a] %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01972  ! 277: FqTOd	dis not found

splash_cmpr_2_176:
	setx 0xca69f6dd727e5fdb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_177:
	setx 0x114c6f61243fceea, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 279: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 280: LDX_R	ldx	[%r31 + %r0], %r18
fpinit_2_178:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 281: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xe4800a60  ! 282: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r18
	.word 0x91d020b5  ! 283: Tcc_I	ta	icc_or_xcc, %r0 + 181
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_179
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_179:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 284: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0xa5a509d4  ! 285: FDIVd	fdivd	%f20, %f20, %f18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_180) + 40, 16, 16)) -> intp(7,0,20)
intvec_2_180:
	.word 0x39400001  ! 286: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9450000  ! 287: RD_SET_SOFTINT	rd	%set_softint, %r20
fpinit_2_181:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 288: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xe28fe018  ! 289: LDUBA_I	lduba	[%r31, + 0x0018] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_182
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_182:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 290: RDPC	rd	%pc, %r16
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 291: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0x9f802b0c  ! 292: SIR	sir	0x0b0c
splash_cmpr_2_184:
	setx 0x710ab4a9a0c2310b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 293: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_2_185:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_185-donret_2_185-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00623fa3 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x15f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_185:
	.word 0xd6ffe089  ! 294: SWAPA_I	swapa	%r11, [%r31 + 0x0089] %asi
	.word 0xd737c000  ! 295: STQF_R	-	%f11, [%r0, %r31]
	.word 0xd727e0b8  ! 296: STF_I	st	%f11, [0x00b8, %r31]
	.word 0xd66fe0dd  ! 297: LDSTUB_I	ldstub	%r11, [%r31 + 0x00dd]
splash_lsu_2_186:
	set 0x801a3aa6, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe187e020  ! 299: LDFA_I	lda	[%r31, 0x0020], %f16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 300: LDX_R	ldx	[%r31 + %r0], %r11
intveclr_2_187:
	setx 0xfd1eadc54f5c267b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_188:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_2_188:
	mov 0x956, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdb60  ! 302: STDFA_R	stda	%f0, [%r0, %r31]
	setx 0x36bf6333a41b8389, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_189:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90229c  ! 304: WRPR_PSTATE_I	wrpr	%r0, 0x029c, %pstate
DS_2_190:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd5352721  ! 1: STQF_I	-	%f10, [0x0721, %r20]
	normalw
	.word 0x95458000  ! 305: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xe65fe018  ! 306: LDX_I	ldx	[%r31 + 0x0018], %r19
	.word 0xe6bfe008  ! 307: STDA_I	stda	%r19, [%r31 + 0x0008] %asi
pmu_2_191:
	nop
	setx 0xfffff3b7fffff295, %g1, %g7
	.word 0xa3800007  ! 308: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe727e008  ! 309: STF_I	st	%f19, [0x0008, %r31]
pmu_2_192:
	nop
	setx 0xfffff57afffffa4a, %g1, %g7
	.word 0xa3800007  ! 310: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68008a0  ! 311: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
pmu_2_193:
	nop
	setx 0xfffff095fffffc94, %g1, %g7
	.word 0xa3800007  ! 312: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_2_194-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_194:
	.word 0x91950005  ! 313: WRPR_PIL_R	wrpr	%r20, %r5, %pil
mondo_2_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d91400a  ! 314: WRPR_WSTATE_R	wrpr	%r5, %r10, %wstate
	.word 0xa9810003  ! 315: WR_SET_SOFTINT_R	wr	%r4, %r3, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_196) + 24, 16, 16)) -> intp(3,0,5)
intvec_2_196:
	.word 0x39400001  ! 316: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_197
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_197:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 317: RDPC	rd	%pc, %r18
mondo_2_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d940013  ! 318: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
fpinit_2_199:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 319: FDIVd	fdivd	%f0, %f4, %f8
intveclr_2_200:
	setx 0x33ab7f2dcc6f52b0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 320: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9a00167  ! 321: FABSq	dis not found

intveclr_2_201:
	setx 0x798c636bb931ab0d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_202) + 56, 16, 16)) -> intp(6,0,13)
intvec_2_202:
	.word 0x39400001  ! 323: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_203:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 324: RDPC	rd	%pc, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_204) + 56, 16, 16)) -> intp(3,0,18)
intvec_2_204:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_205:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 326: RDPC	rd	%pc, %r13
	.word 0xc36ca49c  ! 327: PREFETCH_I	prefetch	[%r18 + 0x049c], #one_read
	.word 0xdac7e030  ! 328: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r13
	.word 0x91d02033  ! 329: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe187dc00  ! 330: LDFA_R	lda	[%r31, %r0], %f16
	.word 0x91d02032  ! 331: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xda800a60  ! 332: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r13
	.word 0xa5b484d0  ! 333: FCMPNE32	fcmpne32	%d18, %d16, %r18
	.word 0xa3b404d3  ! 334: FCMPNE32	fcmpne32	%d16, %d50, %r17
intveclr_2_209:
	setx 0x3af3642fcbf7a0b3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 335: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_210
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_210
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_210:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 336: RDPC	rd	%pc, %r9
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_211
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_211:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 337: CASA_R	casa	[%r31] %asi, %r19, %r11
pmu_2_212:
	nop
	setx 0xfffff8a4fffff505, %g1, %g7
	.word 0xa3800007  ! 338: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa7a089b3  ! 339: FDIVs	fdivs	%f2, %f19, %f19
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_213
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_213:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 340: CASA_R	casa	[%r31] %asi, %r18, %r16
intveclr_2_214:
	setx 0x50e8fb40c44e756f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 341: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_215
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_215:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 342: CASA_R	casa	[%r31] %asi, %r18, %r16
	.word 0xe08008a0  ! 343: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_2_216:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d94800b  ! 344: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
DS_2_217:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 345: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_218:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 346: RDPC	rd	%pc, %r18
mondo_2_219:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d94c002  ! 347: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
	.word 0xa1500000  ! 348: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xda6fe012  ! 349: LDSTUB_I	ldstub	%r13, [%r31 + 0x0012]
	.word 0xda57c000  ! 350: LDSH_R	ldsh	[%r31 + %r0], %r13
jmptr_2_220:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 351: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_2_221:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 352: FDIVd	fdivd	%f0, %f4, %f6
intveclr_2_222:
	setx 0x02b831bbff8348c7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 353: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_223
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_223
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_223:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 354: RDPC	rd	%pc, %r10
	.word 0x9f803edc  ! 355: SIR	sir	0x1edc
donret_2_224:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_224-donret_2_224), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00987916 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd16, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_224:
	.word 0xe6ffe018  ! 356: SWAPA_I	swapa	%r19, [%r31 + 0x0018] %asi
	.word 0x9f802edc  ! 357: SIR	sir	0x0edc
debug_2_225:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0a0  ! 358: STDFA_I	stda	%f0, [0x00a0, %r31]
	rd %pc, %r19
	add %r19, (ivw_2_226-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_226:
	.word 0x91934013  ! 359: WRPR_PIL_R	wrpr	%r13, %r19, %pil
	.word 0x87aa8a54  ! 360: FCMPd	fcmpd	%fcc<n>, %f10, %f20
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_227:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e008  ! 361: CASA_R	casa	[%r31] %asi, %r8, %r8
	.word 0x9ba00171  ! 362: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_228
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_228
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_228:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 363: RDPC	rd	%pc, %r13
	.word 0x24cd0001  ! 364: BRLEZ	brlez,a,pt	%r20,<label_0xd0001>
	.word 0xd137e0a3  ! 365: STQF_I	-	%f8, [0x00a3, %r31]
donret_2_230:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_230-donret_2_230), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009191e1 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xfc4, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_230:
	.word 0xd0ffe0b3  ! 366: SWAPA_I	swapa	%r8, [%r31 + 0x00b3] %asi
change_to_randtl_2_231:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_231:
	.word 0x8f902001  ! 367: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xad84fcb5  ! 368: WR_SOFTINT_REG_I	wr	%r19, 0x1cb5, %softint
	.word 0xa984c011  ! 369: WR_SET_SOFTINT_R	wr	%r19, %r17, %set_softint
	.word 0x8d902db3  ! 370: WRPR_PSTATE_I	wrpr	%r0, 0x0db3, %pstate
splash_lsu_2_232:
	set 0x90b5729e, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 371: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd137e050  ! 372: STQF_I	-	%f8, [0x0050, %r31]
	.word 0x87acca4a  ! 373: FCMPd	fcmpd	%fcc<n>, %f50, %f10
memptr_2_234:
	set user_data_start, %r31
	.word 0x85842505  ! 374: WRCCR_I	wr	%r16, 0x0505, %ccr
mondo_2_235:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d90c001  ! 375: WRPR_WSTATE_R	wrpr	%r3, %r1, %wstate
	.word 0xd337c000  ! 376: STQF_R	-	%f9, [%r0, %r31]
	.word 0xd317c000  ! 377: LDQF_R	-	[%r31, %r0], %f9
    set 0x1334, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b507f4  ! 378: PDISTN	fmean16	%d20, %d20, %d16
	.word 0xa5a509c7  ! 379: FDIVd	fdivd	%f20, %f38, %f18
	setx 0x2aa6234e4ace0100, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_237:
	.word 0x39400001  ! 380: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f8034bc  ! 381: SIR	sir	0x14bc
	.word 0x95a00168  ! 382: FABSq	dis not found

intveclr_2_238:
	setx 0x22e3f598a63834f9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 383: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5a00173  ! 384: FABSq	dis not found

	.word 0x8d90211d  ! 385: WRPR_PSTATE_I	wrpr	%r0, 0x011d, %pstate
splash_htba_2_239:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 386: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_240
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_240:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 387: RDPC	rd	%pc, %r11
	.word 0xd05fe010  ! 388: LDX_I	ldx	[%r31 + 0x0010], %r8
splash_cmpr_2_241:
	setx 0xee9222c2bb06a50f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02032  ! 390: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_lsu_2_242:
	set 0x342e48af, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 391: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_243
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_243
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_243:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 392: RDPC	rd	%pc, %r10
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_244
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_244:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e001  ! 393: CASA_R	casa	[%r31] %asi, %r1, %r9
debug_2_245:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_2_245:
	mov 0xcd5, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe060  ! 394: STDFA_I	stda	%f16, [0x0060, %r31]
	.word 0xd257c000  ! 395: LDSH_R	ldsh	[%r31 + %r0], %r9
	.word 0x9f803587  ! 396: SIR	sir	0x1587
mondo_2_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d950005  ! 397: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	.word 0xd26fe0ba  ! 398: LDSTUB_I	ldstub	%r9, [%r31 + 0x00ba]
	.word 0x99a00171  ! 399: FABSq	dis not found

	.word 0xe2bfe0c1  ! 400: STDA_I	stda	%r17, [%r31 + 0x00c1] %asi
	.word 0xe20fc000  ! 401: LDUB_R	ldub	[%r31 + %r0], %r17
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 402: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe317c000  ! 403: LDQF_R	-	[%r31, %r0], %f17
pmu_2_247:
	nop
	setx 0xfffff6d4fffffe74, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_2_248:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 405: FDIVd	fdivd	%f0, %f4, %f4
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 406: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa970339d  ! 407: POPC_I	popc	0x139d, %r20
	.word 0xa9804006  ! 408: WR_SET_SOFTINT_R	wr	%r1, %r6, %set_softint
	.word 0x29800001  ! 409: FBL	fbl,a	<label_0x1>
intveclr_2_250:
	setx 0x37e4d6d437168438, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 410: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5a209d1  ! 411: FDIVd	fdivd	%f8, %f48, %f18
	rd %pc, %r19
	add %r19, (ivw_2_251-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_251:
	.word 0x9191c012  ! 412: WRPR_PIL_R	wrpr	%r7, %r18, %pil
	.word 0x9f802fa4  ! 413: SIR	sir	0x0fa4
    set 0x15f0, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b247e0  ! 414: PDISTN	fmean16	%d40, %d0, %d18
	rd %pc, %r19
	add %r19, (ivw_2_252-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_252:
	.word 0x9194c011  ! 415: WRPR_PIL_R	wrpr	%r19, %r17, %pil
	.word 0xe48fe010  ! 416: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r18
	.word 0x2a700001  ! 417: BPCS	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 418: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4800b00  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r18
	.word 0xe187c3e0  ! 420: LDFA_R	lda	[%r31, %r0], %f16
change_to_randtl_2_253:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_253:
	.word 0x8f902001  ! 421: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x9ba00169  ! 422: FABSq	dis not found

splash_hpstate_2_254:
	.word 0x81982bd4  ! 423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd4, %hpstate
mondo_2_255:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d940006  ! 424: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
	.word 0x9f803917  ! 425: SIR	sir	0x1917
	.word 0x99454000  ! 426: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
intveclr_2_256:
	setx 0xd37796ead669e4e0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 427: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_257:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 428: RDPC	rd	%pc, %r12
	rd %pc, %r19
	add %r19, (ivw_2_258-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_258:
	.word 0x9191c010  ! 429: WRPR_PIL_R	wrpr	%r7, %r16, %pil
splash_cmpr_2_259:
	setx 0x628ee463eef2aeac, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 430: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7850007  ! 431: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r7, %-
	.word 0xe857c000  ! 432: LDSH_R	ldsh	[%r31 + %r0], %r20
	.word 0x99540000  ! 433: RDPR_GL	<illegal instruction>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_261
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_261:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 434: CASA_R	casa	[%r31] %asi, %r16, %r9
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_262
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_262:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 435: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a0196d  ! 436: FqTOd	dis not found

	.word 0xa1a0016c  ! 437: FABSq	dis not found

change_to_randtl_2_264:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_264:
	.word 0x8f902001  ! 438: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_2_265:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_265:
	.word 0x8f902002  ! 439: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_2_266:
	setx 0x6b46a64a93c31f47, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa768af2a  ! 441: SDIVX_I	sdivx	%r2, 0x0f2a, %r19
splash_cmpr_2_268:
	setx 0xc823b93f9e91f7b3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 442: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd127e0d0  ! 443: STF_I	st	%f8, [0x00d0, %r31]
	.word 0x91d02032  ! 444: Tcc_I	ta	icc_or_xcc, %r0 + 50
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 445: Tcc_R	te	icc_or_xcc, %r0 + %r30
jmptr_2_269:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 446: JMPL_R	jmpl	%r27 + %r0, %r27
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
	.word 0xa7414000  ! 447: RDPC	rd	%pc, %r19
	.word 0xd937e030  ! 448: STQF_I	-	%f12, [0x0030, %r31]
pmu_2_271:
	nop
	setx 0xfffff5c4fffff0cb, %g1, %g7
	.word 0xa3800007  ! 449: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_2_272:
	nop
	setx 0xfffffa05fffff911, %g1, %g7
	.word 0xa3800007  ! 450: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_htba_2_273:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 451: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd89fe008  ! 452: LDDA_I	ldda	[%r31, + 0x0008] %asi, %r12
	.word 0x8d9038b9  ! 453: WRPR_PSTATE_I	wrpr	%r0, 0x18b9, %pstate
	.word 0x99902003  ! 454: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
pmu_2_274:
	nop
	setx 0xfffff09ffffffb96, %g1, %g7
	.word 0xa3800007  ! 455: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_2_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d908003  ! 456: WRPR_WSTATE_R	wrpr	%r2, %r3, %wstate
	.word 0xd88008a0  ! 457: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x87ac8a52  ! 458: FCMPd	fcmpd	%fcc<n>, %f18, %f18
splash_lsu_2_277:
	set 0xf48ef84f, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 459: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd31fc000  ! 460: LDDF_R	ldd	[%r31, %r0], %f9
	rd %pc, %r19
	add %r19, (ivw_2_278-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_278:
	.word 0x9191c007  ! 461: WRPR_PIL_R	wrpr	%r7, %r7, %pil
	.word 0xd277e002  ! 462: STX_I	stx	%r9, [%r31 + 0x0002]
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
	.word 0x91414000  ! 463: RDPC	rd	%pc, %r8
	.word 0x87a9ca42  ! 464: FCMPd	fcmpd	%fcc<n>, %f38, %f2
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01963  ! 465: FqTOd	dis not found

splash_hpstate_2_282:
	.word 0x81982936  ! 466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0936, %hpstate
change_to_randtl_2_283:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_283:
	.word 0x8f902001  ! 467: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xda3fc000  ! 468: STD_R	std	%r13, [%r31 + %r0]
	.word 0x91d02035  ! 469: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93d020b3  ! 470: Tcc_I	tne	icc_or_xcc, %r0 + 179
intveclr_2_284:
	setx 0xc7bfa4ce40d98209, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 471: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_285:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d908003  ! 472: WRPR_WSTATE_R	wrpr	%r2, %r3, %wstate
	.word 0xda77c000  ! 473: STX_R	stx	%r13, [%r31 + %r0]
pmu_2_286:
	nop
	setx 0xfffffc3afffff73d, %g1, %g7
	.word 0xa3800007  ! 474: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xdacfe008  ! 475: LDSBA_I	ldsba	[%r31, + 0x0008] %asi, %r13
	.word 0x9f802636  ! 476: SIR	sir	0x0636
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 477: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xdb37e089  ! 478: STQF_I	-	%f13, [0x0089, %r31]
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_287
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_287
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_287:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 479: RDPC	rd	%pc, %r9
splash_cmpr_2_288:
	setx 0xcf374296c6ebe210, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 480: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99480000  ! 481: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	rd %pc, %r19
	add %r19, (ivw_2_289-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_289:
	.word 0x91940010  ! 482: WRPR_PIL_R	wrpr	%r16, %r16, %pil
donret_2_290:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_290-donret_2_290), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0086aa34 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x416, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_290:
	.word 0xe8ffe05c  ! 483: SWAPA_I	swapa	%r20, [%r31 + 0x005c] %asi
	.word 0x87ad0a45  ! 484: FCMPd	fcmpd	%fcc<n>, %f20, %f36
	.word 0xd497e020  ! 485: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
	.word 0xd51fc000  ! 486: LDDF_R	ldd	[%r31, %r0], %f10
	.word 0xa7850002  ! 487: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r2, %-
	.word 0xd527c000  ! 488: STF_R	st	%f10, [%r0, %r31]
splash_hpstate_2_293:
	.word 0x81982d85  ! 489: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d85, %hpstate
	.word 0xd46fe054  ! 490: LDSTUB_I	ldstub	%r10, [%r31 + 0x0054]
jmptr_2_294:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 491: JMPL_R	jmpl	%r27 + %r0, %r27
debug_2_295:
	nop
	ta T_CHANGE_HPRIV
debug_iva_2_295:
	mov 0x4c3, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+48), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe187d960  ! 492: LDFA_R	lda	[%r31, %r0], %f16
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_296
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_296:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 493: RDPC	rd	%pc, %r12
	.word 0x9f802827  ! 494: SIR	sir	0x0827
pmu_2_297:
	nop
	setx 0xfffff515fffffcfe, %g1, %g7
	.word 0xa3800007  ! 495: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_2_298:
	setx 0x29025d8f29e89550, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 496: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_299:
	setx 0xb0c9eb2c596933fb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 497: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe80fe028  ! 498: LDUB_I	ldub	[%r31 + 0x0028], %r20
	.word 0xa5a00170  ! 499: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196b  ! 500: FqTOd	dis not found

splash_cmpr_2_301:
	setx 0x93759810559f7228, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 501: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_302:
	setx 0xd7f0240b26f1cf6b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 502: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9145c000  ! 503: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0xd537c000  ! 504: STQF_R	-	%f10, [%r0, %r31]
	.word 0x9f802d01  ! 505: SIR	sir	0x0d01
	rd %pc, %r19
	add %r19, (ivw_2_303-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_303:
	.word 0x9194c011  ! 506: WRPR_PIL_R	wrpr	%r19, %r17, %pil
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 507: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_2_304:
	setx 0xd18facec7c9eb026, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 508: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_2_305:
	.word 0x93a149cd  ! 1: FDIVd	fdivd	%f36, %f44, %f40
	pdist %f0, %f0, %f2
	.word 0xa5b14306  ! 509: ALIGNADDRESS	alignaddr	%r5, %r6, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_306) + 8, 16, 16)) -> intp(3,0,19)
intvec_2_306:
	.word 0x39400001  ! 510: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_307:
	setx 0xf599aac1c027d672, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 511: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802cf7  ! 512: SIR	sir	0x0cf7
splash_lsu_2_308:
	set 0x2e814e53, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 513: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_2_309:
	setx 0xd3a5441bab35697e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 514: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 515: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda800c60  ! 516: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r13
pmu_2_310:
	nop
	setx 0xfffff9a0fffff48b, %g1, %g7
	.word 0xa3800007  ! 517: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38700001  ! 518: BPGU	<illegal instruction>
	.word 0xa782c010  ! 519: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r16, %-
	.word 0xda6fe035  ! 520: LDSTUB_I	ldstub	%r13, [%r31 + 0x0035]
    set 0x78f, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b247eb  ! 521: PDISTN	fmean16	%d40, %d42, %d12
mondo_2_312:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d944006  ! 522: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
donret_2_313:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_313-donret_2_313-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a3d947 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa9d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_313:
	.word 0xdaffe000  ! 523: SWAPA_I	swapa	%r13, [%r31 + 0x0000] %asi
	.word 0x9f803243  ! 524: SIR	sir	0x1243
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01970  ! 525: FqTOd	dis not found

	.word 0xdacfe030  ! 526: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
	.word 0x91a309c7  ! 527: FDIVd	fdivd	%f12, %f38, %f8
mondo_2_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d94c013  ! 528: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	.word 0xd41fe018  ! 529: LDD_I	ldd	[%r31 + 0x0018], %r10
	.word 0xd537e08a  ! 530: STQF_I	-	%f10, [0x008a, %r31]
DS_2_316:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe1337514  ! 1: STQF_I	-	%f16, [0x1514, %r13]
	normalw
	.word 0x93458000  ! 531: RD_SOFTINT_REG	rd	%softint, %r9
cwp_2_317:
    set user_data_start, %o7
	.word 0x93902007  ! 532: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_cmpr_2_318:
	setx 0x5f6121fa19bac36a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 533: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_2_319:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_319-donret_2_319-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a1a69e | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x3dd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_319:
	.word 0xdaffe033  ! 534: SWAPA_I	swapa	%r13, [%r31 + 0x0033] %asi
	.word 0xa1a00173  ! 535: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 536: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xe2800b80  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r17
mondo_2_320:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d91c001  ! 538: WRPR_WSTATE_R	wrpr	%r7, %r1, %wstate
	.word 0x9ba409c7  ! 539: FDIVd	fdivd	%f16, %f38, %f44
jmptr_2_322:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 540: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe4800b60  ! 541: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r18
pmu_2_323:
	nop
	setx 0xfffffb80fffffa5e, %g1, %g7
	.word 0xa3800007  ! 542: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_2_324:
	set 0x7d9ef0c9, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 543: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_2_325:
	nop
	ta T_CHANGE_HPRIV
debug_iva_2_325:
	mov 0x4b7, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+56), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0a0  ! 544: STDFA_I	stda	%f0, [0x00a0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_326) + 40, 16, 16)) -> intp(5,0,27)
intvec_2_326:
	.word 0x39400001  ! 545: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_2_327:
	setx 0x70561a5097ef9ac7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 546: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_328:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d918011  ! 547: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
	.word 0x9ad43cd5  ! 548: UMULcc_I	umulcc 	%r16, 0xfffffcd5, %r13
memptr_2_329:
	set 0x60340000, %r31
	.word 0x8581786e  ! 549: WRCCR_I	wr	%r5, 0x186e, %ccr
	.word 0x9f803817  ! 550: SIR	sir	0x1817
memptr_2_330:
	set user_data_start, %r31
	.word 0x8584e159  ! 551: WRCCR_I	wr	%r19, 0x0159, %ccr
	.word 0xc1bfdf20  ! 552: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc369ed8a  ! 553: PREFETCH_I	prefetch	[%r7 + 0x0d8a], #one_read
splash_cmpr_2_332:
	setx 0x75589b9302866409, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 554: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a2c9c9  ! 555: FDIVd	fdivd	%f42, %f40, %f48
jmptr_2_333:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 556: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc3eb4020  ! 557: PREFETCHA_R	prefetcha	[%r13, %r0] 0x01, #one_read
	.word 0xd4800c40  ! 558: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01972  ! 559: FqTOd	dis not found

	.word 0xa5a1c9d2  ! 560: FDIVd	fdivd	%f38, %f18, %f18
debug_2_336:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdb60  ! 561: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x93d020b5  ! 562: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0xda1fc000  ! 563: LDD_R	ldd	[%r31 + %r0], %r13
mondo_2_337:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d94000d  ! 564: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_338
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_338
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_338:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 565: RDPC	rd	%pc, %r19
	.word 0x24cc8001  ! 566: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	.word 0xe657e010  ! 567: LDSH_I	ldsh	[%r31 + 0x0010], %r19
splash_hpstate_2_340:
	.word 0x8198201e  ! 568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001e, %hpstate
	.word 0xe64fc000  ! 569: LDSB_R	ldsb	[%r31 + %r0], %r19
splash_lsu_2_341:
	set 0x1c6c8039, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 570: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
fpinit_2_342:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 571: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_lsu_2_343:
	set 0xb27072e5, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 572: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01972  ! 573: FqTOd	dis not found

	.word 0xd6800ba0  ! 574: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_345)+16, 16, 16)) -> intp(4,1,3)
xir_2_345:
	.word 0xa9836b3a  ! 575: WR_SET_SOFTINT_I	wr	%r13, 0x0b3a, %set_softint
	.word 0xd677e0e8  ! 576: STX_I	stx	%r11, [%r31 + 0x00e8]
jmptr_2_346:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 577: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x4a531a6ef749b56b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_347:
	.word 0x39400001  ! 578: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 579: LDX_R	ldx	[%r31 + %r0], %r11
pmu_2_348:
	nop
	setx 0xfffffcb9fffff79e, %g1, %g7
	.word 0xa3800007  ! 580: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f8036fe  ! 581: SIR	sir	0x16fe
	.word 0x93d020b5  ! 582: Tcc_I	tne	icc_or_xcc, %r0 + 181
DS_2_349:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 583: SAVE_R	save	%r31, %r0, %r31
pmu_2_350:
	nop
	setx 0xfffffc9bfffff045, %g1, %g7
	.word 0xa3800007  ! 584: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_2_351:
	taddcctv %r17, 0x13f6, %r6
	.word 0xd607e01d  ! 585: LDUW_I	lduw	[%r31 + 0x001d], %r11
	.word 0x91b1c485  ! 586: FCMPLE32	fcmple32	%d38, %d36, %r8
	.word 0xa7b4c4c0  ! 587: FCMPNE32	fcmpne32	%d50, %d0, %r19
	.word 0xa5b084c1  ! 588: FCMPNE32	fcmpne32	%d2, %d32, %r18
splash_hpstate_2_354:
	.word 0x81982f74  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f74, %hpstate
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 590: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_2_355:
	setx 0xf3a82ce17fc936a1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 591: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4c7e008  ! 592: LDSWA_I	ldswa	[%r31, + 0x0008] %asi, %r18
	.word 0x8d902b6c  ! 593: WRPR_PSTATE_I	wrpr	%r0, 0x0b6c, %pstate
mondo_2_356:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d94400c  ! 594: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
jmptr_2_357:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 595: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe4800be0  ! 596: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r18
jmptr_2_358:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 597: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_2_359:
	setx 0x418331276dfc3db7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 598: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_2_360:
	nop
	setx 0xfffff0fefffff9ee, %g1, %g7
	.word 0xa3800007  ! 599: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_361
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_361:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 600: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0xe48008a0  ! 601: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_362
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_362:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 602: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0x9f803357  ! 603: SIR	sir	0x1357
	.word 0xe53fe0da  ! 604: STDF_I	std	%f18, [0x00da, %r31]
	.word 0xe537c000  ! 605: STQF_R	-	%f18, [%r0, %r31]
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 606: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe51fe000  ! 607: LDDF_I	ldd	[%r31, 0x0000], %f18
	.word 0x8d903118  ! 608: WRPR_PSTATE_I	wrpr	%r0, 0x1118, %pstate
jmptr_2_363:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 609: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa3a209d0  ! 610: FDIVd	fdivd	%f8, %f16, %f48
intveclr_2_364:
	setx 0x60fa352cf89204bd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 611: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_365:
	setx 0x07eb0e4d67bf5601, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 612: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_366:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe0e0  ! 613: STDFA_I	stda	%f16, [0x00e0, %r31]
splash_cmpr_2_367:
	setx 0x4e4f0a7d1874111a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 614: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc1bfe020  ! 615: STDFA_I	stda	%f0, [0x0020, %r31]
	.word 0xe25fe020  ! 616: LDX_I	ldx	[%r31 + 0x0020], %r17
	.word 0xa745c000  ! 617: RD_TICK_CMPR_REG	rd	%-, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_368) + 0, 16, 16)) -> intp(5,0,15)
intvec_2_368:
	.word 0x39400001  ! 618: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda1fc000  ! 619: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xc187e0e0  ! 620: LDFA_I	lda	[%r31, 0x00e0], %f0
splash_tba_2_369:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 621: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x99454000  ! 622: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
tagged_2_370:
	tsubcctv %r17, 0x16c5, %r11
	.word 0xe007e021  ! 623: LDUW_I	lduw	[%r31 + 0x0021], %r16
memptr_2_371:
	set 0x60340000, %r31
	.word 0x85852575  ! 624: WRCCR_I	wr	%r20, 0x0575, %ccr
mondo_2_372:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d940014  ! 625: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	.word 0x91d020b4  ! 626: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_htba_2_373:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 627: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_374
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_374:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00b  ! 628: CASA_R	casa	[%r31] %asi, %r11, %r16
	.word 0xa9454000  ! 629: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0x91a00167  ! 630: FABSq	dis not found

	.word 0xa7a2c9c7  ! 631: FDIVd	fdivd	%f42, %f38, %f50
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 632: LDX_R	ldx	[%r31 + %r0], %r19
cwp_2_375:
    set user_data_start, %o7
	.word 0x93902000  ! 633: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x81510000  ! 635: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe68008a0  ! 636: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	rd %pc, %r19
	add %r19, (ivw_2_376-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_376:
	.word 0x91910014  ! 637: WRPR_PIL_R	wrpr	%r4, %r20, %pil
intveclr_2_377:
	setx 0x454294660bdf62b4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 638: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 639: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_2_378:
	set 0xaa04e89f, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 640: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe68008a0  ! 641: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe627e05d  ! 642: STW_I	stw	%r19, [%r31 + 0x005d]
	.word 0x91d02034  ! 643: Tcc_I	ta	icc_or_xcc, %r0 + 52
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_379
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_379:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 644: CASA_R	casa	[%r31] %asi, %r16, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_380) + 56, 16, 16)) -> intp(6,0,6)
intvec_2_380:
	.word 0x39400001  ! 645: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7818010  ! 646: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r16, %-
mondo_2_382:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d948009  ! 647: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936cabb1  ! 648: SDIVX_I	sdivx	%r18, 0x0bb1, %r9
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
	.word 0x95414000  ! 649: RDPC	rd	%pc, %r10
	.word 0xd42fe05d  ! 650: STB_I	stb	%r10, [%r31 + 0x005d]
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 651: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96c6e24  ! 652: SDIVX_I	sdivx	%r17, 0x0e24, %r20
splash_lsu_2_386:
	set 0xc7059a9c, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 653: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc3693a20  ! 654: PREFETCH_I	prefetch	[%r4 + 0xfffffa20], #one_read
	.word 0xa945c000  ! 655: RD_TICK_CMPR_REG	rd	%-, %r20
splash_lsu_2_388:
	set 0xe5e7378b, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 656: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9b45c000  ! 657: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xa880e08d  ! 658: ADDcc_I	addcc 	%r3, 0x008d, %r20
debug_2_389:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_2_389:
	mov 0xbcb, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc187dc00  ! 659: LDFA_R	lda	[%r31, %r0], %f0
	.word 0xe8800ba0  ! 660: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r20
jmptr_2_390:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 661: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_2_391:
	nop
	setx 0xfffff236fffff5e1, %g1, %g7
	.word 0xa3800007  ! 662: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa5540000  ! 663: RDPR_GL	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_2_392-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_392:
	.word 0x91920010  ! 664: WRPR_PIL_R	wrpr	%r8, %r16, %pil
splash_lsu_2_393:
	set 0xb7a2af5e, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 665: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_2_394:
	nop
	setx 0xfffff1a7fffff7bf, %g1, %g7
	.word 0xa3800007  ! 666: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_395
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_395:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 667: CASA_R	casa	[%r31] %asi, %r12, %r13
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_396
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_396:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 668: CASA_R	casa	[%r31] %asi, %r12, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 669: LDX_R	ldx	[%r31 + %r0], %r13
splash_cmpr_2_397:
	setx 0x6d1f1944c564d657, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 670: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_398:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 671: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_399
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_399
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_399:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 672: RDPC	rd	%pc, %r9
    set 0x3a81, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb2c7f1  ! 673: PDISTN	fmean16	%d42, %d48, %d44
	.word 0xa9a00160  ! 674: FABSq	dis not found

mondo_2_400:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d92400b  ! 675: WRPR_WSTATE_R	wrpr	%r9, %r11, %wstate
	rd %pc, %r19
	add %r19, (ivw_2_401-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_401:
	.word 0x9195000b  ! 676: WRPR_PIL_R	wrpr	%r20, %r11, %pil
mondo_2_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d950010  ! 677: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
fpinit_2_403:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 678: FDIVs	fdivs	%f0, %f4, %f6
    set 0x29e4, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b007e1  ! 679: PDISTN	fmean16	%d0, %d32, %d48
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01970  ! 680: FqTOd	dis not found

cwp_2_405:
    set user_data_start, %o7
	.word 0x93902000  ! 681: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_406
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_406:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 682: CASA_R	casa	[%r31] %asi, %r5, %r17
splash_cmpr_2_407:
	setx 0x5cc2d27268dc2351, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 683: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_2_408:
	set 0x550dd101, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 684: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 685: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xa3500000  ! 686: RDPR_TPC	<illegal instruction>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_409:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 687: RDPC	rd	%pc, %r11
	.word 0xa3480000  ! 688: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_410
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_410:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 689: CASA_R	casa	[%r31] %asi, %r5, %r18
fpinit_2_411:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 690: FCMPLE32	fcmple32	%d0, %d4, %r4
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_412
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_412:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 691: CASA_R	casa	[%r31] %asi, %r5, %r18
jmptr_2_413:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 692: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_2_414:
	nop
	setx 0xfffff123fffff586, %g1, %g7
	.word 0xa3800007  ! 693: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_2_415-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_415:
	.word 0x9191800b  ! 694: WRPR_PIL_R	wrpr	%r6, %r11, %pil
splash_hpstate_2_416:
	.word 0x8198230e  ! 695: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030e, %hpstate
donret_2_417:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_417-donret_2_417-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006a5e53 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x314, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_417:
	.word 0xe4ffe0c4  ! 696: SWAPA_I	swapa	%r18, [%r31 + 0x00c4] %asi
debug_2_418:
	nop
	ta T_CHANGE_HPRIV
debug_iva_2_418:
	mov 0x716, %r20
	mov 0xc, %r19
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
	.word 0xe187da00  ! 697: LDFA_R	lda	[%r31, %r0], %f16
pmu_2_419:
	nop
	setx 0xfffff4d6fffffe69, %g1, %g7
	.word 0xa3800007  ! 698: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_2_420:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d914013  ! 699: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
	.word 0x95540000  ! 700: RDPR_GL	<illegal instruction>
DS_2_421:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe7343312  ! 1: STQF_I	-	%f19, [0x1312, %r16]
	normalw
	.word 0x99458000  ! 701: RD_SOFTINT_REG	rd	%softint, %r12
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xab847ecf  ! 1: WR_CLEAR_SOFTINT_I	wr	%r17, 0x1ecf, %clear_softint
	ble,a	 skip_1_0
	.word 0x87a88a51  ! 1: FCMPd	fcmpd	%fcc<n>, %f2, %f48
.align 1024
skip_1_0:
	.word 0xa5a409d1  ! 2: FDIVd	fdivd	%f16, %f48, %f18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 3: LDX_R	ldx	[%r31 + %r0], %r18
intveclr_1_1:
	setx 0x8912d1dd21c64bce, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 4: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_2:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_1_2:
	mov 0xd99, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc187d920  ! 5: LDFA_R	lda	[%r31, %r0], %f0
splash_lsu_1_3:
	set 0x92ae0508, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 6: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_1_4:
	setx 0xace9e84a7d96f29f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_1_5:
	setx 0xb24afbb7d0af5069, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 8: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_6:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_6:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_6
    nop
debug_wait1_6:
    ld [%r23], %r16
    brnz %r16, debug_wait1_6
    nop
    ba,a debug_startwait1_6
continue_debug_1_6:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_6:
    cmp %r13, %r17
    bne,a wait_for_stat_1_6
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_6:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_6
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x00000050d1c00d44,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfc2c0  ! 9: STDFA_R	stda	%f0, [%r0, %r31]
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_7:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 10: RDPC	rd	%pc, %r12
intveclr_1_8:
	setx 0x474a73608f69c010, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 11: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_9
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_9:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 12: RDPC	rd	%pc, %r20
	.word 0xe81fc000  ! 13: LDD_R	ldd	[%r31 + %r0], %r20
unsupttte1_10:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3ea0030  ! 14: PREFETCHA_R	prefetcha	[%r8, %r16] 0x01, #one_read
	.word 0x9f802e77  ! 15: SIR	sir	0x0e77
	.word 0xe69fd140  ! 16: LDDA_R	ldda	[%r31, %r0] 0x8a, %r19
	setx 0x5725169995905871, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_11:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_1_12:
	setx 0x664995b1724444c9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 18: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_13
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_13:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 19: CASA_R	casa	[%r31] %asi, %r16, %r19
	.word 0xab840012  ! 20: WR_CLEAR_SOFTINT_R	wr	%r16, %r18, %clear_softint
	.word 0x95b48491  ! 21: FCMPLE32	fcmple32	%d18, %d48, %r10
intveclr_1_14:
	setx 0xbbcd1c3e50879065, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 22: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 23: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_1_15:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d928013  ! 24: WRPR_WSTATE_R	wrpr	%r10, %r19, %wstate
jmptr_1_16:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 25: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_1_17:
	nop
	setx 0xfffffcc7fffff22d, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd46fe0a0  ! 27: LDSTUB_I	ldstub	%r10, [%r31 + 0x00a0]
	.word 0x93d02033  ! 28: Tcc_I	tne	icc_or_xcc, %r0 + 51
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 29: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_1_18:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_18:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_18
    nop
debug_wait1_18:
    ld [%r23], %r16
    brnz %r16, debug_wait1_18
    nop
    ba,a debug_startwait1_18
continue_debug_1_18:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_18:
    cmp %r13, %r17
    bne,a wait_for_stat_1_18
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_18:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_18
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x0000005022cd440e,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0e0  ! 30: STDFA_I	stda	%f0, [0x00e0, %r31]
	setx 0x09bda3b3721b3185, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_19:
	.word 0x39400001  ! 31: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfc2c0  ! 32: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x93d020b3  ! 33: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0xa3a0c9d1  ! 34: FDIVd	fdivd	%f34, %f48, %f48
splash_cmpr_1_20:
	setx 0x3985e80cd4284ca0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 35: WR_STICK_REG_R	wr	%r0, %r1, %-
jmptr_1_21:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 36: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_22:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 37: CASA_R	casa	[%r31] %asi, %r17, %r17
splash_hpstate_1_23:
	.word 0x81982647  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0647, %hpstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_24:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 39: CASA_R	casa	[%r31] %asi, %r17, %r17
mondo_1_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d91c008  ! 40: WRPR_WSTATE_R	wrpr	%r7, %r8, %wstate
	.word 0xe257c000  ! 41: LDSH_R	ldsh	[%r31 + %r0], %r17
splash_cmpr_1_26:
	setx 0x324982c2fd4111c5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 42: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe33fc000  ! 43: STDF_R	std	%f17, [%r0, %r31]
	.word 0xab847d1c  ! 44: WR_CLEAR_SOFTINT_I	wr	%r17, 0x1d1c, %clear_softint
splash_hpstate_1_27:
	.word 0x819827a5  ! 45: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07a5, %hpstate
change_to_randtl_1_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_28:
	.word 0x8f902001  ! 46: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_1_29:
	setx 0xb986d899e2582fb6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 47: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_30:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e008  ! 48: CASA_R	casa	[%r31] %asi, %r8, %r17
intveclr_1_31:
	setx 0x252d06e61917001f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 49: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_32) + 0, 16, 16)) -> intp(6,0,20)
intvec_1_32:
	.word 0x39400001  ! 50: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 51: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f803a79  ! 52: SIR	sir	0x1a79
unsupttte1_33:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x95a449cb  ! 53: FDIVd	fdivd	%f48, %f42, %f10
	.word 0xa9b14494  ! 54: FCMPLE32	fcmple32	%d36, %d20, %r20
invtsb_1_34:
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
	.word 0x29800001  ! 55: FBL	fbl,a	<label_0x1>
	.word 0x9f802268  ! 56: SIR	sir	0x0268
intveclr_1_35:
	setx 0x1a5e04a3cfd22d00, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 57: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_1_36:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 58: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
memptr_1_37:
	set 0x60740000, %r31
	.word 0x85853f7a  ! 59: WRCCR_I	wr	%r20, 0x1f7a, %ccr
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_38:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 60: RDPC	rd	%pc, %r18
	.word 0xe44fc000  ! 61: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe537c000  ! 62: STQF_R	-	%f18, [%r0, %r31]
mondo_1_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d91c00c  ! 63: WRPR_WSTATE_R	wrpr	%r7, %r12, %wstate
	.word 0xe46fe051  ! 64: LDSTUB_I	ldstub	%r18, [%r31 + 0x0051]
jmptr_1_40:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 65: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01967  ! 66: FqTOd	dis not found

	.word 0xd8800ae0  ! 67: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r12
	.word 0x9f80248d  ! 68: SIR	sir	0x048d
intveclr_1_42:
	setx 0x4ea3e10152ff5d20, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_43:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e007  ! 70: CASA_R	casa	[%r31] %asi, %r7, %r12
splash_lsu_1_44:
	set 0x73626371, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 71: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_1_45:
	nop
	setx 0xfffff7e0fffff143, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_1_46:
	setx 0x3cedf2c36681faa3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
cmp_1_47:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_47:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_47
    nop
cmp_wait1_47:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_47
    nop
    ba,a cmp_startwait1_47
continue_cmp_1_47:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x84, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194c012  ! 74: WRPR_PIL_R	wrpr	%r19, %r18, %pil
invtsb_1_48:
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
	.word 0x29800001  ! 75: FBL	fbl,a	<label_0x1>
	fbug,a,pn	%fcc0,  skip_1_49
	be  	 skip_1_49
.align 32
skip_1_49:
	.word 0xc36d21d3  ! 76: PREFETCH_I	prefetch	[%r20 + 0x01d3], #one_read
mondo_1_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d92c00c  ! 77: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
	.word 0x9ba009c4  ! 78: FDIVd	fdivd	%f0, %f4, %f44
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_51
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_51
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_51:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 79: RDPC	rd	%pc, %r20
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_52:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e004  ! 80: CASA_R	casa	[%r31] %asi, %r4, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_53)+32, 16, 16)) -> intp(4,1,3)
xir_1_53:
	.word 0xa98535a4  ! 81: WR_SET_SOFTINT_I	wr	%r20, 0x15a4, %set_softint
	.word 0xe8d7e030  ! 82: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r20
	.word 0x3e800001  ! 83: BVC	bvc,a	<label_0x1>
	.word 0xe937c000  ! 84: STQF_R	-	%f20, [%r0, %r31]
	.word 0x9b454000  ! 85: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	.word 0xda47e028  ! 86: LDSW_I	ldsw	[%r31 + 0x0028], %r13
pmu_1_54:
	nop
	setx 0xfffff15efffff684, %g1, %g7
	.word 0xa3800007  ! 87: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f802448  ! 88: SIR	sir	0x0448
	setx 0xeab4d7de9e73ee8a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_55:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_56:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e004  ! 90: CASA_R	casa	[%r31] %asi, %r4, %r13
mondo_1_57:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d940014  ! 91: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
splash_hpstate_1_58:
	.word 0x8198288c  ! 92: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088c, %hpstate
	.word 0xda9fc3c0  ! 93: LDDA_R	ldda	[%r31, %r0] 0x1e, %r13
	.word 0x93a00172  ! 94: FABSq	dis not found

	.word 0xd26fe00c  ! 95: LDSTUB_I	ldstub	%r9, [%r31 + 0x000c]
	setx 0xb70675154cdbfb35, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_59:
	.word 0x39400001  ! 96: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd26fe0e9  ! 97: LDSTUB_I	ldstub	%r9, [%r31 + 0x00e9]
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 98: Tcc_R	te	icc_or_xcc, %r0 + %r30
fpinit_1_60:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 99: FDIVd	fdivd	%f0, %f4, %f8
	.word 0xc3ecc030  ! 100: PREFETCHA_R	prefetcha	[%r19, %r16] 0x01, #one_read
DS_1_61:
	.word 0xa1a4c9c5  ! 1: FDIVd	fdivd	%f50, %f36, %f16
	pdist %f10, %f8, %f22
	.word 0x95b48302  ! 101: ALIGNADDRESS	alignaddr	%r18, %r2, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a0196b  ! 102: FqTOd	dis not found

pmu_1_63:
	nop
	setx 0xfffff243fffffdd7, %g1, %g7
	.word 0xa3800007  ! 103: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_1_64:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd35121e0	! Random illegal ?
	.word 0xdb14800a  ! 1: LDQF_R	-	[%r18, %r10], %f13
	.word 0x9ba08826  ! 104: FADDs	fadds	%f2, %f6, %f13
	.word 0x99902000  ! 105: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x99b50490  ! 106: FCMPLE32	fcmple32	%d20, %d16, %r12
	.word 0x9f8038c8  ! 107: SIR	sir	0x18c8
	.word 0xd827e0a2  ! 108: STW_I	stw	%r12, [%r31 + 0x00a2]
debug_1_65:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_1_65:
	mov 0xdf2, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd960  ! 109: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd81fc000  ! 110: LDD_R	ldd	[%r31 + %r0], %r12
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_66:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 111: CASA_R	casa	[%r31] %asi, %r16, %r12
change_to_randtl_1_67:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_67:
	.word 0x8f902000  ! 112: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_1_68:
	setx 0x0b028e471177f4ed, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 113: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_69:
	setx 0x118ebfd36c8571ff, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 114: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_70
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_70:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 115: RDPC	rd	%pc, %r18
pmu_1_71:
	nop
	setx 0xfffff8befffff424, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01972  ! 117: FqTOd	dis not found

	.word 0xe527e0f6  ! 118: STF_I	st	%f18, [0x00f6, %r31]
mondo_1_73:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d94c00d  ! 119: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_74:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 120: CASA_R	casa	[%r31] %asi, %r13, %r18
splash_lsu_1_75:
	set 0xadfdde26, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 121: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa984c013  ! 122: WR_SET_SOFTINT_R	wr	%r19, %r19, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_76) + 24, 16, 16)) -> intp(1,0,7)
intvec_1_76:
	.word 0x39400001  ! 123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_1_77:
	nop
	setx 0xfffffe09fffffb3d, %g1, %g7
	.word 0xa3800007  ! 124: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_1_78:
	nop
	setx 0xfffff1ddfffffae5, %g1, %g7
	.word 0xa3800007  ! 125: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_79
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_79:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 126: CASA_R	casa	[%r31] %asi, %r19, %r18
pmu_1_80:
	nop
	setx 0xfffffdcdfffffcca, %g1, %g7
	.word 0xa3800007  ! 127: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_1_81:
	set 0x7a7be0af, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 128: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_1_82:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 129: RESTORE_R	restore	%r31, %r0, %r31
debug_1_83:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_1_83:
	mov 0xd7e, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd960  ! 130: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16a6510  ! 131: SDIVX_I	sdivx	%r9, 0x0510, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 132: LDX_R	ldx	[%r31 + %r0], %r16
change_to_randtl_1_85:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_85:
	.word 0x8f902000  ! 133: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_1_86:
	setx 0x275ba8859adf29a5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 134: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97a049ca  ! 135: FDIVd	fdivd	%f32, %f10, %f42
cwp_1_87:
    set user_data_start, %o7
	.word 0x93902005  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x26700001  ! 137: BPL	<illegal instruction>
	.word 0xd69fe038  ! 138: LDDA_I	ldda	[%r31, + 0x0038] %asi, %r11
mondo_1_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d940004  ! 139: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996cfb03  ! 140: SDIVX_I	sdivx	%r19, 0xfffffb03, %r12
	.word 0xe1bfe020  ! 141: STDFA_I	stda	%f16, [0x0020, %r31]
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_90:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e004  ! 142: CASA_R	casa	[%r31] %asi, %r4, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01966  ! 143: FqTOd	dis not found

	.word 0xd41fe038  ! 144: LDD_I	ldd	[%r31 + 0x0038], %r10
splash_tba_1_92:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 145: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	bvs  	 skip_1_93
	.word 0xa3a209cb  ! 1: FDIVd	fdivd	%f8, %f42, %f48
.align 2048
skip_1_93:
	.word 0x87a84a51  ! 146: FCMPd	fcmpd	%fcc<n>, %f32, %f48
splash_decr_1_94:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa7814014  ! 147: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r20, %-
	.word 0xc187e040  ! 148: LDFA_I	lda	[%r31, 0x0040], %f0
	.word 0xd08008a0  ! 149: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x95454000  ! 150: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
pmu_1_95:
	nop
	setx 0xffffffe9fffff211, %g1, %g7
	.word 0xa3800007  ! 151: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa5a349f2  ! 152: FDIVq	dis not found

splash_lsu_1_96:
	set 0xc617985a, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 153: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_97:
	setx 0xbacb32e68ca9bd16, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 154: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab84c007  ! 155: WR_CLEAR_SOFTINT_R	wr	%r19, %r7, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_98) + 24, 16, 16)) -> intp(2,0,8)
intvec_1_98:
	.word 0x39400001  ! 156: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 157: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4800be0  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r18
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_99
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_99:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e007  ! 159: CASA_R	casa	[%r31] %asi, %r7, %r18
	.word 0x99a189c3  ! 160: FDIVd	fdivd	%f6, %f34, %f12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_100) + 56, 16, 16)) -> intp(0,0,8)
intvec_1_100:
	.word 0x39400001  ! 161: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1454000  ! 162: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
	.word 0x81460000  ! 163: RD_STICK_REG	stbar
	.word 0xc3ecc034  ! 164: PREFETCHA_R	prefetcha	[%r19, %r20] 0x01, #one_read
mondo_1_101:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d924006  ! 165: WRPR_WSTATE_R	wrpr	%r9, %r6, %wstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_102
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_102:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 166: RDPC	rd	%pc, %r9
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_103:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 167: CASA_R	casa	[%r31] %asi, %r6, %r9
cmp_1_104:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_104:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_104
    nop
cmp_wait1_104:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_104
    nop
    ba,a cmp_startwait1_104
continue_cmp_1_104:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 10, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194c012  ! 168: WRPR_PIL_R	wrpr	%r19, %r18, %pil
splash_decr_1_105:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r10, [%r1] 0x45
	.word 0xa781400a  ! 169: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r10, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_106)+40, 16, 16)) -> intp(4,1,3)
xir_1_106:
	.word 0xa9817196  ! 170: WR_SET_SOFTINT_I	wr	%r5, 0x1196, %set_softint
	.word 0xd327c000  ! 171: STF_R	st	%f9, [%r0, %r31]
	.word 0xd28008a0  ! 172: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 173: LDX_R	ldx	[%r31 + %r0], %r9
cmp_1_107:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_107:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_107
    nop
cmp_wait1_107:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_107
    nop
    ba,a cmp_startwait1_107
continue_cmp_1_107:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x6c, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91950006  ! 174: WRPR_PIL_R	wrpr	%r20, %r6, %pil
	.word 0xd28008a0  ! 175: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_lsu_1_108:
	set 0x62744855, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 176: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_109:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 177: CASA_R	casa	[%r31] %asi, %r6, %r9
pmu_1_110:
	nop
	setx 0xfffff13ffffff624, %g1, %g7
	.word 0xa3800007  ! 178: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_1_111:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_111:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_111
    nop
debug_wait1_111:
    ld [%r23], %r16
    brnz %r16, debug_wait1_111
    nop
    ba,a debug_startwait1_111
continue_debug_1_111:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_111:
    cmp %r13, %r17
    bne,a wait_for_stat_1_111
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_111:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_111
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x00000050ecc40e5d,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe187dc00  ! 179: LDFA_R	lda	[%r31, %r0], %f16
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_112:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e006  ! 180: CASA_R	casa	[%r31] %asi, %r6, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_113)+32, 16, 16)) -> intp(4,1,3)
xir_1_113:
	.word 0xa9842e34  ! 181: WR_SET_SOFTINT_I	wr	%r16, 0x0e34, %set_softint
memptr_1_114:
	set user_data_start, %r31
	.word 0x8580e706  ! 182: WRCCR_I	wr	%r3, 0x0706, %ccr
mondo_1_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d90c00a  ! 183: WRPR_WSTATE_R	wrpr	%r3, %r10, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_116) + 48, 16, 16)) -> intp(3,0,7)
intvec_1_116:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_1_117:
	set 0xaa3fe481, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_118:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 186: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0xd237e087  ! 187: STH_I	sth	%r9, [%r31 + 0x0087]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 188: LDX_R	ldx	[%r31 + %r0], %r9
jmptr_1_119:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 189: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd28008a0  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xe187e0c0  ! 191: LDFA_I	lda	[%r31, 0x00c0], %f16
cwp_1_120:
    set user_data_start, %o7
	.word 0x93902003  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
mondo_1_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d90000a  ! 193: WRPR_WSTATE_R	wrpr	%r0, %r10, %wstate
mondo_1_122:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d948012  ! 194: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
DS_1_123:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x97b44309  ! 195: ALIGNADDRESS	alignaddr	%r17, %r9, %r11
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 196: Tcc_R	te	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_124
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_124:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 197: RDPC	rd	%pc, %r9
	.word 0x9b50c000  ! 198: RDPR_TT	<illegal instruction>
invtsb_1_125:
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
	.word 0x29800001  ! 199: FBL	fbl,a	<label_0x1>
DS_1_126:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 200: RESTORE_R	restore	%r31, %r0, %r31
cmp_1_127:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_127:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_127
    nop
cmp_wait1_127:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_127
    nop
    ba,a cmp_startwait1_127
continue_cmp_1_127:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x90, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194800c  ! 201: WRPR_PIL_R	wrpr	%r18, %r12, %pil
mondo_1_128:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d94c007  ! 202: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
splash_lsu_1_129:
	set 0x0d237621, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 203: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_1_130:
	set 0x314ea090, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 204: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 205: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_1_131:
	setx 0x6de7207fb57afe6b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 206: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_132
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_132:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e007  ! 207: CASA_R	casa	[%r31] %asi, %r7, %r13
splash_cmpr_1_133:
	setx 0x366c4443ab8cecc9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_1_134:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_134-donret_1_134), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009833ae | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xdd4, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_134:
	.word 0xdaffe014  ! 209: SWAPA_I	swapa	%r13, [%r31 + 0x0014] %asi
splash_decr_1_135:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r20, [%r1] 0x45
	.word 0xa7848011  ! 210: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r17, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_136) + 32, 16, 16)) -> intp(6,0,23)
intvec_1_136:
	.word 0x39400001  ! 211: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	fbe skip_1_137
	fbn,a,pn	%fcc0,  skip_1_137
.align 128
skip_1_137:
	.word 0xd83c000c  ! 212: STD_R	std	%r12, [%r16 + %r12]
splash_cmpr_1_138:
	setx 0x7992ea22daaaaea8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 213: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_1_139:
	set 0x7c6f808e, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 214: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d90348c  ! 215: WRPR_PSTATE_I	wrpr	%r0, 0x148c, %pstate
	.word 0xd88008a0  ! 216: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xd88fe008  ! 217: LDUBA_I	lduba	[%r31, + 0x0008] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_140
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_140:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 218: RDPC	rd	%pc, %r18
	.word 0x9f803228  ! 219: SIR	sir	0x1228
mondo_1_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d948000  ! 220: WRPR_WSTATE_R	wrpr	%r18, %r0, %wstate
jmptr_1_142:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 221: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe46fe017  ! 222: LDSTUB_I	ldstub	%r18, [%r31 + 0x0017]
	.word 0xe4800a60  ! 223: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r18
	.word 0x9f802086  ! 224: SIR	sir	0x0086
intveclr_1_143:
	setx 0x3cee2804d994f7b2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_144:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 226: CASA_R	casa	[%r31] %asi, %r0, %r18
splash_lsu_1_145:
	set 0x7a6266a7, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 227: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_146
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_146
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_146:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 228: RDPC	rd	%pc, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 229: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe68008a0  ! 230: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
intveclr_1_147:
	setx 0x48ed48723a1ccb50, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 231: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	brz,pn  	%r12, skip_1_148
	.word 0x99a189d0  ! 1: FDIVd	fdivd	%f6, %f16, %f12
.align 2048
skip_1_148:
	.word 0x97b044d2  ! 232: FCMPNE32	fcmpne32	%d32, %d18, %r11
splash_cmpr_1_149:
	setx 0xd2bc01aa9c5a8b9a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 233: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_150) + 56, 16, 16)) -> intp(4,0,13)
intvec_1_150:
	.word 0x39400001  ! 234: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_1_151:
	nop
	setx 0xfffff2c0fffffc3d, %g1, %g7
	.word 0xa3800007  ! 235: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b3  ! 236: Tcc_I	ta	icc_or_xcc, %r0 + 179
intveclr_1_152:
	setx 0xec220c1efd1740f1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 237: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3692571  ! 238: SDIVX_I	sdivx	%r4, 0x0571, %r17
pmu_1_154:
	nop
	setx 0xfffff0c6fffffa11, %g1, %g7
	.word 0xa3800007  ! 239: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe2800c60  ! 240: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r17
	.word 0x97b4448c  ! 241: FCMPLE32	fcmple32	%d48, %d12, %r11
	.word 0xd727c000  ! 242: STF_R	st	%f11, [%r0, %r31]
	.word 0xc187e0c0  ! 243: LDFA_I	lda	[%r31, 0x00c0], %f0
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_155:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r11
	.word 0x99902002  ! 245: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
DS_1_156:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe33420d4  ! 1: STQF_I	-	%f17, [0x00d4, %r16]
	normalw
	.word 0xa3458000  ! 246: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0xa3a4c9b4  ! 247: FDIVs	fdivs	%f19, %f20, %f17
	fbuge skip_1_157
	fbu skip_1_157
.align 32
skip_1_157:
	.word 0xd4380013  ! 248: STD_R	std	%r10, [%r0 + %r19]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 249: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd527c000  ! 250: STF_R	st	%f10, [%r0, %r31]
	.word 0x83d020b2  ! 251: Tcc_I	te	icc_or_xcc, %r0 + 178
intveclr_1_158:
	setx 0xdcb5223b2f9fc658, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 252: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_159:
	setx 0xaf51aef9c32ded73, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_160:
	setx 0x0b219e3980064e3b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 254: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f80267f  ! 255: SIR	sir	0x067f
intveclr_1_161:
	setx 0xbcc4f9a558f16929, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 256: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_1_162:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xcd765260	! Random illegal ?
	.word 0x91a00551  ! 1: FSQRTd	fsqrt	
	.word 0xa3a40834  ! 257: FADDs	fadds	%f16, %f20, %f17
	.word 0x9f80210d  ! 258: SIR	sir	0x010d
	.word 0xe257c000  ! 259: LDSH_R	ldsh	[%r31 + %r0], %r17
splash_lsu_1_163:
	set 0x32b618d6, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 260: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	be,a	 skip_1_164
	fbug,a,pn	%fcc0,  skip_1_164
.align 2048
skip_1_164:
	.word 0xa7a509d3  ! 261: FDIVd	fdivd	%f20, %f50, %f50
	.word 0x81460000  ! 262: RD_STICK_REG	stbar
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936c2bf0  ! 263: SDIVX_I	sdivx	%r16, 0x0bf0, %r9
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_166:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 264: CASA_R	casa	[%r31] %asi, %r19, %r9
	.word 0xa3a409c2  ! 265: FDIVd	fdivd	%f16, %f2, %f48
intveclr_1_167:
	setx 0x1e6c3f487c01d483, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 266: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93450000  ! 267: RD_SET_SOFTINT	rd	%set_softint, %r9
splash_hpstate_1_168:
	.word 0x81982bd6  ! 268: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd6, %hpstate
splash_htba_1_169:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 269: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_1_170:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd3350012  ! 1: STQF_R	-	%f9, [%r18, %r20]
	normalw
	.word 0xa7458000  ! 270: RD_SOFTINT_REG	rd	%softint, %r19
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_171
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_171:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 271: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0x91d020b2  ! 272: Tcc_I	ta	icc_or_xcc, %r0 + 178
mondo_1_172:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d910013  ! 273: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
	.word 0xa7a0016c  ! 274: FABSq	dis not found

	setx 0x5feccde5f43a2fbf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_173:
	.word 0x39400001  ! 275: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_1_174:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_174-donret_1_174), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00eaea52 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe15, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_174:
	.word 0xe6ffe06a  ! 276: SWAPA_I	swapa	%r19, [%r31 + 0x006a] %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01971  ! 277: FqTOd	dis not found

splash_cmpr_1_176:
	setx 0x96d7147b21bd260a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_177:
	setx 0x5454d4814b598caf, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 279: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 280: LDX_R	ldx	[%r31 + %r0], %r18
fpinit_1_178:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 281: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0xe4800ac0  ! 282: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r18
	.word 0x93d020b3  ! 283: Tcc_I	tne	icc_or_xcc, %r0 + 179
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_179
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_179:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 284: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0x87aa4a54  ! 285: FCMPd	fcmpd	%fcc<n>, %f40, %f20
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_180) + 48, 16, 16)) -> intp(7,0,17)
intvec_1_180:
	.word 0x39400001  ! 286: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3450000  ! 287: RD_SET_SOFTINT	rd	%set_softint, %r17
fpinit_1_181:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82bf0  ! 288: PREFETCHA_I	prefetcha	[%r0, + 0x0bf0] %asi, #one_read
	.word 0xe28fe028  ! 289: LDUBA_I	lduba	[%r31, + 0x0028] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_182
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_182:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 290: RDPC	rd	%pc, %r11
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 291: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0x9f80385d  ! 292: SIR	sir	0x185d
splash_cmpr_1_184:
	setx 0xd4ab52e007837e65, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 293: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_1_185:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_185-donret_1_185-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b4b299 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x404, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_185:
	.word 0xd6ffe044  ! 294: SWAPA_I	swapa	%r11, [%r31 + 0x0044] %asi
	.word 0xd737c000  ! 295: STQF_R	-	%f11, [%r0, %r31]
	.word 0xd727e096  ! 296: STF_I	st	%f11, [0x0096, %r31]
	.word 0xd66fe0f0  ! 297: LDSTUB_I	ldstub	%r11, [%r31 + 0x00f0]
splash_lsu_1_186:
	set 0x573dcdf8, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc187e0a0  ! 299: LDFA_I	lda	[%r31, 0x00a0], %f0
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 300: LDX_R	ldx	[%r31 + %r0], %r11
intveclr_1_187:
	setx 0x21ed511b1f808438, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_188:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_1_188:
	mov 0xb41, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe0e0  ! 302: STDFA_I	stda	%f16, [0x00e0, %r31]
	setx 0x8548f92ee40903df, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_189:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903280  ! 304: WRPR_PSTATE_I	wrpr	%r0, 0x1280, %pstate
DS_1_190:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd9353d25  ! 1: STQF_I	-	%f12, [0x1d25, %r20]
	normalw
	.word 0xa7458000  ! 305: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0xe65fe020  ! 306: LDX_I	ldx	[%r31 + 0x0020], %r19
	.word 0xe6bfe0ba  ! 307: STDA_I	stda	%r19, [%r31 + 0x00ba] %asi
pmu_1_191:
	nop
	setx 0xffffff33fffff38d, %g1, %g7
	.word 0xa3800007  ! 308: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe727e0b9  ! 309: STF_I	st	%f19, [0x00b9, %r31]
pmu_1_192:
	nop
	setx 0xfffff93afffff2dd, %g1, %g7
	.word 0xa3800007  ! 310: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68008a0  ! 311: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
pmu_1_193:
	nop
	setx 0xfffff908fffffd28, %g1, %g7
	.word 0xa3800007  ! 312: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cmp_1_194:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_194:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_194
    nop
cmp_wait1_194:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_194
    nop
    ba,a cmp_startwait1_194
continue_cmp_1_194:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x8a, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91940011  ! 313: WRPR_PIL_R	wrpr	%r16, %r17, %pil
mondo_1_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d918014  ! 314: WRPR_WSTATE_R	wrpr	%r6, %r20, %wstate
	.word 0xa984c014  ! 315: WR_SET_SOFTINT_R	wr	%r19, %r20, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_196) + 16, 16, 16)) -> intp(4,0,11)
intvec_1_196:
	.word 0x39400001  ! 316: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_197
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_197:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 317: RDPC	rd	%pc, %r8
mondo_1_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d94000d  ! 318: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
fpinit_1_199:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 319: FDIVd	fdivd	%f0, %f4, %f4
intveclr_1_200:
	setx 0x87b79ad69bfc61b8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 320: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99a00165  ! 321: FABSq	dis not found

intveclr_1_201:
	setx 0xc8d49370c50cceec, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_202) + 0, 16, 16)) -> intp(7,0,0)
intvec_1_202:
	.word 0x39400001  ! 323: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_203:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 324: RDPC	rd	%pc, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_204) + 0, 16, 16)) -> intp(4,0,10)
intvec_1_204:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_205:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 326: RDPC	rd	%pc, %r13
	ba,a	 skip_1_206
	fbue,a,pn	%fcc0,  skip_1_206
.align 512
skip_1_206:
	.word 0xc368702f  ! 327: PREFETCH_I	prefetch	[%r1 + 0xfffff02f], #one_read
	.word 0xdac7e018  ! 328: LDSWA_I	ldswa	[%r31, + 0x0018] %asi, %r13
	.word 0x83d020b3  ! 329: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0xe187dc00  ! 330: LDFA_R	lda	[%r31, %r0], %f16
	.word 0x83d020b3  ! 331: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0xda800c40  ! 332: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r13
	bpos  	 skip_1_207
	be,a	 skip_1_207
.align 1024
skip_1_207:
	.word 0x99a4c9cd  ! 333: FDIVd	fdivd	%f50, %f44, %f12
	bne  	 skip_1_208
	ble  	 skip_1_208
.align 32
skip_1_208:
	.word 0xc36c3f58  ! 334: PREFETCH_I	prefetch	[%r16 + 0xffffff58], #one_read
intveclr_1_209:
	setx 0x4836cb20c453c678, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 335: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_210
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_210
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_210:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 336: RDPC	rd	%pc, %r11
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_211
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_211:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 337: CASA_R	casa	[%r31] %asi, %r19, %r11
pmu_1_212:
	nop
	setx 0xffffff6cfffff850, %g1, %g7
	.word 0xa3800007  ! 338: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa1b00492  ! 339: FCMPLE32	fcmple32	%d0, %d18, %r16
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_213
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_213:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 340: CASA_R	casa	[%r31] %asi, %r18, %r16
intveclr_1_214:
	setx 0xd5821ca2135bfec1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 341: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_215
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_215:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 342: CASA_R	casa	[%r31] %asi, %r18, %r16
	.word 0xe08008a0  ! 343: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_1_216:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d950011  ! 344: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
DS_1_217:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 345: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_218:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 346: RDPC	rd	%pc, %r18
mondo_1_219:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d950012  ! 347: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	.word 0x9b500000  ! 348: RDPR_TPC	rdpr	%tpc, %r13
	.word 0xda6fe078  ! 349: LDSTUB_I	ldstub	%r13, [%r31 + 0x0078]
	.word 0xda57c000  ! 350: LDSH_R	ldsh	[%r31 + %r0], %r13
jmptr_1_220:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 351: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_1_221:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 352: FDIVs	fdivs	%f0, %f4, %f6
intveclr_1_222:
	setx 0x305543218a9a1cb7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 353: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_223
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_223
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_223:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 354: RDPC	rd	%pc, %r19
	.word 0x9f802d13  ! 355: SIR	sir	0x0d13
donret_1_224:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_224-donret_1_224), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f17fb6 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc5d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_224:
	.word 0xe6ffe010  ! 356: SWAPA_I	swapa	%r19, [%r31 + 0x0010] %asi
	.word 0x9f80398c  ! 357: SIR	sir	0x198c
debug_1_225:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_225:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_225
    nop
debug_wait1_225:
    ld [%r23], %r16
    brnz %r16, debug_wait1_225
    nop
    ba,a debug_startwait1_225
continue_debug_1_225:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_225:
    cmp %r13, %r17
    bne,a wait_for_stat_1_225
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_225:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_225
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x00000050b9ce5d20,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc187dc00  ! 358: LDFA_R	lda	[%r31, %r0], %f0
cmp_1_226:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_226:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_226
    nop
cmp_wait1_226:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_226
    nop
    ba,a cmp_startwait1_226
continue_cmp_1_226:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xb2, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91908010  ! 359: WRPR_PIL_R	wrpr	%r2, %r16, %pil
	.word 0x87ac0a48  ! 360: FCMPd	fcmpd	%fcc<n>, %f16, %f8
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_227:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e008  ! 361: CASA_R	casa	[%r31] %asi, %r8, %r8
	.word 0x91a0016c  ! 362: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_228
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_228
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_228:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 363: RDPC	rd	%pc, %r20
	bn  	 skip_1_229
	.word 0x87aa0a40  ! 1: FCMPd	fcmpd	%fcc<n>, %f8, %f0
.align 32
skip_1_229:
	.word 0xc36cb0cc  ! 364: PREFETCH_I	prefetch	[%r18 + 0xfffff0cc], #one_read
	.word 0xd137e0fc  ! 365: STQF_I	-	%f8, [0x00fc, %r31]
donret_1_230:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_230-donret_1_230), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fae8d3 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xddd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_230:
	.word 0xd0ffe00c  ! 366: SWAPA_I	swapa	%r8, [%r31 + 0x000c] %asi
change_to_randtl_1_231:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_231:
	.word 0x8f902002  ! 367: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xad80e77a  ! 368: WR_SOFTINT_REG_I	wr	%r3, 0x077a, %softint
	.word 0xa984c010  ! 369: WR_SET_SOFTINT_R	wr	%r19, %r16, %set_softint
	.word 0x8d903bf4  ! 370: WRPR_PSTATE_I	wrpr	%r0, 0x1bf4, %pstate
splash_lsu_1_232:
	set 0xf5365be7, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 371: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd137e0b1  ! 372: STQF_I	-	%f8, [0x00b1, %r31]
unsupttte1_233:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x93a2c9a5  ! 373: FDIVs	fdivs	%f11, %f5, %f9
memptr_1_234:
	set user_data_start, %r31
	.word 0x858229a5  ! 374: WRCCR_I	wr	%r8, 0x09a5, %ccr
mondo_1_235:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d910011  ! 375: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
	.word 0xd337c000  ! 376: STQF_R	-	%f9, [%r0, %r31]
	.word 0xd317c000  ! 377: LDQF_R	-	[%r31, %r0], %f9
    set 0x3005, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b507f0  ! 378: PDISTN	fmean16	%d20, %d16, %d48
	fbl skip_1_236
	.word 0xa3a4c9c0  ! 1: FDIVd	fdivd	%f50, %f0, %f48
.align 512
skip_1_236:
	.word 0xd23a800b  ! 379: STD_R	std	%r9, [%r10 + %r11]
	setx 0x33fbdaf1e4c24e3c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_237:
	.word 0x39400001  ! 380: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f802959  ! 381: SIR	sir	0x0959
	.word 0x99a0016c  ! 382: FABSq	dis not found

intveclr_1_238:
	setx 0xc09e553d0d9f0f4e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 383: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3a00161  ! 384: FABSq	dis not found

	.word 0x8d903864  ! 385: WRPR_PSTATE_I	wrpr	%r0, 0x1864, %pstate
splash_htba_1_239:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 386: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_240
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_240:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 387: RDPC	rd	%pc, %r8
	.word 0xd05fe010  ! 388: LDX_I	ldx	[%r31 + 0x0010], %r8
splash_cmpr_1_241:
	setx 0xa10612ae08d24e64, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d020b5  ! 390: Tcc_I	te	icc_or_xcc, %r0 + 181
splash_lsu_1_242:
	set 0x304cf6ca, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 391: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_243
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_243
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_243:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 392: RDPC	rd	%pc, %r9
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_244
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_244:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e001  ! 393: CASA_R	casa	[%r31] %asi, %r1, %r9
debug_1_245:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_1_245:
	mov 0xc7e, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe0e0  ! 394: STDFA_I	stda	%f16, [0x00e0, %r31]
	.word 0xd257c000  ! 395: LDSH_R	ldsh	[%r31 + %r0], %r9
	.word 0x9f80307a  ! 396: SIR	sir	0x107a
mondo_1_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d908013  ! 397: WRPR_WSTATE_R	wrpr	%r2, %r19, %wstate
	.word 0xd26fe023  ! 398: LDSTUB_I	ldstub	%r9, [%r31 + 0x0023]
	.word 0xa3a0016c  ! 399: FABSq	dis not found

	.word 0xe2bfe010  ! 400: STDA_I	stda	%r17, [%r31 + 0x0010] %asi
	.word 0xe20fc000  ! 401: LDUB_R	ldub	[%r31 + %r0], %r17
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 402: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe317c000  ! 403: LDQF_R	-	[%r31, %r0], %f17
pmu_1_247:
	nop
	setx 0xfffff9f2fffff3a8, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_1_248:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 405: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 406: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7702ce8  ! 407: POPC_I	popc	0x0ce8, %r19
	.word 0xa9808010  ! 408: WR_SET_SOFTINT_R	wr	%r2, %r16, %set_softint
invtsb_1_249:
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
	.word 0x29800001  ! 409: FBL	fbl,a	<label_0x1>
intveclr_1_250:
	setx 0xd1ec043f56878903, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 410: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95a089c7  ! 411: FDIVd	fdivd	%f2, %f38, %f10
cmp_1_251:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_251:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_251
    nop
cmp_wait1_251:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_251
    nop
    ba,a cmp_startwait1_251
continue_cmp_1_251:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xc0, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91914013  ! 412: WRPR_PIL_R	wrpr	%r5, %r19, %pil
	.word 0x9f8025d6  ! 413: SIR	sir	0x05d6
    set 0x3be7, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b487e4  ! 414: PDISTN	fmean16	%d18, %d4, %d18
cmp_1_252:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_252:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_252
    nop
cmp_wait1_252:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_252
    nop
    ba,a cmp_startwait1_252
continue_cmp_1_252:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xf2, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91934006  ! 415: WRPR_PIL_R	wrpr	%r13, %r6, %pil
	.word 0xe48fe020  ! 416: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r18
	.word 0x2a700001  ! 417: BPCS	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 418: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4800ae0  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r18
	.word 0xe187c2c0  ! 420: LDFA_R	lda	[%r31, %r0], %f16
change_to_randtl_1_253:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_253:
	.word 0x8f902000  ! 421: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa9a0016c  ! 422: FABSq	dis not found

splash_hpstate_1_254:
	.word 0x81982597  ! 423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0597, %hpstate
mondo_1_255:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d91c009  ! 424: WRPR_WSTATE_R	wrpr	%r7, %r9, %wstate
	.word 0x9f803629  ! 425: SIR	sir	0x1629
	.word 0xa7454000  ! 426: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
intveclr_1_256:
	setx 0x321ec4bd8d2ebc43, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 427: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_257:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 428: RDPC	rd	%pc, %r20
cmp_1_258:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_258:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_258
    nop
cmp_wait1_258:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_258
    nop
    ba,a cmp_startwait1_258
continue_cmp_1_258:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 62, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91924001  ! 429: WRPR_PIL_R	wrpr	%r9, %r1, %pil
splash_cmpr_1_259:
	setx 0x70bb5dba1fc69588, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 430: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_decr_1_260:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r20, [%r1] 0x45
	.word 0xa7804010  ! 431: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r16, %-
	.word 0xe857c000  ! 432: LDSH_R	ldsh	[%r31 + %r0], %r20
	.word 0x93540000  ! 433: RDPR_GL	<illegal instruction>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_261
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_261:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 434: CASA_R	casa	[%r31] %asi, %r16, %r9
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_262
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_262:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 435: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01973  ! 436: FqTOd	dis not found

	.word 0x95a00165  ! 437: FABSq	dis not found

change_to_randtl_1_264:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_264:
	.word 0x8f902001  ! 438: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_1_265:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_265:
	.word 0x8f902000  ! 439: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_1_266:
	setx 0xa66e5996d02d4336, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9169e37b  ! 441: SDIVX_I	sdivx	%r7, 0x037b, %r8
splash_cmpr_1_268:
	setx 0xc3003463325a8947, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 442: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd127e042  ! 443: STF_I	st	%f8, [0x0042, %r31]
	.word 0x83d020b5  ! 444: Tcc_I	te	icc_or_xcc, %r0 + 181
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 445: Tcc_R	te	icc_or_xcc, %r0 + %r30
jmptr_1_269:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 446: JMPL_R	jmpl	%r27 + %r0, %r27
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
	.word 0x99414000  ! 447: RDPC	rd	%pc, %r12
	.word 0xd937e0a8  ! 448: STQF_I	-	%f12, [0x00a8, %r31]
pmu_1_271:
	nop
	setx 0xfffff79bfffff548, %g1, %g7
	.word 0xa3800007  ! 449: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_1_272:
	nop
	setx 0xfffff83cfffff2b1, %g1, %g7
	.word 0xa3800007  ! 450: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_htba_1_273:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 451: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd89fe020  ! 452: LDDA_I	ldda	[%r31, + 0x0020] %asi, %r12
	.word 0x8d903e0c  ! 453: WRPR_PSTATE_I	wrpr	%r0, 0x1e0c, %pstate
	.word 0x99902005  ! 454: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
pmu_1_274:
	nop
	setx 0xfffff132fffff44b, %g1, %g7
	.word 0xa3800007  ! 455: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_1_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d95000a  ! 456: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
	.word 0xd88008a0  ! 457: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	bne,a	 skip_1_276
	.word 0xe3e50022  ! 1: CASA_I	casa	[%r20] 0x 1, %r2, %r17
.align 128
skip_1_276:
	.word 0xc36c7d06  ! 458: PREFETCH_I	prefetch	[%r17 + 0xfffffd06], #one_read
splash_lsu_1_277:
	set 0x4981dce6, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 459: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd31fc000  ! 460: LDDF_R	ldd	[%r31, %r0], %f9
cmp_1_278:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_278:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_278
    nop
cmp_wait1_278:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_278
    nop
    ba,a cmp_startwait1_278
continue_cmp_1_278:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xd8, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91944011  ! 461: WRPR_PIL_R	wrpr	%r17, %r17, %pil
	.word 0xd277e099  ! 462: STX_I	stx	%r9, [%r31 + 0x0099]
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
	.word 0x9b414000  ! 463: RDPC	rd	%pc, %r13
	fblg skip_1_280
	.word 0xd5e34033  ! 1: CASA_I	casa	[%r13] 0x 1, %r19, %r10
.align 2048
skip_1_280:
	.word 0xe2388012  ! 464: STD_R	std	%r17, [%r2 + %r18]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0196b  ! 465: FqTOd	dis not found

splash_hpstate_1_282:
	.word 0x8198226e  ! 466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x026e, %hpstate
change_to_randtl_1_283:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_283:
	.word 0x8f902000  ! 467: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xda3fc000  ! 468: STD_R	std	%r13, [%r31 + %r0]
	.word 0x93d02033  ! 469: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x83d020b5  ! 470: Tcc_I	te	icc_or_xcc, %r0 + 181
intveclr_1_284:
	setx 0x7b3a1fcada7ebf14, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 471: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_285:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d944001  ! 472: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
	.word 0xda77c000  ! 473: STX_R	stx	%r13, [%r31 + %r0]
pmu_1_286:
	nop
	setx 0xfffffcf1fffff7c8, %g1, %g7
	.word 0xa3800007  ! 474: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xdacfe030  ! 475: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
	.word 0x9f803d60  ! 476: SIR	sir	0x1d60
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 477: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xdb37e032  ! 478: STQF_I	-	%f13, [0x0032, %r31]
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_287
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_287
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_287:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 479: RDPC	rd	%pc, %r16
splash_cmpr_1_288:
	setx 0x381ed6fc00771726, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 480: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9480000  ! 481: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
cmp_1_289:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_289:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_289
    nop
cmp_wait1_289:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_289
    nop
    ba,a cmp_startwait1_289
continue_cmp_1_289:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xc0, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9191000b  ! 482: WRPR_PIL_R	wrpr	%r4, %r11, %pil
donret_1_290:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_290-donret_1_290), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001372df | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x957, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_290:
	.word 0xe8ffe028  ! 483: SWAPA_I	swapa	%r20, [%r31 + 0x0028] %asi
	fbu,a,pn	%fcc0,  skip_1_291
	.word 0xe4398001  ! 1: STD_R	std	%r18, [%r6 + %r1]
.align 128
skip_1_291:
	.word 0x39400001  ! 484: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd497e028  ! 485: LDUHA_I	lduha	[%r31, + 0x0028] %asi, %r10
	.word 0xd51fc000  ! 486: LDDF_R	ldd	[%r31, %r0], %f10
splash_decr_1_292:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa784c008  ! 487: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r8, %-
	.word 0xd527c000  ! 488: STF_R	st	%f10, [%r0, %r31]
splash_hpstate_1_293:
	.word 0x81982c57  ! 489: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c57, %hpstate
	.word 0xd46fe011  ! 490: LDSTUB_I	ldstub	%r10, [%r31 + 0x0011]
jmptr_1_294:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 491: JMPL_R	jmpl	%r27 + %r0, %r27
debug_1_295:
	nop
	ta T_CHANGE_HPRIV
debug_iva_1_295:
	mov 0x57c, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+40), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe0e0  ! 492: STDFA_I	stda	%f16, [0x00e0, %r31]
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_296
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_296:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 493: RDPC	rd	%pc, %r20
	.word 0x9f803e56  ! 494: SIR	sir	0x1e56
pmu_1_297:
	nop
	setx 0xfffffde2ffffff32, %g1, %g7
	.word 0xa3800007  ! 495: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_1_298:
	setx 0x2b096c34b8960b52, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 496: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_299:
	setx 0x6201e0b0da876865, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 497: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe80fe020  ! 498: LDUB_I	ldub	[%r31 + 0x0020], %r20
	.word 0x99a00164  ! 499: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01962  ! 500: FqTOd	dis not found

splash_cmpr_1_301:
	setx 0x0f2bd6e423807455, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 501: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_302:
	setx 0x17028394dd9145a4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 502: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9545c000  ! 503: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0xd537c000  ! 504: STQF_R	-	%f10, [%r0, %r31]
	.word 0x9f802043  ! 505: SIR	sir	0x0043
cmp_1_303:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_303:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_303
    nop
cmp_wait1_303:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_303
    nop
    ba,a cmp_startwait1_303
continue_cmp_1_303:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x78, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91940011  ! 506: WRPR_PIL_R	wrpr	%r16, %r17, %pil
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 507: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_1_304:
	setx 0x894d80e68b0c30de, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 508: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_1_305:
	.word 0x95a4c9c3  ! 1: FDIVd	fdivd	%f50, %f34, %f10
	pdist %f24, %f26, %f16
	.word 0x9bb3030a  ! 509: ALIGNADDRESS	alignaddr	%r12, %r10, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_306) + 56, 16, 16)) -> intp(2,0,14)
intvec_1_306:
	.word 0x39400001  ! 510: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_307:
	setx 0x02d3744368579715, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 511: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f80270d  ! 512: SIR	sir	0x070d
splash_lsu_1_308:
	set 0x43d73ed1, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 513: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_1_309:
	setx 0x7e777ee9793362e6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 514: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 515: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda800b00  ! 516: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r13
pmu_1_310:
	nop
	setx 0xfffff74efffff43c, %g1, %g7
	.word 0xa3800007  ! 517: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38700001  ! 518: BPGU	<illegal instruction>
splash_decr_1_311:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r7, [%r1] 0x45
	.word 0xa7850010  ! 519: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r16, %-
	.word 0xda6fe0b9  ! 520: LDSTUB_I	ldstub	%r13, [%r31 + 0x00b9]
    set 0x3293, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb307e1  ! 521: PDISTN	fmean16	%d12, %d32, %d44
mondo_1_312:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d940010  ! 522: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
donret_1_313:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_313-donret_1_313-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00bdcb2c | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd9c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_313:
	.word 0xdaffe05a  ! 523: SWAPA_I	swapa	%r13, [%r31 + 0x005a] %asi
	.word 0x9f80220f  ! 524: SIR	sir	0x020f
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01960  ! 525: FqTOd	dis not found

	.word 0xdacfe028  ! 526: LDSBA_I	ldsba	[%r31, + 0x0028] %asi, %r13
	.word 0x95a209a8  ! 527: FDIVs	fdivs	%f8, %f8, %f10
mondo_1_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d910008  ! 528: WRPR_WSTATE_R	wrpr	%r4, %r8, %wstate
	.word 0xd41fe000  ! 529: LDD_I	ldd	[%r31 + 0x0000], %r10
	.word 0xd537e0d1  ! 530: STQF_I	-	%f10, [0x00d1, %r31]
DS_1_316:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe731f813  ! 1: STQF_I	-	%f19, [0x1813, %r7]
	normalw
	.word 0x9b458000  ! 531: RD_SOFTINT_REG	rd	%softint, %r13
cwp_1_317:
    set user_data_start, %o7
	.word 0x93902004  ! 532: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_cmpr_1_318:
	setx 0xd472f8fb45d2d7f9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 533: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_1_319:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_319-donret_1_319-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00426b8a | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb5d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_319:
	.word 0xdaffe010  ! 534: SWAPA_I	swapa	%r13, [%r31 + 0x0010] %asi
	.word 0xa3a00174  ! 535: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 536: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xe2800bc0  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r17
mondo_1_320:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d940002  ! 538: WRPR_WSTATE_R	wrpr	%r16, %r2, %wstate
unsupttte1_321:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa5b28491  ! 539: FCMPLE32	fcmple32	%d10, %d48, %r18
jmptr_1_322:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 540: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe4800c60  ! 541: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r18
pmu_1_323:
	nop
	setx 0xfffff1a9fffff02e, %g1, %g7
	.word 0xa3800007  ! 542: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_1_324:
	set 0x1d94a77c, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 543: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_1_325:
	nop
	ta T_CHANGE_HPRIV
debug_iva_1_325:
	mov 0x73b, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+32), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe187d920  ! 544: LDFA_R	lda	[%r31, %r0], %f16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_326) + 24, 16, 16)) -> intp(6,0,11)
intvec_1_326:
	.word 0x39400001  ! 545: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_1_327:
	setx 0xb996e3a9483b0656, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 546: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_328:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d94000d  ! 547: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
	.word 0xa0d42160  ! 548: UMULcc_I	umulcc 	%r16, 0x0160, %r16
memptr_1_329:
	set 0x60540000, %r31
	.word 0x85836fb4  ! 549: WRCCR_I	wr	%r13, 0x0fb4, %ccr
	.word 0x9f8027c8  ! 550: SIR	sir	0x07c8
memptr_1_330:
	set user_data_start, %r31
	.word 0x85812375  ! 551: WRCCR_I	wr	%r4, 0x0375, %ccr
	.word 0xe1bfd960  ! 552: STDFA_R	stda	%f16, [%r0, %r31]
	bn,a	 skip_1_331
	bleu  	 skip_1_331
.align 512
skip_1_331:
	.word 0xa9a309d3  ! 553: FDIVd	fdivd	%f12, %f50, %f20
splash_cmpr_1_332:
	setx 0xcd54e4b0d545b57f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 554: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97a489d2  ! 555: FDIVd	fdivd	%f18, %f18, %f42
jmptr_1_333:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 556: JMPL_R	jmpl	%r27 + %r0, %r27
unsupttte1_334:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x95a4c9a8  ! 557: FDIVs	fdivs	%f19, %f8, %f10
	.word 0xd48008a0  ! 558: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01971  ! 559: FqTOd	dis not found

	.word 0x9ba249d4  ! 560: FDIVd	fdivd	%f40, %f20, %f44
debug_1_336:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_336:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_336
    nop
debug_wait1_336:
    ld [%r23], %r16
    brnz %r16, debug_wait1_336
    nop
    ba,a debug_startwait1_336
continue_debug_1_336:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_336:
    cmp %r13, %r17
    bne,a wait_for_stat_1_336
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_336:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_336
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x00000050ecdd20c3,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfc2c0  ! 561: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x91d02034  ! 562: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xda1fc000  ! 563: LDD_R	ldd	[%r31 + %r0], %r13
mondo_1_337:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d940001  ! 564: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_338
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_338
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_338:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 565: RDPC	rd	%pc, %r11
	fbue,a,pn	%fcc0,  skip_1_339
	.word 0x95b104d4  ! 1: FCMPNE32	fcmpne32	%d4, %d20, %r10
.align 512
skip_1_339:
	.word 0x87a90a52  ! 566: FCMPd	fcmpd	%fcc<n>, %f4, %f18
	.word 0xe657e018  ! 567: LDSH_I	ldsh	[%r31 + 0x0018], %r19
splash_hpstate_1_340:
	.word 0x8198259f  ! 568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059f, %hpstate
	.word 0xe64fc000  ! 569: LDSB_R	ldsb	[%r31 + %r0], %r19
splash_lsu_1_341:
	set 0x2db9eea7, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 570: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
fpinit_1_342:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 571: FCMPLE32	fcmple32	%d0, %d4, %r4
splash_lsu_1_343:
	set 0x4b1e0442, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 572: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01961  ! 573: FqTOd	dis not found

	.word 0xd6800ba0  ! 574: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_345)+40, 16, 16)) -> intp(4,1,3)
xir_1_345:
	.word 0xa9833b25  ! 575: WR_SET_SOFTINT_I	wr	%r12, 0x1b25, %set_softint
	.word 0xd677e03c  ! 576: STX_I	stx	%r11, [%r31 + 0x003c]
jmptr_1_346:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 577: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x26ea2965aa8c082f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_347:
	.word 0x39400001  ! 578: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 579: LDX_R	ldx	[%r31 + %r0], %r11
pmu_1_348:
	nop
	setx 0xfffffbb8fffff101, %g1, %g7
	.word 0xa3800007  ! 580: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f803fe0  ! 581: SIR	sir	0x1fe0
	.word 0x91d02035  ! 582: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_1_349:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 583: SAVE_R	save	%r31, %r0, %r31
pmu_1_350:
	nop
	setx 0xfffff329ffffff3c, %g1, %g7
	.word 0xa3800007  ! 584: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_1_351:
	taddcctv %r0, 0x1f99, %r11
	.word 0xd607e0ce  ! 585: LDUW_I	lduw	[%r31 + 0x00ce], %r11
	.word 0x91a109b0  ! 586: FDIVs	fdivs	%f4, %f16, %f8
	fbge,a,pn	%fcc0,  skip_1_352
	fbg,a,pn	%fcc0,  skip_1_352
.align 2048
skip_1_352:
	.word 0x87ac0a48  ! 587: FCMPd	fcmpd	%fcc<n>, %f16, %f8
	be  	 skip_1_353
	fbu,a,pn	%fcc0,  skip_1_353
.align 128
skip_1_353:
	.word 0x39400001  ! 588: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_354:
	.word 0x819820d5  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d5, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 590: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_1_355:
	setx 0x3625246210e25cbd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 591: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4c7e038  ! 592: LDSWA_I	ldswa	[%r31, + 0x0038] %asi, %r18
	.word 0x8d90312a  ! 593: WRPR_PSTATE_I	wrpr	%r0, 0x112a, %pstate
mondo_1_356:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d948009  ! 594: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
jmptr_1_357:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 595: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe4800ac0  ! 596: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r18
jmptr_1_358:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 597: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_1_359:
	setx 0x38b48b36fbaf5ae8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 598: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_1_360:
	nop
	setx 0xfffff4a8fffff637, %g1, %g7
	.word 0xa3800007  ! 599: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_361
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_361:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 600: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0xe4800be0  ! 601: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r18
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_362
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_362:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 602: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0x9f8024ba  ! 603: SIR	sir	0x04ba
	.word 0xe53fe008  ! 604: STDF_I	std	%f18, [0x0008, %r31]
	.word 0xe537c000  ! 605: STQF_R	-	%f18, [%r0, %r31]
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 606: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe51fe010  ! 607: LDDF_I	ldd	[%r31, 0x0010], %f18
	.word 0x8d902b94  ! 608: WRPR_PSTATE_I	wrpr	%r0, 0x0b94, %pstate
jmptr_1_363:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 609: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc3e84020  ! 610: PREFETCHA_R	prefetcha	[%r1, %r0] 0x01, #one_read
intveclr_1_364:
	setx 0xa52bdd4e48015c71, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 611: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_365:
	setx 0x1da12f8a169f1823, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 612: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_366:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_366:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_366
    nop
debug_wait1_366:
    ld [%r23], %r16
    brnz %r16, debug_wait1_366
    nop
    ba,a debug_startwait1_366
continue_debug_1_366:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_366:
    cmp %r13, %r17
    bne,a wait_for_stat_1_366
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_366:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_366
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x000000502ce0c3c5,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe187de00  ! 613: LDFA_R	lda	[%r31, %r0], %f16
splash_cmpr_1_367:
	setx 0xb0f3885ccc897631, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 614: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc1bfe020  ! 615: STDFA_I	stda	%f0, [0x0020, %r31]
	.word 0xe25fe010  ! 616: LDX_I	ldx	[%r31 + 0x0010], %r17
	.word 0x9b45c000  ! 617: RD_TICK_CMPR_REG	rd	%-, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_368) + 0, 16, 16)) -> intp(3,0,25)
intvec_1_368:
	.word 0x39400001  ! 618: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda1fc000  ! 619: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xc187e040  ! 620: LDFA_I	lda	[%r31, 0x0040], %f0
splash_tba_1_369:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 621: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1454000  ! 622: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
tagged_1_370:
	tsubcctv %r17, 0x1358, %r13
	.word 0xe007e03d  ! 623: LDUW_I	lduw	[%r31 + 0x003d], %r16
memptr_1_371:
	set 0x60540000, %r31
	.word 0x8581e4e1  ! 624: WRCCR_I	wr	%r7, 0x04e1, %ccr
mondo_1_372:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d90c00b  ! 625: WRPR_WSTATE_R	wrpr	%r3, %r11, %wstate
	.word 0x93d020b2  ! 626: Tcc_I	tne	icc_or_xcc, %r0 + 178
splash_htba_1_373:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 627: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_374
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_374:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00b  ! 628: CASA_R	casa	[%r31] %asi, %r11, %r16
	.word 0xa9454000  ! 629: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0x99a00174  ! 630: FABSq	dis not found

	.word 0xa7a509c6  ! 631: FDIVd	fdivd	%f20, %f6, %f50
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 632: LDX_R	ldx	[%r31 + %r0], %r19
cwp_1_375:
    set user_data_start, %o7
	.word 0x93902004  ! 633: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x81510000  ! 635: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe68008a0  ! 636: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
cmp_1_376:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_376:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_376
    nop
cmp_wait1_376:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_376
    nop
    ba,a cmp_startwait1_376
continue_cmp_1_376:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xfc, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91948010  ! 637: WRPR_PIL_R	wrpr	%r18, %r16, %pil
intveclr_1_377:
	setx 0xadcd74add75eb13a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 638: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 639: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_1_378:
	set 0xefe85de7, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 640: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe6800bc0  ! 641: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r19
	.word 0xe627e03c  ! 642: STW_I	stw	%r19, [%r31 + 0x003c]
	.word 0x83d02032  ! 643: Tcc_I	te	icc_or_xcc, %r0 + 50
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_379
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_379:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 644: CASA_R	casa	[%r31] %asi, %r16, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_380) + 40, 16, 16)) -> intp(5,0,2)
intvec_1_380:
	.word 0x39400001  ! 645: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_decr_1_381:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r9, [%r1] 0x45
	.word 0xa7830008  ! 646: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r8, %-
mondo_1_382:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d948012  ! 647: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956c660b  ! 648: SDIVX_I	sdivx	%r17, 0x060b, %r10
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
	.word 0x95414000  ! 649: RDPC	rd	%pc, %r10
	.word 0xd42fe0e4  ! 650: STB_I	stb	%r10, [%r31 + 0x00e4]
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 651: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56cf613  ! 652: SDIVX_I	sdivx	%r19, 0xfffff613, %r18
splash_lsu_1_386:
	set 0x5f9a567f, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 653: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	fbug skip_1_387
	.word 0x87ac8a4c  ! 1: FCMPd	fcmpd	%fcc<n>, %f18, %f12
.align 32
skip_1_387:
	.word 0x87ac0a4a  ! 654: FCMPd	fcmpd	%fcc<n>, %f16, %f10
	.word 0x9745c000  ! 655: RD_TICK_CMPR_REG	rd	%-, %r11
splash_lsu_1_388:
	set 0xf171b76c, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 656: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9b45c000  ! 657: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xa8852678  ! 658: ADDcc_I	addcc 	%r20, 0x0678, %r20
debug_1_389:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_1_389:
	mov 0xfc1, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0a0  ! 659: STDFA_I	stda	%f0, [0x00a0, %r31]
	.word 0xe8800c00  ! 660: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r20
jmptr_1_390:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 661: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_1_391:
	nop
	setx 0xfffff4f5fffffdd6, %g1, %g7
	.word 0xa3800007  ! 662: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9b540000  ! 663: RDPR_GL	<illegal instruction>
cmp_1_392:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_392:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_392
    nop
cmp_wait1_392:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_392
    nop
    ba,a cmp_startwait1_392
continue_cmp_1_392:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 58, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194800c  ! 664: WRPR_PIL_R	wrpr	%r18, %r12, %pil
splash_lsu_1_393:
	set 0xf295a271, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 665: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_1_394:
	nop
	setx 0xfffff2d5ffffffd1, %g1, %g7
	.word 0xa3800007  ! 666: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_395
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_395:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 667: CASA_R	casa	[%r31] %asi, %r12, %r13
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_396
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_396:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 668: CASA_R	casa	[%r31] %asi, %r12, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 669: LDX_R	ldx	[%r31 + %r0], %r13
splash_cmpr_1_397:
	setx 0x5004c07f6421f76a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 670: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_398:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 671: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_399
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_399
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_399:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 672: RDPC	rd	%pc, %r16
    set 0x1bfc, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b507f0  ! 673: PDISTN	fmean16	%d20, %d16, %d10
	.word 0x99a00164  ! 674: FABSq	dis not found

mondo_1_400:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d94c011  ! 675: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
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
    and %r14, 2, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91908014  ! 676: WRPR_PIL_R	wrpr	%r2, %r20, %pil
mondo_1_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d904001  ! 677: WRPR_WSTATE_R	wrpr	%r1, %r1, %wstate
fpinit_1_403:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 678: FCMPLE32	fcmple32	%d0, %d4, %r6
    set 0x5db, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b4c7f4  ! 679: PDISTN	fmean16	%d50, %d20, %d18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01965  ! 680: FqTOd	dis not found

cwp_1_405:
    set user_data_start, %o7
	.word 0x93902000  ! 681: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_406
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_406:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 682: CASA_R	casa	[%r31] %asi, %r5, %r17
splash_cmpr_1_407:
	setx 0x3e2ba2e76f16f81b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 683: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_1_408:
	set 0x448d5218, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 684: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 685: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x91500000  ! 686: RDPR_TPC	<illegal instruction>
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_409:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 687: RDPC	rd	%pc, %r8
	.word 0xa5480000  ! 688: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_410
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_410:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 689: CASA_R	casa	[%r31] %asi, %r5, %r18
fpinit_1_411:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 690: FCMPLE32	fcmple32	%d0, %d4, %r6
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
	.word 0xe5e7e005  ! 691: CASA_R	casa	[%r31] %asi, %r5, %r18
jmptr_1_413:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 692: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_1_414:
	nop
	setx 0xfffffdeffffff2bc, %g1, %g7
	.word 0xa3800007  ! 693: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cmp_1_415:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_415:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_415
    nop
cmp_wait1_415:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_415
    nop
    ba,a cmp_startwait1_415
continue_cmp_1_415:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x46, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91944005  ! 694: WRPR_PIL_R	wrpr	%r17, %r5, %pil
splash_hpstate_1_416:
	.word 0x81982fd6  ! 695: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd6, %hpstate
donret_1_417:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_417-donret_1_417-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ccc6f0 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x546, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_417:
	.word 0xe4ffe038  ! 696: SWAPA_I	swapa	%r18, [%r31 + 0x0038] %asi
debug_1_418:
	nop
	ta T_CHANGE_HPRIV
debug_iva_1_418:
	mov 0x6df, %r20
	mov 0x1b, %r19
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
	.word 0xe1bfe080  ! 697: STDFA_I	stda	%f16, [0x0080, %r31]
pmu_1_419:
	nop
	setx 0xfffff8b6fffffa04, %g1, %g7
	.word 0xa3800007  ! 698: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_1_420:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d918012  ! 699: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
	.word 0xa7540000  ! 700: RDPR_GL	<illegal instruction>
DS_1_421:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xdb343ee1  ! 1: STQF_I	-	%f13, [0x1ee1, %r16]
	normalw
	.word 0x97458000  ! 701: RD_SOFTINT_REG	rd	%softint, %r11
cmpenall_1_422:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmpenall_startwait1_422:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_1_422
    nop
cmpenall_wait1_422:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait1_422
    nop
    ba,a cmpenall_startwait1_422
continue_cmpenall_1_422:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_1_422:
    cmp %r13, %r14
    bne,a wait_for_cmpstat_1_422
    ldxa [0x58]%asi, %r14       !Running_status
    mov 0xff, %r14              !All threads running
    stxa %r14, [0x50]%asi 
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_1_422:
    cmp %r14, %r16
    bne,a wait_for_cmpstat2_1_422
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

	.xword	0x10a1e21b3cc09926
	.xword	0x176a3f40c24d4232
	.xword	0x602b947a4df9438a
	.xword	0xcac70c9cb85a8cb2
	.xword	0xec0dc8675f3d2955
	.xword	0x546682a080d7ddb9
	.xword	0xb1801cb883fa975d
	.xword	0xa7b1fa992e15bc9a
	.xword	0xdf516a9d26cfe279
	.xword	0xbed9d91871b63ce3
	.xword	0xdca369a01ac48a04
	.xword	0xf444018012b792e9
	.xword	0xdc147c981bb5eb33
	.xword	0x8bebaff258d16fce
	.xword	0x1c8309350d3be95c
	.xword	0xc1e9c424ef0cff77
	.xword	0xf260a3b7e57d81b1
	.xword	0x1a2111d9f66c0bf1
	.xword	0x367f5e5613684e4f
	.xword	0xfa89307699fdce50
	.xword	0x00a57aeca93bd1a3
	.xword	0x294b596b598cb658
	.xword	0x390d7b81112cefa0
	.xword	0xf7c1eb04fe6e2d56
	.xword	0x76195d0008580c3b
	.xword	0xd5c66e327ca826ea
	.xword	0x51f3c4f4f3aa2725
	.xword	0x6134eafd056bc1a0
	.xword	0x68b90b2007c17e12
	.xword	0x2d43b9ac05ea73cc
	.xword	0x5a34df10db77aedd
	.xword	0xdeed5caeef6db19c
	.xword	0x14803ee959076891
	.xword	0x3684800f997b4221
	.xword	0x8a871eb5b52deb4d
	.xword	0x4719ca382b1d2dcc
	.xword	0x41be5c3cd4db906e
	.xword	0x5e744717456e139a
	.xword	0x0554e2dfde9afe9e
	.xword	0x2774a00f2828ac8c
	.xword	0x18bd6c58c7b00a15
	.xword	0xd649b2986fe30070
	.xword	0xc39d771ccee83b38
	.xword	0x34e1d0d3f127802a
	.xword	0xe4d58d79bfac0ee3
	.xword	0x1b9ba4bd46728c3d
	.xword	0x4cd3788e85a2cc25
	.xword	0x806b0bc5341e67f1
	.xword	0x4ea60faf375e9c65
	.xword	0x195cd2bd965a10b8
	.xword	0x83cde0450f90adec
	.xword	0x0b84525e4d9d59d9
	.xword	0xafee17eb904df568
	.xword	0xae9dc1203aa20114
	.xword	0xd0d51fdc4e591371
	.xword	0x4b61d06b29eed69f
	.xword	0xc09143af9e55988d
	.xword	0x16b6872b9598397a
	.xword	0x72975c973710af07
	.xword	0x5544b2124a8bf482
	.xword	0xc1d0ee35f01add80
	.xword	0x99d9761381c71a76
	.xword	0xa4950ba938b2b70d
	.xword	0x85aaf79dd0e1c3e9
	.xword	0xe175bbb394ed81be
	.xword	0xe5a6066d19da58d4
	.xword	0x30a7a6cab9c089d5
	.xword	0x0c5f226461125a81
	.xword	0x44396db403a6fc66
	.xword	0x7aa604a35c1711fc
	.xword	0x7a855ead35adc113
	.xword	0x820e9727ef26e7ab
	.xword	0x0500aeca8e88b742
	.xword	0x3706438470db5f07
	.xword	0x17dda72aa3edf3c8
	.xword	0x7a589f138bb224b5
	.xword	0xef2d5f3429589d84
	.xword	0x325825897e11d4f2
	.xword	0x386c3429ae9c94cd
	.xword	0x93ddf247054766fb
	.xword	0x8abd9abf4ebc006d
	.xword	0xce67cc9b08aa88f6
	.xword	0x66357470b4071e0a
	.xword	0x579bbf188782c864
	.xword	0x9c4f4c68a8072b10
	.xword	0xe58f6b993f2dbb46
	.xword	0x89d7694d37055b81
	.xword	0xafbd6007a3b3d119
	.xword	0x8d9540aea4fd426a
	.xword	0xeceba5971f417f6e
	.xword	0xa172052883668506
	.xword	0xda4e7ae14e37b471
	.xword	0x3ecd4463c57ea966
	.xword	0x003c9dd9dc6146cb
	.xword	0xcad238fc62acf89b
	.xword	0x7ea056cecc3c4543
	.xword	0x785df212e7f1a171
	.xword	0x9f71fe4787cadbab
	.xword	0x53c40e7aa221b28c
	.xword	0x0332825465e443e6
	.xword	0x0c29fc99f85b7e3d
	.xword	0x22df52f0acd912ac
	.xword	0x14e3eea4dc6fcf94
	.xword	0xa609dc4360ab5020
	.xword	0x2f85e2e5baa34039
	.xword	0x04fe7d88ac7a2502
	.xword	0xb4e90ca22455df44
	.xword	0xc6b8e16e3f1ff507
	.xword	0xf09ad078ec84f646
	.xword	0xc5efa3d7f2378f7d
	.xword	0xf6596a8f360851a0
	.xword	0x6a84a1db95dcd5f6
	.xword	0x4d50870257ae3f34
	.xword	0x598276b3c1904e68
	.xword	0x70b49b1273774633
	.xword	0x6aba4a61ff5e7481
	.xword	0x3851486c0d08eb67
	.xword	0x4131e9760a7ccf6b
	.xword	0xe7f7742fd164b63a
	.xword	0x174a26b2b6dada7c
	.xword	0x2425840b0a4521d5
	.xword	0x688004505b6997ba
	.xword	0x9e2df0b1a264eb7b
	.xword	0x1bdb59bac290acf4
	.xword	0xcb8fd63449e3bd17
	.xword	0x62cc801978d50b0d
	.xword	0xd2374d20dd540763
	.xword	0x5454ea4cb1a8fbe3
	.xword	0x565de4c596a75e8e
	.xword	0x01706d5e9f8fb0bb
	.xword	0x973b174ff8e1ec20
	.xword	0xda18d2ee45ab3f9b
	.xword	0x11da988abd3d99b5
	.xword	0xc2ea28a697785d93
	.xword	0x9bbc5ee0d834e1d9
	.xword	0xad3bb0eb6122439f
	.xword	0x56af9e09cc16758b
	.xword	0xb67b34f5674f2a89
	.xword	0xcf312bf188b4e966
	.xword	0xcf7410c82c2c5cfa
	.xword	0xc80aaf51c72baa67
	.xword	0xe3606b2daac98c1c
	.xword	0x7ebf1a4d3f10b7dd
	.xword	0x507f23bc29f453d8
	.xword	0xb472c4946cd5b082
	.xword	0xe5714a2760fe021d
	.xword	0x96fdade11c2c7053
	.xword	0xb718f874def7d352
	.xword	0x86f645d1916778dd
	.xword	0x215f48ce57ca2b0a
	.xword	0x5b20280acbb1bef6
	.xword	0x36cf5002c2ebc401
	.xword	0x61eeaaf6f1ec893a
	.xword	0x2a6057e8742292ca
	.xword	0xf4fdc30411899811
	.xword	0xd8e111c6c12fa38f
	.xword	0x915c49e18c0955d2
	.xword	0xa019ee6a5e655395
	.xword	0x996a67985c3999d0
	.xword	0x7260ac466e80c55c
	.xword	0x2a477385a4bcfe10
	.xword	0x0d2711b548501abe
	.xword	0x4a8482292ad0c982
	.xword	0xd61db8e8cb2c03b6
	.xword	0x67f81a37e1f8ab70
	.xword	0x9ca179fc477c4944
	.xword	0x3f88175a87f485c8
	.xword	0xdbe50f3d4d0e702e
	.xword	0x977809270c45e63e
	.xword	0x40e88ef665c69c12
	.xword	0x1e22970e7078c6a1
	.xword	0x6d37bc2fb28175b3
	.xword	0x177572aee6f878e2
	.xword	0x385c8fe70ba306fe
	.xword	0x61485c7b87e1dec9
	.xword	0x1cd55714b83e53bd
	.xword	0xbd73f364b369a83f
	.xword	0x379c58d5a5a18639
	.xword	0xabf570bbf145d728
	.xword	0xd20c99a9740da86f
	.xword	0xbe2792672666e1a9
	.xword	0x15bac8d519574275
	.xword	0xa411ec3a18675f2e
	.xword	0x0626bd906e7c1df8
	.xword	0xe6c225e9ccbc3b90
	.xword	0xd032512e38836bd1
	.xword	0xdea0e707b0caca94
	.xword	0xcf3a4cce63c8c981
	.xword	0x55c3582435b091ed
	.xword	0x20f95fcbd84f8102
	.xword	0x668af8b9c218121c
	.xword	0x341045238b5f212d
	.xword	0xe9bd923f2064a616
	.xword	0x62d9d5b2e4cdb3a0
	.xword	0xbf3518e259346635
	.xword	0x236107a8074f4112
	.xword	0x9744ce7e78516ef3
	.xword	0xa58655906955b942
	.xword	0x08705b21569c068d
	.xword	0xe6419f204e2efd11
	.xword	0x8f370aaabcffff10
	.xword	0x1bc86df407470020
	.xword	0x18c66e330ea6d511
	.xword	0x2aa81eebd4c46615
	.xword	0xb9986a8ad34babbd
	.xword	0x4f309bc83b422878
	.xword	0xf47b03f60bc99de2
	.xword	0xc053a1cf8228c5e2
	.xword	0xf4874e3b490630bf
	.xword	0x22bdc37153988a30
	.xword	0x244649ac92228287
	.xword	0xa8254a1aaef6cab6
	.xword	0x8be9d9874584824e
	.xword	0xe0446d5a5d35ec8f
	.xword	0xa30c6e3ac552b166
	.xword	0xa3c39de169fad808
	.xword	0xab3e7a9c9608e269
	.xword	0x1bce24034499f1dc
	.xword	0xaac603222cf2070d
	.xword	0x1e2b1327581c416c
	.xword	0x814431619d147ea4
	.xword	0x67ee7adf211c60cd
	.xword	0x39b692fb86124021
	.xword	0xdd718a0e2513196c
	.xword	0x2f84702fe8757b9f
	.xword	0xce14ec1df72d1372
	.xword	0x36f23f4d1c2e5ec2
	.xword	0x45fea7065b0f3a09
	.xword	0x620907b979a373c8
	.xword	0x32391e65ee4957f4
	.xword	0x07b91a4c6f52c683
	.xword	0x178f9832a39089a5
	.xword	0x10978a696c9ad0f1
	.xword	0xf7794221492698a6
	.xword	0x7d6d08bd8dbfaccf
	.xword	0xd153ac554bc7ff0d
	.xword	0xaa404be5c6cabf79
	.xword	0x58b64d51b4b8275e
	.xword	0x7c9f6537a8947b21
	.xword	0x1bddca403b22c53d
	.xword	0x795228578d4d8a43
	.xword	0x1f158178b79b3ea6
	.xword	0x869c0b0b283b723e
	.xword	0x692d4975f5addbe4
	.xword	0x82fdb983f9ef5b1d
	.xword	0x6dd0cfc2fe059e7b
	.xword	0xf261df49e6e64b25
	.xword	0xba011d2cd2e102ab
	.xword	0xbfdfcf4baa21a2ae
	.xword	0xed3502c25d2f12d2
	.xword	0x9e7811390503440c
	.xword	0x79d0bf6a35301bad
	.xword	0xef796dbf9a5987d6
	.xword	0xdebceb43d29cec92
	.xword	0x80dbd571a527aa83
	.xword	0xc60194664ab37a89

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
# 730 "diag.j"
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
	TTE_CP	 = 1,
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
	TTE_CP	 = 1,
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
	TTE_CP	 = 1,
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
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0,
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
	TTE_CP	 = 1,
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
	TTE_CP	 = 1,
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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
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
	.xword	0x7892f5fb97c14735
	.xword	0xb02efa672fec3d4c
	.xword	0xdd2c199b59e99d05
	.xword	0x258b9dc6d8f4a0f4
	.xword	0x806ad0e3bc20f979
	.xword	0x9c1153f159f606eb
	.xword	0xae6d66f3fb72a564
	.xword	0xca2baec0c50f7256
	.xword	0x62a48c389f6f5b22
	.xword	0x432081320b5038e4
	.xword	0xe308bbcacc04a365
	.xword	0x0974b6c0c6061387
	.xword	0xbbc6f83c5906fea4
	.xword	0x15d7f5dc700e9064
	.xword	0x22d50d8004ce46db
	.xword	0x10514a509cd3667f
	.xword	0xe8c38ab030d02811
	.xword	0x2f5d7c27666881d7
	.xword	0xe0815af52d95a120
	.xword	0x063339004ad6a70e
	.xword	0x14ece5289e927edf
	.xword	0x10e4f11511ecea88
	.xword	0x36e7e01b9b8c1d47
	.xword	0x01edc941e263d903
	.xword	0x95ec2880924e8e27
	.xword	0xcbaee7f749b97a57
	.xword	0x0513d2524cc968f2
	.xword	0x1efbfc1479fe7c32
	.xword	0x21cf7a325b5082f5
	.xword	0x19ba00324f69ecf0
	.xword	0x2c72d570e2ca7a2a
	.xword	0x1fcf7f947e491d3f



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


attr_data {
	Name	 = .MyDATA_1,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_1,
	hypervisor
}

.data
	.xword	0xc73180d4559e2db3
	.xword	0xe4ba9cc7b39758f6
	.xword	0x38756430cde09373
	.xword	0xf7d540453f973fce
	.xword	0xff317c0c6407ba1e
	.xword	0xc2b0ed0c03f27222
	.xword	0x0c56efd5893e2aeb
	.xword	0xa1cf61fe0f00c70c
	.xword	0x914406f9f0c52afd
	.xword	0xdcb7aee5bec597e3
	.xword	0x5a2db9aa30c251e9
	.xword	0x9d834be1001db562
	.xword	0xc44a4aa4cd7b6d28
	.xword	0xe8e6830e6c08ad53
	.xword	0x21e67e48d69a772d
	.xword	0x978c2b08725ad236
	.xword	0x058fef4bb8071b34
	.xword	0xedc3a9e281cd104c
	.xword	0x20d7a8bde74f699e
	.xword	0x3d7b344a434d57ec
	.xword	0x5e8fa4631c3f0280
	.xword	0x79caec7c1d366e68
	.xword	0x16e8594264eeaced
	.xword	0xaa182bb63875c845
	.xword	0x27fbeaff36863fca
	.xword	0xa534b4bc359c0b76
	.xword	0x11981807542739f8
	.xword	0x8ec1034065943b14
	.xword	0x7974516788038f54
	.xword	0x53bb2cc7c365f79e
	.xword	0xcaae3a1550e6e714
	.xword	0x8e2110858a2f3f8c



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
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
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
	.xword	0x6355169282892025
	.xword	0xc3f611545b11de83
	.xword	0xeaf673d38dcccc13
	.xword	0x22c3e657d8d0015a
	.xword	0xb56d5fde052bb960
	.xword	0xbce02b26992a2888
	.xword	0x82b56387d9b40193
	.xword	0x3c1808c26fdc6371
	.xword	0x4369168112e697b8
	.xword	0x5bb152752f68ce33
	.xword	0x022631f8d2db250c
	.xword	0x443d7a2ddf5bdb2b
	.xword	0x313924404180d2d5
	.xword	0x451066abbf5cf6e5
	.xword	0x218079ddd87a4e78
	.xword	0x0de391cc149f0d84
	.xword	0x879a396a97b148f3
	.xword	0x3a895754c3144220
	.xword	0xf6d0088a52f3c43d
	.xword	0x8ca8bd607c25f647
	.xword	0xe8db3543d5449afa
	.xword	0x112965ff5369f113
	.xword	0x4b42a12b079e7299
	.xword	0x695b636a83ec35cc
	.xword	0xad1cdf9ff79969c0
	.xword	0xe55c751224da1e2f
	.xword	0xa5b1d1746c2e9786
	.xword	0xe79430a593277487
	.xword	0x8c6a9c336edf9089
	.xword	0x437088985b222a05
	.xword	0x636877126e6d6275
	.xword	0x7dcb1bbefbade7d8



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
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
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
	.xword	0x927f90ca5022d4aa
	.xword	0xabb84be53d817da1
	.xword	0xbb9bbc3be99879f4
	.xword	0x1c16a19e1bda07d2
	.xword	0x5430ac139cc1b8cb
	.xword	0x2a4530bdb3a608f6
	.xword	0x097ac64b61bc9184
	.xword	0x26a9536542ba5c64
	.xword	0xb8c89f68988351ef
	.xword	0xf4f7c788c6417bdf
	.xword	0xa1464d9cf0cc5b83
	.xword	0x7d2adbdba88e8668
	.xword	0x4b732992161fb5cb
	.xword	0x7106b3d993c1148d
	.xword	0xd2b986b6766dfa0a
	.xword	0xb12ee802752861e1
	.xword	0xdb18d8d08519bb95
	.xword	0x502cfaecc7a21802
	.xword	0x0d6563bc0dd66a91
	.xword	0xc666dc2c0e7762e5
	.xword	0x9233e2dd7ba38503
	.xword	0x37f6f90c44227880
	.xword	0x677478da55bead4a
	.xword	0x247b1782d259934b
	.xword	0xa36edd0a15d4e45e
	.xword	0xcbf3f7555c7f4d54
	.xword	0x1409dbdc8d549756
	.xword	0xefb202f8d42900e4
	.xword	0x5a396f501c0c95f8
	.xword	0x34eca8de649d9b77
	.xword	0x3ae6e10da18487cd
	.xword	0x3422f0bfd51bc059





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
	TTE_W	 = 0
}

.text
nuff_said_0:
	fdivd %f0, %f4, %f4
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
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.text
nuff_said_2:
	fdivd %f0, %f4, %f4
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
nuff_said_3:
	fdivs %f0, %f4, %f6
	jmpl %r27+8, %r0
	fdivd %f0, %f4, %f6



#if 0
#endif
