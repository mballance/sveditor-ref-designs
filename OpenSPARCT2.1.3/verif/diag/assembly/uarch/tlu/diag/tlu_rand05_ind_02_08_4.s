/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_02_08_4.s
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
#define TRAP_SECT_HV_ALSO
#define IMMU_SKIP_IF_NO_TTE
#define DMMU_SKIP_IF_NO_TTE
#define PORTABLE_CORE
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_VA_IS_RA_ALSO
#define DISABLE_PART_LIMIT_CHECK
#define MAIN_PAGE_USE_CONFIG 3
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
    wrpr %l2, %l3, %tstate; nop
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
    wrhpr %l2, %l3, %htstate; nop
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
    wrhpr %o4, %l2, %htstate;\
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

#define H_HT0_Data_access_error_0x32
#define SUN_H_HT0_Data_access_error_0x32 \
    done;nop

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

#define  H_HT0_IAE_privilege_violation_0x08
#define  My_HT0_IAE_privilege_violation_0x08 \
    HT_HANDLER_RAND7_2;\
    done
#define  H_HT0_IAE_unauth_access_0x0b
#define  SUN_H_HT0_IAE_unauth_access_0x0b \
    HT_HANDLER_RAND7_3;\
    done

#define H_HT0_data_access_protection_0x6c
#define SUN_H_HT0_data_access_protection_0x6c   ba daccess_prot_handler; nop

#define H_HT0_PA_Watchpoint_0x61
#define My_H_HT0_PA_Watchpoint_0x61 \
    HT_HANDLER_RAND7_4;\
    done

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
# 752 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_Instruction_address_range_0x0d
#define SUN_H_HT0_Instruction_address_range_0x0d \
    HT_HANDLER_RAND4_1;\
    done;

#define H_HT0_mem_real_range_0x2d
#define SUN_H_HT0_mem_real_range_0x2d \
    HT_HANDLER_RAND4_2;\
    done;
# 763 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 779 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_unauth_access_0x0b
#define SUN_H_HT0_IAE_unauth_access_0x0b \
    HT_HANDLER_RAND4_6;\
    done;
# 785 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_nfo_page_0x0c
#define SUN_H_HT0_IAE_nfo_page_0x0c \
    HT_HANDLER_RAND7_6;\
    done;
# 791 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_Reserved_0x3b
#define SUN_H_HT0_Reserved_0x3b \
    HT_HANDLER_RAND7_2;\
    done;
# 803 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 317 "diag.j"
!# Steer towards main TBA on these errors ..
!# These are redefines ...
#define SUN_H_HT0_DAE_nc_page_0x16 \
    set 0x120000, %r2;\
    wrpr %r0, %r2, %tba; \
    done;nop

#define SUN_H_HT0_DAE_nfo_page_0x17 \
    set 0x120000, %r2;\
    wrpr %r0, %r2, %tba; \
    done;nop

#define SUN_H_HT0_IAE_unauth_access_0x0b \
    set retry_with_base_tba, %g3;\
    jmp %g3;\
    nop

#define SUN_H_HT0_IAE_nfo_page_0x0c \
    set retry_with_base_tba, %g3;\
    jmp %g3;\
    nop

#include "hboot.s"
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
	mov 0xb0, %r14
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
	mov 0xb3, %r14
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
	mov 0x31, %r14
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
	mov 0x34, %r14
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
    setx 0x2061003000000000, %l1, %l2		!#		Control Word

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
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
DS_80_1:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x91a409c7  ! 1: FDIVd	fdivd	%f16, %f38, %f8
	.word 0xa7a48830  ! 1: FADDs	fadds	%f18, %f16, %f19
	.word 0x91d02033  ! 2: Tcc_I	ta	icc_or_xcc, %r0 + 51
pmu_80_2:
	nop
	setx 0xfffff9b0fffff7fb, %g1, %g7
	.word 0xa3800007  ! 3: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 4: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_3:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e009  ! 5: CASA_R	casa	[%r31] %asi, %r9, %r9
DS_80_4:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 6: SAVE_R	save	%r31, %r0, %r31
intveclr_80_5:
	setx 0x137f4dc55a5eba0f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_6
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_6
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_6:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 8: RDPC	rd	%pc, %r12
	rd %pc, %r19
	add %r19, (ivw_80_7-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_7:
	.word 0x91924010  ! 9: WRPR_PIL_R	wrpr	%r9, %r16, %pil
change_to_randtl_80_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_8:
	.word 0x8f902000  ! 10: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_80_9:
	setx 0x6eff29f8997d6512, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 11: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 12: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_80_10:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 13: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_80_11:
	.word 0xa7a0c9d4  ! 1: FDIVd	fdivd	%f34, %f20, %f50
	pdist %f10, %f16, %f28
	.word 0x9bb18306  ! 14: ALIGNADDRESS	alignaddr	%r6, %r6, %r13
splash_hpstate_80_12:
	.word 0x8198226d  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x026d, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01974  ! 16: FqTOd	dis not found

    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_14
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_14:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e012  ! 17: CASA_R	casa	[%r31] %asi, %r18, %r9
	.word 0xd277e030  ! 18: STX_I	stx	%r9, [%r31 + 0x0030]
	.word 0x8d903d09  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x1d09, %pstate
DS_80_15:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa9b0430b  ! 20: ALIGNADDRESS	alignaddr	%r1, %r11, %r20
	.word 0xe807c000  ! 21: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0x91a189c7  ! 22: FDIVd	fdivd	%f6, %f38, %f8
	.word 0xd4c7e030  ! 23: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
debug_80_16:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 24: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_17:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e006  ! 25: CASA_R	casa	[%r31] %asi, %r6, %r10
memptr_80_18:
	set user_data_start, %r31
	.word 0x8580372d  ! 26: WRCCR_I	wr	%r0, 0x172d, %ccr
mondo_80_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d94800c  ! 27: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
	.word 0x3a700001  ! 28: BPCC	<illegal instruction>
	.word 0xd537c000  ! 29: STQF_R	-	%f10, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_20
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_20:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 30: RDPC	rd	%pc, %r10
	.word 0x95a00170  ! 31: FABSq	dis not found

splash_cmpr_80_21:
	setx 0x8e6efd1f48d4a1f1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 32: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd697e020  ! 33: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r11
	.word 0x83d02033  ! 34: Tcc_I	te	icc_or_xcc, %r0 + 51
splash_hpstate_80_22:
	.word 0x81982d16  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d16, %hpstate
	.word 0xd66fe05f  ! 36: LDSTUB_I	ldstub	%r11, [%r31 + 0x005f]
splash_cmpr_80_23:
	setx 0x680efed702ea6b87, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 37: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_80_24:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 38: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0xad846f61  ! 39: WR_SOFTINT_REG_I	wr	%r17, 0x0f61, %softint
	.word 0xd66fe0df  ! 40: LDSTUB_I	ldstub	%r11, [%r31 + 0x00df]
intveclr_80_25:
	setx 0xe82e50f0cc33de9f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 41: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d90202b  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x002b, %pstate
	.word 0xd737c000  ! 43: STQF_R	-	%f11, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_26
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_26:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 44: RDPC	rd	%pc, %r16
mondo_80_27:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d948008  ! 45: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
	.word 0x26800001  ! 46: BL	bl,a	<label_0x1>
	.word 0xd48008a0  ! 47: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_80_28:
	set 0x55798a0b, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 48: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_80_29:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 49: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x97a00167  ! 50: FABSq	dis not found

	.word 0xe68008a0  ! 51: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
splash_tba_80_30:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 52: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d902f51  ! 53: WRPR_PSTATE_I	wrpr	%r0, 0x0f51, %pstate
DS_80_31:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 54: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_32) + 48, 16, 16)) -> intp(1,0,6)
intvec_80_32:
	.word 0x39400001  ! 55: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x044a3e3eb76c8665, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_33:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_80_34:
	nop
	setx 0xfffffe51fffff77e, %g1, %g7
	.word 0xa3800007  ! 57: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_80_35:
	setx 0xb69d4f920fda7655, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97682660  ! 59: SDIVX_I	sdivx	%r0, 0x0660, %r11
splash_cmpr_80_37:
	setx 0x1f77241abfff14d6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 60: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_38) + 24, 16, 16)) -> intp(7,0,17)
intvec_80_38:
	.word 0x39400001  ! 61: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97a049cd  ! 62: FDIVd	fdivd	%f32, %f44, %f42
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_39:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e004  ! 63: CASA_R	casa	[%r31] %asi, %r4, %r9
	.word 0xd2800ba0  ! 64: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9968f112  ! 65: SDIVX_I	sdivx	%r3, 0xfffff112, %r12
	fbn,a,pn	%fcc0,  skip_80_41
	brlez,a,pt	%r17, skip_80_41
.align 512
skip_80_41:
	.word 0x24c8c001  ! 66: BRLEZ	brlez,a,pt	%r3,<label_0x8c001>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_42:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e007  ! 67: CASA_R	casa	[%r31] %asi, %r7, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01965  ! 68: FqTOd	dis not found

intveclr_80_44:
	setx 0xc80ffd069a0f9be9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_80_45:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x97b2c310  ! 70: ALIGNADDRESS	alignaddr	%r11, %r16, %r11
	.word 0xe937c000  ! 71: STQF_R	-	%f20, [%r0, %r31]
	rd %pc, %r19
	add %r19, (ivw_80_46-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_46:
	.word 0x9194c00b  ! 72: WRPR_PIL_R	wrpr	%r19, %r11, %pil
change_to_randtl_80_47:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_47:
	.word 0x8f902002  ! 73: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_80_48:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 74: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0x95a00166  ! 75: FABSq	dis not found

splash_tba_80_49:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 76: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	ble,a	 skip_80_50
	brlez,a,pt	%r3, skip_80_50
.align 128
skip_80_50:
	.word 0x39400001  ! 77: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd2c7e010  ! 78: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r9
	setx 0x3bcc6cd444995c3e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_51:
	.word 0x39400001  ! 79: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_80_52:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_52-donret_80_52), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005a8c4b | (4 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x98d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_52:
	.word 0xd2ffe0e6  ! 80: SWAPA_I	swapa	%r9, [%r31 + 0x00e6] %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96c34dd  ! 81: SDIVX_I	sdivx	%r16, 0xfffff4dd, %r20
mondo_80_54:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d914003  ! 82: WRPR_WSTATE_R	wrpr	%r5, %r3, %wstate
	bl,a	 skip_80_55
	fbuge,a,pn	%fcc0,  skip_80_55
.align 1024
skip_80_55:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_80_56:
	setx 0xb1200bc5cca384d2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 84: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3454000  ! 85: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
intveclr_80_57:
	setx 0x53e953c76d6facd9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3a209c0  ! 87: FDIVd	fdivd	%f8, %f0, %f48
debug_80_58:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 88: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x8466128e8c1210a4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_59:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_80_60:
	set user_data_start, %r31
	.word 0x858360c8  ! 90: WRCCR_I	wr	%r13, 0x00c8, %ccr
tagged_80_61:
	taddcctv %r20, 0x162a, %r17
	.word 0xd807e070  ! 91: LDUW_I	lduw	[%r31 + 0x0070], %r12
	.word 0xd927e0c6  ! 92: STF_I	st	%f12, [0x00c6, %r31]
splash_cmpr_80_62:
	setx 0x61eab3a5047b58db, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 93: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_80_63:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 94: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
DS_80_64:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd3352842  ! 1: STQF_I	-	%f9, [0x0842, %r20]
	normalw
	.word 0xa3458000  ! 95: RD_SOFTINT_REG	rd	%softint, %r17
	setx 0xc66dd52cd214f5cd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_65:
	.word 0x39400001  ! 96: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe0cf  ! 97: LDSTUB_I	ldstub	%r17, [%r31 + 0x00cf]
	.word 0x95520000  ! 98: RDPR_PIL	rdpr	%pil, %r10
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_66
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_66:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 99: RDPC	rd	%pc, %r19
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 100: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b4  ! 101: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x9b480000  ! 102: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0xe26fe0ef  ! 103: LDSTUB_I	ldstub	%r17, [%r31 + 0x00ef]
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_67
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_67:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 104: RDPC	rd	%pc, %r20
	.word 0x91d02034  ! 105: Tcc_I	ta	icc_or_xcc, %r0 + 52
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_68
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_68:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 106: RDPC	rd	%pc, %r13
mondo_80_69:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d914008  ! 107: WRPR_WSTATE_R	wrpr	%r5, %r8, %wstate
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
	.word 0x91414000  ! 108: RDPC	rd	%pc, %r8
	.word 0x9f803f70  ! 109: SIR	sir	0x1f70
splash_cmpr_80_71:
	setx 0x788dcb68785b58e5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 110: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 111: LDX_R	ldx	[%r31 + %r0], %r19
intveclr_80_72:
	setx 0x601d2bc41d3236d1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_73
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_73:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 113: CASA_R	casa	[%r31] %asi, %r3, %r19
	.word 0x2e800001  ! 114: BVS	bvs,a	<label_0x1>
pmu_80_74:
	nop
	setx 0xfffff690fffff8b2, %g1, %g7
	.word 0xa3800007  ! 115: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_80_75:
    set user_data_start, %o7
	.word 0x93902002  ! 116: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196b  ! 117: FqTOd	dis not found

change_to_randtl_80_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_77:
	.word 0x8f902002  ! 118: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xda6fe0db  ! 119: LDSTUB_I	ldstub	%r13, [%r31 + 0x00db]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6a75a9  ! 120: SDIVX_I	sdivx	%r9, 0xfffff5a9, %r13
intveclr_80_79:
	setx 0xfe188d90cb44e9b8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 121: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_80:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 122: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9369a6f4  ! 123: SDIVX_I	sdivx	%r6, 0x06f4, %r9
splash_tba_80_82:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 124: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x34800001  ! 125: BG	bg,a	<label_0x1>
	.word 0x91a00171  ! 126: FABSq	dis not found

DS_80_83:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa3a00549  ! 1: FSQRTd	fsqrt	
	.word 0xa5a34827  ! 127: FADDs	fadds	%f13, %f7, %f18
	rd %pc, %r19
	add %r19, (ivw_80_84-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_84:
	.word 0x91908000  ! 128: WRPR_PIL_R	wrpr	%r2, %r0, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01961  ! 129: FqTOd	dis not found

DS_80_86:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f22, %f4, %f18
	.word 0xa1b34311  ! 130: ALIGNADDRESS	alignaddr	%r13, %r17, %r16
DS_80_87:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe131a388  ! 1: STQF_I	-	%f16, [0x0388, %r6]
	normalw
	.word 0x93458000  ! 131: RD_SOFTINT_REG	rd	%softint, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_88) + 24, 16, 16)) -> intp(4,0,20)
intvec_80_88:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_80_89:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 133: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 134: LDX_R	ldx	[%r31 + %r0], %r9
donret_80_90:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_90-donret_80_90), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002f46d1 | (0x8a << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xd45, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_90:
	.word 0xd2ffe05e  ! 135: SWAPA_I	swapa	%r9, [%r31 + 0x005e] %asi
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_91
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_91:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 136: CASA_R	casa	[%r31] %asi, %r17, %r9
debug_80_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 137: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 138: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd21fc000  ! 139: LDD_R	ldd	[%r31 + %r0], %r9
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_93
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_93
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_93:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 140: RDPC	rd	%pc, %r11
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_94
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_94:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 141: CASA_R	casa	[%r31] %asi, %r17, %r13
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_95
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_95:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 142: RDPC	rd	%pc, %r18
	.word 0x97480000  ! 143: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0x97a409d0  ! 144: FDIVd	fdivd	%f16, %f16, %f42
mondo_80_96:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d94c00b  ! 145: WRPR_WSTATE_R	wrpr	%r19, %r11, %wstate
pmu_80_97:
	nop
	setx 0xfffff1c5fffff5e8, %g1, %g7
	.word 0xa3800007  ! 146: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_80_98:
	setx 0xc308e49e0bbb6ef3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 147: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5a1c9d4  ! 148: FDIVd	fdivd	%f38, %f20, %f18
intveclr_80_99:
	setx 0x315841832351a670, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 149: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_80_100:
	setx 0x57bcb56730a574bf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_101
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_101:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 151: RDPC	rd	%pc, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_102) + 56, 16, 16)) -> intp(0,0,5)
intvec_80_102:
	.word 0x39400001  ! 152: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x3e800001  ! 153: BVC	bvc,a	<label_0x1>
	.word 0x3c700001  ! 154: BPPOS	<illegal instruction>
	bn,a	 skip_80_103
	brlez,a,pt	%r0, skip_80_103
.align 512
skip_80_103:
	.word 0x24ca8001  ! 155: BRLEZ	brlez,a,pt	%r10,<label_0xa8001>
	.word 0xe26fe0d7  ! 156: LDSTUB_I	ldstub	%r17, [%r31 + 0x00d7]
	.word 0x91d02035  ! 157: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe23fe038  ! 158: STD_I	std	%r17, [%r31 + 0x0038]
	.word 0xa9808013  ! 159: WR_SET_SOFTINT_R	wr	%r2, %r19, %set_softint
	.word 0x97a00165  ! 160: FABSq	dis not found

    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_104:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00a  ! 161: CASA_R	casa	[%r31] %asi, %r10, %r12
	rd %pc, %r19
	add %r19, (ivw_80_105-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_105:
	.word 0x9191400a  ! 162: WRPR_PIL_R	wrpr	%r5, %r10, %pil
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_106:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 163: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0xd8cfe020  ! 164: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956934f5  ! 165: SDIVX_I	sdivx	%r4, 0xfffff4f5, %r10
	.word 0x9b480000  ! 166: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
pmu_80_108:
	nop
	setx 0xfffff597fffff501, %g1, %g7
	.word 0xa3800007  ! 167: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	fbu,a,pn	%fcc0,  skip_80_109
	bn  	 skip_80_109
.align 128
skip_80_109:
	.word 0x24cac001  ! 168: BRLEZ	brlez,a,pt	%r11,<label_0xac001>
intveclr_80_110:
	setx 0x10551e69054b96a8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 169: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_80_111:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 170: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_80_112:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 171: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_80_113:
	setx 0xb5f6f7d19af9ca56, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_80_114:
	set 0x55a8012e, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 173: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd84fe02b  ! 174: LDSB_I	ldsb	[%r31 + 0x002b], %r12
debug_80_115:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 175: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_decr_80_116:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa7834014  ! 176: WR_GRAPHICS_STATUS_REG_R	wr	%r13, %r20, %-
mondo_80_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d92c004  ! 177: WRPR_WSTATE_R	wrpr	%r11, %r4, %wstate
	.word 0xd89fe048  ! 178: LDDA_I	ldda	[%r31, + 0x0048] %asi, %r12
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 179: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_80_118:
	setx 0xb8c326c9ecbd479b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8800ba0  ! 181: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r12
debug_80_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 182: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_120) + 48, 16, 16)) -> intp(1,0,9)
intvec_80_120:
	.word 0x39400001  ! 183: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_80_121-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_121:
	.word 0x91944005  ! 184: WRPR_PIL_R	wrpr	%r17, %r5, %pil
splash_hpstate_80_122:
	.word 0x81982284  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0284, %hpstate
debug_80_123:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 186: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
splash_cmpr_80_124:
	setx 0x1908b625baa30eb5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 187: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd86fe06c  ! 188: LDSTUB_I	ldstub	%r12, [%r31 + 0x006c]
splash_cmpr_80_125:
	setx 0x482c13818b655703, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 189: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_126
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_126:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 190: RDPC	rd	%pc, %r9
	.word 0xd727e0a4  ! 191: STF_I	st	%f11, [0x00a4, %r31]
splash_cmpr_80_127:
	setx 0xad327b856f245704, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_80_128:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d910005  ! 193: WRPR_WSTATE_R	wrpr	%r4, %r5, %wstate
DS_80_129:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 194: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 195: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_80_130:
	setx 0xd6a41d57108d35ed, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2c800001  ! 197: BNEG	bneg,a	<label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e012  ! 198: CASA_R	casa	[%r31] %asi, %r18, %r11
intveclr_80_132:
	setx 0x3a900b8120cd3848, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_80_133:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 200: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_80_134:
	.word 0x81982e0e  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0e, %hpstate
change_to_randtl_80_135:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_135:
	.word 0x8f902000  ! 202: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_136)+16, 16, 16)) -> intp(80,1,3)
xir_80_136:
	.word 0xa98074a5  ! 203: WR_SET_SOFTINT_I	wr	%r1, 0x14a5, %set_softint
	rd %pc, %r19
	add %r19, (ivw_80_137-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_137:
	.word 0x9190c00c  ! 204: WRPR_PIL_R	wrpr	%r3, %r12, %pil
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a0196a  ! 205: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936afc41  ! 206: SDIVX_I	sdivx	%r11, 0xfffffc41, %r9
splash_cmpr_80_140:
	setx 0x61b53c5b0ebb6b8d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_80_141:
	setx 0x75bfdb69755f9584, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93682f29  ! 209: SDIVX_I	sdivx	%r0, 0x0f29, %r9
donret_80_143:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_143-donret_80_143-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009183b1 | (0x88 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xf8f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_143:
	.word 0xe4ffe08d  ! 210: SWAPA_I	swapa	%r18, [%r31 + 0x008d] %asi
debug_80_144:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 211: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36a30a2  ! 212: SDIVX_I	sdivx	%r8, 0xfffff0a2, %r17
DS_80_146:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 213: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 214: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 215: BLEU	bleu,a	<label_0x1>
	.word 0xd337c000  ! 216: STQF_R	-	%f9, [%r0, %r31]
	bpos  	 skip_80_147
	fbu,a,pn	%fcc0,  skip_80_147
.align 2048
skip_80_147:
	.word 0x39400001  ! 217: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe06fe01a  ! 218: LDSTUB_I	ldstub	%r16, [%r31 + 0x001a]
intveclr_80_148:
	setx 0x31fcfe40851c76fd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 220: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_80_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d934006  ! 221: WRPR_WSTATE_R	wrpr	%r13, %r6, %wstate
intveclr_80_150:
	setx 0x64bc99d1295066c9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 222: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe06fe044  ! 223: LDSTUB_I	ldstub	%r16, [%r31 + 0x0044]
	setx 0x0b48912192eec774, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_151:
	.word 0x39400001  ! 224: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_80_152:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 225: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02032  ! 226: Tcc_I	ta	icc_or_xcc, %r0 + 50
intveclr_80_153:
	setx 0x17f84e4996875d83, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 227: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_80_154:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_154-donret_80_154), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008ef1c6 | (28 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x7df, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_154:
	.word 0xe0ffe0ce  ! 228: SWAPA_I	swapa	%r16, [%r31 + 0x00ce] %asi
pmu_80_155:
	nop
	setx 0xfffff021fffff096, %g1, %g7
	.word 0xa3800007  ! 229: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_80_156:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 230: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
debug_80_157:
	nop
	rdhpr %htba, %r19
	mov 0x120,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	.word 0xe6f00b12  ! 231: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_80_158:
	setx 0x13f41dc5fe92dbe1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 232: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_80_159:
	setx 0xd9e5da8a230b9d2e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 233: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93d02035  ! 234: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xe0d7e010  ! 235: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r16
mondo_80_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d940004  ! 236: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
memptr_80_161:
	set 0x60140000, %r31
	.word 0x85842b03  ! 237: WRCCR_I	wr	%r16, 0x0b03, %ccr
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_162:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 238: CASA_R	casa	[%r31] %asi, %r7, %r16
splash_cmpr_80_163:
	setx 0xf1d5fbf821f43767, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 239: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936d20b9  ! 240: SDIVX_I	sdivx	%r20, 0x00b9, %r9
memptr_80_165:
	set user_data_start, %r31
	.word 0x858528c0  ! 241: WRCCR_I	wr	%r20, 0x08c0, %ccr
	.word 0x8d902247  ! 242: WRPR_PSTATE_I	wrpr	%r0, 0x0247, %pstate
splash_lsu_80_166:
	set 0x55a408f2, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 243: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x7a020eb1fb436151, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_167:
	.word 0x39400001  ! 244: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a00171  ! 245: FABSq	dis not found

	.word 0xe627e021  ! 246: STW_I	stw	%r19, [%r31 + 0x0021]
	rd %pc, %r19
	add %r19, (ivw_80_168-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_168:
	.word 0x91934010  ! 247: WRPR_PIL_R	wrpr	%r13, %r16, %pil
	.word 0x8d9038ec  ! 248: WRPR_PSTATE_I	wrpr	%r0, 0x18ec, %pstate
donret_80_169:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_169-donret_80_169-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00808cb5 | (0x83 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x8d6, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_169:
	.word 0xe6ffe082  ! 249: SWAPA_I	swapa	%r19, [%r31 + 0x0082] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_170) + 40, 16, 16)) -> intp(4,0,9)
intvec_80_170:
	.word 0x39400001  ! 250: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_80_171:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_171-donret_80_171-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0047e445 | (0x8b << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xc94, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_171:
	.word 0xe6ffe040  ! 251: SWAPA_I	swapa	%r19, [%r31 + 0x0040] %asi
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_172
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_172:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e005  ! 252: CASA_R	casa	[%r31] %asi, %r5, %r19
splash_cmpr_80_173:
	setx 0x1bb8e34b078f534b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe62fe0d2  ! 254: STB_I	stb	%r19, [%r31 + 0x00d2]
    set 0x34ad, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b107e0  ! 255: PDISTN	fmean16	%d4, %d0, %d8
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_174
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_174:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 256: CASA_R	casa	[%r31] %asi, %r11, %r11
	rd %pc, %r19
	add %r19, (ivw_80_175-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_175:
	.word 0x9192c007  ! 257: WRPR_PIL_R	wrpr	%r11, %r7, %pil
splash_hpstate_80_176:
	.word 0x8198264c  ! 258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x064c, %hpstate
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
	.word 0x93414000  ! 259: RDPC	rd	%pc, %r9
intveclr_80_178:
	setx 0xb4b48233c55335ed, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 260: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_179:
	setx 0xcd65e91a4757b93a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 261: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd2d7e010  ! 262: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r9
memptr_80_180:
	set user_data_start, %r31
	.word 0x8584f38f  ! 263: WRCCR_I	wr	%r19, 0x138f, %ccr
pmu_80_181:
	nop
	setx 0xfffff592fffff7b0, %g1, %g7
	.word 0xa3800007  ! 264: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd337c000  ! 265: STQF_R	-	%f9, [%r0, %r31]
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
	.word 0x91414000  ! 266: RDPC	rd	%pc, %r8
DS_80_183:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa1a049c4  ! 1: FDIVd	fdivd	%f32, %f4, %f16
	.word 0xa9a00549  ! 1: FSQRTd	fsqrt	
	.word 0x9ba20833  ! 267: FADDs	fadds	%f8, %f19, %f13
donret_80_184:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_184-donret_80_184), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0052693e | (0x80 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xa8d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_184:
	.word 0xe8ffe036  ! 268: SWAPA_I	swapa	%r20, [%r31 + 0x0036] %asi
	.word 0xa3464000  ! 269: RD_STICK_CMPR_REG	rd	%-, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196d  ! 270: FqTOd	dis not found

debug_80_186:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 271: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_187
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_187
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_187:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 272: RDPC	rd	%pc, %r16
debug_80_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 273: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_189:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 274: RDPC	rd	%pc, %r16
	.word 0xd897e020  ! 275: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r12
	.word 0x34800001  ! 276: BG	bg,a	<label_0x1>
	.word 0x91520000  ! 277: RDPR_PIL	rdpr	%pil, %r8
	.word 0xda6fe00c  ! 278: LDSTUB_I	ldstub	%r13, [%r31 + 0x000c]
splash_htba_80_190:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 279: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x32700001  ! 280: BPNE	<illegal instruction>
tagged_80_191:
	taddcctv %r13, 0x18cd, %r21
	.word 0xda07e04e  ! 281: LDUW_I	lduw	[%r31 + 0x004e], %r13
intveclr_80_192:
	setx 0xd9dd8bbc766cc0c0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 282: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x28800001  ! 283: BLEU	bleu,a	<label_0x1>
	.word 0x97464000  ! 284: RD_STICK_CMPR_REG	rd	%-, %r11
intveclr_80_193:
	setx 0xdb0a44a48a05f7ab, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 285: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd117c000  ! 286: LDQF_R	-	[%r31, %r0], %f8
	.word 0xa945c000  ! 287: RD_TICK_CMPR_REG	rd	%-, %r20
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_194
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_194:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 288: CASA_R	casa	[%r31] %asi, %r0, %r10
debug_80_195:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 289: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
intveclr_80_196:
	setx 0x677cf1c9374cb475, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_197:
	setx 0xffba2996e978eba9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 291: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d020b2  ! 292: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x99902002  ! 293: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
mondo_80_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d934013  ! 294: WRPR_WSTATE_R	wrpr	%r13, %r19, %wstate
splash_cmpr_80_199:
	setx 0x40e60ae26c330798, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd46fe05b  ! 296: LDSTUB_I	ldstub	%r10, [%r31 + 0x005b]
	.word 0x9f802e85  ! 297: SIR	sir	0x0e85
	.word 0xa7480000  ! 298: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_200) + 48, 16, 16)) -> intp(6,0,1)
intvec_80_200:
	.word 0x39400001  ! 299: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_80_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d950012  ! 300: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	.word 0xd727c000  ! 301: STF_R	st	%f11, [%r0, %r31]
mondo_80_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d94800c  ! 302: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
debug_80_203:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 303: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_80_204:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d94c012  ! 304: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
intveclr_80_205:
	setx 0x9f691514aeeccc36, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 305: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01966  ! 306: FqTOd	dis not found

pmu_80_207:
	nop
	setx 0xfffff74ffffffec8, %g1, %g7
	.word 0xa3800007  ! 307: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_80_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d914006  ! 308: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
	.word 0x91913ec6  ! 309: WRPR_PIL_I	wrpr	%r4, 0x1ec6, %pil
	.word 0x8d903623  ! 310: WRPR_PSTATE_I	wrpr	%r0, 0x1623, %pstate
splash_lsu_80_209:
	set 0x5521f2d5, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
	.word 0x97414000  ! 312: RDPC	rd	%pc, %r11
donret_80_211:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_211-donret_80_211-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f5c86e | (0x83 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xe46, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_211:
	.word 0xe2ffe012  ! 313: SWAPA_I	swapa	%r17, [%r31 + 0x0012] %asi
	.word 0x91d02032  ! 314: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe26fe08c  ! 315: LDSTUB_I	ldstub	%r17, [%r31 + 0x008c]
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_212
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_212:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 316: CASA_R	casa	[%r31] %asi, %r11, %r17
	setx 0x193010e56d5c47df, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_213:
	.word 0x39400001  ! 317: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_80_214:
	setx 0x8b10c68334286a5e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01968  ! 320: FqTOd	dis not found

memptr_80_216:
	set user_data_start, %r31
	.word 0x8584a2bf  ! 321: WRCCR_I	wr	%r18, 0x02bf, %ccr
memptr_80_217:
	set 0x60340000, %r31
	.word 0x8584b809  ! 322: WRCCR_I	wr	%r18, 0x1809, %ccr
donret_80_218:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_218-donret_80_218), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b6901b | (16 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xe0d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_218:
	.word 0xe4ffe06e  ! 323: SWAPA_I	swapa	%r18, [%r31 + 0x006e] %asi
	.word 0x95500000  ! 324: RDPR_TPC	rdpr	%tpc, %r10
	.word 0xda6fe030  ! 325: LDSTUB_I	ldstub	%r13, [%r31 + 0x0030]
splash_lsu_80_219:
	set 0x557a2cfd, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 326: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902005  ! 327: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
pmu_80_220:
	nop
	setx 0xfffffcf4fffffbe7, %g1, %g7
	.word 0xa3800007  ! 328: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa3a189c2  ! 329: FDIVd	fdivd	%f6, %f2, %f48
DS_80_221:
	.word 0x93a109c9  ! 1: FDIVd	fdivd	%f4, %f40, %f40
	.word 0xbfe7c000  ! 330: SAVE_R	save	%r31, %r0, %r31
	.word 0xd46fe0f1  ! 331: LDSTUB_I	ldstub	%r10, [%r31 + 0x00f1]
	rd %pc, %r19
	add %r19, (ivw_80_222-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_222:
	.word 0x91950001  ! 332: WRPR_PIL_R	wrpr	%r20, %r1, %pil
	.word 0xd43fc000  ! 333: STD_R	std	%r10, [%r31 + %r0]
change_to_randtl_80_223:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_223:
	.word 0x8f902000  ! 334: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	fbule,a,pn	%fcc0,  skip_80_224
	brnz,pt  	%r6, skip_80_224
.align 2048
skip_80_224:
	.word 0x39400001  ! 335: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_225
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_225
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_225:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 336: RDPC	rd	%pc, %r11
mondo_80_226:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d914011  ! 337: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
intveclr_80_227:
	setx 0x1746ef2182b5d7f0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 338: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_80_228:
	nop
	setx 0xfffffc86fffff2dd, %g1, %g7
	.word 0xa3800007  ! 339: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_229
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_229
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_229:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 340: RDPC	rd	%pc, %r13
	.word 0xab826db2  ! 341: WR_CLEAR_SOFTINT_I	wr	%r9, 0x0db2, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_230) + 56, 16, 16)) -> intp(7,0,25)
intvec_80_230:
	.word 0x39400001  ! 342: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8bfc020  ! 343: STDA_R	stda	%r20, [%r31 + %r0] 0x01
	setx 0x0b181d081ab049f0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_231:
	.word 0x39400001  ! 344: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_80_232-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_232:
	.word 0x91944003  ! 345: WRPR_PIL_R	wrpr	%r17, %r3, %pil
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 346: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cwp_80_233:
    set user_data_start, %o7
	.word 0x93902006  ! 347: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b687849  ! 348: SDIVX_I	sdivx	%r1, 0xfffff849, %r13
splash_cmpr_80_235:
	setx 0x678b7a3e36723fc7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 349: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_80_236:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 350: SAVE_R	save	%r31, %r0, %r31
	.word 0xd727e0c1  ! 351: STF_I	st	%f11, [0x00c1, %r31]
	.word 0x97a0016a  ! 352: FABSq	dis not found

	.word 0x91d02034  ! 353: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd6cfe030  ! 354: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
	.word 0x9f803bc9  ! 355: SIR	sir	0x1bc9
	.word 0xa5454000  ! 356: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
splash_cmpr_80_237:
	setx 0x31fb5a55a54c6824, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 357: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a00163  ! 358: FABSq	dis not found

    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_238
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_238:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e003  ! 359: CASA_R	casa	[%r31] %asi, %r3, %r12
	.word 0x9b454000  ! 360: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	.word 0x91450000  ! 361: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0x99902002  ! 362: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xa7a0016a  ! 363: FABSq	dis not found

debug_80_239:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 364: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d9026ba  ! 365: WRPR_PSTATE_I	wrpr	%r0, 0x06ba, %pstate
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_240:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 366: CASA_R	casa	[%r31] %asi, %r7, %r16
intveclr_80_241:
	setx 0x0464dc6717177bc7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 367: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196d  ! 368: FqTOd	dis not found

	setx 0x3df8f7dbce80658f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_243:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93454000  ! 370: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
splash_hpstate_80_244:
	.word 0x81982195  ! 371: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0195, %hpstate
	.word 0xe497e020  ! 372: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r18
	.word 0xe48008a0  ! 373: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
pmu_80_245:
	nop
	setx 0xfffffb5cfffffe92, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_80_246-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_246:
	.word 0x91924006  ! 375: WRPR_PIL_R	wrpr	%r9, %r6, %pil
splash_cmpr_80_247:
	setx 0xd38b0b078447570f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 376: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_80_248:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d904011  ! 377: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
	.word 0xe49fe04c  ! 378: LDDA_I	ldda	[%r31, + 0x004c] %asi, %r18
intveclr_80_249:
	setx 0x5fb7d653b064c51d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4c7e020  ! 380: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r18
memptr_80_250:
	set 0x60540000, %r31
	.word 0x85852248  ! 381: WRCCR_I	wr	%r20, 0x0248, %ccr
intveclr_80_251:
	setx 0x08ce72e3ba45c969, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 382: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_80_252:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 383: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 384: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b2  ! 385: Tcc_I	ta	icc_or_xcc, %r0 + 178
intveclr_80_253:
	setx 0x112342b0c1f4eb43, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_80_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 387: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_80_255:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d90c010  ! 388: WRPR_WSTATE_R	wrpr	%r3, %r16, %wstate
	.word 0x9945c000  ! 389: RD_TICK_CMPR_REG	rd	%-, %r12
mondo_80_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d93400c  ! 390: WRPR_WSTATE_R	wrpr	%r13, %r12, %wstate
	setx 0xa0a4935ff82d1e1e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_257:
	.word 0x39400001  ! 391: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01965  ! 392: FqTOd	dis not found

mondo_80_259:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d940011  ! 393: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
intveclr_80_260:
	setx 0x8eb53f31bd12a8b8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_80_261:
	nop
	setx 0xfffff270fffff3aa, %g1, %g7
	.word 0xa3800007  ! 395: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_80_262:
	set 0x60340000, %r31
	.word 0x8584a61c  ! 396: WRCCR_I	wr	%r18, 0x061c, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_263)+0, 16, 16)) -> intp(80,1,3)
xir_80_263:
	.word 0xa9847c52  ! 397: WR_SET_SOFTINT_I	wr	%r17, 0x1c52, %set_softint
	.word 0xa3540000  ! 398: RDPR_GL	<illegal instruction>
	brgez,a,pt	%r19, skip_80_264
	fbuge skip_80_264
.align 32
skip_80_264:
	.word 0x24cc0001  ! 399: BRLEZ	brlez,a,pt	%r16,<label_0xc0001>
	.word 0xd0dfe010  ! 400: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
DS_40_1:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x95a0c9d1  ! 1: FDIVd	fdivd	%f34, %f48, %f10
	.word 0xa9a10833  ! 1: FADDs	fadds	%f4, %f19, %f20
	.word 0x91d020b4  ! 2: Tcc_I	ta	icc_or_xcc, %r0 + 180
pmu_40_2:
	nop
	setx 0xfffffd00fffffb05, %g1, %g7
	.word 0xa3800007  ! 3: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 4: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_3:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e009  ! 5: CASA_R	casa	[%r31] %asi, %r9, %r9
DS_40_4:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 6: SAVE_R	save	%r31, %r0, %r31
intveclr_40_5:
	setx 0x603b1f385baf218e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_6
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_6
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_6:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 8: RDPC	rd	%pc, %r9
	rd %pc, %r19
	add %r19, (ivw_40_7-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_7:
	.word 0x91910004  ! 9: WRPR_PIL_R	wrpr	%r4, %r4, %pil
change_to_randtl_40_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_8:
	.word 0x8f902002  ! 10: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_40_9:
	setx 0x08c6abaae78d322c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 11: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 12: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_htba_40_10:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 13: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_40_11:
	.word 0x99a489cc  ! 1: FDIVd	fdivd	%f18, %f12, %f12
	pdist %f24, %f14, %f26
	.word 0x91b34313  ! 14: ALIGNADDRESS	alignaddr	%r13, %r19, %r8
splash_hpstate_40_12:
	.word 0x81982654  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0654, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01964  ! 16: FqTOd	dis not found

    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_14
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_14:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e012  ! 17: CASA_R	casa	[%r31] %asi, %r18, %r9
	.word 0xd277e016  ! 18: STX_I	stx	%r9, [%r31 + 0x0016]
	.word 0x8d903af2  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x1af2, %pstate
DS_40_15:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x95b34314  ! 20: ALIGNADDRESS	alignaddr	%r13, %r20, %r10
	.word 0xe807c000  ! 21: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0xa1a309c0  ! 22: FDIVd	fdivd	%f12, %f0, %f16
	.word 0xd4c7e000  ! 23: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r10
debug_40_16:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 24: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_17:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e006  ! 25: CASA_R	casa	[%r31] %asi, %r6, %r10
memptr_40_18:
	set user_data_start, %r31
	.word 0x8584b864  ! 26: WRCCR_I	wr	%r18, 0x1864, %ccr
mondo_40_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d928010  ! 27: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
	.word 0x3a700001  ! 28: BPCC	<illegal instruction>
	.word 0xd537c000  ! 29: STQF_R	-	%f10, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_20
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_20:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 30: RDPC	rd	%pc, %r11
	.word 0xa3a00174  ! 31: FABSq	dis not found

splash_cmpr_40_21:
	setx 0x3464a63e8f79535f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 32: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd697e000  ! 33: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
	.word 0x93d02034  ! 34: Tcc_I	tne	icc_or_xcc, %r0 + 52
splash_hpstate_40_22:
	.word 0x81982316  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0316, %hpstate
	.word 0xd66fe0b3  ! 36: LDSTUB_I	ldstub	%r11, [%r31 + 0x00b3]
splash_cmpr_40_23:
	setx 0x5ca13f724c06e6bb, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 37: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_40_24:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 38: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0xad84fedd  ! 39: WR_SOFTINT_REG_I	wr	%r19, 0x1edd, %softint
	.word 0xd66fe068  ! 40: LDSTUB_I	ldstub	%r11, [%r31 + 0x0068]
intveclr_40_25:
	setx 0x038d71521651b7b1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 41: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d90358e  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x158e, %pstate
	.word 0xd737c000  ! 43: STQF_R	-	%f11, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_26
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_26:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 44: RDPC	rd	%pc, %r8
mondo_40_27:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d92c006  ! 45: WRPR_WSTATE_R	wrpr	%r11, %r6, %wstate
	.word 0x26800001  ! 46: BL	bl,a	<label_0x1>
	.word 0xd48008a0  ! 47: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_40_28:
	set 0x553f0124, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 48: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_40_29:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 49: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa9a00167  ! 50: FABSq	dis not found

	.word 0xe68008a0  ! 51: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
splash_tba_40_30:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 52: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d903eae  ! 53: WRPR_PSTATE_I	wrpr	%r0, 0x1eae, %pstate
DS_40_31:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 54: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_32) + 0, 16, 16)) -> intp(2,0,0)
intvec_40_32:
	.word 0x39400001  ! 55: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x28fc8c757a6e7d1f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_33:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_40_34:
	nop
	setx 0xfffff5d1fffffc97, %g1, %g7
	.word 0xa3800007  ! 57: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_40_35:
	setx 0x5b8f291078702485, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76cb5aa  ! 59: SDIVX_I	sdivx	%r18, 0xfffff5aa, %r19
splash_cmpr_40_37:
	setx 0xbaed0877a11b446c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 60: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_38) + 0, 16, 16)) -> intp(0,0,22)
intvec_40_38:
	.word 0x39400001  ! 61: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a4c9d4  ! 62: FDIVd	fdivd	%f50, %f20, %f40
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_39:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e004  ! 63: CASA_R	casa	[%r31] %asi, %r4, %r9
	.word 0xd2800b80  ! 64: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b693bbd  ! 65: SDIVX_I	sdivx	%r4, 0xfffffbbd, %r13
	.word 0x39400001  ! 66: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_42:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e007  ! 67: CASA_R	casa	[%r31] %asi, %r7, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01970  ! 68: FqTOd	dis not found

intveclr_40_44:
	setx 0xd2ea1d3d16a24b5f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_40_45:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x95b44303  ! 70: ALIGNADDRESS	alignaddr	%r17, %r3, %r10
	.word 0xe937c000  ! 71: STQF_R	-	%f20, [%r0, %r31]
	rd %pc, %r19
	add %r19, (ivw_40_46-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_46:
	.word 0x9194800b  ! 72: WRPR_PIL_R	wrpr	%r18, %r11, %pil
change_to_randtl_40_47:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_47:
	.word 0x8f902000  ! 73: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_40_48:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 74: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0x99a00173  ! 75: FABSq	dis not found

splash_tba_40_49:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 76: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x39400001  ! 77: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd2c7e000  ! 78: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r9
	setx 0x369c64b96deb603b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_51:
	.word 0x39400001  ! 79: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_40_52:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_52-donret_40_52), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00020a49 | (4 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x79d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_52:
	.word 0xd2ffe0a2  ! 80: SWAPA_I	swapa	%r9, [%r31 + 0x00a2] %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76b2340  ! 81: SDIVX_I	sdivx	%r12, 0x0340, %r19
mondo_40_54:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d90800c  ! 82: WRPR_WSTATE_R	wrpr	%r2, %r12, %wstate
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_40_56:
	setx 0xfa0cd56ade379208, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 84: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95454000  ! 85: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
intveclr_40_57:
	setx 0x94ddea51004727ff, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9ba009c0  ! 87: FDIVd	fdivd	%f0, %f0, %f44
debug_40_58:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 88: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x726da608c6b38129, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_59:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_40_60:
	set user_data_start, %r31
	.word 0x85832eaf  ! 90: WRCCR_I	wr	%r12, 0x0eaf, %ccr
tagged_40_61:
	taddcctv %r16, 0x14cb, %r24
	.word 0xd807e038  ! 91: LDUW_I	lduw	[%r31 + 0x0038], %r12
	.word 0xd927e095  ! 92: STF_I	st	%f12, [0x0095, %r31]
splash_cmpr_40_62:
	setx 0xbddd438d12e15e20, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 93: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_40_63:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 94: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
DS_40_64:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd535379d  ! 1: STQF_I	-	%f10, [0x179d, %r20]
	normalw
	.word 0x97458000  ! 95: RD_SOFTINT_REG	rd	%softint, %r11
	setx 0xca6b239345c3f9a8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_65:
	.word 0x39400001  ! 96: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe089  ! 97: LDSTUB_I	ldstub	%r17, [%r31 + 0x0089]
	.word 0xa1520000  ! 98: RDPR_PIL	rdpr	%pil, %r16
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_66
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_66:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 99: RDPC	rd	%pc, %r13
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 100: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02032  ! 101: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xa1480000  ! 102: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0xe26fe0ef  ! 103: LDSTUB_I	ldstub	%r17, [%r31 + 0x00ef]
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_67
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_67:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 104: RDPC	rd	%pc, %r19
	.word 0x83d02033  ! 105: Tcc_I	te	icc_or_xcc, %r0 + 51
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_68
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_68:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 106: RDPC	rd	%pc, %r9
mondo_40_69:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d908000  ! 107: WRPR_WSTATE_R	wrpr	%r2, %r0, %wstate
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
	.word 0x97414000  ! 108: RDPC	rd	%pc, %r11
	.word 0x9f8034ad  ! 109: SIR	sir	0x14ad
splash_cmpr_40_71:
	setx 0x31e8a270700b2f47, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 110: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 111: LDX_R	ldx	[%r31 + %r0], %r19
intveclr_40_72:
	setx 0xca5888adecd3c968, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_73
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_73:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 113: CASA_R	casa	[%r31] %asi, %r3, %r19
	.word 0x2e800001  ! 114: BVS	bvs,a	<label_0x1>
pmu_40_74:
	nop
	setx 0xfffff043fffffa3f, %g1, %g7
	.word 0xa3800007  ! 115: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_40_75:
    set user_data_start, %o7
	.word 0x93902000  ! 116: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01973  ! 117: FqTOd	dis not found

change_to_randtl_40_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_77:
	.word 0x8f902001  ! 118: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xda6fe0ab  ! 119: LDSTUB_I	ldstub	%r13, [%r31 + 0x00ab]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956c7826  ! 120: SDIVX_I	sdivx	%r17, 0xfffff826, %r10
intveclr_40_79:
	setx 0x4a1bf8595c2293a1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 121: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_80:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 122: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa569f214  ! 123: SDIVX_I	sdivx	%r7, 0xfffff214, %r18
splash_tba_40_82:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 124: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x34800001  ! 125: BG	bg,a	<label_0x1>
	.word 0x93a00160  ! 126: FABSq	dis not found

DS_40_83:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9ba00543  ! 1: FSQRTd	fsqrt	
	.word 0x93a28834  ! 127: FADDs	fadds	%f10, %f20, %f9
	rd %pc, %r19
	add %r19, (ivw_40_84-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_84:
	.word 0x91930003  ! 128: WRPR_PIL_R	wrpr	%r12, %r3, %pil
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0196c  ! 129: FqTOd	dis not found

DS_40_86:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f28, %f16, %f12
	.word 0x97b48301  ! 130: ALIGNADDRESS	alignaddr	%r18, %r1, %r11
DS_40_87:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe330a7a7  ! 1: STQF_I	-	%f17, [0x07a7, %r2]
	normalw
	.word 0x95458000  ! 131: RD_SOFTINT_REG	rd	%softint, %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_88) + 48, 16, 16)) -> intp(0,0,23)
intvec_40_88:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_40_89:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 133: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 134: LDX_R	ldx	[%r31 + %r0], %r9
donret_40_90:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_90-donret_40_90), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00399dfa | (20 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x4dc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_90:
	.word 0xd2ffe054  ! 135: SWAPA_I	swapa	%r9, [%r31 + 0x0054] %asi
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_91
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_91:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 136: CASA_R	casa	[%r31] %asi, %r17, %r9
debug_40_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 137: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 138: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd21fc000  ! 139: LDD_R	ldd	[%r31 + %r0], %r9
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_93
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_93
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_93:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 140: RDPC	rd	%pc, %r10
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_94
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_94:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 141: CASA_R	casa	[%r31] %asi, %r17, %r13
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_95
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_95:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 142: RDPC	rd	%pc, %r17
	.word 0xa7480000  ! 143: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0x97a009ca  ! 144: FDIVd	fdivd	%f0, %f10, %f42
mondo_40_96:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d948005  ! 145: WRPR_WSTATE_R	wrpr	%r18, %r5, %wstate
pmu_40_97:
	nop
	setx 0xfffff0bbfffffd97, %g1, %g7
	.word 0xa3800007  ! 146: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_40_98:
	setx 0x73a1b1a8ca3b1c7a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 147: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99a449d1  ! 148: FDIVd	fdivd	%f48, %f48, %f12
intveclr_40_99:
	setx 0x35b6f6c17355a1eb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 149: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_40_100:
	setx 0xc7cf75b47fc73bf2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_101
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_101:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 151: RDPC	rd	%pc, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_102) + 56, 16, 16)) -> intp(4,0,26)
intvec_40_102:
	.word 0x39400001  ! 152: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x3e800001  ! 153: BVC	bvc,a	<label_0x1>
	.word 0x3c700001  ! 154: BPPOS	<illegal instruction>
	.word 0x99a509cd  ! 155: FDIVd	fdivd	%f20, %f44, %f12
	.word 0xe26fe0a0  ! 156: LDSTUB_I	ldstub	%r17, [%r31 + 0x00a0]
	.word 0x91d02034  ! 157: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe23fe099  ! 158: STD_I	std	%r17, [%r31 + 0x0099]
	.word 0xa984c008  ! 159: WR_SET_SOFTINT_R	wr	%r19, %r8, %set_softint
	.word 0xa1a0016d  ! 160: FABSq	dis not found

    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_104:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00a  ! 161: CASA_R	casa	[%r31] %asi, %r10, %r12
	rd %pc, %r19
	add %r19, (ivw_40_105-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_105:
	.word 0x91924000  ! 162: WRPR_PIL_R	wrpr	%r9, %r0, %pil
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_106:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 163: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0xd8cfe020  ! 164: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6d2572  ! 165: SDIVX_I	sdivx	%r20, 0x0572, %r13
	.word 0x97480000  ! 166: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
pmu_40_108:
	nop
	setx 0xfffff9a9fffff72f, %g1, %g7
	.word 0xa3800007  ! 167: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x24ca4001  ! 168: BRLEZ	brlez,a,pt	%r9,<label_0xa4001>
intveclr_40_110:
	setx 0x200f7bfe18facdf7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 169: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_40_111:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 170: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_40_112:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 171: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_40_113:
	setx 0x081fb6bcdbac752d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_40_114:
	set 0x553c6ad5, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 173: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd84fe041  ! 174: LDSB_I	ldsb	[%r31 + 0x0041], %r12
debug_40_115:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 175: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa781c004  ! 176: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r4, %-
mondo_40_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d94c003  ! 177: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
	.word 0xd89fe018  ! 178: LDDA_I	ldda	[%r31, + 0x0018] %asi, %r12
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 179: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_40_118:
	setx 0x26ecb617ee006b50, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 181: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
debug_40_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 182: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_120) + 48, 16, 16)) -> intp(6,0,10)
intvec_40_120:
	.word 0x39400001  ! 183: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_40_121-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_121:
	.word 0x91948013  ! 184: WRPR_PIL_R	wrpr	%r18, %r19, %pil
splash_hpstate_40_122:
	.word 0x81982fce  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fce, %hpstate
debug_40_123:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 186: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
splash_cmpr_40_124:
	setx 0x8a39a20246ea6114, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 187: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd86fe0f1  ! 188: LDSTUB_I	ldstub	%r12, [%r31 + 0x00f1]
splash_cmpr_40_125:
	setx 0xbe5e99e0bcfac1af, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 189: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_126
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_126:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 190: RDPC	rd	%pc, %r10
	.word 0xd727e03c  ! 191: STF_I	st	%f11, [0x003c, %r31]
splash_cmpr_40_127:
	setx 0xe9a43c4c9a6d7f9b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_40_128:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d944000  ! 193: WRPR_WSTATE_R	wrpr	%r17, %r0, %wstate
DS_40_129:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 194: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 195: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_40_130:
	setx 0x5fda6d12792e6492, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2c800001  ! 197: BNEG	bneg,a	<label_0x1>
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
	.word 0xd7e7e012  ! 198: CASA_R	casa	[%r31] %asi, %r18, %r11
intveclr_40_132:
	setx 0xe661a6f163e557d7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_40_133:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 200: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_40_134:
	.word 0x81982f9f  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9f, %hpstate
change_to_randtl_40_135:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_135:
	.word 0x8f902003  ! 202: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_136)+32, 16, 16)) -> intp(40,1,3)
xir_40_136:
	.word 0xa984ffa1  ! 203: WR_SET_SOFTINT_I	wr	%r19, 0x1fa1, %set_softint
	rd %pc, %r19
	add %r19, (ivw_40_137-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_137:
	.word 0x9191c002  ! 204: WRPR_PIL_R	wrpr	%r7, %r2, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01961  ! 205: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99693748  ! 206: SDIVX_I	sdivx	%r4, 0xfffff748, %r12
splash_cmpr_40_140:
	setx 0x51171a3c8a1ab7af, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_40_141:
	setx 0x644dc169fdb0487c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9968aa41  ! 209: SDIVX_I	sdivx	%r2, 0x0a41, %r12
donret_40_143:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_143-donret_40_143-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00987226 | (0x55 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xd56, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_143:
	.word 0xe4ffe087  ! 210: SWAPA_I	swapa	%r18, [%r31 + 0x0087] %asi
debug_40_144:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 211: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956a29c0  ! 212: SDIVX_I	sdivx	%r8, 0x09c0, %r10
DS_40_146:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 213: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 214: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 215: BLEU	bleu,a	<label_0x1>
	.word 0xd337c000  ! 216: STQF_R	-	%f9, [%r0, %r31]
	.word 0x24cc0001  ! 217: BRLEZ	brlez,a,pt	%r16,<label_0xc0001>
	.word 0xe06fe0d3  ! 218: LDSTUB_I	ldstub	%r16, [%r31 + 0x00d3]
intveclr_40_148:
	setx 0xfbd8214c818741e5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 220: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_40_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d91c005  ! 221: WRPR_WSTATE_R	wrpr	%r7, %r5, %wstate
intveclr_40_150:
	setx 0x659352a717857a4a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 222: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe06fe057  ! 223: LDSTUB_I	ldstub	%r16, [%r31 + 0x0057]
	setx 0x777ae3c13f38a569, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_151:
	.word 0x39400001  ! 224: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_40_152:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 225: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02033  ! 226: Tcc_I	ta	icc_or_xcc, %r0 + 51
intveclr_40_153:
	setx 0x263fd0f5afb177ff, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 227: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_40_154:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_154-donret_40_154), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00067e86 | (20 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x5de, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_154:
	.word 0xe0ffe0c5  ! 228: SWAPA_I	swapa	%r16, [%r31 + 0x00c5] %asi
pmu_40_155:
	nop
	setx 0xfffff096fffffe93, %g1, %g7
	.word 0xa3800007  ! 229: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_40_156:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 230: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
debug_40_157:
	nop
	.word 0xe6f00b12  ! 231: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_40_158:
	setx 0x8746effc0781cb69, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 232: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_40_159:
	setx 0xa66035b4cd3e4fc5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 233: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b4  ! 234: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0xe0d7e020  ! 235: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
mondo_40_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d910013  ! 236: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
memptr_40_161:
	set 0x60340000, %r31
	.word 0x8582e863  ! 237: WRCCR_I	wr	%r11, 0x0863, %ccr
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_162:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 238: CASA_R	casa	[%r31] %asi, %r7, %r16
splash_cmpr_40_163:
	setx 0xa78894a6e03c311b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 239: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916a2c65  ! 240: SDIVX_I	sdivx	%r8, 0x0c65, %r8
memptr_40_165:
	set user_data_start, %r31
	.word 0x858476f2  ! 241: WRCCR_I	wr	%r17, 0x16f2, %ccr
	.word 0x8d902279  ! 242: WRPR_PSTATE_I	wrpr	%r0, 0x0279, %pstate
splash_lsu_40_166:
	set 0x551814d9, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 243: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x597c6b559f290fe7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_167:
	.word 0x39400001  ! 244: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a00163  ! 245: FABSq	dis not found

	.word 0xe627e084  ! 246: STW_I	stw	%r19, [%r31 + 0x0084]
	rd %pc, %r19
	add %r19, (ivw_40_168-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_168:
	.word 0x91918014  ! 247: WRPR_PIL_R	wrpr	%r6, %r20, %pil
	.word 0x8d90326e  ! 248: WRPR_PSTATE_I	wrpr	%r0, 0x126e, %pstate
donret_40_169:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_169-donret_40_169-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00eb7c5e | (20 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x4dd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_169:
	.word 0xe6ffe01c  ! 249: SWAPA_I	swapa	%r19, [%r31 + 0x001c] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_170) + 48, 16, 16)) -> intp(5,0,9)
intvec_40_170:
	.word 0x39400001  ! 250: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_40_171:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_171-donret_40_171-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0031e4a0 | (0x82 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xf1e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_171:
	.word 0xe6ffe038  ! 251: SWAPA_I	swapa	%r19, [%r31 + 0x0038] %asi
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_172
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_172:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e005  ! 252: CASA_R	casa	[%r31] %asi, %r5, %r19
splash_cmpr_40_173:
	setx 0x2d109fe6abde11a7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe62fe09b  ! 254: STB_I	stb	%r19, [%r31 + 0x009b]
    set 0x1d4f, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b447e8  ! 255: PDISTN	fmean16	%d48, %d8, %d48
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_174
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_174:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 256: CASA_R	casa	[%r31] %asi, %r11, %r11
	rd %pc, %r19
	add %r19, (ivw_40_175-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_175:
	.word 0x91950012  ! 257: WRPR_PIL_R	wrpr	%r20, %r18, %pil
splash_hpstate_40_176:
	.word 0x81982d57  ! 258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d57, %hpstate
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
	.word 0x9b414000  ! 259: RDPC	rd	%pc, %r13
intveclr_40_178:
	setx 0x4801d276eaffd1fe, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 260: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_179:
	setx 0xa62ecabeb05a0064, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 261: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd2d7e010  ! 262: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r9
memptr_40_180:
	set user_data_start, %r31
	.word 0x8582ade0  ! 263: WRCCR_I	wr	%r10, 0x0de0, %ccr
pmu_40_181:
	nop
	setx 0xfffff2b3fffffc85, %g1, %g7
	.word 0xa3800007  ! 264: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd337c000  ! 265: STQF_R	-	%f9, [%r0, %r31]
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
	.word 0x91414000  ! 266: RDPC	rd	%pc, %r8
DS_40_183:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa1a509c1  ! 1: FDIVd	fdivd	%f20, %f32, %f16
	.word 0xa1a00548  ! 1: FSQRTd	fsqrt	
	.word 0x91a4c822  ! 267: FADDs	fadds	%f19, %f2, %f8
donret_40_184:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_184-donret_40_184), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00bfd20c | (16 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x3c4, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_184:
	.word 0xe8ffe01b  ! 268: SWAPA_I	swapa	%r20, [%r31 + 0x001b] %asi
	.word 0x99464000  ! 269: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01960  ! 270: FqTOd	dis not found

debug_40_186:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 271: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_187
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_187
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_187:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 272: RDPC	rd	%pc, %r19
debug_40_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 273: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_189:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 274: RDPC	rd	%pc, %r8
	.word 0xd897e030  ! 275: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
	.word 0x34800001  ! 276: BG	bg,a	<label_0x1>
	.word 0xa1520000  ! 277: RDPR_PIL	rdpr	%pil, %r16
	.word 0xda6fe080  ! 278: LDSTUB_I	ldstub	%r13, [%r31 + 0x0080]
splash_htba_40_190:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 279: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x32700001  ! 280: BPNE	<illegal instruction>
tagged_40_191:
	taddcctv %r3, 0x1482, %r11
	.word 0xda07e0df  ! 281: LDUW_I	lduw	[%r31 + 0x00df], %r13
intveclr_40_192:
	setx 0x70524d95ed935e79, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 282: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x28800001  ! 283: BLEU	bleu,a	<label_0x1>
	.word 0xa9464000  ! 284: RD_STICK_CMPR_REG	rd	%-, %r20
intveclr_40_193:
	setx 0x9157e5d30f622747, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 285: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd117c000  ! 286: LDQF_R	-	[%r31, %r0], %f8
	.word 0x9145c000  ! 287: RD_TICK_CMPR_REG	rd	%-, %r8
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_194
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_194:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 288: CASA_R	casa	[%r31] %asi, %r0, %r10
debug_40_195:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 289: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
intveclr_40_196:
	setx 0xc544a8cd81b40528, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_197:
	setx 0x4406639ed48b3edc, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 291: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d02034  ! 292: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x99902003  ! 293: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
mondo_40_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d94400d  ! 294: WRPR_WSTATE_R	wrpr	%r17, %r13, %wstate
splash_cmpr_40_199:
	setx 0xd90a71b9a22fb321, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd46fe06e  ! 296: LDSTUB_I	ldstub	%r10, [%r31 + 0x006e]
	.word 0x9f80265b  ! 297: SIR	sir	0x065b
	.word 0xa1480000  ! 298: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_200) + 32, 16, 16)) -> intp(5,0,24)
intvec_40_200:
	.word 0x39400001  ! 299: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_40_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d94c005  ! 300: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
	.word 0xd727c000  ! 301: STF_R	st	%f11, [%r0, %r31]
mondo_40_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d904012  ! 302: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
debug_40_203:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 303: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_40_204:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d90c00c  ! 304: WRPR_WSTATE_R	wrpr	%r3, %r12, %wstate
intveclr_40_205:
	setx 0xe54a78308eaaf405, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 305: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a0196c  ! 306: FqTOd	dis not found

pmu_40_207:
	nop
	setx 0xfffff9d3fffff9fe, %g1, %g7
	.word 0xa3800007  ! 307: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_40_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d94c00c  ! 308: WRPR_WSTATE_R	wrpr	%r19, %r12, %wstate
	.word 0x9192a76e  ! 309: WRPR_PIL_I	wrpr	%r10, 0x076e, %pil
	.word 0x8d902488  ! 310: WRPR_PSTATE_I	wrpr	%r0, 0x0488, %pstate
splash_lsu_40_209:
	set 0x551b8064, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
	.word 0x91414000  ! 312: RDPC	rd	%pc, %r8
donret_40_211:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_211-donret_40_211-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b8d5d3 | (0x4f << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_211:
	.word 0xe2ffe01d  ! 313: SWAPA_I	swapa	%r17, [%r31 + 0x001d] %asi
	.word 0x91d02034  ! 314: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe26fe05f  ! 315: LDSTUB_I	ldstub	%r17, [%r31 + 0x005f]
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_212
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_212:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 316: CASA_R	casa	[%r31] %asi, %r11, %r17
	setx 0x846bafbae580d185, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_213:
	.word 0x39400001  ! 317: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 318: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_40_214:
	setx 0x10a2a6896f568427, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01973  ! 320: FqTOd	dis not found

memptr_40_216:
	set user_data_start, %r31
	.word 0x8582b858  ! 321: WRCCR_I	wr	%r10, 0x1858, %ccr
memptr_40_217:
	set 0x60140000, %r31
	.word 0x8583225a  ! 322: WRCCR_I	wr	%r12, 0x025a, %ccr
donret_40_218:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_218-donret_40_218), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f3885f | (22 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x904, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_218:
	.word 0xe4ffe008  ! 323: SWAPA_I	swapa	%r18, [%r31 + 0x0008] %asi
	.word 0x95500000  ! 324: RDPR_TPC	rdpr	%tpc, %r10
	.word 0xda6fe072  ! 325: LDSTUB_I	ldstub	%r13, [%r31 + 0x0072]
splash_lsu_40_219:
	set 0x55f3c4ad, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 326: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902003  ! 327: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
pmu_40_220:
	nop
	setx 0xfffffc99fffff319, %g1, %g7
	.word 0xa3800007  ! 328: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99a0c9d4  ! 329: FDIVd	fdivd	%f34, %f20, %f12
DS_40_221:
	.word 0x95a489c6  ! 1: FDIVd	fdivd	%f18, %f6, %f10
	.word 0xbfe7c000  ! 330: SAVE_R	save	%r31, %r0, %r31
	.word 0xd46fe0bb  ! 331: LDSTUB_I	ldstub	%r10, [%r31 + 0x00bb]
	rd %pc, %r19
	add %r19, (ivw_40_222-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_222:
	.word 0x91928013  ! 332: WRPR_PIL_R	wrpr	%r10, %r19, %pil
	.word 0xd43fc000  ! 333: STD_R	std	%r10, [%r31 + %r0]
change_to_randtl_40_223:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_223:
	.word 0x8f902000  ! 334: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x24cb4001  ! 335: BRLEZ	brlez,a,pt	%r13,<label_0xb4001>
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_225
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_225
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_225:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 336: RDPC	rd	%pc, %r12
mondo_40_226:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d950006  ! 337: WRPR_WSTATE_R	wrpr	%r20, %r6, %wstate
intveclr_40_227:
	setx 0xe40e7d6f4d0327ea, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 338: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_40_228:
	nop
	setx 0xfffff237ffffff4b, %g1, %g7
	.word 0xa3800007  ! 339: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_229
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_229
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_229:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 340: RDPC	rd	%pc, %r18
	.word 0xab80ea3c  ! 341: WR_CLEAR_SOFTINT_I	wr	%r3, 0x0a3c, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_230) + 40, 16, 16)) -> intp(6,0,24)
intvec_40_230:
	.word 0x39400001  ! 342: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8bfc020  ! 343: STDA_R	stda	%r20, [%r31 + %r0] 0x01
	setx 0xbb74d238f4c8ba00, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_231:
	.word 0x39400001  ! 344: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_40_232-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_232:
	.word 0x9194c007  ! 345: WRPR_PIL_R	wrpr	%r19, %r7, %pil
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 346: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cwp_40_233:
    set user_data_start, %o7
	.word 0x93902006  ! 347: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96a23f4  ! 348: SDIVX_I	sdivx	%r8, 0x03f4, %r20
splash_cmpr_40_235:
	setx 0x9391faa9183c1c23, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 349: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_40_236:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 350: SAVE_R	save	%r31, %r0, %r31
	.word 0xd727e058  ! 351: STF_I	st	%f11, [0x0058, %r31]
	.word 0x95a00171  ! 352: FABSq	dis not found

	.word 0x93d020b4  ! 353: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0xd6cfe010  ! 354: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
	.word 0x9f8024ad  ! 355: SIR	sir	0x04ad
	.word 0xa3454000  ! 356: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
splash_cmpr_40_237:
	setx 0x5716ede561910aef, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 357: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97a00170  ! 358: FABSq	dis not found

    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_238
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_238:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e003  ! 359: CASA_R	casa	[%r31] %asi, %r3, %r12
	.word 0xa1454000  ! 360: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
	.word 0x93450000  ! 361: RD_SET_SOFTINT	rd	%set_softint, %r9
	.word 0x99902001  ! 362: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x99a0016d  ! 363: FABSq	dis not found

debug_40_239:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 364: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d90218e  ! 365: WRPR_PSTATE_I	wrpr	%r0, 0x018e, %pstate
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_240:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 366: CASA_R	casa	[%r31] %asi, %r7, %r16
intveclr_40_241:
	setx 0x97d5cba505b356dd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 367: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01963  ! 368: FqTOd	dis not found

	setx 0x015fcc0fdb6ec43b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_243:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93454000  ! 370: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
splash_hpstate_40_244:
	.word 0x81982c0d  ! 371: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0d, %hpstate
	.word 0xe497e020  ! 372: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r18
	.word 0xe48008a0  ! 373: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
pmu_40_245:
	nop
	setx 0xfffff2c2fffff23a, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_40_246-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_246:
	.word 0x91934010  ! 375: WRPR_PIL_R	wrpr	%r13, %r16, %pil
splash_cmpr_40_247:
	setx 0xb4c62752498b407e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 376: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_40_248:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d948003  ! 377: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
	.word 0xe49fe0e3  ! 378: LDDA_I	ldda	[%r31, + 0x00e3] %asi, %r18
intveclr_40_249:
	setx 0x0ab5387870f85978, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4c7e000  ! 380: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
memptr_40_250:
	set 0x60340000, %r31
	.word 0x858324e7  ! 381: WRCCR_I	wr	%r12, 0x04e7, %ccr
intveclr_40_251:
	setx 0xa4f0af9593956f55, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 382: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_40_252:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 383: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 384: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b3  ! 385: Tcc_I	ta	icc_or_xcc, %r0 + 179
intveclr_40_253:
	setx 0x144f85071aa2542b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_40_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 387: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_40_255:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d92c011  ! 388: WRPR_WSTATE_R	wrpr	%r11, %r17, %wstate
	.word 0xa545c000  ! 389: RD_TICK_CMPR_REG	rd	%-, %r18
mondo_40_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d95000c  ! 390: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
	setx 0xe9cba510da674d72, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_257:
	.word 0x39400001  ! 391: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a0196b  ! 392: FqTOd	dis not found

mondo_40_259:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d91c010  ! 393: WRPR_WSTATE_R	wrpr	%r7, %r16, %wstate
intveclr_40_260:
	setx 0x8c35a61d87356017, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_40_261:
	nop
	setx 0xffffffbefffff876, %g1, %g7
	.word 0xa3800007  ! 395: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_40_262:
	set 0x60540000, %r31
	.word 0x8582bcd0  ! 396: WRCCR_I	wr	%r10, 0x1cd0, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_263)+48, 16, 16)) -> intp(40,1,3)
xir_40_263:
	.word 0xa9813ab0  ! 397: WR_SET_SOFTINT_I	wr	%r4, 0x1ab0, %set_softint
	.word 0xa3540000  ! 398: RDPR_GL	<illegal instruction>
	.word 0x99a409c1  ! 399: FDIVd	fdivd	%f16, %f32, %f12
	.word 0xd0dfe000  ! 400: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
DS_20_1:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa9a049c4  ! 1: FDIVd	fdivd	%f32, %f4, %f20
	.word 0x95a30833  ! 1: FADDs	fadds	%f12, %f19, %f10
	.word 0x93d02034  ! 2: Tcc_I	tne	icc_or_xcc, %r0 + 52
pmu_20_2:
	nop
	setx 0xfffff594fffff425, %g1, %g7
	.word 0xa3800007  ! 3: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 4: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_3:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e009  ! 5: CASA_R	casa	[%r31] %asi, %r9, %r9
DS_20_4:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 6: SAVE_R	save	%r31, %r0, %r31
intveclr_20_5:
	setx 0x940d5028f0e107bb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_6
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_6
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_6:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 8: RDPC	rd	%pc, %r20
	rd %pc, %r19
	add %r19, (ivw_20_7-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_7:
	.word 0x91950000  ! 9: WRPR_PIL_R	wrpr	%r20, %r0, %pil
change_to_randtl_20_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_8:
	.word 0x8f902001  ! 10: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_20_9:
	setx 0x9ef674560612c214, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 11: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 12: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_htba_20_10:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 13: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_20_11:
	.word 0x93a109c1  ! 1: FDIVd	fdivd	%f4, %f32, %f40
	pdist %f10, %f8, %f18
	.word 0xa5b48303  ! 14: ALIGNADDRESS	alignaddr	%r18, %r3, %r18
splash_hpstate_20_12:
	.word 0x81982d3d  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d3d, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196b  ! 16: FqTOd	dis not found

    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_14
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_14:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e012  ! 17: CASA_R	casa	[%r31] %asi, %r18, %r9
	.word 0xd277e068  ! 18: STX_I	stx	%r9, [%r31 + 0x0068]
	.word 0x8d90365a  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x165a, %pstate
DS_20_15:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x99b28310  ! 20: ALIGNADDRESS	alignaddr	%r10, %r16, %r12
	.word 0xe807c000  ! 21: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0x9ba409d1  ! 22: FDIVd	fdivd	%f16, %f48, %f44
	.word 0xd4c7e010  ! 23: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
debug_20_16:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 24: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_17:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e006  ! 25: CASA_R	casa	[%r31] %asi, %r6, %r10
memptr_20_18:
	set user_data_start, %r31
	.word 0x85803d65  ! 26: WRCCR_I	wr	%r0, 0x1d65, %ccr
mondo_20_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d90c000  ! 27: WRPR_WSTATE_R	wrpr	%r3, %r0, %wstate
	.word 0x3a700001  ! 28: BPCC	<illegal instruction>
	.word 0xd537c000  ! 29: STQF_R	-	%f10, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_20
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_20:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 30: RDPC	rd	%pc, %r8
	.word 0xa5a00174  ! 31: FABSq	dis not found

splash_cmpr_20_21:
	setx 0x8beb31e42697396f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 32: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd697e000  ! 33: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
	.word 0x91d02035  ! 34: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_hpstate_20_22:
	.word 0x81982144  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0144, %hpstate
	.word 0xd66fe0a6  ! 36: LDSTUB_I	ldstub	%r11, [%r31 + 0x00a6]
splash_cmpr_20_23:
	setx 0x475cb6c7abdb67c3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 37: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_20_24:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 38: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0xad82623b  ! 39: WR_SOFTINT_REG_I	wr	%r9, 0x023b, %softint
	.word 0xd66fe031  ! 40: LDSTUB_I	ldstub	%r11, [%r31 + 0x0031]
intveclr_20_25:
	setx 0x6b010057583b8137, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 41: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903ec1  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x1ec1, %pstate
	.word 0xd737c000  ! 43: STQF_R	-	%f11, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_26
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_26:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 44: RDPC	rd	%pc, %r13
mondo_20_27:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d94c00d  ! 45: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
	.word 0x26800001  ! 46: BL	bl,a	<label_0x1>
	.word 0xd48008a0  ! 47: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_20_28:
	set 0x5599a76c, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 48: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_20_29:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 49: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93a00162  ! 50: FABSq	dis not found

	.word 0xe68008a0  ! 51: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
splash_tba_20_30:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 52: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d903a3c  ! 53: WRPR_PSTATE_I	wrpr	%r0, 0x1a3c, %pstate
DS_20_31:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 54: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_32) + 40, 16, 16)) -> intp(7,0,28)
intvec_20_32:
	.word 0x39400001  ! 55: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x00d248809bdcbfdc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_33:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_20_34:
	nop
	setx 0xfffffe82fffff96d, %g1, %g7
	.word 0xa3800007  ! 57: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_20_35:
	setx 0x5c8326c85846b816, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56ca730  ! 59: SDIVX_I	sdivx	%r18, 0x0730, %r18
splash_cmpr_20_37:
	setx 0xe0d7cf2881adc0d4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 60: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_38) + 16, 16, 16)) -> intp(7,0,22)
intvec_20_38:
	.word 0x39400001  ! 61: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91a049d4  ! 62: FDIVd	fdivd	%f32, %f20, %f8
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_39:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e004  ! 63: CASA_R	casa	[%r31] %asi, %r4, %r9
	.word 0xd2800b80  ! 64: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6a622a  ! 65: SDIVX_I	sdivx	%r9, 0x022a, %r13
	bl,a	 skip_20_41
	.word 0x99a0c9d0  ! 1: FDIVd	fdivd	%f34, %f16, %f12
.align 512
skip_20_41:
	.word 0x24cb4001  ! 66: BRLEZ	brlez,a,pt	%r13,<label_0xb4001>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_42:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e007  ! 67: CASA_R	casa	[%r31] %asi, %r7, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01971  ! 68: FqTOd	dis not found

intveclr_20_44:
	setx 0xc6d6f5416f7e41be, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_20_45:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x9bb4c302  ! 70: ALIGNADDRESS	alignaddr	%r19, %r2, %r13
	.word 0xe937c000  ! 71: STQF_R	-	%f20, [%r0, %r31]
	rd %pc, %r19
	add %r19, (ivw_20_46-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_46:
	.word 0x91914014  ! 72: WRPR_PIL_R	wrpr	%r5, %r20, %pil
change_to_randtl_20_47:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_47:
	.word 0x8f902001  ! 73: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_20_48:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 74: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0x97a00166  ! 75: FABSq	dis not found

splash_tba_20_49:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 76: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	fbu skip_20_50
	brnz,a,pt	%r20, skip_20_50
.align 128
skip_20_50:
	.word 0x39400001  ! 77: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd2c7e000  ! 78: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r9
	setx 0xdc5eb8a91990a6c1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_51:
	.word 0x39400001  ! 79: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_20_52:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_52-donret_20_52), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007ed5fb | (16 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x6dc, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_52:
	.word 0xd2ffe0c0  ! 80: SWAPA_I	swapa	%r9, [%r31 + 0x00c0] %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b682577  ! 81: SDIVX_I	sdivx	%r0, 0x0577, %r13
mondo_20_54:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d918014  ! 82: WRPR_WSTATE_R	wrpr	%r6, %r20, %wstate
	brz,a,pn	%r18, skip_20_55
	fbuge,a,pn	%fcc0,  skip_20_55
.align 1024
skip_20_55:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_20_56:
	setx 0xbd532261f1a038fe, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 84: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5454000  ! 85: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
intveclr_20_57:
	setx 0x2ac6b663ad8439b7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95a0c9c7  ! 87: FDIVd	fdivd	%f34, %f38, %f10
debug_20_58:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 88: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0xf024a83c32f8a3bf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_59:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_20_60:
	set user_data_start, %r31
	.word 0x858138f8  ! 90: WRCCR_I	wr	%r4, 0x18f8, %ccr
tagged_20_61:
	taddcctv %r11, 0x1fa5, %r26
	.word 0xd807e070  ! 91: LDUW_I	lduw	[%r31 + 0x0070], %r12
	.word 0xd927e03c  ! 92: STF_I	st	%f12, [0x003c, %r31]
splash_cmpr_20_62:
	setx 0x45661344354b73ce, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 93: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_20_63:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 94: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
DS_20_64:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd7346c9e  ! 1: STQF_I	-	%f11, [0x0c9e, %r17]
	normalw
	.word 0x99458000  ! 95: RD_SOFTINT_REG	rd	%softint, %r12
	setx 0xae6f981183dc272b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_65:
	.word 0x39400001  ! 96: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe0a7  ! 97: LDSTUB_I	ldstub	%r17, [%r31 + 0x00a7]
	.word 0x97520000  ! 98: RDPR_PIL	rdpr	%pil, %r11
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_66
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_66:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 99: RDPC	rd	%pc, %r11
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 100: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b4  ! 101: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x95480000  ! 102: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0xe26fe072  ! 103: LDSTUB_I	ldstub	%r17, [%r31 + 0x0072]
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_67
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_67:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 104: RDPC	rd	%pc, %r19
	.word 0x93d020b3  ! 105: Tcc_I	tne	icc_or_xcc, %r0 + 179
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_68
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_68:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 106: RDPC	rd	%pc, %r8
mondo_20_69:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d900011  ! 107: WRPR_WSTATE_R	wrpr	%r0, %r17, %wstate
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
	.word 0x95414000  ! 108: RDPC	rd	%pc, %r10
	.word 0x9f802c65  ! 109: SIR	sir	0x0c65
splash_cmpr_20_71:
	setx 0x91622d6e08e9869e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 110: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 111: LDX_R	ldx	[%r31 + %r0], %r19
intveclr_20_72:
	setx 0xe56e093a575b3360, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_73
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_73:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 113: CASA_R	casa	[%r31] %asi, %r3, %r19
	.word 0x2e800001  ! 114: BVS	bvs,a	<label_0x1>
pmu_20_74:
	nop
	setx 0xfffffb1bfffff950, %g1, %g7
	.word 0xa3800007  ! 115: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_20_75:
    set user_data_start, %o7
	.word 0x93902005  ! 116: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01966  ! 117: FqTOd	dis not found

change_to_randtl_20_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_77:
	.word 0x8f902003  ! 118: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xda6fe066  ! 119: LDSTUB_I	ldstub	%r13, [%r31 + 0x0066]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956a76ed  ! 120: SDIVX_I	sdivx	%r9, 0xfffff6ed, %r10
intveclr_20_79:
	setx 0xb44fbefe1bcf6093, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 121: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_80:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 122: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16d2b4a  ! 123: SDIVX_I	sdivx	%r20, 0x0b4a, %r16
splash_tba_20_82:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 124: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x34800001  ! 125: BG	bg,a	<label_0x1>
	.word 0x91a00160  ! 126: FABSq	dis not found

DS_20_83:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x95a00545  ! 1: FSQRTd	fsqrt	
	.word 0x93a4c831  ! 127: FADDs	fadds	%f19, %f17, %f9
	rd %pc, %r19
	add %r19, (ivw_20_84-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_84:
	.word 0x9192c007  ! 128: WRPR_PIL_R	wrpr	%r11, %r7, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a0196d  ! 129: FqTOd	dis not found

DS_20_86:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f14, %f12, %f0
	.word 0x9bb30306  ! 130: ALIGNADDRESS	alignaddr	%r12, %r6, %r13
DS_20_87:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe932ad2d  ! 1: STQF_I	-	%f20, [0x0d2d, %r10]
	normalw
	.word 0xa1458000  ! 131: RD_SOFTINT_REG	rd	%softint, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_88) + 16, 16, 16)) -> intp(0,0,25)
intvec_20_88:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_20_89:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 133: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 134: LDX_R	ldx	[%r31 + %r0], %r9
donret_20_90:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_90-donret_20_90), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006000db | (4 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x4c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_90:
	.word 0xd2ffe02c  ! 135: SWAPA_I	swapa	%r9, [%r31 + 0x002c] %asi
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_91
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_91:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 136: CASA_R	casa	[%r31] %asi, %r17, %r9
debug_20_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 137: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 138: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd21fc000  ! 139: LDD_R	ldd	[%r31 + %r0], %r9
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_93
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_93
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_93:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 140: RDPC	rd	%pc, %r16
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_94
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_94:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 141: CASA_R	casa	[%r31] %asi, %r17, %r13
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_95
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_95:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 142: RDPC	rd	%pc, %r10
	.word 0x91480000  ! 143: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x93a2c9d2  ! 144: FDIVd	fdivd	%f42, %f18, %f40
mondo_20_96:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d910004  ! 145: WRPR_WSTATE_R	wrpr	%r4, %r4, %wstate
pmu_20_97:
	nop
	setx 0xfffff22dfffffc47, %g1, %g7
	.word 0xa3800007  ! 146: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_20_98:
	setx 0x7b71ed0792541e91, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 147: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97a049d3  ! 148: FDIVd	fdivd	%f32, %f50, %f42
intveclr_20_99:
	setx 0x8068e4a386d92660, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 149: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_20_100:
	setx 0x3507558b074bd7b6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_101
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_101:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 151: RDPC	rd	%pc, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_102) + 8, 16, 16)) -> intp(7,0,2)
intvec_20_102:
	.word 0x39400001  ! 152: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x3e800001  ! 153: BVC	bvc,a	<label_0x1>
	.word 0x3c700001  ! 154: BPPOS	<illegal instruction>
	bleu  	 skip_20_103
	fbuge,a,pn	%fcc0,  skip_20_103
.align 512
skip_20_103:
	.word 0x39400001  ! 155: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe0e6  ! 156: LDSTUB_I	ldstub	%r17, [%r31 + 0x00e6]
	.word 0x83d02035  ! 157: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xe23fe06a  ! 158: STD_I	std	%r17, [%r31 + 0x006a]
	.word 0xa9814003  ! 159: WR_SET_SOFTINT_R	wr	%r5, %r3, %set_softint
	.word 0x95a00169  ! 160: FABSq	dis not found

    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_104:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00a  ! 161: CASA_R	casa	[%r31] %asi, %r10, %r12
	rd %pc, %r19
	add %r19, (ivw_20_105-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_105:
	.word 0x91950000  ! 162: WRPR_PIL_R	wrpr	%r20, %r0, %pil
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_106:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 163: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0xd8cfe010  ! 164: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6931fa  ! 165: SDIVX_I	sdivx	%r4, 0xfffff1fa, %r13
	.word 0x99480000  ! 166: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
pmu_20_108:
	nop
	setx 0xfffffc2bfffffe36, %g1, %g7
	.word 0xa3800007  ! 167: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	be  	 skip_20_109
	fbul,a,pn	%fcc0,  skip_20_109
.align 128
skip_20_109:
	.word 0x24cc0001  ! 168: BRLEZ	brlez,a,pt	%r16,<label_0xc0001>
intveclr_20_110:
	setx 0x67636a0058042896, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 169: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_20_111:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 170: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_20_112:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 171: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_20_113:
	setx 0x1332afd1fbae0c39, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_20_114:
	set 0x55d1c22c, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 173: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd84fe004  ! 174: LDSB_I	ldsb	[%r31 + 0x0004], %r12
debug_20_115:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 175: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_decr_20_116:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa7814001  ! 176: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r1, %-
mondo_20_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d940009  ! 177: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
	.word 0xd89fe098  ! 178: LDDA_I	ldda	[%r31, + 0x0098] %asi, %r12
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 179: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_20_118:
	setx 0xc6918203cff61cf1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 181: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
debug_20_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 182: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_120) + 8, 16, 16)) -> intp(0,0,12)
intvec_20_120:
	.word 0x39400001  ! 183: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_20_121-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_121:
	.word 0x9191c00c  ! 184: WRPR_PIL_R	wrpr	%r7, %r12, %pil
splash_hpstate_20_122:
	.word 0x81982a57  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a57, %hpstate
debug_20_123:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 186: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
splash_cmpr_20_124:
	setx 0x1934c4a13f09fb3d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 187: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd86fe03d  ! 188: LDSTUB_I	ldstub	%r12, [%r31 + 0x003d]
splash_cmpr_20_125:
	setx 0x996d839cca3522f8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 189: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_126
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_126:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 190: RDPC	rd	%pc, %r18
	.word 0xd727e0a6  ! 191: STF_I	st	%f11, [0x00a6, %r31]
splash_cmpr_20_127:
	setx 0xda2381c144d522b0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_20_128:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d918006  ! 193: WRPR_WSTATE_R	wrpr	%r6, %r6, %wstate
DS_20_129:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 194: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 195: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_20_130:
	setx 0x626d1d56ded26a7f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2c800001  ! 197: BNEG	bneg,a	<label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e012  ! 198: CASA_R	casa	[%r31] %asi, %r18, %r11
intveclr_20_132:
	setx 0xea80e1254a8df328, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_20_133:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 200: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_20_134:
	.word 0x81982f0d  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0d, %hpstate
change_to_randtl_20_135:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_135:
	.word 0x8f902000  ! 202: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_136)+48, 16, 16)) -> intp(20,1,3)
xir_20_136:
	.word 0xa98477f7  ! 203: WR_SET_SOFTINT_I	wr	%r17, 0x17f7, %set_softint
	rd %pc, %r19
	add %r19, (ivw_20_137-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_137:
	.word 0x91934004  ! 204: WRPR_PIL_R	wrpr	%r13, %r4, %pil
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196a  ! 205: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9169207f  ! 206: SDIVX_I	sdivx	%r4, 0x007f, %r8
splash_cmpr_20_140:
	setx 0x6f5a08c88c439837, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_20_141:
	setx 0x1cade184574625b7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99693a8c  ! 209: SDIVX_I	sdivx	%r4, 0xfffffa8c, %r12
donret_20_143:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_143-donret_20_143-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e6aa8a | (0x58 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xed6, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_143:
	.word 0xe4ffe098  ! 210: SWAPA_I	swapa	%r18, [%r31 + 0x0098] %asi
debug_20_144:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 211: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96c65d1  ! 212: SDIVX_I	sdivx	%r17, 0x05d1, %r20
DS_20_146:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 213: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 214: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 215: BLEU	bleu,a	<label_0x1>
	.word 0xd337c000  ! 216: STQF_R	-	%f9, [%r0, %r31]
	fbe skip_20_147
	bleu  	 skip_20_147
.align 2048
skip_20_147:
	.word 0x24ca0001  ! 217: BRLEZ	brlez,a,pt	%r8,<label_0xa0001>
	.word 0xe06fe05d  ! 218: LDSTUB_I	ldstub	%r16, [%r31 + 0x005d]
intveclr_20_148:
	setx 0x046e365404adcc1e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0800b40  ! 220: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r16
mondo_20_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d914008  ! 221: WRPR_WSTATE_R	wrpr	%r5, %r8, %wstate
intveclr_20_150:
	setx 0x65d2968d0b84c071, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 222: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe06fe017  ! 223: LDSTUB_I	ldstub	%r16, [%r31 + 0x0017]
	setx 0x6d94064db0f90589, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_151:
	.word 0x39400001  ! 224: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_20_152:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 225: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d020b2  ! 226: Tcc_I	ta	icc_or_xcc, %r0 + 178
intveclr_20_153:
	setx 0x5fefa682096600ed, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 227: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_20_154:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_154-donret_20_154), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0052d9ee | (0x80 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x204, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_154:
	.word 0xe0ffe0ed  ! 228: SWAPA_I	swapa	%r16, [%r31 + 0x00ed] %asi
pmu_20_155:
	nop
	setx 0xfffff309fffffac8, %g1, %g7
	.word 0xa3800007  ! 229: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_20_156:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 230: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
debug_20_157:
	nop
	rdhpr %htba, %r19
	mov 0x1b5,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	.word 0xe6f00b12  ! 231: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_20_158:
	setx 0xa37d0fd1e5daf387, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 232: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_20_159:
	setx 0x3016893b0f1d33b5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 233: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 234: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xe0d7e020  ! 235: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
mondo_20_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d920011  ! 236: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
memptr_20_161:
	set 0x60740000, %r31
	.word 0x85812e81  ! 237: WRCCR_I	wr	%r4, 0x0e81, %ccr
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_162:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 238: CASA_R	casa	[%r31] %asi, %r7, %r16
splash_cmpr_20_163:
	setx 0x0482354d6b426ea5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 239: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6b2e9f  ! 240: SDIVX_I	sdivx	%r12, 0x0e9f, %r13
memptr_20_165:
	set user_data_start, %r31
	.word 0x8581bf39  ! 241: WRCCR_I	wr	%r6, 0x1f39, %ccr
	.word 0x8d90288d  ! 242: WRPR_PSTATE_I	wrpr	%r0, 0x088d, %pstate
splash_lsu_20_166:
	set 0x559a6ba5, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 243: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x813dddee397a06b0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_167:
	.word 0x39400001  ! 244: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9ba00174  ! 245: FABSq	dis not found

	.word 0xe627e0a6  ! 246: STW_I	stw	%r19, [%r31 + 0x00a6]
	rd %pc, %r19
	add %r19, (ivw_20_168-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_168:
	.word 0x9191000b  ! 247: WRPR_PIL_R	wrpr	%r4, %r11, %pil
	.word 0x8d9036f8  ! 248: WRPR_PSTATE_I	wrpr	%r0, 0x16f8, %pstate
donret_20_169:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_169-donret_20_169-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001e106a | (22 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x357, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_169:
	.word 0xe6ffe0de  ! 249: SWAPA_I	swapa	%r19, [%r31 + 0x00de] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_170) + 0, 16, 16)) -> intp(2,0,9)
intvec_20_170:
	.word 0x39400001  ! 250: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_20_171:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_171-donret_20_171-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007e7c1b | (32 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x1d7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_171:
	.word 0xe6ffe020  ! 251: SWAPA_I	swapa	%r19, [%r31 + 0x0020] %asi
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_172
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_172:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e005  ! 252: CASA_R	casa	[%r31] %asi, %r5, %r19
splash_cmpr_20_173:
	setx 0xf76e3d3ce08b5efa, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe62fe0b4  ! 254: STB_I	stb	%r19, [%r31 + 0x00b4]
    set 0x3220, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b447f1  ! 255: PDISTN	fmean16	%d48, %d48, %d10
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_174
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_174:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 256: CASA_R	casa	[%r31] %asi, %r11, %r11
	rd %pc, %r19
	add %r19, (ivw_20_175-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_175:
	.word 0x91950012  ! 257: WRPR_PIL_R	wrpr	%r20, %r18, %pil
splash_hpstate_20_176:
	.word 0x8198251c  ! 258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051c, %hpstate
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
	.word 0xa9414000  ! 259: RDPC	rd	%pc, %r20
intveclr_20_178:
	setx 0x480c73293b48cf1e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 260: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_179:
	setx 0x2451f740247dc731, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 261: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd2d7e030  ! 262: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r9
memptr_20_180:
	set user_data_start, %r31
	.word 0x8582f959  ! 263: WRCCR_I	wr	%r11, 0x1959, %ccr
pmu_20_181:
	nop
	setx 0xfffff48ffffffa77, %g1, %g7
	.word 0xa3800007  ! 264: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd337c000  ! 265: STQF_R	-	%f9, [%r0, %r31]
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
	.word 0x9b414000  ! 266: RDPC	rd	%pc, %r13
DS_20_183:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa7a489d4  ! 1: FDIVd	fdivd	%f18, %f20, %f50
	.word 0x99a0054d  ! 1: FSQRTd	fsqrt	
	.word 0x95a0c82a  ! 267: FADDs	fadds	%f3, %f10, %f10
donret_20_184:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_184-donret_20_184), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004d2af7 | (32 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x2dc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_184:
	.word 0xe8ffe0c0  ! 268: SWAPA_I	swapa	%r20, [%r31 + 0x00c0] %asi
	.word 0x95464000  ! 269: RD_STICK_CMPR_REG	rd	%-, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01963  ! 270: FqTOd	dis not found

debug_20_186:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 271: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_187
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_187
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_187:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 272: RDPC	rd	%pc, %r8
debug_20_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 273: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_189:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 274: RDPC	rd	%pc, %r8
	.word 0xd897e000  ! 275: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
	.word 0x34800001  ! 276: BG	bg,a	<label_0x1>
	.word 0x99520000  ! 277: RDPR_PIL	rdpr	%pil, %r12
	.word 0xda6fe0e4  ! 278: LDSTUB_I	ldstub	%r13, [%r31 + 0x00e4]
splash_htba_20_190:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 279: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x32700001  ! 280: BPNE	<illegal instruction>
tagged_20_191:
	taddcctv %r11, 0x19d6, %r8
	.word 0xda07e07e  ! 281: LDUW_I	lduw	[%r31 + 0x007e], %r13
intveclr_20_192:
	setx 0x2946a647d048254f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 282: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x28800001  ! 283: BLEU	bleu,a	<label_0x1>
	.word 0x91464000  ! 284: RD_STICK_CMPR_REG	rd	%-, %r8
intveclr_20_193:
	setx 0xa2c71cf4b0bbd0fb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 285: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd117c000  ! 286: LDQF_R	-	[%r31, %r0], %f8
	.word 0xa745c000  ! 287: RD_TICK_CMPR_REG	rd	%-, %r19
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_194
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_194:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 288: CASA_R	casa	[%r31] %asi, %r0, %r10
debug_20_195:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 289: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
intveclr_20_196:
	setx 0x8266ffeccbd622fc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_197:
	setx 0xb1239ce7b5df1d95, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 291: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02034  ! 292: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x99902003  ! 293: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
mondo_20_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d928009  ! 294: WRPR_WSTATE_R	wrpr	%r10, %r9, %wstate
splash_cmpr_20_199:
	setx 0x1e1b4e7292df741c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd46fe04d  ! 296: LDSTUB_I	ldstub	%r10, [%r31 + 0x004d]
	.word 0x9f802f30  ! 297: SIR	sir	0x0f30
	.word 0xa7480000  ! 298: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_200) + 32, 16, 16)) -> intp(1,0,28)
intvec_20_200:
	.word 0x39400001  ! 299: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_20_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d904002  ! 300: WRPR_WSTATE_R	wrpr	%r1, %r2, %wstate
	.word 0xd727c000  ! 301: STF_R	st	%f11, [%r0, %r31]
mondo_20_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d914000  ! 302: WRPR_WSTATE_R	wrpr	%r5, %r0, %wstate
debug_20_203:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 303: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_20_204:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d918005  ! 304: WRPR_WSTATE_R	wrpr	%r6, %r5, %wstate
intveclr_20_205:
	setx 0xc247ad29b7bb129a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 305: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a0196b  ! 306: FqTOd	dis not found

pmu_20_207:
	nop
	setx 0xfffff54efffff776, %g1, %g7
	.word 0xa3800007  ! 307: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_20_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d91000d  ! 308: WRPR_WSTATE_R	wrpr	%r4, %r13, %wstate
	.word 0x9191e085  ! 309: WRPR_PIL_I	wrpr	%r7, 0x0085, %pil
	.word 0x8d903551  ! 310: WRPR_PSTATE_I	wrpr	%r0, 0x1551, %pstate
splash_lsu_20_209:
	set 0x55cd4e07, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
	.word 0xa9414000  ! 312: RDPC	rd	%pc, %r20
donret_20_211:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_211-donret_20_211-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00128ab6 | (0x83 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x247, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_211:
	.word 0xe2ffe032  ! 313: SWAPA_I	swapa	%r17, [%r31 + 0x0032] %asi
	.word 0x83d02033  ! 314: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xe26fe03d  ! 315: LDSTUB_I	ldstub	%r17, [%r31 + 0x003d]
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_212
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_212:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 316: CASA_R	casa	[%r31] %asi, %r11, %r17
	setx 0x8e97ce21f118a56a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_213:
	.word 0x39400001  ! 317: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_20_214:
	setx 0x61cf890346a419fa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01974  ! 320: FqTOd	dis not found

memptr_20_216:
	set user_data_start, %r31
	.word 0x8580fb1a  ! 321: WRCCR_I	wr	%r3, 0x1b1a, %ccr
memptr_20_217:
	set 0x60340000, %r31
	.word 0x8581a2ac  ! 322: WRCCR_I	wr	%r6, 0x02ac, %ccr
donret_20_218:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_218-donret_20_218), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00347a33 | (0x80 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xb1f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_218:
	.word 0xe4ffe064  ! 323: SWAPA_I	swapa	%r18, [%r31 + 0x0064] %asi
	.word 0xa9500000  ! 324: RDPR_TPC	rdpr	%tpc, %r20
	.word 0xda6fe0ea  ! 325: LDSTUB_I	ldstub	%r13, [%r31 + 0x00ea]
splash_lsu_20_219:
	set 0x55cc4c75, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 326: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902003  ! 327: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
pmu_20_220:
	nop
	setx 0xfffff347fffff529, %g1, %g7
	.word 0xa3800007  ! 328: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x95a189d1  ! 329: FDIVd	fdivd	%f6, %f48, %f10
DS_20_221:
	.word 0x91a189cb  ! 1: FDIVd	fdivd	%f6, %f42, %f8
	.word 0xbfe7c000  ! 330: SAVE_R	save	%r31, %r0, %r31
	.word 0xd46fe0d1  ! 331: LDSTUB_I	ldstub	%r10, [%r31 + 0x00d1]
	rd %pc, %r19
	add %r19, (ivw_20_222-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_222:
	.word 0x9194c001  ! 332: WRPR_PIL_R	wrpr	%r19, %r1, %pil
	.word 0xd43fc000  ! 333: STD_R	std	%r10, [%r31 + %r0]
change_to_randtl_20_223:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_223:
	.word 0x8f902003  ! 334: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	brlez,a,pt	%r13, skip_20_224
	brz,pt  	%r16, skip_20_224
.align 2048
skip_20_224:
	.word 0x97a149cc  ! 335: FDIVd	fdivd	%f36, %f12, %f42
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_225
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_225
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_225:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 336: RDPC	rd	%pc, %r20
mondo_20_226:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d90000b  ! 337: WRPR_WSTATE_R	wrpr	%r0, %r11, %wstate
intveclr_20_227:
	setx 0x3884f24b9cd2abb3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 338: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_20_228:
	nop
	setx 0xfffff033ffffff48, %g1, %g7
	.word 0xa3800007  ! 339: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_229
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_229
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_229:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 340: RDPC	rd	%pc, %r12
	.word 0xab80fa81  ! 341: WR_CLEAR_SOFTINT_I	wr	%r3, 0x1a81, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_230) + 56, 16, 16)) -> intp(0,0,13)
intvec_20_230:
	.word 0x39400001  ! 342: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8bfc020  ! 343: STDA_R	stda	%r20, [%r31 + %r0] 0x01
	setx 0x6b9eab592e640f15, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_231:
	.word 0x39400001  ! 344: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_20_232-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_232:
	.word 0x9191c014  ! 345: WRPR_PIL_R	wrpr	%r7, %r20, %pil
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 346: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cwp_20_233:
    set user_data_start, %o7
	.word 0x93902007  ! 347: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9569b423  ! 348: SDIVX_I	sdivx	%r6, 0xfffff423, %r10
splash_cmpr_20_235:
	setx 0x63b165c14bd3d7a8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 349: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_20_236:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 350: SAVE_R	save	%r31, %r0, %r31
	.word 0xd727e0cd  ! 351: STF_I	st	%f11, [0x00cd, %r31]
	.word 0xa3a00160  ! 352: FABSq	dis not found

	.word 0x91d02032  ! 353: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd6cfe030  ! 354: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
	.word 0x9f803a58  ! 355: SIR	sir	0x1a58
	.word 0xa5454000  ! 356: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
splash_cmpr_20_237:
	setx 0x5a6ac1a643fc47da, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 357: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a0016d  ! 358: FABSq	dis not found

    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_238
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_238:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e003  ! 359: CASA_R	casa	[%r31] %asi, %r3, %r12
	.word 0x99454000  ! 360: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0x9b450000  ! 361: RD_SET_SOFTINT	rd	%set_softint, %r13
	.word 0x99902004  ! 362: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x9ba00173  ! 363: FABSq	dis not found

debug_20_239:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 364: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d902196  ! 365: WRPR_PSTATE_I	wrpr	%r0, 0x0196, %pstate
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_240:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 366: CASA_R	casa	[%r31] %asi, %r7, %r16
intveclr_20_241:
	setx 0xae23d598d007f6e1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 367: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a0196a  ! 368: FqTOd	dis not found

	setx 0x713e985ba365bc78, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_243:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9454000  ! 370: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
splash_hpstate_20_244:
	.word 0x81982a1c  ! 371: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1c, %hpstate
	.word 0xe497e000  ! 372: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0xe48008a0  ! 373: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
pmu_20_245:
	nop
	setx 0xfffffab6fffffe79, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_20_246-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_246:
	.word 0x9190800c  ! 375: WRPR_PIL_R	wrpr	%r2, %r12, %pil
splash_cmpr_20_247:
	setx 0xca131712362f0b8e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 376: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_20_248:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d93000a  ! 377: WRPR_WSTATE_R	wrpr	%r12, %r10, %wstate
	.word 0xe49fe0ba  ! 378: LDDA_I	ldda	[%r31, + 0x00ba] %asi, %r18
intveclr_20_249:
	setx 0x31d4e98c0e98b79a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4c7e020  ! 380: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r18
memptr_20_250:
	set 0x60140000, %r31
	.word 0x8582ee1e  ! 381: WRCCR_I	wr	%r11, 0x0e1e, %ccr
intveclr_20_251:
	setx 0xae635253a78e3cbf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 382: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_20_252:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 383: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 384: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93d02033  ! 385: Tcc_I	tne	icc_or_xcc, %r0 + 51
intveclr_20_253:
	setx 0x45e21b1c5ea29a5a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_20_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 387: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_20_255:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d92c010  ! 388: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
	.word 0x9545c000  ! 389: RD_TICK_CMPR_REG	rd	%-, %r10
mondo_20_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d91c008  ! 390: WRPR_WSTATE_R	wrpr	%r7, %r8, %wstate
	setx 0xfad39027fdc1dbe4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_257:
	.word 0x39400001  ! 391: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01973  ! 392: FqTOd	dis not found

mondo_20_259:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d914005  ! 393: WRPR_WSTATE_R	wrpr	%r5, %r5, %wstate
intveclr_20_260:
	setx 0x8cc5c68c4e2c70c6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_20_261:
	nop
	setx 0xfffffc8efffff8ee, %g1, %g7
	.word 0xa3800007  ! 395: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_20_262:
	set 0x60740000, %r31
	.word 0x8584a8fc  ! 396: WRCCR_I	wr	%r18, 0x08fc, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_263)+56, 16, 16)) -> intp(20,1,3)
xir_20_263:
	.word 0xa9846f80  ! 397: WR_SET_SOFTINT_I	wr	%r17, 0x0f80, %set_softint
	.word 0x9b540000  ! 398: RDPR_GL	<illegal instruction>
	bn,a	 skip_20_264
	fbuge skip_20_264
.align 32
skip_20_264:
	.word 0x39400001  ! 399: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0dfe000  ! 400: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
DS_10_1:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x97a289d0  ! 1: FDIVd	fdivd	%f10, %f16, %f42
	.word 0x9ba14832  ! 1: FADDs	fadds	%f5, %f18, %f13
	.word 0x91d020b5  ! 2: Tcc_I	ta	icc_or_xcc, %r0 + 181
pmu_10_2:
	nop
	setx 0xfffff4e8fffff845, %g1, %g7
	.word 0xa3800007  ! 3: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 4: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_3:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e009  ! 5: CASA_R	casa	[%r31] %asi, %r9, %r9
DS_10_4:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 6: SAVE_R	save	%r31, %r0, %r31
intveclr_10_5:
	setx 0x93d23dae28beab3b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_6
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_6
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_6:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 8: RDPC	rd	%pc, %r11
	rd %pc, %r19
	add %r19, (ivw_10_7-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_7:
	.word 0x91918003  ! 9: WRPR_PIL_R	wrpr	%r6, %r3, %pil
change_to_randtl_10_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_8:
	.word 0x8f902002  ! 10: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_10_9:
	setx 0x503fc47428308d84, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 11: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 12: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_10_10:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 13: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_10_11:
	.word 0x95a489c2  ! 1: FDIVd	fdivd	%f18, %f2, %f10
	pdist %f2, %f16, %f4
	.word 0x97b10312  ! 14: ALIGNADDRESS	alignaddr	%r4, %r18, %r11
splash_hpstate_10_12:
	.word 0x81982296  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0296, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01962  ! 16: FqTOd	dis not found

    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_14
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_14:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e012  ! 17: CASA_R	casa	[%r31] %asi, %r18, %r9
	.word 0xd277e00b  ! 18: STX_I	stx	%r9, [%r31 + 0x000b]
	.word 0x8d9022d2  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x02d2, %pstate
DS_10_15:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x99b48304  ! 20: ALIGNADDRESS	alignaddr	%r18, %r4, %r12
	.word 0xe807c000  ! 21: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0xa7a049c0  ! 22: FDIVd	fdivd	%f32, %f0, %f50
	.word 0xd4c7e010  ! 23: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
debug_10_16:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 24: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_17:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e006  ! 25: CASA_R	casa	[%r31] %asi, %r6, %r10
memptr_10_18:
	set user_data_start, %r31
	.word 0x8581206f  ! 26: WRCCR_I	wr	%r4, 0x006f, %ccr
mondo_10_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d91400a  ! 27: WRPR_WSTATE_R	wrpr	%r5, %r10, %wstate
	.word 0x3a700001  ! 28: BPCC	<illegal instruction>
	.word 0xd537c000  ! 29: STQF_R	-	%f10, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_20
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_20:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 30: RDPC	rd	%pc, %r11
	.word 0x95a00174  ! 31: FABSq	dis not found

splash_cmpr_10_21:
	setx 0x51b25e704b58b76f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 32: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd697e000  ! 33: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
	.word 0x91d02033  ! 34: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_hpstate_10_22:
	.word 0x8198284f  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084f, %hpstate
	.word 0xd66fe0af  ! 36: LDSTUB_I	ldstub	%r11, [%r31 + 0x00af]
splash_cmpr_10_23:
	setx 0x7135c2261fbd8e16, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 37: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_10_24:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_24:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_24
    nop
debug_wait10_24:
    ld [%r23], %r16
    brnz %r16, debug_wait10_24
    nop
    ba,a debug_startwait10_24
continue_debug_10_24:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_24:
    cmp %r13, %r17
    bne,a wait_for_stat_10_24
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_24:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_24
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 38: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xad853af3  ! 39: WR_SOFTINT_REG_I	wr	%r20, 0x1af3, %softint
	.word 0xd66fe010  ! 40: LDSTUB_I	ldstub	%r11, [%r31 + 0x0010]
intveclr_10_25:
	setx 0xd3925c3db1c813fe, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 41: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902e2f  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x0e2f, %pstate
	.word 0xd737c000  ! 43: STQF_R	-	%f11, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_26
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_26:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 44: RDPC	rd	%pc, %r12
mondo_10_27:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d918004  ! 45: WRPR_WSTATE_R	wrpr	%r6, %r4, %wstate
	.word 0x26800001  ! 46: BL	bl,a	<label_0x1>
	.word 0xd48008a0  ! 47: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_10_28:
	set 0x55b8033d, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 48: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_10_29:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 49: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93a00160  ! 50: FABSq	dis not found

	.word 0xe68008a0  ! 51: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
splash_tba_10_30:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 52: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d903c43  ! 53: WRPR_PSTATE_I	wrpr	%r0, 0x1c43, %pstate
DS_10_31:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 54: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_32) + 0, 16, 16)) -> intp(7,0,14)
intvec_10_32:
	.word 0x39400001  ! 55: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x7ebaae690476adad, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_33:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_10_34:
	nop
	setx 0xfffff17cfffff141, %g1, %g7
	.word 0xa3800007  ! 57: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_10_35:
	setx 0x52ca97b2b333f96b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96ca943  ! 59: SDIVX_I	sdivx	%r18, 0x0943, %r20
splash_cmpr_10_37:
	setx 0x51d312ab879b5145, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 60: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_38) + 24, 16, 16)) -> intp(0,0,28)
intvec_10_38:
	.word 0x39400001  ! 61: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5a1c9cd  ! 62: FDIVd	fdivd	%f38, %f44, %f18
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_39:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e004  ! 63: CASA_R	casa	[%r31] %asi, %r4, %r9
	.word 0xd2800ae0  ! 64: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa769b0a1  ! 65: SDIVX_I	sdivx	%r6, 0xfffff0a1, %r19
	fbug,a,pn	%fcc0,  skip_10_41
	fbuge,a,pn	%fcc0,  skip_10_41
.align 512
skip_10_41:
	.word 0x39400001  ! 66: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_42:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e007  ! 67: CASA_R	casa	[%r31] %asi, %r7, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01968  ! 68: FqTOd	dis not found

intveclr_10_44:
	setx 0xd7452047ab7604be, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_10_45:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x97b18300  ! 70: ALIGNADDRESS	alignaddr	%r6, %r0, %r11
	.word 0xe937c000  ! 71: STQF_R	-	%f20, [%r0, %r31]
	rd %pc, %r19
	add %r19, (ivw_10_46-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_46:
	.word 0x9194c004  ! 72: WRPR_PIL_R	wrpr	%r19, %r4, %pil
change_to_randtl_10_47:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_47:
	.word 0x8f902000  ! 73: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_10_48:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_48:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_48
    nop
debug_wait10_48:
    ld [%r23], %r16
    brnz %r16, debug_wait10_48
    nop
    ba,a debug_startwait10_48
continue_debug_10_48:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_48:
    cmp %r13, %r17
    bne,a wait_for_stat_10_48
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_48:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_48
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %r8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd2f00492  ! 74: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0x9ba00161  ! 75: FABSq	dis not found

splash_tba_10_49:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 76: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	fble skip_10_50
	fbe skip_10_50
.align 128
skip_10_50:
	.word 0x99a149c5  ! 77: FDIVd	fdivd	%f36, %f36, %f12
	.word 0xd2c7e020  ! 78: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r9
	setx 0x414f94f73063e7b1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_51:
	.word 0x39400001  ! 79: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_10_52:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_52-donret_10_52), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00bfe1ce | (0x8a << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x54f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_52:
	.word 0xd2ffe0db  ! 80: SWAPA_I	swapa	%r9, [%r31 + 0x00db] %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976928ff  ! 81: SDIVX_I	sdivx	%r4, 0x08ff, %r11
mondo_10_54:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d944014  ! 82: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	fbne skip_10_55
	brlez,a,pn	%r17, skip_10_55
.align 1024
skip_10_55:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_10_56:
	setx 0xe0a6634a2e3a3398, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 84: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99454000  ! 85: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
intveclr_10_57:
	setx 0x3b74af1e95cbb2b8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93a4c9d0  ! 87: FDIVd	fdivd	%f50, %f16, %f40
debug_10_58:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 88: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x58d156a18afe29da, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_59:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_10_60:
	set user_data_start, %r31
	.word 0x858167f7  ! 90: WRCCR_I	wr	%r5, 0x07f7, %ccr
tagged_10_61:
	taddcctv %r10, 0x1bc3, %r10
	.word 0xd807e014  ! 91: LDUW_I	lduw	[%r31 + 0x0014], %r12
	.word 0xd927e008  ! 92: STF_I	st	%f12, [0x0008, %r31]
splash_cmpr_10_62:
	setx 0xa6699ad3e3cdf77f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 93: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_10_63:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_63:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_63
    nop
debug_wait10_63:
    ld [%r23], %r16
    brnz %r16, debug_wait10_63
    nop
    ba,a debug_startwait10_63
continue_debug_10_63:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_63:
    cmp %r13, %r17
    bne,a wait_for_stat_10_63
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_63:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_63
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %r19, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 94: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
DS_10_64:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe330b32f  ! 1: STQF_I	-	%f17, [0x132f, %r2]
	normalw
	.word 0x99458000  ! 95: RD_SOFTINT_REG	rd	%softint, %r12
	setx 0x3dca0b307e40c71f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_65:
	.word 0x39400001  ! 96: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe090  ! 97: LDSTUB_I	ldstub	%r17, [%r31 + 0x0090]
	.word 0x99520000  ! 98: RDPR_PIL	rdpr	%pil, %r12
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_66
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_66:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 99: RDPC	rd	%pc, %r9
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 100: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d020b4  ! 101: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xa1480000  ! 102: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0xe26fe007  ! 103: LDSTUB_I	ldstub	%r17, [%r31 + 0x0007]
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_67
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_67:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 104: RDPC	rd	%pc, %r19
	.word 0x83d020b2  ! 105: Tcc_I	te	icc_or_xcc, %r0 + 178
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_68
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_68:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 106: RDPC	rd	%pc, %r13
mondo_10_69:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d940012  ! 107: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
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
	.word 0x9b414000  ! 108: RDPC	rd	%pc, %r13
	.word 0x9f803a46  ! 109: SIR	sir	0x1a46
splash_cmpr_10_71:
	setx 0x1a51dfeefd595046, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 110: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 111: LDX_R	ldx	[%r31 + %r0], %r19
intveclr_10_72:
	setx 0x68b5277122a9fa82, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_73
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_73:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 113: CASA_R	casa	[%r31] %asi, %r3, %r19
	.word 0x2e800001  ! 114: BVS	bvs,a	<label_0x1>
pmu_10_74:
	nop
	setx 0xfffff548fffff69d, %g1, %g7
	.word 0xa3800007  ! 115: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_10_75:
    set user_data_start, %o7
	.word 0x93902002  ! 116: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01970  ! 117: FqTOd	dis not found

change_to_randtl_10_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_77:
	.word 0x8f902003  ! 118: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xda6fe09b  ! 119: LDSTUB_I	ldstub	%r13, [%r31 + 0x009b]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56a31bb  ! 120: SDIVX_I	sdivx	%r8, 0xfffff1bb, %r18
intveclr_10_79:
	setx 0x0bacdfa664da2668, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 121: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_80:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 122: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996b3253  ! 123: SDIVX_I	sdivx	%r12, 0xfffff253, %r12
splash_tba_10_82:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 124: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x34800001  ! 125: BG	bg,a	<label_0x1>
	.word 0x93a00172  ! 126: FABSq	dis not found

DS_10_83:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x99a00545  ! 1: FSQRTd	fsqrt	
	.word 0x91a40832  ! 127: FADDs	fadds	%f16, %f18, %f8
	rd %pc, %r19
	add %r19, (ivw_10_84-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_84:
	.word 0x91948012  ! 128: WRPR_PIL_R	wrpr	%r18, %r18, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01973  ! 129: FqTOd	dis not found

DS_10_86:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f26, %f16, %f24
	.word 0x97b24309  ! 130: ALIGNADDRESS	alignaddr	%r9, %r9, %r11
DS_10_87:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd33531ec  ! 1: STQF_I	-	%f9, [0x11ec, %r20]
	normalw
	.word 0xa5458000  ! 131: RD_SOFTINT_REG	rd	%softint, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_88) + 8, 16, 16)) -> intp(7,0,24)
intvec_10_88:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_10_89:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 133: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 134: LDX_R	ldx	[%r31 + %r0], %r9
donret_10_90:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_90-donret_10_90), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0032248f | (0x83 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x705, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_90:
	.word 0xd2ffe0d4  ! 135: SWAPA_I	swapa	%r9, [%r31 + 0x00d4] %asi
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_91
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_91:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 136: CASA_R	casa	[%r31] %asi, %r17, %r9
debug_10_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 137: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 138: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd21fc000  ! 139: LDD_R	ldd	[%r31 + %r0], %r9
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_93
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_93
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_93:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 140: RDPC	rd	%pc, %r9
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_94
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_94:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 141: CASA_R	casa	[%r31] %asi, %r17, %r13
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_95
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_95:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 142: RDPC	rd	%pc, %r8
	.word 0xa3480000  ! 143: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xa1a409cb  ! 144: FDIVd	fdivd	%f16, %f42, %f16
mondo_10_96:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d94c001  ! 145: WRPR_WSTATE_R	wrpr	%r19, %r1, %wstate
pmu_10_97:
	nop
	setx 0xfffff3aafffff3e5, %g1, %g7
	.word 0xa3800007  ! 146: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_10_98:
	setx 0x624b3cf892003125, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 147: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91a249c1  ! 148: FDIVd	fdivd	%f40, %f32, %f8
intveclr_10_99:
	setx 0x806648453ca9d4ba, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 149: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_10_100:
	setx 0xad43ca642bdfe8bf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_101
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_101:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 151: RDPC	rd	%pc, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_102) + 48, 16, 16)) -> intp(1,0,24)
intvec_10_102:
	.word 0x39400001  ! 152: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x3e800001  ! 153: BVC	bvc,a	<label_0x1>
	.word 0x3c700001  ! 154: BPPOS	<illegal instruction>
	bcc,a	 skip_10_103
	.word 0xa9a1c9c3  ! 1: FDIVd	fdivd	%f38, %f34, %f20
.align 512
skip_10_103:
	.word 0x9ba449cc  ! 155: FDIVd	fdivd	%f48, %f12, %f44
	.word 0xe26fe0cc  ! 156: LDSTUB_I	ldstub	%r17, [%r31 + 0x00cc]
	.word 0x83d020b5  ! 157: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xe23fe01d  ! 158: STD_I	std	%r17, [%r31 + 0x001d]
	.word 0xa982c002  ! 159: WR_SET_SOFTINT_R	wr	%r11, %r2, %set_softint
	.word 0x9ba00162  ! 160: FABSq	dis not found

    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_104:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00a  ! 161: CASA_R	casa	[%r31] %asi, %r10, %r12
	rd %pc, %r19
	add %r19, (ivw_10_105-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_105:
	.word 0x91944007  ! 162: WRPR_PIL_R	wrpr	%r17, %r7, %pil
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_106:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 163: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0xd8cfe020  ! 164: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76c3ddc  ! 165: SDIVX_I	sdivx	%r16, 0xfffffddc, %r19
	.word 0xa5480000  ! 166: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
pmu_10_108:
	nop
	setx 0xfffffd2cfffffdc3, %g1, %g7
	.word 0xa3800007  ! 167: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	brlz,a,pn	%r16, skip_10_109
	bge  	 skip_10_109
.align 128
skip_10_109:
	.word 0x24ca0001  ! 168: BRLEZ	brlez,a,pt	%r8,<label_0xa0001>
intveclr_10_110:
	setx 0xdf81bd03f364c4b2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 169: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_10_111:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 170: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_10_112:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 171: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_10_113:
	setx 0x62cce1c0ee55d287, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_10_114:
	set 0x552624f1, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 173: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd84fe042  ! 174: LDSB_I	ldsb	[%r31 + 0x0042], %r12
debug_10_115:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 175: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa781400c  ! 176: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r12, %-
mondo_10_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d930011  ! 177: WRPR_WSTATE_R	wrpr	%r12, %r17, %wstate
	.word 0xd89fe0b0  ! 178: LDDA_I	ldda	[%r31, + 0x00b0] %asi, %r12
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 179: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_10_118:
	setx 0x8c481ed9392805c2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 181: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
debug_10_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 182: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_120) + 40, 16, 16)) -> intp(7,0,23)
intvec_10_120:
	.word 0x39400001  ! 183: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_10_121-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_121:
	.word 0x9190c00a  ! 184: WRPR_PIL_R	wrpr	%r3, %r10, %pil
splash_hpstate_10_122:
	.word 0x81982e5c  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5c, %hpstate
debug_10_123:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_123:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_123
    nop
debug_wait10_123:
    ld [%r23], %r16
    brnz %r16, debug_wait10_123
    nop
    ba,a debug_startwait10_123
continue_debug_10_123:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_123:
    cmp %r13, %r17
    bne,a wait_for_stat_10_123
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_123:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_123
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %r14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00492  ! 186: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
splash_cmpr_10_124:
	setx 0xd608d6b6f6bf1d85, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 187: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd86fe0cb  ! 188: LDSTUB_I	ldstub	%r12, [%r31 + 0x00cb]
splash_cmpr_10_125:
	setx 0xc915201004d56ed9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 189: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_126
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_126:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 190: RDPC	rd	%pc, %r20
	.word 0xd727e081  ! 191: STF_I	st	%f11, [0x0081, %r31]
splash_cmpr_10_127:
	setx 0xc55afc91837e1235, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_10_128:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d94c00a  ! 193: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
DS_10_129:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 194: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 195: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_10_130:
	setx 0x204ecc43318effec, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2c800001  ! 197: BNEG	bneg,a	<label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e012  ! 198: CASA_R	casa	[%r31] %asi, %r18, %r11
intveclr_10_132:
	setx 0xfdaf98cc8a77fcf8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_10_133:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 200: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_10_134:
	.word 0x81982a1d  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1d, %hpstate
change_to_randtl_10_135:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_135:
	.word 0x8f902001  ! 202: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_136)+8, 16, 16)) -> intp(10,1,3)
xir_10_136:
	.word 0xa980efeb  ! 203: WR_SET_SOFTINT_I	wr	%r3, 0x0feb, %set_softint
	rd %pc, %r19
	add %r19, (ivw_10_137-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_137:
	.word 0x91904002  ! 204: WRPR_PIL_R	wrpr	%r1, %r2, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01960  ! 205: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9769ac5d  ! 206: SDIVX_I	sdivx	%r6, 0x0c5d, %r11
splash_cmpr_10_140:
	setx 0x08b4c2a411ecb2dc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_10_141:
	setx 0x5351210cf8be3348, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916ce544  ! 209: SDIVX_I	sdivx	%r19, 0x0544, %r8
donret_10_143:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_143-donret_10_143-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008ab1ee | (0x83 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x14f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_143:
	.word 0xe4ffe091  ! 210: SWAPA_I	swapa	%r18, [%r31 + 0x0091] %asi
debug_10_144:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_144:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_144
    nop
debug_wait10_144:
    ld [%r23], %r16
    brnz %r16, debug_wait10_144
    nop
    ba,a debug_startwait10_144
continue_debug_10_144:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_144:
    cmp %r13, %r17
    bne,a wait_for_stat_10_144
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_144:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_144
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %r14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd2f00492  ! 211: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6c3c21  ! 212: SDIVX_I	sdivx	%r16, 0xfffffc21, %r13
DS_10_146:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 213: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 214: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 215: BLEU	bleu,a	<label_0x1>
	.word 0xd337c000  ! 216: STQF_R	-	%f9, [%r0, %r31]
	bge,a	 skip_10_147
	bn,a	 skip_10_147
.align 2048
skip_10_147:
	.word 0x24c80001  ! 217: BRLEZ	brlez,a,pt	%r0,<label_0x80001>
	.word 0xe06fe0bd  ! 218: LDSTUB_I	ldstub	%r16, [%r31 + 0x00bd]
intveclr_10_148:
	setx 0x6403c11c601b4dc9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0800c80  ! 220: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r16
mondo_10_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d92c013  ! 221: WRPR_WSTATE_R	wrpr	%r11, %r19, %wstate
intveclr_10_150:
	setx 0x0d5342b788c32ec6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 222: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe06fe0c7  ! 223: LDSTUB_I	ldstub	%r16, [%r31 + 0x00c7]
	setx 0x746c13577c5bf975, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_151:
	.word 0x39400001  ! 224: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_10_152:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 225: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93d02034  ! 226: Tcc_I	tne	icc_or_xcc, %r0 + 52
intveclr_10_153:
	setx 0x09f25508af704eb4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 227: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_10_154:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_154-donret_10_154), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004c03e3 | (0x89 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xd4f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_154:
	.word 0xe0ffe0a4  ! 228: SWAPA_I	swapa	%r16, [%r31 + 0x00a4] %asi
pmu_10_155:
	nop
	setx 0xfffff9fffffffee0, %g1, %g7
	.word 0xa3800007  ! 229: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_10_156:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_156:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_156
    nop
debug_wait10_156:
    ld [%r23], %r16
    brnz %r16, debug_wait10_156
    nop
    ba,a debug_startwait10_156
continue_debug_10_156:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_156:
    cmp %r13, %r17
    bne,a wait_for_stat_10_156
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_156:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_156
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %r19, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00492  ! 230: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
debug_10_157:
	nop
	.word 0xe6f00b12  ! 231: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_10_158:
	setx 0x05cd16d6cf1586f1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 232: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_10_159:
	setx 0x999e8011c361d20f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 233: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 234: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe0d7e010  ! 235: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r16
mondo_10_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d90c00b  ! 236: WRPR_WSTATE_R	wrpr	%r3, %r11, %wstate
memptr_10_161:
	set 0x60540000, %r31
	.word 0x8581fac7  ! 237: WRCCR_I	wr	%r7, 0x1ac7, %ccr
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_162:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 238: CASA_R	casa	[%r31] %asi, %r7, %r16
splash_cmpr_10_163:
	setx 0x49c3d6a2f25870cc, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 239: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93683565  ! 240: SDIVX_I	sdivx	%r0, 0xfffff565, %r9
memptr_10_165:
	set user_data_start, %r31
	.word 0x858462e4  ! 241: WRCCR_I	wr	%r17, 0x02e4, %ccr
	.word 0x8d902886  ! 242: WRPR_PSTATE_I	wrpr	%r0, 0x0886, %pstate
splash_lsu_10_166:
	set 0x55e03c03, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 243: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x6291458cfc5891e5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_167:
	.word 0x39400001  ! 244: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97a00162  ! 245: FABSq	dis not found

	.word 0xe627e089  ! 246: STW_I	stw	%r19, [%r31 + 0x0089]
	rd %pc, %r19
	add %r19, (ivw_10_168-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_168:
	.word 0x91930008  ! 247: WRPR_PIL_R	wrpr	%r12, %r8, %pil
	.word 0x8d902fc8  ! 248: WRPR_PSTATE_I	wrpr	%r0, 0x0fc8, %pstate
donret_10_169:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_169-donret_10_169-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e12eca | (22 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x685, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_169:
	.word 0xe6ffe095  ! 249: SWAPA_I	swapa	%r19, [%r31 + 0x0095] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_170) + 48, 16, 16)) -> intp(4,0,22)
intvec_10_170:
	.word 0x39400001  ! 250: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_10_171:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_171-donret_10_171-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007023c5 | (4 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xe5c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_171:
	.word 0xe6ffe07a  ! 251: SWAPA_I	swapa	%r19, [%r31 + 0x007a] %asi
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_172
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_172:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e005  ! 252: CASA_R	casa	[%r31] %asi, %r5, %r19
splash_cmpr_10_173:
	setx 0xac2314d9cb2c890c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe62fe0ac  ! 254: STB_I	stb	%r19, [%r31 + 0x00ac]
    set 0x2d49, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b4c7e6  ! 255: PDISTN	fmean16	%d50, %d6, %d12
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_174
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_174:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 256: CASA_R	casa	[%r31] %asi, %r11, %r11
	rd %pc, %r19
	add %r19, (ivw_10_175-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_175:
	.word 0x91930014  ! 257: WRPR_PIL_R	wrpr	%r12, %r20, %pil
splash_hpstate_10_176:
	.word 0x8198294c  ! 258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094c, %hpstate
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
	.word 0xa7414000  ! 259: RDPC	rd	%pc, %r19
intveclr_10_178:
	setx 0x8445c6be34724d35, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 260: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_179:
	setx 0x9b96398f5d4b67e1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 261: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd2d7e000  ! 262: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r9
memptr_10_180:
	set user_data_start, %r31
	.word 0x8582ea2a  ! 263: WRCCR_I	wr	%r11, 0x0a2a, %ccr
pmu_10_181:
	nop
	setx 0xfffff50bfffffe11, %g1, %g7
	.word 0xa3800007  ! 264: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd337c000  ! 265: STQF_R	-	%f9, [%r0, %r31]
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
	.word 0x9b414000  ! 266: RDPC	rd	%pc, %r13
DS_10_183:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x9ba349c8  ! 1: FDIVd	fdivd	%f44, %f8, %f44
	.word 0x93a0054d  ! 1: FSQRTd	fsqrt	
	.word 0x93a44831  ! 267: FADDs	fadds	%f17, %f17, %f9
donret_10_184:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_184-donret_10_184), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e7f00e | (0x82 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x54c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_184:
	.word 0xe8ffe010  ! 268: SWAPA_I	swapa	%r20, [%r31 + 0x0010] %asi
	.word 0xa7464000  ! 269: RD_STICK_CMPR_REG	rd	%-, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01961  ! 270: FqTOd	dis not found

debug_10_186:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_186:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_186
    nop
debug_wait10_186:
    ld [%r23], %r16
    brnz %r16, debug_wait10_186
    nop
    ba,a debug_startwait10_186
continue_debug_10_186:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_186:
    cmp %r13, %r17
    bne,a wait_for_stat_10_186
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_186:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_186
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %r12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 271: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_187
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_187
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_187:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 272: RDPC	rd	%pc, %r9
debug_10_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 273: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_189:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 274: RDPC	rd	%pc, %r19
	.word 0xd897e010  ! 275: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
	.word 0x34800001  ! 276: BG	bg,a	<label_0x1>
	.word 0xa9520000  ! 277: RDPR_PIL	rdpr	%pil, %r20
	.word 0xda6fe0bc  ! 278: LDSTUB_I	ldstub	%r13, [%r31 + 0x00bc]
splash_htba_10_190:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 279: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x32700001  ! 280: BPNE	<illegal instruction>
tagged_10_191:
	taddcctv %r23, 0x1b9b, %r2
	.word 0xda07e0ac  ! 281: LDUW_I	lduw	[%r31 + 0x00ac], %r13
intveclr_10_192:
	setx 0xd5e2552d7dca0a66, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 282: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x28800001  ! 283: BLEU	bleu,a	<label_0x1>
	.word 0xa1464000  ! 284: RD_STICK_CMPR_REG	rd	%-, %r16
intveclr_10_193:
	setx 0x1cd0703b40cbc4d9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 285: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd117c000  ! 286: LDQF_R	-	[%r31, %r0], %f8
	.word 0xa345c000  ! 287: RD_TICK_CMPR_REG	rd	%-, %r17
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_194
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_194:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 288: CASA_R	casa	[%r31] %asi, %r0, %r10
debug_10_195:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_195:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_195
    nop
debug_wait10_195:
    ld [%r23], %r16
    brnz %r16, debug_wait10_195
    nop
    ba,a debug_startwait10_195
continue_debug_10_195:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_195:
    cmp %r13, %r17
    bne,a wait_for_stat_10_195
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_195:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_195
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %r9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00492  ! 289: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
intveclr_10_196:
	setx 0x6b11e70889c9e55d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_197:
	setx 0xc5d4e5b9c6e8d807, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 291: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02035  ! 292: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x99902005  ! 293: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
mondo_10_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d924006  ! 294: WRPR_WSTATE_R	wrpr	%r9, %r6, %wstate
splash_cmpr_10_199:
	setx 0xff3a372ed701365c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd46fe0d0  ! 296: LDSTUB_I	ldstub	%r10, [%r31 + 0x00d0]
	.word 0x9f802572  ! 297: SIR	sir	0x0572
	.word 0xa3480000  ! 298: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_200) + 24, 16, 16)) -> intp(6,0,15)
intvec_10_200:
	.word 0x39400001  ! 299: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_10_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d92c014  ! 300: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
	.word 0xd727c000  ! 301: STF_R	st	%f11, [%r0, %r31]
mondo_10_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d90400a  ! 302: WRPR_WSTATE_R	wrpr	%r1, %r10, %wstate
debug_10_203:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 303: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_10_204:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d904009  ! 304: WRPR_WSTATE_R	wrpr	%r1, %r9, %wstate
intveclr_10_205:
	setx 0x2502572c75ee80b7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 305: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01967  ! 306: FqTOd	dis not found

pmu_10_207:
	nop
	setx 0xfffff656fffffc09, %g1, %g7
	.word 0xa3800007  ! 307: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_10_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d908003  ! 308: WRPR_WSTATE_R	wrpr	%r2, %r3, %wstate
	.word 0x919536d1  ! 309: WRPR_PIL_I	wrpr	%r20, 0x16d1, %pil
	.word 0x8d902b2a  ! 310: WRPR_PSTATE_I	wrpr	%r0, 0x0b2a, %pstate
splash_lsu_10_209:
	set 0x5557c610, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
	.word 0x95414000  ! 312: RDPC	rd	%pc, %r10
donret_10_211:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_211-donret_10_211-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008c204d | (4 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x847, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_211:
	.word 0xe2ffe0ce  ! 313: SWAPA_I	swapa	%r17, [%r31 + 0x00ce] %asi
	.word 0x91d02034  ! 314: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe26fe0e5  ! 315: LDSTUB_I	ldstub	%r17, [%r31 + 0x00e5]
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_212
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_212:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 316: CASA_R	casa	[%r31] %asi, %r11, %r17
	setx 0x9be631e06e38e8af, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_213:
	.word 0x39400001  ! 317: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 318: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_10_214:
	setx 0x8cd5d661b3a8e930, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196b  ! 320: FqTOd	dis not found

memptr_10_216:
	set user_data_start, %r31
	.word 0x858133b7  ! 321: WRCCR_I	wr	%r4, 0x13b7, %ccr
memptr_10_217:
	set 0x60540000, %r31
	.word 0x8584fc7a  ! 322: WRCCR_I	wr	%r19, 0x1c7a, %ccr
donret_10_218:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_218-donret_10_218), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a1025a | (4 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xf16, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_218:
	.word 0xe4ffe0e6  ! 323: SWAPA_I	swapa	%r18, [%r31 + 0x00e6] %asi
	.word 0x95500000  ! 324: RDPR_TPC	<illegal instruction>
	.word 0xda6fe020  ! 325: LDSTUB_I	ldstub	%r13, [%r31 + 0x0020]
splash_lsu_10_219:
	set 0x5515f5a6, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 326: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902002  ! 327: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
pmu_10_220:
	nop
	setx 0xfffff20bfffff8d0, %g1, %g7
	.word 0xa3800007  ! 328: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa1a189d2  ! 329: FDIVd	fdivd	%f6, %f18, %f16
DS_10_221:
	.word 0xa9a089c4  ! 1: FDIVd	fdivd	%f2, %f4, %f20
	.word 0xbfe7c000  ! 330: SAVE_R	save	%r31, %r0, %r31
	.word 0xd46fe02f  ! 331: LDSTUB_I	ldstub	%r10, [%r31 + 0x002f]
	rd %pc, %r19
	add %r19, (ivw_10_222-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_222:
	.word 0x9193400a  ! 332: WRPR_PIL_R	wrpr	%r13, %r10, %pil
	.word 0xd43fc000  ! 333: STD_R	std	%r10, [%r31 + %r0]
change_to_randtl_10_223:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_223:
	.word 0x8f902000  ! 334: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	be,a	 skip_10_224
	fblg skip_10_224
.align 2048
skip_10_224:
	.word 0x24ccc001  ! 335: BRLEZ	brlez,a,pt	%r19,<label_0xcc001>
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_225
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_225
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_225:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 336: RDPC	rd	%pc, %r8
mondo_10_226:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d948008  ! 337: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
intveclr_10_227:
	setx 0xc37a955061aad04d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 338: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_10_228:
	nop
	setx 0xfffff540fffffb4b, %g1, %g7
	.word 0xa3800007  ! 339: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_229
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_229
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_229:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 340: RDPC	rd	%pc, %r10
	.word 0xab847680  ! 341: WR_CLEAR_SOFTINT_I	wr	%r17, 0x1680, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_230) + 24, 16, 16)) -> intp(4,0,23)
intvec_10_230:
	.word 0x39400001  ! 342: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8bfc020  ! 343: STDA_R	stda	%r20, [%r31 + %r0] 0x01
	setx 0x932df342decd4a89, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_231:
	.word 0x39400001  ! 344: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_10_232-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_232:
	.word 0x9193400d  ! 345: WRPR_PIL_R	wrpr	%r13, %r13, %pil
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 346: Tcc_R	tne	icc_or_xcc, %r0 + %r30
cwp_10_233:
    set user_data_start, %o7
	.word 0x93902003  ! 347: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6ca183  ! 348: SDIVX_I	sdivx	%r18, 0x0183, %r13
splash_cmpr_10_235:
	setx 0x1b3383a14562cc72, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 349: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_10_236:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 350: SAVE_R	save	%r31, %r0, %r31
	.word 0xd727e0a0  ! 351: STF_I	st	%f11, [0x00a0, %r31]
	.word 0x93a00171  ! 352: FABSq	dis not found

	.word 0x93d020b2  ! 353: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0xd6cfe010  ! 354: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
	.word 0x9f8020ff  ! 355: SIR	sir	0x00ff
	.word 0x97454000  ! 356: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
splash_cmpr_10_237:
	setx 0xb0719da938a5db3e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 357: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95a00164  ! 358: FABSq	dis not found

    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_238
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_238:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e003  ! 359: CASA_R	casa	[%r31] %asi, %r3, %r12
	.word 0x91454000  ! 360: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0x95450000  ! 361: RD_SET_SOFTINT	rd	%set_softint, %r10
	.word 0x99902002  ! 362: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xa5a00161  ! 363: FABSq	dis not found

debug_10_239:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 364: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d903e83  ! 365: WRPR_PSTATE_I	wrpr	%r0, 0x1e83, %pstate
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_240:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 366: CASA_R	casa	[%r31] %asi, %r7, %r16
intveclr_10_241:
	setx 0xd99dc6ed78aba44d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 367: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01973  ! 368: FqTOd	dis not found

	setx 0x90e404fed17723ee, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_243:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9b454000  ! 370: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
splash_hpstate_10_244:
	.word 0x819827cf  ! 371: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07cf, %hpstate
	.word 0xe497e020  ! 372: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r18
	.word 0xe4800b00  ! 373: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r18
pmu_10_245:
	nop
	setx 0xfffffc43fffff5f8, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_10_246-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_246:
	.word 0x91920000  ! 375: WRPR_PIL_R	wrpr	%r8, %r0, %pil
splash_cmpr_10_247:
	setx 0xb6bec62ede3c260f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 376: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_10_248:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d918011  ! 377: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
	.word 0xe49fe010  ! 378: LDDA_I	ldda	[%r31, + 0x0010] %asi, %r18
intveclr_10_249:
	setx 0x8677a9525775bae1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4c7e020  ! 380: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r18
memptr_10_250:
	set 0x60340000, %r31
	.word 0x85827f65  ! 381: WRCCR_I	wr	%r9, 0x1f65, %ccr
intveclr_10_251:
	setx 0x5c95ac8fca6976d7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 382: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_10_252:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_252:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_252
    nop
debug_wait10_252:
    ld [%r23], %r16
    brnz %r16, debug_wait10_252
    nop
    ba,a debug_startwait10_252
continue_debug_10_252:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_252:
    cmp %r13, %r17
    bne,a wait_for_stat_10_252
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_252:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_252
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %r17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00492  ! 383: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 384: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b4  ! 385: Tcc_I	ta	icc_or_xcc, %r0 + 180
intveclr_10_253:
	setx 0x733b975b24415ee7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_10_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 387: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_10_255:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d910012  ! 388: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
	.word 0x9545c000  ! 389: RD_TICK_CMPR_REG	rd	%-, %r10
mondo_10_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d900007  ! 390: WRPR_WSTATE_R	wrpr	%r0, %r7, %wstate
	setx 0x5fd6bfba42424a67, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_257:
	.word 0x39400001  ! 391: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01973  ! 392: FqTOd	dis not found

mondo_10_259:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d914011  ! 393: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
intveclr_10_260:
	setx 0x326cb7474f269369, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_10_261:
	nop
	setx 0xfffffedbfffffd5e, %g1, %g7
	.word 0xa3800007  ! 395: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_10_262:
	set 0x60540000, %r31
	.word 0x85852117  ! 396: WRCCR_I	wr	%r20, 0x0117, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_263)+16, 16, 16)) -> intp(10,1,3)
xir_10_263:
	.word 0xa9853b5a  ! 397: WR_SET_SOFTINT_I	wr	%r20, 0x1b5a, %set_softint
	.word 0x91540000  ! 398: RDPR_GL	<illegal instruction>
	brgz,pn  	%r12, skip_10_264
	brlez,pt  	%r8, skip_10_264
.align 32
skip_10_264:
	.word 0x39400001  ! 399: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0dfe000  ! 400: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
DS_8_1:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x97a449c6  ! 1: FDIVd	fdivd	%f48, %f6, %f42
	.word 0xa7a1082b  ! 1: FADDs	fadds	%f4, %f11, %f19
	.word 0x93d020b3  ! 2: Tcc_I	tne	icc_or_xcc, %r0 + 179
pmu_8_2:
	nop
	setx 0xfffffba8fffff250, %g1, %g7
	.word 0xa3800007  ! 3: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 4: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_3:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e009  ! 5: CASA_R	casa	[%r31] %asi, %r9, %r9
DS_8_4:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 6: SAVE_R	save	%r31, %r0, %r31
intveclr_8_5:
	setx 0x28e76a506b59f925, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_6
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_6
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_6:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 8: RDPC	rd	%pc, %r9
	rd %pc, %r19
	add %r19, (ivw_8_7-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_7:
	.word 0x9191c00a  ! 9: WRPR_PIL_R	wrpr	%r7, %r10, %pil
change_to_randtl_8_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_8:
	.word 0x8f902000  ! 10: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_8_9:
	setx 0x400ad5d4d89d3f87, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 11: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 12: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_8_10:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 13: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_8_11:
	.word 0x9ba289c8  ! 1: FDIVd	fdivd	%f10, %f8, %f44
	pdist %f18, %f26, %f10
	.word 0x95b50313  ! 14: ALIGNADDRESS	alignaddr	%r20, %r19, %r10
splash_hpstate_8_12:
	.word 0x81982bdd  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdd, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01966  ! 16: FqTOd	dis not found

    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_14
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_14:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e012  ! 17: CASA_R	casa	[%r31] %asi, %r18, %r9
	.word 0xd277e008  ! 18: STX_I	stx	%r9, [%r31 + 0x0008]
	.word 0x8d903bf0  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x1bf0, %pstate
DS_8_15:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa7b0c312  ! 20: ALIGNADDRESS	alignaddr	%r3, %r18, %r19
	.word 0xe807c000  ! 21: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0x97a109d3  ! 22: FDIVd	fdivd	%f4, %f50, %f42
	.word 0xd4c7e020  ! 23: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r10
debug_8_16:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 24: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_17:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e006  ! 25: CASA_R	casa	[%r31] %asi, %r6, %r10
memptr_8_18:
	set user_data_start, %r31
	.word 0x8584e109  ! 26: WRCCR_I	wr	%r19, 0x0109, %ccr
mondo_8_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d914007  ! 27: WRPR_WSTATE_R	wrpr	%r5, %r7, %wstate
	.word 0x3a700001  ! 28: BPCC	<illegal instruction>
	.word 0xd537c000  ! 29: STQF_R	-	%f10, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_20
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_20:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 30: RDPC	rd	%pc, %r8
	.word 0xa9a00172  ! 31: FABSq	dis not found

splash_cmpr_8_21:
	setx 0x91bd916f15b62a20, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 32: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd697e000  ! 33: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
	.word 0x91d02032  ! 34: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_hpstate_8_22:
	.word 0x81982e8e  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8e, %hpstate
	.word 0xd66fe0ac  ! 36: LDSTUB_I	ldstub	%r11, [%r31 + 0x00ac]
splash_cmpr_8_23:
	setx 0x27585b6f213b0c4c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 37: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_8_24:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 38: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	.word 0xad84375d  ! 39: WR_SOFTINT_REG_I	wr	%r16, 0x175d, %softint
	.word 0xd66fe0e8  ! 40: LDSTUB_I	ldstub	%r11, [%r31 + 0x00e8]
intveclr_8_25:
	setx 0xfa75e297bb66540e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 41: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902e00  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x0e00, %pstate
	.word 0xd737c000  ! 43: STQF_R	-	%f11, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_26
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_26:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 44: RDPC	rd	%pc, %r11
mondo_8_27:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d934010  ! 45: WRPR_WSTATE_R	wrpr	%r13, %r16, %wstate
	.word 0x26800001  ! 46: BL	bl,a	<label_0x1>
	.word 0xd48008a0  ! 47: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_8_28:
	set 0x55d33f93, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 48: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_8_29:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 49: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x97a00173  ! 50: FABSq	dis not found

	.word 0xe68008a0  ! 51: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
splash_tba_8_30:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 52: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d903449  ! 53: WRPR_PSTATE_I	wrpr	%r0, 0x1449, %pstate
DS_8_31:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 54: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_32) + 40, 16, 16)) -> intp(5,0,12)
intvec_8_32:
	.word 0x39400001  ! 55: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x3b78c8c72421b130, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_33:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_8_34:
	nop
	setx 0xfffff9f2fffff653, %g1, %g7
	.word 0xa3800007  ! 57: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_8_35:
	setx 0xf7736be18097cd4f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936c37d1  ! 59: SDIVX_I	sdivx	%r16, 0xfffff7d1, %r9
splash_cmpr_8_37:
	setx 0xa7f108c1b3dfaf3c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 60: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_38) + 0, 16, 16)) -> intp(7,0,3)
intvec_8_38:
	.word 0x39400001  ! 61: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5a109ca  ! 62: FDIVd	fdivd	%f4, %f10, %f18
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_39:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e004  ! 63: CASA_R	casa	[%r31] %asi, %r4, %r9
	.word 0xd2800ac0  ! 64: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956af4a1  ! 65: SDIVX_I	sdivx	%r11, 0xfffff4a1, %r10
	.word 0x24c90001  ! 66: BRLEZ	brlez,a,pt	%r4,<label_0x90001>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_42:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e007  ! 67: CASA_R	casa	[%r31] %asi, %r7, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01962  ! 68: FqTOd	dis not found

intveclr_8_44:
	setx 0x986cf0ec9cab6795, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_8_45:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x9bb4c30d  ! 70: ALIGNADDRESS	alignaddr	%r19, %r13, %r13
	.word 0xe937c000  ! 71: STQF_R	-	%f20, [%r0, %r31]
	rd %pc, %r19
	add %r19, (ivw_8_46-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_46:
	.word 0x9191c00d  ! 72: WRPR_PIL_R	wrpr	%r7, %r13, %pil
change_to_randtl_8_47:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_47:
	.word 0x8f902000  ! 73: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_8_48:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 74: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0x95a00171  ! 75: FABSq	dis not found

splash_tba_8_49:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 76: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x24c8c001  ! 77: BRLEZ	brlez,a,pt	%r3,<label_0x8c001>
	.word 0xd2c7e000  ! 78: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r9
	setx 0x3613c4aee9e79479, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_51:
	.word 0x39400001  ! 79: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_8_52:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_52-donret_8_52), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f8bce9 | (22 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xf17, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_52:
	.word 0xd2ffe064  ! 80: SWAPA_I	swapa	%r9, [%r31 + 0x0064] %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996a6ba6  ! 81: SDIVX_I	sdivx	%r9, 0x0ba6, %r12
mondo_8_54:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d924012  ! 82: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
	.word 0x95a089d3  ! 83: FDIVd	fdivd	%f2, %f50, %f10
intveclr_8_56:
	setx 0x3a28383b35d7e301, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 84: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91454000  ! 85: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
intveclr_8_57:
	setx 0xa575f3bcce5b5a60, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97a209c0  ! 87: FDIVd	fdivd	%f8, %f0, %f42
debug_8_58:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 88: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x47ff604ddeab282c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_59:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_8_60:
	set user_data_start, %r31
	.word 0x85853d9c  ! 90: WRCCR_I	wr	%r20, 0x1d9c, %ccr
tagged_8_61:
	taddcctv %r26, 0x19df, %r8
	.word 0xd807e064  ! 91: LDUW_I	lduw	[%r31 + 0x0064], %r12
	.word 0xd927e084  ! 92: STF_I	st	%f12, [0x0084, %r31]
splash_cmpr_8_62:
	setx 0x5aa51e549831f073, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 93: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_8_63:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 94: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
DS_8_64:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe932f11b  ! 1: STQF_I	-	%f20, [0x111b, %r11]
	normalw
	.word 0xa7458000  ! 95: RD_SOFTINT_REG	rd	%softint, %r19
	setx 0x3fa9411c51890a04, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_65:
	.word 0x39400001  ! 96: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe050  ! 97: LDSTUB_I	ldstub	%r17, [%r31 + 0x0050]
	.word 0xa7520000  ! 98: RDPR_PIL	rdpr	%pil, %r19
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_66
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_66:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 99: RDPC	rd	%pc, %r13
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 100: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 101: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x97480000  ! 102: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xe26fe045  ! 103: LDSTUB_I	ldstub	%r17, [%r31 + 0x0045]
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_67
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_67:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 104: RDPC	rd	%pc, %r19
	.word 0x91d02033  ! 105: Tcc_I	ta	icc_or_xcc, %r0 + 51
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_68
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_68:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 106: RDPC	rd	%pc, %r10
mondo_8_69:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d91c00b  ! 107: WRPR_WSTATE_R	wrpr	%r7, %r11, %wstate
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
	.word 0x99414000  ! 108: RDPC	rd	%pc, %r12
	.word 0x9f80278f  ! 109: SIR	sir	0x078f
splash_cmpr_8_71:
	setx 0x1bc2a517fdb60b0b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 110: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 111: LDX_R	ldx	[%r31 + %r0], %r19
intveclr_8_72:
	setx 0x06c9f2df0b5156cb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_73
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_73:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 113: CASA_R	casa	[%r31] %asi, %r3, %r19
	.word 0x2e800001  ! 114: BVS	bvs,a	<label_0x1>
pmu_8_74:
	nop
	setx 0xfffff105fffff86d, %g1, %g7
	.word 0xa3800007  ! 115: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_8_75:
    set user_data_start, %o7
	.word 0x93902005  ! 116: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01972  ! 117: FqTOd	dis not found

change_to_randtl_8_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_77:
	.word 0x8f902001  ! 118: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xda6fe079  ! 119: LDSTUB_I	ldstub	%r13, [%r31 + 0x0079]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56b33b0  ! 120: SDIVX_I	sdivx	%r12, 0xfffff3b0, %r18
intveclr_8_79:
	setx 0xb83d8bd1005c229d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 121: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_80:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 122: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa969a040  ! 123: SDIVX_I	sdivx	%r6, 0x0040, %r20
splash_tba_8_82:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 124: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x34800001  ! 125: BG	bg,a	<label_0x1>
	.word 0xa5a00174  ! 126: FABSq	dis not found

DS_8_83:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x99a0054a  ! 1: FSQRTd	fsqrt	
	.word 0x95a4c820  ! 127: FADDs	fadds	%f19, %f0, %f10
	rd %pc, %r19
	add %r19, (ivw_8_84-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_84:
	.word 0x91920009  ! 128: WRPR_PIL_R	wrpr	%r8, %r9, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01966  ! 129: FqTOd	dis not found

DS_8_86:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f6, %f26, %f30
	.word 0x99b00300  ! 130: ALIGNADDRESS	alignaddr	%r0, %r0, %r12
DS_8_87:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd332f4e4  ! 1: STQF_I	-	%f9, [0x14e4, %r11]
	normalw
	.word 0xa3458000  ! 131: RD_SOFTINT_REG	rd	%softint, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_88) + 56, 16, 16)) -> intp(4,0,30)
intvec_8_88:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_8_89:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 133: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 134: LDX_R	ldx	[%r31 + %r0], %r9
donret_8_90:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_90-donret_8_90), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0019f61e | (0x58 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x58d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_90:
	.word 0xd2ffe0e8  ! 135: SWAPA_I	swapa	%r9, [%r31 + 0x00e8] %asi
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_91
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_91:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 136: CASA_R	casa	[%r31] %asi, %r17, %r9
debug_8_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 137: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 138: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd21fc000  ! 139: LDD_R	ldd	[%r31 + %r0], %r9
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_93
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_93
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_93:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 140: RDPC	rd	%pc, %r10
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_94
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_94:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 141: CASA_R	casa	[%r31] %asi, %r17, %r13
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_95
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_95:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 142: RDPC	rd	%pc, %r18
	.word 0xa7480000  ! 143: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0xa7a0c9c3  ! 144: FDIVd	fdivd	%f34, %f34, %f50
mondo_8_96:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d90800a  ! 145: WRPR_WSTATE_R	wrpr	%r2, %r10, %wstate
pmu_8_97:
	nop
	setx 0xfffff97afffff8d7, %g1, %g7
	.word 0xa3800007  ! 146: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_8_98:
	setx 0xd029f2cff087df29, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 147: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5a309c7  ! 148: FDIVd	fdivd	%f12, %f38, %f18
intveclr_8_99:
	setx 0x5a9ddee2dce2e893, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 149: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_8_100:
	setx 0x829f4690151b6f97, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_101
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_101:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 151: RDPC	rd	%pc, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_102) + 56, 16, 16)) -> intp(0,0,20)
intvec_8_102:
	.word 0x39400001  ! 152: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x3e800001  ! 153: BVC	bvc,a	<label_0x1>
	.word 0x3c700001  ! 154: BPPOS	<illegal instruction>
	.word 0x91a0c9cd  ! 155: FDIVd	fdivd	%f34, %f44, %f8
	.word 0xe26fe045  ! 156: LDSTUB_I	ldstub	%r17, [%r31 + 0x0045]
	.word 0x91d02032  ! 157: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe23fe07c  ! 158: STD_I	std	%r17, [%r31 + 0x007c]
	.word 0xa984000a  ! 159: WR_SET_SOFTINT_R	wr	%r16, %r10, %set_softint
	.word 0x95a00170  ! 160: FABSq	dis not found

    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_104:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00a  ! 161: CASA_R	casa	[%r31] %asi, %r10, %r12
	rd %pc, %r19
	add %r19, (ivw_8_105-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_105:
	.word 0x91904009  ! 162: WRPR_PIL_R	wrpr	%r1, %r9, %pil
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_106:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 163: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0xd8cfe030  ! 164: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa769658f  ! 165: SDIVX_I	sdivx	%r5, 0x058f, %r19
	.word 0x99480000  ! 166: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
pmu_8_108:
	nop
	setx 0xfffffed0fffff5c4, %g1, %g7
	.word 0xa3800007  ! 167: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99a249cb  ! 168: FDIVd	fdivd	%f40, %f42, %f12
intveclr_8_110:
	setx 0xcc0beeb946da9a33, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 169: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_8_111:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 170: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_8_112:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 171: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_8_113:
	setx 0xf71d44597cda4373, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_8_114:
	set 0x55d3bdf1, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 173: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd84fe0c2  ! 174: LDSB_I	ldsb	[%r31 + 0x00c2], %r12
debug_8_115:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 175: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa784000d  ! 176: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r13, %-
mondo_8_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d90c00c  ! 177: WRPR_WSTATE_R	wrpr	%r3, %r12, %wstate
	.word 0xd89fe043  ! 178: LDDA_I	ldda	[%r31, + 0x0043] %asi, %r12
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 179: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_8_118:
	setx 0x2ca7aa753823abff, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 181: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
debug_8_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 182: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_120) + 0, 16, 16)) -> intp(6,0,14)
intvec_8_120:
	.word 0x39400001  ! 183: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_8_121-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_121:
	.word 0x9194c003  ! 184: WRPR_PIL_R	wrpr	%r19, %r3, %pil
splash_hpstate_8_122:
	.word 0x8198280e  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080e, %hpstate
debug_8_123:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 186: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
splash_cmpr_8_124:
	setx 0x79d477914f6de43a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 187: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd86fe0d0  ! 188: LDSTUB_I	ldstub	%r12, [%r31 + 0x00d0]
splash_cmpr_8_125:
	setx 0x15a9e367fbadd864, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 189: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_126
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_126:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 190: RDPC	rd	%pc, %r10
	.word 0xd727e084  ! 191: STF_I	st	%f11, [0x0084, %r31]
splash_cmpr_8_127:
	setx 0x4b844c622a85cb7b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_8_128:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d924014  ! 193: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
DS_8_129:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 194: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 195: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_8_130:
	setx 0xcccd0c2308182b91, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2c800001  ! 197: BNEG	bneg,a	<label_0x1>
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
	.word 0xd7e7e012  ! 198: CASA_R	casa	[%r31] %asi, %r18, %r11
intveclr_8_132:
	setx 0xbc29195401575af0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_8_133:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 200: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_8_134:
	.word 0x81982407  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0407, %hpstate
change_to_randtl_8_135:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_135:
	.word 0x8f902002  ! 202: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_136)+56, 16, 16)) -> intp(8,1,3)
xir_8_136:
	.word 0xa980f108  ! 203: WR_SET_SOFTINT_I	wr	%r3, 0x1108, %set_softint
	rd %pc, %r19
	add %r19, (ivw_8_137-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_137:
	.word 0x91930012  ! 204: WRPR_PIL_R	wrpr	%r12, %r18, %pil
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01967  ! 205: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93687b81  ! 206: SDIVX_I	sdivx	%r1, 0xfffffb81, %r9
splash_cmpr_8_140:
	setx 0xfeaa1a321d5e52dd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_8_141:
	setx 0xb34169655ca6f6c1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96b7b2e  ! 209: SDIVX_I	sdivx	%r13, 0xfffffb2e, %r20
donret_8_143:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_143-donret_8_143-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00627ba4 | (0x58 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x846, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_143:
	.word 0xe4ffe0a4  ! 210: SWAPA_I	swapa	%r18, [%r31 + 0x00a4] %asi
debug_8_144:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 211: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6abb68  ! 212: SDIVX_I	sdivx	%r10, 0xfffffb68, %r13
DS_8_146:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 213: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 214: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 215: BLEU	bleu,a	<label_0x1>
	.word 0xd337c000  ! 216: STQF_R	-	%f9, [%r0, %r31]
	.word 0x39400001  ! 217: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe06fe0b5  ! 218: LDSTUB_I	ldstub	%r16, [%r31 + 0x00b5]
intveclr_8_148:
	setx 0x3ea1b687617b5f44, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 220: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_8_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d90800b  ! 221: WRPR_WSTATE_R	wrpr	%r2, %r11, %wstate
intveclr_8_150:
	setx 0x45d948d1801d1a44, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 222: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe06fe0ac  ! 223: LDSTUB_I	ldstub	%r16, [%r31 + 0x00ac]
	setx 0x54cc9145d71933fa, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_151:
	.word 0x39400001  ! 224: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_8_152:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 225: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02035  ! 226: Tcc_I	ta	icc_or_xcc, %r0 + 53
intveclr_8_153:
	setx 0xee1e03699e5b43a2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 227: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_8_154:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_154-donret_8_154), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00323ab3 | (0x83 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xd9d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_154:
	.word 0xe0ffe0be  ! 228: SWAPA_I	swapa	%r16, [%r31 + 0x00be] %asi
pmu_8_155:
	nop
	setx 0xfffff88cfffff1ad, %g1, %g7
	.word 0xa3800007  ! 229: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_8_156:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 230: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
debug_8_157:
	nop
	.word 0xe6f00b12  ! 231: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_8_158:
	setx 0xc6ed27d2854e0e82, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 232: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_8_159:
	setx 0x32f5b7e4facb1d11, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 233: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 234: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xe0d7e030  ! 235: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
mondo_8_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d940009  ! 236: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
memptr_8_161:
	set 0x60540000, %r31
	.word 0x8581b8a7  ! 237: WRCCR_I	wr	%r6, 0x18a7, %ccr
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_162:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 238: CASA_R	casa	[%r31] %asi, %r7, %r16
splash_cmpr_8_163:
	setx 0x749764634d29123c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 239: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96cfc17  ! 240: SDIVX_I	sdivx	%r19, 0xfffffc17, %r20
memptr_8_165:
	set user_data_start, %r31
	.word 0x858530f9  ! 241: WRCCR_I	wr	%r20, 0x10f9, %ccr
	.word 0x8d9031b6  ! 242: WRPR_PSTATE_I	wrpr	%r0, 0x11b6, %pstate
splash_lsu_8_166:
	set 0x5535dfa2, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 243: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x25e769bc786d5f0e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_167:
	.word 0x39400001  ! 244: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9ba0016a  ! 245: FABSq	dis not found

	.word 0xe627e0b3  ! 246: STW_I	stw	%r19, [%r31 + 0x00b3]
	rd %pc, %r19
	add %r19, (ivw_8_168-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_168:
	.word 0x9190800b  ! 247: WRPR_PIL_R	wrpr	%r2, %r11, %pil
	.word 0x8d902660  ! 248: WRPR_PSTATE_I	wrpr	%r0, 0x0660, %pstate
donret_8_169:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_169-donret_8_169-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001dfecc | (16 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x49c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_169:
	.word 0xe6ffe078  ! 249: SWAPA_I	swapa	%r19, [%r31 + 0x0078] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_170) + 32, 16, 16)) -> intp(4,0,18)
intvec_8_170:
	.word 0x39400001  ! 250: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_8_171:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_171-donret_8_171-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002e0871 | (0x82 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xcdc, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_171:
	.word 0xe6ffe029  ! 251: SWAPA_I	swapa	%r19, [%r31 + 0x0029] %asi
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_172
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_172:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e005  ! 252: CASA_R	casa	[%r31] %asi, %r5, %r19
splash_cmpr_8_173:
	setx 0xeb5a301c8a4c2562, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe62fe0d0  ! 254: STB_I	stb	%r19, [%r31 + 0x00d0]
    set 0x320, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b247f1  ! 255: PDISTN	fmean16	%d40, %d48, %d42
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_174
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_174:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 256: CASA_R	casa	[%r31] %asi, %r11, %r11
	rd %pc, %r19
	add %r19, (ivw_8_175-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_175:
	.word 0x91910000  ! 257: WRPR_PIL_R	wrpr	%r4, %r0, %pil
splash_hpstate_8_176:
	.word 0x81982a5d  ! 258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5d, %hpstate
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
	.word 0x93414000  ! 259: RDPC	rd	%pc, %r9
intveclr_8_178:
	setx 0x8afed8db64490654, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 260: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_179:
	setx 0x00a85ecb6fa8c94c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 261: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd2d7e010  ! 262: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r9
memptr_8_180:
	set user_data_start, %r31
	.word 0x8582aea9  ! 263: WRCCR_I	wr	%r10, 0x0ea9, %ccr
pmu_8_181:
	nop
	setx 0xfffffb6cfffff9a1, %g1, %g7
	.word 0xa3800007  ! 264: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd337c000  ! 265: STQF_R	-	%f9, [%r0, %r31]
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
	.word 0xa3414000  ! 266: RDPC	rd	%pc, %r17
DS_8_183:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x93a4c9d2  ! 1: FDIVd	fdivd	%f50, %f18, %f40
	.word 0xa7a00551  ! 1: FSQRTd	fsqrt	
	.word 0x91a28834  ! 267: FADDs	fadds	%f10, %f20, %f8
donret_8_184:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_184-donret_8_184), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007cb6bd | (0x55 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xfce, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_184:
	.word 0xe8ffe0c8  ! 268: SWAPA_I	swapa	%r20, [%r31 + 0x00c8] %asi
	.word 0x91464000  ! 269: RD_STICK_CMPR_REG	rd	%-, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01965  ! 270: FqTOd	dis not found

debug_8_186:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 271: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_187
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_187
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_187:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 272: RDPC	rd	%pc, %r12
debug_8_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 273: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_189:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 274: RDPC	rd	%pc, %r17
	.word 0xd897e030  ! 275: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
	.word 0x34800001  ! 276: BG	bg,a	<label_0x1>
	.word 0x99520000  ! 277: RDPR_PIL	<illegal instruction>
	.word 0xda6fe04f  ! 278: LDSTUB_I	ldstub	%r13, [%r31 + 0x004f]
splash_htba_8_190:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 279: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x32700001  ! 280: BPNE	<illegal instruction>
tagged_8_191:
	taddcctv %r18, 0x102d, %r26
	.word 0xda07e0c6  ! 281: LDUW_I	lduw	[%r31 + 0x00c6], %r13
intveclr_8_192:
	setx 0xbd33853de3ad340e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 282: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x28800001  ! 283: BLEU	bleu,a	<label_0x1>
	.word 0x95464000  ! 284: RD_STICK_CMPR_REG	rd	%-, %r10
intveclr_8_193:
	setx 0xb9688bf2c33f34fa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 285: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd117c000  ! 286: LDQF_R	-	[%r31, %r0], %f8
	.word 0x9b45c000  ! 287: RD_TICK_CMPR_REG	rd	%-, %r13
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_194
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_194:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 288: CASA_R	casa	[%r31] %asi, %r0, %r10
debug_8_195:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 289: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
intveclr_8_196:
	setx 0xcf70fb11c0b69e3a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_197:
	setx 0x8071c476266bc0cd, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 291: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 292: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x99902005  ! 293: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
mondo_8_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d900012  ! 294: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
splash_cmpr_8_199:
	setx 0x73fedfa793499304, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd46fe086  ! 296: LDSTUB_I	ldstub	%r10, [%r31 + 0x0086]
	.word 0x9f8026d8  ! 297: SIR	sir	0x06d8
	.word 0x9b480000  ! 298: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_200) + 16, 16, 16)) -> intp(7,0,4)
intvec_8_200:
	.word 0x39400001  ! 299: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_8_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d920011  ! 300: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
	.word 0xd727c000  ! 301: STF_R	st	%f11, [%r0, %r31]
mondo_8_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d94c011  ! 302: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
debug_8_203:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 303: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_8_204:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d910010  ! 304: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
intveclr_8_205:
	setx 0xff9ef8204455472e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 305: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01968  ! 306: FqTOd	dis not found

pmu_8_207:
	nop
	setx 0xfffff0f3fffffc34, %g1, %g7
	.word 0xa3800007  ! 307: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_8_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d94800a  ! 308: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
	.word 0x91933f67  ! 309: WRPR_PIL_I	wrpr	%r12, 0x1f67, %pil
	.word 0x8d902de8  ! 310: WRPR_PSTATE_I	wrpr	%r0, 0x0de8, %pstate
splash_lsu_8_209:
	set 0x553ab2c1, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
	.word 0x99414000  ! 312: RDPC	rd	%pc, %r12
donret_8_211:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_211-donret_8_211-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0067e192 | (0x8a << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xac6, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_211:
	.word 0xe2ffe08c  ! 313: SWAPA_I	swapa	%r17, [%r31 + 0x008c] %asi
	.word 0x91d020b2  ! 314: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xe26fe0e4  ! 315: LDSTUB_I	ldstub	%r17, [%r31 + 0x00e4]
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_212
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_212:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 316: CASA_R	casa	[%r31] %asi, %r11, %r17
	setx 0x542c318e5c42244e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_213:
	.word 0x39400001  ! 317: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_8_214:
	setx 0x329176f9ed071867, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01960  ! 320: FqTOd	dis not found

memptr_8_216:
	set user_data_start, %r31
	.word 0x8584f059  ! 321: WRCCR_I	wr	%r19, 0x1059, %ccr
memptr_8_217:
	set 0x60740000, %r31
	.word 0x8582a9b9  ! 322: WRCCR_I	wr	%r10, 0x09b9, %ccr
donret_8_218:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_218-donret_8_218), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00214ae4 | (0x8b << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x81e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_218:
	.word 0xe4ffe040  ! 323: SWAPA_I	swapa	%r18, [%r31 + 0x0040] %asi
	.word 0x95500000  ! 324: RDPR_TPC	<illegal instruction>
	.word 0xda6fe023  ! 325: LDSTUB_I	ldstub	%r13, [%r31 + 0x0023]
splash_lsu_8_219:
	set 0x55e79e4c, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 326: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902005  ! 327: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
pmu_8_220:
	nop
	setx 0xfffff026fffff5b4, %g1, %g7
	.word 0xa3800007  ! 328: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa5a049c1  ! 329: FDIVd	fdivd	%f32, %f32, %f18
DS_8_221:
	.word 0x99a009d2  ! 1: FDIVd	fdivd	%f0, %f18, %f12
	.word 0xbfe7c000  ! 330: SAVE_R	save	%r31, %r0, %r31
	.word 0xd46fe05a  ! 331: LDSTUB_I	ldstub	%r10, [%r31 + 0x005a]
	rd %pc, %r19
	add %r19, (ivw_8_222-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_222:
	.word 0x91940014  ! 332: WRPR_PIL_R	wrpr	%r16, %r20, %pil
	.word 0xd43fc000  ! 333: STD_R	std	%r10, [%r31 + %r0]
change_to_randtl_8_223:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_223:
	.word 0x8f902003  ! 334: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x24cb4001  ! 335: BRLEZ	brlez,a,pt	%r13,<label_0xb4001>
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_225
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_225
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_225:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 336: RDPC	rd	%pc, %r11
mondo_8_226:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d94400a  ! 337: WRPR_WSTATE_R	wrpr	%r17, %r10, %wstate
intveclr_8_227:
	setx 0x9916c01ff132dd9e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 338: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_8_228:
	nop
	setx 0xfffffe5cfffff457, %g1, %g7
	.word 0xa3800007  ! 339: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_229
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_229
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_229:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 340: RDPC	rd	%pc, %r13
	.word 0xab85236c  ! 341: WR_CLEAR_SOFTINT_I	wr	%r20, 0x036c, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_230) + 48, 16, 16)) -> intp(6,0,10)
intvec_8_230:
	.word 0x39400001  ! 342: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8bfc020  ! 343: STDA_R	stda	%r20, [%r31 + %r0] 0x01
	setx 0x3442c69174859c01, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_231:
	.word 0x39400001  ! 344: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_8_232-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_232:
	.word 0x91928014  ! 345: WRPR_PIL_R	wrpr	%r10, %r20, %pil
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 346: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cwp_8_233:
    set user_data_start, %o7
	.word 0x93902001  ! 347: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b69b15c  ! 348: SDIVX_I	sdivx	%r6, 0xfffff15c, %r13
splash_cmpr_8_235:
	setx 0x42eb05a31fd9a61f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 349: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_8_236:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 350: SAVE_R	save	%r31, %r0, %r31
	.word 0xd727e031  ! 351: STF_I	st	%f11, [0x0031, %r31]
	.word 0x91a0016b  ! 352: FABSq	dis not found

	.word 0x91d02033  ! 353: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd6cfe020  ! 354: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
	.word 0x9f8032d7  ! 355: SIR	sir	0x12d7
	.word 0xa3454000  ! 356: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
splash_cmpr_8_237:
	setx 0x626ca508da0b867e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 357: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91a00173  ! 358: FABSq	dis not found

    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_238
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_238:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e003  ! 359: CASA_R	casa	[%r31] %asi, %r3, %r12
	.word 0x95454000  ! 360: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	.word 0x91450000  ! 361: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0x99902000  ! 362: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x97a00166  ! 363: FABSq	dis not found

debug_8_239:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 364: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d903c2e  ! 365: WRPR_PSTATE_I	wrpr	%r0, 0x1c2e, %pstate
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_240:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 366: CASA_R	casa	[%r31] %asi, %r7, %r16
intveclr_8_241:
	setx 0xe2f08f0c294dddc1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 367: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01960  ! 368: FqTOd	dis not found

	setx 0x2a5ac8a66f9197ce, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_243:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97454000  ! 370: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
splash_hpstate_8_244:
	.word 0x81982dd7  ! 371: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd7, %hpstate
	.word 0xe497e000  ! 372: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0xe48008a0  ! 373: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
pmu_8_245:
	nop
	setx 0xfffffd64fffff40f, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_8_246-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_246:
	.word 0x9195000d  ! 375: WRPR_PIL_R	wrpr	%r20, %r13, %pil
splash_cmpr_8_247:
	setx 0x543d6b0153d1ae8b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 376: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_8_248:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d91000a  ! 377: WRPR_WSTATE_R	wrpr	%r4, %r10, %wstate
	.word 0xe49fe0f8  ! 378: LDDA_I	ldda	[%r31, + 0x00f8] %asi, %r18
intveclr_8_249:
	setx 0x0730fdcabf61f678, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4c7e020  ! 380: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r18
memptr_8_250:
	set 0x60340000, %r31
	.word 0x85833519  ! 381: WRCCR_I	wr	%r12, 0x1519, %ccr
intveclr_8_251:
	setx 0xf56e283b5df24e28, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 382: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_8_252:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 383: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 384: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 385: Tcc_I	ta	icc_or_xcc, %r0 + 53
intveclr_8_253:
	setx 0xae3c36890d523ddf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_8_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 387: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_8_255:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d944012  ! 388: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	.word 0x9745c000  ! 389: RD_TICK_CMPR_REG	rd	%-, %r11
mondo_8_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d944002  ! 390: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
	setx 0x646080b49c3dc2a6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_257:
	.word 0x39400001  ! 391: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01966  ! 392: FqTOd	dis not found

mondo_8_259:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d920014  ! 393: WRPR_WSTATE_R	wrpr	%r8, %r20, %wstate
intveclr_8_260:
	setx 0x8d001ffa386a5d35, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_8_261:
	nop
	setx 0xfffffe2ffffff3bf, %g1, %g7
	.word 0xa3800007  ! 395: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_8_262:
	set 0x60540000, %r31
	.word 0x85823d97  ! 396: WRCCR_I	wr	%r8, 0x1d97, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_263)+56, 16, 16)) -> intp(8,1,3)
xir_8_263:
	.word 0xa982265a  ! 397: WR_SET_SOFTINT_I	wr	%r8, 0x065a, %set_softint
	.word 0xa1540000  ! 398: RDPR_GL	<illegal instruction>
	.word 0x24cd0001  ! 399: BRLEZ	brlez,a,pt	%r20,<label_0xd0001>
	.word 0xd0dfe030  ! 400: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
DS_4_1:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x99a249c6  ! 1: FDIVd	fdivd	%f40, %f6, %f12
	.word 0x9ba2482d  ! 1: FADDs	fadds	%f9, %f13, %f13
	.word 0x91d02034  ! 2: Tcc_I	ta	icc_or_xcc, %r0 + 52
pmu_4_2:
	nop
	setx 0xfffffd75fffff27d, %g1, %g7
	.word 0xa3800007  ! 3: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 4: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_3:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e009  ! 5: CASA_R	casa	[%r31] %asi, %r9, %r9
DS_4_4:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 6: SAVE_R	save	%r31, %r0, %r31
intveclr_4_5:
	setx 0x69b1a02c44e9063f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_6
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_6
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_6:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 8: RDPC	rd	%pc, %r20
	rd %pc, %r19
	add %r19, (ivw_4_7-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_7:
	.word 0x9190c007  ! 9: WRPR_PIL_R	wrpr	%r3, %r7, %pil
change_to_randtl_4_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_8:
	.word 0x8f902002  ! 10: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_4_9:
	setx 0xf1f36c51e7021dda, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 11: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 12: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_htba_4_10:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 13: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_4_11:
	.word 0x93a449c0  ! 1: FDIVd	fdivd	%f48, %f0, %f40
	pdist %f12, %f6, %f8
	.word 0xa5b4030b  ! 14: ALIGNADDRESS	alignaddr	%r16, %r11, %r18
splash_hpstate_4_12:
	.word 0x81982a94  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a94, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01973  ! 16: FqTOd	dis not found

    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_14
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_14:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e012  ! 17: CASA_R	casa	[%r31] %asi, %r18, %r9
	.word 0xd277e0c1  ! 18: STX_I	stx	%r9, [%r31 + 0x00c1]
	.word 0x8d9020a9  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x00a9, %pstate
DS_4_15:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa3b0c309  ! 20: ALIGNADDRESS	alignaddr	%r3, %r9, %r17
	.word 0xe807c000  ! 21: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0x91a409cc  ! 22: FDIVd	fdivd	%f16, %f12, %f8
	.word 0xd4c7e030  ! 23: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
debug_4_16:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 24: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_17:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e006  ! 25: CASA_R	casa	[%r31] %asi, %r6, %r10
memptr_4_18:
	set user_data_start, %r31
	.word 0x85853cba  ! 26: WRCCR_I	wr	%r20, 0x1cba, %ccr
mondo_4_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d91c001  ! 27: WRPR_WSTATE_R	wrpr	%r7, %r1, %wstate
	.word 0x3a700001  ! 28: BPCC	<illegal instruction>
	.word 0xd537c000  ! 29: STQF_R	-	%f10, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_20
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_20:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 30: RDPC	rd	%pc, %r8
	.word 0x97a00170  ! 31: FABSq	dis not found

splash_cmpr_4_21:
	setx 0xea5d5d3587551bdc, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 32: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd697e020  ! 33: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r11
	.word 0x91d020b5  ! 34: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_hpstate_4_22:
	.word 0x81982146  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0146, %hpstate
	.word 0xd66fe03f  ! 36: LDSTUB_I	ldstub	%r11, [%r31 + 0x003f]
splash_cmpr_4_23:
	setx 0xea3d3f34a6e87fbf, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 37: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_24:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 38: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0xad816ffb  ! 39: WR_SOFTINT_REG_I	wr	%r5, 0x0ffb, %softint
	.word 0xd66fe05c  ! 40: LDSTUB_I	ldstub	%r11, [%r31 + 0x005c]
intveclr_4_25:
	setx 0x955d65f3d4d2246b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 41: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9022fa  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x02fa, %pstate
	.word 0xd737c000  ! 43: STQF_R	-	%f11, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_26
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_26:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 44: RDPC	rd	%pc, %r8
mondo_4_27:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d91c007  ! 45: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
	.word 0x26800001  ! 46: BL	bl,a	<label_0x1>
	.word 0xd4800b60  ! 47: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r10
splash_lsu_4_28:
	set 0x5506c021, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 48: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_4_29:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 49: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91a00172  ! 50: FABSq	dis not found

	.word 0xe6800c00  ! 51: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r19
splash_tba_4_30:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 52: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d903495  ! 53: WRPR_PSTATE_I	wrpr	%r0, 0x1495, %pstate
DS_4_31:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 54: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_32) + 0, 16, 16)) -> intp(1,0,20)
intvec_4_32:
	.word 0x39400001  ! 55: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x94af31e2a9917ce2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_33:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_4_34:
	nop
	setx 0xfffff348fffffa48, %g1, %g7
	.word 0xa3800007  ! 57: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_4_35:
	setx 0x095fefdfc44fb7d2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6a3996  ! 59: SDIVX_I	sdivx	%r8, 0xfffff996, %r13
splash_cmpr_4_37:
	setx 0x2e7432c11003a72e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 60: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_38) + 8, 16, 16)) -> intp(3,0,31)
intvec_4_38:
	.word 0x39400001  ! 61: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a449c7  ! 62: FDIVd	fdivd	%f48, %f38, %f50
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_39:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e004  ! 63: CASA_R	casa	[%r31] %asi, %r4, %r9
	.word 0xd28008a0  ! 64: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996b3573  ! 65: SDIVX_I	sdivx	%r12, 0xfffff573, %r12
	bleu,a	 skip_4_41
	brlez,a,pn	%r8, skip_4_41
.align 512
skip_4_41:
	.word 0x39400001  ! 66: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_42:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e007  ! 67: CASA_R	casa	[%r31] %asi, %r7, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01969  ! 68: FqTOd	dis not found

intveclr_4_44:
	setx 0x233e150e8b5db0aa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_4_45:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x99b1c307  ! 70: ALIGNADDRESS	alignaddr	%r7, %r7, %r12
	.word 0xe937c000  ! 71: STQF_R	-	%f20, [%r0, %r31]
	rd %pc, %r19
	add %r19, (ivw_4_46-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_46:
	.word 0x91940003  ! 72: WRPR_PIL_R	wrpr	%r16, %r3, %pil
change_to_randtl_4_47:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_47:
	.word 0x8f902002  ! 73: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_4_48:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 74: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0x91a00166  ! 75: FABSq	dis not found

splash_tba_4_49:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 76: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	fbue skip_4_50
	brgz,a,pt	%r3, skip_4_50
.align 128
skip_4_50:
	.word 0x99a489d3  ! 77: FDIVd	fdivd	%f18, %f50, %f12
	.word 0xd2c7e030  ! 78: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r9
	setx 0xed1069c5a8722701, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_51:
	.word 0x39400001  ! 79: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_4_52:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_52-donret_4_52), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000370aa | (32 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x756, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_52:
	.word 0xd2ffe08e  ! 80: SWAPA_I	swapa	%r9, [%r31 + 0x008e] %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56c7bf0  ! 81: SDIVX_I	sdivx	%r17, 0xfffffbf0, %r18
mondo_4_54:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d948011  ! 82: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	fblg,a,pn	%fcc0,  skip_4_55
	fbuge,a,pn	%fcc0,  skip_4_55
.align 1024
skip_4_55:
	.word 0x95a109d2  ! 83: FDIVd	fdivd	%f4, %f18, %f10
intveclr_4_56:
	setx 0x15e840004266aeb7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 84: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99454000  ! 85: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
intveclr_4_57:
	setx 0xae19042cee83db14, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5a249cb  ! 87: FDIVd	fdivd	%f40, %f42, %f18
debug_4_58:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 88: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x7239021c786e76e4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_59:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_4_60:
	set user_data_start, %r31
	.word 0x8580bc2c  ! 90: WRCCR_I	wr	%r2, 0x1c2c, %ccr
tagged_4_61:
	taddcctv %r1, 0x196b, %r23
	.word 0xd807e07c  ! 91: LDUW_I	lduw	[%r31 + 0x007c], %r12
	.word 0xd927e0a4  ! 92: STF_I	st	%f12, [0x00a4, %r31]
splash_cmpr_4_62:
	setx 0xb9b62c406acf5e36, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 93: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_63:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 94: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
DS_4_64:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb30f55e  ! 1: STQF_I	-	%f13, [0x155e, %r3]
	normalw
	.word 0x91458000  ! 95: RD_SOFTINT_REG	rd	%softint, %r8
	setx 0x49f4d3bd7e82dfe7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_65:
	.word 0x39400001  ! 96: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe018  ! 97: LDSTUB_I	ldstub	%r17, [%r31 + 0x0018]
	.word 0x93520000  ! 98: RDPR_PIL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_66
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_66:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 99: RDPC	rd	%pc, %r20
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 100: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02032  ! 101: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x95480000  ! 102: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0xe26fe074  ! 103: LDSTUB_I	ldstub	%r17, [%r31 + 0x0074]
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_67
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_67:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 104: RDPC	rd	%pc, %r9
	.word 0x93d02034  ! 105: Tcc_I	tne	icc_or_xcc, %r0 + 52
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_68
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_68:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 106: RDPC	rd	%pc, %r13
mondo_4_69:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d91000d  ! 107: WRPR_WSTATE_R	wrpr	%r4, %r13, %wstate
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
	.word 0x91414000  ! 108: RDPC	rd	%pc, %r8
	.word 0x9f802344  ! 109: SIR	sir	0x0344
splash_cmpr_4_71:
	setx 0x68885e50e01bdab0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 110: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 111: LDX_R	ldx	[%r31 + %r0], %r19
intveclr_4_72:
	setx 0x274860cb1b0724bf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_73
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_73:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 113: CASA_R	casa	[%r31] %asi, %r3, %r19
	.word 0x2e800001  ! 114: BVS	bvs,a	<label_0x1>
pmu_4_74:
	nop
	setx 0xfffff67efffff4d2, %g1, %g7
	.word 0xa3800007  ! 115: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_4_75:
    set user_data_start, %o7
	.word 0x93902001  ! 116: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01971  ! 117: FqTOd	dis not found

change_to_randtl_4_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_77:
	.word 0x8f902001  ! 118: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xda6fe072  ! 119: LDSTUB_I	ldstub	%r13, [%r31 + 0x0072]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936a7051  ! 120: SDIVX_I	sdivx	%r9, 0xfffff051, %r9
intveclr_4_79:
	setx 0xd119551053c7d352, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 121: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_80:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 122: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6a3ef5  ! 123: SDIVX_I	sdivx	%r8, 0xfffffef5, %r13
splash_tba_4_82:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 124: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x34800001  ! 125: BG	bg,a	<label_0x1>
	.word 0x95a00173  ! 126: FABSq	dis not found

DS_4_83:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x91a00552  ! 1: FSQRTd	fsqrt	
	.word 0x93a44822  ! 127: FADDs	fadds	%f17, %f2, %f9
	rd %pc, %r19
	add %r19, (ivw_4_84-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_84:
	.word 0x9192c011  ! 128: WRPR_PIL_R	wrpr	%r11, %r17, %pil
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01973  ! 129: FqTOd	dis not found

DS_4_86:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f10, %f16, %f30
	.word 0xa3b00304  ! 130: ALIGNADDRESS	alignaddr	%r0, %r4, %r17
DS_4_87:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd3303167  ! 1: STQF_I	-	%f9, [0x1167, %r0]
	normalw
	.word 0xa5458000  ! 131: RD_SOFTINT_REG	rd	%softint, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_88) + 8, 16, 16)) -> intp(7,0,0)
intvec_4_88:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_89:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 133: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 134: LDX_R	ldx	[%r31 + %r0], %r9
donret_4_90:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_90-donret_4_90), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000a6a68 | (28 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xa9c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_90:
	.word 0xd2ffe027  ! 135: SWAPA_I	swapa	%r9, [%r31 + 0x0027] %asi
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_91
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_91:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 136: CASA_R	casa	[%r31] %asi, %r17, %r9
debug_4_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 137: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 138: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd21fc000  ! 139: LDD_R	ldd	[%r31 + %r0], %r9
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_93
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_93
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_93:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 140: RDPC	rd	%pc, %r8
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_94
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_94:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 141: CASA_R	casa	[%r31] %asi, %r17, %r13
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_95
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_95:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 142: RDPC	rd	%pc, %r18
	.word 0x97480000  ! 143: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xa9a409c6  ! 144: FDIVd	fdivd	%f16, %f6, %f20
mondo_4_96:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d910009  ! 145: WRPR_WSTATE_R	wrpr	%r4, %r9, %wstate
pmu_4_97:
	nop
	setx 0xfffffd9afffff61f, %g1, %g7
	.word 0xa3800007  ! 146: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_4_98:
	setx 0x778a6d4cd642a174, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 147: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93a509c2  ! 148: FDIVd	fdivd	%f20, %f2, %f40
intveclr_4_99:
	setx 0x51bb4fe03de509e0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 149: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_4_100:
	setx 0x5f31a19cfa6d36de, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_101
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_101:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 151: RDPC	rd	%pc, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_102) + 0, 16, 16)) -> intp(0,0,22)
intvec_4_102:
	.word 0x39400001  ! 152: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x3e800001  ! 153: BVC	bvc,a	<label_0x1>
	.word 0x3c700001  ! 154: BPPOS	<illegal instruction>
	ba  	 skip_4_103
	fbuge skip_4_103
.align 512
skip_4_103:
	.word 0x39400001  ! 155: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe07c  ! 156: LDSTUB_I	ldstub	%r17, [%r31 + 0x007c]
	.word 0x93d020b4  ! 157: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0xe23fe070  ! 158: STD_I	std	%r17, [%r31 + 0x0070]
	.word 0xa9834009  ! 159: WR_SET_SOFTINT_R	wr	%r13, %r9, %set_softint
	.word 0xa9a00172  ! 160: FABSq	dis not found

    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_104:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00a  ! 161: CASA_R	casa	[%r31] %asi, %r10, %r12
	rd %pc, %r19
	add %r19, (ivw_4_105-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_105:
	.word 0x91920012  ! 162: WRPR_PIL_R	wrpr	%r8, %r18, %pil
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_106:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 163: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0xd8cfe000  ! 164: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36b64e5  ! 165: SDIVX_I	sdivx	%r13, 0x04e5, %r17
	.word 0x9b480000  ! 166: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
pmu_4_108:
	nop
	setx 0xfffff0b4fffffb1e, %g1, %g7
	.word 0xa3800007  ! 167: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	ba  	 skip_4_109
	fbl,a,pn	%fcc0,  skip_4_109
.align 128
skip_4_109:
	.word 0x39400001  ! 168: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_4_110:
	setx 0x1ac075d3da1118be, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 169: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_4_111:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 170: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_4_112:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 171: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_4_113:
	setx 0x2242e0fee22eaea8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_4_114:
	set 0x554f7b60, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 173: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd84fe02f  ! 174: LDSB_I	ldsb	[%r31 + 0x002f], %r12
debug_4_115:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 175: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_decr_4_116:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa7810003  ! 176: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r3, %-
mondo_4_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d920012  ! 177: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
	.word 0xd89fe0d3  ! 178: LDDA_I	ldda	[%r31, + 0x00d3] %asi, %r12
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 179: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_4_118:
	setx 0x729036d6e63ecfa8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8800b40  ! 181: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r12
debug_4_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 182: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_120) + 0, 16, 16)) -> intp(5,0,0)
intvec_4_120:
	.word 0x39400001  ! 183: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_4_121-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_121:
	.word 0x9194c012  ! 184: WRPR_PIL_R	wrpr	%r19, %r18, %pil
splash_hpstate_4_122:
	.word 0x81982ed7  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed7, %hpstate
debug_4_123:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 186: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
splash_cmpr_4_124:
	setx 0xefa0863bee19e4ef, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 187: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd86fe0d1  ! 188: LDSTUB_I	ldstub	%r12, [%r31 + 0x00d1]
splash_cmpr_4_125:
	setx 0xc170f3ccc7e03003, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 189: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_126
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_126:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 190: RDPC	rd	%pc, %r8
	.word 0xd727e094  ! 191: STF_I	st	%f11, [0x0094, %r31]
splash_cmpr_4_127:
	setx 0xca04f0778cba28ed, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_128:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d950013  ! 193: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
DS_4_129:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 194: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 195: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_4_130:
	setx 0x25d31d2fd2a169bc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2c800001  ! 197: BNEG	bneg,a	<label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e012  ! 198: CASA_R	casa	[%r31] %asi, %r18, %r11
intveclr_4_132:
	setx 0xdd414be042358147, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_133:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 200: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_4_134:
	.word 0x8198215e  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015e, %hpstate
change_to_randtl_4_135:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_135:
	.word 0x8f902003  ! 202: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_136)+0, 16, 16)) -> intp(4,1,3)
xir_4_136:
	.word 0xa984ec00  ! 203: WR_SET_SOFTINT_I	wr	%r19, 0x0c00, %set_softint
	rd %pc, %r19
	add %r19, (ivw_4_137-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_137:
	.word 0x91920001  ! 204: WRPR_PIL_R	wrpr	%r8, %r1, %pil
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a0196b  ! 205: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936c29db  ! 206: SDIVX_I	sdivx	%r16, 0x09db, %r9
splash_cmpr_4_140:
	setx 0xa096b67945ba31b9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_141:
	setx 0x1eaa47b235dc7f5f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6cf162  ! 209: SDIVX_I	sdivx	%r19, 0xfffff162, %r13
donret_4_143:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_143-donret_4_143-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0006c72d | (20 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xedd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_143:
	.word 0xe4ffe024  ! 210: SWAPA_I	swapa	%r18, [%r31 + 0x0024] %asi
debug_4_144:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 211: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956d3785  ! 212: SDIVX_I	sdivx	%r20, 0xfffff785, %r10
DS_4_146:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 213: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 214: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 215: BLEU	bleu,a	<label_0x1>
	.word 0xd337c000  ! 216: STQF_R	-	%f9, [%r0, %r31]
	fbul skip_4_147
	bneg,a	 skip_4_147
.align 2048
skip_4_147:
	.word 0x91a489d4  ! 217: FDIVd	fdivd	%f18, %f20, %f8
	.word 0xe06fe06b  ! 218: LDSTUB_I	ldstub	%r16, [%r31 + 0x006b]
intveclr_4_148:
	setx 0xa77009c587d80972, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0800c60  ! 220: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r16
mondo_4_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d934008  ! 221: WRPR_WSTATE_R	wrpr	%r13, %r8, %wstate
intveclr_4_150:
	setx 0x326fd79249f57e8a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 222: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe06fe03f  ! 223: LDSTUB_I	ldstub	%r16, [%r31 + 0x003f]
	setx 0x509a76ff8b41583d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_151:
	.word 0x39400001  ! 224: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_4_152:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 225: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02032  ! 226: Tcc_I	ta	icc_or_xcc, %r0 + 50
intveclr_4_153:
	setx 0xca3a6385ffa0b0b8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 227: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_4_154:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_154-donret_4_154), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003f9438 | (20 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xc1d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_154:
	.word 0xe0ffe078  ! 228: SWAPA_I	swapa	%r16, [%r31 + 0x0078] %asi
pmu_4_155:
	nop
	setx 0xfffff8d9fffff80b, %g1, %g7
	.word 0xa3800007  ! 229: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_4_156:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 230: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
debug_4_157:
	nop
	rdhpr %htba, %r19
	mov 0x10,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	.word 0xe6f00b12  ! 231: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_4_158:
	setx 0x3dd4820bafbcf05e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 232: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_4_159:
	setx 0xd954571c00f0348f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 233: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 234: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe0d7e020  ! 235: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
mondo_4_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d934004  ! 236: WRPR_WSTATE_R	wrpr	%r13, %r4, %wstate
memptr_4_161:
	set 0x60340000, %r31
	.word 0x85842aea  ! 237: WRCCR_I	wr	%r16, 0x0aea, %ccr
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_162:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 238: CASA_R	casa	[%r31] %asi, %r7, %r16
splash_cmpr_4_163:
	setx 0x5fad357d6d3b13e2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 239: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56d2ab5  ! 240: SDIVX_I	sdivx	%r20, 0x0ab5, %r18
memptr_4_165:
	set user_data_start, %r31
	.word 0x85832ee7  ! 241: WRCCR_I	wr	%r12, 0x0ee7, %ccr
	.word 0x8d903fe6  ! 242: WRPR_PSTATE_I	wrpr	%r0, 0x1fe6, %pstate
splash_lsu_4_166:
	set 0x556ac58c, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 243: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xf3adaa822f70e91a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_167:
	.word 0x39400001  ! 244: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97a00174  ! 245: FABSq	dis not found

	.word 0xe627e063  ! 246: STW_I	stw	%r19, [%r31 + 0x0063]
	rd %pc, %r19
	add %r19, (ivw_4_168-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_168:
	.word 0x91948013  ! 247: WRPR_PIL_R	wrpr	%r18, %r19, %pil
	.word 0x8d902520  ! 248: WRPR_PSTATE_I	wrpr	%r0, 0x0520, %pstate
donret_4_169:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_169-donret_4_169-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0013dc31 | (0x4f << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x317, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_169:
	.word 0xe6ffe0e2  ! 249: SWAPA_I	swapa	%r19, [%r31 + 0x00e2] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_170) + 0, 16, 16)) -> intp(4,0,13)
intvec_4_170:
	.word 0x39400001  ! 250: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_4_171:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_171-donret_4_171-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006b672d | (28 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xb55, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_171:
	.word 0xe6ffe0cf  ! 251: SWAPA_I	swapa	%r19, [%r31 + 0x00cf] %asi
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_172
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_172:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e005  ! 252: CASA_R	casa	[%r31] %asi, %r5, %r19
splash_cmpr_4_173:
	setx 0xfdbef46bceb5c4ab, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe62fe01d  ! 254: STB_I	stb	%r19, [%r31 + 0x001d]
    set 0xae5, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b047e9  ! 255: PDISTN	fmean16	%d32, %d40, %d16
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_174
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_174:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 256: CASA_R	casa	[%r31] %asi, %r11, %r11
	rd %pc, %r19
	add %r19, (ivw_4_175-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_175:
	.word 0x91950006  ! 257: WRPR_PIL_R	wrpr	%r20, %r6, %pil
splash_hpstate_4_176:
	.word 0x81982657  ! 258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0657, %hpstate
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
	.word 0xa3414000  ! 259: RDPC	rd	%pc, %r17
intveclr_4_178:
	setx 0x22410f86bad09d25, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 260: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_179:
	setx 0xa98bf0bae3a2475d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 261: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd2d7e020  ! 262: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r9
memptr_4_180:
	set user_data_start, %r31
	.word 0x8580f291  ! 263: WRCCR_I	wr	%r3, 0x1291, %ccr
pmu_4_181:
	nop
	setx 0xfffff1d3fffff4c4, %g1, %g7
	.word 0xa3800007  ! 264: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd337c000  ! 265: STQF_R	-	%f9, [%r0, %r31]
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
	.word 0x91414000  ! 266: RDPC	rd	%pc, %r8
DS_4_183:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x91a509c3  ! 1: FDIVd	fdivd	%f20, %f34, %f8
	.word 0xa9a00553  ! 1: FSQRTd	fsqrt	
	.word 0xa9a2c831  ! 267: FADDs	fadds	%f11, %f17, %f20
donret_4_184:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_184-donret_4_184), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ea4427 | (0x8b << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x3dd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_184:
	.word 0xe8ffe0fc  ! 268: SWAPA_I	swapa	%r20, [%r31 + 0x00fc] %asi
	.word 0x93464000  ! 269: RD_STICK_CMPR_REG	rd	%-, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01964  ! 270: FqTOd	dis not found

debug_4_186:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 271: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_187
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_187
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_187:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 272: RDPC	rd	%pc, %r11
debug_4_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 273: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_189:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 274: RDPC	rd	%pc, %r11
	.word 0xd897e030  ! 275: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
	.word 0x34800001  ! 276: BG	bg,a	<label_0x1>
	.word 0x97520000  ! 277: RDPR_PIL	<illegal instruction>
	.word 0xda6fe07b  ! 278: LDSTUB_I	ldstub	%r13, [%r31 + 0x007b]
splash_htba_4_190:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 279: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x32700001  ! 280: BPNE	<illegal instruction>
tagged_4_191:
	taddcctv %r13, 0x1bda, %r11
	.word 0xda07e0e2  ! 281: LDUW_I	lduw	[%r31 + 0x00e2], %r13
intveclr_4_192:
	setx 0x2cf753b7214a4b86, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 282: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x28800001  ! 283: BLEU	bleu,a	<label_0x1>
	.word 0xa7464000  ! 284: RD_STICK_CMPR_REG	rd	%-, %r19
intveclr_4_193:
	setx 0xbd0f210fcc1a1831, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 285: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd117c000  ! 286: LDQF_R	-	[%r31, %r0], %f8
	.word 0x9145c000  ! 287: RD_TICK_CMPR_REG	rd	%-, %r8
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_194
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_194:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 288: CASA_R	casa	[%r31] %asi, %r0, %r10
debug_4_195:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 289: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
intveclr_4_196:
	setx 0x9ff61452a7e0a125, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_197:
	setx 0xba0bbc164b559a43, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 291: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02034  ! 292: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x99902005  ! 293: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
mondo_4_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d948011  ! 294: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
splash_cmpr_4_199:
	setx 0x6e88f89bcad7b7f2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd46fe053  ! 296: LDSTUB_I	ldstub	%r10, [%r31 + 0x0053]
	.word 0x9f803227  ! 297: SIR	sir	0x1227
	.word 0x97480000  ! 298: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_200) + 40, 16, 16)) -> intp(2,0,19)
intvec_4_200:
	.word 0x39400001  ! 299: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d930005  ! 300: WRPR_WSTATE_R	wrpr	%r12, %r5, %wstate
	.word 0xd727c000  ! 301: STF_R	st	%f11, [%r0, %r31]
mondo_4_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d900013  ! 302: WRPR_WSTATE_R	wrpr	%r0, %r19, %wstate
debug_4_203:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 303: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_4_204:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d934012  ! 304: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
intveclr_4_205:
	setx 0x0da05c76fd56c0de, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 305: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01973  ! 306: FqTOd	dis not found

pmu_4_207:
	nop
	setx 0xfffff8fafffff1d9, %g1, %g7
	.word 0xa3800007  ! 307: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_4_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d90c002  ! 308: WRPR_WSTATE_R	wrpr	%r3, %r2, %wstate
	.word 0x9190a588  ! 309: WRPR_PIL_I	wrpr	%r2, 0x0588, %pil
	.word 0x8d9033de  ! 310: WRPR_PSTATE_I	wrpr	%r0, 0x13de, %pstate
splash_lsu_4_209:
	set 0x55e8e705, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
	.word 0xa5414000  ! 312: RDPC	rd	%pc, %r18
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
    set (0x00f97308 | (0x88 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x71d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_211:
	.word 0xe2ffe074  ! 313: SWAPA_I	swapa	%r17, [%r31 + 0x0074] %asi
	.word 0x91d020b5  ! 314: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xe26fe03f  ! 315: LDSTUB_I	ldstub	%r17, [%r31 + 0x003f]
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_212
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_212:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 316: CASA_R	casa	[%r31] %asi, %r11, %r17
	setx 0x60d67870eb0fbe95, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_213:
	.word 0x39400001  ! 317: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_4_214:
	setx 0x4348d93b17008221, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01967  ! 320: FqTOd	dis not found

memptr_4_216:
	set user_data_start, %r31
	.word 0x8582fc91  ! 321: WRCCR_I	wr	%r11, 0x1c91, %ccr
memptr_4_217:
	set 0x60540000, %r31
	.word 0x8584a6f0  ! 322: WRCCR_I	wr	%r18, 0x06f0, %ccr
donret_4_218:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_218-donret_4_218), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d62412 | (0x82 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x894, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_218:
	.word 0xe4ffe0e4  ! 323: SWAPA_I	swapa	%r18, [%r31 + 0x00e4] %asi
	.word 0x9b500000  ! 324: RDPR_TPC	<illegal instruction>
	.word 0xda6fe012  ! 325: LDSTUB_I	ldstub	%r13, [%r31 + 0x0012]
splash_lsu_4_219:
	set 0x553ce3d7, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 326: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902000  ! 327: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
pmu_4_220:
	nop
	setx 0xfffffa67fffff213, %g1, %g7
	.word 0xa3800007  ! 328: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99a4c9d1  ! 329: FDIVd	fdivd	%f50, %f48, %f12
DS_4_221:
	.word 0xa5a0c9d1  ! 1: FDIVd	fdivd	%f34, %f48, %f18
	.word 0xbfe7c000  ! 330: SAVE_R	save	%r31, %r0, %r31
	.word 0xd46fe044  ! 331: LDSTUB_I	ldstub	%r10, [%r31 + 0x0044]
	rd %pc, %r19
	add %r19, (ivw_4_222-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_222:
	.word 0x9191c008  ! 332: WRPR_PIL_R	wrpr	%r7, %r8, %pil
	.word 0xd43fc000  ! 333: STD_R	std	%r10, [%r31 + %r0]
change_to_randtl_4_223:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_223:
	.word 0x8f902002  ! 334: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	bcs  	 skip_4_224
	bg,a	 skip_4_224
.align 2048
skip_4_224:
	.word 0x99a149c5  ! 335: FDIVd	fdivd	%f36, %f36, %f12
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_225
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_225
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_225:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 336: RDPC	rd	%pc, %r12
mondo_4_226:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d908008  ! 337: WRPR_WSTATE_R	wrpr	%r2, %r8, %wstate
intveclr_4_227:
	setx 0xc4dc988e54b454c0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 338: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_4_228:
	nop
	setx 0xfffffd6efffff53c, %g1, %g7
	.word 0xa3800007  ! 339: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_229
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_229
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_229:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 340: RDPC	rd	%pc, %r11
	.word 0xab84ad44  ! 341: WR_CLEAR_SOFTINT_I	wr	%r18, 0x0d44, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_230) + 8, 16, 16)) -> intp(4,0,19)
intvec_4_230:
	.word 0x39400001  ! 342: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8bfc020  ! 343: STDA_R	stda	%r20, [%r31 + %r0] 0x01
	setx 0x9aaabb593b7b088e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_231:
	.word 0x39400001  ! 344: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_4_232-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_232:
	.word 0x91940001  ! 345: WRPR_PIL_R	wrpr	%r16, %r1, %pil
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 346: Tcc_R	tne	icc_or_xcc, %r0 + %r30
cwp_4_233:
    set user_data_start, %o7
	.word 0x93902004  ! 347: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa768f575  ! 348: SDIVX_I	sdivx	%r3, 0xfffff575, %r19
splash_cmpr_4_235:
	setx 0x0d97a86e9da00868, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 349: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_236:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 350: SAVE_R	save	%r31, %r0, %r31
	.word 0xd727e092  ! 351: STF_I	st	%f11, [0x0092, %r31]
	.word 0xa9a00160  ! 352: FABSq	dis not found

	.word 0x91d020b5  ! 353: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xd6cfe030  ! 354: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
	.word 0x9f803060  ! 355: SIR	sir	0x1060
	.word 0x97454000  ! 356: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
splash_cmpr_4_237:
	setx 0x6bc383bb43e2220f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 357: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91a00171  ! 358: FABSq	dis not found

    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_238
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_238:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e003  ! 359: CASA_R	casa	[%r31] %asi, %r3, %r12
	.word 0x97454000  ! 360: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0xa7450000  ! 361: RD_SET_SOFTINT	rd	%set_softint, %r19
	.word 0x99902004  ! 362: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xa3a0016c  ! 363: FABSq	dis not found

debug_4_239:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 364: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d903fd7  ! 365: WRPR_PSTATE_I	wrpr	%r0, 0x1fd7, %pstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_240:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 366: CASA_R	casa	[%r31] %asi, %r7, %r16
intveclr_4_241:
	setx 0x08d8fb52074767c4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 367: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01964  ! 368: FqTOd	dis not found

	setx 0xa9967f5610dad8e1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_243:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91454000  ! 370: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
splash_hpstate_4_244:
	.word 0x8198250c  ! 371: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050c, %hpstate
	.word 0xe497e030  ! 372: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r18
	.word 0xe4800bc0  ! 373: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r18
pmu_4_245:
	nop
	setx 0xfffff966fffffc7d, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_4_246-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_246:
	.word 0x91918005  ! 375: WRPR_PIL_R	wrpr	%r6, %r5, %pil
splash_cmpr_4_247:
	setx 0x50c8b32843a1168c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 376: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_248:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d92c00a  ! 377: WRPR_WSTATE_R	wrpr	%r11, %r10, %wstate
	.word 0xe49fe0c8  ! 378: LDDA_I	ldda	[%r31, + 0x00c8] %asi, %r18
intveclr_4_249:
	setx 0x45ca1f03c064ea87, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4c7e020  ! 380: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r18
memptr_4_250:
	set 0x60540000, %r31
	.word 0x85847c8a  ! 381: WRCCR_I	wr	%r17, 0x1c8a, %ccr
intveclr_4_251:
	setx 0xdc71cc5e543ae1df, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 382: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_252:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 383: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 384: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 385: Tcc_I	ta	icc_or_xcc, %r0 + 50
intveclr_4_253:
	setx 0x5260840b6044fd81, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 387: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_4_255:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d948004  ! 388: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
	.word 0x9745c000  ! 389: RD_TICK_CMPR_REG	rd	%-, %r11
mondo_4_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d910013  ! 390: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
	setx 0xdb1299adaf5f01e5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_257:
	.word 0x39400001  ! 391: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01967  ! 392: FqTOd	dis not found

mondo_4_259:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d910012  ! 393: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
intveclr_4_260:
	setx 0xb2bf847d6530b1a0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_4_261:
	nop
	setx 0xfffff5ccfffff540, %g1, %g7
	.word 0xa3800007  ! 395: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_4_262:
	set 0x60740000, %r31
	.word 0x8581a33f  ! 396: WRCCR_I	wr	%r6, 0x033f, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_263)+32, 16, 16)) -> intp(4,1,3)
xir_4_263:
	.word 0xa9803c5e  ! 397: WR_SET_SOFTINT_I	wr	%r0, 0x1c5e, %set_softint
	.word 0x91540000  ! 398: RDPR_GL	<illegal instruction>
	bcc  	 skip_4_264
	fbuge skip_4_264
.align 32
skip_4_264:
	.word 0x93a189c0  ! 399: FDIVd	fdivd	%f6, %f0, %f40
	.word 0xd0dfe030  ! 400: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
DS_2_1:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x97a349d2  ! 1: FDIVd	fdivd	%f44, %f18, %f42
	.word 0x9ba50824  ! 1: FADDs	fadds	%f20, %f4, %f13
	.word 0x91d02034  ! 2: Tcc_I	ta	icc_or_xcc, %r0 + 52
pmu_2_2:
	nop
	setx 0xfffff0a4fffffebb, %g1, %g7
	.word 0xa3800007  ! 3: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 4: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_3:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e009  ! 5: CASA_R	casa	[%r31] %asi, %r9, %r9
DS_2_4:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 6: SAVE_R	save	%r31, %r0, %r31
intveclr_2_5:
	setx 0xde333f4c3d91524c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_6
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_6
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_6:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 8: RDPC	rd	%pc, %r17
	rd %pc, %r19
	add %r19, (ivw_2_7-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_7:
	.word 0x9192c010  ! 9: WRPR_PIL_R	wrpr	%r11, %r16, %pil
change_to_randtl_2_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_8:
	.word 0x8f902000  ! 10: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_2_9:
	setx 0x6e98ba8493a8d430, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 11: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 12: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_2_10:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 13: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_2_11:
	.word 0xa1a289d3  ! 1: FDIVd	fdivd	%f10, %f50, %f16
	pdist %f24, %f24, %f6
	.word 0x9bb30306  ! 14: ALIGNADDRESS	alignaddr	%r12, %r6, %r13
splash_hpstate_2_12:
	.word 0x8198243d  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x043d, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01970  ! 16: FqTOd	dis not found

    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_14
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_14:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e012  ! 17: CASA_R	casa	[%r31] %asi, %r18, %r9
	.word 0xd277e054  ! 18: STX_I	stx	%r9, [%r31 + 0x0054]
	.word 0x8d903f23  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x1f23, %pstate
DS_2_15:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa3b10314  ! 20: ALIGNADDRESS	alignaddr	%r4, %r20, %r17
	.word 0xe807c000  ! 21: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0xa5a089c7  ! 22: FDIVd	fdivd	%f2, %f38, %f18
	.word 0xd4c7e000  ! 23: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r10
debug_2_16:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 24: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_17:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e006  ! 25: CASA_R	casa	[%r31] %asi, %r6, %r10
memptr_2_18:
	set user_data_start, %r31
	.word 0x85826190  ! 26: WRCCR_I	wr	%r9, 0x0190, %ccr
mondo_2_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d92000a  ! 27: WRPR_WSTATE_R	wrpr	%r8, %r10, %wstate
	.word 0x3a700001  ! 28: BPCC	<illegal instruction>
	.word 0xd537c000  ! 29: STQF_R	-	%f10, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_20
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_20:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 30: RDPC	rd	%pc, %r20
	.word 0x91a00162  ! 31: FABSq	dis not found

splash_cmpr_2_21:
	setx 0x8f96b7a2064c2601, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 32: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd697e010  ! 33: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0x91d020b4  ! 34: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_hpstate_2_22:
	.word 0x81982157  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0157, %hpstate
	.word 0xd66fe0ea  ! 36: LDSTUB_I	ldstub	%r11, [%r31 + 0x00ea]
splash_cmpr_2_23:
	setx 0x9fc05456016844ed, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 37: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_24:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 38: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0xad816669  ! 39: WR_SOFTINT_REG_I	wr	%r5, 0x0669, %softint
	.word 0xd66fe0d6  ! 40: LDSTUB_I	ldstub	%r11, [%r31 + 0x00d6]
intveclr_2_25:
	setx 0x3c86295d11a33c6a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 41: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9031cc  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x11cc, %pstate
	.word 0xd737c000  ! 43: STQF_R	-	%f11, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_26
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_26:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 44: RDPC	rd	%pc, %r19
mondo_2_27:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d908014  ! 45: WRPR_WSTATE_R	wrpr	%r2, %r20, %wstate
	.word 0x26800001  ! 46: BL	bl,a	<label_0x1>
	.word 0xd48008a0  ! 47: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_2_28:
	set 0x555bfe65, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 48: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_2_29:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 49: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1a00165  ! 50: FABSq	dis not found

	.word 0xe68008a0  ! 51: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
splash_tba_2_30:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 52: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d902a96  ! 53: WRPR_PSTATE_I	wrpr	%r0, 0x0a96, %pstate
DS_2_31:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 54: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_32) + 40, 16, 16)) -> intp(6,0,31)
intvec_2_32:
	.word 0x39400001  ! 55: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x48892803b14e2b99, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_33:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_2_34:
	nop
	setx 0xfffffa4ffffff9c2, %g1, %g7
	.word 0xa3800007  ! 57: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_2_35:
	setx 0x13688ecff4bec46b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9369e298  ! 59: SDIVX_I	sdivx	%r7, 0x0298, %r9
splash_cmpr_2_37:
	setx 0xfc9be215e8193dff, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 60: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_38) + 24, 16, 16)) -> intp(4,0,17)
intvec_2_38:
	.word 0x39400001  ! 61: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5a149c2  ! 62: FDIVd	fdivd	%f36, %f2, %f18
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_39:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e004  ! 63: CASA_R	casa	[%r31] %asi, %r4, %r9
	.word 0xd2800c20  ! 64: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6abcc7  ! 65: SDIVX_I	sdivx	%r10, 0xfffffcc7, %r13
	.word 0x24ca8001  ! 66: BRLEZ	brlez,a,pt	%r10,<label_0xa8001>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_42:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e007  ! 67: CASA_R	casa	[%r31] %asi, %r7, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01972  ! 68: FqTOd	dis not found

intveclr_2_44:
	setx 0x8f38267c5fa31b81, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_2_45:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x93b30303  ! 70: ALIGNADDRESS	alignaddr	%r12, %r3, %r9
	.word 0xe937c000  ! 71: STQF_R	-	%f20, [%r0, %r31]
	rd %pc, %r19
	add %r19, (ivw_2_46-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_46:
	.word 0x9195000d  ! 72: WRPR_PIL_R	wrpr	%r20, %r13, %pil
change_to_randtl_2_47:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_47:
	.word 0x8f902002  ! 73: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_2_48:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 74: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xa9a00163  ! 75: FABSq	dis not found

splash_tba_2_49:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 76: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x24cc4001  ! 77: BRLEZ	brlez,a,pt	%r17,<label_0xc4001>
	.word 0xd2c7e020  ! 78: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r9
	setx 0x4d95be6adb25425a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_51:
	.word 0x39400001  ! 79: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_2_52:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_52-donret_2_52), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e602bd | (0x8a << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x5dc, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_52:
	.word 0xd2ffe040  ! 80: SWAPA_I	swapa	%r9, [%r31 + 0x0040] %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976cfd48  ! 81: SDIVX_I	sdivx	%r19, 0xfffffd48, %r11
mondo_2_54:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d94c00a  ! 82: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
	.word 0x24cc4001  ! 83: BRLEZ	brlez,a,pt	%r17,<label_0xc4001>
intveclr_2_56:
	setx 0x0576ec06a02708f8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 84: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5454000  ! 85: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
intveclr_2_57:
	setx 0x169db06c708b4f16, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99a1c9d0  ! 87: FDIVd	fdivd	%f38, %f16, %f12
debug_2_58:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 88: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x3362f3dab0b8a0cc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_59:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_2_60:
	set user_data_start, %r31
	.word 0x858477de  ! 90: WRCCR_I	wr	%r17, 0x17de, %ccr
tagged_2_61:
	taddcctv %r1, 0x140e, %r1
	.word 0xd807e058  ! 91: LDUW_I	lduw	[%r31 + 0x0058], %r12
	.word 0xd927e0bc  ! 92: STF_I	st	%f12, [0x00bc, %r31]
splash_cmpr_2_62:
	setx 0x1349d8bba94128de, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 93: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_63:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 94: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
DS_2_64:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd73325bb  ! 1: STQF_I	-	%f11, [0x05bb, %r12]
	normalw
	.word 0x93458000  ! 95: RD_SOFTINT_REG	rd	%softint, %r9
	setx 0xb33c7c36a5b1a163, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_65:
	.word 0x39400001  ! 96: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe042  ! 97: LDSTUB_I	ldstub	%r17, [%r31 + 0x0042]
	.word 0x91520000  ! 98: RDPR_PIL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_66
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_66:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 99: RDPC	rd	%pc, %r11
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 100: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d020b2  ! 101: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x9b480000  ! 102: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0xe26fe090  ! 103: LDSTUB_I	ldstub	%r17, [%r31 + 0x0090]
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_67
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_67:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 104: RDPC	rd	%pc, %r9
	.word 0x91d020b2  ! 105: Tcc_I	ta	icc_or_xcc, %r0 + 178
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_68
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_68:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 106: RDPC	rd	%pc, %r12
mondo_2_69:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d904001  ! 107: WRPR_WSTATE_R	wrpr	%r1, %r1, %wstate
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
	.word 0x99414000  ! 108: RDPC	rd	%pc, %r12
	.word 0x9f80353e  ! 109: SIR	sir	0x153e
splash_cmpr_2_71:
	setx 0xb1881f435a23eca9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 110: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 111: LDX_R	ldx	[%r31 + %r0], %r19
intveclr_2_72:
	setx 0x4c58fc7d6c8d3902, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_73
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_73:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 113: CASA_R	casa	[%r31] %asi, %r3, %r19
	.word 0x2e800001  ! 114: BVS	bvs,a	<label_0x1>
pmu_2_74:
	nop
	setx 0xfffff89dfffff506, %g1, %g7
	.word 0xa3800007  ! 115: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_2_75:
    set user_data_start, %o7
	.word 0x93902002  ! 116: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01966  ! 117: FqTOd	dis not found

change_to_randtl_2_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_77:
	.word 0x8f902001  ! 118: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xda6fe004  ! 119: LDSTUB_I	ldstub	%r13, [%r31 + 0x0004]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56c69c7  ! 120: SDIVX_I	sdivx	%r17, 0x09c7, %r18
intveclr_2_79:
	setx 0x3ca6c6a15e5695aa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 121: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_80:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 122: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36823de  ! 123: SDIVX_I	sdivx	%r0, 0x03de, %r17
splash_tba_2_82:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 124: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x34800001  ! 125: BG	bg,a	<label_0x1>
	.word 0x91a00170  ! 126: FABSq	dis not found

DS_2_83:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa5a00551  ! 1: FSQRTd	fsqrt	
	.word 0xa1a0c830  ! 127: FADDs	fadds	%f3, %f16, %f16
	rd %pc, %r19
	add %r19, (ivw_2_84-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_84:
	.word 0x91940001  ! 128: WRPR_PIL_R	wrpr	%r16, %r1, %pil
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01962  ! 129: FqTOd	dis not found

DS_2_86:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f20, %f22, %f8
	.word 0x99b44313  ! 130: ALIGNADDRESS	alignaddr	%r17, %r19, %r12
DS_2_87:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe331e0ab  ! 1: STQF_I	-	%f17, [0x00ab, %r7]
	normalw
	.word 0x91458000  ! 131: RD_SOFTINT_REG	rd	%softint, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_88) + 48, 16, 16)) -> intp(1,0,2)
intvec_2_88:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_89:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 133: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 134: LDX_R	ldx	[%r31 + %r0], %r9
donret_2_90:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_90-donret_2_90), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000fd1b4 | (4 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xd1f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_90:
	.word 0xd2ffe0f0  ! 135: SWAPA_I	swapa	%r9, [%r31 + 0x00f0] %asi
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_91
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_91:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 136: CASA_R	casa	[%r31] %asi, %r17, %r9
debug_2_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 137: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 138: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd21fc000  ! 139: LDD_R	ldd	[%r31 + %r0], %r9
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_93
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_93
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_93:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 140: RDPC	rd	%pc, %r17
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_94
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_94:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 141: CASA_R	casa	[%r31] %asi, %r17, %r13
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_95
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_95:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 142: RDPC	rd	%pc, %r20
	.word 0x99480000  ! 143: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x99a249cb  ! 144: FDIVd	fdivd	%f40, %f42, %f12
mondo_2_96:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d920000  ! 145: WRPR_WSTATE_R	wrpr	%r8, %r0, %wstate
pmu_2_97:
	nop
	setx 0xfffffddafffff3d9, %g1, %g7
	.word 0xa3800007  ! 146: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_2_98:
	setx 0x780a1bf4fddb2d0c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 147: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93a0c9cb  ! 148: FDIVd	fdivd	%f34, %f42, %f40
intveclr_2_99:
	setx 0xe7eb07fa9e9feb69, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 149: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_2_100:
	setx 0x563ca9570f1b159c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_101
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_101:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 151: RDPC	rd	%pc, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_102) + 48, 16, 16)) -> intp(7,0,15)
intvec_2_102:
	.word 0x39400001  ! 152: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x3e800001  ! 153: BVC	bvc,a	<label_0x1>
	.word 0x3c700001  ! 154: BPPOS	<illegal instruction>
	.word 0x39400001  ! 155: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe090  ! 156: LDSTUB_I	ldstub	%r17, [%r31 + 0x0090]
	.word 0x93d02033  ! 157: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xe23fe002  ! 158: STD_I	std	%r17, [%r31 + 0x0002]
	.word 0xa9834013  ! 159: WR_SET_SOFTINT_R	wr	%r13, %r19, %set_softint
	.word 0x91a00174  ! 160: FABSq	dis not found

    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_104:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00a  ! 161: CASA_R	casa	[%r31] %asi, %r10, %r12
	rd %pc, %r19
	add %r19, (ivw_2_105-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_105:
	.word 0x9192c010  ! 162: WRPR_PIL_R	wrpr	%r11, %r16, %pil
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_106:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 163: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0xd8cfe020  ! 164: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996cf150  ! 165: SDIVX_I	sdivx	%r19, 0xfffff150, %r12
	.word 0xa3480000  ! 166: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
pmu_2_108:
	nop
	setx 0xfffff209fffff539, %g1, %g7
	.word 0xa3800007  ! 167: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x39400001  ! 168: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_2_110:
	setx 0x64a11cacbc0a72e0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 169: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_2_111:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 170: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_2_112:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 171: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_2_113:
	setx 0x92295fbb576449ce, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_2_114:
	set 0x553029c2, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 173: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd84fe062  ! 174: LDSB_I	ldsb	[%r31 + 0x0062], %r12
debug_2_115:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 175: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_decr_2_116:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r19, [%r1] 0x45
	.word 0xa7840012  ! 176: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r18, %-
mondo_2_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d924002  ! 177: WRPR_WSTATE_R	wrpr	%r9, %r2, %wstate
	.word 0xd89fe0b0  ! 178: LDDA_I	ldda	[%r31, + 0x00b0] %asi, %r12
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 179: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_2_118:
	setx 0x5b11ff79a02e6ed4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8800aa0  ! 181: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r12
debug_2_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 182: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_120) + 24, 16, 16)) -> intp(7,0,25)
intvec_2_120:
	.word 0x39400001  ! 183: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_2_121-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_121:
	.word 0x9190c00a  ! 184: WRPR_PIL_R	wrpr	%r3, %r10, %pil
splash_hpstate_2_122:
	.word 0x81982d84  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d84, %hpstate
debug_2_123:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 186: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
splash_cmpr_2_124:
	setx 0xfc0c220acfb24d3e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 187: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd86fe015  ! 188: LDSTUB_I	ldstub	%r12, [%r31 + 0x0015]
splash_cmpr_2_125:
	setx 0xce14a5d1a1b19038, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 189: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_126
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_126:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 190: RDPC	rd	%pc, %r13
	.word 0xd727e000  ! 191: STF_I	st	%f11, [0x0000, %r31]
splash_cmpr_2_127:
	setx 0xaa7d821b9f03a099, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_128:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d948006  ! 193: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
DS_2_129:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 194: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 195: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_2_130:
	setx 0xb26eefd6e2bd58cd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2c800001  ! 197: BNEG	bneg,a	<label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e012  ! 198: CASA_R	casa	[%r31] %asi, %r18, %r11
intveclr_2_132:
	setx 0x228a73e4b86bff16, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_133:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 200: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_2_134:
	.word 0x8198238e  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038e, %hpstate
change_to_randtl_2_135:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_135:
	.word 0x8f902001  ! 202: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_136)+56, 16, 16)) -> intp(2,1,3)
xir_2_136:
	.word 0xa9823f43  ! 203: WR_SET_SOFTINT_I	wr	%r8, 0x1f43, %set_softint
	rd %pc, %r19
	add %r19, (ivw_2_137-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_137:
	.word 0x91950009  ! 204: WRPR_PIL_R	wrpr	%r20, %r9, %pil
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01967  ! 205: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936d2a65  ! 206: SDIVX_I	sdivx	%r20, 0x0a65, %r9
splash_cmpr_2_140:
	setx 0xae98bb02184e31bd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_141:
	setx 0x6a6e2413fa9a16a7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976b2a7a  ! 209: SDIVX_I	sdivx	%r12, 0x0a7a, %r11
donret_2_143:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_143-donret_2_143-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006f175a | (28 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x885, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_143:
	.word 0xe4ffe069  ! 210: SWAPA_I	swapa	%r18, [%r31 + 0x0069] %asi
debug_2_144:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 211: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976cbf2d  ! 212: SDIVX_I	sdivx	%r18, 0xffffff2d, %r11
DS_2_146:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 213: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 214: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 215: BLEU	bleu,a	<label_0x1>
	.word 0xd337c000  ! 216: STQF_R	-	%f9, [%r0, %r31]
	.word 0x91a209c1  ! 217: FDIVd	fdivd	%f8, %f32, %f8
	.word 0xe06fe0e0  ! 218: LDSTUB_I	ldstub	%r16, [%r31 + 0x00e0]
intveclr_2_148:
	setx 0xd9e0c953071d88a0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 220: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_2_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d900001  ! 221: WRPR_WSTATE_R	wrpr	%r0, %r1, %wstate
intveclr_2_150:
	setx 0x235e73583b487322, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 222: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe06fe0fa  ! 223: LDSTUB_I	ldstub	%r16, [%r31 + 0x00fa]
	setx 0xf54162ce0f2c9c2d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_151:
	.word 0x39400001  ! 224: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_2_152:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 225: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02034  ! 226: Tcc_I	ta	icc_or_xcc, %r0 + 52
intveclr_2_153:
	setx 0x3fa1b58d48b75e92, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 227: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_2_154:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_154-donret_2_154), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fa16a1 | (0x88 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xb47, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_154:
	.word 0xe0ffe08c  ! 228: SWAPA_I	swapa	%r16, [%r31 + 0x008c] %asi
pmu_2_155:
	nop
	setx 0xfffff5e5fffff402, %g1, %g7
	.word 0xa3800007  ! 229: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_2_156:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 230: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
debug_2_157:
	nop
	rdhpr %htba, %r19
	mov 0x10,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	.word 0xe6f00b12  ! 231: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_2_158:
	setx 0x6b65247372512478, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 232: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_2_159:
	setx 0x74877d5c1d5a21cd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 233: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 234: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xe0d7e030  ! 235: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
mondo_2_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d92800b  ! 236: WRPR_WSTATE_R	wrpr	%r10, %r11, %wstate
memptr_2_161:
	set 0x60140000, %r31
	.word 0x85852935  ! 237: WRCCR_I	wr	%r20, 0x0935, %ccr
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_162:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 238: CASA_R	casa	[%r31] %asi, %r7, %r16
splash_cmpr_2_163:
	setx 0x0449b152690b7502, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 239: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96cbdc8  ! 240: SDIVX_I	sdivx	%r18, 0xfffffdc8, %r20
memptr_2_165:
	set user_data_start, %r31
	.word 0x85816202  ! 241: WRCCR_I	wr	%r5, 0x0202, %ccr
	.word 0x8d9029ef  ! 242: WRPR_PSTATE_I	wrpr	%r0, 0x09ef, %pstate
splash_lsu_2_166:
	set 0x55df9f64, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 243: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x9230fcf47d61c93f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_167:
	.word 0x39400001  ! 244: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a0016d  ! 245: FABSq	dis not found

	.word 0xe627e011  ! 246: STW_I	stw	%r19, [%r31 + 0x0011]
	rd %pc, %r19
	add %r19, (ivw_2_168-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_168:
	.word 0x91948010  ! 247: WRPR_PIL_R	wrpr	%r18, %r16, %pil
	.word 0x8d902a84  ! 248: WRPR_PSTATE_I	wrpr	%r0, 0x0a84, %pstate
donret_2_169:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_169-donret_2_169-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00936f5f | (0x80 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x95f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_169:
	.word 0xe6ffe0b0  ! 249: SWAPA_I	swapa	%r19, [%r31 + 0x00b0] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_170) + 24, 16, 16)) -> intp(0,0,17)
intvec_2_170:
	.word 0x39400001  ! 250: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_2_171:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_171-donret_2_171-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b0efba | (0x55 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x1dd, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_171:
	.word 0xe6ffe08e  ! 251: SWAPA_I	swapa	%r19, [%r31 + 0x008e] %asi
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_172
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_172:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e005  ! 252: CASA_R	casa	[%r31] %asi, %r5, %r19
splash_cmpr_2_173:
	setx 0x5d029cd856925624, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe62fe0cb  ! 254: STB_I	stb	%r19, [%r31 + 0x00cb]
    set 0x6cc, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b247ed  ! 255: PDISTN	fmean16	%d40, %d44, %d18
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_174
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_174:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 256: CASA_R	casa	[%r31] %asi, %r11, %r11
	rd %pc, %r19
	add %r19, (ivw_2_175-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_175:
	.word 0x9192c007  ! 257: WRPR_PIL_R	wrpr	%r11, %r7, %pil
splash_hpstate_2_176:
	.word 0x81982ddd  ! 258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ddd, %hpstate
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
	.word 0x95414000  ! 259: RDPC	rd	%pc, %r10
intveclr_2_178:
	setx 0x510ca2351cf86161, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 260: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_179:
	setx 0xa234f1b90d4f55d6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 261: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd2d7e030  ! 262: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r9
memptr_2_180:
	set user_data_start, %r31
	.word 0x8582a9c1  ! 263: WRCCR_I	wr	%r10, 0x09c1, %ccr
pmu_2_181:
	nop
	setx 0xfffff54cfffff031, %g1, %g7
	.word 0xa3800007  ! 264: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd337c000  ! 265: STQF_R	-	%f9, [%r0, %r31]
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
	.word 0x95414000  ! 266: RDPC	rd	%pc, %r10
DS_2_183:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x93a409d3  ! 1: FDIVd	fdivd	%f16, %f50, %f40
	.word 0x99a00540  ! 1: FSQRTd	fsqrt	
	.word 0x93a4082a  ! 267: FADDs	fadds	%f16, %f10, %f9
donret_2_184:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_184-donret_2_184), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003934a6 | (0x83 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x21d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_184:
	.word 0xe8ffe08c  ! 268: SWAPA_I	swapa	%r20, [%r31 + 0x008c] %asi
	.word 0x93464000  ! 269: RD_STICK_CMPR_REG	rd	%-, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01973  ! 270: FqTOd	dis not found

debug_2_186:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 271: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_187
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_187
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_187:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 272: RDPC	rd	%pc, %r18
debug_2_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 273: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_189:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 274: RDPC	rd	%pc, %r19
	.word 0xd897e000  ! 275: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
	.word 0x34800001  ! 276: BG	bg,a	<label_0x1>
	.word 0xa7520000  ! 277: RDPR_PIL	<illegal instruction>
	.word 0xda6fe015  ! 278: LDSTUB_I	ldstub	%r13, [%r31 + 0x0015]
splash_htba_2_190:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 279: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x32700001  ! 280: BPNE	<illegal instruction>
tagged_2_191:
	taddcctv %r23, 0x110b, %r9
	.word 0xda07e028  ! 281: LDUW_I	lduw	[%r31 + 0x0028], %r13
intveclr_2_192:
	setx 0xe35ae2ccfab1acb5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 282: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x28800001  ! 283: BLEU	bleu,a	<label_0x1>
	.word 0xa7464000  ! 284: RD_STICK_CMPR_REG	rd	%-, %r19
intveclr_2_193:
	setx 0xd77084937842ab6b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 285: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd117c000  ! 286: LDQF_R	-	[%r31, %r0], %f8
	.word 0xa545c000  ! 287: RD_TICK_CMPR_REG	rd	%-, %r18
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_194
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_194:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 288: CASA_R	casa	[%r31] %asi, %r0, %r10
debug_2_195:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 289: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
intveclr_2_196:
	setx 0xa5161ac9b64eaef4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_197:
	setx 0x111213613774257f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 291: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b5  ! 292: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x99902001  ! 293: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
mondo_2_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d918004  ! 294: WRPR_WSTATE_R	wrpr	%r6, %r4, %wstate
splash_cmpr_2_199:
	setx 0x1c16bc6bfdd9df42, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd46fe0e1  ! 296: LDSTUB_I	ldstub	%r10, [%r31 + 0x00e1]
	.word 0x9f802888  ! 297: SIR	sir	0x0888
	.word 0xa1480000  ! 298: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_200) + 48, 16, 16)) -> intp(0,0,16)
intvec_2_200:
	.word 0x39400001  ! 299: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d94c013  ! 300: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	.word 0xd727c000  ! 301: STF_R	st	%f11, [%r0, %r31]
mondo_2_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d928004  ! 302: WRPR_WSTATE_R	wrpr	%r10, %r4, %wstate
debug_2_203:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 303: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_2_204:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d948009  ! 304: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
intveclr_2_205:
	setx 0xffde99ecb9775fe4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 305: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a0196d  ! 306: FqTOd	dis not found

pmu_2_207:
	nop
	setx 0xfffff84cfffffe9c, %g1, %g7
	.word 0xa3800007  ! 307: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_2_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d910010  ! 308: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
	.word 0x9192b1ee  ! 309: WRPR_PIL_I	wrpr	%r10, 0x11ee, %pil
	.word 0x8d9021b8  ! 310: WRPR_PSTATE_I	wrpr	%r0, 0x01b8, %pstate
splash_lsu_2_209:
	set 0x5538761c, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
	.word 0xa1414000  ! 312: RDPC	rd	%pc, %r16
donret_2_211:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_211-donret_2_211-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005c0d46 | (0x8b << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x60d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_211:
	.word 0xe2ffe0b3  ! 313: SWAPA_I	swapa	%r17, [%r31 + 0x00b3] %asi
	.word 0x91d020b5  ! 314: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xe26fe09f  ! 315: LDSTUB_I	ldstub	%r17, [%r31 + 0x009f]
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_212
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_212:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 316: CASA_R	casa	[%r31] %asi, %r11, %r17
	setx 0xaec996058512859c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_213:
	.word 0x39400001  ! 317: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_2_214:
	setx 0xd28ea3f51fcff993, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196b  ! 320: FqTOd	dis not found

memptr_2_216:
	set user_data_start, %r31
	.word 0x8581ec36  ! 321: WRCCR_I	wr	%r7, 0x0c36, %ccr
memptr_2_217:
	set 0x60340000, %r31
	.word 0x8580ff4b  ! 322: WRCCR_I	wr	%r3, 0x1f4b, %ccr
donret_2_218:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_218-donret_2_218), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cf0d8f | (0x83 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x70f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_218:
	.word 0xe4ffe0c0  ! 323: SWAPA_I	swapa	%r18, [%r31 + 0x00c0] %asi
	.word 0x97500000  ! 324: RDPR_TPC	<illegal instruction>
	.word 0xda6fe0cb  ! 325: LDSTUB_I	ldstub	%r13, [%r31 + 0x00cb]
splash_lsu_2_219:
	set 0x550918c6, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 326: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902000  ! 327: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
pmu_2_220:
	nop
	setx 0xfffff8bffffffdb7, %g1, %g7
	.word 0xa3800007  ! 328: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99a089d1  ! 329: FDIVd	fdivd	%f2, %f48, %f12
DS_2_221:
	.word 0x91a109c0  ! 1: FDIVd	fdivd	%f4, %f0, %f8
	.word 0xbfe7c000  ! 330: SAVE_R	save	%r31, %r0, %r31
	.word 0xd46fe002  ! 331: LDSTUB_I	ldstub	%r10, [%r31 + 0x0002]
	rd %pc, %r19
	add %r19, (ivw_2_222-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_222:
	.word 0x91918004  ! 332: WRPR_PIL_R	wrpr	%r6, %r4, %pil
	.word 0xd43fc000  ! 333: STD_R	std	%r10, [%r31 + %r0]
change_to_randtl_2_223:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_223:
	.word 0x8f902002  ! 334: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x39400001  ! 335: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_225
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_225
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_225:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 336: RDPC	rd	%pc, %r10
mondo_2_226:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d94c014  ! 337: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
intveclr_2_227:
	setx 0x7815c34b904e86cb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 338: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_2_228:
	nop
	setx 0xffffff5dfffff7ea, %g1, %g7
	.word 0xa3800007  ! 339: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_229
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_229
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_229:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 340: RDPC	rd	%pc, %r12
	.word 0xab81e8a7  ! 341: WR_CLEAR_SOFTINT_I	wr	%r7, 0x08a7, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_230) + 16, 16, 16)) -> intp(1,0,30)
intvec_2_230:
	.word 0x39400001  ! 342: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8bfc020  ! 343: STDA_R	stda	%r20, [%r31 + %r0] 0x01
	setx 0x42a23dbcd8273675, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_231:
	.word 0x39400001  ! 344: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_2_232-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_232:
	.word 0x9192c00c  ! 345: WRPR_PIL_R	wrpr	%r11, %r12, %pil
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 346: Tcc_R	tne	icc_or_xcc, %r0 + %r30
cwp_2_233:
    set user_data_start, %o7
	.word 0x93902004  ! 347: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93697750  ! 348: SDIVX_I	sdivx	%r5, 0xfffff750, %r9
splash_cmpr_2_235:
	setx 0x09f51a9af2e68a71, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 349: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_236:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 350: SAVE_R	save	%r31, %r0, %r31
	.word 0xd727e0b3  ! 351: STF_I	st	%f11, [0x00b3, %r31]
	.word 0x95a00162  ! 352: FABSq	dis not found

	.word 0x91d020b5  ! 353: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xd6cfe010  ! 354: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
	.word 0x9f8020e0  ! 355: SIR	sir	0x00e0
	.word 0x99454000  ! 356: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
splash_cmpr_2_237:
	setx 0x2b6a229d707e51f8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 357: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9ba00163  ! 358: FABSq	dis not found

    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_238
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_238:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e003  ! 359: CASA_R	casa	[%r31] %asi, %r3, %r12
	.word 0x93454000  ! 360: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0xa7450000  ! 361: RD_SET_SOFTINT	rd	%set_softint, %r19
	.word 0x99902004  ! 362: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xa1a00168  ! 363: FABSq	dis not found

debug_2_239:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 364: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d903b96  ! 365: WRPR_PSTATE_I	wrpr	%r0, 0x1b96, %pstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_240:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 366: CASA_R	casa	[%r31] %asi, %r7, %r16
intveclr_2_241:
	setx 0x52a6fff95264ee6c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 367: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a0196b  ! 368: FqTOd	dis not found

	setx 0x57598a7c9f25a4ae, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_243:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1454000  ! 370: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
splash_hpstate_2_244:
	.word 0x81982944  ! 371: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0944, %hpstate
	.word 0xe497e030  ! 372: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r18
	.word 0xe4800ac0  ! 373: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r18
pmu_2_245:
	nop
	setx 0xfffff63cfffffce8, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_2_246-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_246:
	.word 0x91940002  ! 375: WRPR_PIL_R	wrpr	%r16, %r2, %pil
splash_cmpr_2_247:
	setx 0x25da06e40b0bb2a3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 376: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_248:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d930014  ! 377: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
	.word 0xe49fe0c9  ! 378: LDDA_I	ldda	[%r31, + 0x00c9] %asi, %r18
intveclr_2_249:
	setx 0x18d243c98c5b0428, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4c7e030  ! 380: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r18
memptr_2_250:
	set 0x60540000, %r31
	.word 0x85822617  ! 381: WRCCR_I	wr	%r8, 0x0617, %ccr
intveclr_2_251:
	setx 0xb612eefe03e6c4af, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 382: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_252:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 383: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 384: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d020b4  ! 385: Tcc_I	ta	icc_or_xcc, %r0 + 180
intveclr_2_253:
	setx 0x8aef3c69cf0bb7b7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 387: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_2_255:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d914004  ! 388: WRPR_WSTATE_R	wrpr	%r5, %r4, %wstate
	.word 0x9b45c000  ! 389: RD_TICK_CMPR_REG	rd	%-, %r13
mondo_2_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d924006  ! 390: WRPR_WSTATE_R	wrpr	%r9, %r6, %wstate
	setx 0xf50d07ff01bb8b31, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_257:
	.word 0x39400001  ! 391: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01967  ! 392: FqTOd	dis not found

mondo_2_259:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d900006  ! 393: WRPR_WSTATE_R	wrpr	%r0, %r6, %wstate
intveclr_2_260:
	setx 0x07c02891ac4f84a9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_2_261:
	nop
	setx 0xfffffe4efffffa00, %g1, %g7
	.word 0xa3800007  ! 395: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_2_262:
	set 0x60340000, %r31
	.word 0x8582b948  ! 396: WRCCR_I	wr	%r10, 0x1948, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_263)+24, 16, 16)) -> intp(2,1,3)
xir_2_263:
	.word 0xa980af7c  ! 397: WR_SET_SOFTINT_I	wr	%r2, 0x0f7c, %set_softint
	.word 0xa3540000  ! 398: RDPR_GL	<illegal instruction>
	.word 0x91a2c9cc  ! 399: FDIVd	fdivd	%f42, %f12, %f8
	.word 0xd0dfe010  ! 400: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
DS_1_1:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa7a0c9d2  ! 1: FDIVd	fdivd	%f34, %f18, %f50
	.word 0x93a1c829  ! 1: FADDs	fadds	%f7, %f9, %f9
	.word 0x91d02033  ! 2: Tcc_I	ta	icc_or_xcc, %r0 + 51
pmu_1_2:
	nop
	setx 0xfffff704fffff820, %g1, %g7
	.word 0xa3800007  ! 3: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 4: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_3:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e009  ! 5: CASA_R	casa	[%r31] %asi, %r9, %r9
DS_1_4:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 6: SAVE_R	save	%r31, %r0, %r31
intveclr_1_5:
	setx 0x0c4efda88e5d1706, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_6
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_6
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_6:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 8: RDPC	rd	%pc, %r11
cmp_1_7:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_7:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_7
    nop
cmp_wait1_7:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_7
    nop
    ba,a cmp_startwait1_7
continue_cmp_1_7:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x80, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9191800b  ! 9: WRPR_PIL_R	wrpr	%r6, %r11, %pil
change_to_randtl_1_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_8:
	.word 0x8f902002  ! 10: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_1_9:
	setx 0x96a8473baddb1a68, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 11: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 12: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_1_10:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 13: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_1_11:
	.word 0x9ba2c9c8  ! 1: FDIVd	fdivd	%f42, %f8, %f44
	pdist %f26, %f0, %f20
	.word 0xa3b4430d  ! 14: ALIGNADDRESS	alignaddr	%r17, %r13, %r17
splash_hpstate_1_12:
	.word 0x819825dc  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05dc, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01972  ! 16: FqTOd	dis not found

    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_14
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_14:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e012  ! 17: CASA_R	casa	[%r31] %asi, %r18, %r9
	.word 0xd277e0dc  ! 18: STX_I	stx	%r9, [%r31 + 0x00dc]
	.word 0x8d903940  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x1940, %pstate
DS_1_15:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa9b4430d  ! 20: ALIGNADDRESS	alignaddr	%r17, %r13, %r20
	.word 0xe807c000  ! 21: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0x95a149c6  ! 22: FDIVd	fdivd	%f36, %f6, %f10
	.word 0xd4c7e020  ! 23: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r10
debug_1_16:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 24: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_17:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e006  ! 25: CASA_R	casa	[%r31] %asi, %r6, %r10
memptr_1_18:
	set user_data_start, %r31
	.word 0x85817f81  ! 26: WRCCR_I	wr	%r5, 0x1f81, %ccr
mondo_1_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d910013  ! 27: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
	.word 0x3a700001  ! 28: BPCC	<illegal instruction>
	.word 0xd537c000  ! 29: STQF_R	-	%f10, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_20
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_20:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 30: RDPC	rd	%pc, %r13
	.word 0x97a00174  ! 31: FABSq	dis not found

splash_cmpr_1_21:
	setx 0xfc3dc0e2c889fa87, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 32: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd697e010  ! 33: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0x83d02035  ! 34: Tcc_I	te	icc_or_xcc, %r0 + 53
splash_hpstate_1_22:
	.word 0x8198218c  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018c, %hpstate
	.word 0xd66fe057  ! 36: LDSTUB_I	ldstub	%r11, [%r31 + 0x0057]
splash_cmpr_1_23:
	setx 0x64125e9be1c1f72d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 37: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_24:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_24:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_24
    nop
debug_wait1_24:
    ld [%r23], %r16
    brnz %r16, debug_wait1_24
    nop
    ba,a debug_startwait1_24
continue_debug_1_24:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_24:
    cmp %r13, %r17
    bne,a wait_for_stat_1_24
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_24:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_24
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %r13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00492  ! 38: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0xad816a41  ! 39: WR_SOFTINT_REG_I	wr	%r5, 0x0a41, %softint
	.word 0xd66fe036  ! 40: LDSTUB_I	ldstub	%r11, [%r31 + 0x0036]
intveclr_1_25:
	setx 0xb1929c9b2595c0b2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 41: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903b26  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x1b26, %pstate
	.word 0xd737c000  ! 43: STQF_R	-	%f11, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_26
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_26:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 44: RDPC	rd	%pc, %r10
mondo_1_27:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d91c007  ! 45: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
	.word 0x26800001  ! 46: BL	bl,a	<label_0x1>
	.word 0xd48008a0  ! 47: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_1_28:
	set 0x558592bb, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 48: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_1_29:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 49: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa7a00170  ! 50: FABSq	dis not found

	.word 0xe68008a0  ! 51: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
splash_tba_1_30:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 52: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d90319c  ! 53: WRPR_PSTATE_I	wrpr	%r0, 0x119c, %pstate
DS_1_31:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 54: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_32) + 8, 16, 16)) -> intp(0,0,27)
intvec_1_32:
	.word 0x39400001  ! 55: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x6f89e4fee68f5175, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_33:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_1_34:
	nop
	setx 0xffffff59fffffbe7, %g1, %g7
	.word 0xa3800007  ! 57: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_1_35:
	setx 0x82b622f3294c8ae1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956b29a0  ! 59: SDIVX_I	sdivx	%r12, 0x09a0, %r10
splash_cmpr_1_37:
	setx 0xf642ec0e77ff0f2c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 60: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_38) + 8, 16, 16)) -> intp(5,0,4)
intvec_1_38:
	.word 0x39400001  ! 61: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a009c4  ! 62: FDIVd	fdivd	%f0, %f4, %f40
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_39:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e004  ! 63: CASA_R	casa	[%r31] %asi, %r4, %r9
	.word 0xd2800c00  ! 64: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976860ff  ! 65: SDIVX_I	sdivx	%r1, 0x00ff, %r11
	bn  	 skip_1_41
	brlez,pt  	%r16, skip_1_41
.align 512
skip_1_41:
	.word 0xa7a149c7  ! 66: FDIVd	fdivd	%f36, %f38, %f50
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_42:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e007  ! 67: CASA_R	casa	[%r31] %asi, %r7, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01973  ! 68: FqTOd	dis not found

intveclr_1_44:
	setx 0x67707447c95637c0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_1_45:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0xa9b34305  ! 70: ALIGNADDRESS	alignaddr	%r13, %r5, %r20
	.word 0xe937c000  ! 71: STQF_R	-	%f20, [%r0, %r31]
cmp_1_46:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_46:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_46
    nop
cmp_wait1_46:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_46
    nop
    ba,a cmp_startwait1_46
continue_cmp_1_46:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x7c, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91930004  ! 72: WRPR_PIL_R	wrpr	%r12, %r4, %pil
change_to_randtl_1_47:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_47:
	.word 0x8f902000  ! 73: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_1_48:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_48:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_48
    nop
debug_wait1_48:
    ld [%r23], %r16
    brnz %r16, debug_wait1_48
    nop
    ba,a debug_startwait1_48
continue_debug_1_48:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_48:
    cmp %r13, %r17
    bne,a wait_for_stat_1_48
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_48:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_48
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %r10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00492  ! 74: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0x97a00165  ! 75: FABSq	dis not found

splash_tba_1_49:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 76: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	bge,a	 skip_1_50
	fbl skip_1_50
.align 128
skip_1_50:
	.word 0x93a249c1  ! 77: FDIVd	fdivd	%f40, %f32, %f40
	.word 0xd2c7e030  ! 78: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r9
	setx 0x821396e68f9f65e9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_51:
	.word 0x39400001  ! 79: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_1_52:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_52-donret_1_52), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0068daa8 | (0x83 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x6de, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_52:
	.word 0xd2ffe029  ! 80: SWAPA_I	swapa	%r9, [%r31 + 0x0029] %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76ae1b9  ! 81: SDIVX_I	sdivx	%r11, 0x01b9, %r19
mondo_1_54:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d948013  ! 82: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
	fbl,a,pn	%fcc0,  skip_1_55
	brlez,pn  	%r6, skip_1_55
.align 1024
skip_1_55:
	.word 0x91a289d3  ! 83: FDIVd	fdivd	%f10, %f50, %f8
intveclr_1_56:
	setx 0x4a8cb2c8df8ccf3c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 84: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95454000  ! 85: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
intveclr_1_57:
	setx 0x29f0b516d130750d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99a209cc  ! 87: FDIVd	fdivd	%f8, %f12, %f12
debug_1_58:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 88: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x5b4b6c458fb36a7c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_59:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_1_60:
	set user_data_start, %r31
	.word 0x85832762  ! 90: WRCCR_I	wr	%r12, 0x0762, %ccr
tagged_1_61:
	taddcctv %r23, 0x1f73, %r23
	.word 0xd807e0c4  ! 91: LDUW_I	lduw	[%r31 + 0x00c4], %r12
	.word 0xd927e01e  ! 92: STF_I	st	%f12, [0x001e, %r31]
splash_cmpr_1_62:
	setx 0x564bcc544b7276c6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 93: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_63:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_63:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_63
    nop
debug_wait1_63:
    ld [%r23], %r16
    brnz %r16, debug_wait1_63
    nop
    ba,a debug_startwait1_63
continue_debug_1_63:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_63:
    cmp %r13, %r17
    bne,a wait_for_stat_1_63
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_63:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_63
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %r10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd2f00492  ! 94: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
DS_1_64:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd532b4c3  ! 1: STQF_I	-	%f10, [0x14c3, %r10]
	normalw
	.word 0xa3458000  ! 95: RD_SOFTINT_REG	rd	%softint, %r17
	setx 0x2db00c29c2b5a649, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_65:
	.word 0x39400001  ! 96: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe0a0  ! 97: LDSTUB_I	ldstub	%r17, [%r31 + 0x00a0]
	.word 0x9b520000  ! 98: RDPR_PIL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_66
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_66:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 99: RDPC	rd	%pc, %r9
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 100: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02035  ! 101: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xa3480000  ! 102: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xe26fe041  ! 103: LDSTUB_I	ldstub	%r17, [%r31 + 0x0041]
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_67
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_67:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 104: RDPC	rd	%pc, %r8
	.word 0x91d02032  ! 105: Tcc_I	ta	icc_or_xcc, %r0 + 50
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_68
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_68:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 106: RDPC	rd	%pc, %r19
mondo_1_69:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d92c003  ! 107: WRPR_WSTATE_R	wrpr	%r11, %r3, %wstate
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
	.word 0xa7414000  ! 108: RDPC	rd	%pc, %r19
	.word 0x9f802e60  ! 109: SIR	sir	0x0e60
splash_cmpr_1_71:
	setx 0xcd2809f919b70fc6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 110: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 111: LDX_R	ldx	[%r31 + %r0], %r19
intveclr_1_72:
	setx 0x349cb128211d98c0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_73
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_73:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 113: CASA_R	casa	[%r31] %asi, %r3, %r19
	.word 0x2e800001  ! 114: BVS	bvs,a	<label_0x1>
pmu_1_74:
	nop
	setx 0xfffff11cfffffbd1, %g1, %g7
	.word 0xa3800007  ! 115: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_1_75:
    set user_data_start, %o7
	.word 0x93902004  ! 116: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01974  ! 117: FqTOd	dis not found

change_to_randtl_1_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_77:
	.word 0x8f902000  ! 118: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xda6fe0d2  ! 119: LDSTUB_I	ldstub	%r13, [%r31 + 0x00d2]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9686738  ! 120: SDIVX_I	sdivx	%r1, 0x0738, %r20
intveclr_1_79:
	setx 0xf360df5acc59320a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 121: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_80:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 122: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996afc59  ! 123: SDIVX_I	sdivx	%r11, 0xfffffc59, %r12
splash_tba_1_82:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 124: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x34800001  ! 125: BG	bg,a	<label_0x1>
	.word 0xa5a0016b  ! 126: FABSq	dis not found

DS_1_83:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x95a0054a  ! 1: FSQRTd	fsqrt	
	.word 0xa7a18831  ! 127: FADDs	fadds	%f6, %f17, %f19
cmp_1_84:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_84:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_84
    nop
cmp_wait1_84:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_84
    nop
    ba,a cmp_startwait1_84
continue_cmp_1_84:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x4c, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91908010  ! 128: WRPR_PIL_R	wrpr	%r2, %r16, %pil
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01967  ! 129: FqTOd	dis not found

DS_1_86:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f10, %f16, %f30
	.word 0x9bb44311  ! 130: ALIGNADDRESS	alignaddr	%r17, %r17, %r13
DS_1_87:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe931a1a5  ! 1: STQF_I	-	%f20, [0x01a5, %r6]
	normalw
	.word 0x93458000  ! 131: RD_SOFTINT_REG	rd	%softint, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_88) + 16, 16, 16)) -> intp(7,0,21)
intvec_1_88:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_89:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 133: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 134: LDX_R	ldx	[%r31 + %r0], %r9
donret_1_90:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_90-donret_1_90), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003765b9 | (0x4f << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0xb87, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_90:
	.word 0xd2ffe0bc  ! 135: SWAPA_I	swapa	%r9, [%r31 + 0x00bc] %asi
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_91
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_91:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 136: CASA_R	casa	[%r31] %asi, %r17, %r9
debug_1_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 137: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 138: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd21fc000  ! 139: LDD_R	ldd	[%r31 + %r0], %r9
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_93
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_93
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_93:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 140: RDPC	rd	%pc, %r13
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_94
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_94:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 141: CASA_R	casa	[%r31] %asi, %r17, %r13
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_95
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_95:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 142: RDPC	rd	%pc, %r11
	.word 0x93480000  ! 143: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x95a109c3  ! 144: FDIVd	fdivd	%f4, %f34, %f10
mondo_1_96:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d92c00a  ! 145: WRPR_WSTATE_R	wrpr	%r11, %r10, %wstate
pmu_1_97:
	nop
	setx 0xfffff578fffff5d1, %g1, %g7
	.word 0xa3800007  ! 146: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_1_98:
	setx 0x5983fa169aa01eab, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 147: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97a189d4  ! 148: FDIVd	fdivd	%f6, %f20, %f42
intveclr_1_99:
	setx 0x64008e4e41554b35, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 149: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_1_100:
	setx 0x26b17eda45541e2d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_101
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_101:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 151: RDPC	rd	%pc, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_102) + 40, 16, 16)) -> intp(3,0,16)
intvec_1_102:
	.word 0x39400001  ! 152: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x3e800001  ! 153: BVC	bvc,a	<label_0x1>
	.word 0x3c700001  ! 154: BPPOS	<illegal instruction>
	fbl skip_1_103
	fbuge,a,pn	%fcc0,  skip_1_103
.align 512
skip_1_103:
	.word 0xa3a449c7  ! 155: FDIVd	fdivd	%f48, %f38, %f48
	.word 0xe26fe0b7  ! 156: LDSTUB_I	ldstub	%r17, [%r31 + 0x00b7]
	.word 0x91d020b3  ! 157: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xe23fe0a0  ! 158: STD_I	std	%r17, [%r31 + 0x00a0]
	.word 0xa984c006  ! 159: WR_SET_SOFTINT_R	wr	%r19, %r6, %set_softint
	.word 0x99a0016a  ! 160: FABSq	dis not found

    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_104:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00a  ! 161: CASA_R	casa	[%r31] %asi, %r10, %r12
cmp_1_105:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_105:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_105
    nop
cmp_wait1_105:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_105
    nop
    ba,a cmp_startwait1_105
continue_cmp_1_105:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xf0, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91940010  ! 162: WRPR_PIL_R	wrpr	%r16, %r16, %pil
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_106:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 163: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0xd8cfe000  ! 164: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97693006  ! 165: SDIVX_I	sdivx	%r4, 0xfffff006, %r11
	.word 0xa1480000  ! 166: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
pmu_1_108:
	nop
	setx 0xfffff99bfffffedc, %g1, %g7
	.word 0xa3800007  ! 167: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	fbg,a,pn	%fcc0,  skip_1_109
	bleu  	 skip_1_109
.align 128
skip_1_109:
	.word 0x99a2c9c0  ! 168: FDIVd	fdivd	%f42, %f0, %f12
intveclr_1_110:
	setx 0x8e4e8ea4eccac274, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 169: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_1_111:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 170: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_1_112:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 171: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_1_113:
	setx 0x800a7bb7cde5f7d8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_1_114:
	set 0x55f7dcac, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 173: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd84fe096  ! 174: LDSB_I	ldsb	[%r31 + 0x0096], %r12
debug_1_115:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 175: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa7848008  ! 176: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r8, %-
mondo_1_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d91400c  ! 177: WRPR_WSTATE_R	wrpr	%r5, %r12, %wstate
	.word 0xd89fe058  ! 178: LDDA_I	ldda	[%r31, + 0x0058] %asi, %r12
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 179: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_1_118:
	setx 0x05c840876e6e03f3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8800ba0  ! 181: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r12
debug_1_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 182: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_120) + 32, 16, 16)) -> intp(0,0,30)
intvec_1_120:
	.word 0x39400001  ! 183: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cmp_1_121:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_121:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_121
    nop
cmp_wait1_121:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_121
    nop
    ba,a cmp_startwait1_121
continue_cmp_1_121:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 40, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91950012  ! 184: WRPR_PIL_R	wrpr	%r20, %r18, %pil
splash_hpstate_1_122:
	.word 0x819821c6  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c6, %hpstate
debug_1_123:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_123:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_123
    nop
debug_wait1_123:
    ld [%r23], %r16
    brnz %r16, debug_wait1_123
    nop
    ba,a debug_startwait1_123
continue_debug_1_123:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_123:
    cmp %r13, %r17
    bne,a wait_for_stat_1_123
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_123:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_123
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %r8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00492  ! 186: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
splash_cmpr_1_124:
	setx 0xfaf7cdf474c500ab, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 187: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd86fe06a  ! 188: LDSTUB_I	ldstub	%r12, [%r31 + 0x006a]
splash_cmpr_1_125:
	setx 0x1a1e9ea51820dae3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 189: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_126
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_126:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 190: RDPC	rd	%pc, %r11
	.word 0xd727e060  ! 191: STF_I	st	%f11, [0x0060, %r31]
splash_cmpr_1_127:
	setx 0x20801dbf0cab680e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_128:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d948012  ! 193: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
DS_1_129:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 194: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 195: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_1_130:
	setx 0x4b1cf35308d08e8c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2c800001  ! 197: BNEG	bneg,a	<label_0x1>
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
	.word 0xd7e7e012  ! 198: CASA_R	casa	[%r31] %asi, %r18, %r11
intveclr_1_132:
	setx 0xcf73e77cd7ef8f43, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_133:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 200: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_1_134:
	.word 0x8198249e  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049e, %hpstate
change_to_randtl_1_135:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_135:
	.word 0x8f902001  ! 202: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_136)+48, 16, 16)) -> intp(1,1,3)
xir_1_136:
	.word 0xa981f905  ! 203: WR_SET_SOFTINT_I	wr	%r7, 0x1905, %set_softint
cmp_1_137:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_137:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_137
    nop
cmp_wait1_137:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_137
    nop
    ba,a cmp_startwait1_137
continue_cmp_1_137:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x40, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91948007  ! 204: WRPR_PIL_R	wrpr	%r18, %r7, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01965  ! 205: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95683360  ! 206: SDIVX_I	sdivx	%r0, 0xfffff360, %r10
splash_cmpr_1_140:
	setx 0xf51a6febf1f50728, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_141:
	setx 0x7fd4a56ed1289978, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56c6eec  ! 209: SDIVX_I	sdivx	%r17, 0x0eec, %r18
donret_1_143:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_143-donret_1_143-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a0ad53 | (16 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x48d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_143:
	.word 0xe4ffe075  ! 210: SWAPA_I	swapa	%r18, [%r31 + 0x0075] %asi
debug_1_144:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_144:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_144
    nop
debug_wait1_144:
    ld [%r23], %r16
    brnz %r16, debug_wait1_144
    nop
    ba,a debug_startwait1_144
continue_debug_1_144:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_144:
    cmp %r13, %r17
    bne,a wait_for_stat_1_144
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_144:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_144
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %r9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 211: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936c24b6  ! 212: SDIVX_I	sdivx	%r16, 0x04b6, %r9
DS_1_146:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 213: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 214: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 215: BLEU	bleu,a	<label_0x1>
	.word 0xd337c000  ! 216: STQF_R	-	%f9, [%r0, %r31]
	be  	 skip_1_147
	fbe skip_1_147
.align 2048
skip_1_147:
	.word 0xa1a289d0  ! 217: FDIVd	fdivd	%f10, %f16, %f16
	.word 0xe06fe0ad  ! 218: LDSTUB_I	ldstub	%r16, [%r31 + 0x00ad]
intveclr_1_148:
	setx 0xe9d7c6f02d735a29, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0800a60  ! 220: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r16
mondo_1_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d948011  ! 221: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
intveclr_1_150:
	setx 0x9e6463e78deced5a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 222: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe06fe0e7  ! 223: LDSTUB_I	ldstub	%r16, [%r31 + 0x00e7]
	setx 0x2f5ed2fe53276d59, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_151:
	.word 0x39400001  ! 224: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_1_152:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 225: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d020b2  ! 226: Tcc_I	ta	icc_or_xcc, %r0 + 178
intveclr_1_153:
	setx 0x5e78cb2cc7f60846, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 227: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_1_154:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_154-donret_1_154), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00666f34 | (20 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x644, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_154:
	.word 0xe0ffe075  ! 228: SWAPA_I	swapa	%r16, [%r31 + 0x0075] %asi
pmu_1_155:
	nop
	setx 0xfffff92bfffffc78, %g1, %g7
	.word 0xa3800007  ! 229: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_1_156:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_156:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_156
    nop
debug_wait1_156:
    ld [%r23], %r16
    brnz %r16, debug_wait1_156
    nop
    ba,a debug_startwait1_156
continue_debug_1_156:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_156:
    cmp %r13, %r17
    bne,a wait_for_stat_1_156
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_156:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_156
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %r13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00492  ! 230: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
debug_1_157:
	nop
	.word 0xe6f00b12  ! 231: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_1_158:
	setx 0x96d01cbbc407713b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 232: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_1_159:
	setx 0x48455d6132ac3892, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 233: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 234: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xe0d7e000  ! 235: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
mondo_1_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d944007  ! 236: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
memptr_1_161:
	set 0x60540000, %r31
	.word 0x8582f52c  ! 237: WRCCR_I	wr	%r11, 0x152c, %ccr
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_162:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 238: CASA_R	casa	[%r31] %asi, %r7, %r16
splash_cmpr_1_163:
	setx 0x393b45f1d442b018, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 239: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976a3b96  ! 240: SDIVX_I	sdivx	%r8, 0xfffffb96, %r11
memptr_1_165:
	set user_data_start, %r31
	.word 0x85852582  ! 241: WRCCR_I	wr	%r20, 0x0582, %ccr
	.word 0x8d90353f  ! 242: WRPR_PSTATE_I	wrpr	%r0, 0x153f, %pstate
splash_lsu_1_166:
	set 0x55a58ae0, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 243: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x344e1388de31d292, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_167:
	.word 0x39400001  ! 244: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a00165  ! 245: FABSq	dis not found

	.word 0xe627e0e8  ! 246: STW_I	stw	%r19, [%r31 + 0x00e8]
cmp_1_168:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_168:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_168
    nop
cmp_wait1_168:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_168
    nop
    ba,a cmp_startwait1_168
continue_cmp_1_168:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xea, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91914005  ! 247: WRPR_PIL_R	wrpr	%r5, %r5, %pil
	.word 0x8d90211e  ! 248: WRPR_PSTATE_I	wrpr	%r0, 0x011e, %pstate
donret_1_169:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_169-donret_1_169-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001c44df | (0x4f << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x885, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_169:
	.word 0xe6ffe0e4  ! 249: SWAPA_I	swapa	%r19, [%r31 + 0x00e4] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_170) + 16, 16, 16)) -> intp(5,0,1)
intvec_1_170:
	.word 0x39400001  ! 250: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_1_171:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_171-donret_1_171-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004e66dd | (0x80 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x44c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_171:
	.word 0xe6ffe0da  ! 251: SWAPA_I	swapa	%r19, [%r31 + 0x00da] %asi
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_172
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_172:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e005  ! 252: CASA_R	casa	[%r31] %asi, %r5, %r19
splash_cmpr_1_173:
	setx 0x816ddde460f18db2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe62fe0a2  ! 254: STB_I	stb	%r19, [%r31 + 0x00a2]
    set 0x82e, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b347eb  ! 255: PDISTN	fmean16	%d44, %d42, %d42
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_174
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_174:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 256: CASA_R	casa	[%r31] %asi, %r11, %r11
cmp_1_175:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_175:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_175
    nop
cmp_wait1_175:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_175
    nop
    ba,a cmp_startwait1_175
continue_cmp_1_175:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x68, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91914002  ! 257: WRPR_PIL_R	wrpr	%r5, %r2, %pil
splash_hpstate_1_176:
	.word 0x8198228c  ! 258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028c, %hpstate
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
	.word 0x93414000  ! 259: RDPC	rd	%pc, %r9
intveclr_1_178:
	setx 0x3eea017a020070b4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 260: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_179:
	setx 0xf04f6f9a2e0d6b2b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 261: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd2d7e010  ! 262: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r9
memptr_1_180:
	set user_data_start, %r31
	.word 0x8580787f  ! 263: WRCCR_I	wr	%r1, 0x187f, %ccr
pmu_1_181:
	nop
	setx 0xfffff65bfffff666, %g1, %g7
	.word 0xa3800007  ! 264: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd337c000  ! 265: STQF_R	-	%f9, [%r0, %r31]
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
	.word 0x91414000  ! 266: RDPC	rd	%pc, %r8
DS_1_183:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x95a1c9c9  ! 1: FDIVd	fdivd	%f38, %f40, %f10
	.word 0xa1a00554  ! 1: FSQRTd	fsqrt	
	.word 0xa9a50826  ! 267: FADDs	fadds	%f20, %f6, %f20
donret_1_184:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_184-donret_1_184), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ffadf1 | (0x80 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x94, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_184:
	.word 0xe8ffe020  ! 268: SWAPA_I	swapa	%r20, [%r31 + 0x0020] %asi
	.word 0x93464000  ! 269: RD_STICK_CMPR_REG	rd	%-, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01960  ! 270: FqTOd	dis not found

debug_1_186:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_186:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_186
    nop
debug_wait1_186:
    ld [%r23], %r16
    brnz %r16, debug_wait1_186
    nop
    ba,a debug_startwait1_186
continue_debug_1_186:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_186:
    cmp %r13, %r17
    bne,a wait_for_stat_1_186
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_186:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_186
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %r19, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00492  ! 271: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_187
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_187
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_187:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 272: RDPC	rd	%pc, %r12
debug_1_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 273: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_189:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 274: RDPC	rd	%pc, %r12
	.word 0xd897e010  ! 275: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
	.word 0x34800001  ! 276: BG	bg,a	<label_0x1>
	.word 0x9b520000  ! 277: RDPR_PIL	<illegal instruction>
	.word 0xda6fe001  ! 278: LDSTUB_I	ldstub	%r13, [%r31 + 0x0001]
splash_htba_1_190:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 279: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x32700001  ! 280: BPNE	<illegal instruction>
tagged_1_191:
	taddcctv %r8, 0x14e1, %r9
	.word 0xda07e02a  ! 281: LDUW_I	lduw	[%r31 + 0x002a], %r13
intveclr_1_192:
	setx 0x8ad3d0a7c12485e5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 282: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x28800001  ! 283: BLEU	bleu,a	<label_0x1>
	.word 0x91464000  ! 284: RD_STICK_CMPR_REG	rd	%-, %r8
intveclr_1_193:
	setx 0xbc3aee4de836c78a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 285: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd117c000  ! 286: LDQF_R	-	[%r31, %r0], %f8
	.word 0x9545c000  ! 287: RD_TICK_CMPR_REG	rd	%-, %r10
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_194
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_194:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 288: CASA_R	casa	[%r31] %asi, %r0, %r10
debug_1_195:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_195:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_195
    nop
debug_wait1_195:
    ld [%r23], %r16
    brnz %r16, debug_wait1_195
    nop
    ba,a debug_startwait1_195
continue_debug_1_195:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_195:
    cmp %r13, %r17
    bne,a wait_for_stat_1_195
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_195:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_195
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %r18, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00492  ! 289: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
intveclr_1_196:
	setx 0x54dfc5d72440ff63, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_197:
	setx 0x1f3a660493c8a717, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 291: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d020b5  ! 292: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x99902005  ! 293: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
mondo_1_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d918009  ! 294: WRPR_WSTATE_R	wrpr	%r6, %r9, %wstate
splash_cmpr_1_199:
	setx 0x50689be7e1df568b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd46fe0c8  ! 296: LDSTUB_I	ldstub	%r10, [%r31 + 0x00c8]
	.word 0x9f8022dd  ! 297: SIR	sir	0x02dd
	.word 0x97480000  ! 298: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_200) + 56, 16, 16)) -> intp(0,0,15)
intvec_1_200:
	.word 0x39400001  ! 299: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d92000a  ! 300: WRPR_WSTATE_R	wrpr	%r8, %r10, %wstate
	.word 0xd727c000  ! 301: STF_R	st	%f11, [%r0, %r31]
mondo_1_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d900011  ! 302: WRPR_WSTATE_R	wrpr	%r0, %r17, %wstate
debug_1_203:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 303: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_1_204:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d90800d  ! 304: WRPR_WSTATE_R	wrpr	%r2, %r13, %wstate
intveclr_1_205:
	setx 0x8b5ce6cecc908a41, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 305: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01971  ! 306: FqTOd	dis not found

pmu_1_207:
	nop
	setx 0xffffff9dfffff616, %g1, %g7
	.word 0xa3800007  ! 307: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_1_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d92800b  ! 308: WRPR_WSTATE_R	wrpr	%r10, %r11, %wstate
	.word 0x9194aaed  ! 309: WRPR_PIL_I	wrpr	%r18, 0x0aed, %pil
	.word 0x8d903038  ! 310: WRPR_PSTATE_I	wrpr	%r0, 0x1038, %pstate
splash_lsu_1_209:
	set 0x55899d0a, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
	.word 0xa3414000  ! 312: RDPC	rd	%pc, %r17
donret_1_211:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_211-donret_1_211-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00728fbb | (4 << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x504, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_211:
	.word 0xe2ffe0dc  ! 313: SWAPA_I	swapa	%r17, [%r31 + 0x00dc] %asi
	.word 0x91d02034  ! 314: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe26fe0f6  ! 315: LDSTUB_I	ldstub	%r17, [%r31 + 0x00f6]
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_212
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_212:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 316: CASA_R	casa	[%r31] %asi, %r11, %r17
	setx 0x76decbdc487578f9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_213:
	.word 0x39400001  ! 317: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_1_214:
	setx 0x5f6003d616ec732e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a0196d  ! 320: FqTOd	dis not found

memptr_1_216:
	set user_data_start, %r31
	.word 0x8582eec1  ! 321: WRCCR_I	wr	%r11, 0x0ec1, %ccr
memptr_1_217:
	set 0x60140000, %r31
	.word 0x85843fc5  ! 322: WRCCR_I	wr	%r16, 0x1fc5, %ccr
donret_1_218:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_218-donret_1_218), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0012cbd3 | (0x8a << 24)), %r13
    wrpr %r13, %g0, %tstate
    wrhpr %g0, 0x51c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_218:
	.word 0xe4ffe056  ! 323: SWAPA_I	swapa	%r18, [%r31 + 0x0056] %asi
	.word 0x9b500000  ! 324: RDPR_TPC	<illegal instruction>
	.word 0xda6fe001  ! 325: LDSTUB_I	ldstub	%r13, [%r31 + 0x0001]
splash_lsu_1_219:
	set 0x55b06062, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 326: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902001  ! 327: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
pmu_1_220:
	nop
	setx 0xfffffc6efffff9d5, %g1, %g7
	.word 0xa3800007  ! 328: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa5a4c9cd  ! 329: FDIVd	fdivd	%f50, %f44, %f18
DS_1_221:
	.word 0x95a4c9c7  ! 1: FDIVd	fdivd	%f50, %f38, %f10
	.word 0xbfe7c000  ! 330: SAVE_R	save	%r31, %r0, %r31
	.word 0xd46fe0c9  ! 331: LDSTUB_I	ldstub	%r10, [%r31 + 0x00c9]
cmp_1_222:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_222:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_222
    nop
cmp_wait1_222:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_222
    nop
    ba,a cmp_startwait1_222
continue_cmp_1_222:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xbe, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91944006  ! 332: WRPR_PIL_R	wrpr	%r17, %r6, %pil
	.word 0xd43fc000  ! 333: STD_R	std	%r10, [%r31 + %r0]
change_to_randtl_1_223:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_223:
	.word 0x8f902001  ! 334: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	fbe,a,pn	%fcc0,  skip_1_224
	be  	 skip_1_224
.align 2048
skip_1_224:
	.word 0x39400001  ! 335: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_225
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_225
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_225:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 336: RDPC	rd	%pc, %r13
mondo_1_226:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d904014  ! 337: WRPR_WSTATE_R	wrpr	%r1, %r20, %wstate
intveclr_1_227:
	setx 0xff4dcb7049d5f76b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 338: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_1_228:
	nop
	setx 0xfffffdc9fffffacc, %g1, %g7
	.word 0xa3800007  ! 339: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_229
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_229
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_229:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 340: RDPC	rd	%pc, %r20
	.word 0xab8471b0  ! 341: WR_CLEAR_SOFTINT_I	wr	%r17, 0x11b0, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_230) + 32, 16, 16)) -> intp(5,0,14)
intvec_1_230:
	.word 0x39400001  ! 342: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8bfc020  ! 343: STDA_R	stda	%r20, [%r31 + %r0] 0x01
	setx 0x23d47eff53c26536, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_231:
	.word 0x39400001  ! 344: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    and %r14, 0, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9190000d  ! 345: WRPR_PIL_R	wrpr	%r0, %r13, %pil
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 346: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cwp_1_233:
    set user_data_start, %o7
	.word 0x93902006  ! 347: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976c67ee  ! 348: SDIVX_I	sdivx	%r17, 0x07ee, %r11
splash_cmpr_1_235:
	setx 0xd0172a8257b798c0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 349: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_236:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 350: SAVE_R	save	%r31, %r0, %r31
	.word 0xd727e0c8  ! 351: STF_I	st	%f11, [0x00c8, %r31]
	.word 0x97a00165  ! 352: FABSq	dis not found

	.word 0x91d02033  ! 353: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd6cfe030  ! 354: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
	.word 0x9f803ada  ! 355: SIR	sir	0x1ada
	.word 0x91454000  ! 356: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
splash_cmpr_1_237:
	setx 0x10d7e49cf0409cae, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 357: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a00163  ! 358: FABSq	dis not found

    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_238
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_238:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e003  ! 359: CASA_R	casa	[%r31] %asi, %r3, %r12
	.word 0x9b454000  ! 360: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	.word 0xa7450000  ! 361: RD_SET_SOFTINT	rd	%set_softint, %r19
	.word 0x99902002  ! 362: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xa1a00167  ! 363: FABSq	dis not found

debug_1_239:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 364: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d90279f  ! 365: WRPR_PSTATE_I	wrpr	%r0, 0x079f, %pstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_240:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 366: CASA_R	casa	[%r31] %asi, %r7, %r16
intveclr_1_241:
	setx 0x194e60f4f780158c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 367: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01970  ! 368: FqTOd	dis not found

	setx 0xcec1aee46c620588, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_243:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5454000  ! 370: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
splash_hpstate_1_244:
	.word 0x81982f07  ! 371: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f07, %hpstate
	.word 0xe497e010  ! 372: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r18
	.word 0xe48008a0  ! 373: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
pmu_1_245:
	nop
	setx 0xfffff797fffff90b, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cmp_1_246:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_246:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_246
    nop
cmp_wait1_246:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_246
    nop
    ba,a cmp_startwait1_246
continue_cmp_1_246:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x90, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91924001  ! 375: WRPR_PIL_R	wrpr	%r9, %r1, %pil
splash_cmpr_1_247:
	setx 0xa9d1cb5b67c6fb86, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 376: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_248:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d930013  ! 377: WRPR_WSTATE_R	wrpr	%r12, %r19, %wstate
	.word 0xe49fe0e1  ! 378: LDDA_I	ldda	[%r31, + 0x00e1] %asi, %r18
intveclr_1_249:
	setx 0x5d355ae112772844, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4c7e030  ! 380: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r18
memptr_1_250:
	set 0x60740000, %r31
	.word 0x8581efa5  ! 381: WRCCR_I	wr	%r7, 0x0fa5, %ccr
intveclr_1_251:
	setx 0x3c173417ff6e9227, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 382: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_252:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_252:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_252
    nop
debug_wait1_252:
    ld [%r23], %r16
    brnz %r16, debug_wait1_252
    nop
    ba,a debug_startwait1_252
continue_debug_1_252:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_252:
    cmp %r13, %r17
    bne,a wait_for_stat_1_252
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_252:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_252
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %r13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00492  ! 383: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 384: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02035  ! 385: Tcc_I	te	icc_or_xcc, %r0 + 53
intveclr_1_253:
	setx 0xbbf3af2b2bd125e3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 387: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_1_255:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d910013  ! 388: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
	.word 0x9945c000  ! 389: RD_TICK_CMPR_REG	rd	%-, %r12
mondo_1_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d950006  ! 390: WRPR_WSTATE_R	wrpr	%r20, %r6, %wstate
	setx 0x3513ce68b2265345, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_257:
	.word 0x39400001  ! 391: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196d  ! 392: FqTOd	dis not found

mondo_1_259:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d95000c  ! 393: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
intveclr_1_260:
	setx 0x8185378bbcacdeb2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_1_261:
	nop
	setx 0xfffff743fffffbca, %g1, %g7
	.word 0xa3800007  ! 395: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_1_262:
	set 0x60340000, %r31
	.word 0x858326bf  ! 396: WRCCR_I	wr	%r12, 0x06bf, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_263)+24, 16, 16)) -> intp(1,1,3)
xir_1_263:
	.word 0xa984eeb5  ! 397: WR_SET_SOFTINT_I	wr	%r19, 0x0eb5, %set_softint
	.word 0x91540000  ! 398: RDPR_GL	<illegal instruction>
	brz,pn  	%r12, skip_1_264
	.word 0x99a409d0  ! 1: FDIVd	fdivd	%f16, %f16, %f12
.align 32
skip_1_264:
	.word 0x24c84001  ! 399: BRLEZ	brlez,a,pt	%r1,<label_0x84001>
	.word 0xd0dfe020  ! 400: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r8
cmpenall_1_265:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmpenall_startwait1_265:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_1_265
    nop
cmpenall_wait1_265:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait1_265
    nop
    ba,a cmpenall_startwait1_265
continue_cmpenall_1_265:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_1_265:
    cmp %r13, %r14
    bne,a wait_for_cmpstat_1_265
    ldxa [0x58]%asi, %r14       !Running_status
    mov 0xff, %r14              !All threads running
    stxa %r14, [0x50]%asi 
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_1_265:
    cmp %r14, %r16
    bne,a wait_for_cmpstat2_1_265
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
	set 0x80000, %r2
    wrhpr %g2, %g0, %htba
    ta T_GOOD_TRAP
    nop
    nop
    nop
.data
    .xword 0x0

.global user_data_start
.data
user_data_start:

	.xword	0x27d4484a0dd8b25b
	.xword	0xe870ae3dd7def0ae
	.xword	0x61ee646d4759b33d
	.xword	0xc81084987a5ccc11
	.xword	0xcbecda945e4f64e7
	.xword	0x938b360a7e322f8d
	.xword	0x1dee5b7e578bf267
	.xword	0x1b4b9b49eb712539
	.xword	0x7e890dd713abb7b1
	.xword	0x7918d2c134eeaccf
	.xword	0x80f6341e16ced91c
	.xword	0xd5e616d619240421
	.xword	0xb9277e17cc67ae24
	.xword	0x01eeaf4cc0edae2d
	.xword	0x9fdd74ebdd5c4c7a
	.xword	0x3cb77ca6eb1f2fc1
	.xword	0x32f8392bc0ad4b35
	.xword	0xa0a933c9e8b501eb
	.xword	0x01d1981355f2a07f
	.xword	0xa1b1da2aa661e49c
	.xword	0x435478ed38254c68
	.xword	0x9d6602fa6dc73a00
	.xword	0x2d226acc77e81dd0
	.xword	0x06579b496c0033c4
	.xword	0xe66b429d9b7eaddc
	.xword	0xb3c8b3c4c366a45a
	.xword	0xa6aef00e861bb7d1
	.xword	0xaf6e5afbc5bf4886
	.xword	0x8f45ae4fd218daa4
	.xword	0xc44d4316048f4671
	.xword	0x0c6422225573d47f
	.xword	0x97efea6460827f93
	.xword	0x62bc8bcc1dbf23dd
	.xword	0x6934d737ea6fbfdb
	.xword	0x3533648119f2638f
	.xword	0x9b556433e1dac7f6
	.xword	0x0f665c4f183852f8
	.xword	0x6a2e04ac35c25460
	.xword	0xf6eeab70fbea36b8
	.xword	0x0f5fb692fe0adb2c
	.xword	0x36cb1fb1f96e089c
	.xword	0x277fb56f76d4c67b
	.xword	0x56f43ebeb4af1eb7
	.xword	0x9c53ae021da6469c
	.xword	0xdb53e6d99e3dd030
	.xword	0x15425050556fe3bc
	.xword	0x1b8613268054a1e1
	.xword	0x4ceefcd45eba7795
	.xword	0x1c4fe999d8aa1758
	.xword	0xbcb4a3ebe4449ee4
	.xword	0xc763bdd732aa0035
	.xword	0xc08b28033e1270c7
	.xword	0x2b1611ba986ebb65
	.xword	0x821c54ae68a1a35f
	.xword	0x8603e903aa13bc8b
	.xword	0x7ab92cb32b24744b
	.xword	0x9612194f6e341b8b
	.xword	0x2661f1f5fc21a4f9
	.xword	0xe5baad836238263b
	.xword	0x0d6d5c93eeb638fd
	.xword	0xb09c8f19ef183f58
	.xword	0x56fd05dd4acee995
	.xword	0x0b7a6a295f8cf5fb
	.xword	0xe0379b8f6508d1c9
	.xword	0xb61c344a0ac9dec7
	.xword	0x84a65b7eed2f06ba
	.xword	0x3b5140d3bfc4e343
	.xword	0xf565d3ec0f0f092d
	.xword	0x91bfefaa440c5ec6
	.xword	0xe073a25a3dd7cd1b
	.xword	0x304b4dd06203f88b
	.xword	0xdc2931997f3b803b
	.xword	0x5f4262bac91d2454
	.xword	0x37064adf1cb2470a
	.xword	0xca75e3fc62c4ff8f
	.xword	0x760afb460f062c6b
	.xword	0xacf9d03e511ebcb7
	.xword	0x4f45288d5e52bf74
	.xword	0x7713d31904d7ef95
	.xword	0x3db7cd5a45a4d781
	.xword	0xd241b9f77ebfc1b9
	.xword	0x2b6bd902f897facf
	.xword	0xdd19b531546d7da2
	.xword	0x8f21401cd3f7be8e
	.xword	0xa013e43752ce39a0
	.xword	0x90b0fee563a444a6
	.xword	0x4b04761e38792423
	.xword	0x9681ea89e394a45e
	.xword	0xec4159ec9e47be42
	.xword	0xacb084dbeae49daf
	.xword	0x63f9cb34bca00122
	.xword	0x8129fc8fb4caaae4
	.xword	0xcdd641fc2c1014dd
	.xword	0x8cd2601e5a5f71fe
	.xword	0x44ed29537a1769e5
	.xword	0x6a1047f803f4978b
	.xword	0x4730264c62ae7a81
	.xword	0x970dd0117aba1f79
	.xword	0x8fd5d68eadf9c600
	.xword	0x170f504aa49bd323
	.xword	0x71f5ffc5cc0bc55e
	.xword	0x638605cf6e3b0e91
	.xword	0xbc646b905fc41c84
	.xword	0x968014285d3f5f37
	.xword	0x072c5c146ff0967c
	.xword	0xe445afff985c0a82
	.xword	0x41dc2e6d88e93e90
	.xword	0x7e772c23fe08cdcc
	.xword	0xd7aaaac6ee67cdd4
	.xword	0x268c50cef16a831c
	.xword	0x73b134754b630422
	.xword	0xd4d0cc0a82cdddcc
	.xword	0xbb973e774d3ac7a5
	.xword	0xf2091a3c8ab267bc
	.xword	0xb0736f9b8ff4b410
	.xword	0x2cdca084ab28f5c8
	.xword	0x973e7c0db0eccd08
	.xword	0x3f728a9a343b3035
	.xword	0x996256c4bc4b8dea
	.xword	0xbb544fbca20df1b0
	.xword	0xf345d929c6cc331d
	.xword	0x3e8a79c30fc02db7
	.xword	0xefeba5e8fa32d1a7
	.xword	0x9ec74cc2a6e7c281
	.xword	0x6737cd1b914f7b25
	.xword	0xf47bfe68e5b88bc7
	.xword	0xb1b4999bfb17eca6
	.xword	0x35b33146c1671c20
	.xword	0xcbddfd3bfa25a497
	.xword	0x0adb551260a96b1e
	.xword	0x0ef86b83aec3b1b4
	.xword	0x6dcbccd248dfa2aa
	.xword	0xdebc7617e9d140f4
	.xword	0xbabfe359684ea373
	.xword	0x1c11c77efd80caa8
	.xword	0xfe88eec9c23105d7
	.xword	0xbeba4c6a2bba6974
	.xword	0x46c7b1588214d8e7
	.xword	0x4c337bce1efdce95
	.xword	0x34b2c4a1b957e4d9
	.xword	0x7720bf6578ab2b40
	.xword	0x206a92b460942070
	.xword	0x3693456a3c28ca9a
	.xword	0x51d289aa6093e173
	.xword	0x4977933de6e177a6
	.xword	0xfe441aa1cc7a7139
	.xword	0x45fe0a50a2432b8a
	.xword	0xe52646c9ac939c17
	.xword	0xd01a37e5797e2402
	.xword	0x1a7a192f417bff91
	.xword	0x8cb05bc93ab373d9
	.xword	0x652269dfb72e8012
	.xword	0x5b38fd55ce065329
	.xword	0x686f245a00480578
	.xword	0x20166d651aaddfbc
	.xword	0xff5f4f59cc6aeeba
	.xword	0x64c15abd5a9b587b
	.xword	0x6a31a33099d251f6
	.xword	0xc7db52adaa2dc7c6
	.xword	0x6c057742ada41aed
	.xword	0x413d30a1dd1f6f57
	.xword	0x330ee6afe925738e
	.xword	0x45995bde62525c6c
	.xword	0x5d9c34c06d2ed412
	.xword	0xccc4f6f107ddde20
	.xword	0x638a5964f287414a
	.xword	0x3b61c2170a50d01f
	.xword	0x61aace80e05b3c30
	.xword	0x94e8d7164794ce41
	.xword	0x3ad5aaafe07436be
	.xword	0xac5ce900b0309f7c
	.xword	0x6113cd01176ab042
	.xword	0xb5cd91a7ec58c19a
	.xword	0x47f2bd897ff057ca
	.xword	0x97ab7b921f38b028
	.xword	0x61073fa543d29449
	.xword	0x6c6ea9a0b3fea24d
	.xword	0x054f3e61dccee2f6
	.xword	0x5fcb1596e60098be
	.xword	0x57c8b5c241e29f8d
	.xword	0xa3ff65c9c265e36b
	.xword	0xf9ce58318a6a25c0
	.xword	0x3d5898e06a14d34d
	.xword	0x073d71cd3be6c19b
	.xword	0xd2108c7a0095dd6a
	.xword	0x47b5a59404eb89a1
	.xword	0x774406946fbeb69f
	.xword	0x8e341affe23e6975
	.xword	0xc8b01554a570e76a
	.xword	0xf8e2bad891dc72da
	.xword	0x176d1dad7a0ee4da
	.xword	0xb4078d9621ac0079
	.xword	0x9ade75ffa1ed2647
	.xword	0x4ae9275121429141
	.xword	0x9f3bf3b5b5abcffa
	.xword	0xa8db7a858cd519b2
	.xword	0xdf53a4516b6ef550
	.xword	0x666857cabb4c2379
	.xword	0x0e88ece78bb9eb0e
	.xword	0x5e7826d0981e49be
	.xword	0x216b96af6735c7d8
	.xword	0x39deb6813350e1e4
	.xword	0xf75b5dd78d6c33f1
	.xword	0x623bb76bd1d49998
	.xword	0xefacaffbaee9735c
	.xword	0xc8b7b536cdeae96a
	.xword	0x1612f531fe956f9e
	.xword	0x884793d09d3cff51
	.xword	0xd9236c6e4b142528
	.xword	0xdfbdd0e7db776056
	.xword	0x5590318c0c58273b
	.xword	0x016174d1c66aa7d4
	.xword	0x7417801a739be42b
	.xword	0x5a2574c449c14e86
	.xword	0x2211402bf82a37aa
	.xword	0x69cca97acbc4bba3
	.xword	0xd87ae334b11b73c1
	.xword	0xef9b6a050cd4608b
	.xword	0x15682b0b12a8e9a9
	.xword	0x1cadc66b02c7bcea
	.xword	0x93bab54a016addd5
	.xword	0x0e4ad7cf0dd78829
	.xword	0x4d2fe1c6fa6d6e98
	.xword	0x1dda9d84f3bd099b
	.xword	0x8f84bb33b70c40d5
	.xword	0x185e68af5836b188
	.xword	0x2c4a4c1288714ea4
	.xword	0x336b03006d8623bc
	.xword	0x800fc6d0ad5b79b4
	.xword	0x0ea5f97788349405
	.xword	0x66342b7e6e2d2127
	.xword	0x2ef7295a83683d1d
	.xword	0x623ba6dc544c2168
	.xword	0x42103434f7632870
	.xword	0x70412147c6b5309c
	.xword	0x2e4d64ad2ecc7e05
	.xword	0x78208b4f6dcf6737
	.xword	0xfd0daf1b3eafbfa4
	.xword	0xae3704f5b6f46003
	.xword	0x3ea3bac2381b0911
	.xword	0x576b02472f55526d
	.xword	0x7f5b5cd119c0af2d
	.xword	0xaa59bfcf8feb9400
	.xword	0xe2a5646f69c12676
	.xword	0x09939698c20a71e9
	.xword	0xd91c7271a2fc2b39
	.xword	0x0b1a4096acc07d6f
	.xword	0x0f4ad2f404803a18
	.xword	0xaf0128ce5308ef58
	.xword	0x271aabe0189d25bd
	.xword	0x7a212f1c90b21ed8
	.xword	0xed30f58ae0c397e6
	.xword	0x331e9630e8013876
	.xword	0x425699d571cb189b
	.xword	0x0c8e0917efff840b
	.xword	0xdec33e0339eea049

.global wdog_2_ext
# 9 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
.global wdog_2_ext
.global retry_with_base_tba

SECTION .HTRAPS
.text
retry_with_base_tba:
    set 0x120000, %r5
    set 0x7fff, %r3
    rdpr %tpc, %r4
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
# 73 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
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
# 547 "diag.j"
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



SECTION .MyHTRAPS_0 TEXT_VA = 0x0000000000380000, DATA_VA = 0x000000000038c000
attr_text {
	Name	 = .MyHTRAPS_0,
	RA	 = 0x0000000000380000,
	PA	 = ra2pa(0x0000000000380000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = 0,
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
	TTE_P	 = 1,
	TTE_W	 = 0,
	TTE_X	 = 0
}


attr_data {
	Name	 = .MyHTRAPS_0,
	RA	 = 0x000000000038c000,
	PA	 = ra2pa(0x000000000038c000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = 0,
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
	TTE_P	 = 1,
	TTE_W	 = 0
}


attr_text {
	Name	 = .MyHTRAPS_0,
	hypervisor
}


attr_data {
	Name	 = .MyHTRAPS_0,
	hypervisor
}

#include "htraps.s"
#include "tlu_htraps_ext.s"



SECTION .MyHTRAPS_1 TEXT_VA = 0x0000000000390000, DATA_VA = 0x000000000039c000
attr_text {
	Name	 = .MyHTRAPS_1,
	RA	 = 0x0000000000390000,
	PA	 = ra2pa(0x0000000000390000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = 0,
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
	TTE_P	 = 1,
	TTE_W	 = 0,
	TTE_X	 = 0
}


attr_data {
	Name	 = .MyHTRAPS_1,
	RA	 = 0x000000000039c000,
	PA	 = ra2pa(0x000000000039c000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = 0,
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
	TTE_P	 = 1,
	TTE_W	 = 0
}


attr_text {
	Name	 = .MyHTRAPS_1,
	hypervisor
}


attr_data {
	Name	 = .MyHTRAPS_1,
	hypervisor
}

#include "htraps.s"
#include "tlu_htraps_ext.s"



SECTION .MyHTRAPS_2 TEXT_VA = 0x00000000003a0000, DATA_VA = 0x00000000003ac000
attr_text {
	Name	 = .MyHTRAPS_2,
	RA	 = 0x00000000003a0000,
	PA	 = ra2pa(0x00000000003a0000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = 0,
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
	TTE_P	 = 1,
	TTE_W	 = 0,
	TTE_X	 = 0
}


attr_data {
	Name	 = .MyHTRAPS_2,
	RA	 = 0x00000000003ac000,
	PA	 = ra2pa(0x00000000003ac000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = 0,
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
	TTE_P	 = 1,
	TTE_W	 = 0
}


attr_text {
	Name	 = .MyHTRAPS_2,
	hypervisor
}


attr_data {
	Name	 = .MyHTRAPS_2,
	hypervisor
}

#include "htraps.s"
#include "tlu_htraps_ext.s"



SECTION .MyHTRAPS_3 TEXT_VA = 0x00000000003b0000, DATA_VA = 0x00000000003bc000
attr_text {
	Name	 = .MyHTRAPS_3,
	RA	 = 0x00000000003b0000,
	PA	 = ra2pa(0x00000000003b0000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = 0,
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
	TTE_P	 = 1,
	TTE_W	 = 0,
	TTE_X	 = 0
}


attr_data {
	Name	 = .MyHTRAPS_3,
	RA	 = 0x00000000003bc000,
	PA	 = ra2pa(0x00000000003bc000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = 0,
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
	TTE_P	 = 1,
	TTE_W	 = 0
}


attr_text {
	Name	 = .MyHTRAPS_3,
	hypervisor
}


attr_data {
	Name	 = .MyHTRAPS_3,
	hypervisor
}

#include "htraps.s"
#include "tlu_htraps_ext.s"





SECTION .MyTRAPS_0 TEXT_VA = 0x00000000003c0000, DATA_VA = 0x00000000003cc000
attr_text {
	Name	 = .MyTRAPS_0,
	RA	 = 0x00000000003c0000,
	PA	 = ra2pa(0x00000000003c0000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = 0,
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
	TTE_P	 = 1,
	TTE_W	 = 0,
	TTE_X	 = 1
}


attr_data {
	Name	 = .MyTRAPS_0,
	RA	 = 0x00000000003cc000,
	PA	 = ra2pa(0x00000000003cc000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = 0,
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
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}


attr_text {
	Name	 = .MyTRAPS_0,
	hypervisor
}


attr_data {
	Name	 = .MyTRAPS_0,
	hypervisor
}

#include "traps.s"



SECTION .MyTRAPS_1 TEXT_VA = 0x00000000003d0000, DATA_VA = 0x00000000003dc000
attr_text {
	Name	 = .MyTRAPS_1,
	RA	 = 0x00000000003d0000,
	PA	 = ra2pa(0x00000000003d0000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = 0,
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
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0,
	TTE_X	 = 0
}


attr_data {
	Name	 = .MyTRAPS_1,
	RA	 = 0x00000000003dc000,
	PA	 = ra2pa(0x00000000003dc000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = 0,
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
	TTE_P	 = 1,
	TTE_W	 = 0
}


attr_text {
	Name	 = .MyTRAPS_1,
	hypervisor
}


attr_data {
	Name	 = .MyTRAPS_1,
	hypervisor
}

#include "traps.s"



SECTION .MyTRAPS_2 TEXT_VA = 0x00000000003e0000, DATA_VA = 0x00000000003ec000
attr_text {
	Name	 = .MyTRAPS_2,
	RA	 = 0x00000000003e0000,
	PA	 = ra2pa(0x00000000003e0000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = 0,
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
	TTE_W	 = 0,
	TTE_X	 = 1
}


attr_data {
	Name	 = .MyTRAPS_2,
	RA	 = 0x00000000003ec000,
	PA	 = ra2pa(0x00000000003ec000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = 0,
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
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}


attr_text {
	Name	 = .MyTRAPS_2,
	hypervisor
}


attr_data {
	Name	 = .MyTRAPS_2,
	hypervisor
}

#include "traps.s"



SECTION .MyTRAPS_3 TEXT_VA = 0x00000000003f0000, DATA_VA = 0x00000000003fc000
attr_text {
	Name	 = .MyTRAPS_3,
	RA	 = 0x00000000003f0000,
	PA	 = ra2pa(0x00000000003f0000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = 0,
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
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0,
	TTE_X	 = 0
}


attr_data {
	Name	 = .MyTRAPS_3,
	RA	 = 0x00000000003fc000,
	PA	 = ra2pa(0x00000000003fc000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = 0,
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
	TTE_W	 = 0
}


attr_text {
	Name	 = .MyTRAPS_3,
	hypervisor
}


attr_data {
	Name	 = .MyTRAPS_3,
	hypervisor
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
	.xword	0x09a5eb8aa3bb96fb
	.xword	0x2d7f005791b61fcf
	.xword	0x46a94a36be6c99ae
	.xword	0x227fd2706f69f4d5
	.xword	0x08f7035dc830a54b
	.xword	0x125cd505ecb4fc62
	.xword	0x7b8966bc6fbbf9a8
	.xword	0x15eba983d2ef9c44
	.xword	0x6e7e48fb12e642a8
	.xword	0xddd8b6fa4fb6e5e1
	.xword	0xadf25997a70f392f
	.xword	0xc2630327cc59b180
	.xword	0x9a104e2bf10b8148
	.xword	0xb7fd3029b1081728
	.xword	0x2f0efd8ddbe88c5c
	.xword	0xae1f6b81f9c01e6e
	.xword	0xf3e6b40d221f5bf2
	.xword	0x5742540fecad0a5d
	.xword	0xe24476689c51828a
	.xword	0x5986578ca4dd176f
	.xword	0x0d8fa18cc23e2050
	.xword	0xade958659bb06422
	.xword	0x7a1ad11dfd204b15
	.xword	0x9e47d5e0bf34c00a
	.xword	0x883eb1ea7f1b65ea
	.xword	0x51ae249d1f3070a4
	.xword	0x3ea8a5a39cdab03d
	.xword	0x9bc89a932318a66d
	.xword	0x1b807273a6b5e903
	.xword	0xedfaa2a9b31ed44f
	.xword	0xc77eeb9bd67b8325
	.xword	0x2935fc32d024f161



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


attr_data {
	Name	 = .MyDATA_1,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_1,
	hypervisor
}

.data
	.xword	0x882bfb6536ba4c3e
	.xword	0x2dfd872fbe2c4dcf
	.xword	0x67f4150e4326ab30
	.xword	0x1002548964d4865d
	.xword	0x146e84469e287905
	.xword	0xb53f28881fbfe6bd
	.xword	0x95153ffd53d2e05b
	.xword	0xb170c00f08c9b010
	.xword	0x89c26c67bef80e12
	.xword	0x15257e84916967b0
	.xword	0x3edebe089bd6e325
	.xword	0x8811d77862c253a4
	.xword	0x178d7a54de4c9987
	.xword	0x087cdc982377c02b
	.xword	0x06636e1be37e993b
	.xword	0xa5c6947cdeba46e8
	.xword	0x27f617aec424bc4a
	.xword	0x603ec17197b835e1
	.xword	0x2288ee567cfae73d
	.xword	0x87b651a9442f7d2e
	.xword	0x8a35fa8a358c2b4e
	.xword	0xcc41f895d23668f9
	.xword	0xed2c06dd2cffc806
	.xword	0x6f3a387152630418
	.xword	0x5aefdf0bad1538c5
	.xword	0x158dd1d39139b1c1
	.xword	0xbcc533c935b946b9
	.xword	0x6e2384df7b075675
	.xword	0x831b74587c57376b
	.xword	0x5a11ab6aeeedc8c4
	.xword	0xf89f388cc68187c9
	.xword	0x29d4f0b30e3a7c22



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
	Name	 = .MyDATA_2,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_2,
	hypervisor
}

.data
	.xword	0x67580e8a26d3588b
	.xword	0xae1a1c25d10d924e
	.xword	0x47eafd240b0368bc
	.xword	0x03f974e12c89867c
	.xword	0x4043a575893969db
	.xword	0x4bbbd46f0c71df76
	.xword	0xd7d93c766eb03c05
	.xword	0x29f5fb1504faf938
	.xword	0xec5773d45818eaef
	.xword	0x25a850e7f0971e3f
	.xword	0x38db1983c2afba44
	.xword	0x6d1d2b5ba469a93a
	.xword	0x9612c6b96d32f40b
	.xword	0xe326f8b78d87b4a1
	.xword	0x344f2cabac4dbe94
	.xword	0x6c6647afd38414da
	.xword	0xde349958b7bb21fc
	.xword	0xa306dca2e21017d3
	.xword	0x04f6c91be7dd6f76
	.xword	0x010be73c989a8534
	.xword	0x5312bbd0460757e0
	.xword	0xd520912a588fc52d
	.xword	0x48d0f5030153758e
	.xword	0xc96b7bb11e48d583
	.xword	0x66f49e38f2fd31e7
	.xword	0xdc81f1d55da20dea
	.xword	0x8f499cf678f553cb
	.xword	0x4b61a8fc67ea710a
	.xword	0xf1ea1ea0f6a8ea62
	.xword	0x22c7d3db3629a6ab
	.xword	0x74bc9123c3d92061
	.xword	0x90a061e331621296



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
	TTE_Size	 = 1,
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
	Name	 = .MyDATA_3,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_3,
	hypervisor
}

.data
	.xword	0xe5babc80e743a5c7
	.xword	0x32bb745b7f8f6c19
	.xword	0x2de4bc0ef87f7db2
	.xword	0x416553afb34a3422
	.xword	0xe11140375f896557
	.xword	0xbfbed4ba6c460a44
	.xword	0x804a21b9bf9d2e82
	.xword	0x58c83e23c480fce2
	.xword	0x20ad00863a884364
	.xword	0xd3362652a15a6e87
	.xword	0x3bf7d46210f0e08a
	.xword	0xa93728e2a67bd44d
	.xword	0x6338ff618207c777
	.xword	0x7746333ec322ad31
	.xword	0x6400b35e7abbb7e3
	.xword	0x4d92a486e7a0a572
	.xword	0x456ae84e92e76c77
	.xword	0xe4fe4176847afbac
	.xword	0xe5fb147a4ff7a767
	.xword	0x2568f3b27814529c
	.xword	0xa1f56403c5229c59
	.xword	0x4fba4a3dc09686d7
	.xword	0xb732185c9e8fc5d1
	.xword	0xe7074db0e20e9323
	.xword	0x03a42cf8ba5b4367
	.xword	0x6fdb79d5e599a62a
	.xword	0xe59c4b458b4e60b1
	.xword	0xe34aae08988e7f13
	.xword	0x5e26481530de1151
	.xword	0xce0ff5f60fb41473
	.xword	0xe8ba9cc3fe2d28f6
	.xword	0x8a0e166b99c21a36



#if 0
#endif

