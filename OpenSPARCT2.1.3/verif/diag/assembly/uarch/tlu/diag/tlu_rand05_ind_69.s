/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_69.s
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
# 419 "diag.j"
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

#define H_HT0_mem_real_range_0x2d
#define SUN_H_HT0_mem_real_range_0x2d \
    HT_HANDLER_RAND4_2;\
    done;
# 759 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 775 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_unauth_access_0x0b
#define SUN_H_HT0_IAE_unauth_access_0x0b \
    HT_HANDLER_RAND7_3;\
    done;
# 781 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_nfo_page_0x0c
#define SUN_H_HT0_IAE_nfo_page_0x0c \
    HT_HANDLER_RAND7_6;\
    done;
# 787 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_Reserved_0x3b
#define SUN_H_HT0_Reserved_0x3b \
    mov 0x80, %l3;\
    stxa %l3, [%l3]0x5f ;\
    stxa %l3, [%l3]0x57 ;\
    done;
# 797 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 431 "diag.j"
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

#define H_HT0_Instruction_Access_MMU_Error_0x71 inst_access_mmu_error_handler
#define H_HT0_Instruction_access_error_0x0a inst_access_error_handler
#define H_HT0_Internal_Processor_Error_0x29 int_proc_err_handler
#define H_HT0_Data_Access_MMU_Error_0x72 data_access_mmu_error_handler
#define H_HT0_Data_access_error_0x32 data_access_error_handler
#define H_HT0_Hw_Corrected_Error_0x63 hw_corrected_error_handler
#define H_HT0_Sw_Recoverable_Error_0x40 sw_recoverable_error_handler
#define H_HT0_Store_Error_0x07 store_error_handler

#include "hboot.s"

# 489 "diag.j"
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
	mov 0xb0, %r14
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
	mov 0xb4, %r14
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
	mov 0x35, %r14
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
	mov 0x30, %r14
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
	mov 0xb2, %r14
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
	mov 0xb5, %r14
	mov 0x31, %r30
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
	sub %r15, 8, %r20
	jmp %r20
	.word 0xc32fc000  ! 1: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	nop
	jmp %r20
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
splash_cmpr_80_0:
	nop
	setx 0x35ca22b85a4e0dbf, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 1: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x81510000  ! 2: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe1bfdb60  ! 3: STDFA_R	stda	%f16, [%r0, %r31]
	setx 0xefea03301d248bac, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_1:
	.word 0x39400001  ! 4: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 5: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_80_2:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d944012  ! 6: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc19fde00  ! 8: LDDFA_R	ldda	[%r31, %r0], %f0
br_badelay2_80_3:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x93b50312  ! 9: ALIGNADDRESS	alignaddr	%r20, %r18, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_4) + 8, 16, 16)) -> intp(4,0,12)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_4)&0xffffffff)  + 8, 16, 16)) -> intp(4,0,12)
intvec_80_4:
	.word 0x39400001  ! 10: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe477e060  ! 11: STX_I	stx	%r18, [%r31 + 0x0060]
donret_80_5:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_5-donret_80_5-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0029717c | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7cd, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_5:
	.word 0xe4ffe05e  ! 12: SWAPA_I	swapa	%r18, [%r31 + 0x005e] %asi
splash_cmpr_80_6:
	nop
	setx 0xe69e6f642bf50d50, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 13: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x87aa4a4d  ! 14: FCMPd	fcmpd	%fcc<n>, %f40, %f44
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 15: Tcc_R	tne	icc_or_xcc, %r0 + %r30
vahole_80_7:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe6bfc032  ! 16: STDA_R	stda	%r19, [%r31 + %r18] 0x01
br_badelay2_80_8:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f20, %f22, %f28
	.word 0xa1b14314  ! 17: ALIGNADDRESS	alignaddr	%r5, %r20, %r16
	.word 0xa9a00172  ! 18: FABSq	dis not found

	.word 0xb1800011  ! 19: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xad84fedf  ! 20: WR_SOFTINT_REG_I	wr	%r19, 0x1edf, %softint
	.word 0xd877c000  ! 21: STX_R	stx	%r12, [%r31 + %r0]
splash_tba_80_9:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 22: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd89fe008  ! 23: LDDA_I	ldda	[%r31, + 0x0008] %asi, %r12
jmptr_80_10:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 24: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_80_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d948014  ! 25: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0x97a1c9d4  ! 26: FDIVd	fdivd	%f38, %f20, %f42
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_12)+40, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_12)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_12:
	.word 0xa981fd48  ! 27: WR_SET_SOFTINT_I	wr	%r7, 0x1d48, %set_softint
	.word 0x9f803722  ! 28: SIR	sir	0x1722
intveclr_80_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0x169770462810de02, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 29: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon_80_14:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xe8bfc031  ! 30: STDA_R	stda	%r20, [%r31 + %r17] 0x01
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_15
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_15:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 31: RDPC	rd	%pc, %r11
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_16
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_16:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 32: CASA_R	casa	[%r31] %asi, %r17, %r9
splash_cmpr_80_17:
	nop
	setx 0x4757096b08e988dd, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 33: WRPR_TICK_R	wrpr	%r0, %r17, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_18) + 16, 16, 16)) -> intp(5,0,16)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_18)&0xffffffff)  + 16, 16, 16)) -> intp(5,0,16)
intvec_80_18:
	.word 0x39400001  ! 34: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd26fe0b4  ! 35: LDSTUB_I	ldstub	%r9, [%r31 + 0x00b4]
splash_hpstate_80_19:
	.word 0x81982585  ! 36: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0585, %hpstate
br_longdelay1_80_20:
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 37: RESTORE_R	restore	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 38: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd23fc000  ! 39: STD_R	std	%r9, [%r31 + %r0]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_21)+40, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_21)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_21:
	.word 0xa98531a8  ! 40: WR_SET_SOFTINT_I	wr	%r20, 0x11a8, %set_softint
splash_hpstate_80_22:
	ta T_CHANGE_NONHPRIV
	.word 0x81982a1e  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1e, %hpstate
	.word 0xa37029f2  ! 42: POPC_I	popc	0x09f2, %r17
splash_tba_80_23:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 43: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_80_24:
	nop
	setx 0x2c7b7d277df5d892, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 44: WRPR_TICK_R	wrpr	%r0, %r17, %tick
br_longdelay1_80_25:
	.word 0x2ecc8001  ! 1: BRGEZ	brgez,a,pt	%r18,<label_0xc8001>
	.word 0x9d97c000  ! 45: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
mondo_80_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d928008  ! 46: WRPR_WSTATE_R	wrpr	%r10, %r8, %wstate
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 47: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa981c013  ! 48: WR_SET_SOFTINT_R	wr	%r7, %r19, %set_softint
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_27:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 49: CASA_R	casa	[%r31] %asi, %r19, %r20
	.word 0xe86fe0c6  ! 50: LDSTUB_I	ldstub	%r20, [%r31 + 0x00c6]
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 51: Tcc_R	te	icc_or_xcc, %r0 + %r30
pmu_80_28:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff4dbfffff886, %g1, %g7
	.word 0xa3800007  ! 52: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_80_29:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf0a, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe91fc013  ! 53: LDDF_R	ldd	[%r31, %r19], %f20
	.word 0xe19fd960  ! 54: LDDFA_R	ldda	[%r31, %r0], %f16
fpinit_80_30:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82982  ! 55: PREFETCHA_I	prefetcha	[%r0, + 0x0982] %asi, #one_read
	setx 0xbc8ffd2833663702, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_31:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 57: Tcc_R	ta	icc_or_xcc, %r0 + %r30
br_longdelay4_80_32:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 58: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x95a2c9cc  ! 59: FDIVd	fdivd	%f42, %f12, %f10
	setx 0x3e76204458afeab6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_33:
	.word 0x39400001  ! 60: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_80_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d91c007  ! 61: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_35:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 62: CASA_R	casa	[%r31] %asi, %r10, %r8
	.word 0xa782c00c  ! 63: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r12, %-
	.word 0x9f802f63  ! 64: SIR	sir	0x0f63
	.word 0xd08fe000  ! 65: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r8
	.word 0xd03fc000  ! 66: STD_R	std	%r8, [%r31 + %r0]
	.word 0xc32fc000  ! 67: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xd0800b60  ! 68: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r8
change_to_randtl_80_37:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_37:
	.word 0x8f902000  ! 69: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
dvapa_80_38:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa26, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc004  ! 70: STXFSR_R	st-sfr	%f1, [%r4, %r31]
intveclr_80_39:
	nop
	ta T_CHANGE_HPRIV
	setx 0x62dab9a75ca11ec2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 71: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_80_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d914004  ! 72: WRPR_WSTATE_R	wrpr	%r5, %r4, %wstate
	.word 0x91930003  ! 73: WRPR_PIL_R	wrpr	%r12, %r3, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_42) + 0, 16, 16)) -> intp(4,0,17)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_42)&0xffffffff)  + 0, 16, 16)) -> intp(4,0,17)
intvec_80_42:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x977029bd  ! 75: POPC_I	popc	0x09bd, %r11
br_longdelay2_80_43:
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0xd5e04034  ! 76: CASA_I	casa	[%r1] 0x 1, %r20, %r10
splash_cmpr_80_44:
	nop
	setx 0x9fdffb363585c229, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 77: WRPR_TICK_R	wrpr	%r0, %r17, %tick
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_45
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_45:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 78: CASA_R	casa	[%r31] %asi, %r5, %r17
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x8d90304f  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x104f, %pstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_47
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_47
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_47:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 80: RDPC	rd	%pc, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_48)+0, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_48)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_48:
	.word 0xa982697a  ! 81: WR_SET_SOFTINT_I	wr	%r9, 0x097a, %set_softint
	.word 0x91908012  ! 82: WRPR_PIL_R	wrpr	%r2, %r18, %pil
intveclr_80_50:
	nop
	ta T_CHANGE_HPRIV
	setx 0x30311a9aad94e668, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 83: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_80_51:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d930011  ! 84: WRPR_WSTATE_R	wrpr	%r12, %r17, %wstate
splash_hpstate_80_52:
	.word 0x81982e47  ! 85: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e47, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_80_53:
	ta	T_CHANGE_NONHPRIV	! macro
ibp_80_54:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xdb3fc008  ! 87: STDF_R	std	%f13, [%r8, %r31]
splash_hpstate_80_55:
	ta T_CHANGE_NONHPRIV
	.word 0x8198200f  ! 88: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000f, %hpstate
	.word 0x97b2c492  ! 89: FCMPLE32	fcmple32	%d42, %d18, %r11
	.word 0xdb27c000  ! 90: STF_R	st	%f13, [%r0, %r31]
splash_tba_80_56:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 91: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_80_57:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 92: FCMPLE32	fcmple32	%d0, %d4, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_58) + 24, 16, 16)) -> intp(3,0,21)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_58)&0xffffffff)  + 24, 16, 16)) -> intp(3,0,21)
intvec_80_58:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_80_59:
	nop
	ta T_CHANGE_HPRIV
	setx 0x3d643fee8220216b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 94: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfdb60  ! 95: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x91d020b3  ! 96: Tcc_I	ta	icc_or_xcc, %r0 + 179
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
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
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_60:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 97: RDPC	rd	%pc, %r19
memptr_80_61:
	set 0x60540000, %r31
	.word 0x8584b517  ! 98: WRCCR_I	wr	%r18, 0x1517, %ccr
mondo_80_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d93400c  ! 99: WRPR_WSTATE_R	wrpr	%r13, %r12, %wstate
	.word 0x91d02033  ! 100: Tcc_I	ta	icc_or_xcc, %r0 + 51
ibp_80_63:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe1e7e011  ! 101: CASA_R	casa	[%r31] %asi, %r17, %r16
	.word 0xe1bfe020  ! 102: STDFA_I	stda	%f16, [0x0020, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_64)+56, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_64)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_64:
	.word 0xa980a3b1  ! 103: WR_SET_SOFTINT_I	wr	%r2, 0x03b1, %set_softint
	.word 0xe1bfdb60  ! 104: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc1bfe060  ! 105: STDFA_I	stda	%f0, [0x0060, %r31]
	.word 0x20700001  ! 106: BPN	<illegal instruction>
jmptr_80_65:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 107: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe06fe0fa  ! 108: LDSTUB_I	ldstub	%r16, [%r31 + 0x00fa]
	.word 0xb1800011  ! 109: WR_STICK_REG_R	wr	%r0, %r17, %-
fpinit_80_66:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82765  ! 110: PREFETCHA_I	prefetcha	[%r0, + 0x0765] %asi, #one_read
	.word 0xc1bfdc00  ! 111: STDFA_R	stda	%f0, [%r0, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_67
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_67:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 112: RDPC	rd	%pc, %r12
	.word 0xa5a0016d  ! 113: FABSq	dis not found

	.word 0x97450000  ! 114: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0xe19fc3e0  ! 115: LDDFA_R	ldda	[%r31, %r0], %f16
pmu_80_68:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffde0fffffb23, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_69
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_69
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_69:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 117: RDPC	rd	%pc, %r20
splash_hpstate_80_70:
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x81982657  ! 118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0657, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_71:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00d  ! 119: CASA_R	casa	[%r31] %asi, %r13, %r17
	.word 0xe2d7e010  ! 120: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r17
	.word 0x9f803e04  ! 121: SIR	sir	0x1e04
	.word 0x9f80354b  ! 122: SIR	sir	0x154b
tagged_80_72:
	tsubcctv %r12, 0x1ebf, %r16
	.word 0xe207e0b4  ! 123: LDUW_I	lduw	[%r31 + 0x00b4], %r17
pmu_80_73:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff67ffffffb22, %g1, %g7
	.word 0xa3800007  ! 124: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_80_74:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d928008  ! 125: WRPR_WSTATE_R	wrpr	%r10, %r8, %wstate
	.word 0xe26fe071  ! 126: LDSTUB_I	ldstub	%r17, [%r31 + 0x0071]
	.word 0xe31fc000  ! 127: LDDF_R	ldd	[%r31, %r0], %f17
	.word 0xe227e090  ! 128: STW_I	stw	%r17, [%r31 + 0x0090]
intveclr_80_75:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8d965d903ed4c578, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe22fe0c5  ! 130: STB_I	stb	%r17, [%r31 + 0x00c5]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_76)+56, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_76)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_76:
	.word 0xa981f381  ! 131: WR_SET_SOFTINT_I	wr	%r7, 0x1381, %set_softint
	.word 0xe337e02a  ! 132: STQF_I	-	%f17, [0x002a, %r31]
	.word 0xe337c000  ! 133: STQF_R	-	%f17, [%r0, %r31]
	.word 0xe327e0df  ! 134: STF_I	st	%f17, [0x00df, %r31]
jmptr_80_77:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 135: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_80_78:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffed2fffff6d8, %g1, %g7
	.word 0xa3800007  ! 136: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_80_79:
	nop
	ta T_CHANGE_HPRIV
	mov 0x948, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe2bfc031  ! 137: STDA_R	stda	%r17, [%r31 + %r17] 0x01
	.word 0xc1bfdc00  ! 138: STDFA_R	stda	%f0, [%r0, %r31]
mondo_80_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d92000a  ! 139: WRPR_WSTATE_R	wrpr	%r8, %r10, %wstate
	.word 0x8d802004  ! 140: WRFPRS_I	wr	%r0, 0x0004, %fprs
mondo_80_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d90c012  ! 141: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
pmu_80_82:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffecfffff246, %g1, %g7
	.word 0xa3800007  ! 142: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93a089a7  ! 143: FDIVs	fdivs	%f2, %f7, %f9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_83)+0, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_83)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_83:
	.word 0xa9806704  ! 144: WR_SET_SOFTINT_I	wr	%r1, 0x0704, %set_softint
cwp_80_84:
    set user_data_start, %o7
	.word 0x93902005  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
intveclr_80_85:
	nop
	ta T_CHANGE_HPRIV
	setx 0xfda69282fab903db, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 146: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_86:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 147: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xa9a00174  ! 148: FABSq	dis not found

	.word 0xa3b507c3  ! 149: PDIST	pdistn	%d20, %d34, %d48
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_87:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 150: CASA_R	casa	[%r31] %asi, %r17, %r13
	.word 0x91904001  ! 151: WRPR_PIL_R	wrpr	%r1, %r1, %pil
	.word 0xe19fdf20  ! 152: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x3c700001  ! 153: BPPOS	<illegal instruction>
	.word 0xda27e0f5  ! 154: STW_I	stw	%r13, [%r31 + 0x00f5]
pmu_80_89:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff1b9fffff663, %g1, %g7
	.word 0xa3800007  ! 155: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_90:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 156: CASA_R	casa	[%r31] %asi, %r19, %r13
	setx 0xa0a08c826b291b77, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_91:
	.word 0x39400001  ! 157: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2e700001  ! 158: BPVS	<illegal instruction>
	.word 0xda47c000  ! 159: LDSW_R	ldsw	[%r31 + %r0], %r13
splash_lsu_80_92:
	nop
	ta T_CHANGE_HPRIV
	set 0x7dd28a1f, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 160: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_93)+32, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_93)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_93:
	.word 0xa981e053  ! 161: WR_SET_SOFTINT_I	wr	%r7, 0x0053, %set_softint
	.word 0xe19fc3e0  ! 162: LDDFA_R	ldda	[%r31, %r0], %f16
pmu_80_94:
	nop
	setx 0xfffff325fffff336, %g1, %g7
	.word 0xa3800007  ! 163: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3a800001  ! 164: BCC	bcc,a	<label_0x1>
	.word 0x91464000  ! 165: RD_STICK_CMPR_REG	rd	%-, %r8
pmu_80_95:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff555fffff1be, %g1, %g7
	.word 0xa3800007  ! 166: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xb1800011  ! 167: WR_STICK_REG_R	wr	%r0, %r17, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_96
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_96:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 168: CASA_R	casa	[%r31] %asi, %r19, %r13
pmu_80_97:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff917fffff3d2, %g1, %g7
	.word 0xa3800007  ! 169: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_80_98:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffd6cfffffd40, %g1, %g7
	.word 0xa3800007  ! 170: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02032  ! 171: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa985000a  ! 172: WR_SET_SOFTINT_R	wr	%r20, %r10, %set_softint
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 173: Tcc_R	ta	icc_or_xcc, %r0 + %r30
brcommon_80_99:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xda3fee11  ! 174: STD_I	std	%r13, [%r31 + 0x0e11]
br_badelay3_80_100:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc17f9fa3	! Random illegal ?
	.word 0xd3144014  ! 1: LDQF_R	-	[%r17, %r20], %f9
	.word 0x91a44832  ! 175: FADDs	fadds	%f17, %f18, %f8
	.word 0xa5a4c9c5  ! 176: FDIVd	fdivd	%f50, %f36, %f18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_80_101:
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 178: LDX_R	ldx	[%r31 + %r0], %r16
memptr_80_102:
	set user_data_start, %r31
	.word 0x85853eeb  ! 179: WRCCR_I	wr	%r20, 0x1eeb, %ccr
	setx 0x04e6a72731355148, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_103:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe0a0  ! 181: STDFA_I	stda	%f16, [0x00a0, %r31]
    set 0x1597, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b287c7  ! 182: PDIST	pdistn	%d10, %d38, %d20
mondo_80_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d940011  ! 183: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0x9f8039ff  ! 184: SIR	sir	0x19ff
	.word 0xa3a1c9c7  ! 185: FDIVd	fdivd	%f38, %f38, %f48
	.word 0x87a88a50  ! 186: FCMPd	fcmpd	%fcc<n>, %f2, %f16
dvapa_80_105:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfdc, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd0bfc033  ! 187: STDA_R	stda	%r8, [%r31 + %r19] 0x01
mondo_80_106:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d910014  ! 188: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
	.word 0x9f803883  ! 189: SIR	sir	0x1883
vahole_80_107:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe33fc001  ! 190: STDF_R	std	%f17, [%r1, %r31]
	.word 0xe237e0bc  ! 191: STH_I	sth	%r17, [%r31 + 0x00bc]
	.word 0xa9480000  ! 192: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_108)+48, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_108)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_108:
	.word 0xa98463e3  ! 193: WR_SET_SOFTINT_I	wr	%r17, 0x03e3, %set_softint
	.word 0x9f802728  ! 194: SIR	sir	0x0728
dvapa_80_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0xca0, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe7e7e001  ! 195: CASA_R	casa	[%r31] %asi, %r1, %r19
intveclr_80_110:
	nop
	ta T_CHANGE_HPRIV
	setx 0x6d768d6ca9b43648, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 196: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    set 0x111f, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b347c7  ! 197: PDIST	pdistn	%d44, %d38, %d10
	.word 0xd31fc012  ! 198: LDDF_R	ldd	[%r31, %r18], %f9
mondo_80_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d92800c  ! 199: WRPR_WSTATE_R	wrpr	%r10, %r12, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_113
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_113:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 200: RDPC	rd	%pc, %r17
mondo_80_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d94000c  ! 201: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
	.word 0xe1bfc2c0  ! 202: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x91d02032  ! 203: Tcc_I	ta	icc_or_xcc, %r0 + 50
memptr_80_115:
	set 0x60540000, %r31
	.word 0x858532e7  ! 204: WRCCR_I	wr	%r20, 0x12e7, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 205: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x91d02034  ! 206: Tcc_I	ta	icc_or_xcc, %r0 + 52
pmu_80_116:
	nop
	setx 0xfffff86bfffff190, %g1, %g7
	.word 0xa3800007  ! 207: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0x8d9028e3  ! 208: WRPR_PSTATE_I	wrpr	%r0, 0x08e3, %pstate
splash_tba_80_118:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 209: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87aa4a42  ! 210: FCMPd	fcmpd	%fcc<n>, %f40, %f2
	.word 0xe1bfe040  ! 211: STDFA_I	stda	%f16, [0x0040, %r31]
	.word 0x38800001  ! 212: BGU	bgu,a	<label_0x1>
	.word 0xe1bfda00  ! 213: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa7454000  ! 214: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	.word 0xa9703a16  ! 215: POPC_I	popc	0x1a16, %r20
mondo_80_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d94c013  ! 216: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
splash_lsu_80_120:
	nop
	ta T_CHANGE_HPRIV
	set 0x73218e68, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x24800001  ! 218: BLE	ble,a	<label_0x1>
	.word 0xc1bfe040  ! 219: STDFA_I	stda	%f0, [0x0040, %r31]
	.word 0xd797e000  ! 220: LDQFA_I	-	[%r31, 0x0000], %f11
	.word 0xd73fc000  ! 221: STDF_R	std	%f11, [%r0, %r31]
donret_80_121:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_121-donret_80_121-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004a0e08 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x884, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_121:
	.word 0xd6ffe029  ! 222: SWAPA_I	swapa	%r11, [%r31 + 0x0029] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_122)+32, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_122)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_122:
	.word 0xa9843a92  ! 223: WR_SET_SOFTINT_I	wr	%r16, 0x1a92, %set_softint
	.word 0x93b447d3  ! 224: PDIST	pdistn	%d48, %d50, %d40
ibp_80_123:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe93fc00b  ! 225: STDF_R	std	%f20, [%r11, %r31]
    set 0x1321, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b407c5  ! 226: PDIST	pdistn	%d16, %d36, %d10
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 227: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_124
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_124:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 228: RDPC	rd	%pc, %r18
	.word 0x9191800c  ! 229: WRPR_PIL_R	wrpr	%r6, %r12, %pil
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x8d9022b9  ! 230: WRPR_PSTATE_I	wrpr	%r0, 0x02b9, %pstate
	.word 0xd23fe08c  ! 231: STD_I	std	%r9, [%r31 + 0x008c]
mondo_80_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d940012  ! 232: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 233: LDX_R	ldx	[%r31 + %r0], %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_128)+40, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_128)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_128:
	.word 0xa984ab46  ! 234: WR_SET_SOFTINT_I	wr	%r18, 0x0b46, %set_softint
	.word 0xc1bfe040  ! 235: STDFA_I	stda	%f0, [0x0040, %r31]
	.word 0x29800001  ! 236: FBL	fbl,a	<label_0x1>
splash_htba_80_130:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 237: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
ibp_80_131:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd33fc013  ! 238: STDF_R	std	%f9, [%r19, %r31]
	.word 0x95b10494  ! 239: FCMPLE32	fcmple32	%d4, %d20, %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_132)+0, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_132)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_132:
	.word 0xa9853eb4  ! 240: WR_SET_SOFTINT_I	wr	%r20, 0x1eb4, %set_softint
	.word 0x9191400a  ! 241: WRPR_PIL_R	wrpr	%r5, %r10, %pil
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_134
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_134:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 242: CASA_R	casa	[%r31] %asi, %r13, %r18
mondo_80_135:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d934007  ! 243: WRPR_WSTATE_R	wrpr	%r13, %r7, %wstate
ibp_80_136:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe4dfc033  ! 244: LDXA_R	ldxa	[%r31, %r19] 0x01, %r18
splash_tba_80_137:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 245: WRPR_TBA_R	wrpr	%r0, %r12, %tba
br_badelay3_80_138:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xf1584d22	! Random illegal ?
	.word 0xd9148001  ! 1: LDQF_R	-	[%r18, %r1], %f12
	.word 0x97a2882c  ! 246: FADDs	fadds	%f10, %f12, %f11
	.word 0x97a449a9  ! 247: FDIVs	fdivs	%f17, %f9, %f11
	.word 0xc1bfe020  ! 248: STDFA_I	stda	%f0, [0x0020, %r31]
brcommon_80_139:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xd4bfc030  ! 249: STDA_R	stda	%r10, [%r31 + %r16] 0x01
pmu_80_140:
	nop
	setx 0xffffffc8fffff68f, %g1, %g7
	.word 0xa3800007  ! 250: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd43fc000  ! 251: STD_R	std	%r10, [%r31 + %r0]
dvapa_80_141:
	nop
	ta T_CHANGE_HPRIV
	mov 0xab7, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd51fc010  ! 252: LDDF_R	ldd	[%r31, %r16], %f10
br_badelay3_80_142:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa96ce042	! Random illegal ?
	.word 0xdb10800a  ! 1: LDQF_R	-	[%r2, %r10], %f13
	.word 0xa5a40833  ! 253: FADDs	fadds	%f16, %f19, %f18
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 254: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x88368a8250478670, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_143:
	.word 0x39400001  ! 255: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
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
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_144:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 256: RDPC	rd	%pc, %r10
	.word 0x87ab0a50  ! 257: FCMPd	fcmpd	%fcc<n>, %f12, %f16
dvapa_80_145:
	nop
	ta T_CHANGE_HPRIV
	mov 0x86b, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 258: CASA_R	casa	[%r31] %asi, %r18, %r18
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 259: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe457c000  ! 260: LDSH_R	ldsh	[%r31 + %r0], %r18
splash_lsu_80_146:
	nop
	ta T_CHANGE_HPRIV
	set 0x61390e6e, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 262: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91950009  ! 263: WRPR_PIL_R	wrpr	%r20, %r9, %pil
	.word 0xc1bfe000  ! 264: STDFA_I	stda	%f0, [0x0000, %r31]
	.word 0xe19fe080  ! 265: LDDFA_I	ldda	[%r31, 0x0080], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_148:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 266: CASA_R	casa	[%r31] %asi, %r20, %r18
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a00162  ! 268: FABSq	dis not found

    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_149
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_149:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 269: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0xe63fe0b0  ! 270: STD_I	std	%r19, [%r31 + 0x00b0]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_150) + 16, 16, 16)) -> intp(4,0,10)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_150)&0xffffffff)  + 16, 16, 16)) -> intp(4,0,10)
intvec_80_150:
	.word 0x39400001  ! 271: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_151)+32, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_151)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_151:
	.word 0xa982b2d6  ! 272: WR_SET_SOFTINT_I	wr	%r10, 0x12d6, %set_softint
	.word 0xe63fe051  ! 273: STD_I	std	%r19, [%r31 + 0x0051]
memptr_80_152:
	set 0x60340000, %r31
	.word 0x8584b4c2  ! 274: WRCCR_I	wr	%r18, 0x14c2, %ccr
br_badelay1_80_153:
	.word 0xc36aa721  ! 1: PREFETCH_I	prefetch	[%r10 + 0x0721], #one_read
	.word 0xe731c012  ! 1: STQF_R	-	%f19, [%r18, %r7]
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	normalw
	.word 0xa9458000  ! 275: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0xa9b4c4c6  ! 276: FCMPNE32	fcmpne32	%d50, %d6, %r20
	.word 0xc19fda00  ! 277: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe19fe0e0  ! 278: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	.word 0xc1bfda00  ! 279: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x83d020b4  ! 280: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0x9f80259f  ! 281: SIR	sir	0x059f
jmptr_80_154:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 282: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_155:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 283: CASA_R	casa	[%r31] %asi, %r17, %r20
	.word 0x91a00174  ! 284: FABSq	dis not found

mondo_80_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d90800b  ! 285: WRPR_WSTATE_R	wrpr	%r2, %r11, %wstate
	.word 0xc32fc000  ! 286: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xc1bfda00  ! 287: STDFA_R	stda	%f0, [%r0, %r31]
change_to_randtl_80_157:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_157:
	.word 0x8f902002  ! 288: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa7844009  ! 289: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r9, %-
	.word 0xc1bfe060  ! 290: STDFA_I	stda	%f0, [0x0060, %r31]
	.word 0xd86fe051  ! 291: LDSTUB_I	ldstub	%r12, [%r31 + 0x0051]
tglhtw_80_159:
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
	.word 0x99b44990  ! 292: BSHUFFLE	fmovc32	%d48, %d16, %d12
memptr_80_160:
	set 0x60340000, %r31
	.word 0x8581fe0a  ! 293: WRCCR_I	wr	%r7, 0x1e0a, %ccr
splash_hpstate_80_161:
	ta T_CHANGE_NONHPRIV
	.word 0x81982794  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0794, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_162) + 8, 16, 16)) -> intp(0,0,6)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_162)&0xffffffff)  + 8, 16, 16)) -> intp(0,0,6)
intvec_80_162:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0bfe0e0  ! 296: STDA_I	stda	%r8, [%r31 + 0x00e0] %asi
	.word 0xa9a00169  ! 297: FABSq	dis not found

splash_tba_80_163:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 298: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_80_164:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 299: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d9032fc  ! 300: WRPR_PSTATE_I	wrpr	%r0, 0x12fc, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_166)+40, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_166)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_166:
	.word 0xa983663d  ! 301: WR_SET_SOFTINT_I	wr	%r13, 0x063d, %set_softint
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
splash_cmpr_40_0:
	nop
	setx 0xe5ea1c0ec6186c9c, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 1: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x81510000  ! 2: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe1bfe080  ! 3: STDFA_I	stda	%f16, [0x0080, %r31]
	setx 0x47abbd9dd74ab086, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_1:
	.word 0x39400001  ! 4: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 5: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_40_2:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d94c013  ! 6: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc1bfe0a0  ! 8: STDFA_I	stda	%f0, [0x00a0, %r31]
br_badelay2_40_3:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x99b48304  ! 9: ALIGNADDRESS	alignaddr	%r18, %r4, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_4) + 24, 16, 16)) -> intp(4,0,22)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_4)&0xffffffff)  + 24, 16, 16)) -> intp(4,0,22)
intvec_40_4:
	.word 0x39400001  ! 10: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe477e0ec  ! 11: STX_I	stx	%r18, [%r31 + 0x00ec]
donret_40_5:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_5-donret_40_5-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00852840 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb9c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_5:
	.word 0xe4ffe0c9  ! 12: SWAPA_I	swapa	%r18, [%r31 + 0x00c9] %asi
splash_cmpr_40_6:
	nop
	setx 0x49f32e0691fc22a4, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 13: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x97b2c48a  ! 14: FCMPLE32	fcmple32	%d42, %d10, %r11
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 15: Tcc_R	ta	icc_or_xcc, %r0 + %r30
vahole_40_7:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe7e7e012  ! 16: CASA_R	casa	[%r31] %asi, %r18, %r19
br_badelay2_40_8:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f12, %f24, %f0
	.word 0x95b0c30c  ! 17: ALIGNADDRESS	alignaddr	%r3, %r12, %r10
	.word 0x99a00165  ! 18: FABSq	dis not found

	.word 0xb1800011  ! 19: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xad846b05  ! 20: WR_SOFTINT_REG_I	wr	%r17, 0x0b05, %softint
	.word 0xd877c000  ! 21: STX_R	stx	%r12, [%r31 + %r0]
splash_tba_40_9:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 22: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd89fe018  ! 23: LDDA_I	ldda	[%r31, + 0x0018] %asi, %r12
jmptr_40_10:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 24: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_40_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d92800c  ! 25: WRPR_WSTATE_R	wrpr	%r10, %r12, %wstate
	.word 0xa5a509c2  ! 26: FDIVd	fdivd	%f20, %f2, %f18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_12)+32, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_12)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_12:
	.word 0xa984b760  ! 27: WR_SET_SOFTINT_I	wr	%r18, 0x1760, %set_softint
	.word 0x9f802233  ! 28: SIR	sir	0x0233
intveclr_40_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8bcffae3f3ebd4b0, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 29: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon_40_14:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xe8bfc031  ! 30: STDA_R	stda	%r20, [%r31 + %r17] 0x01
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_15
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_15:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 31: RDPC	rd	%pc, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_16
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_16:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 32: CASA_R	casa	[%r31] %asi, %r17, %r9
splash_cmpr_40_17:
	nop
	setx 0x36d09eeda3287685, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 33: WRPR_TICK_R	wrpr	%r0, %r17, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_18) + 16, 16, 16)) -> intp(5,0,5)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_18)&0xffffffff)  + 16, 16, 16)) -> intp(5,0,5)
intvec_40_18:
	.word 0x39400001  ! 34: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd26fe0d6  ! 35: LDSTUB_I	ldstub	%r9, [%r31 + 0x00d6]
splash_hpstate_40_19:
	.word 0x8198235d  ! 36: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035d, %hpstate
br_longdelay1_40_20:
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0xbfefc000  ! 37: RESTORE_R	restore	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 38: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd23fc000  ! 39: STD_R	std	%r9, [%r31 + %r0]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_21)+48, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_21)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_21:
	.word 0xa98524ce  ! 40: WR_SET_SOFTINT_I	wr	%r20, 0x04ce, %set_softint
splash_hpstate_40_22:
	ta T_CHANGE_NONHPRIV
	.word 0x819829c7  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c7, %hpstate
	.word 0x91702982  ! 42: POPC_I	popc	0x0982, %r8
splash_tba_40_23:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 43: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_40_24:
	nop
	setx 0xe84785b253114ca2, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 44: WRPR_TICK_R	wrpr	%r0, %r17, %tick
br_longdelay1_40_25:
	.word 0x2ccc8001  ! 1: BRGZ	brgz,a,pt	%r18,<label_0xc8001>
	.word 0xbfefc000  ! 45: RESTORE_R	restore	%r31, %r0, %r31
mondo_40_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d92c006  ! 46: WRPR_WSTATE_R	wrpr	%r11, %r6, %wstate
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 47: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa9818010  ! 48: WR_SET_SOFTINT_R	wr	%r6, %r16, %set_softint
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_27:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 49: CASA_R	casa	[%r31] %asi, %r19, %r20
	.word 0xe86fe0e6  ! 50: LDSTUB_I	ldstub	%r20, [%r31 + 0x00e6]
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 51: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_40_28:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff03ffffff9d4, %g1, %g7
	.word 0xa3800007  ! 52: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_40_29:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8a4, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe89fc033  ! 53: LDDA_R	ldda	[%r31, %r19] 0x01, %r20
	.word 0xc19fc2c0  ! 54: LDDFA_R	ldda	[%r31, %r0], %f0
fpinit_40_30:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 55: FDIVd	fdivd	%f0, %f4, %f8
	setx 0x95d3bcba2a439f25, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_31:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 57: Tcc_R	tne	icc_or_xcc, %r0 + %r30
br_longdelay4_40_32:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 58: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xa3a049c1  ! 59: FDIVd	fdivd	%f32, %f32, %f48
	setx 0x6d15febb22f1a09a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_33:
	.word 0x39400001  ! 60: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_40_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d934014  ! 61: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_35:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 62: CASA_R	casa	[%r31] %asi, %r10, %r8
	.word 0xa784c008  ! 63: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r8, %-
	.word 0x9f803178  ! 64: SIR	sir	0x1178
	.word 0xd08fe010  ! 65: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r8
	.word 0xd03fc000  ! 66: STD_R	std	%r8, [%r31 + %r0]
	.word 0xc32fc000  ! 67: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xd08008a0  ! 68: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
change_to_randtl_40_37:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_37:
	.word 0x8f902000  ! 69: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
dvapa_40_38:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa10, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd09fc024  ! 70: LDDA_R	ldda	[%r31, %r4] 0x01, %r8
intveclr_40_39:
	nop
	ta T_CHANGE_HPRIV
	setx 0x966e00fc8cd4372e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 71: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_40_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d94c014  ! 72: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0x91934009  ! 73: WRPR_PIL_R	wrpr	%r13, %r9, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_42) + 16, 16, 16)) -> intp(4,0,7)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_42)&0xffffffff)  + 16, 16, 16)) -> intp(4,0,7)
intvec_40_42:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91a4c9ca  ! 75: FDIVd	fdivd	%f50, %f10, %f8
br_longdelay2_40_43:
	.word 0x2ec88001  ! 1: BRGEZ	brgez,a,pt	%r2,<label_0x88001>
	.word 0xc36c3b97  ! 76: PREFETCH_I	prefetch	[%r16 + 0xfffffb97], #one_read
splash_cmpr_40_44:
	nop
	setx 0x74341b61f1eb76d3, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 77: WRPR_TICK_R	wrpr	%r0, %r17, %tick
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_45
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_45:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 78: CASA_R	casa	[%r31] %asi, %r5, %r17
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	.word 0x8d9028a8  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x08a8, %pstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_47
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_47
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_47:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 80: RDPC	rd	%pc, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_48)+16, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_48)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_48:
	.word 0xa9847441  ! 81: WR_SET_SOFTINT_I	wr	%r17, 0x1441, %set_softint
	.word 0x91928011  ! 82: WRPR_PIL_R	wrpr	%r10, %r17, %pil
intveclr_40_50:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2a99853ce0773ab3, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 83: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_40_51:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d94c00c  ! 84: WRPR_WSTATE_R	wrpr	%r19, %r12, %wstate
splash_hpstate_40_52:
	.word 0x81982cd7  ! 85: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd7, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_53:
	ta	T_CHANGE_NONHPRIV	! macro
ibp_40_54:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xda9fc028  ! 87: LDDA_R	ldda	[%r31, %r8] 0x01, %r13
splash_hpstate_40_55:
	ta T_CHANGE_NONHPRIV
	.word 0x81982687  ! 88: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0687, %hpstate
	.word 0xa7a349d4  ! 89: FDIVd	fdivd	%f44, %f20, %f50
	.word 0xdb27c000  ! 90: STF_R	st	%f13, [%r0, %r31]
splash_tba_40_56:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 91: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_40_57:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 92: FDIVd	fdivd	%f0, %f4, %f4
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_58) + 48, 16, 16)) -> intp(2,0,9)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_58)&0xffffffff)  + 48, 16, 16)) -> intp(2,0,9)
intvec_40_58:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_40_59:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9f5e2e38d1d36256, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 94: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe0e0  ! 95: STDFA_I	stda	%f16, [0x00e0, %r31]
	.word 0x83d02034  ! 96: Tcc_I	te	icc_or_xcc, %r0 + 52
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
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
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_60:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 97: RDPC	rd	%pc, %r17
memptr_40_61:
	set 0x60540000, %r31
	.word 0x8582377d  ! 98: WRCCR_I	wr	%r8, 0x177d, %ccr
mondo_40_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d94800c  ! 99: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
	.word 0x93d02034  ! 100: Tcc_I	tne	icc_or_xcc, %r0 + 52
ibp_40_63:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe1e7e011  ! 101: CASA_R	casa	[%r31] %asi, %r17, %r16
	.word 0xe1bfe040  ! 102: STDFA_I	stda	%f16, [0x0040, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_64)+16, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_64)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_64:
	.word 0xa9836f09  ! 103: WR_SET_SOFTINT_I	wr	%r13, 0x0f09, %set_softint
	.word 0xe19fde00  ! 104: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe1bfe0e0  ! 105: STDFA_I	stda	%f16, [0x00e0, %r31]
	.word 0x20700001  ! 106: BPN	<illegal instruction>
jmptr_40_65:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 107: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe06fe067  ! 108: LDSTUB_I	ldstub	%r16, [%r31 + 0x0067]
	.word 0xb1800011  ! 109: WR_STICK_REG_R	wr	%r0, %r17, %-
fpinit_40_66:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 110: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xe19fd920  ! 111: LDDFA_R	ldda	[%r31, %r0], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_67
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_67:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 112: RDPC	rd	%pc, %r18
	.word 0x93a0016a  ! 113: FABSq	dis not found

	.word 0x99450000  ! 114: RD_SET_SOFTINT	rd	%set_softint, %r12
	.word 0xe19fc3e0  ! 115: LDDFA_R	ldda	[%r31, %r0], %f16
pmu_40_68:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffdb7fffff745, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_69
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_69
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_69:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 117: RDPC	rd	%pc, %r9
splash_hpstate_40_70:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x819823df  ! 118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03df, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_71:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00d  ! 119: CASA_R	casa	[%r31] %asi, %r13, %r17
	.word 0xe2d7e020  ! 120: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r17
	.word 0x9f802015  ! 121: SIR	sir	0x0015
	.word 0x9f80200e  ! 122: SIR	sir	0x000e
tagged_40_72:
	tsubcctv %r3, 0x1256, %r10
	.word 0xe207e0b6  ! 123: LDUW_I	lduw	[%r31 + 0x00b6], %r17
pmu_40_73:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff888fffffdf5, %g1, %g7
	.word 0xa3800007  ! 124: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_40_74:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d930001  ! 125: WRPR_WSTATE_R	wrpr	%r12, %r1, %wstate
	.word 0xe26fe0c9  ! 126: LDSTUB_I	ldstub	%r17, [%r31 + 0x00c9]
	.word 0xe31fc000  ! 127: LDDF_R	ldd	[%r31, %r0], %f17
	.word 0xe227e0d8  ! 128: STW_I	stw	%r17, [%r31 + 0x00d8]
intveclr_40_75:
	nop
	ta T_CHANGE_HPRIV
	setx 0x94e1058bb0a9faea, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe22fe085  ! 130: STB_I	stb	%r17, [%r31 + 0x0085]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_76)+8, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_76)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_76:
	.word 0xa9846da0  ! 131: WR_SET_SOFTINT_I	wr	%r17, 0x0da0, %set_softint
	.word 0xe337e018  ! 132: STQF_I	-	%f17, [0x0018, %r31]
	.word 0xe337c000  ! 133: STQF_R	-	%f17, [%r0, %r31]
	.word 0xe327e060  ! 134: STF_I	st	%f17, [0x0060, %r31]
jmptr_40_77:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 135: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_40_78:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff40afffffaea, %g1, %g7
	.word 0xa3800007  ! 136: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_40_79:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8f3, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe2dfc031  ! 137: LDXA_R	ldxa	[%r31, %r17] 0x01, %r17
	.word 0xe1bfe0e0  ! 138: STDFA_I	stda	%f16, [0x00e0, %r31]
mondo_40_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d950011  ! 139: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
	.word 0x8d802000  ! 140: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_40_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d908010  ! 141: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
pmu_40_82:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff815fffff734, %g1, %g7
	.word 0xa3800007  ! 142: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc3ed0021  ! 143: PREFETCHA_R	prefetcha	[%r20, %r1] 0x01, #one_read
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_83)+8, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_83)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_83:
	.word 0xa980a5bb  ! 144: WR_SET_SOFTINT_I	wr	%r2, 0x05bb, %set_softint
cwp_40_84:
    set user_data_start, %o7
	.word 0x93902000  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
intveclr_40_85:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa77508a13b058389, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 146: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_86:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 147: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0x91a00173  ! 148: FABSq	dis not found

	.word 0x9b702dc9  ! 149: POPC_I	popc	0x0dc9, %r13
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_87:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 150: CASA_R	casa	[%r31] %asi, %r17, %r13
	.word 0x91928012  ! 151: WRPR_PIL_R	wrpr	%r10, %r18, %pil
	.word 0xc19fc2c0  ! 152: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x3c700001  ! 153: BPPOS	<illegal instruction>
	.word 0xda27e0e4  ! 154: STW_I	stw	%r13, [%r31 + 0x00e4]
pmu_40_89:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff0dafffffea7, %g1, %g7
	.word 0xa3800007  ! 155: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_90:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 156: CASA_R	casa	[%r31] %asi, %r19, %r13
	setx 0x591fd961783c8b63, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_91:
	.word 0x39400001  ! 157: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2e700001  ! 158: BPVS	<illegal instruction>
	.word 0xda47c000  ! 159: LDSW_R	ldsw	[%r31 + %r0], %r13
splash_lsu_40_92:
	nop
	ta T_CHANGE_HPRIV
	set 0xc5434062, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 160: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_93)+16, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_93)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_93:
	.word 0xa984fd1a  ! 161: WR_SET_SOFTINT_I	wr	%r19, 0x1d1a, %set_softint
	.word 0xe19fc3e0  ! 162: LDDFA_R	ldda	[%r31, %r0], %f16
pmu_40_94:
	nop
	setx 0xfffff087fffffbcd, %g1, %g7
	.word 0xa3800007  ! 163: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3a800001  ! 164: BCC	bcc,a	<label_0x1>
	.word 0x9b464000  ! 165: RD_STICK_CMPR_REG	rd	%-, %r13
pmu_40_95:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc6afffffe2d, %g1, %g7
	.word 0xa3800007  ! 166: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xb1800011  ! 167: WR_STICK_REG_R	wr	%r0, %r17, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_96
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_96:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 168: CASA_R	casa	[%r31] %asi, %r19, %r13
pmu_40_97:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffff5afffff328, %g1, %g7
	.word 0xa3800007  ! 169: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_40_98:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff1b5fffffc86, %g1, %g7
	.word 0xa3800007  ! 170: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93d02032  ! 171: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xa984c006  ! 172: WR_SET_SOFTINT_R	wr	%r19, %r6, %set_softint
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 173: Tcc_R	ta	icc_or_xcc, %r0 + %r30
brcommon_40_99:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xdb1fc003  ! 174: LDDF_R	ldd	[%r31, %r3], %f13
br_badelay3_40_100:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x9176eea6	! Random illegal ?
	.word 0xd5124003  ! 1: LDQF_R	-	[%r9, %r3], %f10
	.word 0x9ba18831  ! 175: FADDs	fadds	%f6, %f17, %f13
	.word 0x97a489d1  ! 176: FDIVd	fdivd	%f18, %f48, %f42
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_101:
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 178: LDX_R	ldx	[%r31 + %r0], %r16
memptr_40_102:
	set user_data_start, %r31
	.word 0x85852761  ! 179: WRCCR_I	wr	%r20, 0x0761, %ccr
	setx 0xe571e5fa9aa3cd5f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_103:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe0c0  ! 181: STDFA_I	stda	%f16, [0x00c0, %r31]
    set 0x334e, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b347cd  ! 182: PDIST	pdistn	%d44, %d44, %d12
mondo_40_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d948012  ! 183: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
	.word 0x9f802271  ! 184: SIR	sir	0x0271
	.word 0x93a249d4  ! 185: FDIVd	fdivd	%f40, %f20, %f40
	.word 0x87ad0a54  ! 186: FCMPd	fcmpd	%fcc<n>, %f20, %f20
dvapa_40_105:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfad, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd0dfc033  ! 187: LDXA_R	ldxa	[%r31, %r19] 0x01, %r8
mondo_40_106:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d918013  ! 188: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
	.word 0xc36ca26d  ! 189: PREFETCH_I	prefetch	[%r18 + 0x026d], #one_read
vahole_40_107:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe29fc021  ! 190: LDDA_R	ldda	[%r31, %r1] 0x01, %r17
	.word 0xe237e0cb  ! 191: STH_I	sth	%r17, [%r31 + 0x00cb]
	.word 0x93480000  ! 192: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_108)+40, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_108)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_108:
	.word 0xa9853867  ! 193: WR_SET_SOFTINT_I	wr	%r20, 0x1867, %set_softint
	.word 0x9f8038e3  ! 194: SIR	sir	0x18e3
dvapa_40_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0xeb3, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe697c021  ! 195: LDUHA_R	lduha	[%r31, %r1] 0x01, %r19
intveclr_40_110:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0b9b89dbc332fd8a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 196: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    set 0x126a, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb187c3  ! 197: PDIST	pdistn	%d6, %d34, %d44
iaw_40_111:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x40, %r16
iaw_startwait40_111:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_111
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_111:
    brnz %r16, iaw_wait40_111
    ld [%r23], %r16
    ba,a iaw_startwait40_111
    mov 0x40, %r16
continue_iaw_40_111:
    ldxa [%g0]0x63, %r14        !Get raw TID
    srlx %r14, 3, %r14          !Get CID
    sllx %r16, %r14, %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_111:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_111
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_111:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_40_111
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_111:
	mov 0x38, %r18
iaw3_40_111:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd23ff6e5  ! 198: STD_I	std	%r9, [%r31 + 0xfffff6e5]
mondo_40_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d940011  ! 199: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_113
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_113:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 200: RDPC	rd	%pc, %r20
mondo_40_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d94c009  ! 201: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
	.word 0xc1bfda00  ! 202: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x93d02034  ! 203: Tcc_I	tne	icc_or_xcc, %r0 + 52
memptr_40_115:
	set 0x60540000, %r31
	.word 0x85842400  ! 204: WRCCR_I	wr	%r16, 0x0400, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 205: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x91d02034  ! 206: Tcc_I	ta	icc_or_xcc, %r0 + 52
pmu_40_116:
	nop
	setx 0xfffff7e1fffffab3, %g1, %g7
	.word 0xa3800007  ! 207: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x2aca8001  ! 1: BRNZ	brnz,a,pt	%r10,<label_0xa8001>
	.word 0x8d9022cb  ! 208: WRPR_PSTATE_I	wrpr	%r0, 0x02cb, %pstate
splash_tba_40_118:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 209: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa5702189  ! 210: POPC_I	popc	0x0189, %r18
	.word 0xc1bfe0c0  ! 211: STDFA_I	stda	%f0, [0x00c0, %r31]
	.word 0x38800001  ! 212: BGU	bgu,a	<label_0x1>
	.word 0xc1bfdc00  ! 213: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x95454000  ! 214: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	.word 0x9ba309b0  ! 215: FDIVs	fdivs	%f12, %f16, %f13
mondo_40_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d91c014  ! 216: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
splash_lsu_40_120:
	nop
	ta T_CHANGE_HPRIV
	set 0x07aa1a33, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x24800001  ! 218: BLE	ble,a	<label_0x1>
	.word 0xc19fc2c0  ! 219: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd797e000  ! 220: LDQFA_I	-	[%r31, 0x0000], %f11
	.word 0xd73fc000  ! 221: STDF_R	std	%f11, [%r0, %r31]
donret_40_121:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_121-donret_40_121-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00877bb7 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x89d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_121:
	.word 0xd6ffe028  ! 222: SWAPA_I	swapa	%r11, [%r31 + 0x0028] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_122)+16, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_122)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_122:
	.word 0xa9806a7a  ! 223: WR_SET_SOFTINT_I	wr	%r1, 0x0a7a, %set_softint
	.word 0xa9b4c7c3  ! 224: PDIST	pdistn	%d50, %d34, %d20
ibp_40_123:
	nop
	ta T_CHANGE_HPRIV
	.word 0xc32fc00b  ! 225: STXFSR_R	st-sfr	%f1, [%r11, %r31]
    set 0x12e9, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b507c6  ! 226: PDIST	pdistn	%d20, %d6, %d50
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 227: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_124
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_124:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 228: RDPC	rd	%pc, %r9
	.word 0x9194c00a  ! 229: WRPR_PIL_R	wrpr	%r19, %r10, %pil
	.word 0x22cac001  ! 1: BRZ	brz,a,pt	%r11,<label_0xac001>
	.word 0x8d90208a  ! 230: WRPR_PSTATE_I	wrpr	%r0, 0x008a, %pstate
	.word 0xd23fe0d0  ! 231: STD_I	std	%r9, [%r31 + 0x00d0]
mondo_40_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d90c010  ! 232: WRPR_WSTATE_R	wrpr	%r3, %r16, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 233: LDX_R	ldx	[%r31 + %r0], %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_128)+16, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_128)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_128:
	.word 0xa9853312  ! 234: WR_SET_SOFTINT_I	wr	%r20, 0x1312, %set_softint
	.word 0xc19fd920  ! 235: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x29800001  ! 236: FBL	fbl,a	<label_0x1>
splash_htba_40_130:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 237: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
ibp_40_131:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc013  ! 238: STXFSR_R	st-sfr	%f1, [%r19, %r31]
	.word 0xa9b507d3  ! 239: PDIST	pdistn	%d20, %d50, %d20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_132)+8, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_132)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_132:
	.word 0xa9852643  ! 240: WR_SET_SOFTINT_I	wr	%r20, 0x0643, %set_softint
	.word 0x91950013  ! 241: WRPR_PIL_R	wrpr	%r20, %r19, %pil
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_134
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_134:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 242: CASA_R	casa	[%r31] %asi, %r13, %r18
mondo_40_135:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d934003  ! 243: WRPR_WSTATE_R	wrpr	%r13, %r3, %wstate
ibp_40_136:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe43fe530  ! 244: STD_I	std	%r18, [%r31 + 0x0530]
splash_tba_40_137:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 245: WRPR_TBA_R	wrpr	%r0, %r12, %tba
br_badelay3_40_138:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x9f5f559f	! Random illegal ?
	.word 0xe512c013  ! 1: LDQF_R	-	[%r11, %r19], %f18
	.word 0xa5a2082d  ! 246: FADDs	fadds	%f8, %f13, %f18
	.word 0xa5a289a9  ! 247: FDIVs	fdivs	%f10, %f9, %f18
	.word 0xc19fd960  ! 248: LDDFA_R	ldda	[%r31, %r0], %f0
brcommon_40_139:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xd51fc010  ! 249: LDDF_R	ldd	[%r31, %r16], %f10
pmu_40_140:
	nop
	setx 0xfffff06cfffffa76, %g1, %g7
	.word 0xa3800007  ! 250: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd43fc000  ! 251: STD_R	std	%r10, [%r31 + %r0]
dvapa_40_141:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf52, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd43fead4  ! 252: STD_I	std	%r10, [%r31 + 0x0ad4]
br_badelay3_40_142:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc744a52c	! Random illegal ?
	.word 0xdb14800d  ! 1: LDQF_R	-	[%r18, %r13], %f13
	.word 0xa3a48822  ! 253: FADDs	fadds	%f18, %f2, %f17
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 254: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	setx 0x502f760e54c50094, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_143:
	.word 0x39400001  ! 255: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
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
	.word 0x91414000  ! 256: RDPC	rd	%pc, %r8
	.word 0x95b4c48d  ! 257: FCMPLE32	fcmple32	%d50, %d44, %r10
dvapa_40_145:
	nop
	ta T_CHANGE_HPRIV
	mov 0xaf5, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe4dfc032  ! 258: LDXA_R	ldxa	[%r31, %r18] 0x01, %r18
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 259: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe457c000  ! 260: LDSH_R	ldsh	[%r31 + %r0], %r18
splash_lsu_40_146:
	nop
	ta T_CHANGE_HPRIV
	set 0x5a692b03, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 262: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9190c013  ! 263: WRPR_PIL_R	wrpr	%r3, %r19, %pil
	.word 0xc1bfe000  ! 264: STDFA_I	stda	%f0, [0x0000, %r31]
	.word 0xe19fe020  ! 265: LDDFA_I	ldda	[%r31, 0x0020], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_148:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 266: CASA_R	casa	[%r31] %asi, %r20, %r18
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a00170  ! 268: FABSq	dis not found

    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_149
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_149:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 269: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0xe63fe020  ! 270: STD_I	std	%r19, [%r31 + 0x0020]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_150) + 24, 16, 16)) -> intp(5,0,29)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_150)&0xffffffff)  + 24, 16, 16)) -> intp(5,0,29)
intvec_40_150:
	.word 0x39400001  ! 271: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_151)+16, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_151)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_151:
	.word 0xa98466c0  ! 272: WR_SET_SOFTINT_I	wr	%r17, 0x06c0, %set_softint
	.word 0xe63fe080  ! 273: STD_I	std	%r19, [%r31 + 0x0080]
memptr_40_152:
	set 0x60140000, %r31
	.word 0x8583665e  ! 274: WRCCR_I	wr	%r13, 0x065e, %ccr
br_badelay1_40_153:
	.word 0xc36c6d1d  ! 1: PREFETCH_I	prefetch	[%r17 + 0x0d1d], #one_read
	.word 0xd532c009  ! 1: STQF_R	-	%f10, [%r9, %r11]
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	normalw
	.word 0x99458000  ! 275: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x39400001  ! 276: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc19fc2c0  ! 277: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe19fe0c0  ! 278: LDDFA_I	ldda	[%r31, 0x00c0], %f16
	.word 0xe1bfe0c0  ! 279: STDFA_I	stda	%f16, [0x00c0, %r31]
	.word 0x91d020b3  ! 280: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x9f802fd9  ! 281: SIR	sir	0x0fd9
jmptr_40_154:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 282: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
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
	.word 0xe9e7e011  ! 283: CASA_R	casa	[%r31] %asi, %r17, %r20
	.word 0x9ba00174  ! 284: FABSq	dis not found

mondo_40_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d914007  ! 285: WRPR_WSTATE_R	wrpr	%r5, %r7, %wstate
	.word 0xc32fc000  ! 286: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xe19fda00  ! 287: LDDFA_R	ldda	[%r31, %r0], %f16
change_to_randtl_40_157:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_157:
	.word 0x8f902000  ! 288: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa784400a  ! 289: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r10, %-
	.word 0xc1bfe040  ! 290: STDFA_I	stda	%f0, [0x0040, %r31]
	.word 0xd86fe029  ! 291: LDSTUB_I	ldstub	%r12, [%r31 + 0x0029]
tglhtw_40_159:
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
	.word 0xa7b04981  ! 292: BSHUFFLE	fmovc32	%d32, %d32, %d50
memptr_40_160:
	set 0x60740000, %r31
	.word 0x85807559  ! 293: WRCCR_I	wr	%r1, 0x1559, %ccr
splash_hpstate_40_161:
	ta T_CHANGE_NONHPRIV
	.word 0x81982505  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0505, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_162) + 40, 16, 16)) -> intp(3,0,11)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_162)&0xffffffff)  + 40, 16, 16)) -> intp(3,0,11)
intvec_40_162:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0bfe03a  ! 296: STDA_I	stda	%r8, [%r31 + 0x003a] %asi
	.word 0x99a00161  ! 297: FABSq	dis not found

splash_tba_40_163:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 298: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_40_164:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 299: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d902028  ! 300: WRPR_PSTATE_I	wrpr	%r0, 0x0028, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_166)+40, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_166)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_166:
	.word 0xa984efcc  ! 301: WR_SET_SOFTINT_I	wr	%r19, 0x0fcc, %set_softint
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
splash_cmpr_20_0:
	nop
	setx 0x440f15718b2afb88, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 1: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x81510000  ! 2: RDPR_TICK	rdpr	%tick, %r0
	.word 0xc19fdc00  ! 3: LDDFA_R	ldda	[%r31, %r0], %f0
	setx 0xe5e2f87fd295543c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_1:
	.word 0x39400001  ! 4: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 5: Tcc_R	te	icc_or_xcc, %r0 + %r30
mondo_20_2:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d934013  ! 6: WRPR_WSTATE_R	wrpr	%r13, %r19, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe1bfe0e0  ! 8: STDFA_I	stda	%f16, [0x00e0, %r31]
br_badelay2_20_3:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0xa1b48312  ! 9: ALIGNADDRESS	alignaddr	%r18, %r18, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_4) + 0, 16, 16)) -> intp(5,0,30)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_4)&0xffffffff)  + 0, 16, 16)) -> intp(5,0,30)
intvec_20_4:
	.word 0x39400001  ! 10: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe477e0b8  ! 11: STX_I	stx	%r18, [%r31 + 0x00b8]
donret_20_5:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_5-donret_20_5-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001b3a40 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb45, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_5:
	.word 0xe4ffe0c8  ! 12: SWAPA_I	swapa	%r18, [%r31 + 0x00c8] %asi
splash_cmpr_20_6:
	nop
	setx 0x676cf8a5c9a19abd, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 13: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x97a089c9  ! 14: FDIVd	fdivd	%f2, %f40, %f42
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 15: Tcc_R	tne	icc_or_xcc, %r0 + %r30
vahole_20_7:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe7e7e012  ! 16: CASA_R	casa	[%r31] %asi, %r18, %r19
br_badelay2_20_8:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f20, %f22, %f12
	.word 0x99b3430d  ! 17: ALIGNADDRESS	alignaddr	%r13, %r13, %r12
	.word 0x99a00170  ! 18: FABSq	dis not found

	.word 0xb1800011  ! 19: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xad80eee8  ! 20: WR_SOFTINT_REG_I	wr	%r3, 0x0ee8, %softint
	.word 0xd877c000  ! 21: STX_R	stx	%r12, [%r31 + %r0]
splash_tba_20_9:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 22: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd89fe038  ! 23: LDDA_I	ldda	[%r31, + 0x0038] %asi, %r12
jmptr_20_10:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 24: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_20_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d910014  ! 25: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
	.word 0x99a0c9d1  ! 26: FDIVd	fdivd	%f34, %f48, %f12
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_12)+24, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_12)&0xffffffff) +24, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_12:
	.word 0xa982eb81  ! 27: WR_SET_SOFTINT_I	wr	%r11, 0x0b81, %set_softint
	.word 0x9f8020d9  ! 28: SIR	sir	0x00d9
intveclr_20_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0x515f397ab01a75b9, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 29: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon_20_14:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xe89fc031  ! 30: LDDA_R	ldda	[%r31, %r17] 0x01, %r20
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_15
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_15:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 31: RDPC	rd	%pc, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_16
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_16:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 32: CASA_R	casa	[%r31] %asi, %r17, %r9
splash_cmpr_20_17:
	nop
	setx 0x5bf7be55ad3526bb, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 33: WRPR_TICK_R	wrpr	%r0, %r17, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_18) + 40, 16, 16)) -> intp(6,0,11)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_18)&0xffffffff)  + 40, 16, 16)) -> intp(6,0,11)
intvec_20_18:
	.word 0x39400001  ! 34: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd26fe0cd  ! 35: LDSTUB_I	ldstub	%r9, [%r31 + 0x00cd]
splash_hpstate_20_19:
	.word 0x81982b1f  ! 36: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1f, %hpstate
br_longdelay1_20_20:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x9d97c000  ! 37: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 38: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd23fc000  ! 39: STD_R	std	%r9, [%r31 + %r0]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_21)+16, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_21)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_21:
	.word 0xa984b955  ! 40: WR_SET_SOFTINT_I	wr	%r18, 0x1955, %set_softint
splash_hpstate_20_22:
	ta T_CHANGE_NONHPRIV
	.word 0x819828c7  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c7, %hpstate
	.word 0xa1a189a6  ! 42: FDIVs	fdivs	%f6, %f6, %f16
splash_tba_20_23:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 43: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_20_24:
	nop
	setx 0x633d14e3369092d3, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 44: WRPR_TICK_R	wrpr	%r0, %r17, %tick
br_longdelay1_20_25:
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x9d97c000  ! 45: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
mondo_20_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d944012  ! 46: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 47: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa9814008  ! 48: WR_SET_SOFTINT_R	wr	%r5, %r8, %set_softint
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_27:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 49: CASA_R	casa	[%r31] %asi, %r19, %r20
	.word 0xe86fe05c  ! 50: LDSTUB_I	ldstub	%r20, [%r31 + 0x005c]
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 51: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_20_28:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffe40fffff0da, %g1, %g7
	.word 0xa3800007  ! 52: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_20_29:
	nop
	ta T_CHANGE_HPRIV
	mov 0xedd, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe8bfc033  ! 53: STDA_R	stda	%r20, [%r31 + %r19] 0x01
	.word 0xc19fc2c0  ! 54: LDDFA_R	ldda	[%r31, %r0], %f0
fpinit_20_30:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 55: FDIVs	fdivs	%f0, %f4, %f4
	setx 0x4ae329d2e17fdfa9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_31:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 57: Tcc_R	ta	icc_or_xcc, %r0 + %r30
br_longdelay4_20_32:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 58: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xa7a449d4  ! 59: FDIVd	fdivd	%f48, %f20, %f50
	setx 0x379bbb3abddc18af, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_33:
	.word 0x39400001  ! 60: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_20_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d94c010  ! 61: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_35:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 62: CASA_R	casa	[%r31] %asi, %r10, %r8
splash_decr_20_36:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r9, [%r1] 0x45
	.word 0xa7810012  ! 63: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r18, %-
	.word 0x9f80364d  ! 64: SIR	sir	0x164d
	.word 0xd08fe018  ! 65: LDUBA_I	lduba	[%r31, + 0x0018] %asi, %r8
	.word 0xd03fc000  ! 66: STD_R	std	%r8, [%r31 + %r0]
	.word 0xc32fc000  ! 67: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xd08008a0  ! 68: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
change_to_randtl_20_37:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_37:
	.word 0x8f902002  ! 69: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
dvapa_20_38:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa7c, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd0dfc024  ! 70: LDXA_R	ldxa	[%r31, %r4] 0x01, %r8
intveclr_20_39:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd228a31820f0927f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 71: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_20_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d90c002  ! 72: WRPR_WSTATE_R	wrpr	%r3, %r2, %wstate
	.word 0x91950014  ! 73: WRPR_PIL_R	wrpr	%r20, %r20, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_42) + 0, 16, 16)) -> intp(0,0,20)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_42)&0xffffffff)  + 0, 16, 16)) -> intp(0,0,20)
intvec_20_42:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87acca4c  ! 75: FCMPd	fcmpd	%fcc<n>, %f50, %f12
br_longdelay2_20_43:
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x39400001  ! 76: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_44:
	nop
	setx 0xbf81ab50b6ebda93, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 77: WRPR_TICK_R	wrpr	%r0, %r17, %tick
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_45
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_45:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 78: CASA_R	casa	[%r31] %asi, %r5, %r17
	.word 0x26cc0001  ! 1: BRLZ	brlz,a,pt	%r16,<label_0xc0001>
	.word 0x8d902c06  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x0c06, %pstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_47
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_47
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_47:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 80: RDPC	rd	%pc, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_48)+32, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_48)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_48:
	.word 0xa982a3dc  ! 81: WR_SET_SOFTINT_I	wr	%r10, 0x03dc, %set_softint
	.word 0x91914012  ! 82: WRPR_PIL_R	wrpr	%r5, %r18, %pil
intveclr_20_50:
	nop
	ta T_CHANGE_HPRIV
	setx 0x73623445643d0de5, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 83: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_20_51:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d90400d  ! 84: WRPR_WSTATE_R	wrpr	%r1, %r13, %wstate
splash_hpstate_20_52:
	.word 0x81982a44  ! 85: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a44, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_53:
	ta	T_CHANGE_NONHPRIV	! macro
ibp_20_54:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xda9fc028  ! 87: LDDA_R	ldda	[%r31, %r8] 0x01, %r13
splash_hpstate_20_55:
	ta T_CHANGE_NONHPRIV
	.word 0x8198289f  ! 88: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089f, %hpstate
	.word 0x99b20491  ! 89: FCMPLE32	fcmple32	%d8, %d48, %r12
	.word 0xdb27c000  ! 90: STF_R	st	%f13, [%r0, %r31]
splash_tba_20_56:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 91: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_20_57:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83ac7  ! 92: PREFETCHA_I	prefetcha	[%r0, + 0xfffffac7] %asi, #one_read
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_58) + 8, 16, 16)) -> intp(0,0,5)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_58)&0xffffffff)  + 8, 16, 16)) -> intp(0,0,5)
intvec_20_58:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_20_59:
	nop
	ta T_CHANGE_HPRIV
	setx 0x3bf233e20e78ced4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 94: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe080  ! 95: STDFA_I	stda	%f16, [0x0080, %r31]
	.word 0x93d020b3  ! 96: Tcc_I	tne	icc_or_xcc, %r0 + 179
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
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
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_60:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 97: RDPC	rd	%pc, %r9
memptr_20_61:
	set 0x60340000, %r31
	.word 0x8580b6cf  ! 98: WRCCR_I	wr	%r2, 0x16cf, %ccr
mondo_20_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d91c011  ! 99: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
	.word 0x91d02034  ! 100: Tcc_I	ta	icc_or_xcc, %r0 + 52
ibp_20_63:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe0bfc031  ! 101: STDA_R	stda	%r16, [%r31 + %r17] 0x01
	.word 0xc1bfe000  ! 102: STDFA_I	stda	%f0, [0x0000, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_64)+48, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_64)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_64:
	.word 0xa980a559  ! 103: WR_SET_SOFTINT_I	wr	%r2, 0x0559, %set_softint
	.word 0xc19fde00  ! 104: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe1bfc2c0  ! 105: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x20700001  ! 106: BPN	<illegal instruction>
jmptr_20_65:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 107: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe06fe00f  ! 108: LDSTUB_I	ldstub	%r16, [%r31 + 0x000f]
	.word 0xb1800011  ! 109: WR_STICK_REG_R	wr	%r0, %r17, %-
fpinit_20_66:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82765  ! 110: PREFETCHA_I	prefetcha	[%r0, + 0x0765] %asi, #one_read
	.word 0xe19fd960  ! 111: LDDFA_R	ldda	[%r31, %r0], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_67
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_67:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 112: RDPC	rd	%pc, %r19
	.word 0xa9a00172  ! 113: FABSq	dis not found

	.word 0x99450000  ! 114: RD_SET_SOFTINT	rd	%set_softint, %r12
	.word 0xc1bfde00  ! 115: STDFA_R	stda	%f0, [%r0, %r31]
pmu_20_68:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff85dfffffee4, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_69
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_69
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_69:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 117: RDPC	rd	%pc, %r17
splash_hpstate_20_70:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x81982f5e  ! 118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5e, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_71:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00d  ! 119: CASA_R	casa	[%r31] %asi, %r13, %r17
	.word 0xe2d7e030  ! 120: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r17
	.word 0x9f8035dd  ! 121: SIR	sir	0x15dd
	.word 0x9f802937  ! 122: SIR	sir	0x0937
tagged_20_72:
	tsubcctv %r19, 0x158e, %r11
	.word 0xe207e060  ! 123: LDUW_I	lduw	[%r31 + 0x0060], %r17
pmu_20_73:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffa82fffffe64, %g1, %g7
	.word 0xa3800007  ! 124: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_20_74:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d950013  ! 125: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
	.word 0xe26fe0be  ! 126: LDSTUB_I	ldstub	%r17, [%r31 + 0x00be]
	.word 0xe31fc000  ! 127: LDDF_R	ldd	[%r31, %r0], %f17
	.word 0xe227e0c0  ! 128: STW_I	stw	%r17, [%r31 + 0x00c0]
intveclr_20_75:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1f8487bdd3881c3b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe22fe0c1  ! 130: STB_I	stb	%r17, [%r31 + 0x00c1]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_76)+40, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_76)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_76:
	.word 0xa9847cbc  ! 131: WR_SET_SOFTINT_I	wr	%r17, 0x1cbc, %set_softint
	.word 0xe337e0e0  ! 132: STQF_I	-	%f17, [0x00e0, %r31]
	.word 0xe337c000  ! 133: STQF_R	-	%f17, [%r0, %r31]
	.word 0xe327e014  ! 134: STF_I	st	%f17, [0x0014, %r31]
jmptr_20_77:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 135: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_20_78:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffa59fffff39a, %g1, %g7
	.word 0xa3800007  ! 136: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_20_79:
	nop
	ta T_CHANGE_HPRIV
	mov 0xefa, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 137: CASA_R	casa	[%r31] %asi, %r17, %r17
	.word 0xc1bfc3e0  ! 138: STDFA_R	stda	%f0, [%r0, %r31]
mondo_20_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d948009  ! 139: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
	.word 0x8d802004  ! 140: WRFPRS_I	wr	%r0, 0x0004, %fprs
mondo_20_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d948006  ! 141: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
pmu_20_82:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffd05fffffc07, %g1, %g7
	.word 0xa3800007  ! 142: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa7a489d1  ! 143: FDIVd	fdivd	%f18, %f48, %f50
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_83)+56, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_83)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_83:
	.word 0xa9843711  ! 144: WR_SET_SOFTINT_I	wr	%r16, 0x1711, %set_softint
cwp_20_84:
    set user_data_start, %o7
	.word 0x93902000  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
intveclr_20_85:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8c734eee2b9be681, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 146: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_86:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 147: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xa7a00170  ! 148: FABSq	dis not found

	.word 0xc3e9c030  ! 149: PREFETCHA_R	prefetcha	[%r7, %r16] 0x01, #one_read
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_87:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 150: CASA_R	casa	[%r31] %asi, %r17, %r13
	.word 0x91914011  ! 151: WRPR_PIL_R	wrpr	%r5, %r17, %pil
	.word 0xe19fdf20  ! 152: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x3c700001  ! 153: BPPOS	<illegal instruction>
	.word 0xda27e002  ! 154: STW_I	stw	%r13, [%r31 + 0x0002]
pmu_20_89:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffb33fffffaf6, %g1, %g7
	.word 0xa3800007  ! 155: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_90:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 156: CASA_R	casa	[%r31] %asi, %r19, %r13
	setx 0x42de8966f5b0ac7b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_91:
	.word 0x39400001  ! 157: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2e700001  ! 158: BPVS	<illegal instruction>
	.word 0xda47c000  ! 159: LDSW_R	ldsw	[%r31 + %r0], %r13
splash_lsu_20_92:
	nop
	ta T_CHANGE_HPRIV
	set 0x63ffb350, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 160: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_93)+56, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_93)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_93:
	.word 0xa9853547  ! 161: WR_SET_SOFTINT_I	wr	%r20, 0x1547, %set_softint
	.word 0xe1bfc3e0  ! 162: STDFA_R	stda	%f16, [%r0, %r31]
pmu_20_94:
	nop
	setx 0xfffff5c2fffffac6, %g1, %g7
	.word 0xa3800007  ! 163: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3a800001  ! 164: BCC	bcc,a	<label_0x1>
	.word 0x95464000  ! 165: RD_STICK_CMPR_REG	rd	%-, %r10
pmu_20_95:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc28ffffff56, %g1, %g7
	.word 0xa3800007  ! 166: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xb1800011  ! 167: WR_STICK_REG_R	wr	%r0, %r17, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_96
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_96:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 168: CASA_R	casa	[%r31] %asi, %r19, %r13
pmu_20_97:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff4b2fffff022, %g1, %g7
	.word 0xa3800007  ! 169: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_20_98:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff669fffff00f, %g1, %g7
	.word 0xa3800007  ! 170: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d02035  ! 171: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xa9850012  ! 172: WR_SET_SOFTINT_R	wr	%r20, %r18, %set_softint
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 173: Tcc_R	te	icc_or_xcc, %r0 + %r30
brcommon_20_99:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xc32fc003  ! 174: STXFSR_R	st-sfr	%f1, [%r3, %r31]
br_badelay3_20_100:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8569a923	! Random illegal ?
	.word 0xe9150013  ! 1: LDQF_R	-	[%r20, %r19], %f20
	.word 0xa5a1c82b  ! 175: FADDs	fadds	%f7, %f11, %f18
	.word 0xa9a2c9d0  ! 176: FDIVd	fdivd	%f42, %f16, %f20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_101:
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 178: LDX_R	ldx	[%r31 + %r0], %r16
memptr_20_102:
	set user_data_start, %r31
	.word 0x8584361a  ! 179: WRCCR_I	wr	%r16, 0x161a, %ccr
	setx 0xe0fc99edd1934f34, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_103:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe020  ! 181: STDFA_I	stda	%f16, [0x0020, %r31]
    set 0x2a36, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b507cc  ! 182: PDIST	pdistn	%d20, %d12, %d12
mondo_20_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d914005  ! 183: WRPR_WSTATE_R	wrpr	%r5, %r5, %wstate
	.word 0x9f803f5d  ! 184: SIR	sir	0x1f5d
	.word 0x99a109d4  ! 185: FDIVd	fdivd	%f4, %f20, %f12
	.word 0xa9a349ab  ! 186: FDIVs	fdivs	%f13, %f11, %f20
dvapa_20_105:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc43, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd09fc033  ! 187: LDDA_R	ldda	[%r31, %r19] 0x01, %r8
mondo_20_106:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d94c012  ! 188: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	.word 0x24cc4001  ! 189: BRLEZ	brlez,a,pt	%r17,<label_0xc4001>
vahole_20_107:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe23fe275  ! 190: STD_I	std	%r17, [%r31 + 0x0275]
	.word 0xe237e0a8  ! 191: STH_I	sth	%r17, [%r31 + 0x00a8]
	.word 0xa7480000  ! 192: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_108)+40, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_108)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_108:
	.word 0xa985292a  ! 193: WR_SET_SOFTINT_I	wr	%r20, 0x092a, %set_softint
	.word 0x9f802e70  ! 194: SIR	sir	0x0e70
dvapa_20_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa85, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe6bfc021  ! 195: STDA_R	stda	%r19, [%r31 + %r1] 0x01
intveclr_20_110:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8fb8c0b2edf47341, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 196: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    set 0x275c, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b147d3  ! 197: PDIST	pdistn	%d36, %d50, %d50
	.word 0xd31fc012  ! 198: LDDF_R	ldd	[%r31, %r18], %f9
mondo_20_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d94c011  ! 199: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_113
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_113:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 200: RDPC	rd	%pc, %r9
mondo_20_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d91c011  ! 201: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
	.word 0xc19fd920  ! 202: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x93d020b4  ! 203: Tcc_I	tne	icc_or_xcc, %r0 + 180
memptr_20_115:
	set 0x60540000, %r31
	.word 0x85827e1b  ! 204: WRCCR_I	wr	%r9, 0x1e1b, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 205: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x91d020b2  ! 206: Tcc_I	ta	icc_or_xcc, %r0 + 178
pmu_20_116:
	nop
	setx 0xfffffe47fffffdb2, %g1, %g7
	.word 0xa3800007  ! 207: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0x8d902d99  ! 208: WRPR_PSTATE_I	wrpr	%r0, 0x0d99, %pstate
splash_tba_20_118:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 209: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x99a4c9d4  ! 210: FDIVd	fdivd	%f50, %f20, %f12
	.word 0xc1bfc2c0  ! 211: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x38800001  ! 212: BGU	bgu,a	<label_0x1>
	.word 0xc19fdb60  ! 213: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xa7454000  ! 214: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	.word 0x97a049cc  ! 215: FDIVd	fdivd	%f32, %f12, %f42
mondo_20_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d940003  ! 216: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
splash_lsu_20_120:
	nop
	ta T_CHANGE_HPRIV
	set 0x6053f5fd, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x24800001  ! 218: BLE	ble,a	<label_0x1>
	.word 0xc19fdc00  ! 219: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd797e020  ! 220: LDQFA_I	-	[%r31, 0x0020], %f11
	.word 0xd73fc000  ! 221: STDF_R	std	%f11, [%r0, %r31]
donret_20_121:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_121-donret_20_121-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0033edef | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd9e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_121:
	.word 0xd6ffe046  ! 222: SWAPA_I	swapa	%r11, [%r31 + 0x0046] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_122)+16, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_122)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_122:
	.word 0xa984a382  ! 223: WR_SET_SOFTINT_I	wr	%r18, 0x0382, %set_softint
	.word 0xa9a1c9ab  ! 224: FDIVs	fdivs	%f7, %f11, %f20
ibp_20_123:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe897c02b  ! 225: LDUHA_R	lduha	[%r31, %r11] 0x01, %r20
    set 0x2643, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb047c7  ! 226: PDIST	pdistn	%d32, %d38, %d44
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 227: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_124
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_124:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 228: RDPC	rd	%pc, %r16
	.word 0x91950008  ! 229: WRPR_PIL_R	wrpr	%r20, %r8, %pil
	.word 0x2acb0001  ! 1: BRNZ	brnz,a,pt	%r12,<label_0xb0001>
	.word 0x8d902c65  ! 230: WRPR_PSTATE_I	wrpr	%r0, 0x0c65, %pstate
	.word 0xd23fe0ac  ! 231: STD_I	std	%r9, [%r31 + 0x00ac]
mondo_20_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d94c013  ! 232: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 233: LDX_R	ldx	[%r31 + %r0], %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_128)+48, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_128)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_128:
	.word 0xa981f8ae  ! 234: WR_SET_SOFTINT_I	wr	%r7, 0x18ae, %set_softint
	.word 0xc19fc2c0  ! 235: LDDFA_R	ldda	[%r31, %r0], %f0
invtsb_20_129:
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
	.word 0x29800001  ! 236: FBL	fbl,a	<label_0x1>
splash_htba_20_130:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 237: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
ibp_20_131:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 238: CASA_R	casa	[%r31] %asi, %r19, %r9
	.word 0xa97029dc  ! 239: POPC_I	popc	0x09dc, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_132)+8, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_132)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_132:
	.word 0xa98434d2  ! 240: WR_SET_SOFTINT_I	wr	%r16, 0x14d2, %set_softint
	.word 0x91950010  ! 241: WRPR_PIL_R	wrpr	%r20, %r16, %pil
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_134
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_134:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 242: CASA_R	casa	[%r31] %asi, %r13, %r18
mondo_20_135:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d92800d  ! 243: WRPR_WSTATE_R	wrpr	%r10, %r13, %wstate
ibp_20_136:
	nop
	ta T_CHANGE_HPRIV
	.word 0x9f802530  ! 244: SIR	sir	0x0530
splash_tba_20_137:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 245: WRPR_TBA_R	wrpr	%r0, %r12, %tba
br_badelay3_20_138:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe968a68b	! Random illegal ?
	.word 0xe9134001  ! 1: LDQF_R	-	[%r13, %r1], %f20
	.word 0x9ba10829  ! 246: FADDs	fadds	%f4, %f9, %f13
	.word 0x99702ad4  ! 247: POPC_I	popc	0x0ad4, %r12
	.word 0xc19fc2c0  ! 248: LDDFA_R	ldda	[%r31, %r0], %f0
brcommon_20_139:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xd4bfc030  ! 249: STDA_R	stda	%r10, [%r31 + %r16] 0x01
pmu_20_140:
	nop
	setx 0xfffff58bfffff1a1, %g1, %g7
	.word 0xa3800007  ! 250: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd43fc000  ! 251: STD_R	std	%r10, [%r31 + %r0]
dvapa_20_141:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf3f, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd51fc010  ! 252: LDDF_R	ldd	[%r31, %r16], %f10
br_badelay3_20_142:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xfb767fe6	! Random illegal ?
	.word 0xe1150012  ! 1: LDQF_R	-	[%r20, %r18], %f16
	.word 0x91a48832  ! 253: FADDs	fadds	%f18, %f18, %f8
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 254: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x34d9b44084d29640, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_143:
	.word 0x39400001  ! 255: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
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
	.word 0x97414000  ! 256: RDPC	rd	%pc, %r11
	.word 0xa1702864  ! 257: POPC_I	popc	0x0864, %r16
dvapa_20_145:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdd2, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe4dfc032  ! 258: LDXA_R	ldxa	[%r31, %r18] 0x01, %r18
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 259: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe457c000  ! 260: LDSH_R	ldsh	[%r31 + %r0], %r18
splash_lsu_20_146:
	nop
	ta T_CHANGE_HPRIV
	set 0x37861931, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 262: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91950004  ! 263: WRPR_PIL_R	wrpr	%r20, %r4, %pil
	.word 0xe1bfde00  ! 264: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe19fe0c0  ! 265: LDDFA_I	ldda	[%r31, 0x00c0], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_148:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 266: CASA_R	casa	[%r31] %asi, %r20, %r18
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a00172  ! 268: FABSq	dis not found

    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_149
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_149:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 269: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0xe63fe048  ! 270: STD_I	std	%r19, [%r31 + 0x0048]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_150) + 24, 16, 16)) -> intp(7,0,26)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_150)&0xffffffff)  + 24, 16, 16)) -> intp(7,0,26)
intvec_20_150:
	.word 0x39400001  ! 271: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_151)+56, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_151)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_151:
	.word 0xa9813f32  ! 272: WR_SET_SOFTINT_I	wr	%r4, 0x1f32, %set_softint
	.word 0xe63fe0de  ! 273: STD_I	std	%r19, [%r31 + 0x00de]
memptr_20_152:
	set 0x60340000, %r31
	.word 0x858327f0  ! 274: WRCCR_I	wr	%r12, 0x07f0, %ccr
br_badelay1_20_153:
	.word 0x97b404d3  ! 1: FCMPNE32	fcmpne32	%d16, %d50, %r11
	.word 0xd731c002  ! 1: STQF_R	-	%f11, [%r2, %r7]
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	normalw
	.word 0x93458000  ! 275: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x39400001  ! 276: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfdf20  ! 277: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc19fe060  ! 278: LDDFA_I	ldda	[%r31, 0x0060], %f0
	.word 0xe1bfe040  ! 279: STDFA_I	stda	%f16, [0x0040, %r31]
	.word 0x91d020b5  ! 280: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x9f80288c  ! 281: SIR	sir	0x088c
jmptr_20_154:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 282: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_155:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 283: CASA_R	casa	[%r31] %asi, %r17, %r20
	.word 0xa9a00174  ! 284: FABSq	dis not found

mondo_20_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d908012  ! 285: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
	.word 0xc32fc000  ! 286: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xe1bfe0e0  ! 287: STDFA_I	stda	%f16, [0x00e0, %r31]
change_to_randtl_20_157:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_157:
	.word 0x8f902000  ! 288: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_decr_20_158:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa7848002  ! 289: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r2, %-
	.word 0xe1bfe000  ! 290: STDFA_I	stda	%f16, [0x0000, %r31]
	.word 0xd86fe0dd  ! 291: LDSTUB_I	ldstub	%r12, [%r31 + 0x00dd]
	.word 0xa3b44984  ! 292: BSHUFFLE	fmovc32	%d48, %d4, %d48
memptr_20_160:
	set 0x60140000, %r31
	.word 0x85847173  ! 293: WRCCR_I	wr	%r17, 0x1173, %ccr
splash_hpstate_20_161:
	ta T_CHANGE_NONHPRIV
	.word 0x8198260d  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060d, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_162) + 48, 16, 16)) -> intp(2,0,29)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_162)&0xffffffff)  + 48, 16, 16)) -> intp(2,0,29)
intvec_20_162:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0bfe0ca  ! 296: STDA_I	stda	%r8, [%r31 + 0x00ca] %asi
	.word 0x93a00173  ! 297: FABSq	dis not found

splash_tba_20_163:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 298: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_20_164:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 299: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d903321  ! 300: WRPR_PSTATE_I	wrpr	%r0, 0x1321, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_166)+40, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_166)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_166:
	.word 0xa9853bd4  ! 301: WR_SET_SOFTINT_I	wr	%r20, 0x1bd4, %set_softint
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
splash_cmpr_10_0:
	nop
	setx 0xd0372537748f2db0, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 1: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x81510000  ! 2: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe1bfde00  ! 3: STDFA_R	stda	%f16, [%r0, %r31]
	setx 0x23017f6304a446a1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_1:
	.word 0x39400001  ! 4: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 5: Tcc_R	te	icc_or_xcc, %r0 + %r30
mondo_10_2:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d950010  ! 6: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc1bfd960  ! 8: STDFA_R	stda	%f0, [%r0, %r31]
br_badelay2_10_3:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0xa3b4430d  ! 9: ALIGNADDRESS	alignaddr	%r17, %r13, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_4) + 8, 16, 16)) -> intp(2,0,25)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_4)&0xffffffff)  + 8, 16, 16)) -> intp(2,0,25)
intvec_10_4:
	.word 0x39400001  ! 10: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe477e0e1  ! 11: STX_I	stx	%r18, [%r31 + 0x00e1]
donret_10_5:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_5-donret_10_5-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005b4a7f | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x484, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_5:
	.word 0xe4ffe04c  ! 12: SWAPA_I	swapa	%r18, [%r31 + 0x004c] %asi
splash_cmpr_10_6:
	nop
	setx 0x5deaa7b8e106effe, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 13: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0xc3ea402a  ! 14: PREFETCHA_R	prefetcha	[%r9, %r10] 0x01, #one_read
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 15: Tcc_R	te	icc_or_xcc, %r0 + %r30
vahole_10_7:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe697c032  ! 16: LDUHA_R	lduha	[%r31, %r18] 0x01, %r19
br_badelay2_10_8:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f0, %f18, %f6
	.word 0xa1b50314  ! 17: ALIGNADDRESS	alignaddr	%r20, %r20, %r16
	.word 0xa3a00174  ! 18: FABSq	dis not found

	.word 0xb1800011  ! 19: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xad80f414  ! 20: WR_SOFTINT_REG_I	wr	%r3, 0x1414, %softint
	.word 0xd877c000  ! 21: STX_R	stx	%r12, [%r31 + %r0]
splash_tba_10_9:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 22: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd89fe030  ! 23: LDDA_I	ldda	[%r31, + 0x0030] %asi, %r12
jmptr_10_10:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 24: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_10_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d940014  ! 25: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	.word 0x91a4c9d3  ! 26: FDIVd	fdivd	%f50, %f50, %f8
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_12)+8, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_12)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_12:
	.word 0xa980afec  ! 27: WR_SET_SOFTINT_I	wr	%r2, 0x0fec, %set_softint
	.word 0x9f802d70  ! 28: SIR	sir	0x0d70
intveclr_10_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd77a5ec141b77ddf, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 29: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon_10_14:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xe91fc011  ! 30: LDDF_R	ldd	[%r31, %r17], %f20
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_15
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_15:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 31: RDPC	rd	%pc, %r20
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_16
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_16:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 32: CASA_R	casa	[%r31] %asi, %r17, %r9
splash_cmpr_10_17:
	nop
	setx 0x817067d6f056bd5a, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 33: WRPR_TICK_R	wrpr	%r0, %r17, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_18) + 40, 16, 16)) -> intp(3,0,17)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_18)&0xffffffff)  + 40, 16, 16)) -> intp(3,0,17)
intvec_10_18:
	.word 0x39400001  ! 34: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd26fe05c  ! 35: LDSTUB_I	ldstub	%r9, [%r31 + 0x005c]
splash_hpstate_10_19:
	.word 0x819829d4  ! 36: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d4, %hpstate
br_longdelay1_10_20:
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x9d97c000  ! 37: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 38: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd23fc000  ! 39: STD_R	std	%r9, [%r31 + %r0]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_21)+56, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_21)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_21:
	.word 0xa981f02f  ! 40: WR_SET_SOFTINT_I	wr	%r7, 0x102f, %set_softint
splash_hpstate_10_22:
	ta T_CHANGE_NONHPRIV
	.word 0x81982157  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0157, %hpstate
	.word 0xc3ea8032  ! 42: PREFETCHA_R	prefetcha	[%r10, %r18] 0x01, #one_read
splash_tba_10_23:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 43: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_10_24:
	nop
	setx 0x48a9ab6858c438e3, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 44: WRPR_TICK_R	wrpr	%r0, %r17, %tick
br_longdelay1_10_25:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 45: RESTORE_R	restore	%r31, %r0, %r31
mondo_10_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d934014  ! 46: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 47: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9810013  ! 48: WR_SET_SOFTINT_R	wr	%r4, %r19, %set_softint
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_27:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 49: CASA_R	casa	[%r31] %asi, %r19, %r20
	.word 0xe86fe05b  ! 50: LDSTUB_I	ldstub	%r20, [%r31 + 0x005b]
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 51: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_10_28:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff5a3fffff552, %g1, %g7
	.word 0xa3800007  ! 52: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_10_29:
	nop
	ta T_CHANGE_HPRIV
	mov 0xae0, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe93fc013  ! 53: STDF_R	std	%f20, [%r19, %r31]
	.word 0xc19fde00  ! 54: LDDFA_R	ldda	[%r31, %r0], %f0
fpinit_10_30:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 55: FCMPLE32	fcmple32	%d0, %d4, %r4
	setx 0x82cf11d338775f47, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_31:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 57: Tcc_R	ta	icc_or_xcc, %r0 + %r30
br_longdelay4_10_32:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 58: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xa3a2c9d4  ! 59: FDIVd	fdivd	%f42, %f20, %f48
	setx 0xa6e5e2d5f6ca982b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_33:
	.word 0x39400001  ! 60: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_10_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d94c003  ! 61: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_35:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 62: CASA_R	casa	[%r31] %asi, %r10, %r8
splash_decr_10_36:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa7834012  ! 63: WR_GRAPHICS_STATUS_REG_R	wr	%r13, %r18, %-
	.word 0x9f803f6b  ! 64: SIR	sir	0x1f6b
	.word 0xd08fe010  ! 65: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r8
	.word 0xd03fc000  ! 66: STD_R	std	%r8, [%r31 + %r0]
	.word 0xc32fc000  ! 67: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xd0800b00  ! 68: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r8
change_to_randtl_10_37:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_37:
	.word 0x8f902000  ! 69: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
dvapa_10_38:
	nop
	ta T_CHANGE_HPRIV
	mov 0xaa4, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd0dfc024  ! 70: LDXA_R	ldxa	[%r31, %r4] 0x01, %r8
intveclr_10_39:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe8a46581e8786e31, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 71: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_10_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d908011  ! 72: WRPR_WSTATE_R	wrpr	%r2, %r17, %wstate
	.word 0x91924010  ! 73: WRPR_PIL_R	wrpr	%r9, %r16, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_42) + 16, 16, 16)) -> intp(1,0,5)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_42)&0xffffffff)  + 16, 16, 16)) -> intp(1,0,5)
intvec_10_42:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95b407cb  ! 75: PDIST	pdistn	%d16, %d42, %d10
br_longdelay2_10_43:
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0xc36a6199  ! 76: PREFETCH_I	prefetch	[%r9 + 0x0199], #one_read
splash_cmpr_10_44:
	nop
	setx 0xdc7f480b85f86251, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 77: WRPR_TICK_R	wrpr	%r0, %r17, %tick
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_45
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_45:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 78: CASA_R	casa	[%r31] %asi, %r5, %r17
	.word 0x2ccc0001  ! 1: BRGZ	brgz,a,pt	%r16,<label_0xc0001>
	.word 0x8d903062  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x1062, %pstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_47
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_47
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_47:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 80: RDPC	rd	%pc, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_48)+8, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_48)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_48:
	.word 0xa982e124  ! 81: WR_SET_SOFTINT_I	wr	%r11, 0x0124, %set_softint
	.word 0x9192c001  ! 82: WRPR_PIL_R	wrpr	%r11, %r1, %pil
intveclr_10_50:
	nop
	ta T_CHANGE_HPRIV
	setx 0x329a004c7a2b11fb, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 83: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_10_51:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d94c010  ! 84: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
splash_hpstate_10_52:
	.word 0x81982edc  ! 85: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edc, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_53:
	ta	T_CHANGE_NONHPRIV	! macro
ibp_10_54:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x10, %r16
ibp_startwait10_54:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_10_54
    mov (~0x10&0xf0), %r16
    ld [%r23], %r16
ibp_wait10_54:
    brnz %r16, ibp_wait10_54
    ld [%r23], %r16
    ba,a ibp_startwait10_54
    mov 0x10, %r16
continue_ibp_10_54:
    ldxa [%g0]0x63, %r14        !Get raw TID
    srlx %r14, 3, %r14          !Get CID
    sllx %r16, %r14, %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_54:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_10_54
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_10_54:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_10_54
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit10_54:
    best_set_reg(0x00000050b0c00048,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xda9fc028  ! 87: LDDA_R	ldda	[%r31, %r8] 0x01, %r13
splash_hpstate_10_55:
	ta T_CHANGE_NONHPRIV
	.word 0x81982c47  ! 88: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c47, %hpstate
	.word 0x87ab0a52  ! 89: FCMPd	fcmpd	%fcc<n>, %f12, %f18
	.word 0xdb27c000  ! 90: STF_R	st	%f13, [%r0, %r31]
splash_tba_10_56:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 91: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_10_57:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 92: FDIVd	fdivd	%f0, %f4, %f6
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_58) + 48, 16, 16)) -> intp(2,0,22)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_58)&0xffffffff)  + 48, 16, 16)) -> intp(2,0,22)
intvec_10_58:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_10_59:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd2ab0885f94dcb09, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 94: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc19fda00  ! 95: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x91d020b2  ! 96: Tcc_I	ta	icc_or_xcc, %r0 + 178
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
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
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_60:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 97: RDPC	rd	%pc, %r18
memptr_10_61:
	set 0x60140000, %r31
	.word 0x85852d7b  ! 98: WRCCR_I	wr	%r20, 0x0d7b, %ccr
mondo_10_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d90400a  ! 99: WRPR_WSTATE_R	wrpr	%r1, %r10, %wstate
	.word 0x91d020b2  ! 100: Tcc_I	ta	icc_or_xcc, %r0 + 178
ibp_10_63:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x10, %r16
ibp_startwait10_63:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_10_63
    mov (~0x10&0xf0), %r16
    ld [%r23], %r16
ibp_wait10_63:
    brnz %r16, ibp_wait10_63
    ld [%r23], %r16
    ba,a ibp_startwait10_63
    mov 0x10, %r16
continue_ibp_10_63:
    ldxa [%g0]0x63, %r14        !Get raw TID
    srlx %r14, 3, %r14          !Get CID
    sllx %r16, %r14, %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_63:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_10_63
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_10_63:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_10_63
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit10_63:
    best_set_reg(0x000000509fc04802,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xc32fc011  ! 101: STXFSR_R	st-sfr	%f1, [%r17, %r31]
	.word 0xc1bfe000  ! 102: STDFA_I	stda	%f0, [0x0000, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_64)+0, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_64)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_64:
	.word 0xa9826d58  ! 103: WR_SET_SOFTINT_I	wr	%r9, 0x0d58, %set_softint
	.word 0xc1bfd920  ! 104: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc19fd920  ! 105: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x20700001  ! 106: BPN	<illegal instruction>
jmptr_10_65:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 107: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe06fe085  ! 108: LDSTUB_I	ldstub	%r16, [%r31 + 0x0085]
	.word 0xb1800011  ! 109: WR_STICK_REG_R	wr	%r0, %r17, %-
fpinit_10_66:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 110: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xe19fd960  ! 111: LDDFA_R	ldda	[%r31, %r0], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_67
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_67:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 112: RDPC	rd	%pc, %r9
	.word 0xa3a0016d  ! 113: FABSq	dis not found

	.word 0x91450000  ! 114: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0xc19fdc00  ! 115: LDDFA_R	ldda	[%r31, %r0], %f0
pmu_10_68:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff5acfffff0a8, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_69
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_69
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_69:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 117: RDPC	rd	%pc, %r13
splash_hpstate_10_70:
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x819825d7  ! 118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d7, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_71:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00d  ! 119: CASA_R	casa	[%r31] %asi, %r13, %r17
	.word 0xe2d7e038  ! 120: LDSHA_I	ldsha	[%r31, + 0x0038] %asi, %r17
	.word 0x9f80339c  ! 121: SIR	sir	0x139c
	.word 0x9f80380f  ! 122: SIR	sir	0x180f
tagged_10_72:
	tsubcctv %r18, 0x1384, %r5
	.word 0xe207e05c  ! 123: LDUW_I	lduw	[%r31 + 0x005c], %r17
pmu_10_73:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffdeefffff69c, %g1, %g7
	.word 0xa3800007  ! 124: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_10_74:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d924001  ! 125: WRPR_WSTATE_R	wrpr	%r9, %r1, %wstate
	.word 0xe26fe09f  ! 126: LDSTUB_I	ldstub	%r17, [%r31 + 0x009f]
	.word 0xe31fc000  ! 127: LDDF_R	ldd	[%r31, %r0], %f17
	.word 0xe227e01d  ! 128: STW_I	stw	%r17, [%r31 + 0x001d]
intveclr_10_75:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe1539ab75fcc1a39, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe22fe020  ! 130: STB_I	stb	%r17, [%r31 + 0x0020]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_76)+48, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_76)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_76:
	.word 0xa981beee  ! 131: WR_SET_SOFTINT_I	wr	%r6, 0x1eee, %set_softint
	.word 0xe337e050  ! 132: STQF_I	-	%f17, [0x0050, %r31]
	.word 0xe337c000  ! 133: STQF_R	-	%f17, [%r0, %r31]
	.word 0xe327e042  ! 134: STF_I	st	%f17, [0x0042, %r31]
jmptr_10_77:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 135: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_10_78:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff475fffffe51, %g1, %g7
	.word 0xa3800007  ! 136: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_10_79:
	nop
	ta T_CHANGE_HPRIV
	mov 0x97c, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe31fc011  ! 137: LDDF_R	ldd	[%r31, %r17], %f17
	.word 0xc19fd920  ! 138: LDDFA_R	ldda	[%r31, %r0], %f0
mondo_10_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d90c010  ! 139: WRPR_WSTATE_R	wrpr	%r3, %r16, %wstate
	.word 0x8d802000  ! 140: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_10_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d940002  ! 141: WRPR_WSTATE_R	wrpr	%r16, %r2, %wstate
pmu_10_82:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff4cafffff6aa, %g1, %g7
	.word 0xa3800007  ! 142: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x95b50493  ! 143: FCMPLE32	fcmple32	%d20, %d50, %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_83)+32, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_83)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_83:
	.word 0xa98225d8  ! 144: WR_SET_SOFTINT_I	wr	%r8, 0x05d8, %set_softint
cwp_10_84:
    set user_data_start, %o7
	.word 0x93902005  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
intveclr_10_85:
	nop
	ta T_CHANGE_HPRIV
	setx 0x813bbbb804e9900b, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 146: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_86:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 147: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0x97a00161  ! 148: FABSq	dis not found

	.word 0xa17021c9  ! 149: POPC_I	popc	0x01c9, %r16
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_87:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 150: CASA_R	casa	[%r31] %asi, %r17, %r13
	.word 0x91948010  ! 151: WRPR_PIL_R	wrpr	%r18, %r16, %pil
	.word 0xe19fdb60  ! 152: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x3c700001  ! 153: BPPOS	<illegal instruction>
	.word 0xda27e0d0  ! 154: STW_I	stw	%r13, [%r31 + 0x00d0]
pmu_10_89:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff2befffff11d, %g1, %g7
	.word 0xa3800007  ! 155: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_90:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 156: CASA_R	casa	[%r31] %asi, %r19, %r13
	setx 0x71fa7e094b3c32b7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_91:
	.word 0x39400001  ! 157: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2e700001  ! 158: BPVS	<illegal instruction>
	.word 0xda47c000  ! 159: LDSW_R	ldsw	[%r31 + %r0], %r13
splash_lsu_10_92:
	nop
	ta T_CHANGE_HPRIV
	set 0x53f1623c, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 160: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_93)+16, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_93)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_93:
	.word 0xa9826cbc  ! 161: WR_SET_SOFTINT_I	wr	%r9, 0x0cbc, %set_softint
	.word 0xc19fdb60  ! 162: LDDFA_R	ldda	[%r31, %r0], %f0
pmu_10_94:
	nop
	setx 0xfffff8a9fffffd6c, %g1, %g7
	.word 0xa3800007  ! 163: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3a800001  ! 164: BCC	bcc,a	<label_0x1>
	.word 0x95464000  ! 165: RD_STICK_CMPR_REG	rd	%-, %r10
pmu_10_95:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff90dfffff108, %g1, %g7
	.word 0xa3800007  ! 166: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xb1800011  ! 167: WR_STICK_REG_R	wr	%r0, %r17, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_96
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_96:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 168: CASA_R	casa	[%r31] %asi, %r19, %r13
pmu_10_97:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffd9efffff936, %g1, %g7
	.word 0xa3800007  ! 169: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_10_98:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff564fffffc95, %g1, %g7
	.word 0xa3800007  ! 170: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b5  ! 171: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xa9848004  ! 172: WR_SET_SOFTINT_R	wr	%r18, %r4, %set_softint
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 173: Tcc_R	te	icc_or_xcc, %r0 + %r30
brcommon_10_99:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xda9fc023  ! 174: LDDA_R	ldda	[%r31, %r3] 0x01, %r13
br_badelay3_10_100:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xcf423e57	! Random illegal ?
	.word 0xe1120011  ! 1: LDQF_R	-	[%r8, %r17], %f16
	.word 0x99a50834  ! 175: FADDs	fadds	%f20, %f20, %f12
	.word 0xa5a189c5  ! 176: FDIVd	fdivd	%f6, %f36, %f18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_101:
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 178: LDX_R	ldx	[%r31 + %r0], %r16
memptr_10_102:
	set user_data_start, %r31
	.word 0x8584bc98  ! 179: WRCCR_I	wr	%r18, 0x1c98, %ccr
	setx 0x7519b5e259a5434d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_103:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe020  ! 181: STDFA_I	stda	%f0, [0x0020, %r31]
    set 0x11f2, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b0c7c2  ! 182: PDIST	pdistn	%d34, %d2, %d48
mondo_10_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d928014  ! 183: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
	.word 0x9f802a6d  ! 184: SIR	sir	0x0a6d
	.word 0x9ba349c7  ! 185: FDIVd	fdivd	%f44, %f38, %f44
	.word 0xa9a489a6  ! 186: FDIVs	fdivs	%f18, %f6, %f20
dvapa_10_105:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb39, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 187: CASA_R	casa	[%r31] %asi, %r19, %r8
mondo_10_106:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d924002  ! 188: WRPR_WSTATE_R	wrpr	%r9, %r2, %wstate
	.word 0x99a489d2  ! 189: FDIVd	fdivd	%f18, %f18, %f12
vahole_10_107:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe2dfc021  ! 190: LDXA_R	ldxa	[%r31, %r1] 0x01, %r17
	.word 0xe237e0aa  ! 191: STH_I	sth	%r17, [%r31 + 0x00aa]
	.word 0x9b480000  ! 192: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_108)+32, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_108)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_108:
	.word 0xa982f744  ! 193: WR_SET_SOFTINT_I	wr	%r11, 0x1744, %set_softint
	.word 0x9f802616  ! 194: SIR	sir	0x0616
dvapa_10_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0x81c, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe697c021  ! 195: LDUHA_R	lduha	[%r31, %r1] 0x01, %r19
intveclr_10_110:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7d8037577e06b592, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 196: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    set 0x1647, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b1c7d3  ! 197: PDIST	pdistn	%d38, %d50, %d50
	.word 0xd33fc012  ! 198: STDF_R	std	%f9, [%r18, %r31]
mondo_10_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d90c013  ! 199: WRPR_WSTATE_R	wrpr	%r3, %r19, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_113
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_113:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 200: RDPC	rd	%pc, %r16
mondo_10_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d91000a  ! 201: WRPR_WSTATE_R	wrpr	%r4, %r10, %wstate
	.word 0xc19fc2c0  ! 202: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x91d02032  ! 203: Tcc_I	ta	icc_or_xcc, %r0 + 50
memptr_10_115:
	set 0x60740000, %r31
	.word 0x85807ea1  ! 204: WRCCR_I	wr	%r1, 0x1ea1, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 205: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x91d02035  ! 206: Tcc_I	ta	icc_or_xcc, %r0 + 53
pmu_10_116:
	nop
	setx 0xfffff01afffff7a5, %g1, %g7
	.word 0xa3800007  ! 207: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x8d903ffb  ! 208: WRPR_PSTATE_I	wrpr	%r0, 0x1ffb, %pstate
splash_tba_10_118:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 209: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87ac8a4a  ! 210: FCMPd	fcmpd	%fcc<n>, %f18, %f10
	.word 0xc1bfc2c0  ! 211: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x38800001  ! 212: BGU	bgu,a	<label_0x1>
	.word 0xc1bfc3e0  ! 213: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa3454000  ! 214: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0x9ba0c9c6  ! 215: FDIVd	fdivd	%f34, %f6, %f44
mondo_10_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d944011  ! 216: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
splash_lsu_10_120:
	nop
	ta T_CHANGE_HPRIV
	set 0x35c66285, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x24800001  ! 218: BLE	ble,a	<label_0x1>
	.word 0xc19fc2c0  ! 219: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd797e038  ! 220: LDQFA_I	-	[%r31, 0x0038], %f11
	.word 0xd73fc000  ! 221: STDF_R	std	%f11, [%r0, %r31]
donret_10_121:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_121-donret_10_121-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f01778 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x95c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_121:
	.word 0xd6ffe05c  ! 222: SWAPA_I	swapa	%r11, [%r31 + 0x005c] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_122)+56, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_122)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_122:
	.word 0xa9836764  ! 223: WR_SET_SOFTINT_I	wr	%r13, 0x0764, %set_softint
	.word 0xa5703577  ! 224: POPC_I	popc	0x1577, %r18
ibp_10_123:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x10, %r16
ibp_startwait10_123:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_10_123
    mov (~0x10&0xf0), %r16
    ld [%r23], %r16
ibp_wait10_123:
    brnz %r16, ibp_wait10_123
    ld [%r23], %r16
    ba,a ibp_startwait10_123
    mov 0x10, %r16
continue_ibp_10_123:
    ldxa [%g0]0x63, %r14        !Get raw TID
    srlx %r14, 3, %r14          !Get CID
    sllx %r16, %r14, %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_123:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_10_123
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_10_123:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_10_123
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit10_123:
    best_set_reg(0x00000050c6c8023e,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe9e7e00b  ! 225: CASA_R	casa	[%r31] %asi, %r11, %r20
    set 0x1743, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b507d1  ! 226: PDIST	pdistn	%d20, %d48, %d16
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 227: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_124
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_124:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 228: RDPC	rd	%pc, %r8
	.word 0x91934010  ! 229: WRPR_PIL_R	wrpr	%r13, %r16, %pil
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x8d902442  ! 230: WRPR_PSTATE_I	wrpr	%r0, 0x0442, %pstate
	.word 0xd23fe092  ! 231: STD_I	std	%r9, [%r31 + 0x0092]
mondo_10_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d94c009  ! 232: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 233: LDX_R	ldx	[%r31 + %r0], %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_128)+0, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_128)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_128:
	.word 0xa980aed0  ! 234: WR_SET_SOFTINT_I	wr	%r2, 0x0ed0, %set_softint
	.word 0xc1bfdc00  ! 235: STDFA_R	stda	%f0, [%r0, %r31]
invtsb_10_129:
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
	.word 0x29800001  ! 236: FBL	fbl,a	<label_0x1>
splash_htba_10_130:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 237: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
ibp_10_131:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x10, %r16
ibp_startwait10_131:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_10_131
    mov (~0x10&0xf0), %r16
    ld [%r23], %r16
ibp_wait10_131:
    brnz %r16, ibp_wait10_131
    ld [%r23], %r16
    ba,a ibp_startwait10_131
    mov 0x10, %r16
continue_ibp_10_131:
    ldxa [%g0]0x63, %r14        !Get raw TID
    srlx %r14, 3, %r14          !Get CID
    sllx %r16, %r14, %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_131:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_10_131
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_10_131:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_10_131
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit10_131:
    best_set_reg(0x00000050cdc23e37,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd23ff10c  ! 238: STD_I	std	%r9, [%r31 + 0xfffff10c]
	.word 0xc3e88028  ! 239: PREFETCHA_R	prefetcha	[%r2, %r8] 0x01, #one_read
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_132)+8, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_132)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_132:
	.word 0xa984afaa  ! 240: WR_SET_SOFTINT_I	wr	%r18, 0x0faa, %set_softint
	.word 0x9195000b  ! 241: WRPR_PIL_R	wrpr	%r20, %r11, %pil
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_134
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_134:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 242: CASA_R	casa	[%r31] %asi, %r13, %r18
mondo_10_135:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d908012  ! 243: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
ibp_10_136:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x10, %r16
ibp_startwait10_136:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_10_136
    mov (~0x10&0xf0), %r16
    ld [%r23], %r16
ibp_wait10_136:
    brnz %r16, ibp_wait10_136
    ld [%r23], %r16
    ba,a ibp_startwait10_136
    mov 0x10, %r16
continue_ibp_10_136:
    ldxa [%g0]0x63, %r14        !Get raw TID
    srlx %r14, 3, %r14          !Get CID
    sllx %r16, %r14, %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_136:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_10_136
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_10_136:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_10_136
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit10_136:
    best_set_reg(0x0000005014fe37bf,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe497c033  ! 244: LDUHA_R	lduha	[%r31, %r19] 0x01, %r18
splash_tba_10_137:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 245: WRPR_TBA_R	wrpr	%r0, %r12, %tba
br_badelay3_10_138:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x937dfbfc	! Random illegal ?
	.word 0xd5124014  ! 1: LDQF_R	-	[%r9, %r20], %f10
	.word 0x91a04834  ! 246: FADDs	fadds	%f1, %f20, %f8
	.word 0x99a189a3  ! 247: FDIVs	fdivs	%f6, %f3, %f12
	.word 0xc1bfd960  ! 248: STDFA_R	stda	%f0, [%r0, %r31]
brcommon_10_139:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xc32fc010  ! 249: STXFSR_R	st-sfr	%f1, [%r16, %r31]
pmu_10_140:
	nop
	setx 0xfffff2cafffff5f6, %g1, %g7
	.word 0xa3800007  ! 250: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd43fc000  ! 251: STD_R	std	%r10, [%r31 + %r0]
dvapa_10_141:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9ab, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd5e7e010  ! 252: CASA_R	casa	[%r31] %asi, %r16, %r10
br_badelay3_10_142:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xb74f52aa	! Random illegal ?
	.word 0xe5144007  ! 1: LDQF_R	-	[%r17, %r7], %f18
	.word 0xa9a44831  ! 253: FADDs	fadds	%f17, %f17, %f20
	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 254: Tcc_R	te	icc_or_xcc, %r0 + %r30
	setx 0x52d4dfc6d4c83338, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_143:
	.word 0x39400001  ! 255: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
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
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_144:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 256: RDPC	rd	%pc, %r12
	.word 0x97a189aa  ! 257: FDIVs	fdivs	%f6, %f10, %f11
dvapa_10_145:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdd0, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 258: CASA_R	casa	[%r31] %asi, %r18, %r18
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 259: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe457c000  ! 260: LDSH_R	ldsh	[%r31 + %r0], %r18
splash_lsu_10_146:
	nop
	ta T_CHANGE_HPRIV
	set 0x9e039043, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 262: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91950013  ! 263: WRPR_PIL_R	wrpr	%r20, %r19, %pil
	.word 0xe1bfda00  ! 264: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe19fe0a0  ! 265: LDDFA_I	ldda	[%r31, 0x00a0], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_148:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 266: CASA_R	casa	[%r31] %asi, %r20, %r18
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a00173  ! 268: FABSq	dis not found

    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_149
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_149:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 269: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0xe63fe0e8  ! 270: STD_I	std	%r19, [%r31 + 0x00e8]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_150) + 0, 16, 16)) -> intp(6,0,9)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_150)&0xffffffff)  + 0, 16, 16)) -> intp(6,0,9)
intvec_10_150:
	.word 0x39400001  ! 271: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_151)+40, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_151)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_151:
	.word 0xa980b6ef  ! 272: WR_SET_SOFTINT_I	wr	%r2, 0x16ef, %set_softint
	.word 0xe63fe078  ! 273: STD_I	std	%r19, [%r31 + 0x0078]
memptr_10_152:
	set 0x60740000, %r31
	.word 0x8580b150  ! 274: WRCCR_I	wr	%r2, 0x1150, %ccr
br_badelay1_10_153:
	.word 0x24cd0001  ! 1: BRLEZ	brlez,a,pt	%r20,<label_0xd0001>
	.word 0xdb34c011  ! 1: STQF_R	-	%f13, [%r17, %r19]
	.word 0x24c9c001  ! 1: BRLEZ	brlez,a,pt	%r7,<label_0x9c001>
	normalw
	.word 0xa1458000  ! 275: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x95b044c4  ! 276: FCMPNE32	fcmpne32	%d32, %d4, %r10
	.word 0xc19fdc00  ! 277: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xc19fe080  ! 278: LDDFA_I	ldda	[%r31, 0x0080], %f0
	.word 0xe19fdf20  ! 279: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x91d02035  ! 280: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x9f802725  ! 281: SIR	sir	0x0725
jmptr_10_154:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 282: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_155:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 283: CASA_R	casa	[%r31] %asi, %r17, %r20
	.word 0xa7a00162  ! 284: FABSq	dis not found

mondo_10_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d92c010  ! 285: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
	.word 0xc32fc000  ! 286: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xe1bfd920  ! 287: STDFA_R	stda	%f16, [%r0, %r31]
change_to_randtl_10_157:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_157:
	.word 0x8f902000  ! 288: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_decr_10_158:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa7848014  ! 289: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r20, %-
	.word 0xe1bfe0a0  ! 290: STDFA_I	stda	%f16, [0x00a0, %r31]
	.word 0xd86fe021  ! 291: LDSTUB_I	ldstub	%r12, [%r31 + 0x0021]
	.word 0xa5b1898a  ! 292: BSHUFFLE	fmovc32	%d6, %d10, %d18
memptr_10_160:
	set 0x60740000, %r31
	.word 0x8584b35d  ! 293: WRCCR_I	wr	%r18, 0x135d, %ccr
splash_hpstate_10_161:
	ta T_CHANGE_NONHPRIV
	.word 0x81982455  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0455, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_162) + 16, 16, 16)) -> intp(3,0,23)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_162)&0xffffffff)  + 16, 16, 16)) -> intp(3,0,23)
intvec_10_162:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0bfe09a  ! 296: STDA_I	stda	%r8, [%r31 + 0x009a] %asi
	.word 0x95a00171  ! 297: FABSq	dis not found

splash_tba_10_163:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 298: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_10_164:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 299: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d9036b9  ! 300: WRPR_PSTATE_I	wrpr	%r0, 0x16b9, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_166)+24, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_166)&0xffffffff) +24, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_166:
	.word 0xa984322e  ! 301: WR_SET_SOFTINT_I	wr	%r16, 0x122e, %set_softint
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
splash_cmpr_8_0:
	nop
	setx 0xbda452a1a8d4923d, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 1: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x81510000  ! 2: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe1bfd920  ! 3: STDFA_R	stda	%f16, [%r0, %r31]
	setx 0x3f8eef194d2b3cca, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_1:
	.word 0x39400001  ! 4: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 5: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_8_2:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d928001  ! 6: WRPR_WSTATE_R	wrpr	%r10, %r1, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe19fd920  ! 8: LDDFA_R	ldda	[%r31, %r0], %f16
br_badelay2_8_3:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x99b44314  ! 9: ALIGNADDRESS	alignaddr	%r17, %r20, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_4) + 16, 16, 16)) -> intp(2,0,0)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_4)&0xffffffff)  + 16, 16, 16)) -> intp(2,0,0)
intvec_8_4:
	.word 0x39400001  ! 10: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe477e080  ! 11: STX_I	stx	%r18, [%r31 + 0x0080]
donret_8_5:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_5-donret_8_5-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0073c136 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xdd6, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_5:
	.word 0xe4ffe03c  ! 12: SWAPA_I	swapa	%r18, [%r31 + 0x003c] %asi
splash_cmpr_8_6:
	nop
	setx 0x27d85ac092adfc87, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 13: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0xc3eac02d  ! 14: PREFETCHA_R	prefetcha	[%r11, %r13] 0x01, #one_read
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 15: Tcc_R	ta	icc_or_xcc, %r0 + %r30
vahole_8_7:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe6dfc032  ! 16: LDXA_R	ldxa	[%r31, %r18] 0x01, %r19
br_badelay2_8_8:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f4, %f18, %f4
	.word 0xa7b04303  ! 17: ALIGNADDRESS	alignaddr	%r1, %r3, %r19
	.word 0x93a00165  ! 18: FABSq	dis not found

	.word 0xb1800011  ! 19: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xad833be3  ! 20: WR_SOFTINT_REG_I	wr	%r12, 0x1be3, %softint
	.word 0xd877c000  ! 21: STX_R	stx	%r12, [%r31 + %r0]
splash_tba_8_9:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 22: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd89fe038  ! 23: LDDA_I	ldda	[%r31, + 0x0038] %asi, %r12
jmptr_8_10:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 24: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_8_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d92400a  ! 25: WRPR_WSTATE_R	wrpr	%r9, %r10, %wstate
	.word 0x9ba489c2  ! 26: FDIVd	fdivd	%f18, %f2, %f44
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_12)+48, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_12)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_12:
	.word 0xa98528be  ! 27: WR_SET_SOFTINT_I	wr	%r20, 0x08be, %set_softint
	.word 0x9f8026f7  ! 28: SIR	sir	0x06f7
intveclr_8_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc2387c14fee99213, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 29: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon_8_14:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xe89fc031  ! 30: LDDA_R	ldda	[%r31, %r17] 0x01, %r20
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_15
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_15:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 31: RDPC	rd	%pc, %r18
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_16
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_16:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 32: CASA_R	casa	[%r31] %asi, %r17, %r9
splash_cmpr_8_17:
	nop
	setx 0xfd88efb7af8de880, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 33: WRPR_TICK_R	wrpr	%r0, %r17, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_18) + 24, 16, 16)) -> intp(4,0,26)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_18)&0xffffffff)  + 24, 16, 16)) -> intp(4,0,26)
intvec_8_18:
	.word 0x39400001  ! 34: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd26fe0f7  ! 35: LDSTUB_I	ldstub	%r9, [%r31 + 0x00f7]
splash_hpstate_8_19:
	.word 0x81982c5f  ! 36: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5f, %hpstate
br_longdelay1_8_20:
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0xbfe7c000  ! 37: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 38: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd23fc000  ! 39: STD_R	std	%r9, [%r31 + %r0]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_21)+48, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_21)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_21:
	.word 0xa984af09  ! 40: WR_SET_SOFTINT_I	wr	%r18, 0x0f09, %set_softint
splash_hpstate_8_22:
	ta T_CHANGE_NONHPRIV
	.word 0x8198250e  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050e, %hpstate
	.word 0x87acca50  ! 42: FCMPd	fcmpd	%fcc<n>, %f50, %f16
splash_tba_8_23:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 43: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_8_24:
	nop
	setx 0x5c492d6baf3bf942, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 44: WRPR_TICK_R	wrpr	%r0, %r17, %tick
br_longdelay1_8_25:
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0xbfefc000  ! 45: RESTORE_R	restore	%r31, %r0, %r31
mondo_8_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d91c010  ! 46: WRPR_WSTATE_R	wrpr	%r7, %r16, %wstate
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 47: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa9840005  ! 48: WR_SET_SOFTINT_R	wr	%r16, %r5, %set_softint
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_27:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 49: CASA_R	casa	[%r31] %asi, %r19, %r20
	.word 0xe86fe059  ! 50: LDSTUB_I	ldstub	%r20, [%r31 + 0x0059]
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 51: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_8_28:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff4ddfffff2c2, %g1, %g7
	.word 0xa3800007  ! 52: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_8_29:
	nop
	ta T_CHANGE_HPRIV
	mov 0x883, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe83fe982  ! 53: STD_I	std	%r20, [%r31 + 0x0982]
	.word 0xe19fda00  ! 54: LDDFA_R	ldda	[%r31, %r0], %f16
fpinit_8_30:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 55: FDIVs	fdivs	%f0, %f4, %f8
	setx 0x88286f941a037c5f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_31:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 57: Tcc_R	ta	icc_or_xcc, %r0 + %r30
br_longdelay4_8_32:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 58: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x91a249d0  ! 59: FDIVd	fdivd	%f40, %f16, %f8
	setx 0x2670081162cb2fb5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_33:
	.word 0x39400001  ! 60: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_8_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d94c010  ! 61: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_35:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 62: CASA_R	casa	[%r31] %asi, %r10, %r8
splash_decr_8_36:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r7, [%r1] 0x45
	.word 0xa7848012  ! 63: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r18, %-
	.word 0x9f8031a4  ! 64: SIR	sir	0x11a4
	.word 0xd08fe030  ! 65: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r8
	.word 0xd03fc000  ! 66: STD_R	std	%r8, [%r31 + %r0]
	.word 0xc32fc000  ! 67: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xd0800a80  ! 68: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r8
change_to_randtl_8_37:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_37:
	.word 0x8f902002  ! 69: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
dvapa_8_38:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdf4, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd097c024  ! 70: LDUHA_R	lduha	[%r31, %r4] 0x01, %r8
intveclr_8_39:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2af3d0a7409070c4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 71: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_8_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d91c007  ! 72: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
	.word 0x9192c005  ! 73: WRPR_PIL_R	wrpr	%r11, %r5, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_42) + 32, 16, 16)) -> intp(1,0,20)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_42)&0xffffffff)  + 32, 16, 16)) -> intp(1,0,20)
intvec_8_42:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f803fc1  ! 75: SIR	sir	0x1fc1
br_longdelay2_8_43:
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x87ad0a43  ! 76: FCMPd	fcmpd	%fcc<n>, %f20, %f34
splash_cmpr_8_44:
	nop
	setx 0x04eb56d253710093, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 77: WRPR_TICK_R	wrpr	%r0, %r17, %tick
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_45
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_45:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 78: CASA_R	casa	[%r31] %asi, %r5, %r17
	.word 0x2ecc8001  ! 1: BRGEZ	brgez,a,pt	%r18,<label_0xc8001>
	.word 0x8d90338a  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x138a, %pstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_47
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_47
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_47:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 80: RDPC	rd	%pc, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_48)+40, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_48)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_48:
	.word 0xa98460a7  ! 81: WR_SET_SOFTINT_I	wr	%r17, 0x00a7, %set_softint
	.word 0x9192c010  ! 82: WRPR_PIL_R	wrpr	%r11, %r16, %pil
intveclr_8_50:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb944b0f61c2f4a8e, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 83: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_8_51:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d91c013  ! 84: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
splash_hpstate_8_52:
	.word 0x81982817  ! 85: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0817, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_53:
	ta	T_CHANGE_NONHPRIV	! macro
ibp_8_54:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xdb3fc008  ! 87: STDF_R	std	%f13, [%r8, %r31]
splash_hpstate_8_55:
	ta T_CHANGE_NONHPRIV
	.word 0x81982117  ! 88: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0117, %hpstate
	.word 0x97b08481  ! 89: FCMPLE32	fcmple32	%d2, %d32, %r11
	.word 0xdb27c000  ! 90: STF_R	st	%f13, [%r0, %r31]
splash_tba_8_56:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 91: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_8_57:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 92: FDIVd	fdivd	%f0, %f4, %f8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_58) + 16, 16, 16)) -> intp(7,0,14)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_58)&0xffffffff)  + 16, 16, 16)) -> intp(7,0,14)
intvec_8_58:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_8_59:
	nop
	ta T_CHANGE_HPRIV
	setx 0x44bc06adce91263e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 94: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe19fda00  ! 95: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x83d02035  ! 96: Tcc_I	te	icc_or_xcc, %r0 + 53
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
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
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_60:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 97: RDPC	rd	%pc, %r18
memptr_8_61:
	set 0x60540000, %r31
	.word 0x85846a8c  ! 98: WRCCR_I	wr	%r17, 0x0a8c, %ccr
mondo_8_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d92800c  ! 99: WRPR_WSTATE_R	wrpr	%r10, %r12, %wstate
	.word 0x83d02032  ! 100: Tcc_I	te	icc_or_xcc, %r0 + 50
ibp_8_63:
	nop
	ta T_CHANGE_HPRIV
	.word 0xc32fc011  ! 101: STXFSR_R	st-sfr	%f1, [%r17, %r31]
	.word 0xe1bfe0c0  ! 102: STDFA_I	stda	%f16, [0x00c0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_64)+40, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_64)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_64:
	.word 0xa984fac4  ! 103: WR_SET_SOFTINT_I	wr	%r19, 0x1ac4, %set_softint
	.word 0xe1bfe0e0  ! 104: STDFA_I	stda	%f16, [0x00e0, %r31]
	.word 0xc1bfc2c0  ! 105: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x20700001  ! 106: BPN	<illegal instruction>
jmptr_8_65:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 107: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe06fe0d9  ! 108: LDSTUB_I	ldstub	%r16, [%r31 + 0x00d9]
	.word 0xb1800011  ! 109: WR_STICK_REG_R	wr	%r0, %r17, %-
fpinit_8_66:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82765  ! 110: PREFETCHA_I	prefetcha	[%r0, + 0x0765] %asi, #one_read
	.word 0xc1bfe000  ! 111: STDFA_I	stda	%f0, [0x0000, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_67
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_67:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 112: RDPC	rd	%pc, %r17
	.word 0x91a00169  ! 113: FABSq	dis not found

	.word 0xa7450000  ! 114: RD_SET_SOFTINT	rd	%set_softint, %r19
	.word 0xe19fc2c0  ! 115: LDDFA_R	ldda	[%r31, %r0], %f16
pmu_8_68:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffb9cfffff183, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_69
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_69
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_69:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 117: RDPC	rd	%pc, %r17
splash_hpstate_8_70:
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0x81982847  ! 118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0847, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_71:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00d  ! 119: CASA_R	casa	[%r31] %asi, %r13, %r17
	.word 0xe2d7e018  ! 120: LDSHA_I	ldsha	[%r31, + 0x0018] %asi, %r17
	.word 0x9f8034c4  ! 121: SIR	sir	0x14c4
	.word 0x9f803e5a  ! 122: SIR	sir	0x1e5a
tagged_8_72:
	tsubcctv %r16, 0x1db2, %r19
	.word 0xe207e058  ! 123: LDUW_I	lduw	[%r31 + 0x0058], %r17
pmu_8_73:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffff5fffff234, %g1, %g7
	.word 0xa3800007  ! 124: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_8_74:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d944003  ! 125: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
	.word 0xe26fe0c5  ! 126: LDSTUB_I	ldstub	%r17, [%r31 + 0x00c5]
	.word 0xe31fc000  ! 127: LDDF_R	ldd	[%r31, %r0], %f17
	.word 0xe227e008  ! 128: STW_I	stw	%r17, [%r31 + 0x0008]
intveclr_8_75:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1ee25f7bb21ee64f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe22fe019  ! 130: STB_I	stb	%r17, [%r31 + 0x0019]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_76)+8, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_76)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_76:
	.word 0xa9817ad7  ! 131: WR_SET_SOFTINT_I	wr	%r5, 0x1ad7, %set_softint
	.word 0xe337e061  ! 132: STQF_I	-	%f17, [0x0061, %r31]
	.word 0xe337c000  ! 133: STQF_R	-	%f17, [%r0, %r31]
	.word 0xe327e040  ! 134: STF_I	st	%f17, [0x0040, %r31]
jmptr_8_77:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 135: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_8_78:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffff1ffffffbeb, %g1, %g7
	.word 0xa3800007  ! 136: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_8_79:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa30, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe31fc011  ! 137: LDDF_R	ldd	[%r31, %r17], %f17
	.word 0xc19fc2c0  ! 138: LDDFA_R	ldda	[%r31, %r0], %f0
mondo_8_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d94c012  ! 139: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	.word 0x8d802000  ! 140: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_8_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d948003  ! 141: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
pmu_8_82:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffdd9fffffbd0, %g1, %g7
	.word 0xa3800007  ! 142: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x95b4c492  ! 143: FCMPLE32	fcmple32	%d50, %d18, %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_83)+40, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_83)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_83:
	.word 0xa984e504  ! 144: WR_SET_SOFTINT_I	wr	%r19, 0x0504, %set_softint
cwp_8_84:
    set user_data_start, %o7
	.word 0x93902007  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
intveclr_8_85:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7c26fc616b8113b3, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 146: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_86:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 147: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0x9ba00168  ! 148: FABSq	dis not found

	.word 0x93a049d2  ! 149: FDIVd	fdivd	%f32, %f18, %f40
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
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
	.word 0xdbe7e011  ! 150: CASA_R	casa	[%r31] %asi, %r17, %r13
	.word 0x91950001  ! 151: WRPR_PIL_R	wrpr	%r20, %r1, %pil
	.word 0xe19fdc00  ! 152: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x3c700001  ! 153: BPPOS	<illegal instruction>
	.word 0xda27e03a  ! 154: STW_I	stw	%r13, [%r31 + 0x003a]
pmu_8_89:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff515fffff0cd, %g1, %g7
	.word 0xa3800007  ! 155: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_90:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 156: CASA_R	casa	[%r31] %asi, %r19, %r13
	setx 0xee019f091f62e44a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_91:
	.word 0x39400001  ! 157: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2e700001  ! 158: BPVS	<illegal instruction>
	.word 0xda47c000  ! 159: LDSW_R	ldsw	[%r31 + %r0], %r13
splash_lsu_8_92:
	nop
	ta T_CHANGE_HPRIV
	set 0xafa7aa02, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 160: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_93)+32, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_93)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_93:
	.word 0xa9806754  ! 161: WR_SET_SOFTINT_I	wr	%r1, 0x0754, %set_softint
	.word 0xc1bfdf20  ! 162: STDFA_R	stda	%f0, [%r0, %r31]
pmu_8_94:
	nop
	setx 0xfffff06afffff478, %g1, %g7
	.word 0xa3800007  ! 163: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3a800001  ! 164: BCC	bcc,a	<label_0x1>
	.word 0x93464000  ! 165: RD_STICK_CMPR_REG	rd	%-, %r9
pmu_8_95:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff42cfffff7f1, %g1, %g7
	.word 0xa3800007  ! 166: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xb1800011  ! 167: WR_STICK_REG_R	wr	%r0, %r17, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_96
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_96:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 168: CASA_R	casa	[%r31] %asi, %r19, %r13
pmu_8_97:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffa0afffffad8, %g1, %g7
	.word 0xa3800007  ! 169: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_8_98:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffe84fffff032, %g1, %g7
	.word 0xa3800007  ! 170: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d020b5  ! 171: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xa9844010  ! 172: WR_SET_SOFTINT_R	wr	%r17, %r16, %set_softint
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 173: Tcc_R	ta	icc_or_xcc, %r0 + %r30
brcommon_8_99:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xdabfc023  ! 174: STDA_R	stda	%r13, [%r31 + %r3] 0x01
br_badelay3_8_100:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xfd6a1578	! Random illegal ?
	.word 0xe314800a  ! 1: LDQF_R	-	[%r18, %r10], %f17
	.word 0x9ba4882b  ! 175: FADDs	fadds	%f18, %f11, %f13
	.word 0xa3a049d3  ! 176: FDIVd	fdivd	%f32, %f50, %f48
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_101:
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 178: LDX_R	ldx	[%r31 + %r0], %r16
memptr_8_102:
	set user_data_start, %r31
	.word 0x858422a3  ! 179: WRCCR_I	wr	%r16, 0x02a3, %ccr
	setx 0x346c3fce7e327d32, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_103:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe020  ! 181: STDFA_I	stda	%f0, [0x0020, %r31]
    set 0x4bd, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b2c7ca  ! 182: PDIST	pdistn	%d42, %d10, %d12
mondo_8_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d920011  ! 183: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
	.word 0x9f8020b6  ! 184: SIR	sir	0x00b6
	.word 0x99a509d0  ! 185: FDIVd	fdivd	%f20, %f16, %f12
	.word 0xa7b48487  ! 186: FCMPLE32	fcmple32	%d18, %d38, %r19
dvapa_8_105:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe25, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd13fc013  ! 187: STDF_R	std	%f8, [%r19, %r31]
mondo_8_106:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d910013  ! 188: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
	.word 0x39400001  ! 189: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
vahole_8_107:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe33fc001  ! 190: STDF_R	std	%f17, [%r1, %r31]
	.word 0xe237e0fa  ! 191: STH_I	sth	%r17, [%r31 + 0x00fa]
	.word 0x97480000  ! 192: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_108)+24, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_108)&0xffffffff) +24, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_108:
	.word 0xa9826400  ! 193: WR_SET_SOFTINT_I	wr	%r9, 0x0400, %set_softint
	.word 0x9f803edc  ! 194: SIR	sir	0x1edc
dvapa_8_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa79, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe73fc001  ! 195: STDF_R	std	%f19, [%r1, %r31]
intveclr_8_110:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9879253d97869981, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 196: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    set 0x2944, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b4c7c2  ! 197: PDIST	pdistn	%d50, %d2, %d12
	.word 0xd3e7e012  ! 198: CASA_R	casa	[%r31] %asi, %r18, %r9
mondo_8_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d950011  ! 199: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_113
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_113:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 200: RDPC	rd	%pc, %r13
mondo_8_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d94800d  ! 201: WRPR_WSTATE_R	wrpr	%r18, %r13, %wstate
	.word 0xc19fd920  ! 202: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x91d02032  ! 203: Tcc_I	ta	icc_or_xcc, %r0 + 50
memptr_8_115:
	set 0x60340000, %r31
	.word 0x8580af87  ! 204: WRCCR_I	wr	%r2, 0x0f87, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 205: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x83d02033  ! 206: Tcc_I	te	icc_or_xcc, %r0 + 51
pmu_8_116:
	nop
	setx 0xfffff10bfffffdb8, %g1, %g7
	.word 0xa3800007  ! 207: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903116  ! 208: WRPR_PSTATE_I	wrpr	%r0, 0x1116, %pstate
splash_tba_8_118:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 209: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x97b30491  ! 210: FCMPLE32	fcmple32	%d12, %d48, %r11
	.word 0xe1bfe060  ! 211: STDFA_I	stda	%f16, [0x0060, %r31]
	.word 0x38800001  ! 212: BGU	bgu,a	<label_0x1>
	.word 0xe1bfd960  ! 213: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa1454000  ! 214: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
	.word 0x9f8023c4  ! 215: SIR	sir	0x03c4
mondo_8_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d91800d  ! 216: WRPR_WSTATE_R	wrpr	%r6, %r13, %wstate
splash_lsu_8_120:
	nop
	ta T_CHANGE_HPRIV
	set 0x8c723708, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x24800001  ! 218: BLE	ble,a	<label_0x1>
	.word 0xe1bfdc00  ! 219: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd797e008  ! 220: LDQFA_I	-	[%r31, 0x0008], %f11
	.word 0xd73fc000  ! 221: STDF_R	std	%f11, [%r0, %r31]
donret_8_121:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_121-donret_8_121-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fab73e | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x49e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_121:
	.word 0xd6ffe040  ! 222: SWAPA_I	swapa	%r11, [%r31 + 0x0040] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_122)+48, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_122)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_122:
	.word 0xa984f936  ! 223: WR_SET_SOFTINT_I	wr	%r19, 0x1936, %set_softint
	.word 0x99b20494  ! 224: FCMPLE32	fcmple32	%d8, %d20, %r12
ibp_8_123:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe9e7e00b  ! 225: CASA_R	casa	[%r31] %asi, %r11, %r20
    set 0x2114, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b247d1  ! 226: PDIST	pdistn	%d40, %d48, %d40
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 227: Tcc_R	te	icc_or_xcc, %r0 + %r30
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_124
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_124:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 228: RDPC	rd	%pc, %r18
	.word 0x91944010  ! 229: WRPR_PIL_R	wrpr	%r17, %r16, %pil
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0x8d903127  ! 230: WRPR_PSTATE_I	wrpr	%r0, 0x1127, %pstate
	.word 0xd23fe05a  ! 231: STD_I	std	%r9, [%r31 + 0x005a]
mondo_8_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d91c011  ! 232: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 233: LDX_R	ldx	[%r31 + %r0], %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_128)+0, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_128)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_128:
	.word 0xa985216d  ! 234: WR_SET_SOFTINT_I	wr	%r20, 0x016d, %set_softint
	.word 0xc19fde00  ! 235: LDDFA_R	ldda	[%r31, %r0], %f0
invtsb_8_129:
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
	.word 0x29800001  ! 236: FBL	fbl,a	<label_0x1>
splash_htba_8_130:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 237: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
ibp_8_131:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd2bfc033  ! 238: STDA_R	stda	%r9, [%r31 + %r19] 0x01
	.word 0xc3ec8022  ! 239: PREFETCHA_R	prefetcha	[%r18, %r2] 0x01, #one_read
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_132)+56, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_132)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_132:
	.word 0xa980fb6a  ! 240: WR_SET_SOFTINT_I	wr	%r3, 0x1b6a, %set_softint
	.word 0x91910011  ! 241: WRPR_PIL_R	wrpr	%r4, %r17, %pil
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_134
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_134:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 242: CASA_R	casa	[%r31] %asi, %r13, %r18
mondo_8_135:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d944011  ! 243: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
ibp_8_136:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe4dfc033  ! 244: LDXA_R	ldxa	[%r31, %r19] 0x01, %r18
splash_tba_8_137:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 245: WRPR_TBA_R	wrpr	%r0, %r12, %tba
br_badelay3_8_138:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe351dd6f	! Random illegal ?
	.word 0xe7124012  ! 1: LDQF_R	-	[%r9, %r18], %f19
	.word 0xa5a2c821  ! 246: FADDs	fadds	%f11, %f1, %f18
	.word 0x87a84a41  ! 247: FCMPd	fcmpd	%fcc<n>, %f32, %f32
	.word 0xc19fd960  ! 248: LDDFA_R	ldda	[%r31, %r0], %f0
brcommon_8_139:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xd5e7e010  ! 249: CASA_R	casa	[%r31] %asi, %r16, %r10
pmu_8_140:
	nop
	setx 0xfffffe63fffff911, %g1, %g7
	.word 0xa3800007  ! 250: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd43fc000  ! 251: STD_R	std	%r10, [%r31 + %r0]
dvapa_8_141:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8b1, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd4bfc030  ! 252: STDA_R	stda	%r10, [%r31 + %r16] 0x01
br_badelay3_8_142:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe347a71b	! Random illegal ?
	.word 0xd9148012  ! 1: LDQF_R	-	[%r18, %r18], %f12
	.word 0x91a28833  ! 253: FADDs	fadds	%f10, %f19, %f8
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 254: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x6ebe8b0eba831e9b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_143:
	.word 0x39400001  ! 255: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
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
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_144:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 256: RDPC	rd	%pc, %r8
	.word 0x93b28491  ! 257: FCMPLE32	fcmple32	%d10, %d48, %r9
dvapa_8_145:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd6e, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe4bfc032  ! 258: STDA_R	stda	%r18, [%r31 + %r18] 0x01
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 259: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe457c000  ! 260: LDSH_R	ldsh	[%r31 + %r0], %r18
splash_lsu_8_146:
	nop
	ta T_CHANGE_HPRIV
	set 0x47bec33e, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 262: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91950003  ! 263: WRPR_PIL_R	wrpr	%r20, %r3, %pil
	.word 0xc19fdc00  ! 264: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe19fe0a0  ! 265: LDDFA_I	ldda	[%r31, 0x00a0], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_148:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 266: CASA_R	casa	[%r31] %asi, %r20, %r18
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0016a  ! 268: FABSq	dis not found

    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_149
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_149:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 269: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0xe63fe019  ! 270: STD_I	std	%r19, [%r31 + 0x0019]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_150) + 32, 16, 16)) -> intp(4,0,5)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_150)&0xffffffff)  + 32, 16, 16)) -> intp(4,0,5)
intvec_8_150:
	.word 0x39400001  ! 271: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_151)+56, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_151)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_151:
	.word 0xa9837ac4  ! 272: WR_SET_SOFTINT_I	wr	%r13, 0x1ac4, %set_softint
	.word 0xe63fe036  ! 273: STD_I	std	%r19, [%r31 + 0x0036]
memptr_8_152:
	set 0x60540000, %r31
	.word 0x8584ecc0  ! 274: WRCCR_I	wr	%r19, 0x0cc0, %ccr
br_badelay1_8_153:
	.word 0xa5a189cd  ! 1: FDIVd	fdivd	%f6, %f44, %f18
	.word 0xd1340009  ! 1: STQF_R	-	%f8, [%r9, %r16]
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	normalw
	.word 0xa5458000  ! 275: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0x9f80284b  ! 276: SIR	sir	0x084b
	.word 0xc1bfe060  ! 277: STDFA_I	stda	%f0, [0x0060, %r31]
	.word 0xe19fe060  ! 278: LDDFA_I	ldda	[%r31, 0x0060], %f16
	.word 0xc19fdf20  ! 279: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x83d02035  ! 280: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x9f803658  ! 281: SIR	sir	0x1658
jmptr_8_154:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 282: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_155:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 283: CASA_R	casa	[%r31] %asi, %r17, %r20
	.word 0x99a0016d  ! 284: FABSq	dis not found

mondo_8_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d94c00d  ! 285: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
	.word 0xc32fc000  ! 286: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xc1bfda00  ! 287: STDFA_R	stda	%f0, [%r0, %r31]
change_to_randtl_8_157:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_157:
	.word 0x8f902002  ! 288: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_decr_8_158:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r18, [%r1] 0x45
	.word 0xa7828001  ! 289: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r1, %-
	.word 0xc1bfe0c0  ! 290: STDFA_I	stda	%f0, [0x00c0, %r31]
	.word 0xd86fe07a  ! 291: LDSTUB_I	ldstub	%r12, [%r31 + 0x007a]
tglhtw_8_159:
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
	.word 0x99b50990  ! 292: BSHUFFLE	fmovc32	%d20, %d16, %d12
memptr_8_160:
	set 0x60540000, %r31
	.word 0x8580a78c  ! 293: WRCCR_I	wr	%r2, 0x078c, %ccr
splash_hpstate_8_161:
	ta T_CHANGE_NONHPRIV
	.word 0x81982096  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0096, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_162) + 24, 16, 16)) -> intp(3,0,0)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_162)&0xffffffff)  + 24, 16, 16)) -> intp(3,0,0)
intvec_8_162:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0bfe0ec  ! 296: STDA_I	stda	%r8, [%r31 + 0x00ec] %asi
	.word 0x99a00174  ! 297: FABSq	dis not found

splash_tba_8_163:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 298: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_8_164:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 299: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d90282c  ! 300: WRPR_PSTATE_I	wrpr	%r0, 0x082c, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_166)+56, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_166)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_166:
	.word 0xa98362bd  ! 301: WR_SET_SOFTINT_I	wr	%r13, 0x02bd, %set_softint
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
splash_cmpr_4_0:
	nop
	setx 0xc2624c9c1324cf66, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 1: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x81510000  ! 2: RDPR_TICK	rdpr	%tick, %r0
	.word 0xc19fd920  ! 3: LDDFA_R	ldda	[%r31, %r0], %f0
	setx 0x78aead13f9cfe799, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_1:
	.word 0x39400001  ! 4: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 5: Tcc_R	te	icc_or_xcc, %r0 + %r30
mondo_4_2:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d924014  ! 6: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe1bfe020  ! 8: STDFA_I	stda	%f16, [0x0020, %r31]
br_badelay2_4_3:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0xa3b44308  ! 9: ALIGNADDRESS	alignaddr	%r17, %r8, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_4) + 56, 16, 16)) -> intp(4,0,5)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_4)&0xffffffff)  + 56, 16, 16)) -> intp(4,0,5)
intvec_4_4:
	.word 0x39400001  ! 10: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe477e0e8  ! 11: STX_I	stx	%r18, [%r31 + 0x00e8]
donret_4_5:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_5-donret_4_5-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0071b598 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x956, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_5:
	.word 0xe4ffe0a0  ! 12: SWAPA_I	swapa	%r18, [%r31 + 0x00a0] %asi
splash_cmpr_4_6:
	nop
	setx 0xd4b3393b14f4c571, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 13: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0xc3e9002b  ! 14: PREFETCHA_R	prefetcha	[%r4, %r11] 0x01, #one_read
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 15: Tcc_R	te	icc_or_xcc, %r0 + %r30
vahole_4_7:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe63ff180  ! 16: STD_I	std	%r19, [%r31 + 0xfffff180]
br_badelay2_4_8:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f28, %f2, %f28
	.word 0x93b04307  ! 17: ALIGNADDRESS	alignaddr	%r1, %r7, %r9
	.word 0xa5a00172  ! 18: FABSq	dis not found

	.word 0xb1800011  ! 19: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xad836c92  ! 20: WR_SOFTINT_REG_I	wr	%r13, 0x0c92, %softint
	.word 0xd877c000  ! 21: STX_R	stx	%r12, [%r31 + %r0]
splash_tba_4_9:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 22: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd89fe020  ! 23: LDDA_I	ldda	[%r31, + 0x0020] %asi, %r12
jmptr_4_10:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 24: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_4_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d928010  ! 25: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
	.word 0x91a489d1  ! 26: FDIVd	fdivd	%f18, %f48, %f8
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_12)+32, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_12)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_12:
	.word 0xa982e2ce  ! 27: WR_SET_SOFTINT_I	wr	%r11, 0x02ce, %set_softint
	.word 0x9f803f7e  ! 28: SIR	sir	0x1f7e
intveclr_4_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb8e1ad21dd5f47a8, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 29: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon_4_14:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xe83feaa5  ! 30: STD_I	std	%r20, [%r31 + 0x0aa5]
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_15
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_15:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 31: RDPC	rd	%pc, %r9
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_16
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_16:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 32: CASA_R	casa	[%r31] %asi, %r17, %r9
splash_cmpr_4_17:
	nop
	setx 0x4a846d02ae43bbca, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 33: WRPR_TICK_R	wrpr	%r0, %r17, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_18) + 0, 16, 16)) -> intp(3,0,14)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_18)&0xffffffff)  + 0, 16, 16)) -> intp(3,0,14)
intvec_4_18:
	.word 0x39400001  ! 34: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd26fe05d  ! 35: LDSTUB_I	ldstub	%r9, [%r31 + 0x005d]
splash_hpstate_4_19:
	.word 0x81982cdc  ! 36: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdc, %hpstate
br_longdelay1_4_20:
	.word 0x26cac001  ! 1: BRLZ	brlz,a,pt	%r11,<label_0xac001>
	.word 0xbfe7c000  ! 37: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 38: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd23fc000  ! 39: STD_R	std	%r9, [%r31 + %r0]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_21)+32, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_21)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_21:
	.word 0xa982389f  ! 40: WR_SET_SOFTINT_I	wr	%r8, 0x189f, %set_softint
splash_hpstate_4_22:
	ta T_CHANGE_NONHPRIV
	.word 0x81982c14  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c14, %hpstate
	.word 0x87a94a46  ! 42: FCMPd	fcmpd	%fcc<n>, %f36, %f6
splash_tba_4_23:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 43: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_4_24:
	nop
	setx 0x7f380b67ba35ba19, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 44: WRPR_TICK_R	wrpr	%r0, %r17, %tick
br_longdelay1_4_25:
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0xbfefc000  ! 45: RESTORE_R	restore	%r31, %r0, %r31
mondo_4_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d940007  ! 46: WRPR_WSTATE_R	wrpr	%r16, %r7, %wstate
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 47: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa980400d  ! 48: WR_SET_SOFTINT_R	wr	%r1, %r13, %set_softint
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_27:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 49: CASA_R	casa	[%r31] %asi, %r19, %r20
	.word 0xe86fe0ac  ! 50: LDSTUB_I	ldstub	%r20, [%r31 + 0x00ac]
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 51: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_4_28:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffeeefffff5a8, %g1, %g7
	.word 0xa3800007  ! 52: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_4_29:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa11, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe91fc013  ! 53: LDDF_R	ldd	[%r31, %r19], %f20
	.word 0xc19fc2c0  ! 54: LDDFA_R	ldda	[%r31, %r0], %f0
fpinit_4_30:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 55: FDIVs	fdivs	%f0, %f4, %f4
	setx 0x75f8f8189639d0f4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_31:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 57: Tcc_R	ta	icc_or_xcc, %r0 + %r30
br_longdelay4_4_32:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 58: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x95a289d3  ! 59: FDIVd	fdivd	%f10, %f50, %f10
	setx 0x2a2e86b45950a808, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_33:
	.word 0x39400001  ! 60: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d910010  ! 61: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_35:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 62: CASA_R	casa	[%r31] %asi, %r10, %r8
splash_decr_4_36:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa784c00b  ! 63: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r11, %-
	.word 0x9f802b5e  ! 64: SIR	sir	0x0b5e
	.word 0xd08fe000  ! 65: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r8
	.word 0xd03fc000  ! 66: STD_R	std	%r8, [%r31 + %r0]
	.word 0xc32fc000  ! 67: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xd0800c20  ! 68: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r8
change_to_randtl_4_37:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_37:
	.word 0x8f902000  ! 69: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
dvapa_4_38:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd08, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd03ff6c3  ! 70: STD_I	std	%r8, [%r31 + 0xfffff6c3]
intveclr_4_39:
	nop
	ta T_CHANGE_HPRIV
	setx 0x85bf45ba5260d4f8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 71: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d924001  ! 72: WRPR_WSTATE_R	wrpr	%r9, %r1, %wstate
	.word 0x91908014  ! 73: WRPR_PIL_R	wrpr	%r2, %r20, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_42) + 40, 16, 16)) -> intp(3,0,0)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_42)&0xffffffff)  + 40, 16, 16)) -> intp(3,0,0)
intvec_4_42:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa970307f  ! 75: POPC_I	popc	0x107f, %r20
br_longdelay2_4_43:
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc369b8eb  ! 76: PREFETCH_I	prefetch	[%r6 + 0xfffff8eb], #one_read
splash_cmpr_4_44:
	nop
	setx 0x5acd416f11b52819, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 77: WRPR_TICK_R	wrpr	%r0, %r17, %tick
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_45
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_45:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 78: CASA_R	casa	[%r31] %asi, %r5, %r17
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x8d9021f2  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x01f2, %pstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_47
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_47
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_47:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 80: RDPC	rd	%pc, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_48)+48, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_48)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_48:
	.word 0xa9847791  ! 81: WR_SET_SOFTINT_I	wr	%r17, 0x1791, %set_softint
	.word 0x91940012  ! 82: WRPR_PIL_R	wrpr	%r16, %r18, %pil
intveclr_4_50:
	nop
	ta T_CHANGE_HPRIV
	setx 0x26a467a63819c89d, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 83: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_51:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d94000b  ! 84: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
splash_hpstate_4_52:
	.word 0x81982acd  ! 85: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acd, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_53:
	ta	T_CHANGE_NONHPRIV	! macro
ibp_4_54:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x4, %r16
ibp_startwait4_54:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_54
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_54:
    brnz %r16, ibp_wait4_54
    ld [%r23], %r16
    ba,a ibp_startwait4_54
    mov 0x4, %r16
continue_ibp_4_54:
    ldxa [%g0]0x63, %r14        !Get raw TID
    srlx %r14, 3, %r14          !Get CID
    sllx %r16, %r14, %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_54:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_54
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_54:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_54
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_54:
    best_set_reg(0x000000509cc00480,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xdb3fc008  ! 87: STDF_R	std	%f13, [%r8, %r31]
splash_hpstate_4_55:
	ta T_CHANGE_NONHPRIV
	.word 0x81982717  ! 88: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0717, %hpstate
	.word 0xc3ec0028  ! 89: PREFETCHA_R	prefetcha	[%r16, %r8] 0x01, #one_read
	.word 0xdb27c000  ! 90: STF_R	st	%f13, [%r0, %r31]
splash_tba_4_56:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 91: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_4_57:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 92: FDIVd	fdivd	%f0, %f4, %f8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_58) + 32, 16, 16)) -> intp(2,0,18)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_58)&0xffffffff)  + 32, 16, 16)) -> intp(2,0,18)
intvec_4_58:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_4_59:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf1b12d6e5a559349, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 94: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe020  ! 95: STDFA_I	stda	%f0, [0x0020, %r31]
	.word 0x83d020b5  ! 96: Tcc_I	te	icc_or_xcc, %r0 + 181
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
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
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_60:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 97: RDPC	rd	%pc, %r16
memptr_4_61:
	set 0x60140000, %r31
	.word 0x8584280d  ! 98: WRCCR_I	wr	%r16, 0x080d, %ccr
mondo_4_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d94400a  ! 99: WRPR_WSTATE_R	wrpr	%r17, %r10, %wstate
	.word 0x91d02032  ! 100: Tcc_I	ta	icc_or_xcc, %r0 + 50
ibp_4_63:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x4, %r16
ibp_startwait4_63:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_63
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_63:
    brnz %r16, ibp_wait4_63
    ld [%r23], %r16
    ba,a ibp_startwait4_63
    mov 0x4, %r16
continue_ibp_4_63:
    ldxa [%g0]0x63, %r14        !Get raw TID
    srlx %r14, 3, %r14          !Get CID
    sllx %r16, %r14, %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_63:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_63
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_63:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_63
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_63:
    best_set_reg(0x00000050dac48023,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe09fc031  ! 101: LDDA_R	ldda	[%r31, %r17] 0x01, %r16
	.word 0xe1bfe080  ! 102: STDFA_I	stda	%f16, [0x0080, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_64)+40, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_64)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_64:
	.word 0xa980ed51  ! 103: WR_SET_SOFTINT_I	wr	%r3, 0x0d51, %set_softint
	.word 0xe1bfe040  ! 104: STDFA_I	stda	%f16, [0x0040, %r31]
	.word 0xc19fc3e0  ! 105: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x20700001  ! 106: BPN	<illegal instruction>
jmptr_4_65:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 107: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe06fe002  ! 108: LDSTUB_I	ldstub	%r16, [%r31 + 0x0002]
	.word 0xb1800011  ! 109: WR_STICK_REG_R	wr	%r0, %r17, %-
fpinit_4_66:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 110: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0xe1bfe040  ! 111: STDFA_I	stda	%f16, [0x0040, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_67
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_67:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 112: RDPC	rd	%pc, %r20
	.word 0x9ba00168  ! 113: FABSq	dis not found

	.word 0xa7450000  ! 114: RD_SET_SOFTINT	rd	%set_softint, %r19
	.word 0xc19fd960  ! 115: LDDFA_R	ldda	[%r31, %r0], %f0
pmu_4_68:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff07dfffff831, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_69
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_69
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_69:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 117: RDPC	rd	%pc, %r18
splash_hpstate_4_70:
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x8198255c  ! 118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055c, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_71:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00d  ! 119: CASA_R	casa	[%r31] %asi, %r13, %r17
	.word 0xe2d7e038  ! 120: LDSHA_I	ldsha	[%r31, + 0x0038] %asi, %r17
	.word 0x9f803217  ! 121: SIR	sir	0x1217
	.word 0x9f8035f0  ! 122: SIR	sir	0x15f0
tagged_4_72:
	tsubcctv %r12, 0x1e6b, %r18
	.word 0xe207e010  ! 123: LDUW_I	lduw	[%r31 + 0x0010], %r17
pmu_4_73:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff8eafffff64c, %g1, %g7
	.word 0xa3800007  ! 124: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_4_74:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d944010  ! 125: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0xe26fe088  ! 126: LDSTUB_I	ldstub	%r17, [%r31 + 0x0088]
	.word 0xe31fc000  ! 127: LDDF_R	ldd	[%r31, %r0], %f17
	.word 0xe227e0e0  ! 128: STW_I	stw	%r17, [%r31 + 0x00e0]
intveclr_4_75:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4fec7b1e24b13102, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe22fe013  ! 130: STB_I	stb	%r17, [%r31 + 0x0013]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_76)+56, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_76)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_76:
	.word 0xa9847a76  ! 131: WR_SET_SOFTINT_I	wr	%r17, 0x1a76, %set_softint
	.word 0xe337e02a  ! 132: STQF_I	-	%f17, [0x002a, %r31]
	.word 0xe337c000  ! 133: STQF_R	-	%f17, [%r0, %r31]
	.word 0xe327e018  ! 134: STF_I	st	%f17, [0x0018, %r31]
jmptr_4_77:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 135: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_4_78:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff792fffffa68, %g1, %g7
	.word 0xa3800007  ! 136: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_4_79:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf75, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe33fc011  ! 137: STDF_R	std	%f17, [%r17, %r31]
	.word 0xc1bfdc00  ! 138: STDFA_R	stda	%f0, [%r0, %r31]
mondo_4_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d91000b  ! 139: WRPR_WSTATE_R	wrpr	%r4, %r11, %wstate
	.word 0x8d802004  ! 140: WRFPRS_I	wr	%r0, 0x0004, %fprs
mondo_4_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d948002  ! 141: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
pmu_4_82:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff198fffffbec, %g1, %g7
	.word 0xa3800007  ! 142: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc3ec4034  ! 143: PREFETCHA_R	prefetcha	[%r17, %r20] 0x01, #one_read
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_83)+56, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_83)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_83:
	.word 0xa984ffc3  ! 144: WR_SET_SOFTINT_I	wr	%r19, 0x1fc3, %set_softint
cwp_4_84:
    set user_data_start, %o7
	.word 0x93902001  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
intveclr_4_85:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd6009c6d842f827d, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 146: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_86:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 147: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xa9a00174  ! 148: FABSq	dis not found

	.word 0x87acca46  ! 149: FCMPd	fcmpd	%fcc<n>, %f50, %f6
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_87:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 150: CASA_R	casa	[%r31] %asi, %r17, %r13
	.word 0x9194c001  ! 151: WRPR_PIL_R	wrpr	%r19, %r1, %pil
	.word 0xe19fde00  ! 152: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x3c700001  ! 153: BPPOS	<illegal instruction>
	.word 0xda27e09d  ! 154: STW_I	stw	%r13, [%r31 + 0x009d]
pmu_4_89:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff473fffff405, %g1, %g7
	.word 0xa3800007  ! 155: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_90:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 156: CASA_R	casa	[%r31] %asi, %r19, %r13
	setx 0xc4bec171907b7a28, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_91:
	.word 0x39400001  ! 157: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2e700001  ! 158: BPVS	<illegal instruction>
	.word 0xda47c000  ! 159: LDSW_R	ldsw	[%r31 + %r0], %r13
splash_lsu_4_92:
	nop
	ta T_CHANGE_HPRIV
	set 0x522d58f0, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 160: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_93)+16, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_93)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_93:
	.word 0xa980b904  ! 161: WR_SET_SOFTINT_I	wr	%r2, 0x1904, %set_softint
	.word 0xc1bfe060  ! 162: STDFA_I	stda	%f0, [0x0060, %r31]
pmu_4_94:
	nop
	setx 0xfffffdc3fffff734, %g1, %g7
	.word 0xa3800007  ! 163: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3a800001  ! 164: BCC	bcc,a	<label_0x1>
	.word 0xa7464000  ! 165: RD_STICK_CMPR_REG	rd	%-, %r19
pmu_4_95:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffa43ffffffbf, %g1, %g7
	.word 0xa3800007  ! 166: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xb1800011  ! 167: WR_STICK_REG_R	wr	%r0, %r17, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_96
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_96:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 168: CASA_R	casa	[%r31] %asi, %r19, %r13
pmu_4_97:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff67dfffff0dd, %g1, %g7
	.word 0xa3800007  ! 169: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_4_98:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff352ffffffba, %g1, %g7
	.word 0xa3800007  ! 170: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d020b2  ! 171: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0xa9840011  ! 172: WR_SET_SOFTINT_R	wr	%r16, %r17, %set_softint
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 173: Tcc_R	te	icc_or_xcc, %r0 + %r30
brcommon_4_99:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xdb3fc003  ! 174: STDF_R	std	%f13, [%r3, %r31]
br_badelay3_4_100:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd74131e6	! Random illegal ?
	.word 0xe9144013  ! 1: LDQF_R	-	[%r17, %r19], %f20
	.word 0xa7a28831  ! 175: FADDs	fadds	%f10, %f17, %f19
	.word 0xa7a309d2  ! 176: FDIVd	fdivd	%f12, %f18, %f50
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_101:
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 178: LDX_R	ldx	[%r31 + %r0], %r16
memptr_4_102:
	set user_data_start, %r31
	.word 0x858435e4  ! 179: WRCCR_I	wr	%r16, 0x15e4, %ccr
	setx 0xbf7b2b886583b73c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_103:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe0a0  ! 181: STDFA_I	stda	%f0, [0x00a0, %r31]
    set 0x2540, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b407cc  ! 182: PDIST	pdistn	%d16, %d12, %d12
mondo_4_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d92c012  ! 183: WRPR_WSTATE_R	wrpr	%r11, %r18, %wstate
	.word 0x9f802424  ! 184: SIR	sir	0x0424
	.word 0x95a4c9c6  ! 185: FDIVd	fdivd	%f50, %f6, %f10
	.word 0x99b20491  ! 186: FCMPLE32	fcmple32	%d8, %d48, %r12
dvapa_4_105:
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
	.word 0xd0bfc033  ! 187: STDA_R	stda	%r8, [%r31 + %r19] 0x01
mondo_4_106:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d94c00d  ! 188: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
	.word 0x87ac4a42  ! 189: FCMPd	fcmpd	%fcc<n>, %f48, %f2
vahole_4_107:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc32fc001  ! 190: STXFSR_R	st-sfr	%f1, [%r1, %r31]
	.word 0xe237e0c2  ! 191: STH_I	sth	%r17, [%r31 + 0x00c2]
	.word 0x9b480000  ! 192: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_108)+0, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_108)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_108:
	.word 0xa98533e0  ! 193: WR_SET_SOFTINT_I	wr	%r20, 0x13e0, %set_softint
	.word 0x9f802025  ! 194: SIR	sir	0x0025
dvapa_4_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd9e, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc001  ! 195: STXFSR_R	st-sfr	%f1, [%r1, %r31]
intveclr_4_110:
	nop
	ta T_CHANGE_HPRIV
	setx 0x571f0786a152451f, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 196: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    set 0x696, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b107c8  ! 197: PDIST	pdistn	%d4, %d8, %d10
	.word 0xd23ff6e5  ! 198: STD_I	std	%r9, [%r31 + 0xfffff6e5]
mondo_4_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d94c008  ! 199: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_113
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_113:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 200: RDPC	rd	%pc, %r17
mondo_4_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d91400d  ! 201: WRPR_WSTATE_R	wrpr	%r5, %r13, %wstate
	.word 0xe1bfda00  ! 202: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x83d02035  ! 203: Tcc_I	te	icc_or_xcc, %r0 + 53
memptr_4_115:
	set 0x60740000, %r31
	.word 0x8584fd72  ! 204: WRCCR_I	wr	%r19, 0x1d72, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 205: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x93d020b2  ! 206: Tcc_I	tne	icc_or_xcc, %r0 + 178
pmu_4_116:
	nop
	setx 0xfffffe03ffffff13, %g1, %g7
	.word 0xa3800007  ! 207: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x24cc8001  ! 1: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	.word 0x8d902c5d  ! 208: WRPR_PSTATE_I	wrpr	%r0, 0x0c5d, %pstate
splash_tba_4_118:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 209: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa3a149b4  ! 210: FDIVs	fdivs	%f5, %f20, %f17
	.word 0xc1bfe0a0  ! 211: STDFA_I	stda	%f0, [0x00a0, %r31]
	.word 0x38800001  ! 212: BGU	bgu,a	<label_0x1>
	.word 0xe19fdb60  ! 213: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa5454000  ! 214: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0xa3b407d1  ! 215: PDIST	pdistn	%d16, %d48, %d48
mondo_4_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d944014  ! 216: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
splash_lsu_4_120:
	nop
	ta T_CHANGE_HPRIV
	set 0x5d1f3d5f, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x24800001  ! 218: BLE	ble,a	<label_0x1>
	.word 0xc19fc2c0  ! 219: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd797e030  ! 220: LDQFA_I	-	[%r31, 0x0030], %f11
	.word 0xd73fc000  ! 221: STDF_R	std	%f11, [%r0, %r31]
donret_4_121:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_121-donret_4_121-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0050ac02 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xbdd, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_121:
	.word 0xd6ffe040  ! 222: SWAPA_I	swapa	%r11, [%r31 + 0x0040] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_122)+8, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_122)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_122:
	.word 0xa9806224  ! 223: WR_SET_SOFTINT_I	wr	%r1, 0x0224, %set_softint
	.word 0xa1a489b0  ! 224: FDIVs	fdivs	%f18, %f16, %f16
ibp_4_123:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x4, %r16
ibp_startwait4_123:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_123
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_123:
    brnz %r16, ibp_wait4_123
    ld [%r23], %r16
    ba,a ibp_startwait4_123
    mov 0x4, %r16
continue_ibp_4_123:
    ldxa [%g0]0x63, %r14        !Get raw TID
    srlx %r14, 3, %r14          !Get CID
    sllx %r16, %r14, %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_123:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_123
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_123:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_123
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_123:
    best_set_reg(0x0000005085c023e3,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0x9f803577  ! 225: SIR	sir	0x1577
    set 0x3fc9, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b107cb  ! 226: PDIST	pdistn	%d4, %d42, %d40
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 227: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_124
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_124:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 228: RDPC	rd	%pc, %r12
	.word 0x91918005  ! 229: WRPR_PIL_R	wrpr	%r6, %r5, %pil
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x8d903d09  ! 230: WRPR_PSTATE_I	wrpr	%r0, 0x1d09, %pstate
	.word 0xd23fe099  ! 231: STD_I	std	%r9, [%r31 + 0x0099]
mondo_4_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d924009  ! 232: WRPR_WSTATE_R	wrpr	%r9, %r9, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 233: LDX_R	ldx	[%r31 + %r0], %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_128)+32, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_128)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_128:
	.word 0xa984acb1  ! 234: WR_SET_SOFTINT_I	wr	%r18, 0x0cb1, %set_softint
	.word 0xc1bfe000  ! 235: STDFA_I	stda	%f0, [0x0000, %r31]
invtsb_4_129:
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
	.word 0x29800001  ! 236: FBL	fbl,a	<label_0x1>
splash_htba_4_130:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 237: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
ibp_4_131:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x4, %r16
ibp_startwait4_131:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_131
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_131:
    brnz %r16, ibp_wait4_131
    ld [%r23], %r16
    ba,a ibp_startwait4_131
    mov 0x4, %r16
continue_ibp_4_131:
    ldxa [%g0]0x63, %r14        !Get raw TID
    srlx %r14, 3, %r14          !Get CID
    sllx %r16, %r14, %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_131:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_131
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_131:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_131
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_131:
    best_set_reg(0x00000050cfe3e37b,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd33fc013  ! 238: STDF_R	std	%f9, [%r19, %r31]
	.word 0xa9b48482  ! 239: FCMPLE32	fcmple32	%d18, %d2, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_132)+32, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_132)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_132:
	.word 0xa98373a9  ! 240: WR_SET_SOFTINT_I	wr	%r13, 0x13a9, %set_softint
	.word 0x91948011  ! 241: WRPR_PIL_R	wrpr	%r18, %r17, %pil
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_134
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_134:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 242: CASA_R	casa	[%r31] %asi, %r13, %r18
mondo_4_135:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d92c012  ! 243: WRPR_WSTATE_R	wrpr	%r11, %r18, %wstate
ibp_4_136:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x4, %r16
ibp_startwait4_136:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_136
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_136:
    brnz %r16, ibp_wait4_136
    ld [%r23], %r16
    ba,a ibp_startwait4_136
    mov 0x4, %r16
continue_ibp_4_136:
    ldxa [%g0]0x63, %r14        !Get raw TID
    srlx %r14, 3, %r14          !Get CID
    sllx %r16, %r14, %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_136:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_136
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_136:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_136
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_136:
    best_set_reg(0x0000005014e37bfd,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4bfc033  ! 244: STDA_R	stda	%r18, [%r31 + %r19] 0x01
splash_tba_4_137:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 245: WRPR_TBA_R	wrpr	%r0, %r12, %tba
br_badelay3_4_138:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xef6bb9eb	! Random illegal ?
	.word 0xe1108007  ! 1: LDQF_R	-	[%r2, %r7], %f16
	.word 0xa1a0c834  ! 246: FADDs	fadds	%f3, %f20, %f16
	.word 0x87ac4a42  ! 247: FCMPd	fcmpd	%fcc<n>, %f48, %f2
	.word 0xc1bfc3e0  ! 248: STDFA_R	stda	%f0, [%r0, %r31]
brcommon_4_139:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xd4dfc030  ! 249: LDXA_R	ldxa	[%r31, %r16] 0x01, %r10
pmu_4_140:
	nop
	setx 0xffffffbdfffffffe, %g1, %g7
	.word 0xa3800007  ! 250: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd43fc000  ! 251: STD_R	std	%r10, [%r31 + %r0]
dvapa_4_141:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc18, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd497c030  ! 252: LDUHA_R	lduha	[%r31, %r16] 0x01, %r10
br_badelay3_4_142:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbb51d3ac	! Random illegal ?
	.word 0xdb144012  ! 1: LDQF_R	-	[%r17, %r18], %f13
	.word 0xa5a1c834  ! 253: FADDs	fadds	%f7, %f20, %f18
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 254: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	setx 0xf9dac68ae74786b2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_143:
	.word 0x39400001  ! 255: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
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
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_144:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 256: RDPC	rd	%pc, %r13
	.word 0x95a089a4  ! 257: FDIVs	fdivs	%f2, %f4, %f10
dvapa_4_145:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd0a, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc012  ! 258: STXFSR_R	st-sfr	%f1, [%r18, %r31]
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 259: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe457c000  ! 260: LDSH_R	ldsh	[%r31 + %r0], %r18
splash_lsu_4_146:
	nop
	ta T_CHANGE_HPRIV
	set 0xd273e0dc, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 262: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91930010  ! 263: WRPR_PIL_R	wrpr	%r12, %r16, %pil
	.word 0xc1bfe000  ! 264: STDFA_I	stda	%f0, [0x0000, %r31]
	.word 0xc19fe0a0  ! 265: LDDFA_I	ldda	[%r31, 0x00a0], %f0
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_148:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 266: CASA_R	casa	[%r31] %asi, %r20, %r18
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0016a  ! 268: FABSq	dis not found

    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_149
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_149:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 269: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0xe63fe0f0  ! 270: STD_I	std	%r19, [%r31 + 0x00f0]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_150) + 8, 16, 16)) -> intp(1,0,4)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_150)&0xffffffff)  + 8, 16, 16)) -> intp(1,0,4)
intvec_4_150:
	.word 0x39400001  ! 271: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_151)+8, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_151)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_151:
	.word 0xa984a04d  ! 272: WR_SET_SOFTINT_I	wr	%r18, 0x004d, %set_softint
	.word 0xe63fe0c9  ! 273: STD_I	std	%r19, [%r31 + 0x00c9]
memptr_4_152:
	set 0x60340000, %r31
	.word 0x8583778c  ! 274: WRCCR_I	wr	%r13, 0x178c, %ccr
br_badelay1_4_153:
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe7340003  ! 1: STQF_R	-	%f19, [%r3, %r16]
	.word 0x2ec84001  ! 1: BRGEZ	brgez,a,pt	%r1,<label_0x84001>
	normalw
	.word 0x93458000  ! 275: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x87a9ca53  ! 276: FCMPd	fcmpd	%fcc<n>, %f38, %f50
	.word 0xe19fc2c0  ! 277: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc19fe000  ! 278: LDDFA_I	ldda	[%r31, 0x0000], %f0
	.word 0xc1bfd920  ! 279: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x91d02034  ! 280: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9f8020d3  ! 281: SIR	sir	0x00d3
jmptr_4_154:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 282: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_155:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 283: CASA_R	casa	[%r31] %asi, %r17, %r20
	.word 0xa3a0016c  ! 284: FABSq	dis not found

mondo_4_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d940005  ! 285: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
	.word 0xc32fc000  ! 286: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xe19fdf20  ! 287: LDDFA_R	ldda	[%r31, %r0], %f16
change_to_randtl_4_157:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_157:
	.word 0x8f902001  ! 288: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_decr_4_158:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa7850011  ! 289: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r17, %-
	.word 0xe1bfe080  ! 290: STDFA_I	stda	%f16, [0x0080, %r31]
	.word 0xd86fe070  ! 291: LDSTUB_I	ldstub	%r12, [%r31 + 0x0070]
	.word 0x93b30991  ! 292: BSHUFFLE	fmovc32	%d12, %d48, %d40
memptr_4_160:
	set 0x60340000, %r31
	.word 0x858133ce  ! 293: WRCCR_I	wr	%r4, 0x13ce, %ccr
splash_hpstate_4_161:
	ta T_CHANGE_NONHPRIV
	.word 0x819827df  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07df, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_162) + 32, 16, 16)) -> intp(1,0,8)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_162)&0xffffffff)  + 32, 16, 16)) -> intp(1,0,8)
intvec_4_162:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0bfe099  ! 296: STDA_I	stda	%r8, [%r31 + 0x0099] %asi
	.word 0xa9a00173  ! 297: FABSq	dis not found

splash_tba_4_163:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 298: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_4_164:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 299: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d903f35  ! 300: WRPR_PSTATE_I	wrpr	%r0, 0x1f35, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_166)+56, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_166)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_166:
	.word 0xa984a043  ! 301: WR_SET_SOFTINT_I	wr	%r18, 0x0043, %set_softint
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
setup_cmp:
    mov mask2tid(0x2), %r10
    set sync_thr_counter, %r23
    st %r10, [%r23]             !lock sync_thr_counter
    add %r23, 8, %r23
    st %r10, [%r23]             !lock sync_thr_counter1
    add %r23, 8, %r23
    st %r10, [%r23]             !lock sync_thr_counter2
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
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
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

    st %r0, [%r23]          !unlock sync_thr_counter2
    sub %r23, 8, %r23
    st %r0, [%r23]          !unlock sync_thr_counter1
    sub %r23, 8, %r23
    st %r0, [%r23]          !unlock sync_thr_counter

    wr %r0, %r12, %asi
    ta T_CHANGE_NONHPRIV 
splash_cmpr_2_0:
	nop
	setx 0x78f91e6deafa4cb3, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 1: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x81510000  ! 2: RDPR_TICK	rdpr	%tick, %r0
	.word 0xc19fc2c0  ! 3: LDDFA_R	ldda	[%r31, %r0], %f0
	setx 0xd4b8449014ccaa96, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_1:
	.word 0x39400001  ! 4: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 5: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_2_2:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d91000c  ! 6: WRPR_WSTATE_R	wrpr	%r4, %r12, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe1bfc2c0  ! 8: STDFA_R	stda	%f16, [%r0, %r31]
br_badelay2_2_3:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x99b08312  ! 9: ALIGNADDRESS	alignaddr	%r2, %r18, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_4) + 0, 16, 16)) -> intp(7,0,27)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_4)&0xffffffff)  + 0, 16, 16)) -> intp(7,0,27)
intvec_2_4:
	.word 0x39400001  ! 10: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe477e009  ! 11: STX_I	stx	%r18, [%r31 + 0x0009]
donret_2_5:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_5-donret_2_5-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00414ad2 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc4f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_5:
	.word 0xe4ffe0d4  ! 12: SWAPA_I	swapa	%r18, [%r31 + 0x00d4] %asi
splash_cmpr_2_6:
	nop
	setx 0x47da11fd5e46e23e, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 13: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0xc3eb4032  ! 14: PREFETCHA_R	prefetcha	[%r13, %r18] 0x01, #one_read
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 15: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe6dfc032  ! 16: LDXA_R	ldxa	[%r31, %r18] 0x01, %r19
br_badelay2_2_8:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f26, %f30, %f0
	.word 0xa9b40313  ! 17: ALIGNADDRESS	alignaddr	%r16, %r19, %r20
	.word 0xa9a00173  ! 18: FABSq	dis not found

	.word 0xb1800011  ! 19: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xad84e6a5  ! 20: WR_SOFTINT_REG_I	wr	%r19, 0x06a5, %softint
	.word 0xd877c000  ! 21: STX_R	stx	%r12, [%r31 + %r0]
splash_tba_2_9:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 22: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd89fe010  ! 23: LDDA_I	ldda	[%r31, + 0x0010] %asi, %r12
jmptr_2_10:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 24: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_2_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d910014  ! 25: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
	.word 0x91a449c7  ! 26: FDIVd	fdivd	%f48, %f38, %f8
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_12)+40, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_12)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_12:
	.word 0xa982b020  ! 27: WR_SET_SOFTINT_I	wr	%r10, 0x1020, %set_softint
	.word 0x9f803f62  ! 28: SIR	sir	0x1f62
intveclr_2_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5c9b313cabd0ed83, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 29: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon_2_14:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xe897c031  ! 30: LDUHA_R	lduha	[%r31, %r17] 0x01, %r20
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_15
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_15:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 31: RDPC	rd	%pc, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_16
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_16:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 32: CASA_R	casa	[%r31] %asi, %r17, %r9
splash_cmpr_2_17:
	nop
	setx 0x7c88062c84d7fb33, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 33: WRPR_TICK_R	wrpr	%r0, %r17, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_18) + 0, 16, 16)) -> intp(5,0,28)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_18)&0xffffffff)  + 0, 16, 16)) -> intp(5,0,28)
intvec_2_18:
	.word 0x39400001  ! 34: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd26fe073  ! 35: LDSTUB_I	ldstub	%r9, [%r31 + 0x0073]
splash_hpstate_2_19:
	.word 0x8198218d  ! 36: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018d, %hpstate
br_longdelay1_2_20:
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xbfe7c000  ! 37: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 38: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd23fc000  ! 39: STD_R	std	%r9, [%r31 + %r0]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_21)+56, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_21)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_21:
	.word 0xa98525f8  ! 40: WR_SET_SOFTINT_I	wr	%r20, 0x05f8, %set_softint
splash_hpstate_2_22:
	ta T_CHANGE_NONHPRIV
	.word 0x81982894  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0894, %hpstate
	.word 0xa7a049a7  ! 42: FDIVs	fdivs	%f1, %f7, %f19
splash_tba_2_23:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 43: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_2_24:
	nop
	setx 0x4591abcb63a1a9d0, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 44: WRPR_TICK_R	wrpr	%r0, %r17, %tick
br_longdelay1_2_25:
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9d97c000  ! 45: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
mondo_2_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d950014  ! 46: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 47: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa9820014  ! 48: WR_SET_SOFTINT_R	wr	%r8, %r20, %set_softint
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_27:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 49: CASA_R	casa	[%r31] %asi, %r19, %r20
	.word 0xe86fe0f4  ! 50: LDSTUB_I	ldstub	%r20, [%r31 + 0x00f4]
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 51: Tcc_R	tne	icc_or_xcc, %r0 + %r30
pmu_2_28:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffe93fffffc66, %g1, %g7
	.word 0xa3800007  ! 52: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_2_29:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb69, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe89fc033  ! 53: LDDA_R	ldda	[%r31, %r19] 0x01, %r20
	.word 0xe19fdb60  ! 54: LDDFA_R	ldda	[%r31, %r0], %f16
fpinit_2_30:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 55: FCMPLE32	fcmple32	%d0, %d4, %r8
	setx 0x8337dd426ddf54bf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_31:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 57: Tcc_R	ta	icc_or_xcc, %r0 + %r30
br_longdelay4_2_32:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 58: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xa7a489d1  ! 59: FDIVd	fdivd	%f18, %f48, %f50
	setx 0x556cec7cba88ae70, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_33:
	.word 0x39400001  ! 60: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d924009  ! 61: WRPR_WSTATE_R	wrpr	%r9, %r9, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_35:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 62: CASA_R	casa	[%r31] %asi, %r10, %r8
splash_decr_2_36:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa7844008  ! 63: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r8, %-
	.word 0x9f8025b8  ! 64: SIR	sir	0x05b8
	.word 0xd08fe038  ! 65: LDUBA_I	lduba	[%r31, + 0x0038] %asi, %r8
	.word 0xd03fc000  ! 66: STD_R	std	%r8, [%r31 + %r0]
	.word 0xc32fc000  ! 67: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xd0800b20  ! 68: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r8
change_to_randtl_2_37:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_37:
	.word 0x8f902000  ! 69: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
dvapa_2_38:
	nop
	ta T_CHANGE_HPRIV
	mov 0xde8, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd097c024  ! 70: LDUHA_R	lduha	[%r31, %r4] 0x01, %r8
intveclr_2_39:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe6af2797101049e9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 71: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d95000a  ! 72: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
cmp_2_41:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x2, %r10
cmp_startwait2_41:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_2_41
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait2_41:
    brnz,a %r10, cmp_wait2_41
    ld [%r23], %r10
    ba,a cmp_startwait2_41
    mov 0x2, %r10
continue_cmp_2_41:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    ldxa [0x10]%asi, %r13       !Get enabled threads
    andn %r13, 0xff, %r16
    brz,a %r16, cmp_multi_core_2_41
    mov 0x59, %r17
    best_set_reg(0xc43e226034b4ed1d, %r16, %r17)
cmp_multi_core_2_41:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r13, %r14        !Apply core-enabled mask 
    andn %r14, 0x2, %r14  !Leave master thread
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91918013  ! 73: WRPR_PIL_R	wrpr	%r6, %r19, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_42) + 8, 16, 16)) -> intp(3,0,21)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_42)&0xffffffff)  + 8, 16, 16)) -> intp(3,0,21)
intvec_2_42:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3a249b3  ! 75: FDIVs	fdivs	%f9, %f19, %f17
br_longdelay2_2_43:
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0xd43c8008  ! 76: STD_R	std	%r10, [%r18 + %r8]
splash_cmpr_2_44:
	nop
	setx 0xbcce51112d97b5f0, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 77: WRPR_TICK_R	wrpr	%r0, %r17, %tick
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_45
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_45:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 78: CASA_R	casa	[%r31] %asi, %r5, %r17
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x8d9031cc  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x11cc, %pstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_47
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_47
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_47:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 80: RDPC	rd	%pc, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_48)+0, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_48)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_48:
	.word 0xa98472a5  ! 81: WR_SET_SOFTINT_I	wr	%r17, 0x12a5, %set_softint
cmp_2_49:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x2, %r10
cmp_startwait2_49:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_2_49
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait2_49:
    brnz,a %r10, cmp_wait2_49
    ld [%r23], %r10
    ba,a cmp_startwait2_49
    mov 0x2, %r10
continue_cmp_2_49:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    ldxa [0x10]%asi, %r13       !Get enabled threads
    andn %r13, 0xff, %r16
    brz,a %r16, cmp_multi_core_2_49
    mov 0x75, %r17
    best_set_reg(0xa3f682a0a548f9aa, %r16, %r17)
cmp_multi_core_2_49:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r13, %r14        !Apply core-enabled mask 
    andn %r14, 0x2, %r14  !Leave master thread
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91940003  ! 82: WRPR_PIL_R	wrpr	%r16, %r3, %pil
intveclr_2_50:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc78ddc90d322253e, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 83: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_51:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d924012  ! 84: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
splash_hpstate_2_52:
	.word 0x81982bc4  ! 85: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc4, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_53:
	ta	T_CHANGE_NONHPRIV	! macro
ibp_2_54:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xdb3fc008  ! 87: STDF_R	std	%f13, [%r8, %r31]
splash_hpstate_2_55:
	ta T_CHANGE_NONHPRIV
	.word 0x81982d1d  ! 88: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1d, %hpstate
	.word 0xa7703dd9  ! 89: POPC_I	popc	0x1dd9, %r19
	.word 0xdb27c000  ! 90: STF_R	st	%f13, [%r0, %r31]
splash_tba_2_56:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 91: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_2_57:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 92: FCMPd	fcmpd	%fcc<n>, %f0, %f4
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_58) + 24, 16, 16)) -> intp(0,0,21)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_58)&0xffffffff)  + 24, 16, 16)) -> intp(0,0,21)
intvec_2_58:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_2_59:
	nop
	ta T_CHANGE_HPRIV
	setx 0x037bb81ca646d521, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 94: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe040  ! 95: STDFA_I	stda	%f16, [0x0040, %r31]
	.word 0x91d02035  ! 96: Tcc_I	ta	icc_or_xcc, %r0 + 53
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
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
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_60:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 97: RDPC	rd	%pc, %r12
memptr_2_61:
	set 0x60340000, %r31
	.word 0x8582baee  ! 98: WRCCR_I	wr	%r10, 0x1aee, %ccr
mondo_2_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d94c013  ! 99: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	.word 0x93d02032  ! 100: Tcc_I	tne	icc_or_xcc, %r0 + 50
ibp_2_63:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe11fc011  ! 101: LDDF_R	ldd	[%r31, %r17], %f16
	.word 0xe19fdc00  ! 102: LDDFA_R	ldda	[%r31, %r0], %f16
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_64)+0, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_64)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_64:
	.word 0xa982230c  ! 103: WR_SET_SOFTINT_I	wr	%r8, 0x030c, %set_softint
	.word 0xc1bfdc00  ! 104: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe1bfdf20  ! 105: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x20700001  ! 106: BPN	<illegal instruction>
jmptr_2_65:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 107: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe06fe09a  ! 108: LDSTUB_I	ldstub	%r16, [%r31 + 0x009a]
	.word 0xb1800011  ! 109: WR_STICK_REG_R	wr	%r0, %r17, %-
fpinit_2_66:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 110: FDIVs	fdivs	%f0, %f4, %f6
	.word 0xe19fde00  ! 111: LDDFA_R	ldda	[%r31, %r0], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_67
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_67:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 112: RDPC	rd	%pc, %r19
	.word 0x91a00167  ! 113: FABSq	dis not found

	.word 0x93450000  ! 114: RD_SET_SOFTINT	rd	%set_softint, %r9
	.word 0xe1bfdf20  ! 115: STDFA_R	stda	%f16, [%r0, %r31]
pmu_2_68:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffa8ffffff44b, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_69
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_69
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_69:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 117: RDPC	rd	%pc, %r16
splash_hpstate_2_70:
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x8198230e  ! 118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030e, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_71:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00d  ! 119: CASA_R	casa	[%r31] %asi, %r13, %r17
	.word 0xe2d7e028  ! 120: LDSHA_I	ldsha	[%r31, + 0x0028] %asi, %r17
	.word 0x9f802d5c  ! 121: SIR	sir	0x0d5c
	.word 0x9f802c96  ! 122: SIR	sir	0x0c96
tagged_2_72:
	tsubcctv %r16, 0x1b1e, %r20
	.word 0xe207e060  ! 123: LDUW_I	lduw	[%r31 + 0x0060], %r17
pmu_2_73:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff04fffffff81, %g1, %g7
	.word 0xa3800007  ! 124: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_2_74:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d90400c  ! 125: WRPR_WSTATE_R	wrpr	%r1, %r12, %wstate
	.word 0xe26fe0b1  ! 126: LDSTUB_I	ldstub	%r17, [%r31 + 0x00b1]
	.word 0xe31fc000  ! 127: LDDF_R	ldd	[%r31, %r0], %f17
	.word 0xe227e070  ! 128: STW_I	stw	%r17, [%r31 + 0x0070]
intveclr_2_75:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4c30daac89fc4fcf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe22fe001  ! 130: STB_I	stb	%r17, [%r31 + 0x0001]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_76)+16, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_76)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_76:
	.word 0xa9806208  ! 131: WR_SET_SOFTINT_I	wr	%r1, 0x0208, %set_softint
	.word 0xe337e02e  ! 132: STQF_I	-	%f17, [0x002e, %r31]
	.word 0xe337c000  ! 133: STQF_R	-	%f17, [%r0, %r31]
	.word 0xe327e00c  ! 134: STF_I	st	%f17, [0x000c, %r31]
jmptr_2_77:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 135: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_2_78:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffdfefffffde3, %g1, %g7
	.word 0xa3800007  ! 136: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_2_79:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf68, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 137: CASA_R	casa	[%r31] %asi, %r17, %r17
	.word 0xc1bfe080  ! 138: STDFA_I	stda	%f0, [0x0080, %r31]
mondo_2_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d94c008  ! 139: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
	.word 0x8d802000  ! 140: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_2_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d904009  ! 141: WRPR_WSTATE_R	wrpr	%r1, %r9, %wstate
pmu_2_82:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff86dfffff280, %g1, %g7
	.word 0xa3800007  ! 142: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91702bc4  ! 143: POPC_I	popc	0x0bc4, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_83)+16, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_83)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_83:
	.word 0xa9852cd4  ! 144: WR_SET_SOFTINT_I	wr	%r20, 0x0cd4, %set_softint
cwp_2_84:
    set user_data_start, %o7
	.word 0x93902001  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
intveclr_2_85:
	nop
	ta T_CHANGE_HPRIV
	setx 0x503308d7df54402b, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 146: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_86:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 147: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xa1a00166  ! 148: FABSq	dis not found

	.word 0xa1b24486  ! 149: FCMPLE32	fcmple32	%d40, %d6, %r16
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
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
	.word 0xdbe7e011  ! 150: CASA_R	casa	[%r31] %asi, %r17, %r13
cmp_2_88:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x2, %r10
cmp_startwait2_88:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_2_88
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait2_88:
    brnz,a %r10, cmp_wait2_88
    ld [%r23], %r10
    ba,a cmp_startwait2_88
    mov 0x2, %r10
continue_cmp_2_88:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    ldxa [0x10]%asi, %r13       !Get enabled threads
    andn %r13, 0xff, %r16
    brz,a %r16, cmp_multi_core_2_88
    mov 0xa0, %r17
    best_set_reg(0x8316c66d2c5b5511, %r16, %r17)
cmp_multi_core_2_88:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r13, %r14        !Apply core-enabled mask 
    andn %r14, 0x2, %r14  !Leave master thread
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x9192c010  ! 151: WRPR_PIL_R	wrpr	%r11, %r16, %pil
	.word 0xc19fc2c0  ! 152: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x3c700001  ! 153: BPPOS	<illegal instruction>
	.word 0xda27e08b  ! 154: STW_I	stw	%r13, [%r31 + 0x008b]
pmu_2_89:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff950fffff246, %g1, %g7
	.word 0xa3800007  ! 155: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_90:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 156: CASA_R	casa	[%r31] %asi, %r19, %r13
	setx 0x95bfe0c499c697e8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_91:
	.word 0x39400001  ! 157: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2e700001  ! 158: BPVS	<illegal instruction>
	.word 0xda47c000  ! 159: LDSW_R	ldsw	[%r31 + %r0], %r13
splash_lsu_2_92:
	nop
	ta T_CHANGE_HPRIV
	set 0x855ecc53, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 160: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_93)+8, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_93)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_93:
	.word 0xa9847640  ! 161: WR_SET_SOFTINT_I	wr	%r17, 0x1640, %set_softint
	.word 0xe19fda00  ! 162: LDDFA_R	ldda	[%r31, %r0], %f16
pmu_2_94:
	nop
	setx 0xfffff16efffff90c, %g1, %g7
	.word 0xa3800007  ! 163: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3a800001  ! 164: BCC	bcc,a	<label_0x1>
	.word 0xa9464000  ! 165: RD_STICK_CMPR_REG	rd	%-, %r20
pmu_2_95:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff680fffff6be, %g1, %g7
	.word 0xa3800007  ! 166: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xb1800011  ! 167: WR_STICK_REG_R	wr	%r0, %r17, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_96
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_96:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 168: CASA_R	casa	[%r31] %asi, %r19, %r13
pmu_2_97:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffe87fffffa09, %g1, %g7
	.word 0xa3800007  ! 169: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_2_98:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffaacfffff2e0, %g1, %g7
	.word 0xa3800007  ! 170: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d02033  ! 171: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xa9808011  ! 172: WR_SET_SOFTINT_R	wr	%r2, %r17, %set_softint
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 173: Tcc_R	ta	icc_or_xcc, %r0 + %r30
brcommon_2_99:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xda9fc023  ! 174: LDDA_R	ldda	[%r31, %r3] 0x01, %r13
br_badelay3_2_100:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xfd5c6ff2	! Random illegal ?
	.word 0xdb10c009  ! 1: LDQF_R	-	[%r3, %r9], %f13
	.word 0x91a4c834  ! 175: FADDs	fadds	%f19, %f20, %f8
	.word 0xa7a2c9d4  ! 176: FDIVd	fdivd	%f42, %f20, %f50
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_2_101:
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 178: LDX_R	ldx	[%r31 + %r0], %r16
memptr_2_102:
	set user_data_start, %r31
	.word 0x85852eb8  ! 179: WRCCR_I	wr	%r20, 0x0eb8, %ccr
	setx 0x28e695bd43a475c6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_103:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe040  ! 181: STDFA_I	stda	%f16, [0x0040, %r31]
    set 0x311e, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b447d3  ! 182: PDIST	pdistn	%d48, %d50, %d10
mondo_2_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d950003  ! 183: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
	.word 0x9f8020f4  ! 184: SIR	sir	0x00f4
	.word 0xa7a049d0  ! 185: FDIVd	fdivd	%f32, %f16, %f50
	.word 0xa1b48492  ! 186: FCMPLE32	fcmple32	%d18, %d18, %r16
dvapa_2_105:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd53, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd11fc013  ! 187: LDDF_R	ldd	[%r31, %r19], %f8
mondo_2_106:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d940012  ! 188: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
	.word 0xa3b044c1  ! 189: FCMPNE32	fcmpne32	%d32, %d32, %r17
	.word 0xe23fe275  ! 190: STD_I	std	%r17, [%r31 + 0x0275]
	.word 0xe237e034  ! 191: STH_I	sth	%r17, [%r31 + 0x0034]
	.word 0xa1480000  ! 192: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_108)+0, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_108)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_108:
	.word 0xa98524e1  ! 193: WR_SET_SOFTINT_I	wr	%r20, 0x04e1, %set_softint
	.word 0x9f8030d1  ! 194: SIR	sir	0x10d1
dvapa_2_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0x984, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe69fc021  ! 195: LDDA_R	ldda	[%r31, %r1] 0x01, %r19
intveclr_2_110:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1c969b8444bf39bf, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 196: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    set 0x3256, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b2c7c6  ! 197: PDIST	pdistn	%d42, %d6, %d16
	.word 0xd3e7e012  ! 198: CASA_R	casa	[%r31] %asi, %r18, %r9
mondo_2_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d948011  ! 199: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_113
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_113:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 200: RDPC	rd	%pc, %r19
mondo_2_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d944011  ! 201: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
	.word 0xe1bfdc00  ! 202: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x91d02032  ! 203: Tcc_I	ta	icc_or_xcc, %r0 + 50
memptr_2_115:
	set 0x60540000, %r31
	.word 0x8580b331  ! 204: WRCCR_I	wr	%r2, 0x1331, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 205: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x93d020b3  ! 206: Tcc_I	tne	icc_or_xcc, %r0 + 179
pmu_2_116:
	nop
	setx 0xfffff882fffffbea, %g1, %g7
	.word 0xa3800007  ! 207: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x2acb0001  ! 1: BRNZ	brnz,a,pt	%r12,<label_0xb0001>
	.word 0x8d902da7  ! 208: WRPR_PSTATE_I	wrpr	%r0, 0x0da7, %pstate
splash_tba_2_118:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 209: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87a84a53  ! 210: FCMPd	fcmpd	%fcc<n>, %f32, %f50
	.word 0xe1bfe080  ! 211: STDFA_I	stda	%f16, [0x0080, %r31]
	.word 0x38800001  ! 212: BGU	bgu,a	<label_0x1>
	.word 0xc1bfe020  ! 213: STDFA_I	stda	%f0, [0x0020, %r31]
	.word 0xa5454000  ! 214: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0x9970275e  ! 215: POPC_I	popc	0x075e, %r12
mondo_2_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d910014  ! 216: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
splash_lsu_2_120:
	nop
	ta T_CHANGE_HPRIV
	set 0xd76778f7, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x24800001  ! 218: BLE	ble,a	<label_0x1>
	.word 0xc19fc3e0  ! 219: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd797e010  ! 220: LDQFA_I	-	[%r31, 0x0010], %f11
	.word 0xd73fc000  ! 221: STDF_R	std	%f11, [%r0, %r31]
donret_2_121:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_121-donret_2_121-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005ee2c6 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x98f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_121:
	.word 0xd6ffe095  ! 222: SWAPA_I	swapa	%r11, [%r31 + 0x0095] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_122)+16, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_122)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_122:
	.word 0xa984e778  ! 223: WR_SET_SOFTINT_I	wr	%r19, 0x0778, %set_softint
	.word 0xa3b18491  ! 224: FCMPLE32	fcmple32	%d6, %d48, %r17
ibp_2_123:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe8bfc02b  ! 225: STDA_R	stda	%r20, [%r31 + %r11] 0x01
    set 0x39b1, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b307d3  ! 226: PDIST	pdistn	%d12, %d50, %d48
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 227: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_124
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_124:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 228: RDPC	rd	%pc, %r16
cmp_2_125:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x2, %r10
cmp_startwait2_125:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_2_125
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait2_125:
    brnz,a %r10, cmp_wait2_125
    ld [%r23], %r10
    ba,a cmp_startwait2_125
    mov 0x2, %r10
continue_cmp_2_125:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    ldxa [0x10]%asi, %r13       !Get enabled threads
    andn %r13, 0xff, %r16
    brz,a %r16, cmp_multi_core_2_125
    mov 0x74, %r17
    best_set_reg(0xdaf9b7cf45858f7b, %r16, %r17)
cmp_multi_core_2_125:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r13, %r14        !Apply core-enabled mask 
    andn %r14, 0x2, %r14  !Leave master thread
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9192c005  ! 229: WRPR_PIL_R	wrpr	%r11, %r5, %pil
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x8d9037c7  ! 230: WRPR_PSTATE_I	wrpr	%r0, 0x17c7, %pstate
	.word 0xd23fe028  ! 231: STD_I	std	%r9, [%r31 + 0x0028]
mondo_2_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d910013  ! 232: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 233: LDX_R	ldx	[%r31 + %r0], %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_128)+40, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_128)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_128:
	.word 0xa984768c  ! 234: WR_SET_SOFTINT_I	wr	%r17, 0x168c, %set_softint
	.word 0xe19fc3e0  ! 235: LDDFA_R	ldda	[%r31, %r0], %f16
invtsb_2_129:
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
	.word 0x29800001  ! 236: FBL	fbl,a	<label_0x1>
splash_htba_2_130:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 237: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
ibp_2_131:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd23ff10c  ! 238: STD_I	std	%r9, [%r31 + 0xfffff10c]
	.word 0xa5702a41  ! 239: POPC_I	popc	0x0a41, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_132)+24, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_132)&0xffffffff) +24, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_132:
	.word 0xa9853b5f  ! 240: WR_SET_SOFTINT_I	wr	%r20, 0x1b5f, %set_softint
cmp_2_133:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x2, %r10
cmp_startwait2_133:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_2_133
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait2_133:
    brnz,a %r10, cmp_wait2_133
    ld [%r23], %r10
    ba,a cmp_startwait2_133
    mov 0x2, %r10
continue_cmp_2_133:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    ldxa [0x10]%asi, %r13       !Get enabled threads
    andn %r13, 0xff, %r16
    brz,a %r16, cmp_multi_core_2_133
    mov 47, %r17
    best_set_reg(0x22f2a0f41733d9c6, %r16, %r17)
cmp_multi_core_2_133:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r13, %r14        !Apply core-enabled mask 
    andn %r14, 0x2, %r14  !Leave master thread
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91948013  ! 241: WRPR_PIL_R	wrpr	%r18, %r19, %pil
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_134
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_134:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 242: CASA_R	casa	[%r31] %asi, %r13, %r18
mondo_2_135:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d90c00a  ! 243: WRPR_WSTATE_R	wrpr	%r3, %r10, %wstate
ibp_2_136:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe5e7e013  ! 244: CASA_R	casa	[%r31] %asi, %r19, %r18
splash_tba_2_137:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 245: WRPR_TBA_R	wrpr	%r0, %r12, %tba
br_badelay3_2_138:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa1553377	! Random illegal ?
	.word 0xd1150006  ! 1: LDQF_R	-	[%r20, %r6], %f8
	.word 0x91a34831  ! 246: FADDs	fadds	%f13, %f17, %f8
	.word 0x87ad0a53  ! 247: FCMPd	fcmpd	%fcc<n>, %f20, %f50
	.word 0xe1bfda00  ! 248: STDFA_R	stda	%f16, [%r0, %r31]
brcommon_2_139:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xc32fc010  ! 249: STXFSR_R	st-sfr	%f1, [%r16, %r31]
pmu_2_140:
	nop
	setx 0xfffff8f8fffffd7e, %g1, %g7
	.word 0xa3800007  ! 250: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd43fc000  ! 251: STD_R	std	%r10, [%r31 + %r0]
dvapa_2_141:
	nop
	ta T_CHANGE_HPRIV
	mov 0x993, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd5e7e010  ! 252: CASA_R	casa	[%r31] %asi, %r16, %r10
br_badelay3_2_142:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe74fdfcb	! Random illegal ?
	.word 0xd9104012  ! 1: LDQF_R	-	[%r1, %r18], %f12
	.word 0xa3a48831  ! 253: FADDs	fadds	%f18, %f17, %f17
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 254: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x7956d81a51bff6c4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_143:
	.word 0x39400001  ! 255: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
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
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_144:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 256: RDPC	rd	%pc, %r16
	.word 0xa5b247d3  ! 257: PDIST	pdistn	%d40, %d50, %d18
dvapa_2_145:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfb6, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc012  ! 258: STXFSR_R	st-sfr	%f1, [%r18, %r31]
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 259: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe457c000  ! 260: LDSH_R	ldsh	[%r31 + %r0], %r18
splash_lsu_2_146:
	nop
	ta T_CHANGE_HPRIV
	set 0xe215750d, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 262: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cmp_2_147:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x2, %r10
cmp_startwait2_147:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_2_147
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait2_147:
    brnz,a %r10, cmp_wait2_147
    ld [%r23], %r10
    ba,a cmp_startwait2_147
    mov 0x2, %r10
continue_cmp_2_147:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    ldxa [0x10]%asi, %r13       !Get enabled threads
    andn %r13, 0xff, %r16
    brz,a %r16, cmp_multi_core_2_147
    mov 0xd0, %r17
    best_set_reg(0x6178a8397b4014a2, %r16, %r17)
cmp_multi_core_2_147:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r13, %r14        !Apply core-enabled mask 
    andn %r14, 0x2, %r14  !Leave master thread
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91928013  ! 263: WRPR_PIL_R	wrpr	%r10, %r19, %pil
	.word 0xc1bfd920  ! 264: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc19fe0c0  ! 265: LDDFA_I	ldda	[%r31, 0x00c0], %f0
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_148:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 266: CASA_R	casa	[%r31] %asi, %r20, %r18
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a00166  ! 268: FABSq	dis not found

    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_149
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_149:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 269: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0xe63fe018  ! 270: STD_I	std	%r19, [%r31 + 0x0018]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_150) + 56, 16, 16)) -> intp(6,0,26)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_150)&0xffffffff)  + 56, 16, 16)) -> intp(6,0,26)
intvec_2_150:
	.word 0x39400001  ! 271: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_151)+40, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_151)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_151:
	.word 0xa982b434  ! 272: WR_SET_SOFTINT_I	wr	%r10, 0x1434, %set_softint
	.word 0xe63fe0bc  ! 273: STD_I	std	%r19, [%r31 + 0x00bc]
memptr_2_152:
	set 0x60140000, %r31
	.word 0x8581ffc0  ! 274: WRCCR_I	wr	%r7, 0x1fc0, %ccr
br_badelay1_2_153:
	.word 0x97b484cc  ! 1: FCMPNE32	fcmpne32	%d18, %d12, %r11
	.word 0xd7314014  ! 1: STQF_R	-	%f11, [%r20, %r5]
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	normalw
	.word 0xa5458000  ! 275: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0xa9b2c4d1  ! 276: FCMPNE32	fcmpne32	%d42, %d48, %r20
	.word 0xc1bfe0c0  ! 277: STDFA_I	stda	%f0, [0x00c0, %r31]
	.word 0xe19fe060  ! 278: LDDFA_I	ldda	[%r31, 0x0060], %f16
	.word 0xe1bfd960  ! 279: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x91d02034  ! 280: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9f803de6  ! 281: SIR	sir	0x1de6
jmptr_2_154:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 282: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_155:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 283: CASA_R	casa	[%r31] %asi, %r17, %r20
	.word 0x93a0016a  ! 284: FABSq	dis not found

mondo_2_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d94000b  ! 285: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
	.word 0xc32fc000  ! 286: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xc1bfdb60  ! 287: STDFA_R	stda	%f0, [%r0, %r31]
change_to_randtl_2_157:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_157:
	.word 0x8f902000  ! 288: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_decr_2_158:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa7814012  ! 289: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r18, %-
	.word 0xe1bfe060  ! 290: STDFA_I	stda	%f16, [0x0060, %r31]
	.word 0xd86fe00e  ! 291: LDSTUB_I	ldstub	%r12, [%r31 + 0x000e]
	.word 0x95b50990  ! 292: BSHUFFLE	fmovc32	%d20, %d16, %d10
memptr_2_160:
	set 0x60540000, %r31
	.word 0x8584764e  ! 293: WRCCR_I	wr	%r17, 0x164e, %ccr
splash_hpstate_2_161:
	ta T_CHANGE_NONHPRIV
	.word 0x819828dd  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08dd, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_162) + 24, 16, 16)) -> intp(3,0,16)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_162)&0xffffffff)  + 24, 16, 16)) -> intp(3,0,16)
intvec_2_162:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0bfe048  ! 296: STDA_I	stda	%r8, [%r31 + 0x0048] %asi
	.word 0xa7a00163  ! 297: FABSq	dis not found

splash_tba_2_163:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 298: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_2_164:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 299: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d902cd9  ! 300: WRPR_PSTATE_I	wrpr	%r0, 0x0cd9, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_166)+8, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_166)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_166:
	.word 0xa9843233  ! 301: WR_SET_SOFTINT_I	wr	%r16, 0x1233, %set_softint
cmpenall_2_167:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmpenall_startwait2_167:
    mov 0x2, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_2_167
    nop
cmpenall_wait2_167:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait2_167
    nop
    ba,a cmpenall_startwait2_167
continue_cmpenall_2_167:
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_2_167:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r14
    bne,a %xcc, wait_for_cmpstat_2_167
    ldxa [0x58]%asi, %r14       !Running_status
    ldxa [0x10]%asi, %r14       !Get enabled threads
    stxa %r14, [0x50]%asi 
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_2_167:
    cmp %r14, %r16
    bne,a %xcc, wait_for_cmpstat2_2_167
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
fork_lbl_0_1:
    ta T_CHANGE_NONHPRIV 
splash_cmpr_1_0:
	nop
	setx 0x1fd2ccdd1a07495a, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 1: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x81510000  ! 2: RDPR_TICK	rdpr	%tick, %r0
	.word 0xc1bfe020  ! 3: STDFA_I	stda	%f0, [0x0020, %r31]
	setx 0x7f39c61fc67de0b0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_1:
	.word 0x39400001  ! 4: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 5: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_1_2:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d93400c  ! 6: WRPR_WSTATE_R	wrpr	%r13, %r12, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc1bfe040  ! 8: STDFA_I	stda	%f0, [0x0040, %r31]
br_badelay2_1_3:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0xa5b30314  ! 9: ALIGNADDRESS	alignaddr	%r12, %r20, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_4) + 8, 16, 16)) -> intp(4,0,26)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_4)&0xffffffff)  + 8, 16, 16)) -> intp(4,0,26)
intvec_1_4:
	.word 0x39400001  ! 10: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe477e048  ! 11: STX_I	stx	%r18, [%r31 + 0x0048]
donret_1_5:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_5-donret_1_5-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00400dd9 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe44, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_5:
	.word 0xe4ffe00c  ! 12: SWAPA_I	swapa	%r18, [%r31 + 0x000c] %asi
splash_cmpr_1_6:
	nop
	setx 0xb0a0326a68c6f07f, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 13: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0xa7a409b2  ! 14: FDIVs	fdivs	%f16, %f18, %f19
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 15: Tcc_R	ta	icc_or_xcc, %r0 + %r30
vahole_1_7:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe71fc012  ! 16: LDDF_R	ldd	[%r31, %r18], %f19
br_badelay2_1_8:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f4, %f16, %f12
	.word 0x93b2c314  ! 17: ALIGNADDRESS	alignaddr	%r11, %r20, %r9
	.word 0x99a00167  ! 18: FABSq	dis not found

	.word 0xb1800011  ! 19: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xad836715  ! 20: WR_SOFTINT_REG_I	wr	%r13, 0x0715, %softint
	.word 0xd877c000  ! 21: STX_R	stx	%r12, [%r31 + %r0]
splash_tba_1_9:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 22: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd89fe038  ! 23: LDDA_I	ldda	[%r31, + 0x0038] %asi, %r12
jmptr_1_10:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 24: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_1_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d948012  ! 25: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
	.word 0xa9a049d1  ! 26: FDIVd	fdivd	%f32, %f48, %f20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_12)+48, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_12)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_12:
	.word 0xa981240a  ! 27: WR_SET_SOFTINT_I	wr	%r4, 0x040a, %set_softint
	.word 0x9f802aa5  ! 28: SIR	sir	0x0aa5
intveclr_1_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7d384271231d7f8b, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 29: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon_1_14:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xe897c031  ! 30: LDUHA_R	lduha	[%r31, %r17] 0x01, %r20
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_15
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_15:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 31: RDPC	rd	%pc, %r9
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_16
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_16:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 32: CASA_R	casa	[%r31] %asi, %r17, %r9
splash_cmpr_1_17:
	nop
	setx 0x1471a54ed8c0b52b, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 33: WRPR_TICK_R	wrpr	%r0, %r17, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_18) + 32, 16, 16)) -> intp(6,0,28)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_18)&0xffffffff)  + 32, 16, 16)) -> intp(6,0,28)
intvec_1_18:
	.word 0x39400001  ! 34: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd26fe078  ! 35: LDSTUB_I	ldstub	%r9, [%r31 + 0x0078]
splash_hpstate_1_19:
	.word 0x8198298f  ! 36: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098f, %hpstate
br_longdelay1_1_20:
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x9d97c000  ! 37: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 38: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd23fc000  ! 39: STD_R	std	%r9, [%r31 + %r0]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_21)+40, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_21)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_21:
	.word 0xa984abd2  ! 40: WR_SET_SOFTINT_I	wr	%r18, 0x0bd2, %set_softint
splash_hpstate_1_22:
	ta T_CHANGE_NONHPRIV
	.word 0x81982d9f  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9f, %hpstate
	.word 0xa9b48481  ! 42: FCMPLE32	fcmple32	%d18, %d32, %r20
splash_tba_1_23:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 43: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_1_24:
	nop
	setx 0x59f5dfc8d1f140d2, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 44: WRPR_TICK_R	wrpr	%r0, %r17, %tick
br_longdelay1_1_25:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9d97c000  ! 45: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
mondo_1_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d948002  ! 46: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 47: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9824013  ! 48: WR_SET_SOFTINT_R	wr	%r9, %r19, %set_softint
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_27:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 49: CASA_R	casa	[%r31] %asi, %r19, %r20
	.word 0xe86fe02e  ! 50: LDSTUB_I	ldstub	%r20, [%r31 + 0x002e]
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 51: Tcc_R	tne	icc_or_xcc, %r0 + %r30
pmu_1_28:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffa5cffffff1d, %g1, %g7
	.word 0xa3800007  ! 52: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_1_29:
	nop
	ta T_CHANGE_HPRIV
	mov 0x840, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc013  ! 53: STXFSR_R	st-sfr	%f1, [%r19, %r31]
	.word 0xc19fdf20  ! 54: LDDFA_R	ldda	[%r31, %r0], %f0
fpinit_1_30:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 55: FDIVs	fdivs	%f0, %f4, %f4
	setx 0x258c37b10dff72d3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_31:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 57: Tcc_R	ta	icc_or_xcc, %r0 + %r30
br_longdelay4_1_32:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 58: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x91a089d0  ! 59: FDIVd	fdivd	%f2, %f16, %f8
	setx 0xe88596b9b0b34348, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_33:
	.word 0x39400001  ! 60: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d92800a  ! 61: WRPR_WSTATE_R	wrpr	%r10, %r10, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_35:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 62: CASA_R	casa	[%r31] %asi, %r10, %r8
splash_decr_1_36:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r19, [%r1] 0x45
	.word 0xa781c004  ! 63: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r4, %-
	.word 0x9f8036c3  ! 64: SIR	sir	0x16c3
	.word 0xd08fe030  ! 65: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r8
	.word 0xd03fc000  ! 66: STD_R	std	%r8, [%r31 + %r0]
	.word 0xc32fc000  ! 67: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xd0800c80  ! 68: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r8
change_to_randtl_1_37:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_37:
	.word 0x8f902000  ! 69: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
dvapa_1_38:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9f8, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd0dfc024  ! 70: LDXA_R	ldxa	[%r31, %r4] 0x01, %r8
intveclr_1_39:
	nop
	ta T_CHANGE_HPRIV
	setx 0x893ee8b54e623745, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 71: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d910014  ! 72: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
	.word 0x91944011  ! 73: WRPR_PIL_R	wrpr	%r17, %r17, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_42) + 56, 16, 16)) -> intp(5,0,16)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_42)&0xffffffff)  + 56, 16, 16)) -> intp(5,0,16)
intvec_1_42:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1b2c7c8  ! 75: PDIST	pdistn	%d42, %d8, %d16
br_longdelay2_1_43:
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0xe3e0c025  ! 76: CASA_I	casa	[%r3] 0x 1, %r5, %r17
splash_cmpr_1_44:
	nop
	setx 0x1d0a1fa0d0ffdb36, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 77: WRPR_TICK_R	wrpr	%r0, %r17, %tick
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_45
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_45:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 78: CASA_R	casa	[%r31] %asi, %r5, %r17
	.word 0x2aca4001  ! 1: BRNZ	brnz,a,pt	%r9,<label_0xa4001>
	.word 0x8d90313d  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x113d, %pstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_47
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_47
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_47:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 80: RDPC	rd	%pc, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_48)+24, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_48)&0xffffffff) +24, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_48:
	.word 0xa9842e31  ! 81: WR_SET_SOFTINT_I	wr	%r16, 0x0e31, %set_softint
	.word 0x91928014  ! 82: WRPR_PIL_R	wrpr	%r10, %r20, %pil
intveclr_1_50:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5af2ca2292a4c9a2, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 83: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_51:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d930008  ! 84: WRPR_WSTATE_R	wrpr	%r12, %r8, %wstate
splash_hpstate_1_52:
	.word 0x81982a57  ! 85: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a57, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_53:
	ta	T_CHANGE_NONHPRIV	! macro
ibp_1_54:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xdb1fc008  ! 87: LDDF_R	ldd	[%r31, %r8], %f13
splash_hpstate_1_55:
	ta T_CHANGE_NONHPRIV
	.word 0x819820c6  ! 88: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c6, %hpstate
	.word 0x9b703ac7  ! 89: POPC_I	popc	0x1ac7, %r13
	.word 0xdb27c000  ! 90: STF_R	st	%f13, [%r0, %r31]
splash_tba_1_56:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 91: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_1_57:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 92: FCMPLE32	fcmple32	%d0, %d4, %r6
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_58) + 16, 16, 16)) -> intp(2,0,4)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_58)&0xffffffff)  + 16, 16, 16)) -> intp(2,0,4)
intvec_1_58:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_1_59:
	nop
	ta T_CHANGE_HPRIV
	setx 0x34fab744ec155cc6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 94: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfdc00  ! 95: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x83d02032  ! 96: Tcc_I	te	icc_or_xcc, %r0 + 50
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
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
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_60:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 97: RDPC	rd	%pc, %r16
memptr_1_61:
	set 0x60140000, %r31
	.word 0x858139be  ! 98: WRCCR_I	wr	%r4, 0x19be, %ccr
mondo_1_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d94c011  ! 99: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
	.word 0x91d02035  ! 100: Tcc_I	ta	icc_or_xcc, %r0 + 53
ibp_1_63:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe13fc011  ! 101: STDF_R	std	%f16, [%r17, %r31]
	.word 0xc19fda00  ! 102: LDDFA_R	ldda	[%r31, %r0], %f0
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_64)+56, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_64)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_64:
	.word 0xa9852765  ! 103: WR_SET_SOFTINT_I	wr	%r20, 0x0765, %set_softint
	.word 0xc1bfc2c0  ! 104: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc1bfe080  ! 105: STDFA_I	stda	%f0, [0x0080, %r31]
	.word 0x20700001  ! 106: BPN	<illegal instruction>
jmptr_1_65:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 107: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe06fe086  ! 108: LDSTUB_I	ldstub	%r16, [%r31 + 0x0086]
	.word 0xb1800011  ! 109: WR_STICK_REG_R	wr	%r0, %r17, %-
fpinit_1_66:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 110: FDIVs	fdivs	%f0, %f4, %f8
	.word 0xc1bfdf20  ! 111: STDFA_R	stda	%f0, [%r0, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_67
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_67:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 112: RDPC	rd	%pc, %r20
	.word 0xa7a0016d  ! 113: FABSq	dis not found

	.word 0xa9450000  ! 114: RD_SET_SOFTINT	rd	%set_softint, %r20
	.word 0xc1bfd960  ! 115: STDFA_R	stda	%f0, [%r0, %r31]
pmu_1_68:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffaf4fffff3c5, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_69
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_69
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_69:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 117: RDPC	rd	%pc, %r17
splash_hpstate_1_70:
	.word 0x22cc0001  ! 1: BRZ	brz,a,pt	%r16,<label_0xc0001>
	.word 0x819825c4  ! 118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c4, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_71:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00d  ! 119: CASA_R	casa	[%r31] %asi, %r13, %r17
	.word 0xe2d7e010  ! 120: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r17
	.word 0x9f803012  ! 121: SIR	sir	0x1012
	.word 0x9f8031e9  ! 122: SIR	sir	0x11e9
tagged_1_72:
	tsubcctv %r18, 0x11ff, %r3
	.word 0xe207e048  ! 123: LDUW_I	lduw	[%r31 + 0x0048], %r17
pmu_1_73:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff498fffff1ab, %g1, %g7
	.word 0xa3800007  ! 124: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_1_74:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d908011  ! 125: WRPR_WSTATE_R	wrpr	%r2, %r17, %wstate
	.word 0xe26fe070  ! 126: LDSTUB_I	ldstub	%r17, [%r31 + 0x0070]
	.word 0xe31fc000  ! 127: LDDF_R	ldd	[%r31, %r0], %f17
	.word 0xe227e0c8  ! 128: STW_I	stw	%r17, [%r31 + 0x00c8]
intveclr_1_75:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1ad37647fa8d83b5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe22fe0b7  ! 130: STB_I	stb	%r17, [%r31 + 0x00b7]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_76)+56, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_76)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_76:
	.word 0xa9836c38  ! 131: WR_SET_SOFTINT_I	wr	%r13, 0x0c38, %set_softint
	.word 0xe337e03e  ! 132: STQF_I	-	%f17, [0x003e, %r31]
	.word 0xe337c000  ! 133: STQF_R	-	%f17, [%r0, %r31]
	.word 0xe327e08c  ! 134: STF_I	st	%f17, [0x008c, %r31]
jmptr_1_77:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 135: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_1_78:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff273fffff606, %g1, %g7
	.word 0xa3800007  ! 136: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_1_79:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9ba, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe31fc011  ! 137: LDDF_R	ldd	[%r31, %r17], %f17
	.word 0xc1bfde00  ! 138: STDFA_R	stda	%f0, [%r0, %r31]
mondo_1_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d948010  ! 139: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	.word 0x8d802004  ! 140: WRFPRS_I	wr	%r0, 0x0004, %fprs
mondo_1_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d91000a  ! 141: WRPR_WSTATE_R	wrpr	%r4, %r10, %wstate
pmu_1_82:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffa9fffffe24, %g1, %g7
	.word 0xa3800007  ! 142: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99b44491  ! 143: FCMPLE32	fcmple32	%d48, %d48, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_83)+32, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_83)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_83:
	.word 0xa984e4b1  ! 144: WR_SET_SOFTINT_I	wr	%r19, 0x04b1, %set_softint
cwp_1_84:
    set user_data_start, %o7
	.word 0x93902007  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
intveclr_1_85:
	nop
	ta T_CHANGE_HPRIV
	setx 0x3267168824edbd8a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 146: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_86:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 147: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xa5a00165  ! 148: FABSq	dis not found

	.word 0x9ba349d1  ! 149: FDIVd	fdivd	%f44, %f48, %f44
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_87:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 150: CASA_R	casa	[%r31] %asi, %r17, %r13
	.word 0x91908013  ! 151: WRPR_PIL_R	wrpr	%r2, %r19, %pil
	.word 0xe19fc3e0  ! 152: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x3c700001  ! 153: BPPOS	<illegal instruction>
	.word 0xda27e069  ! 154: STW_I	stw	%r13, [%r31 + 0x0069]
pmu_1_89:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff3a1fffff0f8, %g1, %g7
	.word 0xa3800007  ! 155: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_90:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 156: CASA_R	casa	[%r31] %asi, %r19, %r13
	setx 0x0fdd744fedc3c594, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_91:
	.word 0x39400001  ! 157: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2e700001  ! 158: BPVS	<illegal instruction>
	.word 0xda47c000  ! 159: LDSW_R	ldsw	[%r31 + %r0], %r13
splash_lsu_1_92:
	nop
	ta T_CHANGE_HPRIV
	set 0xff0a5439, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 160: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_93)+16, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_93)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_93:
	.word 0xa9836e11  ! 161: WR_SET_SOFTINT_I	wr	%r13, 0x0e11, %set_softint
	.word 0xc1bfe0a0  ! 162: STDFA_I	stda	%f0, [0x00a0, %r31]
pmu_1_94:
	nop
	setx 0xfffff370fffff5da, %g1, %g7
	.word 0xa3800007  ! 163: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3a800001  ! 164: BCC	bcc,a	<label_0x1>
	.word 0x9b464000  ! 165: RD_STICK_CMPR_REG	rd	%-, %r13
pmu_1_95:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc7bfffffc24, %g1, %g7
	.word 0xa3800007  ! 166: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xb1800011  ! 167: WR_STICK_REG_R	wr	%r0, %r17, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_96
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_96:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 168: CASA_R	casa	[%r31] %asi, %r19, %r13
pmu_1_97:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff3b4fffff17e, %g1, %g7
	.word 0xa3800007  ! 169: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_1_98:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc3bfffff215, %g1, %g7
	.word 0xa3800007  ! 170: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d020b3  ! 171: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0xa9820003  ! 172: WR_SET_SOFTINT_R	wr	%r8, %r3, %set_softint
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 173: Tcc_R	ta	icc_or_xcc, %r0 + %r30
brcommon_1_99:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xc32fc003  ! 174: STXFSR_R	st-sfr	%f1, [%r3, %r31]
br_badelay3_1_100:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc77190c9	! Random illegal ?
	.word 0xd5110014  ! 1: LDQF_R	-	[%r4, %r20], %f10
	.word 0x91a40834  ! 175: FADDs	fadds	%f16, %f20, %f8
	.word 0xa1a509c2  ! 176: FDIVd	fdivd	%f20, %f2, %f16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_101:
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 178: LDX_R	ldx	[%r31 + %r0], %r16
memptr_1_102:
	set user_data_start, %r31
	.word 0x8584f152  ! 179: WRCCR_I	wr	%r19, 0x1152, %ccr
	setx 0x83b4e5a6d533b905, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_103:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe040  ! 181: STDFA_I	stda	%f16, [0x0040, %r31]
    set 0x364a, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b507d2  ! 182: PDIST	pdistn	%d20, %d18, %d10
mondo_1_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d934012  ! 183: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
	.word 0x9f803d4d  ! 184: SIR	sir	0x1d4d
	.word 0x97a0c9c2  ! 185: FDIVd	fdivd	%f34, %f2, %f42
	.word 0x91b34493  ! 186: FCMPLE32	fcmple32	%d44, %d50, %r8
dvapa_1_105:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8e3, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 187: CASA_R	casa	[%r31] %asi, %r19, %r8
mondo_1_106:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d904011  ! 188: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
	.word 0xc36ce275  ! 189: PREFETCH_I	prefetch	[%r19 + 0x0275], #one_read
vahole_1_107:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe29fc021  ! 190: LDDA_R	ldda	[%r31, %r1] 0x01, %r17
	.word 0xe237e035  ! 191: STH_I	sth	%r17, [%r31 + 0x0035]
	.word 0xa7480000  ! 192: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_108)+56, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_108)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_108:
	.word 0xa9807645  ! 193: WR_SET_SOFTINT_I	wr	%r1, 0x1645, %set_softint
	.word 0x9f8036e5  ! 194: SIR	sir	0x16e5
dvapa_1_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd62, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe73fc001  ! 195: STDF_R	std	%f19, [%r1, %r31]
intveclr_1_110:
	nop
	ta T_CHANGE_HPRIV
	setx 0xdccd5c863b50d892, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 196: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    set 0x171f, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b4c7d2  ! 197: PDIST	pdistn	%d50, %d18, %d40
iaw_1_111:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x1, %r16
iaw_startwait1_111:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_1_111
    mov (~0x1&0xf), %r16
    ld [%r23], %r16
iaw_wait1_111:
    brnz %r16, iaw_wait1_111
    ld [%r23], %r16
    ba,a iaw_startwait1_111
    mov 0x1, %r16
continue_iaw_1_111:
    ldxa [%g0]0x63, %r14        !Get raw TID
    srlx %r14, 3, %r14          !Get CID
    sllx %r16, %r14, %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_111:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_1_111
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_1_111:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_1_111
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit1_111:
	mov 0x38, %r18
iaw3_1_111:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd297c032  ! 198: LDUHA_R	lduha	[%r31, %r18] 0x01, %r9
mondo_1_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d94c013  ! 199: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_113
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_113:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 200: RDPC	rd	%pc, %r17
mondo_1_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d94c00a  ! 201: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
	.word 0xc1bfd920  ! 202: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x91d02035  ! 203: Tcc_I	ta	icc_or_xcc, %r0 + 53
memptr_1_115:
	set 0x60340000, %r31
	.word 0x85843f38  ! 204: WRCCR_I	wr	%r16, 0x1f38, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 205: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x83d02032  ! 206: Tcc_I	te	icc_or_xcc, %r0 + 50
pmu_1_116:
	nop
	setx 0xfffff4fafffffdc3, %g1, %g7
	.word 0xa3800007  ! 207: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903160  ! 208: WRPR_PSTATE_I	wrpr	%r0, 0x1160, %pstate
splash_tba_1_118:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 209: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1b40493  ! 210: FCMPLE32	fcmple32	%d16, %d50, %r16
	.word 0xc1bfe020  ! 211: STDFA_I	stda	%f0, [0x0020, %r31]
	.word 0x38800001  ! 212: BGU	bgu,a	<label_0x1>
	.word 0xc19fde00  ! 213: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xa5454000  ! 214: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0x97a289d1  ! 215: FDIVd	fdivd	%f10, %f48, %f42
mondo_1_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d934001  ! 216: WRPR_WSTATE_R	wrpr	%r13, %r1, %wstate
splash_lsu_1_120:
	nop
	ta T_CHANGE_HPRIV
	set 0x8cf71dae, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x24800001  ! 218: BLE	ble,a	<label_0x1>
	.word 0xe1bfe080  ! 219: STDFA_I	stda	%f16, [0x0080, %r31]
	.word 0xd797e018  ! 220: LDQFA_I	-	[%r31, 0x0018], %f11
	.word 0xd73fc000  ! 221: STDF_R	std	%f11, [%r0, %r31]
donret_1_121:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_121-donret_1_121-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00aa82fe | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf87, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_121:
	.word 0xd6ffe05c  ! 222: SWAPA_I	swapa	%r11, [%r31 + 0x005c] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_122)+0, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_122)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_122:
	.word 0xa982abbc  ! 223: WR_SET_SOFTINT_I	wr	%r10, 0x0bbc, %set_softint
	.word 0xa9b087cb  ! 224: PDIST	pdistn	%d2, %d42, %d20
ibp_1_123:
	nop
	ta T_CHANGE_HPRIV
	.word 0x9f803577  ! 225: SIR	sir	0x1577
    set 0x2882, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b4c7c4  ! 226: PDIST	pdistn	%d50, %d4, %d48
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 227: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_124
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_124:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 228: RDPC	rd	%pc, %r9
	.word 0x91918003  ! 229: WRPR_PIL_R	wrpr	%r6, %r3, %pil
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x8d903875  ! 230: WRPR_PSTATE_I	wrpr	%r0, 0x1875, %pstate
	.word 0xd23fe0c0  ! 231: STD_I	std	%r9, [%r31 + 0x00c0]
mondo_1_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d94c013  ! 232: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 233: LDX_R	ldx	[%r31 + %r0], %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_128)+8, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_128)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_128:
	.word 0xa985310c  ! 234: WR_SET_SOFTINT_I	wr	%r20, 0x110c, %set_softint
	.word 0xc1bfde00  ! 235: STDFA_R	stda	%f0, [%r0, %r31]
invtsb_1_129:
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
	.word 0x29800001  ! 236: FBL	fbl,a	<label_0x1>
splash_htba_1_130:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 237: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
ibp_1_131:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0x9f80310c  ! 238: SIR	sir	0x110c
	.word 0xc3ec0025  ! 239: PREFETCHA_R	prefetcha	[%r16, %r5] 0x01, #one_read
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_132)+56, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_132)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_132:
	.word 0xa9822530  ! 240: WR_SET_SOFTINT_I	wr	%r8, 0x0530, %set_softint
	.word 0x9194400d  ! 241: WRPR_PIL_R	wrpr	%r17, %r13, %pil
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_134
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_134:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 242: CASA_R	casa	[%r31] %asi, %r13, %r18
mondo_1_135:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d918013  ! 243: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
ibp_1_136:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe49fc033  ! 244: LDDA_R	ldda	[%r31, %r19] 0x01, %r18
splash_tba_1_137:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 245: WRPR_TBA_R	wrpr	%r0, %r12, %tba
br_badelay3_1_138:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x974939ed	! Random illegal ?
	.word 0xd913000d  ! 1: LDQF_R	-	[%r12, %r13], %f12
	.word 0x91a0882b  ! 246: FADDs	fadds	%f2, %f11, %f8
	.word 0x95b107d0  ! 247: PDIST	pdistn	%d4, %d16, %d10
	.word 0xe19fde00  ! 248: LDDFA_R	ldda	[%r31, %r0], %f16
brcommon_1_139:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xd49fc030  ! 249: LDDA_R	ldda	[%r31, %r16] 0x01, %r10
pmu_1_140:
	nop
	setx 0xfffff2bffffffde0, %g1, %g7
	.word 0xa3800007  ! 250: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd43fc000  ! 251: STD_R	std	%r10, [%r31 + %r0]
dvapa_1_141:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe25, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc010  ! 252: STXFSR_R	st-sfr	%f1, [%r16, %r31]
br_badelay3_1_142:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xf567ab92	! Random illegal ?
	.word 0xd911000a  ! 1: LDQF_R	-	[%r4, %r10], %f12
	.word 0xa1a2c82a  ! 253: FADDs	fadds	%f11, %f10, %f16
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 254: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x1cda628a72ce3a60, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_143:
	.word 0x39400001  ! 255: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
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
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_144:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 256: RDPC	rd	%pc, %r20
	.word 0x87ac4a52  ! 257: FCMPd	fcmpd	%fcc<n>, %f48, %f18
dvapa_1_145:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa2d, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe49fc032  ! 258: LDDA_R	ldda	[%r31, %r18] 0x01, %r18
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 259: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe457c000  ! 260: LDSH_R	ldsh	[%r31 + %r0], %r18
splash_lsu_1_146:
	nop
	ta T_CHANGE_HPRIV
	set 0x75046062, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 262: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91924014  ! 263: WRPR_PIL_R	wrpr	%r9, %r20, %pil
	.word 0xe1bfe080  ! 264: STDFA_I	stda	%f16, [0x0080, %r31]
	.word 0xe19fe080  ! 265: LDDFA_I	ldda	[%r31, 0x0080], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_148:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 266: CASA_R	casa	[%r31] %asi, %r20, %r18
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a00172  ! 268: FABSq	dis not found

    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_149
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_149:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 269: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0xe63fe0a4  ! 270: STD_I	std	%r19, [%r31 + 0x00a4]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_150) + 24, 16, 16)) -> intp(1,0,20)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_150)&0xffffffff)  + 24, 16, 16)) -> intp(1,0,20)
intvec_1_150:
	.word 0x39400001  ! 271: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_151)+48, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_151)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_151:
	.word 0xa981e144  ! 272: WR_SET_SOFTINT_I	wr	%r7, 0x0144, %set_softint
	.word 0xe63fe030  ! 273: STD_I	std	%r19, [%r31 + 0x0030]
memptr_1_152:
	set 0x60540000, %r31
	.word 0x8581f3a4  ! 274: WRCCR_I	wr	%r7, 0x13a4, %ccr
br_badelay1_1_153:
	.word 0xc36a722b  ! 1: PREFETCH_I	prefetch	[%r9 + 0xfffff22b], #one_read
	.word 0xe934c014  ! 1: STQF_R	-	%f20, [%r20, %r19]
	.word 0x24cc8001  ! 1: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	normalw
	.word 0x95458000  ! 275: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x9f80285d  ! 276: SIR	sir	0x085d
	.word 0xc1bfdf20  ! 277: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe19fe060  ! 278: LDDFA_I	ldda	[%r31, 0x0060], %f16
	.word 0xe1bfd920  ! 279: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x91d020b3  ! 280: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x9f803508  ! 281: SIR	sir	0x1508
jmptr_1_154:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 282: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_155:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 283: CASA_R	casa	[%r31] %asi, %r17, %r20
	.word 0x99a00170  ! 284: FABSq	dis not found

mondo_1_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d944013  ! 285: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
	.word 0xc32fc000  ! 286: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xc19fc3e0  ! 287: LDDFA_R	ldda	[%r31, %r0], %f0
change_to_randtl_1_157:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_157:
	.word 0x8f902001  ! 288: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_decr_1_158:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r7, [%r1] 0x45
	.word 0xa7844004  ! 289: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r4, %-
	.word 0xc1bfe0e0  ! 290: STDFA_I	stda	%f0, [0x00e0, %r31]
	.word 0xd86fe0fc  ! 291: LDSTUB_I	ldstub	%r12, [%r31 + 0x00fc]
	.word 0x91b14994  ! 292: BSHUFFLE	fmovc32	%d36, %d20, %d8
memptr_1_160:
	set 0x60740000, %r31
	.word 0x8581eec3  ! 293: WRCCR_I	wr	%r7, 0x0ec3, %ccr
splash_hpstate_1_161:
	ta T_CHANGE_NONHPRIV
	.word 0x81982d4f  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4f, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_162) + 40, 16, 16)) -> intp(0,0,18)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_162)&0xffffffff)  + 40, 16, 16)) -> intp(0,0,18)
intvec_1_162:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0bfe098  ! 296: STDA_I	stda	%r8, [%r31 + 0x0098] %asi
	.word 0xa7a00170  ! 297: FABSq	dis not found

splash_tba_1_163:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 298: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_1_164:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 299: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d9023c4  ! 300: WRPR_PSTATE_I	wrpr	%r0, 0x03c4, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_166)+32, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_166)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_166:
	.word 0xa981abf6  ! 301: WR_SET_SOFTINT_I	wr	%r6, 0x0bf6, %set_softint
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

	.xword	0xb6e33ccce1af091e
	.xword	0xf2ddac3c74f2ee52
	.xword	0xa58f172d3656a7e1
	.xword	0xb617431df55bdb9c
	.xword	0x591cd031723ee010
	.xword	0x406da69e3a9eb4d4
	.xword	0x744d4e5ec24e48e6
	.xword	0xf483b974cd75107e
	.xword	0xe51345a87cb754ba
	.xword	0xa3c503ad80d4331d
	.xword	0x7b78c0c726e9a1ff
	.xword	0xd7c49f61253d72b3
	.xword	0x7bc44a1e7c883031
	.xword	0x099d1c0e91607f52
	.xword	0x03436915c19e20f5
	.xword	0x82da852a873c67f1
	.xword	0x9e66e14c4051ea82
	.xword	0xeffa012c3e1f8706
	.xword	0x3c1111580f475912
	.xword	0xc85d0c8d22e2eb7c
	.xword	0x1f347427c2b1a8b7
	.xword	0xde107cec311295f2
	.xword	0xea9d19912f48aecb
	.xword	0xf6a64ab7ca81afbb
	.xword	0x63f29c52aa52cc5f
	.xword	0x6eb57d1d80fcd807
	.xword	0x7a878330adf9614a
	.xword	0x61ea8af2f742f1f5
	.xword	0xa7a0dcf1ce10b71f
	.xword	0xc378add79dcbce55
	.xword	0x6289de9c544c5955
	.xword	0x46da5286f3ed087b
	.xword	0xa573881165f7c10b
	.xword	0x5004adec101fe403
	.xword	0xa4345aef085cbb57
	.xword	0x590baf3e77b4e887
	.xword	0xedce62fe913aff0d
	.xword	0xea497254008dfadb
	.xword	0x254365639aa205b8
	.xword	0x274f7d12b0bf8916
	.xword	0x721f099a393c69b3
	.xword	0xecce20a3dc0ff469
	.xword	0x62234aecf140e1a6
	.xword	0xb90a96a0cc21b49f
	.xword	0x35aa259c916e2c9b
	.xword	0x76b815f00a9e1e9e
	.xword	0x548cbc0e1818d9a4
	.xword	0xc470b31e1e0b5140
	.xword	0xac86ef014a4c91d3
	.xword	0x6b4dd94e738e5c9a
	.xword	0x57c245d7487ed9e0
	.xword	0xbde142587ee94ef5
	.xword	0xb434385dc941cc1a
	.xword	0x27a55cfd4782809a
	.xword	0x5a64275eea188ce8
	.xword	0x50de18d84f360f67
	.xword	0x49fe4009ddf6bbcb
	.xword	0x0e9ff927053ebdfc
	.xword	0x8973c213f0289bd6
	.xword	0xe185496958c9f4f1
	.xword	0xf80f03b9f9bdae55
	.xword	0xedf477ca7a243894
	.xword	0xb0c5ecca336ecdd3
	.xword	0xe217a98fba730dc6
	.xword	0x6c66f19af4d66965
	.xword	0x411fc5335761b15a
	.xword	0xc612d6811fbeb3e0
	.xword	0x462058e3525f78e3
	.xword	0xa581df1d154fa1e3
	.xword	0x05b77a5a7d571d6d
	.xword	0xa5cbd08c07f3140d
	.xword	0x3590fe0766d86233
	.xword	0x264786d6ecf08449
	.xword	0x60bec89256bfb996
	.xword	0x4ee483e1a8b38ae8
	.xword	0x6fb3743ffc4e83cf
	.xword	0xc41b77b7aeb758ac
	.xword	0x1f4ed78bd56ac408
	.xword	0x99e07aedea9cdff1
	.xword	0x753d280e0cddf8e9
	.xword	0xa1568038aa7d1d47
	.xword	0xb8930b2deea98825
	.xword	0x1b5dcf826c64a3f1
	.xword	0xd7e598c978fa3ad8
	.xword	0xd74c0883f662d1ae
	.xword	0xfdddb616841412c2
	.xword	0x06b671e74d2f80b6
	.xword	0x76c773b550689981
	.xword	0xd06b946a35f0de30
	.xword	0x4e4723f5f5402db2
	.xword	0xe1c45ddc0b04cf46
	.xword	0x64c84c57dd75eaae
	.xword	0xeba2f1cb48da6788
	.xword	0x108150572b741415
	.xword	0x9d2a3ab18e81fc24
	.xword	0x1620a3f35c88d674
	.xword	0x96532a7ca803278b
	.xword	0x34bbd59ccd1b864a
	.xword	0x5c4d7c9f83d66e66
	.xword	0xee57d41fb7994b27
	.xword	0x47bed43c46976c81
	.xword	0x8e75f6ac496e945c
	.xword	0xbbf0e8ffdd54e396
	.xword	0x75c7c25ca3112edc
	.xword	0x57627d5fd10293f8
	.xword	0xa2ce757d076c697e
	.xword	0xa360c0e9cba02445
	.xword	0xa58aeb81925ac94b
	.xword	0x2d0068a4dbb446b6
	.xword	0x60b7e032fb016c97
	.xword	0xe8b443eb152a5eb9
	.xword	0x8e702abd992ab763
	.xword	0x9382a784e6354327
	.xword	0x6f3592087d5e5a9b
	.xword	0x1d011ed5a3461b50
	.xword	0x153e82a63516c110
	.xword	0x3cb68bc7d8259812
	.xword	0x198966e0f66216f9
	.xword	0xf88733fae28ba254
	.xword	0x78d74b2b8204a346
	.xword	0xb17afd2e5abf5b69
	.xword	0xcbc8b00b50ec4d88
	.xword	0xa2b83b0b100b78ee
	.xword	0x4658aa61ebe549bf
	.xword	0x01df0ca1c6e6832c
	.xword	0xf52f87911c5f5bbd
	.xword	0xc00062ad06f75a2c
	.xword	0x0be13d173c31c877
	.xword	0xc101dc2fbed6a41b
	.xword	0xb838ab222d6e3a21
	.xword	0xbe35407fec9112b8
	.xword	0x7712d196df125e25
	.xword	0x2c3928db38ece5d6
	.xword	0x0d586b5e5b7118bd
	.xword	0x5540a55a590bd7d3
	.xword	0x0cb791d9c618b41a
	.xword	0x112555b2ff2d3787
	.xword	0x42c06f8fbda8c824
	.xword	0xb59fc79e3acb0b81
	.xword	0x4caabe73d29aa96e
	.xword	0x9381551ca995e1b9
	.xword	0x36341801e743b0a3
	.xword	0x399cbd62b3e25012
	.xword	0x0e1e88797c452341
	.xword	0x2abcb9197b267a3c
	.xword	0x57866b94401d5fa2
	.xword	0x4d48a5a0a9af6905
	.xword	0x06347f98bfc9ec99
	.xword	0xeecdf50dd945ab05
	.xword	0x71163337626748ec
	.xword	0x99e63b6f8c6e6a1f
	.xword	0xef2fd12c67add25e
	.xword	0x0832f539e1b25bd0
	.xword	0xdc0c86229f5de599
	.xword	0xf385d58ffcb0842a
	.xword	0x53800ae2494348e8
	.xword	0x429eb510e77a97c4
	.xword	0xf54b95c53cb57b2e
	.xword	0x928b47067320dd42
	.xword	0xec6bc65d4403d806
	.xword	0x3da3bf7655b90aa9
	.xword	0x005859bc39f117bb
	.xword	0xd39d5f5d2ac72626
	.xword	0x96f4e574df081283
	.xword	0x51a680ff4f552801
	.xword	0x97e8a2feb2c24d26
	.xword	0xd38a8b03fa7ee5c3
	.xword	0xe938e6aa352c9e93
	.xword	0x1a38f8b4e862128c
	.xword	0xb0ad6e62a4344808
	.xword	0x8b0ef17562c842d5
	.xword	0x29fb02983642b1c0
	.xword	0x2c85b6b462279de4
	.xword	0x60ed7a2c38f4c23f
	.xword	0x38eb6f0babb8f75b
	.xword	0x348eea7742094a9f
	.xword	0x607f6680772148c4
	.xword	0x3244cbec236b6d73
	.xword	0xc8306ad72fcccff4
	.xword	0x4071b5f542e63b7a
	.xword	0x3b49d7ef61ecbd3d
	.xword	0x450abaf637c1d0a7
	.xword	0x60a95849e52ec254
	.xword	0xefb72546649f9e30
	.xword	0x7f57b330b3d326b3
	.xword	0xcc43e40b7d709440
	.xword	0xf765a12e27b57e0d
	.xword	0x01539fe974f97f87
	.xword	0xb7d135f975c0e4f4
	.xword	0xd0b40645b1b208bc
	.xword	0x912d2517b1f24e29
	.xword	0x3c44d956eafaf0e9
	.xword	0x658f509f0e38ebbd
	.xword	0x4c4f76e83defbaa9
	.xword	0xc5b9b73a01a0d6bf
	.xword	0xd82e846230cd0d84
	.xword	0x04b401a260aea0a3
	.xword	0xb5b34981a4ae4315
	.xword	0x623d3e2eae42f5e3
	.xword	0xc2bcd2733f245c11
	.xword	0xd4bcea7e95f0714c
	.xword	0xbc0fe6b753fa9973
	.xword	0xe92f10125f008c35
	.xword	0xf416a0b803d9773a
	.xword	0xbc85e11b7cafc19b
	.xword	0x091da34842513e46
	.xword	0x2bad221a1575ab9e
	.xword	0xb1c0953276c409a0
	.xword	0xc6c787046690a49e
	.xword	0xcf0a839410934c1e
	.xword	0xe2788e26f5527fe4
	.xword	0x8a772fce0a82d285
	.xword	0xd8d5fb431c4bd015
	.xword	0x841e70db01b0434f
	.xword	0x4b684a96f0165333
	.xword	0xd058474624a77ad6
	.xword	0x0b5f0e447cca8295
	.xword	0x82c56a06d79fd44b
	.xword	0x60b6fce148c3f138
	.xword	0xf345c04351f5cdda
	.xword	0x5d083987f1d947b5
	.xword	0x774a888ef570ddce
	.xword	0x6622b53ab6493f94
	.xword	0x526eebddded7d9ff
	.xword	0x6a2d751d345d32a1
	.xword	0x38948b44823a2b58
	.xword	0xe3919f8479bc05f1
	.xword	0x6d9caaf2d1825d48
	.xword	0x2b9a76f2d7886fac
	.xword	0xd91730de7c0c1f84
	.xword	0xc2429c595bcc50a6
	.xword	0xac0c08c49c059998
	.xword	0x5e7fdc8ee9e568c8
	.xword	0xdc276068da1718ba
	.xword	0xe59e638a13552124
	.xword	0x59566d38b15be07f
	.xword	0x9621045e58a98f66
	.xword	0x408e1929ccfd73a8
	.xword	0xe8b9cca428d6129a
	.xword	0x946adcc743cbb400
	.xword	0xcb22972200db654c
	.xword	0xac6492633a3bbdb8
	.xword	0xc78abcc82b1cdaa0
	.xword	0x4c0e0a49c68b5d0c
	.xword	0xcaec4401fae00fa3
	.xword	0x0e384a83d4564aba
	.xword	0xd3d7f4f789a7bf86
	.xword	0xb83bd24c06d7ca66
	.xword	0xc3a4e2a7c7608027
	.xword	0x36e39cc67cf543b0
	.xword	0x66e8a9fb4c8cf3a9
	.xword	0x2eb06297939eb28b
	.xword	0x06b084ce768cf1eb
	.xword	0xeec5ca92d8523d6d
	.xword	0x06b71f6a913e1ff0
	.xword	0xfd9d367616021efb

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
# 857 "diag.j"
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
	TTE_CP	 = 0,
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
	TTE_CV	 = 1,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
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
	TTE_CP	 = 0,
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
	.xword	0x2d2039a7611c7ffe
	.xword	0xacfdd5a44d01bace
	.xword	0xea04b2b1ad4b90e4
	.xword	0x08c0418ad90c0029
	.xword	0xff2f63631215c349
	.xword	0xd664fca771507ad8
	.xword	0x86a2cd528753556c
	.xword	0x7cfbca2e1315f9ac
	.xword	0xb4fbb4d962979411
	.xword	0xc335f0a33e19af7d
	.xword	0x41f8d2e9cdbe1ede
	.xword	0xfcb73781cbc6b831
	.xword	0xf806a9469042c2d8
	.xword	0x663f5a54d336ff99
	.xword	0xe53c203b869ba111
	.xword	0xcba1287fc7efe3ef
	.xword	0x991e3133ac70fb54
	.xword	0xbe010681871bddaa
	.xword	0xd871f7fe21f6fb0b
	.xword	0x9c8de64378004fa0
	.xword	0x6a38a4e07445edeb
	.xword	0x40c9af003a8f4d73
	.xword	0x9faf0c6c0dac668d
	.xword	0x9118a68459329665
	.xword	0x412bfb7cb72e3e57
	.xword	0x16a6ccbd5af1f474
	.xword	0x13a38ace4b148c0e
	.xword	0x96c7810e16a10b48
	.xword	0x6a55c33ad3de3215
	.xword	0xb84f5f20a3636082
	.xword	0xb2d26ddd396888da
	.xword	0xe0d304500c440134



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
	.xword	0x21805b916143fbf3
	.xword	0xde086f61df8d58b8
	.xword	0x9981a2ab0ead84e3
	.xword	0x0c2f1226c022c2ad
	.xword	0x982828c1663a0f01
	.xword	0xa51ff8c0a9628e40
	.xword	0x042308a28336481f
	.xword	0x7bd14fc9eeca358d
	.xword	0x5dd2093f82cdfbc1
	.xword	0x38ffc204412be612
	.xword	0x4e3fcae8769e4f67
	.xword	0x66cc8e7893278ed3
	.xword	0x4ab96365b7493466
	.xword	0xac2d102956abb417
	.xword	0x845903bd7fc27a40
	.xword	0x8a57ebc42e46719b
	.xword	0xc978236054a09fa7
	.xword	0xfd7d0e8afe15f874
	.xword	0xdd320a44762d2164
	.xword	0xb60938aec58b8e61
	.xword	0xcbf93cec1b201448
	.xword	0x91fe80bf3eff9ec1
	.xword	0xfb6a5237fb2e0c67
	.xword	0xd7f9811081384301
	.xword	0xf44bf625ed65ef17
	.xword	0x0dc43e4f5759737d
	.xword	0xd8d995b7809dcd11
	.xword	0x5913a0a3ef732856
	.xword	0x3d92eb82dfc3427b
	.xword	0xeaeebb38b96bb2ca
	.xword	0x8ef69917eaa507c0
	.xword	0xf312b6e4c97ab870



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
	.xword	0x13e40efb2db09995
	.xword	0xe9f96b0186a62e69
	.xword	0xbb6299b9cc00ba0e
	.xword	0x4ede207dace3118d
	.xword	0x53bdedbf81b209cc
	.xword	0xe463d442f5d5a57b
	.xword	0xfaddd8741ddb796f
	.xword	0xaafd15c72580230c
	.xword	0xbd85873158959742
	.xword	0xedb9b75f92f95ffa
	.xword	0x5702c123dae74547
	.xword	0xe2da34b15dd01ed9
	.xword	0x2ab46a60df2e7d49
	.xword	0xc371f8d8188c8acb
	.xword	0x9a127f79f1360396
	.xword	0x1aa1ab049879dac9
	.xword	0x8ea268bb78f60c59
	.xword	0x0b17f5486d340bbe
	.xword	0xf9b7a1bde7ffe716
	.xword	0xfa58a0e90e3acdcb
	.xword	0xf68761951506ecc9
	.xword	0x311a4dce4872fbaa
	.xword	0x1ca84008092a4f1d
	.xword	0xda8c2cd86f4980e3
	.xword	0x5d11d7574af54e1f
	.xword	0xb1d7b65b0d76854f
	.xword	0xee80f08d93eed7a5
	.xword	0xb80ccd13d10f80b7
	.xword	0x40a8e20d303c86c1
	.xword	0x9f6763d56dc856d1
	.xword	0x8428a7a27e0d2acd
	.xword	0x3b305ebfe9613ddc



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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
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
	.xword	0x93cbf876aa70aa51
	.xword	0x103910f113126fbb
	.xword	0x9f1d9d87b0a1a5e5
	.xword	0x1ddac7c82d351a80
	.xword	0xa6f3e52948b0b27e
	.xword	0xd3186177a3d5bc9f
	.xword	0x21f92217ee7a1715
	.xword	0xf4457b60a9819069
	.xword	0xd214aab110d6838a
	.xword	0x7773aee64e277ce7
	.xword	0xfaa98652775fa39d
	.xword	0x1eafd3a330e48c09
	.xword	0x2ac1287421906507
	.xword	0x856c94924ddfb8f8
	.xword	0x7cb7b43923e6cea7
	.xword	0xabdccafb723e622a
	.xword	0x4e8c1cf3014bf6ab
	.xword	0xe04cd560e10702e7
	.xword	0xdbaa6fabd36b19d1
	.xword	0xd715641eb6399bc5
	.xword	0xe2c29e6b57f96d1a
	.xword	0x5b64e74cbe9c5b66
	.xword	0x62b453082d07e43c
	.xword	0xe19f012393e11624
	.xword	0xb11cebf47537c8a3
	.xword	0x7c9f8c9760f6c207
	.xword	0x2f388778a80dd38b
	.xword	0xe0e11c4ddae10b7b
	.xword	0x0ecfb6a07f13f066
	.xword	0xaea58e34ca9f5303
	.xword	0xd05641ceaafaa915
	.xword	0xf275b686f0897e48





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
	TTE_W	 = 1
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
	TTE_W	 = 0
}

.text
nuff_said_1:
	fdivs %f0, %f4, %f4
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
	TTE_Size	 = 1,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
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
	TTE_W	 = 1
}

.text
nuff_said_3:
	fdivs %f0, %f4, %f6
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
	TTE_W	 = 1,
	TTE_X	 = 1
}

.text
.global vahole_target
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
.align 32
	nop
.align 16
	nop
vahole_target: ba vahole_target2
vahole_target1: nop
vahole_target2: nop





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
	TTE_CP	 = 1,
	TTE_CV	 = 0,
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
	TTE_Size	 = 5,
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
