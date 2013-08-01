/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_72.s
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
# 431 "diag.j"

#define H_HT0_Instruction_real_range_0x0e
#define SUN_H_HT0_Instruction_real_range_0x0e \
    HT_HANDLER_RAND4_1;\
    done;

#ifndef HT_HANDLER_RAND4_1  
#define HT_HANDLER_RAND4_1 mov 0x80, %l3;\
    b .+12;\
    stxa %l3, [%l3]0x57 ;\
    nop
#endif
	
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
# 443 "diag.j"
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

# 501 "diag.j"
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
    brnz %o1, init_start
    mov 0xff, %r10
lock_sync_thds:
    ta T_CHANGE_HPRIV
    set sync_thr_counter, %r23
    st %r10, [%r23]             !lock sync_thr_counter
    add %r23, 8, %r23
    st %r10, [%r23]             !lock sync_thr_counter1
    add %r23, 8, %r23
    st %r10, [%r23]             !lock sync_thr_counter2
    ta T_CHANGE_NONHPRIV
init_start:
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
	mov 0xb4, %r14
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
	mov 0x31, %r14
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
	mov 0xb2, %r14
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
	mov 0x30, %r14
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
	mov 0x33, %r30
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
	.word 0xa5a109d3  ! 1: FDIVd	fdivd	%f4, %f50, %f18
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
br_badelay3_80_0:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xcb47a55b	! Random illegal ?
	.word 0xd1120004  ! 1: LDQF_R	-	[%r8, %r4], %f8
	.word 0x95a30834  ! 1: FADDs	fadds	%f12, %f20, %f10
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_1
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_1:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 2: CASA_R	casa	[%r31] %asi, %r18, %r13
splash_hpstate_80_2:
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x81982145  ! 3: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0145, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_3:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 4: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x93d02032  ! 5: Tcc_I	tne	icc_or_xcc, %r0 + 50
jmptr_80_4:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 6: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xdb27c000  ! 7: STF_R	st	%f13, [%r0, %r31]
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 8: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_80_5:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d934010  ! 9: WRPR_WSTATE_R	wrpr	%r13, %r16, %wstate
	.word 0x93d020b3  ! 10: Tcc_I	tne	icc_or_xcc, %r0 + 179
pmu_80_6:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffbc8fffff3fd, %g1, %g7
	.word 0xa3800007  ! 11: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_80_7:
	set 0x60540000, %r31
	.word 0x8582e119  ! 12: WRCCR_I	wr	%r11, 0x0119, %ccr
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_8
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_8
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_8:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 13: RDPC	rd	%pc, %r19
pmu_80_9:
	nop
	setx 0xfffff971fffff4c3, %g1, %g7
	.word 0xa3800007  ! 14: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_10
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_10:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 15: RDPC	rd	%pc, %r17
mondo_80_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d94c014  ! 16: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
br_badelay3_80_12:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x9b5a8483	! Random illegal ?
	.word 0xa1a00554  ! 1: FSQRTd	fsqrt	
	.word 0xa3a50831  ! 17: FADDs	fadds	%f20, %f17, %f17
dvapa_80_13:
	nop
	ta T_CHANGE_HPRIV
	mov 0xca3, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd8bfc031  ! 18: STDA_R	stda	%r12, [%r31 + %r17] 0x01
tagged_80_14:
	tsubcctv %r1, 0x1296, %r18
	.word 0xd807e0c4  ! 19: LDUW_I	lduw	[%r31 + 0x00c4], %r12
	.word 0xe1bfe040  ! 20: STDFA_I	stda	%f16, [0x0040, %r31]
splash_hpstate_80_15:
	ta T_CHANGE_NONHPRIV
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x81982847  ! 21: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0847, %hpstate
	.word 0xd8d7e038  ! 22: LDSHA_I	ldsha	[%r31, + 0x0038] %asi, %r12
intveclr_80_16:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9f8087c45b725017, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 23: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_17
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_17:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 24: RDPC	rd	%pc, %r19
splash_htba_80_18:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 25: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
br_longdelay2_80_19:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x24ccc001  ! 26: BRLEZ	brlez,a,pt	%r19,<label_0xcc001>
br_longdelay1_80_20:
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0x9d97c000  ! 27: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xb1800011  ! 28: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x87aa8a43  ! 29: FCMPd	fcmpd	%fcc<n>, %f10, %f34
	.word 0x93d020b4  ! 30: Tcc_I	tne	icc_or_xcc, %r0 + 180
splash_tba_80_21:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 31: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_80_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d92c014  ! 32: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
	.word 0x20700001  ! 33: BPN	<illegal instruction>
	.word 0x91952656  ! 34: WRPR_PIL_I	wrpr	%r20, 0x0656, %pil
	.word 0x83d02033  ! 35: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x9f802daa  ! 36: SIR	sir	0x0daa
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_23
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_23:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 37: RDPC	rd	%pc, %r18
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_24
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_24:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 38: RDPC	rd	%pc, %r11
jmptr_80_25:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 39: JMPL_R	jmpl	%r27 + %r0, %r27
ibp_80_26:
	nop
	ta T_CHANGE_HPRIV
	.word 0xd03ff72a  ! 40: STD_I	std	%r8, [%r31 + 0xfffff72a]
	setx 0x07e4c2c9857f3e39, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_27:
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903abf  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x1abf, %pstate
	.word 0xd06fe03c  ! 43: LDSTUB_I	ldstub	%r8, [%r31 + 0x003c]
trapasi_80_29:
mov 0x28, %r1 ! (VA for ASI 0x5b) 
	.word 0xd0d84b00  ! 44: LDXA_R	ldxa	[%r1, %r0] 0x58, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_30
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_30:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 45: RDPC	rd	%pc, %r17
fpinit_80_31:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 46: FDIVd	fdivd	%f0, %f4, %f4
memptr_80_32:
	set 0x60740000, %r31
	.word 0x85847221  ! 47: WRCCR_I	wr	%r17, 0x1221, %ccr
mondo_80_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d92800d  ! 48: WRPR_WSTATE_R	wrpr	%r10, %r13, %wstate
	.word 0x91948008  ! 49: WRPR_PIL_R	wrpr	%r18, %r8, %pil
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_35:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 50: CASA_R	casa	[%r31] %asi, %r9, %r12
donret_80_36:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_36-donret_80_36-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0061b223 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x8c5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	retry
donretarg_80_36:
	.word 0xd8ffe0b4  ! 51: SWAPA_I	swapa	%r12, [%r31 + 0x00b4] %asi
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
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
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_37:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 52: RDPC	rd	%pc, %r17
mondo_80_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d94c013  ! 53: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	setx 0xff6c523ecb8e505d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_39:
	.word 0x39400001  ! 54: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_40
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_40:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 55: RDPC	rd	%pc, %r19
	.word 0xa7a449c1  ! 56: FDIVd	fdivd	%f48, %f32, %f50
	.word 0xa9480000  ! 57: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xa1a489c7  ! 58: FDIVd	fdivd	%f18, %f38, %f16
fpinit_80_41:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82d6b  ! 59: PREFETCHA_I	prefetcha	[%r0, + 0x0d6b] %asi, #one_read
	.word 0x9f802a65  ! 60: SIR	sir	0x0a65
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_42:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e002  ! 61: CASA_R	casa	[%r31] %asi, %r2, %r12
br_badelay2_80_43:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f14, %f30, %f18
	.word 0xa7b34314  ! 62: ALIGNADDRESS	alignaddr	%r13, %r20, %r19
	.word 0x8d802000  ! 63: WRFPRS_I	wr	%r0, 0x0000, %fprs
br_longdelay1_80_44:
	.word 0x26cc0001  ! 1: BRLZ	brlz,a,pt	%r16,<label_0xc0001>
	.word 0xbfefc000  ! 64: RESTORE_R	restore	%r31, %r0, %r31
	setx 0x08775cb9569fa0b1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_45:
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe53fc000  ! 66: STDF_R	std	%f18, [%r0, %r31]
	.word 0xe49fc02d  ! 67: LDDA_R	ldda	[%r31, %r13] 0x01, %r18
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
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_47:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 68: RDPC	rd	%pc, %r17
	.word 0xb1800011  ! 69: WR_STICK_REG_R	wr	%r0, %r17, %-
splash_hpstate_80_48:
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x81982f9f  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9f, %hpstate
intveclr_80_49:
	nop
	ta T_CHANGE_HPRIV
	setx 0x82a610f80fb407c7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 71: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe03fe0a2  ! 72: STD_I	std	%r16, [%r31 + 0x00a2]
splash_lsu_80_50:
	nop
	ta T_CHANGE_HPRIV
	set 0x5d80d1e7, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 73: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe137e001  ! 74: STQF_I	-	%f16, [0x0001, %r31]
	.word 0xe19fc2c0  ! 75: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe057e010  ! 76: LDSH_I	ldsh	[%r31 + 0x0010], %r16
splash_cmpr_80_51:
	nop
	setx 0xf095e88dfc337adc, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 77: WRPR_TICK_R	wrpr	%r0, %r17, %tick
splash_lsu_80_52:
	nop
	ta T_CHANGE_HPRIV
	set 0x29347f18, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 78: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_badelay2_80_53:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f2, %f18, %f26
	.word 0xa1b14311  ! 79: ALIGNADDRESS	alignaddr	%r5, %r17, %r16
	.word 0xe1bfe060  ! 80: STDFA_I	stda	%f16, [0x0060, %r31]
splash_cmpr_80_54:
	nop
	setx 0x64e8797ef836ad1b, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 81: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0xa7a0016a  ! 82: FABSq	dis not found

	.word 0xdb3fc002  ! 83: STDF_R	std	%f13, [%r2, %r31]
	.word 0xda3fe43c  ! 84: STD_I	std	%r13, [%r31 + 0x043c]
invtsb_80_57:
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
	.word 0x29800001  ! 85: FBL	fbl,a	<label_0x1>
memptr_80_58:
	set 0x60740000, %r31
	.word 0x8580a672  ! 86: WRCCR_I	wr	%r2, 0x0672, %ccr
	.word 0x919462a4  ! 87: WRPR_PIL_I	wrpr	%r17, 0x02a4, %pil
	.word 0x91d020b5  ! 88: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_tba_80_59:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 89: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe1bfd960  ! 90: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9f80269d  ! 91: SIR	sir	0x069d
	.word 0xda6fe08d  ! 92: LDSTUB_I	ldstub	%r13, [%r31 + 0x008d]
	.word 0xda47e018  ! 93: LDSW_I	ldsw	[%r31 + 0x0018], %r13
br_longdelay1_80_60:
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 94: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc30fc000  ! 95: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
jmptr_80_62:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 96: JMPL_R	jmpl	%r27 + %r0, %r27
br_badelay2_80_63:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa3b3030c  ! 97: ALIGNADDRESS	alignaddr	%r12, %r12, %r17
mondo_80_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d918013  ! 98: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
	.word 0xe1bfe000  ! 99: STDFA_I	stda	%f16, [0x0000, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_65:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_80_66:
	nop
	ta T_CHANGE_HPRIV
	setx 0x93ad7ebf3b917f62, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 101: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_80_67:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9ce, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdadfc029  ! 102: LDXA_R	ldxa	[%r31, %r9] 0x01, %r13
trapasi_80_68:
mov 0x8, %r1 ! (VA for ASI 0x5b) 
	.word 0xdac844a0  ! 103: LDSBA_R	ldsba	[%r1, %r0] 0x25, %r13
	.word 0xe19fc2c0  ! 104: LDDFA_R	ldda	[%r31, %r0], %f16
brcommon_80_69:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xdadfc029  ! 105: LDXA_R	ldxa	[%r31, %r9] 0x01, %r13
mondo_80_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d94c003  ! 106: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_71:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 107: CASA_R	casa	[%r31] %asi, %r16, %r13
	.word 0xdb27e098  ! 108: STF_I	st	%f13, [0x0098, %r31]
	.word 0xdabfc030  ! 109: STDA_R	stda	%r13, [%r31 + %r16] 0x01
	.word 0xa3b4c490  ! 110: FCMPLE32	fcmple32	%d50, %d16, %r17
change_to_randtl_80_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_73:
	.word 0x8f902002  ! 111: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd20fe010  ! 112: LDUB_I	ldub	[%r31 + 0x0010], %r9
splash_lsu_80_74:
	nop
	ta T_CHANGE_HPRIV
	set 0x8cc1e008, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 113: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_longdelay2_80_75:
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0xa7a4c9c5  ! 114: FDIVd	fdivd	%f50, %f36, %f50
	.word 0xb1800011  ! 115: WR_STICK_REG_R	wr	%r0, %r17, %-
ibp_80_76:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe11fc001  ! 116: LDDF_R	ldd	[%r31, %r1], %f16
change_to_randtl_80_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_77:
	.word 0x8f902002  ! 117: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_78) + 48, 16, 16)) -> intp(3,0,21)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_78)&0xffffffff)  + 48, 16, 16)) -> intp(3,0,21)
intvec_80_78:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91950011  ! 119: WRPR_PIL_R	wrpr	%r20, %r17, %pil
	.word 0x9f802936  ! 120: SIR	sir	0x0936
	.word 0xc1bfe080  ! 121: STDFA_I	stda	%f0, [0x0080, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_80:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 122: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xd88fe010  ! 123: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_81
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_81:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 124: RDPC	rd	%pc, %r16
fpinit_80_82:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 125: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xb1800011  ! 126: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xe63fe970  ! 127: STD_I	std	%r19, [%r31 + 0x0970]
	.word 0xe737e040  ! 128: STQF_I	-	%f19, [0x0040, %r31]
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x8d903930  ! 129: WRPR_PSTATE_I	wrpr	%r0, 0x1930, %pstate
trapasi_80_85:
mov 0x0, %r1 ! (VA for ASI 0x4c) 
	.word 0xe6d84e60  ! 130: LDXA_R	ldxa	[%r1, %r0] 0x73, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_86) + 16, 16, 16)) -> intp(3,0,20)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_86)&0xffffffff)  + 16, 16, 16)) -> intp(3,0,20)
intvec_80_86:
	.word 0x39400001  ! 131: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_80_87:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d928014  ! 132: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
splash_hpstate_80_88:
	.word 0x81982086  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0086, %hpstate
	.word 0xe19fe060  ! 134: LDDFA_I	ldda	[%r31, 0x0060], %f16
	.word 0x91a509b3  ! 135: FDIVs	fdivs	%f20, %f19, %f8
	.word 0x95a089d4  ! 136: FDIVd	fdivd	%f2, %f20, %f10
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 137: Tcc_R	tne	icc_or_xcc, %r0 + %r30
br_longdelay3_80_90:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902005  ! 138: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
fpinit_80_91:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82812  ! 139: PREFETCHA_I	prefetcha	[%r0, + 0x0812] %asi, #one_read
	.word 0xa7a409d4  ! 140: FDIVd	fdivd	%f16, %f20, %f50
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x8d90371a  ! 142: WRPR_PSTATE_I	wrpr	%r0, 0x171a, %pstate
tglhtw_80_93:
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
	.word 0x93b40994  ! 143: BSHUFFLE	fmovc32	%d16, %d20, %d40
trapasi_80_94:
mov 0x8, %r1 ! (VA for ASI 0x5a) 
	.word 0xd6c84b40  ! 144: LDSBA_R	ldsba	[%r1, %r0] 0x5a, %r11
	.word 0xa3a00162  ! 145: FABSq	dis not found

br_longdelay1_80_95:
	.word 0x2acc0001  ! 1: BRNZ	brnz,a,pt	%r16,<label_0xc0001>
	.word 0xbfe7c000  ! 146: SAVE_R	save	%r31, %r0, %r31
	.word 0xd6bfe076  ! 147: STDA_I	stda	%r11, [%r31 + 0x0076] %asi
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 148: Tcc_R	tne	icc_or_xcc, %r0 + %r30
br_longdelay1_80_96:
	.word 0x24c84001  ! 1: BRLEZ	brlez,a,pt	%r1,<label_0x84001>
	.word 0xbfefc000  ! 149: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02033  ! 150: Tcc_I	ta	icc_or_xcc, %r0 + 51
jmptr_80_97:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 151: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_80_98:
	nop
	setx 0xffffff19fffffde8, %g1, %g7
	.word 0xa3800007  ! 152: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_80_99:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 153: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_80_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d944014  ! 154: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81460000  ! 156: RD_STICK_REG	stbar
splash_cmpr_80_101:
	nop
	setx 0x9c2b44c1c77b9cd7, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 157: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x9f8032d4  ! 158: SIR	sir	0x12d4
brcommon_80_102:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xd6dfc02a  ! 159: LDXA_R	ldxa	[%r31, %r10] 0x01, %r11
pmu_80_103:
	nop
	setx 0xffffff62fffff2b8, %g1, %g7
	.word 0xa3800007  ! 160: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe1bfe020  ! 161: STDFA_I	stda	%f16, [0x0020, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_104) + 0, 16, 16)) -> intp(4,0,15)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_104)&0xffffffff)  + 0, 16, 16)) -> intp(4,0,15)
intvec_80_104:
	.word 0x39400001  ! 162: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a409d4  ! 163: FDIVd	fdivd	%f16, %f20, %f16
	.word 0x8d903ccf  ! 164: WRPR_PSTATE_I	wrpr	%r0, 0x1ccf, %pstate
jmptr_80_106:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 165: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_80_107:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf35, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd31fc014  ! 166: LDDF_R	ldd	[%r31, %r20], %f9
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 167: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0xa1a0c9d4  ! 168: FDIVd	fdivd	%f34, %f20, %f16
	.word 0x99a509d4  ! 169: FDIVd	fdivd	%f20, %f20, %f12
dvapa_80_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcd5, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc003  ! 170: STXFSR_R	st-sfr	%f1, [%r3, %r31]
mondo_80_110:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d94c012  ! 171: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	.word 0xe05fe038  ! 172: LDX_I	ldx	[%r31 + 0x0038], %r16
	.word 0xab818013  ! 173: WR_CLEAR_SOFTINT_R	wr	%r6, %r19, %clear_softint
intveclr_80_111:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0f36768460364508, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 174: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5a00165  ! 175: FABSq	dis not found

	.word 0xb1800011  ! 176: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xe1bfc3e0  ! 177: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xb1800011  ! 178: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xa9a489d0  ! 179: FDIVd	fdivd	%f18, %f16, %f20
	.word 0x91d02034  ! 180: Tcc_I	ta	icc_or_xcc, %r0 + 52
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_112:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 181: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x2a700001  ! 182: BPCS	<illegal instruction>
	.word 0x8d903722  ! 183: WRPR_PSTATE_I	wrpr	%r0, 0x1722, %pstate
	.word 0x91950005  ! 184: WRPR_PIL_R	wrpr	%r20, %r5, %pil
donret_80_115:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_115-donret_80_115-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c62f90 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x356, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_115:
	.word 0xd0ffe0ca  ! 185: SWAPA_I	swapa	%r8, [%r31 + 0x00ca] %asi
	.word 0xc1bfdb60  ! 186: STDFA_R	stda	%f0, [%r0, %r31]
splash_cmpr_80_116:
	nop
	setx 0x0f9fcf27446f7b9c, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 187: WRPR_TICK_R	wrpr	%r0, %r17, %tick
trapasi_80_117:
mov 0x28, %r1 ! (VA for ASI 0x4c) 
	.word 0xd0c84b60  ! 188: LDSBA_R	ldsba	[%r1, %r0] 0x5b, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_118
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_118:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 189: RDPC	rd	%pc, %r13
	.word 0xe827e096  ! 190: STW_I	stw	%r20, [%r31 + 0x0096]
    set 0x1d23, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b447cc  ! 191: PDIST	pdistn	%d48, %d12, %d10
	.word 0xa5450000  ! 192: RD_SET_SOFTINT	rd	%set_softint, %r18
	.word 0xc1bfda00  ! 193: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe81fc000  ! 194: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0xe857e008  ! 195: LDSH_I	ldsh	[%r31 + 0x0008], %r20
	.word 0x95b4048d  ! 196: FCMPLE32	fcmple32	%d16, %d44, %r10
	.word 0xe19fde00  ! 197: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f802a07  ! 198: SIR	sir	0x0a07
	.word 0xb1800011  ! 199: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x9f80216d  ! 200: SIR	sir	0x016d
jmptr_80_119:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 201: JMPL_R	jmpl	%r27 + %r0, %r27
br_longdelay3_80_120:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902005  ! 202: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xe19fda00  ! 203: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd437e0d6  ! 204: STH_I	sth	%r10, [%r31 + 0x00d6]
splash_tba_80_121:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 205: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_80_122:
	tsubcctv %r2, 0x17b7, %r10
	.word 0xd407e0c4  ! 206: LDUW_I	lduw	[%r31 + 0x00c4], %r10
	.word 0x9f803a9f  ! 207: SIR	sir	0x1a9f
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_123
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_123:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 208: CASA_R	casa	[%r31] %asi, %r10, %r10
jmptr_80_124:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 209: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa550c000  ! 210: RDPR_TT	rdpr	%tt, %r18
	.word 0xe137c000  ! 211: STQF_R	-	%f16, [%r0, %r31]
intveclr_80_125:
	nop
	ta T_CHANGE_HPRIV
	setx 0x848a4bbd24bf5651, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 212: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_80_126:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc46a5ac216ea6a04, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 213: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x32700001  ! 214: BPNE	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r16
br_longdelay3_80_127:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902004  ! 216: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
splash_lsu_80_128:
	nop
	ta T_CHANGE_HPRIV
	set 0xe0f39cc8, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_129:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 218: CASA_R	casa	[%r31] %asi, %r10, %r16
pmu_80_130:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffbb5fffff2a6, %g1, %g7
	.word 0xa3800007  ! 219: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9194400a  ! 220: WRPR_PIL_R	wrpr	%r17, %r10, %pil
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 221: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97a1c9aa  ! 222: FDIVs	fdivs	%f7, %f10, %f11
intveclr_80_132:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8337441f7c3be271, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_80_133:
	ta T_CHANGE_NONHPRIV
	.word 0x819821c6  ! 224: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c6, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_134)+56, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_134)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_134:
	.word 0xa982b528  ! 225: WR_SET_SOFTINT_I	wr	%r10, 0x1528, %set_softint
	.word 0x95520000  ! 226: RDPR_PIL	<illegal instruction>
pmu_80_135:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff285fffff5d8, %g1, %g7
	.word 0xa3800007  ! 227: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f8026f4  ! 228: SIR	sir	0x06f4
	.word 0xe537c000  ! 229: STQF_R	-	%f18, [%r0, %r31]
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 230: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97b087d2  ! 231: PDIST	pdistn	%d2, %d18, %d42
splash_hpstate_80_136:
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x8198219c  ! 232: WRHPR_HPSTATE_I	wrhpr	%r0, 0x019c, %hpstate
	setx 0x06c75813e0be68c3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_137:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 234: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb1800011  ! 235: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xd80fe038  ! 236: LDUB_I	ldub	[%r31 + 0x0038], %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_138
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_138
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_138:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 237: RDPC	rd	%pc, %r18
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 238: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_139
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_139:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 239: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0xe71fc000  ! 240: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x81460000  ! 241: RD_STICK_REG	stbar
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_140
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_140:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 242: RDPC	rd	%pc, %r13
	.word 0x93d020b3  ! 243: Tcc_I	tne	icc_or_xcc, %r0 + 179
trapasi_80_141:
mov 0x3f8, %r1 ! (VA for ASI 0x25) 
	.word 0xe0c04b00  ! 244: LDSWA_R	ldswa	[%r1, %r0] 0x58, %r16
	.word 0xa1a00170  ! 245: FABSq	dis not found

	.word 0x91d020b5  ! 246: Tcc_I	ta	icc_or_xcc, %r0 + 181
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 247: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_80_142:
	nop
	ta T_CHANGE_HPRIV
	set 0x461074c4, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 248: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_80_143:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff10efffff77f, %g1, %g7
	.word 0xa3800007  ! 249: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe1bfe020  ! 250: STDFA_I	stda	%f16, [0x0020, %r31]
	.word 0xb1800011  ! 251: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x91d02033  ! 252: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe1bfdc00  ! 253: STDFA_R	stda	%f16, [%r0, %r31]
memptr_80_144:
	set user_data_start, %r31
	.word 0x858533da  ! 254: WRCCR_I	wr	%r20, 0x13da, %ccr
fpinit_80_145:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 255: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0x8d903911  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x1911, %pstate
	.word 0xe527e06c  ! 257: STF_I	st	%f18, [0x006c, %r31]
splash_lsu_80_147:
	nop
	ta T_CHANGE_HPRIV
	set 0x2c98f77a, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 258: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe080  ! 259: STDFA_I	stda	%f16, [0x0080, %r31]
mondo_80_148:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d94c006  ! 260: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
	.word 0x93480000  ! 261: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
brcommon_80_149:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xe4bfc034  ! 262: STDA_R	stda	%r18, [%r31 + %r20] 0x01
	.word 0x91a0016b  ! 263: FABSq	dis not found

	.word 0xa7b4c7c2  ! 264: PDIST	pdistn	%d50, %d2, %d50
	.word 0xe827e0f1  ! 265: STW_I	stw	%r20, [%r31 + 0x00f1]
	.word 0xe8cfe020  ! 266: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r20
	.word 0x24cc8001  ! 267: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
memptr_80_150:
	set user_data_start, %r31
	.word 0x85812e7a  ! 268: WRCCR_I	wr	%r4, 0x0e7a, %ccr
splash_lsu_80_151:
	nop
	ta T_CHANGE_HPRIV
	set 0x62772d04, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd43fe0d5  ! 270: STD_I	std	%r10, [%r31 + 0x00d5]
	.word 0x99b407c9  ! 271: PDIST	pdistn	%d16, %d40, %d12
	.word 0xab84c012  ! 272: WR_CLEAR_SOFTINT_R	wr	%r19, %r18, %clear_softint
pmu_80_152:
	nop
	setx 0xfffff33efffff889, %g1, %g7
	.word 0xa3800007  ! 273: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_80_153:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf76, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe43ff85d  ! 274: STD_I	std	%r18, [%r31 + 0xfffff85d]
	.word 0xc3ec402b  ! 275: PREFETCHA_R	prefetcha	[%r17, %r11] 0x01, #one_read
jmptr_80_154:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 276: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe19fda00  ! 277: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f8034ab  ! 278: SIR	sir	0x14ab
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
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
	.word 0xdbe7e010  ! 279: CASA_R	casa	[%r31] %asi, %r16, %r13
splash_tba_80_156:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 280: WRPR_TBA_R	wrpr	%r0, %r12, %tba
pmu_80_157:
	nop
	setx 0xfffff7b4fffff5b8, %g1, %g7
	.word 0xa3800007  ! 281: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_80_158:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d950012  ! 282: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_159
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_159:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 283: RDPC	rd	%pc, %r19
	.word 0x91a00171  ! 284: FABSq	dis not found

jmptr_80_160:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 285: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_80_161:
	nop
	ta T_CHANGE_HPRIV
	setx 0x6758418cedcaf7a9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 286: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9a309a2  ! 287: FDIVs	fdivs	%f12, %f2, %f20
	.word 0x8d903903  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x1903, %pstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_163:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 289: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0x93a409d3  ! 290: FDIVd	fdivd	%f16, %f50, %f40
	.word 0x91944012  ! 291: WRPR_PIL_R	wrpr	%r17, %r18, %pil
	.word 0xe1bfc2c0  ! 292: STDFA_R	stda	%f16, [%r0, %r31]
donret_80_165:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_165-donret_80_165-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007f21d7 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x756, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	done
donretarg_80_165:
	.word 0xd6ffe029  ! 293: SWAPA_I	swapa	%r11, [%r31 + 0x0029] %asi
br_longdelay1_80_166:
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x9d97c000  ! 294: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xc19fe020  ! 295: LDDFA_I	ldda	[%r31, 0x0020], %f0
	setx 0xfe60999c06d81bea, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_167:
	.word 0x39400001  ! 296: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_80_168:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9134801964ea8b9e, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 297: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 298: BL	bl,a	<label_0x1>
jmptr_80_169:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 299: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_170:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 300: CASA_R	casa	[%r31] %asi, %r8, %r11
	.word 0xd697e018  ! 301: LDUHA_I	lduha	[%r31, + 0x0018] %asi, %r11
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
br_badelay3_40_0:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xfb6c467e	! Random illegal ?
	.word 0xe3130012  ! 1: LDQF_R	-	[%r12, %r18], %f17
	.word 0xa1a40825  ! 1: FADDs	fadds	%f16, %f5, %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_1
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_1:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 2: CASA_R	casa	[%r31] %asi, %r18, %r13
splash_hpstate_40_2:
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0x81982c4c  ! 3: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4c, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_3:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 4: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x91d02034  ! 5: Tcc_I	ta	icc_or_xcc, %r0 + 52
jmptr_40_4:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 6: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xdb27c000  ! 7: STF_R	st	%f13, [%r0, %r31]
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 8: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_40_5:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d90c012  ! 9: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
	.word 0x91d02034  ! 10: Tcc_I	ta	icc_or_xcc, %r0 + 52
pmu_40_6:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff7bcfffffc2d, %g1, %g7
	.word 0xa3800007  ! 11: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_40_7:
	set 0x60540000, %r31
	.word 0x858462f4  ! 12: WRCCR_I	wr	%r17, 0x02f4, %ccr
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_8
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_8
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_8:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 13: RDPC	rd	%pc, %r13
pmu_40_9:
	nop
	setx 0xfffff99bffffff8f, %g1, %g7
	.word 0xa3800007  ! 14: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_10
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_10:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 15: RDPC	rd	%pc, %r17
mondo_40_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d920014  ! 16: WRPR_WSTATE_R	wrpr	%r8, %r20, %wstate
br_badelay3_40_12:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xed658824	! Random illegal ?
	.word 0xa7a00549  ! 1: FSQRTd	fsqrt	
	.word 0x91a18834  ! 17: FADDs	fadds	%f6, %f20, %f8
dvapa_40_13:
	nop
	ta T_CHANGE_HPRIV
	mov 0x90e, %r20
	mov 0x5, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd91fc011  ! 18: LDDF_R	ldd	[%r31, %r17], %f12
tagged_40_14:
	tsubcctv %r3, 0x1442, %r11
	.word 0xd807e072  ! 19: LDUW_I	lduw	[%r31 + 0x0072], %r12
	.word 0xe1bfe080  ! 20: STDFA_I	stda	%f16, [0x0080, %r31]
splash_hpstate_40_15:
	ta T_CHANGE_NONHPRIV
	.word 0x22cc8001  ! 1: BRZ	brz,a,pt	%r18,<label_0xc8001>
	.word 0x819825a5  ! 21: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05a5, %hpstate
	.word 0xd8d7e010  ! 22: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r12
intveclr_40_16:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf798b36ba22202ac, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 23: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_17
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_17:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 24: RDPC	rd	%pc, %r19
splash_htba_40_18:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 25: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
br_longdelay2_40_19:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe23c8007  ! 26: STD_R	std	%r17, [%r18 + %r7]
br_longdelay1_40_20:
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0xbfefc000  ! 27: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xb1800011  ! 28: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xa5a149d2  ! 29: FDIVd	fdivd	%f36, %f18, %f18
	.word 0x83d02035  ! 30: Tcc_I	te	icc_or_xcc, %r0 + 53
splash_tba_40_21:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 31: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_40_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d908012  ! 32: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
	.word 0x20700001  ! 33: BPN	<illegal instruction>
	.word 0x9191ef3e  ! 34: WRPR_PIL_I	wrpr	%r7, 0x0f3e, %pil
	.word 0x83d02034  ! 35: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x9f803e25  ! 36: SIR	sir	0x1e25
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_23
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_23:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 37: RDPC	rd	%pc, %r19
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_24
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_24:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 38: RDPC	rd	%pc, %r13
jmptr_40_25:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 39: JMPL_R	jmpl	%r27 + %r0, %r27
ibp_40_26:
	nop
	ta T_CHANGE_HPRIV
	.word 0xd13fc002  ! 40: STDF_R	std	%f8, [%r2, %r31]
	setx 0x7059626e2a8bd57e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_27:
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902239  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x0239, %pstate
	.word 0xd06fe001  ! 43: LDSTUB_I	ldstub	%r8, [%r31 + 0x0001]
trapasi_40_29:
mov 0x28, %r1 ! (VA for ASI 0x5b) 
	.word 0xd0c84b40  ! 44: LDSBA_R	ldsba	[%r1, %r0] 0x5a, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_30
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_30:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 45: RDPC	rd	%pc, %r12
fpinit_40_31:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 46: FCMPd	fcmpd	%fcc<n>, %f0, %f4
memptr_40_32:
	set 0x60340000, %r31
	.word 0x858121a1  ! 47: WRCCR_I	wr	%r4, 0x01a1, %ccr
mondo_40_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d94c002  ! 48: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
	.word 0x9190c011  ! 49: WRPR_PIL_R	wrpr	%r3, %r17, %pil
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_35:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 50: CASA_R	casa	[%r31] %asi, %r9, %r12
donret_40_36:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_36-donret_40_36-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00bca65f | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x797, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	retry
donretarg_40_36:
	.word 0xd8ffe0aa  ! 51: SWAPA_I	swapa	%r12, [%r31 + 0x00aa] %asi
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
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
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_37:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 52: RDPC	rd	%pc, %r8
mondo_40_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d950013  ! 53: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
	setx 0x55f31c0482e36ce1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_39:
	.word 0x39400001  ! 54: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_40
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_40:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 55: RDPC	rd	%pc, %r19
	.word 0x91a189d2  ! 56: FDIVd	fdivd	%f6, %f18, %f8
	.word 0x97480000  ! 57: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xa9b407c5  ! 58: PDIST	pdistn	%d16, %d36, %d20
fpinit_40_41:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 59: FDIVd	fdivd	%f0, %f4, %f6
	.word 0x9f803c37  ! 60: SIR	sir	0x1c37
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_42:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e002  ! 61: CASA_R	casa	[%r31] %asi, %r2, %r12
br_badelay2_40_43:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f2, %f14, %f6
	.word 0x95b4830c  ! 62: ALIGNADDRESS	alignaddr	%r18, %r12, %r10
	.word 0x8d802000  ! 63: WRFPRS_I	wr	%r0, 0x0000, %fprs
br_longdelay1_40_44:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9d97c000  ! 64: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	setx 0x17444f20c0de16d5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_45:
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe53fc000  ! 66: STDF_R	std	%f18, [%r0, %r31]
vahole_40_46:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe49fc02d  ! 67: LDDA_R	ldda	[%r31, %r13] 0x01, %r18
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
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_47:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 68: RDPC	rd	%pc, %r11
	.word 0xb1800011  ! 69: WR_STICK_REG_R	wr	%r0, %r17, %-
splash_hpstate_40_48:
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x81982807  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0807, %hpstate
intveclr_40_49:
	nop
	ta T_CHANGE_HPRIV
	setx 0x962cacdd6894bb8d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 71: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe03fe030  ! 72: STD_I	std	%r16, [%r31 + 0x0030]
splash_lsu_40_50:
	nop
	ta T_CHANGE_HPRIV
	set 0xb1d9ea98, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 73: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe137e097  ! 74: STQF_I	-	%f16, [0x0097, %r31]
	.word 0xc1bfe040  ! 75: STDFA_I	stda	%f0, [0x0040, %r31]
	.word 0xe057e000  ! 76: LDSH_I	ldsh	[%r31 + 0x0000], %r16
splash_cmpr_40_51:
	nop
	setx 0xcca1acfcf3222734, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 77: WRPR_TICK_R	wrpr	%r0, %r17, %tick
splash_lsu_40_52:
	nop
	ta T_CHANGE_HPRIV
	set 0x2ee59d35, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 78: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_badelay2_40_53:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f16, %f18, %f30
	.word 0x95b28314  ! 79: ALIGNADDRESS	alignaddr	%r10, %r20, %r10
	.word 0xe1bfda00  ! 80: STDFA_R	stda	%f16, [%r0, %r31]
splash_cmpr_40_54:
	nop
	setx 0xab1dd1fbf30c3a4d, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 81: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x97a00167  ! 82: FABSq	dis not found

vahole_40_55:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xdb3fc002  ! 83: STDF_R	std	%f13, [%r2, %r31]
vahole_40_56:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xdb3fc002  ! 84: STDF_R	std	%f13, [%r2, %r31]
invtsb_40_57:
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
	.word 0x29800001  ! 85: FBL	fbl,a	<label_0x1>
memptr_40_58:
	set 0x60740000, %r31
	.word 0x8581ba0b  ! 86: WRCCR_I	wr	%r6, 0x1a0b, %ccr
	.word 0x9191a65d  ! 87: WRPR_PIL_I	wrpr	%r6, 0x065d, %pil
	.word 0x91d02035  ! 88: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_tba_40_59:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 89: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xc1bfe020  ! 90: STDFA_I	stda	%f0, [0x0020, %r31]
	.word 0x9f80399b  ! 91: SIR	sir	0x199b
	.word 0xda6fe0dd  ! 92: LDSTUB_I	ldstub	%r13, [%r31 + 0x00dd]
	.word 0xda47e030  ! 93: LDSW_I	ldsw	[%r31 + 0x0030], %r13
br_longdelay1_40_60:
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0xbfe7c000  ! 94: SAVE_R	save	%r31, %r0, %r31
	brlz,pn  	%r12, skip_40_61
	.word 0x9f802cf9  ! 1: SIR	sir	0x0cf9
.align 32
skip_40_61:
	.word 0xc30fc000  ! 95: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
jmptr_40_62:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 96: JMPL_R	jmpl	%r27 + %r0, %r27
br_badelay2_40_63:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa5b18314  ! 97: ALIGNADDRESS	alignaddr	%r6, %r20, %r18
mondo_40_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d90c006  ! 98: WRPR_WSTATE_R	wrpr	%r3, %r6, %wstate
	.word 0xc1bfc3e0  ! 99: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_65:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_40_66:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc8b41f3653de00dd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 101: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_40_67:
	nop
	ta T_CHANGE_HPRIV
	mov 0xff5, %r20
	mov 0x5, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdb1fc009  ! 102: LDDF_R	ldd	[%r31, %r9], %f13
trapasi_40_68:
mov 0x20, %r1 ! (VA for ASI 0x5b) 
	.word 0xdad04b40  ! 103: LDSHA_R	ldsha	[%r1, %r0] 0x5a, %r13
	.word 0xe19fda00  ! 104: LDDFA_R	ldda	[%r31, %r0], %f16
brcommon_40_69:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xda3ff34b  ! 105: STD_I	std	%r13, [%r31 + 0xfffff34b]
mondo_40_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d94c008  ! 106: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_71:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 107: CASA_R	casa	[%r31] %asi, %r16, %r13
	.word 0xdb27e074  ! 108: STF_I	st	%f13, [0x0074, %r31]
vahole_40_72:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xdbe7e010  ! 109: CASA_R	casa	[%r31] %asi, %r16, %r13
	.word 0x95b48490  ! 110: FCMPLE32	fcmple32	%d18, %d16, %r10
change_to_randtl_40_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_73:
	.word 0x8f902000  ! 111: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd20fe010  ! 112: LDUB_I	ldub	[%r31 + 0x0010], %r9
splash_lsu_40_74:
	nop
	ta T_CHANGE_HPRIV
	set 0xa1c44589, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 113: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_longdelay2_40_75:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x24cc0001  ! 114: BRLEZ	brlez,a,pt	%r16,<label_0xc0001>
	.word 0xb1800011  ! 115: WR_STICK_REG_R	wr	%r0, %r17, %-
ibp_40_76:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe0dfc021  ! 116: LDXA_R	ldxa	[%r31, %r1] 0x01, %r16
change_to_randtl_40_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_77:
	.word 0x8f902000  ! 117: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_78) + 48, 16, 16)) -> intp(4,0,7)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_78)&0xffffffff)  + 48, 16, 16)) -> intp(4,0,7)
intvec_40_78:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91948013  ! 119: WRPR_PIL_R	wrpr	%r18, %r19, %pil
	.word 0x91a049ad  ! 120: FDIVs	fdivs	%f1, %f13, %f8
	.word 0xe1bfe0c0  ! 121: STDFA_I	stda	%f16, [0x00c0, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_80:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 122: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xd88fe038  ! 123: LDUBA_I	lduba	[%r31, + 0x0038] %asi, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_81
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_81:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 124: RDPC	rd	%pc, %r8
fpinit_40_82:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82970  ! 125: PREFETCHA_I	prefetcha	[%r0, + 0x0970] %asi, #one_read
	.word 0xb1800011  ! 126: WR_STICK_REG_R	wr	%r0, %r17, %-
iaw_40_83:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x40, %r16
iaw_startwait40_83:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_83
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_83:
    brnz %r16, iaw_wait40_83
    ld [%r23], %r16
    ba,a iaw_startwait40_83
    mov 0x40, %r16
continue_iaw_40_83:
    ldxa [%g0]0x63, %r14        !Get raw TID
    srlx %r14, 3, %r14          !Get CID
    sllx %r16, %r14, %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_83:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_83
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_83:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_40_83
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_83:
	mov 0x38, %r18
iaw1_40_83:
	best_set_reg(0x00000000e0a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe73fc011  ! 127: STDF_R	std	%f19, [%r17, %r31]
	.word 0xe737e048  ! 128: STQF_I	-	%f19, [0x0048, %r31]
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8d903b4b  ! 129: WRPR_PSTATE_I	wrpr	%r0, 0x1b4b, %pstate
trapasi_40_85:
mov 0x0, %r1 ! (VA for ASI 0x4c) 
	.word 0xe6d04b60  ! 130: LDSHA_R	ldsha	[%r1, %r0] 0x5b, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_86) + 24, 16, 16)) -> intp(1,0,23)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_86)&0xffffffff)  + 24, 16, 16)) -> intp(1,0,23)
intvec_40_86:
	.word 0x39400001  ! 131: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_40_87:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d92c013  ! 132: WRPR_WSTATE_R	wrpr	%r11, %r19, %wstate
splash_hpstate_40_88:
	.word 0x81982d8e  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8e, %hpstate
	.word 0xc19fe080  ! 134: LDDFA_I	ldda	[%r31, 0x0080], %f0
	.word 0xa9b4c7d4  ! 135: PDIST	pdistn	%d50, %d20, %d20
unsupttte_40_89:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa1a049b2  ! 136: FDIVs	fdivs	%f1, %f18, %f16
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 137: Tcc_R	ta	icc_or_xcc, %r0 + %r30
br_longdelay3_40_90:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902005  ! 138: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
fpinit_40_91:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 139: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xc3ecc033  ! 140: PREFETCHA_R	prefetcha	[%r19, %r19] 0x01, #one_read
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0x8d903467  ! 142: WRPR_PSTATE_I	wrpr	%r0, 0x1467, %pstate
	.word 0x9bb40992  ! 143: BSHUFFLE	fmovc32	%d16, %d18, %d44
trapasi_40_94:
mov 0x28, %r1 ! (VA for ASI 0x5a) 
	.word 0xd6904b40  ! 144: LDUHA_R	lduha	[%r1, %r0] 0x5a, %r11
	.word 0xa3a0016b  ! 145: FABSq	dis not found

br_longdelay1_40_95:
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 146: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd6bfe06c  ! 147: STDA_I	stda	%r11, [%r31 + 0x006c] %asi
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 148: Tcc_R	tne	icc_or_xcc, %r0 + %r30
br_longdelay1_40_96:
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9d97c000  ! 149: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x91d020b5  ! 150: Tcc_I	ta	icc_or_xcc, %r0 + 181
jmptr_40_97:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 151: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_40_98:
	nop
	setx 0xfffffff5fffff874, %g1, %g7
	.word 0xa3800007  ! 152: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_40_99:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 153: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_40_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d94c010  ! 154: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81460000  ! 156: RD_STICK_REG	stbar
splash_cmpr_40_101:
	nop
	setx 0x98127c4b0d35527a, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 157: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x9f802cc0  ! 158: SIR	sir	0x0cc0
brcommon_40_102:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xd71fc00a  ! 159: LDDF_R	ldd	[%r31, %r10], %f11
pmu_40_103:
	nop
	setx 0xfffff79dfffffbad, %g1, %g7
	.word 0xa3800007  ! 160: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc19fdc00  ! 161: LDDFA_R	ldda	[%r31, %r0], %f0
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_104) + 56, 16, 16)) -> intp(3,0,31)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_104)&0xffffffff)  + 56, 16, 16)) -> intp(3,0,31)
intvec_40_104:
	.word 0x39400001  ! 162: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9702488  ! 163: POPC_I	popc	0x0488, %r20
	.word 0x8d9022c4  ! 164: WRPR_PSTATE_I	wrpr	%r0, 0x02c4, %pstate
jmptr_40_106:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 165: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_40_107:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcbd, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd33fc014  ! 166: STDF_R	std	%f9, [%r20, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 167: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0x99a489d2  ! 168: FDIVd	fdivd	%f18, %f18, %f12
	.word 0xa5a0c9cd  ! 169: FDIVd	fdivd	%f34, %f44, %f18
dvapa_40_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe67, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc003  ! 170: STXFSR_R	st-sfr	%f1, [%r3, %r31]
mondo_40_110:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d904004  ! 171: WRPR_WSTATE_R	wrpr	%r1, %r4, %wstate
	.word 0xe05fe008  ! 172: LDX_I	ldx	[%r31 + 0x0008], %r16
	.word 0xab848013  ! 173: WR_CLEAR_SOFTINT_R	wr	%r18, %r19, %clear_softint
intveclr_40_111:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb374e7884b9deea7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 174: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97a00174  ! 175: FABSq	dis not found

	.word 0xb1800011  ! 176: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xe1bfdc00  ! 177: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xb1800011  ! 178: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x9f803f44  ! 179: SIR	sir	0x1f44
	.word 0x91d02032  ! 180: Tcc_I	ta	icc_or_xcc, %r0 + 50
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
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
	.word 0xd1e7e00d  ! 181: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x2a700001  ! 182: BPCS	<illegal instruction>
	.word 0x8d9022bb  ! 183: WRPR_PSTATE_I	wrpr	%r0, 0x02bb, %pstate
	.word 0x91940002  ! 184: WRPR_PIL_R	wrpr	%r16, %r2, %pil
donret_40_115:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_115-donret_40_115-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d4361b | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_115:
	.word 0xd0ffe050  ! 185: SWAPA_I	swapa	%r8, [%r31 + 0x0050] %asi
	.word 0xe1bfd960  ! 186: STDFA_R	stda	%f16, [%r0, %r31]
splash_cmpr_40_116:
	nop
	setx 0xaba0816d9f0b02b5, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 187: WRPR_TICK_R	wrpr	%r0, %r17, %tick
trapasi_40_117:
mov 0x0, %r1 ! (VA for ASI 0x4c) 
	.word 0xd0c04b00  ! 188: LDSWA_R	ldswa	[%r1, %r0] 0x58, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_118
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_118:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 189: RDPC	rd	%pc, %r16
	.word 0xe827e0d2  ! 190: STW_I	stw	%r20, [%r31 + 0x00d2]
    set 0x250c, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b207d3  ! 191: PDIST	pdistn	%d8, %d50, %d10
	.word 0x9b450000  ! 192: RD_SET_SOFTINT	rd	%set_softint, %r13
	.word 0xe1bfda00  ! 193: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe81fc000  ! 194: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0xe857e028  ! 195: LDSH_I	ldsh	[%r31 + 0x0028], %r20
	.word 0x9f803811  ! 196: SIR	sir	0x1811
	.word 0xe1bfd920  ! 197: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa7a349a3  ! 198: FDIVs	fdivs	%f13, %f3, %f19
	.word 0xb1800011  ! 199: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x9f802f49  ! 200: SIR	sir	0x0f49
jmptr_40_119:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 201: JMPL_R	jmpl	%r27 + %r0, %r27
br_longdelay3_40_120:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902001  ! 202: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xe1bfe080  ! 203: STDFA_I	stda	%f16, [0x0080, %r31]
	.word 0xd437e0d9  ! 204: STH_I	sth	%r10, [%r31 + 0x00d9]
splash_tba_40_121:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 205: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_40_122:
	tsubcctv %r20, 0x1a0f, %r12
	.word 0xd407e09c  ! 206: LDUW_I	lduw	[%r31 + 0x009c], %r10
	.word 0x9f802276  ! 207: SIR	sir	0x0276
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_123
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_123:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 208: CASA_R	casa	[%r31] %asi, %r10, %r10
jmptr_40_124:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 209: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9150c000  ! 210: RDPR_TT	<illegal instruction>
	.word 0xe137c000  ! 211: STQF_R	-	%f16, [%r0, %r31]
intveclr_40_125:
	nop
	ta T_CHANGE_HPRIV
	setx 0x17619bc87623309c, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 212: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_40_126:
	nop
	ta T_CHANGE_HPRIV
	setx 0x09e2cc6426cf9ace, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 213: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x32700001  ! 214: BPNE	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r16
br_longdelay3_40_127:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902002  ! 216: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
splash_lsu_40_128:
	nop
	ta T_CHANGE_HPRIV
	set 0xe56b2f79, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_129:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 218: CASA_R	casa	[%r31] %asi, %r10, %r16
pmu_40_130:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff7e1fffff0b0, %g1, %g7
	.word 0xa3800007  ! 219: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9191c00b  ! 220: WRPR_PIL_R	wrpr	%r7, %r11, %pil
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 221: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa7a489d3  ! 222: FDIVd	fdivd	%f18, %f50, %f50
intveclr_40_132:
	nop
	ta T_CHANGE_HPRIV
	setx 0xcebbc8e25295b79b, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_40_133:
	ta T_CHANGE_NONHPRIV
	.word 0x81982654  ! 224: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0654, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_134)+48, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_134)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_134:
	.word 0xa984fa62  ! 225: WR_SET_SOFTINT_I	wr	%r19, 0x1a62, %set_softint
	.word 0xa3520000  ! 226: RDPR_PIL	<illegal instruction>
pmu_40_135:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffd97fffffafc, %g1, %g7
	.word 0xa3800007  ! 227: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f8037d5  ! 228: SIR	sir	0x17d5
	.word 0xe537c000  ! 229: STQF_R	-	%f18, [%r0, %r31]
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 230: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc3ecc02d  ! 231: PREFETCHA_R	prefetcha	[%r19, %r13] 0x01, #one_read
splash_hpstate_40_136:
	.word 0x2ccd0001  ! 1: BRGZ	brgz,a,pt	%r20,<label_0xd0001>
	.word 0x81982344  ! 232: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0344, %hpstate
	setx 0x2a1978bfeeb932f0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_137:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 234: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb1800011  ! 235: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xd80fe020  ! 236: LDUB_I	ldub	[%r31 + 0x0020], %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_138
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_138
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_138:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 237: RDPC	rd	%pc, %r13
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 238: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_139
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_139:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 239: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0xe71fc000  ! 240: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x81460000  ! 241: RD_STICK_REG	stbar
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_140
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_140:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 242: RDPC	rd	%pc, %r18
	.word 0x93d020b2  ! 243: Tcc_I	tne	icc_or_xcc, %r0 + 178
trapasi_40_141:
mov 0x3d8, %r1 ! (VA for ASI 0x25) 
	.word 0xe0884e80  ! 244: LDUBA_R	lduba	[%r1, %r0] 0x74, %r16
	.word 0xa7a00173  ! 245: FABSq	dis not found

	.word 0x83d020b4  ! 246: Tcc_I	te	icc_or_xcc, %r0 + 180
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 247: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_40_142:
	nop
	ta T_CHANGE_HPRIV
	set 0xb03f2762, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 248: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_40_143:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff7e2fffffdf9, %g1, %g7
	.word 0xa3800007  ! 249: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe1bfe040  ! 250: STDFA_I	stda	%f16, [0x0040, %r31]
	.word 0xb1800011  ! 251: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x83d02032  ! 252: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xe1bfde00  ! 253: STDFA_R	stda	%f16, [%r0, %r31]
memptr_40_144:
	set user_data_start, %r31
	.word 0x858439c8  ! 254: WRCCR_I	wr	%r16, 0x19c8, %ccr
fpinit_40_145:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 255: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x8d902504  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x0504, %pstate
	.word 0xe527e0ac  ! 257: STF_I	st	%f18, [0x00ac, %r31]
splash_lsu_40_147:
	nop
	ta T_CHANGE_HPRIV
	set 0xb729712f, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 258: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfd920  ! 259: STDFA_R	stda	%f16, [%r0, %r31]
mondo_40_148:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d950005  ! 260: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	.word 0xa7480000  ! 261: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
brcommon_40_149:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xe4bfc034  ! 262: STDA_R	stda	%r18, [%r31 + %r20] 0x01
	.word 0x97a00161  ! 263: FABSq	dis not found

	.word 0x9bb18491  ! 264: FCMPLE32	fcmple32	%d6, %d48, %r13
	.word 0xe827e0f7  ! 265: STW_I	stw	%r20, [%r31 + 0x00f7]
	.word 0xe8cfe008  ! 266: LDSBA_I	ldsba	[%r31, + 0x0008] %asi, %r20
	.word 0xa5b444d0  ! 267: FCMPNE32	fcmpne32	%d48, %d16, %r18
memptr_40_150:
	set user_data_start, %r31
	.word 0x8582b9b6  ! 268: WRCCR_I	wr	%r10, 0x19b6, %ccr
splash_lsu_40_151:
	nop
	ta T_CHANGE_HPRIV
	set 0x42cc8f5a, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd43fe006  ! 270: STD_I	std	%r10, [%r31 + 0x0006]
	.word 0xa7703475  ! 271: POPC_I	popc	0x1475, %r19
	.word 0xab834002  ! 272: WR_CLEAR_SOFTINT_R	wr	%r13, %r2, %clear_softint
pmu_40_152:
	nop
	setx 0xfffff59bfffff1da, %g1, %g7
	.word 0xa3800007  ! 273: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_40_153:
	nop
	ta T_CHANGE_HPRIV
	mov 0x81e, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe4bfc033  ! 274: STDA_R	stda	%r18, [%r31 + %r19] 0x01
	.word 0x87ad0a53  ! 275: FCMPd	fcmpd	%fcc<n>, %f20, %f50
jmptr_40_154:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 276: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe19fd960  ! 277: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f80236c  ! 278: SIR	sir	0x036c
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
	.word 0xdbe7e010  ! 279: CASA_R	casa	[%r31] %asi, %r16, %r13
splash_tba_40_156:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 280: WRPR_TBA_R	wrpr	%r0, %r12, %tba
pmu_40_157:
	nop
	setx 0xfffff31ffffff480, %g1, %g7
	.word 0xa3800007  ! 281: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_40_158:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d918012  ! 282: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_159
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_159:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 283: RDPC	rd	%pc, %r10
	.word 0xa5a00174  ! 284: FABSq	dis not found

jmptr_40_160:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 285: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_40_161:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2da2c57a7b28f198, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 286: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93b50492  ! 287: FCMPLE32	fcmple32	%d20, %d18, %r9
	.word 0x8d903bab  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x1bab, %pstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_163:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 289: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0x9ba4c9c1  ! 290: FDIVd	fdivd	%f50, %f32, %f44
	.word 0x91928012  ! 291: WRPR_PIL_R	wrpr	%r10, %r18, %pil
	.word 0xe1bfd960  ! 292: STDFA_R	stda	%f16, [%r0, %r31]
donret_40_165:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_165-donret_40_165-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007734bf | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x95c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	done
donretarg_40_165:
	.word 0xd6ffe04c  ! 293: SWAPA_I	swapa	%r11, [%r31 + 0x004c] %asi
br_longdelay1_40_166:
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	.word 0xbfe7c000  ! 294: SAVE_R	save	%r31, %r0, %r31
	.word 0xe19fe080  ! 295: LDDFA_I	ldda	[%r31, 0x0080], %f16
	setx 0x1518a8bddf139943, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_167:
	.word 0x39400001  ! 296: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_40_168:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa01f7bd4327a2723, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 297: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 298: BL	bl,a	<label_0x1>
jmptr_40_169:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 299: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_170:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 300: CASA_R	casa	[%r31] %asi, %r8, %r11
	.word 0xd697e008  ! 301: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r11
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
br_badelay3_20_0:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe5499258	! Random illegal ?
	.word 0xd3104003  ! 1: LDQF_R	-	[%r1, %r3], %f9
	.word 0x91a1c825  ! 1: FADDs	fadds	%f7, %f5, %f8
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_1
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_1:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 2: CASA_R	casa	[%r31] %asi, %r18, %r13
splash_hpstate_20_2:
	.word 0x2ecc0001  ! 1: BRGEZ	brgez,a,pt	%r16,<label_0xc0001>
	.word 0x81982ec7  ! 3: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec7, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
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
	.word 0xdbe7e012  ! 4: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x91d02032  ! 5: Tcc_I	ta	icc_or_xcc, %r0 + 50
jmptr_20_4:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 6: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xdb27c000  ! 7: STF_R	st	%f13, [%r0, %r31]
	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 8: Tcc_R	te	icc_or_xcc, %r0 + %r30
mondo_20_5:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d948014  ! 9: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0x91d02033  ! 10: Tcc_I	ta	icc_or_xcc, %r0 + 51
pmu_20_6:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff555fffff255, %g1, %g7
	.word 0xa3800007  ! 11: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_20_7:
	set 0x60340000, %r31
	.word 0x8581ef0e  ! 12: WRCCR_I	wr	%r7, 0x0f0e, %ccr
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_8
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_8
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_8:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 13: RDPC	rd	%pc, %r10
pmu_20_9:
	nop
	setx 0xfffffa09fffff4a0, %g1, %g7
	.word 0xa3800007  ! 14: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_10
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_10:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 15: RDPC	rd	%pc, %r11
mondo_20_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d948007  ! 16: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
br_badelay3_20_12:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x99740445	! Random illegal ?
	.word 0x99a00552  ! 1: FSQRTd	fsqrt	
	.word 0xa5a48831  ! 17: FADDs	fadds	%f18, %f17, %f18
dvapa_20_13:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa85, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd897c031  ! 18: LDUHA_R	lduha	[%r31, %r17] 0x01, %r12
tagged_20_14:
	tsubcctv %r13, 0x1a4b, %r19
	.word 0xd807e037  ! 19: LDUW_I	lduw	[%r31 + 0x0037], %r12
	.word 0xe1bfe0c0  ! 20: STDFA_I	stda	%f16, [0x00c0, %r31]
splash_hpstate_20_15:
	ta T_CHANGE_NONHPRIV
	.word 0x2ec84001  ! 1: BRGEZ	brgez,a,pt	%r1,<label_0x84001>
	.word 0x819829bf  ! 21: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09bf, %hpstate
	.word 0xd8d7e030  ! 22: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r12
intveclr_20_16:
	nop
	ta T_CHANGE_HPRIV
	setx 0xbeb8789b5a475fad, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 23: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_17
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_17:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 24: RDPC	rd	%pc, %r8
splash_htba_20_18:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 25: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
br_longdelay2_20_19:
	.word 0x2acc4001  ! 1: BRNZ	brnz,a,pt	%r17,<label_0xc4001>
	.word 0x24c94001  ! 26: BRLEZ	brlez,a,pt	%r5,<label_0x94001>
br_longdelay1_20_20:
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 27: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xb1800011  ! 28: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xa9b0c4c4  ! 29: FCMPNE32	fcmpne32	%d34, %d4, %r20
	.word 0x91d02035  ! 30: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_tba_20_21:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 31: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_20_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d94c014  ! 32: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0x20700001  ! 33: BPN	<illegal instruction>
	.word 0x91923285  ! 34: WRPR_PIL_I	wrpr	%r8, 0x1285, %pil
	.word 0x83d020b5  ! 35: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0x9f8035b9  ! 36: SIR	sir	0x15b9
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_23
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_23:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 37: RDPC	rd	%pc, %r20
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_24
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_24:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 38: RDPC	rd	%pc, %r19
jmptr_20_25:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 39: JMPL_R	jmpl	%r27 + %r0, %r27
ibp_20_26:
	nop
	ta T_CHANGE_HPRIV
	.word 0xd0dfc022  ! 40: LDXA_R	ldxa	[%r31, %r2] 0x01, %r8
	setx 0x39cb7d4a16fd2a9b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_27:
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903306  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x1306, %pstate
	.word 0xd06fe0fb  ! 43: LDSTUB_I	ldstub	%r8, [%r31 + 0x00fb]
trapasi_20_29:
mov 0x28, %r1 ! (VA for ASI 0x5b) 
	.word 0xd0d04b60  ! 44: LDSHA_R	ldsha	[%r1, %r0] 0x5b, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_30
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_30:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 45: RDPC	rd	%pc, %r12
fpinit_20_31:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 46: FDIVs	fdivs	%f0, %f4, %f6
memptr_20_32:
	set 0x60340000, %r31
	.word 0x8584a933  ! 47: WRCCR_I	wr	%r18, 0x0933, %ccr
mondo_20_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d950008  ! 48: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
	.word 0x91918002  ! 49: WRPR_PIL_R	wrpr	%r6, %r2, %pil
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_35:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 50: CASA_R	casa	[%r31] %asi, %r9, %r12
donret_20_36:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_36-donret_20_36-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00207b1d | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xedc, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	retry
donretarg_20_36:
	.word 0xd8ffe0dc  ! 51: SWAPA_I	swapa	%r12, [%r31 + 0x00dc] %asi
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
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
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_37:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 52: RDPC	rd	%pc, %r19
mondo_20_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d940014  ! 53: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	setx 0xd2ca19d28d06c48f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_39:
	.word 0x39400001  ! 54: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_40
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_40:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 55: RDPC	rd	%pc, %r20
	.word 0x93a489cd  ! 56: FDIVd	fdivd	%f18, %f44, %f40
	.word 0xa7480000  ! 57: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0xa1702f80  ! 58: POPC_I	popc	0x0f80, %r16
fpinit_20_41:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 59: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x9f802844  ! 60: SIR	sir	0x0844
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_42:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e002  ! 61: CASA_R	casa	[%r31] %asi, %r2, %r12
br_badelay2_20_43:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f4, %f8, %f14
	.word 0xa9b44301  ! 62: ALIGNADDRESS	alignaddr	%r17, %r1, %r20
	.word 0x8d802004  ! 63: WRFPRS_I	wr	%r0, 0x0004, %fprs
br_longdelay1_20_44:
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0x9d97c000  ! 64: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	setx 0xf25fb57fcca387fe, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_45:
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe53fc000  ! 66: STDF_R	std	%f18, [%r0, %r31]
vahole_20_46:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe5e7e00d  ! 67: CASA_R	casa	[%r31] %asi, %r13, %r18
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
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_47:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 68: RDPC	rd	%pc, %r18
	.word 0xb1800011  ! 69: WR_STICK_REG_R	wr	%r0, %r17, %-
splash_hpstate_20_48:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x81982dfe  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dfe, %hpstate
intveclr_20_49:
	nop
	ta T_CHANGE_HPRIV
	setx 0x3a86d959db3e642c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 71: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe03fe0c8  ! 72: STD_I	std	%r16, [%r31 + 0x00c8]
splash_lsu_20_50:
	nop
	ta T_CHANGE_HPRIV
	set 0x9a0f5669, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 73: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe137e0f8  ! 74: STQF_I	-	%f16, [0x00f8, %r31]
	.word 0xe1bfe060  ! 75: STDFA_I	stda	%f16, [0x0060, %r31]
	.word 0xe057e030  ! 76: LDSH_I	ldsh	[%r31 + 0x0030], %r16
splash_cmpr_20_51:
	nop
	setx 0x8e465bd79bb593be, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 77: WRPR_TICK_R	wrpr	%r0, %r17, %tick
splash_lsu_20_52:
	nop
	ta T_CHANGE_HPRIV
	set 0x3b7d1b7b, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 78: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_badelay2_20_53:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f20, %f26, %f18
	.word 0x91b40309  ! 79: ALIGNADDRESS	alignaddr	%r16, %r9, %r8
	.word 0xe19fda00  ! 80: LDDFA_R	ldda	[%r31, %r0], %f16
splash_cmpr_20_54:
	nop
	setx 0x50787d507ee84873, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 81: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x97a00172  ! 82: FABSq	dis not found

vahole_20_55:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xda9fc022  ! 83: LDDA_R	ldda	[%r31, %r2] 0x01, %r13
vahole_20_56:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xdbe7e002  ! 84: CASA_R	casa	[%r31] %asi, %r2, %r13
invtsb_20_57:
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
	.word 0x29800001  ! 85: FBL	fbl,a	<label_0x1>
memptr_20_58:
	set 0x60140000, %r31
	.word 0x8584fb9b  ! 86: WRCCR_I	wr	%r19, 0x1b9b, %ccr
	.word 0x91912df7  ! 87: WRPR_PIL_I	wrpr	%r4, 0x0df7, %pil
	.word 0x91d02032  ! 88: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_tba_20_59:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 89: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xc1bfe0c0  ! 90: STDFA_I	stda	%f0, [0x00c0, %r31]
	.word 0x9f8025be  ! 91: SIR	sir	0x05be
	.word 0xda6fe003  ! 92: LDSTUB_I	ldstub	%r13, [%r31 + 0x0003]
	.word 0xda47e010  ! 93: LDSW_I	ldsw	[%r31 + 0x0010], %r13
br_longdelay1_20_60:
	.word 0x22c94001  ! 1: BRZ	brz,a,pt	%r5,<label_0x94001>
	.word 0x9d97c000  ! 94: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	fbne,a,pn	%fcc0,  skip_20_61
	.word 0x9f803811  ! 1: SIR	sir	0x1811
.align 32
skip_20_61:
	.word 0xc36fe046  ! 95: PREFETCH_I	prefetch	[%r31 + 0x0046], #one_read
jmptr_20_62:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 96: JMPL_R	jmpl	%r27 + %r0, %r27
br_badelay2_20_63:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x91b30311  ! 97: ALIGNADDRESS	alignaddr	%r12, %r17, %r8
mondo_20_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d90c009  ! 98: WRPR_WSTATE_R	wrpr	%r3, %r9, %wstate
	.word 0xc1bfe000  ! 99: STDFA_I	stda	%f0, [0x0000, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_20_65:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_20_66:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd4b8cfd38cd5adf1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 101: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_20_67:
	nop
	ta T_CHANGE_HPRIV
	mov 0x992, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdb3fc009  ! 102: STDF_R	std	%f13, [%r9, %r31]
trapasi_20_68:
mov 0x0, %r1 ! (VA for ASI 0x5b) 
	.word 0xdac84e40  ! 103: LDSBA_R	ldsba	[%r1, %r0] 0x72, %r13
	.word 0xc19fdc00  ! 104: LDDFA_R	ldda	[%r31, %r0], %f0
brcommon_20_69:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xdabfc029  ! 105: STDA_R	stda	%r13, [%r31 + %r9] 0x01
mondo_20_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d914012  ! 106: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_71:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 107: CASA_R	casa	[%r31] %asi, %r16, %r13
	.word 0xdb27e0c1  ! 108: STF_I	st	%f13, [0x00c1, %r31]
vahole_20_72:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xda3ff34b  ! 109: STD_I	std	%r13, [%r31 + 0xfffff34b]
	.word 0xa5a0c9b0  ! 110: FDIVs	fdivs	%f3, %f16, %f18
change_to_randtl_20_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_73:
	.word 0x8f902001  ! 111: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd20fe018  ! 112: LDUB_I	ldub	[%r31 + 0x0018], %r9
splash_lsu_20_74:
	nop
	ta T_CHANGE_HPRIV
	set 0xd4b03e70, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 113: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_longdelay2_20_75:
	.word 0x2acc0001  ! 1: BRNZ	brnz,a,pt	%r16,<label_0xc0001>
	.word 0xe03c0013  ! 114: STD_R	std	%r16, [%r16 + %r19]
	.word 0xb1800011  ! 115: WR_STICK_REG_R	wr	%r0, %r17, %-
ibp_20_76:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe11fc001  ! 116: LDDF_R	ldd	[%r31, %r1], %f16
change_to_randtl_20_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_77:
	.word 0x8f902000  ! 117: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_78) + 0, 16, 16)) -> intp(1,0,16)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_78)&0xffffffff)  + 0, 16, 16)) -> intp(1,0,16)
intvec_20_78:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9194c00c  ! 119: WRPR_PIL_R	wrpr	%r19, %r12, %pil
	.word 0x9f803364  ! 120: SIR	sir	0x1364
	.word 0xc1bfe0c0  ! 121: STDFA_I	stda	%f0, [0x00c0, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_80:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 122: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xd88fe038  ! 123: LDUBA_I	lduba	[%r31, + 0x0038] %asi, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_81
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_81:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 124: RDPC	rd	%pc, %r20
fpinit_20_82:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 125: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xb1800011  ! 126: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xe6dfc031  ! 127: LDXA_R	ldxa	[%r31, %r17] 0x01, %r19
	.word 0xe737e078  ! 128: STQF_I	-	%f19, [0x0078, %r31]
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8d903006  ! 129: WRPR_PSTATE_I	wrpr	%r0, 0x1006, %pstate
trapasi_20_85:
mov 0x28, %r1 ! (VA for ASI 0x4c) 
	.word 0xe6c84a00  ! 130: LDSBA_R	ldsba	[%r1, %r0] 0x50, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_86) + 40, 16, 16)) -> intp(3,0,13)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_86)&0xffffffff)  + 40, 16, 16)) -> intp(3,0,13)
intvec_20_86:
	.word 0x39400001  ! 131: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_20_87:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d91800c  ! 132: WRPR_WSTATE_R	wrpr	%r6, %r12, %wstate
splash_hpstate_20_88:
	.word 0x81982dcd  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dcd, %hpstate
	.word 0xe19fe0e0  ! 134: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	.word 0xc3ec0030  ! 135: PREFETCHA_R	prefetcha	[%r16, %r16] 0x01, #one_read
unsupttte_20_89:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87ac8a52  ! 136: FCMPd	fcmpd	%fcc<n>, %f18, %f18
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 137: Tcc_R	ta	icc_or_xcc, %r0 + %r30
br_longdelay3_20_90:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902002  ! 138: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
fpinit_20_91:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 139: FDIVs	fdivs	%f0, %f4, %f6
	.word 0xa5a289b0  ! 140: FDIVs	fdivs	%f10, %f16, %f18
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0x8d902a75  ! 142: WRPR_PSTATE_I	wrpr	%r0, 0x0a75, %pstate
tglhtw_20_93:
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
	.word 0x9bb48993  ! 143: BSHUFFLE	fmovc32	%d18, %d50, %d44
trapasi_20_94:
mov 0x28, %r1 ! (VA for ASI 0x5a) 
	.word 0xd6d84b00  ! 144: LDXA_R	ldxa	[%r1, %r0] 0x58, %r11
	.word 0xa9a0016b  ! 145: FABSq	dis not found

br_longdelay1_20_95:
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xbfe7c000  ! 146: SAVE_R	save	%r31, %r0, %r31
	.word 0xd6bfe012  ! 147: STDA_I	stda	%r11, [%r31 + 0x0012] %asi
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 148: Tcc_R	tne	icc_or_xcc, %r0 + %r30
br_longdelay1_20_96:
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0xbfe7c000  ! 149: SAVE_R	save	%r31, %r0, %r31
	.word 0x83d020b4  ! 150: Tcc_I	te	icc_or_xcc, %r0 + 180
jmptr_20_97:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 151: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_20_98:
	nop
	setx 0xfffffe7dfffff153, %g1, %g7
	.word 0xa3800007  ! 152: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_20_99:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 153: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_20_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d948014  ! 154: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81460000  ! 156: RD_STICK_REG	stbar
splash_cmpr_20_101:
	nop
	setx 0xdd9622ab356adb29, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 157: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x9f80307f  ! 158: SIR	sir	0x107f
brcommon_20_102:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xd7e7e00a  ! 159: CASA_R	casa	[%r31] %asi, %r10, %r11
pmu_20_103:
	nop
	setx 0xfffff719fffff7d4, %g1, %g7
	.word 0xa3800007  ! 160: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe1bfdc00  ! 161: STDFA_R	stda	%f16, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_104) + 40, 16, 16)) -> intp(2,0,18)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_104)&0xffffffff)  + 40, 16, 16)) -> intp(2,0,18)
intvec_20_104:
	.word 0x39400001  ! 162: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9703a4d  ! 163: POPC_I	popc	0x1a4d, %r20
	.word 0x8d902df7  ! 164: WRPR_PSTATE_I	wrpr	%r0, 0x0df7, %pstate
jmptr_20_106:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 165: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_20_107:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9f2, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd23fe3c9  ! 166: STD_I	std	%r9, [%r31 + 0x03c9]
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 167: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0xa5a409c7  ! 168: FDIVd	fdivd	%f16, %f38, %f18
	.word 0x95a089c8  ! 169: FDIVd	fdivd	%f2, %f8, %f10
dvapa_20_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf8b, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1e7e003  ! 170: CASA_R	casa	[%r31] %asi, %r3, %r16
mondo_20_110:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d934011  ! 171: WRPR_WSTATE_R	wrpr	%r13, %r17, %wstate
	.word 0xe05fe028  ! 172: LDX_I	ldx	[%r31 + 0x0028], %r16
	.word 0xab844009  ! 173: WR_CLEAR_SOFTINT_R	wr	%r17, %r9, %clear_softint
intveclr_20_111:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8e881781efbc368b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 174: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95a00171  ! 175: FABSq	dis not found

	.word 0xb1800011  ! 176: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xe19fdf20  ! 177: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xb1800011  ! 178: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x99a409a3  ! 179: FDIVs	fdivs	%f16, %f3, %f12
	.word 0x93d02032  ! 180: Tcc_I	tne	icc_or_xcc, %r0 + 50
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_112:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 181: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x2a700001  ! 182: BPCS	<illegal instruction>
	.word 0x8d903dd6  ! 183: WRPR_PSTATE_I	wrpr	%r0, 0x1dd6, %pstate
	.word 0x91910014  ! 184: WRPR_PIL_R	wrpr	%r4, %r20, %pil
donret_20_115:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_115-donret_20_115-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00204931 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x94e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_115:
	.word 0xd0ffe07c  ! 185: SWAPA_I	swapa	%r8, [%r31 + 0x007c] %asi
	.word 0xe1bfd920  ! 186: STDFA_R	stda	%f16, [%r0, %r31]
splash_cmpr_20_116:
	nop
	setx 0x270a4324a015dbd5, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 187: WRPR_TICK_R	wrpr	%r0, %r17, %tick
trapasi_20_117:
mov 0x18, %r1 ! (VA for ASI 0x4c) 
	.word 0xd0c84b40  ! 188: LDSBA_R	ldsba	[%r1, %r0] 0x5a, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_118
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_118:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 189: RDPC	rd	%pc, %r16
	.word 0xe827e084  ! 190: STW_I	stw	%r20, [%r31 + 0x0084]
    set 0x9e5, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b447d0  ! 191: PDIST	pdistn	%d48, %d16, %d20
	.word 0x99450000  ! 192: RD_SET_SOFTINT	rd	%set_softint, %r12
	.word 0xe1bfd920  ! 193: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe81fc000  ! 194: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0xe857e000  ! 195: LDSH_I	ldsh	[%r31 + 0x0000], %r20
	.word 0x95b5048a  ! 196: FCMPLE32	fcmple32	%d20, %d10, %r10
	.word 0xe19fdf20  ! 197: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x87acca4a  ! 198: FCMPd	fcmpd	%fcc<n>, %f50, %f10
	.word 0xb1800011  ! 199: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x9f80221e  ! 200: SIR	sir	0x021e
jmptr_20_119:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 201: JMPL_R	jmpl	%r27 + %r0, %r27
br_longdelay3_20_120:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902000  ! 202: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xc1bfe0e0  ! 203: STDFA_I	stda	%f0, [0x00e0, %r31]
	.word 0xd437e0d8  ! 204: STH_I	sth	%r10, [%r31 + 0x00d8]
splash_tba_20_121:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 205: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_20_122:
	tsubcctv %r11, 0x1fe0, %r20
	.word 0xd407e03a  ! 206: LDUW_I	lduw	[%r31 + 0x003a], %r10
	.word 0x9f802b32  ! 207: SIR	sir	0x0b32
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_123
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_123:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 208: CASA_R	casa	[%r31] %asi, %r10, %r10
jmptr_20_124:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 209: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa750c000  ! 210: RDPR_TT	<illegal instruction>
	.word 0xe137c000  ! 211: STQF_R	-	%f16, [%r0, %r31]
intveclr_20_125:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa50a5e0769c6a6a4, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 212: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_20_126:
	nop
	ta T_CHANGE_HPRIV
	setx 0x350e04382044045c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 213: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x32700001  ! 214: BPNE	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r16
br_longdelay3_20_127:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902004  ! 216: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
splash_lsu_20_128:
	nop
	ta T_CHANGE_HPRIV
	set 0x3c256b73, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_129:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 218: CASA_R	casa	[%r31] %asi, %r10, %r16
pmu_20_130:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff785fffff8d2, %g1, %g7
	.word 0xa3800007  ! 219: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9195000c  ! 220: WRPR_PIL_R	wrpr	%r20, %r12, %pil
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 221: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87ad0a50  ! 222: FCMPd	fcmpd	%fcc<n>, %f20, %f16
intveclr_20_132:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2046a7e6b4a3e1c4, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_20_133:
	ta T_CHANGE_NONHPRIV
	.word 0x81982a87  ! 224: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a87, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_134)+40, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_134)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_134:
	.word 0xa982f542  ! 225: WR_SET_SOFTINT_I	wr	%r11, 0x1542, %set_softint
	.word 0x95520000  ! 226: RDPR_PIL	<illegal instruction>
pmu_20_135:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff924fffffafc, %g1, %g7
	.word 0xa3800007  ! 227: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f802807  ! 228: SIR	sir	0x0807
	.word 0xe537c000  ! 229: STQF_R	-	%f18, [%r0, %r31]
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 230: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc3ecc022  ! 231: PREFETCHA_R	prefetcha	[%r19, %r2] 0x01, #one_read
splash_hpstate_20_136:
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	.word 0x81982e85  ! 232: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e85, %hpstate
	setx 0x259b194afc3d1f4c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_137:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 234: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xb1800011  ! 235: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xd80fe028  ! 236: LDUB_I	ldub	[%r31 + 0x0028], %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_138
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_138
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_138:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 237: RDPC	rd	%pc, %r9
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 238: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_139
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_139:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 239: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0xe71fc000  ! 240: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x81460000  ! 241: RD_STICK_REG	stbar
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_140
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_140:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 242: RDPC	rd	%pc, %r12
	.word 0x91d020b3  ! 243: Tcc_I	ta	icc_or_xcc, %r0 + 179
trapasi_20_141:
mov 0x3f0, %r1 ! (VA for ASI 0x25) 
	.word 0xe0c04980  ! 244: LDSWA_R	ldswa	[%r1, %r0] 0x4c, %r16
	.word 0x97a00170  ! 245: FABSq	dis not found

	.word 0x91d02032  ! 246: Tcc_I	ta	icc_or_xcc, %r0 + 50
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 247: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_20_142:
	nop
	ta T_CHANGE_HPRIV
	set 0xa52e835e, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 248: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_20_143:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff4d3fffff12c, %g1, %g7
	.word 0xa3800007  ! 249: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe1bfe000  ! 250: STDFA_I	stda	%f16, [0x0000, %r31]
	.word 0xb1800011  ! 251: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x93d02032  ! 252: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xc1bfe0a0  ! 253: STDFA_I	stda	%f0, [0x00a0, %r31]
memptr_20_144:
	set user_data_start, %r31
	.word 0x858234d0  ! 254: WRCCR_I	wr	%r8, 0x14d0, %ccr
fpinit_20_145:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82190  ! 255: PREFETCHA_I	prefetcha	[%r0, + 0x0190] %asi, #one_read
	.word 0x8d902c71  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x0c71, %pstate
	.word 0xe527e066  ! 257: STF_I	st	%f18, [0x0066, %r31]
splash_lsu_20_147:
	nop
	ta T_CHANGE_HPRIV
	set 0x69d292bc, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 258: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe060  ! 259: STDFA_I	stda	%f0, [0x0060, %r31]
mondo_20_148:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d94c005  ! 260: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
	.word 0xa7480000  ! 261: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
brcommon_20_149:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xe4dfc034  ! 262: LDXA_R	ldxa	[%r31, %r20] 0x01, %r18
	.word 0x93a00174  ! 263: FABSq	dis not found

	.word 0x87acca54  ! 264: FCMPd	fcmpd	%fcc<n>, %f50, %f20
	.word 0xe827e09c  ! 265: STW_I	stw	%r20, [%r31 + 0x009c]
	.word 0xe8cfe008  ! 266: LDSBA_I	ldsba	[%r31, + 0x0008] %asi, %r20
	.word 0x97b1c4d3  ! 267: FCMPNE32	fcmpne32	%d38, %d50, %r11
memptr_20_150:
	set user_data_start, %r31
	.word 0x85813c63  ! 268: WRCCR_I	wr	%r4, 0x1c63, %ccr
splash_lsu_20_151:
	nop
	ta T_CHANGE_HPRIV
	set 0x066b24f0, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd43fe061  ! 270: STD_I	std	%r10, [%r31 + 0x0061]
	.word 0xa1b147c2  ! 271: PDIST	pdistn	%d36, %d2, %d16
	.word 0xab82400b  ! 272: WR_CLEAR_SOFTINT_R	wr	%r9, %r11, %clear_softint
pmu_20_152:
	nop
	setx 0xfffffcddfffffdf1, %g1, %g7
	.word 0xa3800007  ! 273: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_20_153:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe7c, %r20
	mov 0x18, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe43ff85d  ! 274: STD_I	std	%r18, [%r31 + 0xfffff85d]
	.word 0xc3e88030  ! 275: PREFETCHA_R	prefetcha	[%r2, %r16] 0x01, #one_read
jmptr_20_154:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 276: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe19fd960  ! 277: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f802933  ! 278: SIR	sir	0x0933
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_155:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 279: CASA_R	casa	[%r31] %asi, %r16, %r13
splash_tba_20_156:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 280: WRPR_TBA_R	wrpr	%r0, %r12, %tba
pmu_20_157:
	nop
	setx 0xfffff662fffff1a9, %g1, %g7
	.word 0xa3800007  ! 281: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_20_158:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d950012  ! 282: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_159
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_159:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 283: RDPC	rd	%pc, %r11
	.word 0x97a00167  ! 284: FABSq	dis not found

jmptr_20_160:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 285: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_20_161:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0da71a6e86c1fefd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 286: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc3ec0026  ! 287: PREFETCHA_R	prefetcha	[%r16, %r6] 0x01, #one_read
	.word 0x8d903f1d  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x1f1d, %pstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_163:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 289: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0xa1a089d1  ! 290: FDIVd	fdivd	%f2, %f48, %f16
	.word 0x91914011  ! 291: WRPR_PIL_R	wrpr	%r5, %r17, %pil
	.word 0xe1bfde00  ! 292: STDFA_R	stda	%f16, [%r0, %r31]
donret_20_165:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_165-donret_20_165-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000560fa | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x8c6, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x2acd0001  ! 1: BRNZ	brnz,a,pt	%r20,<label_0xd0001>
	done
donretarg_20_165:
	.word 0xd6ffe08c  ! 293: SWAPA_I	swapa	%r11, [%r31 + 0x008c] %asi
br_longdelay1_20_166:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x9d97c000  ! 294: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xc19fe080  ! 295: LDDFA_I	ldda	[%r31, 0x0080], %f0
	setx 0x7f1c1adeef1b5d76, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_167:
	.word 0x39400001  ! 296: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_20_168:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb2b9bcf574ff94c6, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 297: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 298: BL	bl,a	<label_0x1>
jmptr_20_169:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 299: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_170:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 300: CASA_R	casa	[%r31] %asi, %r8, %r11
	.word 0xd697e000  ! 301: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
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
br_badelay3_10_0:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xcd6fad59	! Random illegal ?
	.word 0xd914400c  ! 1: LDQF_R	-	[%r17, %r12], %f12
	.word 0x91a24830  ! 1: FADDs	fadds	%f9, %f16, %f8
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_1
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_1:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 2: CASA_R	casa	[%r31] %asi, %r18, %r13
splash_hpstate_10_2:
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x8198230e  ! 3: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030e, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
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
	.word 0xdbe7e012  ! 4: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x83d020b2  ! 5: Tcc_I	te	icc_or_xcc, %r0 + 178
jmptr_10_4:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 6: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xdb27c000  ! 7: STF_R	st	%f13, [%r0, %r31]
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 8: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_10_5:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d948005  ! 9: WRPR_WSTATE_R	wrpr	%r18, %r5, %wstate
	.word 0x93d02035  ! 10: Tcc_I	tne	icc_or_xcc, %r0 + 53
pmu_10_6:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff751fffffb73, %g1, %g7
	.word 0xa3800007  ! 11: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_10_7:
	set 0x60740000, %r31
	.word 0x85847c87  ! 12: WRCCR_I	wr	%r17, 0x1c87, %ccr
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_8
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_8
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_8:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 13: RDPC	rd	%pc, %r11
pmu_10_9:
	nop
	setx 0xfffffe6cfffff4dd, %g1, %g7
	.word 0xa3800007  ! 14: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_10
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_10:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 15: RDPC	rd	%pc, %r19
mondo_10_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d94c011  ! 16: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
br_badelay3_10_12:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x8756366e	! Random illegal ?
	.word 0xa1a00547  ! 1: FSQRTd	fsqrt	
	.word 0x95a44834  ! 17: FADDs	fadds	%f17, %f20, %f10
dvapa_10_13:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbd1, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd89fc031  ! 18: LDDA_R	ldda	[%r31, %r17] 0x01, %r12
tagged_10_14:
	tsubcctv %r20, 0x1844, %r7
	.word 0xd807e0d2  ! 19: LDUW_I	lduw	[%r31 + 0x00d2], %r12
	.word 0xe1bfe040  ! 20: STDFA_I	stda	%f16, [0x0040, %r31]
splash_hpstate_10_15:
	ta T_CHANGE_NONHPRIV
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x81982cd6  ! 21: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd6, %hpstate
	.word 0xd8d7e030  ! 22: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r12
intveclr_10_16:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc8e2f9fcc0db250c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 23: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_17
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_17:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 24: RDPC	rd	%pc, %r17
splash_htba_10_18:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 25: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
br_longdelay2_10_19:
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0xd7e18033  ! 26: CASA_I	casa	[%r6] 0x 1, %r19, %r11
br_longdelay1_10_20:
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0xbfefc000  ! 27: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xb1800011  ! 28: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x93b4c4c1  ! 29: FCMPNE32	fcmpne32	%d50, %d32, %r9
	.word 0x93d02033  ! 30: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_tba_10_21:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 31: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_10_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d94c012  ! 32: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	.word 0x20700001  ! 33: BPN	<illegal instruction>
	.word 0x91942843  ! 34: WRPR_PIL_I	wrpr	%r16, 0x0843, %pil
	.word 0x83d020b3  ! 35: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0x9f802190  ! 36: SIR	sir	0x0190
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_23
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_23:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 37: RDPC	rd	%pc, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_24
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_24:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 38: RDPC	rd	%pc, %r12
jmptr_10_25:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 39: JMPL_R	jmpl	%r27 + %r0, %r27
ibp_10_26:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x10, %r16
ibp_startwait10_26:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_10_26
    mov (~0x10&0xf0), %r16
    ld [%r23], %r16
ibp_wait10_26:
    brnz %r16, ibp_wait10_26
    ld [%r23], %r16
    ba,a ibp_startwait10_26
    mov 0x10, %r16
continue_ibp_10_26:
    ldxa [%g0]0x63, %r14        !Get raw TID
    srlx %r14, 3, %r14          !Get CID
    sllx %r16, %r14, %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_26:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_10_26
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_10_26:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_10_26
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit10_26:
    best_set_reg(0x00000050d4c00021,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd1e7e002  ! 40: CASA_R	casa	[%r31] %asi, %r2, %r8
	setx 0x4267967cb8a1c7ef, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_27:
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9038a7  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x18a7, %pstate
	.word 0xd06fe0be  ! 43: LDSTUB_I	ldstub	%r8, [%r31 + 0x00be]
trapasi_10_29:
mov 0x0, %r1 ! (VA for ASI 0x5b) 
	.word 0xd0d04a00  ! 44: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_30
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_30:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 45: RDPC	rd	%pc, %r10
fpinit_10_31:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8372a  ! 46: PREFETCHA_I	prefetcha	[%r0, + 0xfffff72a] %asi, #one_read
memptr_10_32:
	set 0x60140000, %r31
	.word 0x85823008  ! 47: WRCCR_I	wr	%r8, 0x1008, %ccr
mondo_10_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d948011  ! 48: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	.word 0x91950013  ! 49: WRPR_PIL_R	wrpr	%r20, %r19, %pil
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
	.word 0xd9e7e009  ! 50: CASA_R	casa	[%r31] %asi, %r9, %r12
donret_10_36:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_36-donret_10_36-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fcbc3d | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x5cd, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	retry
donretarg_10_36:
	.word 0xd8ffe04e  ! 51: SWAPA_I	swapa	%r12, [%r31 + 0x004e] %asi
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
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
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_37:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 52: RDPC	rd	%pc, %r13
mondo_10_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d92c004  ! 53: WRPR_WSTATE_R	wrpr	%r11, %r4, %wstate
	setx 0x046db05bb3f0e1e4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_39:
	.word 0x39400001  ! 54: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_40
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_40:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 55: RDPC	rd	%pc, %r18
	.word 0xa7a449c4  ! 56: FDIVd	fdivd	%f48, %f4, %f50
	.word 0xa9480000  ! 57: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xa77037b0  ! 58: POPC_I	popc	0x17b0, %r19
fpinit_10_41:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 59: FDIVs	fdivs	%f0, %f4, %f8
	.word 0x9f803c11  ! 60: SIR	sir	0x1c11
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_42:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e002  ! 61: CASA_R	casa	[%r31] %asi, %r2, %r12
br_badelay2_10_43:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f20, %f12, %f22
	.word 0x99b1c311  ! 62: ALIGNADDRESS	alignaddr	%r7, %r17, %r12
	.word 0x8d802004  ! 63: WRFPRS_I	wr	%r0, 0x0004, %fprs
br_longdelay1_10_44:
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0xbfe7c000  ! 64: SAVE_R	save	%r31, %r0, %r31
	setx 0xb3831e6bc1695540, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_45:
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe53fc000  ! 66: STDF_R	std	%f18, [%r0, %r31]
	.word 0xe53fc00d  ! 67: STDF_R	std	%f18, [%r13, %r31]
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
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_47:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 68: RDPC	rd	%pc, %r18
	.word 0xb1800011  ! 69: WR_STICK_REG_R	wr	%r0, %r17, %-
splash_hpstate_10_48:
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	.word 0x81982707  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0707, %hpstate
intveclr_10_49:
	nop
	ta T_CHANGE_HPRIV
	setx 0x58733f4749e69d8c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 71: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe03fe080  ! 72: STD_I	std	%r16, [%r31 + 0x0080]
splash_lsu_10_50:
	nop
	ta T_CHANGE_HPRIV
	set 0x1f635a4e, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 73: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe137e0b0  ! 74: STQF_I	-	%f16, [0x00b0, %r31]
	.word 0xc1bfe040  ! 75: STDFA_I	stda	%f0, [0x0040, %r31]
	.word 0xe057e018  ! 76: LDSH_I	ldsh	[%r31 + 0x0018], %r16
splash_cmpr_10_51:
	nop
	setx 0xfb440045e865d887, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 77: WRPR_TICK_R	wrpr	%r0, %r17, %tick
splash_lsu_10_52:
	nop
	ta T_CHANGE_HPRIV
	set 0xa59cb150, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 78: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_badelay2_10_53:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f26, %f8, %f6
	.word 0x95b40311  ! 79: ALIGNADDRESS	alignaddr	%r16, %r17, %r10
	.word 0xc1bfde00  ! 80: STDFA_R	stda	%f0, [%r0, %r31]
splash_cmpr_10_54:
	nop
	setx 0xe6a8eb11b5a85ad4, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 81: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0xa1a00174  ! 82: FABSq	dis not found

	.word 0xdadfc022  ! 83: LDXA_R	ldxa	[%r31, %r2] 0x01, %r13
	.word 0xda9fc022  ! 84: LDDA_R	ldda	[%r31, %r2] 0x01, %r13
invtsb_10_57:
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
	.word 0x29800001  ! 85: FBL	fbl,a	<label_0x1>
memptr_10_58:
	set 0x60140000, %r31
	.word 0x85843fd4  ! 86: WRCCR_I	wr	%r16, 0x1fd4, %ccr
	.word 0x91943272  ! 87: WRPR_PIL_I	wrpr	%r16, 0x1272, %pil
	.word 0x83d02032  ! 88: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_tba_10_59:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 89: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe1bfdc00  ! 90: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9f8028c2  ! 91: SIR	sir	0x08c2
	.word 0xda6fe030  ! 92: LDSTUB_I	ldstub	%r13, [%r31 + 0x0030]
	.word 0xda47e010  ! 93: LDSW_I	ldsw	[%r31 + 0x0010], %r13
br_longdelay1_10_60:
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 94: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc32fc000  ! 95: STXFSR_R	st-sfr	%f1, [%r0, %r31]
jmptr_10_62:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 96: JMPL_R	jmpl	%r27 + %r0, %r27
br_badelay2_10_63:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x95b4030c  ! 97: ALIGNADDRESS	alignaddr	%r16, %r12, %r10
mondo_10_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d944002  ! 98: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
	.word 0xc19fde00  ! 99: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_65:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_10_66:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5912128df877c409, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 101: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_10_67:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc7a, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xda9fc029  ! 102: LDDA_R	ldda	[%r31, %r9] 0x01, %r13
trapasi_10_68:
mov 0x28, %r1 ! (VA for ASI 0x5b) 
	.word 0xda904980  ! 103: LDUHA_R	lduha	[%r1, %r0] 0x4c, %r13
	.word 0xc19fdc00  ! 104: LDDFA_R	ldda	[%r31, %r0], %f0
brcommon_10_69:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xdb3fc009  ! 105: STDF_R	std	%f13, [%r9, %r31]
mondo_10_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d94c012  ! 106: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_71:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 107: CASA_R	casa	[%r31] %asi, %r16, %r13
	.word 0xdb27e096  ! 108: STF_I	st	%f13, [0x0096, %r31]
	.word 0xda3ff34b  ! 109: STD_I	std	%r13, [%r31 + 0xfffff34b]
	.word 0xa3702f59  ! 110: POPC_I	popc	0x0f59, %r17
change_to_randtl_10_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_73:
	.word 0x8f902000  ! 111: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd20fe038  ! 112: LDUB_I	ldub	[%r31 + 0x0038], %r9
splash_lsu_10_74:
	nop
	ta T_CHANGE_HPRIV
	set 0xba962c31, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 113: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_longdelay2_10_75:
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0x24cd0001  ! 114: BRLEZ	brlez,a,pt	%r20,<label_0xd0001>
	.word 0xb1800011  ! 115: WR_STICK_REG_R	wr	%r0, %r17, %-
ibp_10_76:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x10, %r16
ibp_startwait10_76:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_10_76
    mov (~0x10&0xf0), %r16
    ld [%r23], %r16
ibp_wait10_76:
    brnz %r16, ibp_wait10_76
    ld [%r23], %r16
    ba,a ibp_startwait10_76
    mov 0x10, %r16
continue_ibp_10_76:
    ldxa [%g0]0x63, %r14        !Get raw TID
    srlx %r14, 3, %r14          !Get CID
    sllx %r16, %r14, %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_76:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_10_76
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_10_76:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_10_76
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit10_76:
    best_set_reg(0x00000050a3c0214d,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0x9f802c82  ! 116: SIR	sir	0x0c82
change_to_randtl_10_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_77:
	.word 0x8f902002  ! 117: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_78) + 24, 16, 16)) -> intp(4,0,7)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_78)&0xffffffff)  + 24, 16, 16)) -> intp(4,0,7)
intvec_10_78:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9194800d  ! 119: WRPR_PIL_R	wrpr	%r18, %r13, %pil
	.word 0x97b48493  ! 120: FCMPLE32	fcmple32	%d18, %d50, %r11
	.word 0xc19fc3e0  ! 121: LDDFA_R	ldda	[%r31, %r0], %f0
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
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
	.word 0xd9e7e011  ! 122: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xd88fe018  ! 123: LDUBA_I	lduba	[%r31, + 0x0018] %asi, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_81
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_81:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 124: RDPC	rd	%pc, %r9
fpinit_10_82:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 125: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xb1800011  ! 126: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xe6dfc031  ! 127: LDXA_R	ldxa	[%r31, %r17] 0x01, %r19
	.word 0xe737e058  ! 128: STQF_I	-	%f19, [0x0058, %r31]
	.word 0x2cc94001  ! 1: BRGZ	brgz,a,pt	%r5,<label_0x94001>
	.word 0x8d903fd1  ! 129: WRPR_PSTATE_I	wrpr	%r0, 0x1fd1, %pstate
trapasi_10_85:
mov 0x0, %r1 ! (VA for ASI 0x4c) 
	.word 0xe6d04b60  ! 130: LDSHA_R	ldsha	[%r1, %r0] 0x5b, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_86) + 8, 16, 16)) -> intp(1,0,5)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_86)&0xffffffff)  + 8, 16, 16)) -> intp(1,0,5)
intvec_10_86:
	.word 0x39400001  ! 131: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_10_87:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d950013  ! 132: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
splash_hpstate_10_88:
	.word 0x81982307  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0307, %hpstate
	.word 0xe19fe040  ! 134: LDDFA_I	ldda	[%r31, 0x0040], %f16
	.word 0xa5702812  ! 135: POPC_I	popc	0x0812, %r18
	.word 0x99a449b2  ! 136: FDIVs	fdivs	%f17, %f18, %f12
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 137: Tcc_R	te	icc_or_xcc, %r0 + %r30
br_longdelay3_10_90:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902000  ! 138: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
fpinit_10_91:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82812  ! 139: PREFETCHA_I	prefetcha	[%r0, + 0x0812] %asi, #one_read
	.word 0x99a089b4  ! 140: FDIVs	fdivs	%f2, %f20, %f12
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x8d90234e  ! 142: WRPR_PSTATE_I	wrpr	%r0, 0x034e, %pstate
tglhtw_10_93:
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
	.word 0xa9b44987  ! 143: BSHUFFLE	fmovc32	%d48, %d38, %d20
trapasi_10_94:
mov 0x10, %r1 ! (VA for ASI 0x5a) 
	.word 0xd6d844a0  ! 144: LDXA_R	ldxa	[%r1, %r0] 0x25, %r11
	.word 0xa9a00174  ! 145: FABSq	dis not found

br_longdelay1_10_95:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x9d97c000  ! 146: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd6bfe028  ! 147: STDA_I	stda	%r11, [%r31 + 0x0028] %asi
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 148: Tcc_R	tne	icc_or_xcc, %r0 + %r30
br_longdelay1_10_96:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9d97c000  ! 149: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x93d02032  ! 150: Tcc_I	tne	icc_or_xcc, %r0 + 50
jmptr_10_97:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 151: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_10_98:
	nop
	setx 0xfffffd99fffff874, %g1, %g7
	.word 0xa3800007  ! 152: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_10_99:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 153: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_10_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d92c014  ! 154: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81460000  ! 156: RD_STICK_REG	stbar
splash_cmpr_10_101:
	nop
	setx 0x07279d1b3148b8ba, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 157: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x9f802cfb  ! 158: SIR	sir	0x0cfb
brcommon_10_102:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xd6dfc02a  ! 159: LDXA_R	ldxa	[%r31, %r10] 0x01, %r11
pmu_10_103:
	nop
	setx 0xfffff203fffff2f8, %g1, %g7
	.word 0xa3800007  ! 160: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe1bfe0c0  ! 161: STDFA_I	stda	%f16, [0x00c0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_104) + 40, 16, 16)) -> intp(4,0,15)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_104)&0xffffffff)  + 40, 16, 16)) -> intp(4,0,15)
intvec_10_104:
	.word 0x39400001  ! 162: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa570231d  ! 163: POPC_I	popc	0x031d, %r18
	.word 0x8d902d8c  ! 164: WRPR_PSTATE_I	wrpr	%r0, 0x0d8c, %pstate
jmptr_10_106:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 165: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_10_107:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd03, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc014  ! 166: STXFSR_R	st-sfr	%f1, [%r20, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 167: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0x95a409cb  ! 168: FDIVd	fdivd	%f16, %f42, %f10
	.word 0x99a1c9d2  ! 169: FDIVd	fdivd	%f38, %f18, %f12
dvapa_10_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfa2, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe09fc023  ! 170: LDDA_R	ldda	[%r31, %r3] 0x01, %r16
mondo_10_110:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d950013  ! 171: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
	.word 0xe05fe028  ! 172: LDX_I	ldx	[%r31 + 0x0028], %r16
	.word 0xab810007  ! 173: WR_CLEAR_SOFTINT_R	wr	%r4, %r7, %clear_softint
intveclr_10_111:
	nop
	ta T_CHANGE_HPRIV
	setx 0xce1cbb98405c56cb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 174: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93a00172  ! 175: FABSq	dis not found

	.word 0xb1800011  ! 176: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xc19fdb60  ! 177: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xb1800011  ! 178: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xc3ec4034  ! 179: PREFETCHA_R	prefetcha	[%r17, %r20] 0x01, #one_read
	.word 0x83d020b5  ! 180: Tcc_I	te	icc_or_xcc, %r0 + 181
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_112:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 181: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x2a700001  ! 182: BPCS	<illegal instruction>
	.word 0x8d90267f  ! 183: WRPR_PSTATE_I	wrpr	%r0, 0x067f, %pstate
	.word 0x91948011  ! 184: WRPR_PIL_R	wrpr	%r18, %r17, %pil
donret_10_115:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_115-donret_10_115-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005d39ca | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf5f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_115:
	.word 0xd0ffe0ed  ! 185: SWAPA_I	swapa	%r8, [%r31 + 0x00ed] %asi
	.word 0xc1bfc2c0  ! 186: STDFA_R	stda	%f0, [%r0, %r31]
splash_cmpr_10_116:
	nop
	setx 0x89c69df36f7db9fa, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 187: WRPR_TICK_R	wrpr	%r0, %r17, %tick
trapasi_10_117:
mov 0x18, %r1 ! (VA for ASI 0x4c) 
	.word 0xd0c84b60  ! 188: LDSBA_R	ldsba	[%r1, %r0] 0x5b, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_118
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_118:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 189: RDPC	rd	%pc, %r9
	.word 0xe827e0dc  ! 190: STW_I	stw	%r20, [%r31 + 0x00dc]
    set 0x32bb, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b407d4  ! 191: PDIST	pdistn	%d16, %d20, %d12
	.word 0x97450000  ! 192: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0xe1bfde00  ! 193: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe81fc000  ! 194: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0xe857e038  ! 195: LDSH_I	ldsh	[%r31 + 0x0038], %r20
	.word 0xa1a149ad  ! 196: FDIVs	fdivs	%f5, %f13, %f16
	.word 0xc1bfe060  ! 197: STDFA_I	stda	%f0, [0x0060, %r31]
	.word 0x9ba349d3  ! 198: FDIVd	fdivd	%f44, %f50, %f44
	.word 0xb1800011  ! 199: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x9f802ef4  ! 200: SIR	sir	0x0ef4
jmptr_10_119:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 201: JMPL_R	jmpl	%r27 + %r0, %r27
br_longdelay3_10_120:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902003  ! 202: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xc1bfdc00  ! 203: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd437e07e  ! 204: STH_I	sth	%r10, [%r31 + 0x007e]
splash_tba_10_121:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 205: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_10_122:
	tsubcctv %r8, 0x1941, %r13
	.word 0xd407e0b0  ! 206: LDUW_I	lduw	[%r31 + 0x00b0], %r10
	.word 0x9f8026c0  ! 207: SIR	sir	0x06c0
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_123
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_123:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 208: CASA_R	casa	[%r31] %asi, %r10, %r10
jmptr_10_124:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 209: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa550c000  ! 210: RDPR_TT	<illegal instruction>
	.word 0xe137c000  ! 211: STQF_R	-	%f16, [%r0, %r31]
intveclr_10_125:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1b0cfa6fa9f7c1ed, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 212: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_10_126:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5c4748a401173376, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 213: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x32700001  ! 214: BPNE	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r16
br_longdelay3_10_127:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902002  ! 216: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
splash_lsu_10_128:
	nop
	ta T_CHANGE_HPRIV
	set 0x2b8e3daf, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_129:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 218: CASA_R	casa	[%r31] %asi, %r10, %r16
pmu_10_130:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffb11fffff3d6, %g1, %g7
	.word 0xa3800007  ! 219: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9192400c  ! 220: WRPR_PIL_R	wrpr	%r9, %r12, %pil
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 221: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87ac0a47  ! 222: FCMPd	fcmpd	%fcc<n>, %f16, %f38
intveclr_10_132:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7d13bd5614b23d53, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_10_133:
	ta T_CHANGE_NONHPRIV
	.word 0x81982e8f  ! 224: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8f, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_134)+40, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_134)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_134:
	.word 0xa984e27b  ! 225: WR_SET_SOFTINT_I	wr	%r19, 0x027b, %set_softint
	.word 0x91520000  ! 226: RDPR_PIL	<illegal instruction>
pmu_10_135:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffa0cfffff3cc, %g1, %g7
	.word 0xa3800007  ! 227: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f802da9  ! 228: SIR	sir	0x0da9
	.word 0xe537c000  ! 229: STQF_R	-	%f18, [%r0, %r31]
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 230: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc3e98032  ! 231: PREFETCHA_R	prefetcha	[%r6, %r18] 0x01, #one_read
splash_hpstate_10_136:
	.word 0x2ecc8001  ! 1: BRGEZ	brgez,a,pt	%r18,<label_0xc8001>
	.word 0x81982907  ! 232: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0907, %hpstate
	setx 0x85134fb1cb0adaee, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_137:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 234: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb1800011  ! 235: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xd80fe038  ! 236: LDUB_I	ldub	[%r31 + 0x0038], %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_138
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_138
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_138:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 237: RDPC	rd	%pc, %r19
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 238: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_139
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_139:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 239: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0xe71fc000  ! 240: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x81460000  ! 241: RD_STICK_REG	stbar
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_140
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_140:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 242: RDPC	rd	%pc, %r11
	.word 0x93d020b5  ! 243: Tcc_I	tne	icc_or_xcc, %r0 + 181
trapasi_10_141:
mov 0x3c0, %r1 ! (VA for ASI 0x25) 
	.word 0xe0904b60  ! 244: LDUHA_R	lduha	[%r1, %r0] 0x5b, %r16
	.word 0xa5a00170  ! 245: FABSq	dis not found

	.word 0x91d02033  ! 246: Tcc_I	ta	icc_or_xcc, %r0 + 51
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 247: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_10_142:
	nop
	ta T_CHANGE_HPRIV
	set 0x2fc20186, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 248: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_10_143:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffe2cfffff006, %g1, %g7
	.word 0xa3800007  ! 249: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe1bfe040  ! 250: STDFA_I	stda	%f16, [0x0040, %r31]
	.word 0xb1800011  ! 251: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x83d02032  ! 252: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xe1bfda00  ! 253: STDFA_R	stda	%f16, [%r0, %r31]
memptr_10_144:
	set user_data_start, %r31
	.word 0x8580fcea  ! 254: WRCCR_I	wr	%r3, 0x1cea, %ccr
fpinit_10_145:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82190  ! 255: PREFETCHA_I	prefetcha	[%r0, + 0x0190] %asi, #one_read
	.word 0x8d903d66  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x1d66, %pstate
	.word 0xe527e0b8  ! 257: STF_I	st	%f18, [0x00b8, %r31]
splash_lsu_10_147:
	nop
	ta T_CHANGE_HPRIV
	set 0xcd267cee, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 258: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe0e0  ! 259: STDFA_I	stda	%f16, [0x00e0, %r31]
mondo_10_148:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d940010  ! 260: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
	.word 0xa7480000  ! 261: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
brcommon_10_149:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xe49fc034  ! 262: LDDA_R	ldda	[%r31, %r20] 0x01, %r18
	.word 0x97a00163  ! 263: FABSq	dis not found

	.word 0xc3ec402d  ! 264: PREFETCHA_R	prefetcha	[%r17, %r13] 0x01, #one_read
	.word 0xe827e0d4  ! 265: STW_I	stw	%r20, [%r31 + 0x00d4]
	.word 0xe8cfe000  ! 266: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r20
	.word 0x39400001  ! 267: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_10_150:
	set user_data_start, %r31
	.word 0x858421e5  ! 268: WRCCR_I	wr	%r16, 0x01e5, %ccr
splash_lsu_10_151:
	nop
	ta T_CHANGE_HPRIV
	set 0x2266bdae, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd43fe03c  ! 270: STD_I	std	%r10, [%r31 + 0x003c]
	.word 0x9ba2c9cc  ! 271: FDIVd	fdivd	%f42, %f12, %f44
	.word 0xab80c003  ! 272: WR_CLEAR_SOFTINT_R	wr	%r3, %r3, %clear_softint
pmu_10_152:
	nop
	setx 0xfffff8eefffff4fb, %g1, %g7
	.word 0xa3800007  ! 273: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_10_153:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf6b, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe4bfc033  ! 274: STDA_R	stda	%r18, [%r31 + %r19] 0x01
	.word 0x9bb2c493  ! 275: FCMPLE32	fcmple32	%d42, %d50, %r13
jmptr_10_154:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 276: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe1bfe0e0  ! 277: STDFA_I	stda	%f16, [0x00e0, %r31]
	.word 0x9f8032dd  ! 278: SIR	sir	0x12dd
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_155:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 279: CASA_R	casa	[%r31] %asi, %r16, %r13
splash_tba_10_156:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 280: WRPR_TBA_R	wrpr	%r0, %r12, %tba
pmu_10_157:
	nop
	setx 0xfffff0c3fffff881, %g1, %g7
	.word 0xa3800007  ! 281: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_10_158:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d90c010  ! 282: WRPR_WSTATE_R	wrpr	%r3, %r16, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_159
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_159:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 283: RDPC	rd	%pc, %r12
	.word 0x91a00164  ! 284: FABSq	dis not found

jmptr_10_160:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 285: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_10_161:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1ca8fb376354d187, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 286: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7a309c2  ! 287: FDIVd	fdivd	%f12, %f2, %f50
	.word 0x8d9034b2  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x14b2, %pstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_163:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 289: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0xa7a089c5  ! 290: FDIVd	fdivd	%f2, %f36, %f50
	.word 0x91934012  ! 291: WRPR_PIL_R	wrpr	%r13, %r18, %pil
	.word 0xe1bfdf20  ! 292: STDFA_R	stda	%f16, [%r0, %r31]
donret_10_165:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_165-donret_10_165-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00aabba6 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x80f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x22cc0001  ! 1: BRZ	brz,a,pt	%r16,<label_0xc0001>
	done
donretarg_10_165:
	.word 0xd6ffe0dd  ! 293: SWAPA_I	swapa	%r11, [%r31 + 0x00dd] %asi
br_longdelay1_10_166:
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 294: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe19fe080  ! 295: LDDFA_I	ldda	[%r31, 0x0080], %f16
	setx 0x7308d25464171ba5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_167:
	.word 0x39400001  ! 296: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_10_168:
	nop
	ta T_CHANGE_HPRIV
	setx 0x44a7b53ff9625b86, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 297: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 298: BL	bl,a	<label_0x1>
jmptr_10_169:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 299: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_170:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 300: CASA_R	casa	[%r31] %asi, %r8, %r11
	.word 0xd697e008  ! 301: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r11
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
br_badelay3_8_0:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x9f749210	! Random illegal ?
	.word 0xd915000a  ! 1: LDQF_R	-	[%r20, %r10], %f12
	.word 0xa7a20833  ! 1: FADDs	fadds	%f8, %f19, %f19
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_1
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_1:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 2: CASA_R	casa	[%r31] %asi, %r18, %r13
splash_hpstate_8_2:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x8198254f  ! 3: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054f, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_3:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 4: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x91d020b3  ! 5: Tcc_I	ta	icc_or_xcc, %r0 + 179
jmptr_8_4:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 6: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xdb27c000  ! 7: STF_R	st	%f13, [%r0, %r31]
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 8: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_8_5:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d918014  ! 9: WRPR_WSTATE_R	wrpr	%r6, %r20, %wstate
	.word 0x91d02032  ! 10: Tcc_I	ta	icc_or_xcc, %r0 + 50
pmu_8_6:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff1e3fffff694, %g1, %g7
	.word 0xa3800007  ! 11: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_8_7:
	set 0x60540000, %r31
	.word 0x8580e917  ! 12: WRCCR_I	wr	%r3, 0x0917, %ccr
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_8
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_8
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_8:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 13: RDPC	rd	%pc, %r12
pmu_8_9:
	nop
	setx 0xfffff86cfffffc58, %g1, %g7
	.word 0xa3800007  ! 14: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_10
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_10:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 15: RDPC	rd	%pc, %r11
mondo_8_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d944011  ! 16: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
br_badelay3_8_12:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xed723b17	! Random illegal ?
	.word 0x93a00552  ! 1: FSQRTd	fsqrt	
	.word 0xa3a30830  ! 17: FADDs	fadds	%f12, %f16, %f17
dvapa_8_13:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa66, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd83ffc48  ! 18: STD_I	std	%r12, [%r31 + 0xfffffc48]
tagged_8_14:
	tsubcctv %r10, 0x1654, %r18
	.word 0xd807e028  ! 19: LDUW_I	lduw	[%r31 + 0x0028], %r12
	.word 0xe1bfe0e0  ! 20: STDFA_I	stda	%f16, [0x00e0, %r31]
splash_hpstate_8_15:
	ta T_CHANGE_NONHPRIV
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x81982e74  ! 21: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e74, %hpstate
	.word 0xd8d7e008  ! 22: LDSHA_I	ldsha	[%r31, + 0x0008] %asi, %r12
intveclr_8_16:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf2a6099ca21e882e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 23: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_17
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_17:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 24: RDPC	rd	%pc, %r17
splash_htba_8_18:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 25: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
br_longdelay2_8_19:
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x87ad0a47  ! 26: FCMPd	fcmpd	%fcc<n>, %f20, %f38
br_longdelay1_8_20:
	.word 0x22c98001  ! 1: BRZ	brz,a,pt	%r6,<label_0x98001>
	.word 0xbfe7c000  ! 27: SAVE_R	save	%r31, %r0, %r31
	.word 0xb1800011  ! 28: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x9f8030bd  ! 29: SIR	sir	0x10bd
	.word 0x91d02034  ! 30: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_tba_8_21:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 31: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_8_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d940001  ! 32: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
	.word 0x20700001  ! 33: BPN	<illegal instruction>
	.word 0x9190aac9  ! 34: WRPR_PIL_I	wrpr	%r2, 0x0ac9, %pil
	.word 0x83d020b5  ! 35: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0x9f80275b  ! 36: SIR	sir	0x075b
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_23
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_23:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 37: RDPC	rd	%pc, %r11
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_24
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_24:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 38: RDPC	rd	%pc, %r18
jmptr_8_25:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 39: JMPL_R	jmpl	%r27 + %r0, %r27
ibp_8_26:
	nop
	ta T_CHANGE_HPRIV
	.word 0xd097c022  ! 40: LDUHA_R	lduha	[%r31, %r2] 0x01, %r8
	setx 0x2864519c87572896, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_27:
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903a99  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x1a99, %pstate
	.word 0xd06fe03f  ! 43: LDSTUB_I	ldstub	%r8, [%r31 + 0x003f]
trapasi_8_29:
mov 0x20, %r1 ! (VA for ASI 0x5b) 
	.word 0xd0c84b40  ! 44: LDSBA_R	ldsba	[%r1, %r0] 0x5a, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_30
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_30:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 45: RDPC	rd	%pc, %r19
fpinit_8_31:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 46: FCMPLE32	fcmple32	%d0, %d4, %r6
memptr_8_32:
	set 0x60140000, %r31
	.word 0x85852555  ! 47: WRCCR_I	wr	%r20, 0x0555, %ccr
mondo_8_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d924003  ! 48: WRPR_WSTATE_R	wrpr	%r9, %r3, %wstate
	.word 0x91940012  ! 49: WRPR_PIL_R	wrpr	%r16, %r18, %pil
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_35:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 50: CASA_R	casa	[%r31] %asi, %r9, %r12
donret_8_36:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_36-donret_8_36-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ff87d8 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd0d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	retry
donretarg_8_36:
	.word 0xd8ffe0fa  ! 51: SWAPA_I	swapa	%r12, [%r31 + 0x00fa] %asi
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
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
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_37:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 52: RDPC	rd	%pc, %r16
mondo_8_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d910012  ! 53: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
	setx 0x066149e5f3c340c8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_39:
	.word 0x39400001  ! 54: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_40
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_40:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 55: RDPC	rd	%pc, %r9
	.word 0xa5a149d1  ! 56: FDIVd	fdivd	%f36, %f48, %f18
	.word 0xa3480000  ! 57: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xc3e9802d  ! 58: PREFETCHA_R	prefetcha	[%r6, %r13] 0x01, #one_read
fpinit_8_41:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 59: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0x9f802de3  ! 60: SIR	sir	0x0de3
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_42:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e002  ! 61: CASA_R	casa	[%r31] %asi, %r2, %r12
br_badelay2_8_43:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f4, %f24, %f4
	.word 0xa7b14314  ! 62: ALIGNADDRESS	alignaddr	%r5, %r20, %r19
	.word 0x8d802004  ! 63: WRFPRS_I	wr	%r0, 0x0004, %fprs
br_longdelay1_8_44:
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x9d97c000  ! 64: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	setx 0x13cc9f7fdb66396c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_45:
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe53fc000  ! 66: STDF_R	std	%f18, [%r0, %r31]
vahole_8_46:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe5e7e00d  ! 67: CASA_R	casa	[%r31] %asi, %r13, %r18
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
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_47:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 68: RDPC	rd	%pc, %r13
	.word 0xb1800011  ! 69: WR_STICK_REG_R	wr	%r0, %r17, %-
splash_hpstate_8_48:
	.word 0x26cc0001  ! 1: BRLZ	brlz,a,pt	%r16,<label_0xc0001>
	.word 0x81982f4c  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4c, %hpstate
intveclr_8_49:
	nop
	ta T_CHANGE_HPRIV
	setx 0x092a989780362a53, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 71: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe03fe020  ! 72: STD_I	std	%r16, [%r31 + 0x0020]
splash_lsu_8_50:
	nop
	ta T_CHANGE_HPRIV
	set 0x6a0c33d5, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 73: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe137e0d0  ! 74: STQF_I	-	%f16, [0x00d0, %r31]
	.word 0xc19fda00  ! 75: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe057e008  ! 76: LDSH_I	ldsh	[%r31 + 0x0008], %r16
splash_cmpr_8_51:
	nop
	setx 0xb0a3b2504a3934e8, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 77: WRPR_TICK_R	wrpr	%r0, %r17, %tick
splash_lsu_8_52:
	nop
	ta T_CHANGE_HPRIV
	set 0x60d65446, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 78: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_badelay2_8_53:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f24, %f28, %f6
	.word 0x99b30312  ! 79: ALIGNADDRESS	alignaddr	%r12, %r18, %r12
	.word 0xe1bfd920  ! 80: STDFA_R	stda	%f16, [%r0, %r31]
splash_cmpr_8_54:
	nop
	setx 0x819e9ffb5aa6f286, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 81: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x97a00167  ! 82: FABSq	dis not found

vahole_8_55:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xda3fe43c  ! 83: STD_I	std	%r13, [%r31 + 0x043c]
vahole_8_56:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xdb3fc002  ! 84: STDF_R	std	%f13, [%r2, %r31]
	.word 0x29800001  ! 85: FBL	fbl,a	<label_0x1>
memptr_8_58:
	set 0x60740000, %r31
	.word 0x85832c6b  ! 86: WRCCR_I	wr	%r12, 0x0c6b, %ccr
	.word 0x9190feea  ! 87: WRPR_PIL_I	wrpr	%r3, 0x1eea, %pil
	.word 0x91d02032  ! 88: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_tba_8_59:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 89: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe1bfe000  ! 90: STDFA_I	stda	%f16, [0x0000, %r31]
	.word 0x9f80260e  ! 91: SIR	sir	0x060e
	.word 0xda6fe03d  ! 92: LDSTUB_I	ldstub	%r13, [%r31 + 0x003d]
	.word 0xda47e008  ! 93: LDSW_I	ldsw	[%r31 + 0x0008], %r13
br_longdelay1_8_60:
	.word 0x2ec94001  ! 1: BRGEZ	brgez,a,pt	%r5,<label_0x94001>
	.word 0xbfefc000  ! 94: RESTORE_R	restore	%r31, %r0, %r31
	bg,a	 skip_8_61
	.word 0xa7b284c7  ! 1: FCMPNE32	fcmpne32	%d10, %d38, %r19
.align 32
skip_8_61:
	.word 0xc36fe026  ! 95: PREFETCH_I	prefetch	[%r31 + 0x0026], #one_read
jmptr_8_62:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 96: JMPL_R	jmpl	%r27 + %r0, %r27
br_badelay2_8_63:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x95b5030a  ! 97: ALIGNADDRESS	alignaddr	%r20, %r10, %r10
mondo_8_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d94c010  ! 98: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0xc1bfc2c0  ! 99: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_8_65:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_8_66:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf7301d227c8fcc7b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 101: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_8_67:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd79, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdb3fc009  ! 102: STDF_R	std	%f13, [%r9, %r31]
trapasi_8_68:
mov 0x10, %r1 ! (VA for ASI 0x5b) 
	.word 0xda904980  ! 103: LDUHA_R	lduha	[%r1, %r0] 0x4c, %r13
	.word 0xc19fd960  ! 104: LDDFA_R	ldda	[%r31, %r0], %f0
brcommon_8_69:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xdadfc029  ! 105: LDXA_R	ldxa	[%r31, %r9] 0x01, %r13
mondo_8_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d94400b  ! 106: WRPR_WSTATE_R	wrpr	%r17, %r11, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_71:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 107: CASA_R	casa	[%r31] %asi, %r16, %r13
	.word 0xdb27e0f3  ! 108: STF_I	st	%f13, [0x00f3, %r31]
vahole_8_72:
    nop
    ta T_CHANGE_NONHPRIV
    setx vahole_target, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xdb3fc010  ! 109: STDF_R	std	%f13, [%r16, %r31]
	.word 0x93b4c7cd  ! 110: PDIST	pdistn	%d50, %d44, %d40
change_to_randtl_8_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_73:
	.word 0x8f902000  ! 111: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd20fe000  ! 112: LDUB_I	ldub	[%r31 + 0x0000], %r9
splash_lsu_8_74:
	nop
	ta T_CHANGE_HPRIV
	set 0x31e33801, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 113: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_longdelay2_8_75:
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0x87acca45  ! 114: FCMPd	fcmpd	%fcc<n>, %f50, %f36
	.word 0xb1800011  ! 115: WR_STICK_REG_R	wr	%r0, %r17, %-
ibp_8_76:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe03fec82  ! 116: STD_I	std	%r16, [%r31 + 0x0c82]
change_to_randtl_8_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_77:
	.word 0x8f902001  ! 117: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_78) + 48, 16, 16)) -> intp(0,0,26)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_78)&0xffffffff)  + 48, 16, 16)) -> intp(0,0,26)
intvec_8_78:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91910012  ! 119: WRPR_PIL_R	wrpr	%r4, %r18, %pil
	.word 0x95a489c4  ! 120: FDIVd	fdivd	%f18, %f4, %f10
	.word 0xe19fc2c0  ! 121: LDDFA_R	ldda	[%r31, %r0], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_80:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 122: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xd88fe010  ! 123: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_81
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_81:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 124: RDPC	rd	%pc, %r11
fpinit_8_82:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 125: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xb1800011  ! 126: WR_STICK_REG_R	wr	%r0, %r17, %-
iaw_8_83:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x8, %r16
iaw_startwait8_83:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_83
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_83:
    brnz %r16, iaw_wait8_83
    ld [%r23], %r16
    ba,a iaw_startwait8_83
    mov 0x8, %r16
continue_iaw_8_83:
    ldxa [%g0]0x63, %r14        !Get raw TID
    srlx %r14, 3, %r14          !Get CID
    sllx %r16, %r14, %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_83:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_8_83
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_83:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_8_83
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_83:
	mov 0x38, %r18
iaw1_8_83:
	best_set_reg(0x00000000e1200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe63fe970  ! 127: STD_I	std	%r19, [%r31 + 0x0970]
	.word 0xe737e099  ! 128: STQF_I	-	%f19, [0x0099, %r31]
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x8d90243e  ! 129: WRPR_PSTATE_I	wrpr	%r0, 0x043e, %pstate
trapasi_8_85:
mov 0x0, %r1 ! (VA for ASI 0x4c) 
	.word 0xe69044a0  ! 130: LDUHA_R	lduha	[%r1, %r0] 0x25, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_86) + 48, 16, 16)) -> intp(0,0,30)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_86)&0xffffffff)  + 48, 16, 16)) -> intp(0,0,30)
intvec_8_86:
	.word 0x39400001  ! 131: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_8_87:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d90c011  ! 132: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
splash_hpstate_8_88:
	.word 0x819826cf  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06cf, %hpstate
	.word 0xe19fe040  ! 134: LDDFA_I	ldda	[%r31, 0x0040], %f16
	.word 0x87a98a41  ! 135: FCMPd	fcmpd	%fcc<n>, %f6, %f32
unsupttte_8_89:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x93b24492  ! 136: FCMPLE32	fcmple32	%d40, %d18, %r9
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 137: Tcc_R	ta	icc_or_xcc, %r0 + %r30
br_longdelay3_8_90:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902002  ! 138: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
fpinit_8_91:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82812  ! 139: PREFETCHA_I	prefetcha	[%r0, + 0x0812] %asi, #one_read
	.word 0xa97033af  ! 140: POPC_I	popc	0x13af, %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x8d903ba0  ! 142: WRPR_PSTATE_I	wrpr	%r0, 0x1ba0, %pstate
	.word 0x93b48990  ! 143: BSHUFFLE	fmovc32	%d18, %d16, %d40
trapasi_8_94:
mov 0x8, %r1 ! (VA for ASI 0x5a) 
	.word 0xd6d04b40  ! 144: LDSHA_R	ldsha	[%r1, %r0] 0x5a, %r11
	.word 0x91a00171  ! 145: FABSq	dis not found

br_longdelay1_8_95:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x9d97c000  ! 146: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd6bfe0f0  ! 147: STDA_I	stda	%r11, [%r31 + 0x00f0] %asi
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 148: Tcc_R	ta	icc_or_xcc, %r0 + %r30
br_longdelay1_8_96:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x9d97c000  ! 149: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x91d020b4  ! 150: Tcc_I	ta	icc_or_xcc, %r0 + 180
jmptr_8_97:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 151: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_8_98:
	nop
	setx 0xfffff22dfffffe7d, %g1, %g7
	.word 0xa3800007  ! 152: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_8_99:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 153: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_8_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d918012  ! 154: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81460000  ! 156: RD_STICK_REG	stbar
splash_cmpr_8_101:
	nop
	setx 0x78db52b2b287a1e8, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 157: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x9f803744  ! 158: SIR	sir	0x1744
brcommon_8_102:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xd73fc00a  ! 159: STDF_R	std	%f11, [%r10, %r31]
pmu_8_103:
	nop
	setx 0xfffff15cfffff764, %g1, %g7
	.word 0xa3800007  ! 160: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe1bfdc00  ! 161: STDFA_R	stda	%f16, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_104) + 16, 16, 16)) -> intp(3,0,29)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_104)&0xffffffff)  + 16, 16, 16)) -> intp(3,0,29)
intvec_8_104:
	.word 0x39400001  ! 162: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5a4c9b4  ! 163: FDIVs	fdivs	%f19, %f20, %f18
	.word 0x8d903856  ! 164: WRPR_PSTATE_I	wrpr	%r0, 0x1856, %pstate
jmptr_8_106:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 165: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_8_107:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbf7, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd297c034  ! 166: LDUHA_R	lduha	[%r31, %r20] 0x01, %r9
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 167: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0x91a049d1  ! 168: FDIVd	fdivd	%f32, %f48, %f8
	.word 0xa9a489c1  ! 169: FDIVd	fdivd	%f18, %f32, %f20
dvapa_8_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0xad2, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe0dfc023  ! 170: LDXA_R	ldxa	[%r31, %r3] 0x01, %r16
mondo_8_110:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d92000a  ! 171: WRPR_WSTATE_R	wrpr	%r8, %r10, %wstate
	.word 0xe05fe038  ! 172: LDX_I	ldx	[%r31 + 0x0038], %r16
	.word 0xab804012  ! 173: WR_CLEAR_SOFTINT_R	wr	%r1, %r18, %clear_softint
intveclr_8_111:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc88db8486e3a9164, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 174: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9a00173  ! 175: FABSq	dis not found

	.word 0xb1800011  ! 176: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xc1bfe080  ! 177: STDFA_I	stda	%f0, [0x0080, %r31]
	.word 0xb1800011  ! 178: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xa37025f3  ! 179: POPC_I	popc	0x05f3, %r17
	.word 0x91d020b4  ! 180: Tcc_I	ta	icc_or_xcc, %r0 + 180
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_112:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 181: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x2a700001  ! 182: BPCS	<illegal instruction>
	.word 0x8d903531  ! 183: WRPR_PSTATE_I	wrpr	%r0, 0x1531, %pstate
	.word 0x9194c012  ! 184: WRPR_PIL_R	wrpr	%r19, %r18, %pil
donret_8_115:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_115-donret_8_115-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0xffb0 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x417, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_115:
	.word 0xd0ffe038  ! 185: SWAPA_I	swapa	%r8, [%r31 + 0x0038] %asi
	.word 0xc1bfc3e0  ! 186: STDFA_R	stda	%f0, [%r0, %r31]
splash_cmpr_8_116:
	nop
	setx 0x4e49959d12bcd048, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 187: WRPR_TICK_R	wrpr	%r0, %r17, %tick
trapasi_8_117:
mov 0x10, %r1 ! (VA for ASI 0x4c) 
	.word 0xd0d044a0  ! 188: LDSHA_R	ldsha	[%r1, %r0] 0x25, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_118
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_118:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 189: RDPC	rd	%pc, %r8
	.word 0xe827e090  ! 190: STW_I	stw	%r20, [%r31 + 0x0090]
    set 0x22e0, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b2c7d4  ! 191: PDIST	pdistn	%d42, %d20, %d12
	.word 0x93450000  ! 192: RD_SET_SOFTINT	rd	%set_softint, %r9
	.word 0xe1bfd920  ! 193: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe81fc000  ! 194: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0xe857e020  ! 195: LDSH_I	ldsh	[%r31 + 0x0020], %r20
	.word 0x93a4c9b4  ! 196: FDIVs	fdivs	%f19, %f20, %f9
	.word 0xe19fda00  ! 197: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa7b347d2  ! 198: PDIST	pdistn	%d44, %d18, %d50
	.word 0xb1800011  ! 199: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x9f802408  ! 200: SIR	sir	0x0408
jmptr_8_119:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 201: JMPL_R	jmpl	%r27 + %r0, %r27
br_longdelay3_8_120:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902003  ! 202: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xe1bfd960  ! 203: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd437e09a  ! 204: STH_I	sth	%r10, [%r31 + 0x009a]
splash_tba_8_121:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 205: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_8_122:
	tsubcctv %r10, 0x1653, %r7
	.word 0xd407e04d  ! 206: LDUW_I	lduw	[%r31 + 0x004d], %r10
	.word 0x9f8030d2  ! 207: SIR	sir	0x10d2
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_123
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_123:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 208: CASA_R	casa	[%r31] %asi, %r10, %r10
jmptr_8_124:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 209: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa750c000  ! 210: RDPR_TT	<illegal instruction>
	.word 0xe137c000  ! 211: STQF_R	-	%f16, [%r0, %r31]
intveclr_8_125:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc97ae6e671e4dce2, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 212: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_8_126:
	nop
	ta T_CHANGE_HPRIV
	setx 0xfa7d4b905b8f50fb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 213: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x32700001  ! 214: BPNE	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r16
br_longdelay3_8_127:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902004  ! 216: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
splash_lsu_8_128:
	nop
	ta T_CHANGE_HPRIV
	set 0xb9267a18, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_129:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 218: CASA_R	casa	[%r31] %asi, %r10, %r16
pmu_8_130:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff45dfffff159, %g1, %g7
	.word 0xa3800007  ! 219: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91950012  ! 220: WRPR_PIL_R	wrpr	%r20, %r18, %pil
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 221: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc3ec0026  ! 222: PREFETCHA_R	prefetcha	[%r16, %r6] 0x01, #one_read
intveclr_8_132:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8438b185da1945a3, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_8_133:
	ta T_CHANGE_NONHPRIV
	.word 0x8198299f  ! 224: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099f, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_134)+16, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_134)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_134:
	.word 0xa980a98c  ! 225: WR_SET_SOFTINT_I	wr	%r2, 0x098c, %set_softint
	.word 0xa3520000  ! 226: RDPR_PIL	<illegal instruction>
pmu_8_135:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffb2bfffff104, %g1, %g7
	.word 0xa3800007  ! 227: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f80339c  ! 228: SIR	sir	0x139c
	.word 0xe537c000  ! 229: STQF_R	-	%f18, [%r0, %r31]
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 230: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc3ec0026  ! 231: PREFETCHA_R	prefetcha	[%r16, %r6] 0x01, #one_read
splash_hpstate_8_136:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x81982206  ! 232: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0206, %hpstate
	setx 0x25bba1a5b4dc5740, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_137:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 234: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb1800011  ! 235: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xd80fe010  ! 236: LDUB_I	ldub	[%r31 + 0x0010], %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_138
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_138
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_138:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 237: RDPC	rd	%pc, %r10
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 238: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_139
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_139:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 239: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0xe71fc000  ! 240: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x81460000  ! 241: RD_STICK_REG	stbar
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_140
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_140:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 242: RDPC	rd	%pc, %r11
	.word 0x93d02034  ! 243: Tcc_I	tne	icc_or_xcc, %r0 + 52
trapasi_8_141:
mov 0x3d0, %r1 ! (VA for ASI 0x25) 
	.word 0xe0d84b60  ! 244: LDXA_R	ldxa	[%r1, %r0] 0x5b, %r16
	.word 0x91a00171  ! 245: FABSq	dis not found

	.word 0x93d02032  ! 246: Tcc_I	tne	icc_or_xcc, %r0 + 50
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 247: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_8_142:
	nop
	ta T_CHANGE_HPRIV
	set 0xaf0eba26, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 248: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_8_143:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff498fffff98a, %g1, %g7
	.word 0xa3800007  ! 249: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe1bfe080  ! 250: STDFA_I	stda	%f16, [0x0080, %r31]
	.word 0xb1800011  ! 251: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x91d02033  ! 252: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xc19fc3e0  ! 253: LDDFA_R	ldda	[%r31, %r0], %f0
memptr_8_144:
	set user_data_start, %r31
	.word 0x85847638  ! 254: WRCCR_I	wr	%r17, 0x1638, %ccr
fpinit_8_145:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 255: FDIVd	fdivd	%f0, %f4, %f6
	.word 0x8d903d95  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x1d95, %pstate
	.word 0xe527e048  ! 257: STF_I	st	%f18, [0x0048, %r31]
splash_lsu_8_147:
	nop
	ta T_CHANGE_HPRIV
	set 0x761ca8ba, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 258: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe000  ! 259: STDFA_I	stda	%f0, [0x0000, %r31]
mondo_8_148:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d948006  ! 260: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
	.word 0x95480000  ! 261: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
brcommon_8_149:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xe5e7e014  ! 262: CASA_R	casa	[%r31] %asi, %r20, %r18
	.word 0x9ba00162  ! 263: FABSq	dis not found

	.word 0x9f803663  ! 264: SIR	sir	0x1663
	.word 0xe827e0ec  ! 265: STW_I	stw	%r20, [%r31 + 0x00ec]
	.word 0xe8cfe018  ! 266: LDSBA_I	ldsba	[%r31, + 0x0018] %asi, %r20
	.word 0x9f8020ae  ! 267: SIR	sir	0x00ae
memptr_8_150:
	set user_data_start, %r31
	.word 0x858465b7  ! 268: WRCCR_I	wr	%r17, 0x05b7, %ccr
splash_lsu_8_151:
	nop
	ta T_CHANGE_HPRIV
	set 0x22c8b8cb, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd43fe0b8  ! 270: STD_I	std	%r10, [%r31 + 0x00b8]
	.word 0xa1a509b2  ! 271: FDIVs	fdivs	%f20, %f18, %f16
	.word 0xab82c011  ! 272: WR_CLEAR_SOFTINT_R	wr	%r11, %r17, %clear_softint
pmu_8_152:
	nop
	setx 0xfffff3e2fffff3de, %g1, %g7
	.word 0xa3800007  ! 273: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_8_153:
	nop
	ta T_CHANGE_HPRIV
	mov 0x804, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 274: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x87aaca4b  ! 275: FCMPd	fcmpd	%fcc<n>, %f42, %f42
jmptr_8_154:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 276: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc19fda00  ! 277: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x9f80265f  ! 278: SIR	sir	0x065f
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
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
	.word 0xdbe7e010  ! 279: CASA_R	casa	[%r31] %asi, %r16, %r13
splash_tba_8_156:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 280: WRPR_TBA_R	wrpr	%r0, %r12, %tba
pmu_8_157:
	nop
	setx 0xfffff695fffff58d, %g1, %g7
	.word 0xa3800007  ! 281: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_8_158:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d944010  ! 282: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_159
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_159:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 283: RDPC	rd	%pc, %r20
	.word 0xa3a00174  ! 284: FABSq	dis not found

jmptr_8_160:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 285: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_8_161:
	nop
	ta T_CHANGE_HPRIV
	setx 0x43800269c19d41b0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 286: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9a189b3  ! 287: FDIVs	fdivs	%f6, %f19, %f20
	.word 0x8d903758  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x1758, %pstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_163:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 289: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0x9ba189c2  ! 290: FDIVd	fdivd	%f6, %f2, %f44
	.word 0x9194c013  ! 291: WRPR_PIL_R	wrpr	%r19, %r19, %pil
	.word 0xc1bfd960  ! 292: STDFA_R	stda	%f0, [%r0, %r31]
donret_8_165:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_165-donret_8_165-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00794003 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x74c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	done
donretarg_8_165:
	.word 0xd6ffe0e2  ! 293: SWAPA_I	swapa	%r11, [%r31 + 0x00e2] %asi
br_longdelay1_8_166:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 294: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe19fe0e0  ! 295: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	setx 0x0ea88821216335b5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_167:
	.word 0x39400001  ! 296: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_8_168:
	nop
	ta T_CHANGE_HPRIV
	setx 0x58a3042429876306, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 297: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 298: BL	bl,a	<label_0x1>
jmptr_8_169:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 299: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_170:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 300: CASA_R	casa	[%r31] %asi, %r8, %r11
	.word 0xd697e008  ! 301: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r11
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
br_badelay3_4_0:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xf14c6226	! Random illegal ?
	.word 0xe7134011  ! 1: LDQF_R	-	[%r13, %r17], %f19
	.word 0xa5a44831  ! 1: FADDs	fadds	%f17, %f17, %f18
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_1
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_1:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 2: CASA_R	casa	[%r31] %asi, %r18, %r13
splash_hpstate_4_2:
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x8198210f  ! 3: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010f, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_3:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 4: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x93d02033  ! 5: Tcc_I	tne	icc_or_xcc, %r0 + 51
jmptr_4_4:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 6: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xdb27c000  ! 7: STF_R	st	%f13, [%r0, %r31]
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 8: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_4_5:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d914010  ! 9: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
	.word 0x91d020b4  ! 10: Tcc_I	ta	icc_or_xcc, %r0 + 180
pmu_4_6:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff9c5fffffa82, %g1, %g7
	.word 0xa3800007  ! 11: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_4_7:
	set 0x60340000, %r31
	.word 0x858220d1  ! 12: WRCCR_I	wr	%r8, 0x00d1, %ccr
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_8
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_8
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_8:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 13: RDPC	rd	%pc, %r9
pmu_4_9:
	nop
	setx 0xfffff78cfffff5d0, %g1, %g7
	.word 0xa3800007  ! 14: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_10
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_10:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 15: RDPC	rd	%pc, %r8
mondo_4_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d95000d  ! 16: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
br_badelay3_4_12:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x9574f1fb	! Random illegal ?
	.word 0x99a00552  ! 1: FSQRTd	fsqrt	
	.word 0xa9a2c821  ! 17: FADDs	fadds	%f11, %f1, %f20
dvapa_4_13:
	nop
	ta T_CHANGE_HPRIV
	mov 0x829, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 18: CASA_R	casa	[%r31] %asi, %r17, %r12
tagged_4_14:
	tsubcctv %r8, 0x1c24, %r5
	.word 0xd807e0d2  ! 19: LDUW_I	lduw	[%r31 + 0x00d2], %r12
	.word 0xc1bfe040  ! 20: STDFA_I	stda	%f0, [0x0040, %r31]
splash_hpstate_4_15:
	ta T_CHANGE_NONHPRIV
	.word 0x24cc4001  ! 1: BRLEZ	brlez,a,pt	%r17,<label_0xc4001>
	.word 0x81982746  ! 21: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0746, %hpstate
	.word 0xd8d7e020  ! 22: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
intveclr_4_16:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc6444776d4093033, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 23: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_17
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_17:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 24: RDPC	rd	%pc, %r12
splash_htba_4_18:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 25: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
br_longdelay2_4_19:
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x91a4c9d1  ! 26: FDIVd	fdivd	%f50, %f48, %f8
br_longdelay1_4_20:
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0xbfe7c000  ! 27: SAVE_R	save	%r31, %r0, %r31
	.word 0xb1800011  ! 28: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x39400001  ! 29: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 30: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_tba_4_21:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 31: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_4_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d90c008  ! 32: WRPR_WSTATE_R	wrpr	%r3, %r8, %wstate
	.word 0x20700001  ! 33: BPN	<illegal instruction>
	.word 0x919066ee  ! 34: WRPR_PIL_I	wrpr	%r1, 0x06ee, %pil
	.word 0x91d02033  ! 35: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9f802898  ! 36: SIR	sir	0x0898
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_23
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_23:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 37: RDPC	rd	%pc, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_24
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_24:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 38: RDPC	rd	%pc, %r20
jmptr_4_25:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 39: JMPL_R	jmpl	%r27 + %r0, %r27
ibp_4_26:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x4, %r16
ibp_startwait4_26:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_26
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_26:
    brnz %r16, ibp_wait4_26
    ld [%r23], %r16
    ba,a ibp_startwait4_26
    mov 0x4, %r16
continue_ibp_4_26:
    ldxa [%g0]0x63, %r14        !Get raw TID
    srlx %r14, 3, %r14          !Get CID
    sllx %r16, %r14, %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_26:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_26
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_26:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_26
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_26:
    best_set_reg(0x0000005016c00214,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xc32fc002  ! 40: STXFSR_R	st-sfr	%f1, [%r2, %r31]
	setx 0x56f9d125a0bbd373, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_27:
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9033d5  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x13d5, %pstate
	.word 0xd06fe072  ! 43: LDSTUB_I	ldstub	%r8, [%r31 + 0x0072]
trapasi_4_29:
mov 0x8, %r1 ! (VA for ASI 0x5b) 
	.word 0xd0c844a0  ! 44: LDSBA_R	ldsba	[%r1, %r0] 0x25, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_30
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_30:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 45: RDPC	rd	%pc, %r12
fpinit_4_31:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 46: FCMPLE32	fcmple32	%d0, %d4, %r4
memptr_4_32:
	set 0x60540000, %r31
	.word 0x85836c09  ! 47: WRCCR_I	wr	%r13, 0x0c09, %ccr
mondo_4_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d930014  ! 48: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
	.word 0x91948010  ! 49: WRPR_PIL_R	wrpr	%r18, %r16, %pil
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_35:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 50: CASA_R	casa	[%r31] %asi, %r9, %r12
donret_4_36:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_36-donret_4_36-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e79014 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe5d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	retry
donretarg_4_36:
	.word 0xd8ffe048  ! 51: SWAPA_I	swapa	%r12, [%r31 + 0x0048] %asi
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
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
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_37:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 52: RDPC	rd	%pc, %r17
mondo_4_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d940006  ! 53: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
	setx 0x0e99cdc6fea7dc3c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_39:
	.word 0x39400001  ! 54: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_40
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_40:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 55: RDPC	rd	%pc, %r16
	.word 0x97a349d3  ! 56: FDIVd	fdivd	%f44, %f50, %f42
	.word 0xa7480000  ! 57: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0x9370376b  ! 58: POPC_I	popc	0x176b, %r9
fpinit_4_41:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 59: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0x9f803f10  ! 60: SIR	sir	0x1f10
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_42:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e002  ! 61: CASA_R	casa	[%r31] %asi, %r2, %r12
br_badelay2_4_43:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f10, %f14, %f14
	.word 0x9bb04309  ! 62: ALIGNADDRESS	alignaddr	%r1, %r9, %r13
	.word 0x8d802004  ! 63: WRFPRS_I	wr	%r0, 0x0004, %fprs
br_longdelay1_4_44:
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0x9d97c000  ! 64: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	setx 0x9d68181da3c57770, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_45:
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe53fc000  ! 66: STDF_R	std	%f18, [%r0, %r31]
	.word 0xe4bfc02d  ! 67: STDA_R	stda	%r18, [%r31 + %r13] 0x01
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
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_47:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 68: RDPC	rd	%pc, %r9
	.word 0xb1800011  ! 69: WR_STICK_REG_R	wr	%r0, %r17, %-
splash_hpstate_4_48:
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x8198266c  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x066c, %hpstate
intveclr_4_49:
	nop
	ta T_CHANGE_HPRIV
	setx 0x116a366bd5d8aa79, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 71: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe03fe00a  ! 72: STD_I	std	%r16, [%r31 + 0x000a]
splash_lsu_4_50:
	nop
	ta T_CHANGE_HPRIV
	set 0xec0978a6, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 73: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe137e042  ! 74: STQF_I	-	%f16, [0x0042, %r31]
	.word 0xc1bfe040  ! 75: STDFA_I	stda	%f0, [0x0040, %r31]
	.word 0xe057e010  ! 76: LDSH_I	ldsh	[%r31 + 0x0010], %r16
splash_cmpr_4_51:
	nop
	setx 0xb4bc834d572e11c8, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 77: WRPR_TICK_R	wrpr	%r0, %r17, %tick
splash_lsu_4_52:
	nop
	ta T_CHANGE_HPRIV
	set 0xc02f5e8f, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 78: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_badelay2_4_53:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f2, %f6, %f26
	.word 0x97b5030b  ! 79: ALIGNADDRESS	alignaddr	%r20, %r11, %r11
	.word 0xe1bfd920  ! 80: STDFA_R	stda	%f16, [%r0, %r31]
splash_cmpr_4_54:
	nop
	setx 0xb403a622825bdb1d, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 81: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x91a00171  ! 82: FABSq	dis not found

	.word 0xdb1fc002  ! 83: LDDF_R	ldd	[%r31, %r2], %f13
	.word 0xdb3fc002  ! 84: STDF_R	std	%f13, [%r2, %r31]
invtsb_4_57:
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
	.word 0x29800001  ! 85: FBL	fbl,a	<label_0x1>
memptr_4_58:
	set 0x60740000, %r31
	.word 0x8581792e  ! 86: WRCCR_I	wr	%r5, 0x192e, %ccr
	.word 0x9191b9c7  ! 87: WRPR_PIL_I	wrpr	%r6, 0x19c7, %pil
	.word 0x91d020b4  ! 88: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_tba_4_59:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 89: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xc1bfe060  ! 90: STDFA_I	stda	%f0, [0x0060, %r31]
	.word 0x9f803a08  ! 91: SIR	sir	0x1a08
	.word 0xda6fe05e  ! 92: LDSTUB_I	ldstub	%r13, [%r31 + 0x005e]
	.word 0xda47e008  ! 93: LDSW_I	ldsw	[%r31 + 0x0008], %r13
br_longdelay1_4_60:
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 94: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc30fc000  ! 95: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
jmptr_4_62:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 96: JMPL_R	jmpl	%r27 + %r0, %r27
br_badelay2_4_63:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x97b08309  ! 97: ALIGNADDRESS	alignaddr	%r2, %r9, %r11
mondo_4_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d910004  ! 98: WRPR_WSTATE_R	wrpr	%r4, %r4, %wstate
	.word 0xc19fda00  ! 99: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_65:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_4_66:
	nop
	ta T_CHANGE_HPRIV
	setx 0x06aad54e8fd958f0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 101: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_4_67:
	nop
	ta T_CHANGE_HPRIV
	mov 0xea4, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdb1fc009  ! 102: LDDF_R	ldd	[%r31, %r9], %f13
trapasi_4_68:
mov 0x38, %r1 ! (VA for ASI 0x5b) 
	.word 0xdac04b40  ! 103: LDSWA_R	ldswa	[%r1, %r0] 0x5a, %r13
	.word 0xe19fd960  ! 104: LDDFA_R	ldda	[%r31, %r0], %f16
brcommon_4_69:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xdbe7e009  ! 105: CASA_R	casa	[%r31] %asi, %r9, %r13
mondo_4_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d904012  ! 106: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_71:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 107: CASA_R	casa	[%r31] %asi, %r16, %r13
	.word 0xdb27e0f4  ! 108: STF_I	st	%f13, [0x00f4, %r31]
	.word 0xc32fc010  ! 109: STXFSR_R	st-sfr	%f1, [%r16, %r31]
	.word 0xa7b347c2  ! 110: PDIST	pdistn	%d44, %d2, %d50
change_to_randtl_4_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_73:
	.word 0x8f902000  ! 111: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd20fe010  ! 112: LDUB_I	ldub	[%r31 + 0x0010], %r9
splash_lsu_4_74:
	nop
	ta T_CHANGE_HPRIV
	set 0xa22692f8, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 113: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_longdelay2_4_75:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc36b6c82  ! 114: PREFETCH_I	prefetch	[%r13 + 0x0c82], #one_read
	.word 0xb1800011  ! 115: WR_STICK_REG_R	wr	%r0, %r17, %-
ibp_4_76:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x4, %r16
ibp_startwait4_76:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_76
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_76:
    brnz %r16, ibp_wait4_76
    ld [%r23], %r16
    ba,a ibp_startwait4_76
    mov 0x4, %r16
continue_ibp_4_76:
    ldxa [%g0]0x63, %r14        !Get raw TID
    srlx %r14, 3, %r14          !Get CID
    sllx %r16, %r14, %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_76:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_76
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_76:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_76
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_76:
    best_set_reg(0x0000005002c214da,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe03fec82  ! 116: STD_I	std	%r16, [%r31 + 0x0c82]
change_to_randtl_4_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_77:
	.word 0x8f902001  ! 117: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_78) + 8, 16, 16)) -> intp(1,0,27)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_78)&0xffffffff)  + 8, 16, 16)) -> intp(1,0,27)
intvec_4_78:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91948006  ! 119: WRPR_PIL_R	wrpr	%r18, %r6, %pil
	.word 0x9f802970  ! 120: SIR	sir	0x0970
	.word 0xe19fdf20  ! 121: LDDFA_R	ldda	[%r31, %r0], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_80:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 122: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xd88fe020  ! 123: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_81
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_81:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 124: RDPC	rd	%pc, %r17
fpinit_4_82:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 125: FDIVs	fdivs	%f0, %f4, %f6
	.word 0xb1800011  ! 126: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xe6dfc031  ! 127: LDXA_R	ldxa	[%r31, %r17] 0x01, %r19
	.word 0xe737e0ac  ! 128: STQF_I	-	%f19, [0x00ac, %r31]
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x8d903c1b  ! 129: WRPR_PSTATE_I	wrpr	%r0, 0x1c1b, %pstate
trapasi_4_85:
mov 0x8, %r1 ! (VA for ASI 0x4c) 
	.word 0xe6d84980  ! 130: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_86) + 8, 16, 16)) -> intp(0,0,22)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_86)&0xffffffff)  + 8, 16, 16)) -> intp(0,0,22)
intvec_4_86:
	.word 0x39400001  ! 131: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_87:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d91000d  ! 132: WRPR_WSTATE_R	wrpr	%r4, %r13, %wstate
splash_hpstate_4_88:
	.word 0x819825df  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05df, %hpstate
	.word 0xe19fe060  ! 134: LDDFA_I	ldda	[%r31, 0x0060], %f16
	.word 0xa7a449d2  ! 135: FDIVd	fdivd	%f48, %f18, %f50
	.word 0xa5b08490  ! 136: FCMPLE32	fcmple32	%d2, %d16, %r18
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 137: Tcc_R	ta	icc_or_xcc, %r0 + %r30
br_longdelay3_4_90:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902002  ! 138: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
fpinit_4_91:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82812  ! 139: PREFETCHA_I	prefetcha	[%r0, + 0x0812] %asi, #one_read
	.word 0xa9a509ab  ! 140: FDIVs	fdivs	%f20, %f11, %f20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903811  ! 142: WRPR_PSTATE_I	wrpr	%r0, 0x1811, %pstate
tglhtw_4_93:
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
	.word 0x93b40989  ! 143: BSHUFFLE	fmovc32	%d16, %d40, %d40
trapasi_4_94:
mov 0x10, %r1 ! (VA for ASI 0x5a) 
	.word 0xd6d84e40  ! 144: LDXA_R	ldxa	[%r1, %r0] 0x72, %r11
	.word 0xa5a00166  ! 145: FABSq	dis not found

br_longdelay1_4_95:
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0xbfe7c000  ! 146: SAVE_R	save	%r31, %r0, %r31
	.word 0xd6bfe058  ! 147: STDA_I	stda	%r11, [%r31 + 0x0058] %asi
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 148: Tcc_R	te	icc_or_xcc, %r0 + %r30
br_longdelay1_4_96:
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0xbfe7c000  ! 149: SAVE_R	save	%r31, %r0, %r31
	.word 0x83d020b3  ! 150: Tcc_I	te	icc_or_xcc, %r0 + 179
jmptr_4_97:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 151: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_4_98:
	nop
	setx 0xfffff2f5fffff8ff, %g1, %g7
	.word 0xa3800007  ! 152: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_4_99:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 153: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_4_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d950012  ! 154: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81460000  ! 156: RD_STICK_REG	stbar
splash_cmpr_4_101:
	nop
	setx 0xd9d167e2ada2bb92, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 157: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x9f80373b  ! 158: SIR	sir	0x173b
brcommon_4_102:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xd697c02a  ! 159: LDUHA_R	lduha	[%r31, %r10] 0x01, %r11
pmu_4_103:
	nop
	setx 0xfffff061fffff1df, %g1, %g7
	.word 0xa3800007  ! 160: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc1bfe0e0  ! 161: STDFA_I	stda	%f0, [0x00e0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_104) + 32, 16, 16)) -> intp(5,0,18)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_104)&0xffffffff)  + 32, 16, 16)) -> intp(5,0,18)
intvec_4_104:
	.word 0x39400001  ! 162: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc3eac029  ! 163: PREFETCHA_R	prefetcha	[%r11, %r9] 0x01, #one_read
	.word 0x8d903f18  ! 164: WRPR_PSTATE_I	wrpr	%r0, 0x1f18, %pstate
jmptr_4_106:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 165: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_4_107:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcad, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd2dfc034  ! 166: LDXA_R	ldxa	[%r31, %r20] 0x01, %r9
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 167: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0x99a189d1  ! 168: FDIVd	fdivd	%f6, %f48, %f12
	.word 0x95a089c9  ! 169: FDIVd	fdivd	%f2, %f40, %f10
dvapa_4_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfff, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1e7e003  ! 170: CASA_R	casa	[%r31] %asi, %r3, %r16
mondo_4_110:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d944007  ! 171: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
	.word 0xe05fe018  ! 172: LDX_I	ldx	[%r31 + 0x0018], %r16
	.word 0xab80c013  ! 173: WR_CLEAR_SOFTINT_R	wr	%r3, %r19, %clear_softint
intveclr_4_111:
	nop
	ta T_CHANGE_HPRIV
	setx 0xfce69212c15f60d3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 174: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5a00169  ! 175: FABSq	dis not found

	.word 0xb1800011  ! 176: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xe1bfdb60  ! 177: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xb1800011  ! 178: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xa7703b61  ! 179: POPC_I	popc	0x1b61, %r19
	.word 0x91d02032  ! 180: Tcc_I	ta	icc_or_xcc, %r0 + 50
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_112:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 181: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x2a700001  ! 182: BPCS	<illegal instruction>
	.word 0x8d903619  ! 183: WRPR_PSTATE_I	wrpr	%r0, 0x1619, %pstate
	.word 0x91950013  ! 184: WRPR_PIL_R	wrpr	%r20, %r19, %pil
donret_4_115:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_115-donret_4_115-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e088ad | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4c4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_115:
	.word 0xd0ffe09c  ! 185: SWAPA_I	swapa	%r8, [%r31 + 0x009c] %asi
	.word 0xe1bfdb60  ! 186: STDFA_R	stda	%f16, [%r0, %r31]
splash_cmpr_4_116:
	nop
	setx 0xc89aa2de5d09216e, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 187: WRPR_TICK_R	wrpr	%r0, %r17, %tick
trapasi_4_117:
mov 0x10, %r1 ! (VA for ASI 0x4c) 
	.word 0xd0c84a00  ! 188: LDSBA_R	ldsba	[%r1, %r0] 0x50, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_118
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_118:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 189: RDPC	rd	%pc, %r17
	.word 0xe827e01a  ! 190: STW_I	stw	%r20, [%r31 + 0x001a]
    set 0x1912, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b407d0  ! 191: PDIST	pdistn	%d16, %d16, %d20
	.word 0x99450000  ! 192: RD_SET_SOFTINT	rd	%set_softint, %r12
	.word 0xe1bfdb60  ! 193: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe81fc000  ! 194: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0xe857e010  ! 195: LDSH_I	ldsh	[%r31 + 0x0010], %r20
	.word 0x97b407c6  ! 196: PDIST	pdistn	%d16, %d6, %d42
	.word 0xc1bfe060  ! 197: STDFA_I	stda	%f0, [0x0060, %r31]
	.word 0xc3eb0033  ! 198: PREFETCHA_R	prefetcha	[%r12, %r19] 0x01, #one_read
	.word 0xb1800011  ! 199: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x9f803d14  ! 200: SIR	sir	0x1d14
jmptr_4_119:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 201: JMPL_R	jmpl	%r27 + %r0, %r27
br_longdelay3_4_120:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902000  ! 202: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xc19fde00  ! 203: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd437e0ac  ! 204: STH_I	sth	%r10, [%r31 + 0x00ac]
splash_tba_4_121:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 205: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_4_122:
	tsubcctv %r19, 0x1f45, %r11
	.word 0xd407e059  ! 206: LDUW_I	lduw	[%r31 + 0x0059], %r10
	.word 0x9f803735  ! 207: SIR	sir	0x1735
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_123
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_123:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 208: CASA_R	casa	[%r31] %asi, %r10, %r10
jmptr_4_124:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 209: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa750c000  ! 210: RDPR_TT	<illegal instruction>
	.word 0xe137c000  ! 211: STQF_R	-	%f16, [%r0, %r31]
intveclr_4_125:
	nop
	ta T_CHANGE_HPRIV
	setx 0x886e742dc6e74d74, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 212: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_4_126:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4393f18a67e655f1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 213: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x32700001  ! 214: BPNE	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r16
br_longdelay3_4_127:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902002  ! 216: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
splash_lsu_4_128:
	nop
	ta T_CHANGE_HPRIV
	set 0x8c92c40a, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_129:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 218: CASA_R	casa	[%r31] %asi, %r10, %r16
pmu_4_130:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff25afffff89e, %g1, %g7
	.word 0xa3800007  ! 219: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91920005  ! 220: WRPR_PIL_R	wrpr	%r8, %r5, %pil
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 221: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91a449d0  ! 222: FDIVd	fdivd	%f48, %f16, %f8
intveclr_4_132:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc258aac339704b35, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_133:
	ta T_CHANGE_NONHPRIV
	.word 0x819829dd  ! 224: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09dd, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_134)+8, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_134)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_134:
	.word 0xa984efc9  ! 225: WR_SET_SOFTINT_I	wr	%r19, 0x0fc9, %set_softint
	.word 0xa3520000  ! 226: RDPR_PIL	<illegal instruction>
pmu_4_135:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff197fffffff4, %g1, %g7
	.word 0xa3800007  ! 227: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f8031f2  ! 228: SIR	sir	0x11f2
	.word 0xe537c000  ! 229: STQF_R	-	%f18, [%r0, %r31]
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 230: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9bb34494  ! 231: FCMPLE32	fcmple32	%d44, %d20, %r13
splash_hpstate_4_136:
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0x81982047  ! 232: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0047, %hpstate
	setx 0x0c2b926d321e9f18, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_137:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 234: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xb1800011  ! 235: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xd80fe000  ! 236: LDUB_I	ldub	[%r31 + 0x0000], %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_138
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_138
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_138:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 237: RDPC	rd	%pc, %r16
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 238: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_139
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_139:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 239: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0xe71fc000  ! 240: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x81460000  ! 241: RD_STICK_REG	stbar
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_140
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_140:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 242: RDPC	rd	%pc, %r18
	.word 0x83d02035  ! 243: Tcc_I	te	icc_or_xcc, %r0 + 53
trapasi_4_141:
mov 0x3e8, %r1 ! (VA for ASI 0x25) 
	.word 0xe0904b60  ! 244: LDUHA_R	lduha	[%r1, %r0] 0x5b, %r16
	.word 0xa1a00168  ! 245: FABSq	dis not found

	.word 0x93d02035  ! 246: Tcc_I	tne	icc_or_xcc, %r0 + 53
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 247: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_4_142:
	nop
	ta T_CHANGE_HPRIV
	set 0x5d4aa2f8, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 248: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_4_143:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffefefffff1ec, %g1, %g7
	.word 0xa3800007  ! 249: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe1bfe0e0  ! 250: STDFA_I	stda	%f16, [0x00e0, %r31]
	.word 0xb1800011  ! 251: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x91d020b2  ! 252: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xc1bfc3e0  ! 253: STDFA_R	stda	%f0, [%r0, %r31]
memptr_4_144:
	set user_data_start, %r31
	.word 0x8584b8a6  ! 254: WRCCR_I	wr	%r18, 0x18a6, %ccr
fpinit_4_145:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 255: FDIVs	fdivs	%f0, %f4, %f6
	.word 0x8d902faa  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x0faa, %pstate
	.word 0xe527e010  ! 257: STF_I	st	%f18, [0x0010, %r31]
splash_lsu_4_147:
	nop
	ta T_CHANGE_HPRIV
	set 0xed433bd1, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 258: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfdb60  ! 259: STDFA_R	stda	%f16, [%r0, %r31]
mondo_4_148:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d940014  ! 260: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	.word 0x95480000  ! 261: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
brcommon_4_149:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xe43fe190  ! 262: STD_I	std	%r18, [%r31 + 0x0190]
	.word 0x91a00168  ! 263: FABSq	dis not found

	.word 0xc3ed0029  ! 264: PREFETCHA_R	prefetcha	[%r20, %r9] 0x01, #one_read
	.word 0xe827e0ae  ! 265: STW_I	stw	%r20, [%r31 + 0x00ae]
	.word 0xe8cfe030  ! 266: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r20
	.word 0x87a84a43  ! 267: FCMPd	fcmpd	%fcc<n>, %f32, %f34
memptr_4_150:
	set user_data_start, %r31
	.word 0x8584f910  ! 268: WRCCR_I	wr	%r19, 0x1910, %ccr
splash_lsu_4_151:
	nop
	ta T_CHANGE_HPRIV
	set 0xeccf1cb1, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd43fe0ce  ! 270: STD_I	std	%r10, [%r31 + 0x00ce]
	.word 0xa570385d  ! 271: POPC_I	popc	0x185d, %r18
	.word 0xab814001  ! 272: WR_CLEAR_SOFTINT_R	wr	%r5, %r1, %clear_softint
pmu_4_152:
	nop
	setx 0xfffff849fffff191, %g1, %g7
	.word 0xa3800007  ! 273: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_4_153:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdb3, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe51fc013  ! 274: LDDF_R	ldd	[%r31, %r19], %f18
	.word 0x87ac8a53  ! 275: FCMPd	fcmpd	%fcc<n>, %f18, %f50
jmptr_4_154:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 276: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe1bfdf20  ! 277: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9f8026b2  ! 278: SIR	sir	0x06b2
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_155:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 279: CASA_R	casa	[%r31] %asi, %r16, %r13
splash_tba_4_156:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 280: WRPR_TBA_R	wrpr	%r0, %r12, %tba
pmu_4_157:
	nop
	setx 0xfffffd12fffffd3e, %g1, %g7
	.word 0xa3800007  ! 281: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_4_158:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d934011  ! 282: WRPR_WSTATE_R	wrpr	%r13, %r17, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_159
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_159:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 283: RDPC	rd	%pc, %r12
	.word 0x93a00166  ! 284: FABSq	dis not found

jmptr_4_160:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 285: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_4_161:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa8ddbda5c9f6fecc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 286: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7a349d2  ! 287: FDIVd	fdivd	%f44, %f18, %f50
	.word 0x8d90202d  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x002d, %pstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_163:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 289: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0x95a489d1  ! 290: FDIVd	fdivd	%f18, %f48, %f10
	.word 0x91944001  ! 291: WRPR_PIL_R	wrpr	%r17, %r1, %pil
	.word 0xc1bfdb60  ! 292: STDFA_R	stda	%f0, [%r0, %r31]
donret_4_165:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_165-donret_4_165-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d9d334 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x8cd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x24c84001  ! 1: BRLEZ	brlez,a,pt	%r1,<label_0x84001>
	done
donretarg_4_165:
	.word 0xd6ffe0e9  ! 293: SWAPA_I	swapa	%r11, [%r31 + 0x00e9] %asi
br_longdelay1_4_166:
	.word 0x2ec8c001  ! 1: BRGEZ	brgez,a,pt	%r3,<label_0x8c001>
	.word 0x9d97c000  ! 294: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xc19fe080  ! 295: LDDFA_I	ldda	[%r31, 0x0080], %f0
	setx 0xb37888d1543dbae4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_167:
	.word 0x39400001  ! 296: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_4_168:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa74099bc25f59118, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 297: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 298: BL	bl,a	<label_0x1>
jmptr_4_169:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 299: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_170:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 300: CASA_R	casa	[%r31] %asi, %r8, %r11
	.word 0xd697e008  ! 301: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r11
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
br_badelay3_2_0:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb5104b2	! Random illegal ?
	.word 0xe3110011  ! 1: LDQF_R	-	[%r4, %r17], %f17
	.word 0x99a4c834  ! 1: FADDs	fadds	%f19, %f20, %f12
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_1
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_1:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 2: CASA_R	casa	[%r31] %asi, %r18, %r13
splash_hpstate_2_2:
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8198241e  ! 3: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041e, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_3:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 4: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x91d02035  ! 5: Tcc_I	ta	icc_or_xcc, %r0 + 53
jmptr_2_4:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 6: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xdb27c000  ! 7: STF_R	st	%f13, [%r0, %r31]
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 8: Tcc_R	te	icc_or_xcc, %r0 + %r30
mondo_2_5:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d928005  ! 9: WRPR_WSTATE_R	wrpr	%r10, %r5, %wstate
	.word 0x91d02035  ! 10: Tcc_I	ta	icc_or_xcc, %r0 + 53
pmu_2_6:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff338fffff6c3, %g1, %g7
	.word 0xa3800007  ! 11: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_2_7:
	set 0x60140000, %r31
	.word 0x85846b53  ! 12: WRCCR_I	wr	%r17, 0x0b53, %ccr
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_8
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_8
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_8:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 13: RDPC	rd	%pc, %r11
pmu_2_9:
	nop
	setx 0xfffffe09fffff94a, %g1, %g7
	.word 0xa3800007  ! 14: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_10
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_10:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 15: RDPC	rd	%pc, %r20
mondo_2_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d908010  ! 16: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
br_badelay3_2_12:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x97416c67	! Random illegal ?
	.word 0xa9a00543  ! 1: FSQRTd	fsqrt	
	.word 0x95a48829  ! 17: FADDs	fadds	%f18, %f9, %f10
dvapa_2_13:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbab, %r20
	mov 0x5, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc011  ! 18: STXFSR_R	st-sfr	%f1, [%r17, %r31]
tagged_2_14:
	tsubcctv %r3, 0x1e83, %r16
	.word 0xd807e0a4  ! 19: LDUW_I	lduw	[%r31 + 0x00a4], %r12
	.word 0xc1bfe0c0  ! 20: STDFA_I	stda	%f0, [0x00c0, %r31]
splash_hpstate_2_15:
	ta T_CHANGE_NONHPRIV
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x8198266d  ! 21: WRHPR_HPSTATE_I	wrhpr	%r0, 0x066d, %hpstate
	.word 0xd8d7e010  ! 22: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r12
intveclr_2_16:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc91d81bd03c673f7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 23: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_17
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_17:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 24: RDPC	rd	%pc, %r10
splash_htba_2_18:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 25: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
br_longdelay2_2_19:
	.word 0x2cc98001  ! 1: BRGZ	brgz,a,pt	%r6,<label_0x98001>
	.word 0x39400001  ! 26: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
br_longdelay1_2_20:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 27: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xb1800011  ! 28: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x93b404d3  ! 29: FCMPNE32	fcmpne32	%d16, %d50, %r9
	.word 0x83d02034  ! 30: Tcc_I	te	icc_or_xcc, %r0 + 52
splash_tba_2_21:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 31: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_2_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d940011  ! 32: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0x20700001  ! 33: BPN	<illegal instruction>
	.word 0x91947ff0  ! 34: WRPR_PIL_I	wrpr	%r17, 0x1ff0, %pil
	.word 0x91d02032  ! 35: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x9f803639  ! 36: SIR	sir	0x1639
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_23
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_23:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 37: RDPC	rd	%pc, %r10
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_24
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_24:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 38: RDPC	rd	%pc, %r17
jmptr_2_25:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 39: JMPL_R	jmpl	%r27 + %r0, %r27
ibp_2_26:
	nop
	ta T_CHANGE_HPRIV
	.word 0xc32fc002  ! 40: STXFSR_R	st-sfr	%f1, [%r2, %r31]
	setx 0x44f83f9e64a335de, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_27:
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902334  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x0334, %pstate
	.word 0xd06fe03b  ! 43: LDSTUB_I	ldstub	%r8, [%r31 + 0x003b]
trapasi_2_29:
mov 0x30, %r1 ! (VA for ASI 0x5b) 
	.word 0xd0d84e60  ! 44: LDXA_R	ldxa	[%r1, %r0] 0x73, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_30
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_30:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 45: RDPC	rd	%pc, %r13
fpinit_2_31:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8372a  ! 46: PREFETCHA_I	prefetcha	[%r0, + 0xfffff72a] %asi, #one_read
memptr_2_32:
	set 0x60340000, %r31
	.word 0x8582a116  ! 47: WRCCR_I	wr	%r10, 0x0116, %ccr
mondo_2_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d918009  ! 48: WRPR_WSTATE_R	wrpr	%r6, %r9, %wstate
	.word 0x91950012  ! 49: WRPR_PIL_R	wrpr	%r20, %r18, %pil
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_35:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 50: CASA_R	casa	[%r31] %asi, %r9, %r12
donret_2_36:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_36-donret_2_36-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f7265e | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7c6, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	retry
donretarg_2_36:
	.word 0xd8ffe0e6  ! 51: SWAPA_I	swapa	%r12, [%r31 + 0x00e6] %asi
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
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
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_37:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 52: RDPC	rd	%pc, %r17
mondo_2_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d90c00d  ! 53: WRPR_WSTATE_R	wrpr	%r3, %r13, %wstate
	setx 0x3d14e5b3dbb99937, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_39:
	.word 0x39400001  ! 54: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_40
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_40:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 55: RDPC	rd	%pc, %r19
	.word 0x93a409d3  ! 56: FDIVd	fdivd	%f16, %f50, %f40
	.word 0xa3480000  ! 57: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xa5702d6b  ! 58: POPC_I	popc	0x0d6b, %r18
fpinit_2_41:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 59: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x9f8027f8  ! 60: SIR	sir	0x07f8
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_42:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e002  ! 61: CASA_R	casa	[%r31] %asi, %r2, %r12
br_badelay2_2_43:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f12, %f20, %f30
	.word 0xa5b48312  ! 62: ALIGNADDRESS	alignaddr	%r18, %r18, %r18
	.word 0x8d802000  ! 63: WRFPRS_I	wr	%r0, 0x0000, %fprs
br_longdelay1_2_44:
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0xbfefc000  ! 64: RESTORE_R	restore	%r31, %r0, %r31
	setx 0x41fdd522bc68b013, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_45:
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe53fc000  ! 66: STDF_R	std	%f18, [%r0, %r31]
	.word 0xe497c02d  ! 67: LDUHA_R	lduha	[%r31, %r13] 0x01, %r18
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
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_47:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 68: RDPC	rd	%pc, %r11
	.word 0xb1800011  ! 69: WR_STICK_REG_R	wr	%r0, %r17, %-
splash_hpstate_2_48:
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x819824c7  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c7, %hpstate
intveclr_2_49:
	nop
	ta T_CHANGE_HPRIV
	setx 0x262f4f9467266f2b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 71: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe03fe0e8  ! 72: STD_I	std	%r16, [%r31 + 0x00e8]
splash_lsu_2_50:
	nop
	ta T_CHANGE_HPRIV
	set 0x0de411ae, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 73: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe137e000  ! 74: STQF_I	-	%f16, [0x0000, %r31]
	.word 0xc1bfda00  ! 75: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe057e018  ! 76: LDSH_I	ldsh	[%r31 + 0x0018], %r16
splash_cmpr_2_51:
	nop
	setx 0xedbdf695084fc3cd, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 77: WRPR_TICK_R	wrpr	%r0, %r17, %tick
splash_lsu_2_52:
	nop
	ta T_CHANGE_HPRIV
	set 0x922960c6, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 78: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_badelay2_2_53:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f28, %f26, %f20
	.word 0x9bb3430b  ! 79: ALIGNADDRESS	alignaddr	%r13, %r11, %r13
	.word 0xe19fde00  ! 80: LDDFA_R	ldda	[%r31, %r0], %f16
splash_cmpr_2_54:
	nop
	setx 0x4107460774143276, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 81: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0xa1a00165  ! 82: FABSq	dis not found

	.word 0xdb3fc002  ! 83: STDF_R	std	%f13, [%r2, %r31]
	.word 0xdadfc022  ! 84: LDXA_R	ldxa	[%r31, %r2] 0x01, %r13
	.word 0x29800001  ! 85: FBL	fbl,a	<label_0x1>
memptr_2_58:
	set 0x60340000, %r31
	.word 0x85812127  ! 86: WRCCR_I	wr	%r4, 0x0127, %ccr
	.word 0x919269c4  ! 87: WRPR_PIL_I	wrpr	%r9, 0x09c4, %pil
	.word 0x91d02033  ! 88: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_tba_2_59:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 89: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe1bfe000  ! 90: STDFA_I	stda	%f16, [0x0000, %r31]
	.word 0x9f803a4f  ! 91: SIR	sir	0x1a4f
	.word 0xda6fe0eb  ! 92: LDSTUB_I	ldstub	%r13, [%r31 + 0x00eb]
	.word 0xda47e038  ! 93: LDSW_I	ldsw	[%r31 + 0x0038], %r13
br_longdelay1_2_60:
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 94: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xdbe7c020  ! 95: CASA_I	casa	[%r31] 0x 1, %r0, %r13
jmptr_2_62:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 96: JMPL_R	jmpl	%r27 + %r0, %r27
br_badelay2_2_63:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa3b5030c  ! 97: ALIGNADDRESS	alignaddr	%r20, %r12, %r17
mondo_2_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d908011  ! 98: WRPR_WSTATE_R	wrpr	%r2, %r17, %wstate
	.word 0xc1bfc2c0  ! 99: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_65:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_2_66:
	nop
	ta T_CHANGE_HPRIV
	setx 0xce8e572dead55391, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 101: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_2_67:
	nop
	ta T_CHANGE_HPRIV
	mov 0xec4, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdadfc029  ! 102: LDXA_R	ldxa	[%r31, %r9] 0x01, %r13
trapasi_2_68:
mov 0x8, %r1 ! (VA for ASI 0x5b) 
	.word 0xda8844a0  ! 103: LDUBA_R	lduba	[%r1, %r0] 0x25, %r13
	.word 0xc19fd960  ! 104: LDDFA_R	ldda	[%r31, %r0], %f0
brcommon_2_69:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xdb1fc009  ! 105: LDDF_R	ldd	[%r31, %r9], %f13
mondo_2_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d940014  ! 106: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_71:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 107: CASA_R	casa	[%r31] %asi, %r16, %r13
	.word 0xdb27e0e0  ! 108: STF_I	st	%f13, [0x00e0, %r31]
	.word 0xdb3fc010  ! 109: STDF_R	std	%f13, [%r16, %r31]
	.word 0x99a509b3  ! 110: FDIVs	fdivs	%f20, %f19, %f12
change_to_randtl_2_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_73:
	.word 0x8f902000  ! 111: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd20fe018  ! 112: LDUB_I	ldub	[%r31 + 0x0018], %r9
splash_lsu_2_74:
	nop
	ta T_CHANGE_HPRIV
	set 0x981bd95a, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 113: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_longdelay2_2_75:
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87ac8a41  ! 114: FCMPd	fcmpd	%fcc<n>, %f18, %f32
	.word 0xb1800011  ! 115: WR_STICK_REG_R	wr	%r0, %r17, %-
ibp_2_76:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe1e7e001  ! 116: CASA_R	casa	[%r31] %asi, %r1, %r16
change_to_randtl_2_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_77:
	.word 0x8f902000  ! 117: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_78) + 56, 16, 16)) -> intp(5,0,31)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_78)&0xffffffff)  + 56, 16, 16)) -> intp(5,0,31)
intvec_2_78:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91944008  ! 119: WRPR_PIL_R	wrpr	%r17, %r8, %pil
	.word 0x93a249d1  ! 120: FDIVd	fdivd	%f40, %f48, %f40
	.word 0xc1bfe040  ! 121: STDFA_I	stda	%f0, [0x0040, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_80:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 122: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xd88fe030  ! 123: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_81
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_81:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 124: RDPC	rd	%pc, %r17
fpinit_2_82:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82970  ! 125: PREFETCHA_I	prefetcha	[%r0, + 0x0970] %asi, #one_read
	.word 0xb1800011  ! 126: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xe697c031  ! 127: LDUHA_R	lduha	[%r31, %r17] 0x01, %r19
	.word 0xe737e0ba  ! 128: STQF_I	-	%f19, [0x00ba, %r31]
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903687  ! 129: WRPR_PSTATE_I	wrpr	%r0, 0x1687, %pstate
trapasi_2_85:
mov 0x20, %r1 ! (VA for ASI 0x4c) 
	.word 0xe6c84e40  ! 130: LDSBA_R	ldsba	[%r1, %r0] 0x72, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_86) + 56, 16, 16)) -> intp(7,0,27)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_86)&0xffffffff)  + 56, 16, 16)) -> intp(7,0,27)
intvec_2_86:
	.word 0x39400001  ! 131: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_87:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d90c013  ! 132: WRPR_WSTATE_R	wrpr	%r3, %r19, %wstate
splash_hpstate_2_88:
	.word 0x81982dd5  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd5, %hpstate
	.word 0xe19fe040  ! 134: LDDFA_I	ldda	[%r31, 0x0040], %f16
	.word 0x97b407d3  ! 135: PDIST	pdistn	%d16, %d50, %d42
	.word 0x87ad0a51  ! 136: FCMPd	fcmpd	%fcc<n>, %f20, %f48
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 137: Tcc_R	ta	icc_or_xcc, %r0 + %r30
br_longdelay3_2_90:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902005  ! 138: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
fpinit_2_91:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 139: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xa9702174  ! 140: POPC_I	popc	0x0174, %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902285  ! 142: WRPR_PSTATE_I	wrpr	%r0, 0x0285, %pstate
tglhtw_2_93:
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
	.word 0xa9b44993  ! 143: BSHUFFLE	fmovc32	%d48, %d50, %d20
trapasi_2_94:
mov 0x0, %r1 ! (VA for ASI 0x5a) 
	.word 0xd6904b40  ! 144: LDUHA_R	lduha	[%r1, %r0] 0x5a, %r11
	.word 0xa9a0016b  ! 145: FABSq	dis not found

br_longdelay1_2_95:
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 146: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd6bfe0f6  ! 147: STDA_I	stda	%r11, [%r31 + 0x00f6] %asi
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 148: Tcc_R	tne	icc_or_xcc, %r0 + %r30
br_longdelay1_2_96:
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x9d97c000  ! 149: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x91d020b5  ! 150: Tcc_I	ta	icc_or_xcc, %r0 + 181
jmptr_2_97:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 151: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_2_98:
	nop
	setx 0xfffff1abfffff17f, %g1, %g7
	.word 0xa3800007  ! 152: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_2_99:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 153: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_2_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d918008  ! 154: WRPR_WSTATE_R	wrpr	%r6, %r8, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81460000  ! 156: RD_STICK_REG	stbar
splash_cmpr_2_101:
	nop
	setx 0xa5323b27ee1d5675, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 157: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x9f803936  ! 158: SIR	sir	0x1936
brcommon_2_102:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xd73fc00a  ! 159: STDF_R	std	%f11, [%r10, %r31]
pmu_2_103:
	nop
	setx 0xfffff330fffff85e, %g1, %g7
	.word 0xa3800007  ! 160: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc1bfe040  ! 161: STDFA_I	stda	%f0, [0x0040, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_104) + 24, 16, 16)) -> intp(7,0,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_104)&0xffffffff)  + 24, 16, 16)) -> intp(7,0,3)
intvec_2_104:
	.word 0x39400001  ! 162: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x937023c9  ! 163: POPC_I	popc	0x03c9, %r9
	.word 0x8d9030e4  ! 164: WRPR_PSTATE_I	wrpr	%r0, 0x10e4, %pstate
jmptr_2_106:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 165: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_2_107:
	nop
	ta T_CHANGE_HPRIV
	mov 0xaf0, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd29fc034  ! 166: LDDA_R	ldda	[%r31, %r20] 0x01, %r9
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 167: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0xa7a509c8  ! 168: FDIVd	fdivd	%f20, %f8, %f50
	.word 0xa9a309cc  ! 169: FDIVd	fdivd	%f12, %f12, %f20
dvapa_2_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0x954, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe0dfc023  ! 170: LDXA_R	ldxa	[%r31, %r3] 0x01, %r16
mondo_2_110:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d944014  ! 171: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0xe05fe008  ! 172: LDX_I	ldx	[%r31 + 0x0008], %r16
	.word 0xab820013  ! 173: WR_CLEAR_SOFTINT_R	wr	%r8, %r19, %clear_softint
intveclr_2_111:
	nop
	ta T_CHANGE_HPRIV
	setx 0x534612aefd977272, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 174: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5a00173  ! 175: FABSq	dis not found

	.word 0xb1800011  ! 176: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xc1bfc2c0  ! 177: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xb1800011  ! 178: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x87a90a4d  ! 179: FCMPd	fcmpd	%fcc<n>, %f4, %f44
	.word 0x83d02035  ! 180: Tcc_I	te	icc_or_xcc, %r0 + 53
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_112:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 181: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x2a700001  ! 182: BPCS	<illegal instruction>
	.word 0x8d902700  ! 183: WRPR_PSTATE_I	wrpr	%r0, 0x0700, %pstate
	.word 0x91950013  ! 184: WRPR_PIL_R	wrpr	%r20, %r19, %pil
donret_2_115:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_115-donret_2_115-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0016bc97 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x505, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_115:
	.word 0xd0ffe08c  ! 185: SWAPA_I	swapa	%r8, [%r31 + 0x008c] %asi
	.word 0xc1bfd960  ! 186: STDFA_R	stda	%f0, [%r0, %r31]
splash_cmpr_2_116:
	nop
	setx 0xff97394a3fba7357, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 187: WRPR_TICK_R	wrpr	%r0, %r17, %tick
trapasi_2_117:
mov 0x28, %r1 ! (VA for ASI 0x4c) 
	.word 0xd0c84a00  ! 188: LDSBA_R	ldsba	[%r1, %r0] 0x50, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_118
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_118:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 189: RDPC	rd	%pc, %r20
	.word 0xe827e0f8  ! 190: STW_I	stw	%r20, [%r31 + 0x00f8]
    set 0x2095, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b4c7cd  ! 191: PDIST	pdistn	%d50, %d44, %d42
	.word 0x9b450000  ! 192: RD_SET_SOFTINT	rd	%set_softint, %r13
	.word 0xc1bfdc00  ! 193: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe81fc000  ! 194: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0xe857e008  ! 195: LDSH_I	ldsh	[%r31 + 0x0008], %r20
	.word 0xa3b34491  ! 196: FCMPLE32	fcmple32	%d44, %d48, %r17
	.word 0xc1bfd960  ! 197: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa3703202  ! 198: POPC_I	popc	0x1202, %r17
	.word 0xb1800011  ! 199: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x9f80303f  ! 200: SIR	sir	0x103f
jmptr_2_119:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 201: JMPL_R	jmpl	%r27 + %r0, %r27
br_longdelay3_2_120:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902004  ! 202: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xe1bfdc00  ! 203: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd437e028  ! 204: STH_I	sth	%r10, [%r31 + 0x0028]
splash_tba_2_121:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 205: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_2_122:
	tsubcctv %r20, 0x1d2f, %r20
	.word 0xd407e0ce  ! 206: LDUW_I	lduw	[%r31 + 0x00ce], %r10
	.word 0x9f802533  ! 207: SIR	sir	0x0533
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_123
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_123:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 208: CASA_R	casa	[%r31] %asi, %r10, %r10
jmptr_2_124:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 209: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9750c000  ! 210: RDPR_TT	<illegal instruction>
	.word 0xe137c000  ! 211: STQF_R	-	%f16, [%r0, %r31]
intveclr_2_125:
	nop
	ta T_CHANGE_HPRIV
	setx 0xce19c9307e1c4ced, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 212: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_2_126:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7899c99219cf61d6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 213: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x32700001  ! 214: BPNE	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r16
br_longdelay3_2_127:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902004  ! 216: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
splash_lsu_2_128:
	nop
	ta T_CHANGE_HPRIV
	set 0x34467bd1, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_129:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 218: CASA_R	casa	[%r31] %asi, %r10, %r16
pmu_2_130:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffea9fffff4ef, %g1, %g7
	.word 0xa3800007  ! 219: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91948014  ! 220: WRPR_PIL_R	wrpr	%r18, %r20, %pil
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 221: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1b24491  ! 222: FCMPLE32	fcmple32	%d40, %d48, %r16
intveclr_2_132:
	nop
	ta T_CHANGE_HPRIV
	setx 0xec3fcaffaa762143, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_133:
	ta T_CHANGE_NONHPRIV
	.word 0x81982cc4  ! 224: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc4, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_134)+40, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_134)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_134:
	.word 0xa984e9ad  ! 225: WR_SET_SOFTINT_I	wr	%r19, 0x09ad, %set_softint
	.word 0xa7520000  ! 226: RDPR_PIL	<illegal instruction>
pmu_2_135:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff59effffffc9, %g1, %g7
	.word 0xa3800007  ! 227: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f803497  ! 228: SIR	sir	0x1497
	.word 0xe537c000  ! 229: STQF_R	-	%f18, [%r0, %r31]
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 230: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1b507d2  ! 231: PDIST	pdistn	%d20, %d18, %d16
splash_hpstate_2_136:
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x81982e9d  ! 232: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9d, %hpstate
	setx 0xfa1848405055e793, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_137:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 234: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xb1800011  ! 235: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xd80fe028  ! 236: LDUB_I	ldub	[%r31 + 0x0028], %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_138
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_138
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_138:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 237: RDPC	rd	%pc, %r20
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 238: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_139
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_139:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 239: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0xe71fc000  ! 240: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x81460000  ! 241: RD_STICK_REG	stbar
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_140
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_140:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 242: RDPC	rd	%pc, %r13
	.word 0x91d020b3  ! 243: Tcc_I	ta	icc_or_xcc, %r0 + 179
trapasi_2_141:
mov 0x3e0, %r1 ! (VA for ASI 0x25) 
	.word 0xe0c84980  ! 244: LDSBA_R	ldsba	[%r1, %r0] 0x4c, %r16
	.word 0xa5a0016b  ! 245: FABSq	dis not found

	.word 0x93d02033  ! 246: Tcc_I	tne	icc_or_xcc, %r0 + 51
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 247: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_2_142:
	nop
	ta T_CHANGE_HPRIV
	set 0x29ed6258, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 248: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_2_143:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffecafffff511, %g1, %g7
	.word 0xa3800007  ! 249: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe1bfe040  ! 250: STDFA_I	stda	%f16, [0x0040, %r31]
	.word 0xb1800011  ! 251: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x91d02033  ! 252: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe1bfe080  ! 253: STDFA_I	stda	%f16, [0x0080, %r31]
memptr_2_144:
	set user_data_start, %r31
	.word 0x8584be4e  ! 254: WRCCR_I	wr	%r18, 0x1e4e, %ccr
fpinit_2_145:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 255: FDIVs	fdivs	%f0, %f4, %f8
	.word 0x8d903c14  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x1c14, %pstate
	.word 0xe527e02e  ! 257: STF_I	st	%f18, [0x002e, %r31]
splash_lsu_2_147:
	nop
	ta T_CHANGE_HPRIV
	set 0xf194f5b3, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 258: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe19fde00  ! 259: LDDFA_R	ldda	[%r31, %r0], %f16
mondo_2_148:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d930012  ! 260: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
	.word 0xa1480000  ! 261: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
brcommon_2_149:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xe43fe190  ! 262: STD_I	std	%r18, [%r31 + 0x0190]
	.word 0x99a00170  ! 263: FABSq	dis not found

	.word 0x997038dc  ! 264: POPC_I	popc	0x18dc, %r12
	.word 0xe827e0e4  ! 265: STW_I	stw	%r20, [%r31 + 0x00e4]
	.word 0xe8cfe028  ! 266: LDSBA_I	ldsba	[%r31, + 0x0028] %asi, %r20
	.word 0x95a349d2  ! 267: FDIVd	fdivd	%f44, %f18, %f10
memptr_2_150:
	set user_data_start, %r31
	.word 0x8584235a  ! 268: WRCCR_I	wr	%r16, 0x035a, %ccr
splash_lsu_2_151:
	nop
	ta T_CHANGE_HPRIV
	set 0xdca83b43, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd43fe0c0  ! 270: STD_I	std	%r10, [%r31 + 0x00c0]
	.word 0xc3e88023  ! 271: PREFETCHA_R	prefetcha	[%r2, %r3] 0x01, #one_read
	.word 0xab828011  ! 272: WR_CLEAR_SOFTINT_R	wr	%r10, %r17, %clear_softint
pmu_2_152:
	nop
	setx 0xfffff9d2fffffc4f, %g1, %g7
	.word 0xa3800007  ! 273: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_2_153:
	nop
	ta T_CHANGE_HPRIV
	mov 0xad2, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe43ff85d  ! 274: STD_I	std	%r18, [%r31 + 0xfffff85d]
	.word 0x9f803dc8  ! 275: SIR	sir	0x1dc8
jmptr_2_154:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 276: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc1bfdf20  ! 277: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x9f80346f  ! 278: SIR	sir	0x146f
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_155:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 279: CASA_R	casa	[%r31] %asi, %r16, %r13
splash_tba_2_156:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 280: WRPR_TBA_R	wrpr	%r0, %r12, %tba
pmu_2_157:
	nop
	setx 0xfffff388fffff7b8, %g1, %g7
	.word 0xa3800007  ! 281: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_2_158:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d94c014  ! 282: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_159
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_159:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 283: RDPC	rd	%pc, %r16
	.word 0xa5a0016a  ! 284: FABSq	dis not found

jmptr_2_160:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 285: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_2_161:
	nop
	ta T_CHANGE_HPRIV
	setx 0x60a31dcc132fb63f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 286: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87ab0a41  ! 287: FCMPd	fcmpd	%fcc<n>, %f12, %f32
	.word 0x8d902b81  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x0b81, %pstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_163:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 289: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0x93a349d0  ! 290: FDIVd	fdivd	%f44, %f16, %f40
	.word 0x91944013  ! 291: WRPR_PIL_R	wrpr	%r17, %r19, %pil
	.word 0xc1bfdf20  ! 292: STDFA_R	stda	%f0, [%r0, %r31]
donret_2_165:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_165-donret_2_165-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d22a3d | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf46, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	done
donretarg_2_165:
	.word 0xd6ffe02c  ! 293: SWAPA_I	swapa	%r11, [%r31 + 0x002c] %asi
br_longdelay1_2_166:
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	.word 0x9d97c000  ! 294: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe19fe0e0  ! 295: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	setx 0xcf7967114e95e4f9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_167:
	.word 0x39400001  ! 296: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_2_168:
	nop
	ta T_CHANGE_HPRIV
	setx 0x46da8e2a8e042d3b, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 297: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 298: BL	bl,a	<label_0x1>
jmptr_2_169:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 299: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_170:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 300: CASA_R	casa	[%r31] %asi, %r8, %r11
	.word 0xd697e038  ! 301: LDUHA_I	lduha	[%r31, + 0x0038] %asi, %r11
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
setup_cmp:
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

unlock_sync_thds:
    set sync_thr_counter2, %r23
    st %r0, [%r23]          !unlock sync_thr_counter2
    sub %r23, 8, %r23
    st %r0, [%r23]          !unlock sync_thr_counter1
    sub %r23, 8, %r23
    st %r0, [%r23]          !unlock sync_thr_counter

    wr %r0, %r12, %asi
    ta T_CHANGE_NONHPRIV 
br_badelay3_1_0:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa153aaaa	! Random illegal ?
	.word 0xe510c011  ! 1: LDQF_R	-	[%r3, %r17], %f18
	.word 0x9ba44832  ! 1: FADDs	fadds	%f17, %f18, %f13
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_1
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_1:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 2: CASA_R	casa	[%r31] %asi, %r18, %r13
splash_hpstate_1_2:
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x8198215c  ! 3: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015c, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_3:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 4: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x91d02032  ! 5: Tcc_I	ta	icc_or_xcc, %r0 + 50
jmptr_1_4:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 6: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xdb27c000  ! 7: STF_R	st	%f13, [%r0, %r31]
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 8: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_1_5:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d930012  ! 9: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
	.word 0x91d020b2  ! 10: Tcc_I	ta	icc_or_xcc, %r0 + 178
pmu_1_6:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffcdffffff7a3, %g1, %g7
	.word 0xa3800007  ! 11: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_1_7:
	set 0x60340000, %r31
	.word 0x8580bc48  ! 12: WRCCR_I	wr	%r2, 0x1c48, %ccr
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_8
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_8
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_8:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 13: RDPC	rd	%pc, %r16
pmu_1_9:
	nop
	setx 0xffffff2efffff5f3, %g1, %g7
	.word 0xa3800007  ! 14: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_10
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_10:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 15: RDPC	rd	%pc, %r20
mondo_1_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d950007  ! 16: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
br_badelay3_1_12:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa75b2cfd	! Random illegal ?
	.word 0xa7a0054d  ! 1: FSQRTd	fsqrt	
	.word 0x99a48831  ! 17: FADDs	fadds	%f18, %f17, %f12
dvapa_1_13:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdf9, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd897c031  ! 18: LDUHA_R	lduha	[%r31, %r17] 0x01, %r12
tagged_1_14:
	tsubcctv %r18, 0x164b, %r16
	.word 0xd807e0e4  ! 19: LDUW_I	lduw	[%r31 + 0x00e4], %r12
	.word 0xc1bfe000  ! 20: STDFA_I	stda	%f0, [0x0000, %r31]
splash_hpstate_1_15:
	ta T_CHANGE_NONHPRIV
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x81982e3e  ! 21: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e3e, %hpstate
	.word 0xd8d7e008  ! 22: LDSHA_I	ldsha	[%r31, + 0x0008] %asi, %r12
intveclr_1_16:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf8a8caa2ad7e081c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 23: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_17
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_17:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 24: RDPC	rd	%pc, %r16
splash_htba_1_18:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 25: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
br_longdelay2_1_19:
	.word 0x26cac001  ! 1: BRLZ	brlz,a,pt	%r11,<label_0xac001>
	.word 0x39400001  ! 26: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
br_longdelay1_1_20:
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x9d97c000  ! 27: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xb1800011  ! 28: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x24c90001  ! 29: BRLEZ	brlez,a,pt	%r4,<label_0x90001>
	.word 0x93d02032  ! 30: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_tba_1_21:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 31: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_1_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d94c002  ! 32: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
	.word 0x20700001  ! 33: BPN	<illegal instruction>
	.word 0x91933307  ! 34: WRPR_PIL_I	wrpr	%r12, 0x1307, %pil
	.word 0x91d02035  ! 35: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x9f80372a  ! 36: SIR	sir	0x172a
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_23
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_23:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 37: RDPC	rd	%pc, %r19
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_24
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_24:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 38: RDPC	rd	%pc, %r8
jmptr_1_25:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 39: JMPL_R	jmpl	%r27 + %r0, %r27
ibp_1_26:
	nop
	ta T_CHANGE_HPRIV
	.word 0xd13fc002  ! 40: STDF_R	std	%f8, [%r2, %r31]
	setx 0xe9a9e97b1029cb38, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_27:
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902a32  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x0a32, %pstate
	.word 0xd06fe0b1  ! 43: LDSTUB_I	ldstub	%r8, [%r31 + 0x00b1]
trapasi_1_29:
mov 0x0, %r1 ! (VA for ASI 0x5b) 
	.word 0xd0904b60  ! 44: LDUHA_R	lduha	[%r1, %r0] 0x5b, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_30
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_30:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 45: RDPC	rd	%pc, %r12
fpinit_1_31:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 46: FCMPLE32	fcmple32	%d0, %d4, %r8
memptr_1_32:
	set 0x60540000, %r31
	.word 0x8584e598  ! 47: WRCCR_I	wr	%r19, 0x0598, %ccr
mondo_1_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d944012  ! 48: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
cmp_1_34:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x1, %r10
cmp_startwait1_34:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_34
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait1_34:
    brnz,a %r10, cmp_wait1_34
    ld [%r23], %r10
    ba,a cmp_startwait1_34
    mov 0x1, %r10
continue_cmp_1_34:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    ldxa [0x10]%asi, %r13       !Get enabled threads
    andn %r13, 0xff, %r16
    brz,a %r16, cmp_multi_core_1_34
    mov 0x5f, %r17
    best_set_reg(0x50d16a62b70e8900, %r16, %r17)
cmp_multi_core_1_34:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r13, %r14        !Apply core-enabled mask 
    andn %r14, 0x1, %r14  !Leave master thread
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x9194c009  ! 49: WRPR_PIL_R	wrpr	%r19, %r9, %pil
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_35:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 50: CASA_R	casa	[%r31] %asi, %r9, %r12
donret_1_36:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_36-donret_1_36-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00186739 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4dd, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	retry
donretarg_1_36:
	.word 0xd8ffe0cc  ! 51: SWAPA_I	swapa	%r12, [%r31 + 0x00cc] %asi
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
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
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_37:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 52: RDPC	rd	%pc, %r18
mondo_1_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d908014  ! 53: WRPR_WSTATE_R	wrpr	%r2, %r20, %wstate
	setx 0x3c44f00a8dc64b83, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_39:
	.word 0x39400001  ! 54: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_40
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_40:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 55: RDPC	rd	%pc, %r11
	.word 0x95a449c2  ! 56: FDIVd	fdivd	%f48, %f2, %f10
	.word 0xa5480000  ! 57: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	.word 0x99b107c2  ! 58: PDIST	pdistn	%d4, %d2, %d12
fpinit_1_41:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 59: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0x9f80243c  ! 60: SIR	sir	0x043c
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_42:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e002  ! 61: CASA_R	casa	[%r31] %asi, %r2, %r12
br_badelay2_1_43:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f24, %f10, %f0
	.word 0xa5b4430d  ! 62: ALIGNADDRESS	alignaddr	%r17, %r13, %r18
	.word 0x8d802004  ! 63: WRFPRS_I	wr	%r0, 0x0004, %fprs
br_longdelay1_1_44:
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 64: RESTORE_R	restore	%r31, %r0, %r31
	setx 0xa038a4168835bd5e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_45:
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe53fc000  ! 66: STDF_R	std	%f18, [%r0, %r31]
	.word 0xe497c02d  ! 67: LDUHA_R	lduha	[%r31, %r13] 0x01, %r18
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
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_47:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 68: RDPC	rd	%pc, %r16
	.word 0xb1800011  ! 69: WR_STICK_REG_R	wr	%r0, %r17, %-
splash_hpstate_1_48:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x81982acf  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acf, %hpstate
intveclr_1_49:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2422c1583dee8bf9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 71: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe03fe070  ! 72: STD_I	std	%r16, [%r31 + 0x0070]
splash_lsu_1_50:
	nop
	ta T_CHANGE_HPRIV
	set 0x691d429c, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 73: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe137e0e0  ! 74: STQF_I	-	%f16, [0x00e0, %r31]
	.word 0xe1bfe0e0  ! 75: STDFA_I	stda	%f16, [0x00e0, %r31]
	.word 0xe057e010  ! 76: LDSH_I	ldsh	[%r31 + 0x0010], %r16
splash_cmpr_1_51:
	nop
	setx 0x51429bec4fe14ed5, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 77: WRPR_TICK_R	wrpr	%r0, %r17, %tick
splash_lsu_1_52:
	nop
	ta T_CHANGE_HPRIV
	set 0x18042dfa, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 78: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_badelay2_1_53:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f12, %f16, %f16
	.word 0x99b08303  ! 79: ALIGNADDRESS	alignaddr	%r2, %r3, %r12
	.word 0xc1bfe020  ! 80: STDFA_I	stda	%f0, [0x0020, %r31]
splash_cmpr_1_54:
	nop
	setx 0x5a8c62409879eb36, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 81: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x9ba00162  ! 82: FABSq	dis not found

	.word 0xda9fc022  ! 83: LDDA_R	ldda	[%r31, %r2] 0x01, %r13
	.word 0xda97c022  ! 84: LDUHA_R	lduha	[%r31, %r2] 0x01, %r13
invtsb_1_57:
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
	.word 0x29800001  ! 85: FBL	fbl,a	<label_0x1>
memptr_1_58:
	set 0x60140000, %r31
	.word 0x8584ad09  ! 86: WRCCR_I	wr	%r18, 0x0d09, %ccr
	.word 0x91932ed5  ! 87: WRPR_PIL_I	wrpr	%r12, 0x0ed5, %pil
	.word 0x83d02032  ! 88: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_tba_1_59:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 89: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe1bfe040  ! 90: STDFA_I	stda	%f16, [0x0040, %r31]
	.word 0x9f80334b  ! 91: SIR	sir	0x134b
	.word 0xda6fe074  ! 92: LDSTUB_I	ldstub	%r13, [%r31 + 0x0074]
	.word 0xda47e030  ! 93: LDSW_I	ldsw	[%r31 + 0x0030], %r13
br_longdelay1_1_60:
	.word 0x26cc0001  ! 1: BRLZ	brlz,a,pt	%r16,<label_0xc0001>
	.word 0xbfe7c000  ! 94: SAVE_R	save	%r31, %r0, %r31
	.word 0xc30fc000  ! 95: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
jmptr_1_62:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 96: JMPL_R	jmpl	%r27 + %r0, %r27
br_badelay2_1_63:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x9bb18311  ! 97: ALIGNADDRESS	alignaddr	%r6, %r17, %r13
mondo_1_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d934009  ! 98: WRPR_WSTATE_R	wrpr	%r13, %r9, %wstate
	.word 0xe1bfdf20  ! 99: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_65:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_1_66:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7aa69c4d8961591d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 101: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_1_67:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdde, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xda3ff34b  ! 102: STD_I	std	%r13, [%r31 + 0xfffff34b]
trapasi_1_68:
mov 0x30, %r1 ! (VA for ASI 0x5b) 
	.word 0xdad84980  ! 103: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r13
	.word 0xc19fc2c0  ! 104: LDDFA_R	ldda	[%r31, %r0], %f0
brcommon_1_69:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xda97c029  ! 105: LDUHA_R	lduha	[%r31, %r9] 0x01, %r13
mondo_1_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d950010  ! 106: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_71:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 107: CASA_R	casa	[%r31] %asi, %r16, %r13
	.word 0xdb27e09c  ! 108: STF_I	st	%f13, [0x009c, %r31]
	.word 0xdadfc030  ! 109: LDXA_R	ldxa	[%r31, %r16] 0x01, %r13
	.word 0x93a449a1  ! 110: FDIVs	fdivs	%f17, %f1, %f9
change_to_randtl_1_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_73:
	.word 0x8f902001  ! 111: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd20fe010  ! 112: LDUB_I	ldub	[%r31 + 0x0010], %r9
splash_lsu_1_74:
	nop
	ta T_CHANGE_HPRIV
	set 0x3d8f931e, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 113: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_longdelay2_1_75:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x39400001  ! 114: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xb1800011  ! 115: WR_STICK_REG_R	wr	%r0, %r17, %-
ibp_1_76:
	nop
	ta T_CHANGE_HPRIV
	.word 0xe11fc001  ! 116: LDDF_R	ldd	[%r31, %r1], %f16
change_to_randtl_1_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_77:
	.word 0x8f902000  ! 117: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_78) + 0, 16, 16)) -> intp(3,0,10)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_78)&0xffffffff)  + 0, 16, 16)) -> intp(3,0,10)
intvec_1_78:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cmp_1_79:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x1, %r10
cmp_startwait1_79:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_79
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait1_79:
    brnz,a %r10, cmp_wait1_79
    ld [%r23], %r10
    ba,a cmp_startwait1_79
    mov 0x1, %r10
continue_cmp_1_79:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    ldxa [0x10]%asi, %r13       !Get enabled threads
    andn %r13, 0xff, %r16
    brz,a %r16, cmp_multi_core_1_79
    mov 0x6a, %r17
    best_set_reg(0x498bbbd25b52189b, %r16, %r17)
cmp_multi_core_1_79:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r13, %r14        !Apply core-enabled mask 
    andn %r14, 0x1, %r14  !Leave master thread
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9190c012  ! 119: WRPR_PIL_R	wrpr	%r3, %r18, %pil
	.word 0x99b2c491  ! 120: FCMPLE32	fcmple32	%d42, %d48, %r12
	.word 0xe1bfe080  ! 121: STDFA_I	stda	%f16, [0x0080, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_80:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 122: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xd88fe008  ! 123: LDUBA_I	lduba	[%r31, + 0x0008] %asi, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_81
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_81:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 124: RDPC	rd	%pc, %r19
fpinit_1_82:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 125: FDIVd	fdivd	%f0, %f4, %f8
	.word 0xb1800011  ! 126: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xe63fe970  ! 127: STD_I	std	%r19, [%r31 + 0x0970]
	.word 0xe737e044  ! 128: STQF_I	-	%f19, [0x0044, %r31]
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x8d90201c  ! 129: WRPR_PSTATE_I	wrpr	%r0, 0x001c, %pstate
trapasi_1_85:
mov 0x18, %r1 ! (VA for ASI 0x4c) 
	.word 0xe6904b40  ! 130: LDUHA_R	lduha	[%r1, %r0] 0x5a, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_86) + 48, 16, 16)) -> intp(2,0,23)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_86)&0xffffffff)  + 48, 16, 16)) -> intp(2,0,23)
intvec_1_86:
	.word 0x39400001  ! 131: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_87:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d928011  ! 132: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
splash_hpstate_1_88:
	.word 0x8198264c  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x064c, %hpstate
	.word 0xe19fe0c0  ! 134: LDDFA_I	ldda	[%r31, 0x00c0], %f16
	.word 0x87a8ca48  ! 135: FCMPd	fcmpd	%fcc<n>, %f34, %f8
	.word 0x87a84a53  ! 136: FCMPd	fcmpd	%fcc<n>, %f32, %f50
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 137: Tcc_R	ta	icc_or_xcc, %r0 + %r30
br_longdelay3_1_90:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902002  ! 138: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
fpinit_1_91:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 139: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x93a409b1  ! 140: FDIVs	fdivs	%f16, %f17, %f9
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0x8d902635  ! 142: WRPR_PSTATE_I	wrpr	%r0, 0x0635, %pstate
tglhtw_1_93:
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
	.word 0x97b40992  ! 143: BSHUFFLE	fmovc32	%d16, %d18, %d42
trapasi_1_94:
mov 0x28, %r1 ! (VA for ASI 0x5a) 
	.word 0xd6904980  ! 144: LDUHA_R	lduha	[%r1, %r0] 0x4c, %r11
	.word 0x97a0016c  ! 145: FABSq	dis not found

br_longdelay1_1_95:
	.word 0x2ccc8001  ! 1: BRGZ	brgz,a,pt	%r18,<label_0xc8001>
	.word 0xbfe7c000  ! 146: SAVE_R	save	%r31, %r0, %r31
	.word 0xd6bfe0a8  ! 147: STDA_I	stda	%r11, [%r31 + 0x00a8] %asi
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 148: Tcc_R	te	icc_or_xcc, %r0 + %r30
br_longdelay1_1_96:
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0xbfe7c000  ! 149: SAVE_R	save	%r31, %r0, %r31
	.word 0x83d02034  ! 150: Tcc_I	te	icc_or_xcc, %r0 + 52
jmptr_1_97:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 151: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_1_98:
	nop
	setx 0xfffff98cfffffbee, %g1, %g7
	.word 0xa3800007  ! 152: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_1_99:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 153: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_1_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d94400a  ! 154: WRPR_WSTATE_R	wrpr	%r17, %r10, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81460000  ! 156: RD_STICK_REG	stbar
splash_cmpr_1_101:
	nop
	setx 0xf3254b9fcb6cb179, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 157: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x9f803c99  ! 158: SIR	sir	0x1c99
brcommon_1_102:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xd73fc00a  ! 159: STDF_R	std	%f11, [%r10, %r31]
pmu_1_103:
	nop
	setx 0xfffff815fffff5e5, %g1, %g7
	.word 0xa3800007  ! 160: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe19fc2c0  ! 161: LDDFA_R	ldda	[%r31, %r0], %f16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_104) + 8, 16, 16)) -> intp(1,0,23)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_104)&0xffffffff)  + 8, 16, 16)) -> intp(1,0,23)
intvec_1_104:
	.word 0x39400001  ! 162: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a2c9d4  ! 163: FDIVd	fdivd	%f42, %f20, %f40
	.word 0x8d903ea4  ! 164: WRPR_PSTATE_I	wrpr	%r0, 0x1ea4, %pstate
jmptr_1_106:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 165: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_1_107:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfda, %r20
	mov 0x3, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd2dfc034  ! 166: LDXA_R	ldxa	[%r31, %r20] 0x01, %r9
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 167: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0xa9a4c9c8  ! 168: FDIVd	fdivd	%f50, %f8, %f20
	.word 0xa1a1c9c3  ! 169: FDIVd	fdivd	%f38, %f34, %f16
dvapa_1_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd65, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe03fe3c9  ! 170: STD_I	std	%r16, [%r31 + 0x03c9]
mondo_1_110:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d948006  ! 171: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
	.word 0xe05fe038  ! 172: LDX_I	ldx	[%r31 + 0x0038], %r16
	.word 0xab834008  ! 173: WR_CLEAR_SOFTINT_R	wr	%r13, %r8, %clear_softint
intveclr_1_111:
	nop
	ta T_CHANGE_HPRIV
	setx 0xdaa4bd362edae948, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 174: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99a00161  ! 175: FABSq	dis not found

	.word 0xb1800011  ! 176: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xc19fdb60  ! 177: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xb1800011  ! 178: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x91703dd2  ! 179: POPC_I	popc	0x1dd2, %r8
	.word 0x91d020b2  ! 180: Tcc_I	ta	icc_or_xcc, %r0 + 178
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_112:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 181: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x2a700001  ! 182: BPCS	<illegal instruction>
	.word 0x8d9033a3  ! 183: WRPR_PSTATE_I	wrpr	%r0, 0x13a3, %pstate
cmp_1_114:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x1, %r10
cmp_startwait1_114:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_114
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait1_114:
    brnz,a %r10, cmp_wait1_114
    ld [%r23], %r10
    ba,a cmp_startwait1_114
    mov 0x1, %r10
continue_cmp_1_114:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    ldxa [0x10]%asi, %r13       !Get enabled threads
    andn %r13, 0xff, %r16
    brz,a %r16, cmp_multi_core_1_114
    mov 56, %r17
    best_set_reg(0x7fe3720e53aef871, %r16, %r17)
cmp_multi_core_1_114:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r13, %r14        !Apply core-enabled mask 
    andn %r14, 0x1, %r14  !Leave master thread
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91904012  ! 184: WRPR_PIL_R	wrpr	%r1, %r18, %pil
donret_1_115:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_115-donret_1_115-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00415be4 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x39f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_115:
	.word 0xd0ffe04d  ! 185: SWAPA_I	swapa	%r8, [%r31 + 0x004d] %asi
	.word 0xe1bfc3e0  ! 186: STDFA_R	stda	%f16, [%r0, %r31]
splash_cmpr_1_116:
	nop
	setx 0x15b99b939b353800, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 187: WRPR_TICK_R	wrpr	%r0, %r17, %tick
trapasi_1_117:
mov 0x10, %r1 ! (VA for ASI 0x4c) 
	.word 0xd09044a0  ! 188: LDUHA_R	lduha	[%r1, %r0] 0x25, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_118
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_118:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 189: RDPC	rd	%pc, %r20
	.word 0xe827e070  ! 190: STW_I	stw	%r20, [%r31 + 0x0070]
    set 0x2679, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b207c5  ! 191: PDIST	pdistn	%d8, %d36, %d18
	.word 0xa9450000  ! 192: RD_SET_SOFTINT	rd	%set_softint, %r20
	.word 0xe1bfda00  ! 193: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe81fc000  ! 194: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0xe857e030  ! 195: LDSH_I	ldsh	[%r31 + 0x0030], %r20
	.word 0xc3ec802a  ! 196: PREFETCHA_R	prefetcha	[%r18, %r10] 0x01, #one_read
	.word 0xc1bfc3e0  ! 197: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x95b0448a  ! 198: FCMPLE32	fcmple32	%d32, %d10, %r10
	.word 0xb1800011  ! 199: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x9f803e6a  ! 200: SIR	sir	0x1e6a
jmptr_1_119:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 201: JMPL_R	jmpl	%r27 + %r0, %r27
br_longdelay3_1_120:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902000  ! 202: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xc1bfd960  ! 203: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd437e037  ! 204: STH_I	sth	%r10, [%r31 + 0x0037]
splash_tba_1_121:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 205: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_1_122:
	tsubcctv %r2, 0x1804, %r19
	.word 0xd407e044  ! 206: LDUW_I	lduw	[%r31 + 0x0044], %r10
	.word 0x9f803e9c  ! 207: SIR	sir	0x1e9c
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_123
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_123:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 208: CASA_R	casa	[%r31] %asi, %r10, %r10
jmptr_1_124:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 209: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa150c000  ! 210: RDPR_TT	<illegal instruction>
	.word 0xe137c000  ! 211: STQF_R	-	%f16, [%r0, %r31]
intveclr_1_125:
	nop
	ta T_CHANGE_HPRIV
	setx 0x53a4920e2d9f9c79, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 212: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_1_126:
	nop
	ta T_CHANGE_HPRIV
	setx 0x838ce294a3082ef5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 213: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x32700001  ! 214: BPNE	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r16
br_longdelay3_1_127:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902002  ! 216: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
splash_lsu_1_128:
	nop
	ta T_CHANGE_HPRIV
	set 0x5fe9243a, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_129:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 218: CASA_R	casa	[%r31] %asi, %r10, %r16
pmu_1_130:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffbedfffff72a, %g1, %g7
	.word 0xa3800007  ! 219: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cmp_1_131:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x1, %r10
cmp_startwait1_131:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_131
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait1_131:
    brnz,a %r10, cmp_wait1_131
    ld [%r23], %r10
    ba,a cmp_startwait1_131
    mov 0x1, %r10
continue_cmp_1_131:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    ldxa [0x10]%asi, %r13       !Get enabled threads
    andn %r13, 0xff, %r16
    brz,a %r16, cmp_multi_core_1_131
    mov 0xce, %r17
    best_set_reg(0x5e05e59f07bf71da, %r16, %r17)
cmp_multi_core_1_131:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r13, %r14        !Apply core-enabled mask 
    andn %r14, 0x1, %r14  !Leave master thread
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9195000c  ! 220: WRPR_PIL_R	wrpr	%r20, %r12, %pil
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 221: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9b70281d  ! 222: POPC_I	popc	0x081d, %r13
intveclr_1_132:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7540d9d2c84f2f99, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_133:
	ta T_CHANGE_NONHPRIV
	.word 0x81982814  ! 224: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0814, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_134)+0, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_134)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_134:
	.word 0xa98433c2  ! 225: WR_SET_SOFTINT_I	wr	%r16, 0x13c2, %set_softint
	.word 0xa5520000  ! 226: RDPR_PIL	<illegal instruction>
pmu_1_135:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc26fffff5ea, %g1, %g7
	.word 0xa3800007  ! 227: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f80359f  ! 228: SIR	sir	0x159f
	.word 0xe537c000  ! 229: STQF_R	-	%f18, [%r0, %r31]
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 230: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99a109d4  ! 231: FDIVd	fdivd	%f4, %f20, %f12
splash_hpstate_1_136:
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8198260e  ! 232: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060e, %hpstate
	setx 0xe54239a597d18756, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_137:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 234: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb1800011  ! 235: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0xd80fe000  ! 236: LDUB_I	ldub	[%r31 + 0x0000], %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_138
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_138
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_138:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 237: RDPC	rd	%pc, %r19
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 238: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_139
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_139:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 239: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0xe71fc000  ! 240: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x81460000  ! 241: RD_STICK_REG	stbar
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_140
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_140:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 242: RDPC	rd	%pc, %r16
	.word 0x91d02034  ! 243: Tcc_I	ta	icc_or_xcc, %r0 + 52
trapasi_1_141:
mov 0x3d0, %r1 ! (VA for ASI 0x25) 
	.word 0xe0c04980  ! 244: LDSWA_R	ldswa	[%r1, %r0] 0x4c, %r16
	.word 0xa5a00174  ! 245: FABSq	dis not found

	.word 0x83d020b2  ! 246: Tcc_I	te	icc_or_xcc, %r0 + 178
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 247: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_1_142:
	nop
	ta T_CHANGE_HPRIV
	set 0xa5a24c04, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 248: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_1_143:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffe74fffffd36, %g1, %g7
	.word 0xa3800007  ! 249: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc1bfe000  ! 250: STDFA_I	stda	%f0, [0x0000, %r31]
	.word 0xb1800011  ! 251: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x91d020b5  ! 252: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xe1bfe060  ! 253: STDFA_I	stda	%f16, [0x0060, %r31]
memptr_1_144:
	set user_data_start, %r31
	.word 0x8584e190  ! 254: WRCCR_I	wr	%r19, 0x0190, %ccr
fpinit_1_145:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 255: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x8d90263b  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x063b, %pstate
	.word 0xe527e01d  ! 257: STF_I	st	%f18, [0x001d, %r31]
splash_lsu_1_147:
	nop
	ta T_CHANGE_HPRIV
	set 0x2e029d96, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 258: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc19fc2c0  ! 259: LDDFA_R	ldda	[%r31, %r0], %f0
mondo_1_148:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d94c014  ! 260: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0xa5480000  ! 261: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
brcommon_1_149:
    ba,a .+12
    mov %r31, %r15
    ba,a .+8
    call common_target
	.word 0xc32fc014  ! 262: STXFSR_R	st-sfr	%f1, [%r20, %r31]
	.word 0xa3a00173  ! 263: FABSq	dis not found

	.word 0xa9702192  ! 264: POPC_I	popc	0x0192, %r20
	.word 0xe827e061  ! 265: STW_I	stw	%r20, [%r31 + 0x0061]
	.word 0xe8cfe008  ! 266: LDSBA_I	ldsba	[%r31, + 0x0008] %asi, %r20
	.word 0x9f80326b  ! 267: SIR	sir	0x126b
memptr_1_150:
	set user_data_start, %r31
	.word 0x85852887  ! 268: WRCCR_I	wr	%r20, 0x0887, %ccr
splash_lsu_1_151:
	nop
	ta T_CHANGE_HPRIV
	set 0x91fae941, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd43fe0fa  ! 270: STD_I	std	%r10, [%r31 + 0x00fa]
	.word 0x87acca54  ! 271: FCMPd	fcmpd	%fcc<n>, %f50, %f20
	.word 0xab850013  ! 272: WR_CLEAR_SOFTINT_R	wr	%r20, %r19, %clear_softint
pmu_1_152:
	nop
	setx 0xfffff9b8ffffff95, %g1, %g7
	.word 0xa3800007  ! 273: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_1_153:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcfd, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe4bfc033  ! 274: STDA_R	stda	%r18, [%r31 + %r19] 0x01
	.word 0xc3ec8030  ! 275: PREFETCHA_R	prefetcha	[%r18, %r16] 0x01, #one_read
jmptr_1_154:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 276: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc19fc3e0  ! 277: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x9f803ca3  ! 278: SIR	sir	0x1ca3
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_155:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 279: CASA_R	casa	[%r31] %asi, %r16, %r13
splash_tba_1_156:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 280: WRPR_TBA_R	wrpr	%r0, %r12, %tba
pmu_1_157:
	nop
	setx 0xfffff8d2fffff71e, %g1, %g7
	.word 0xa3800007  ! 281: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_1_158:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d914014  ! 282: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_159
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_159:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 283: RDPC	rd	%pc, %r13
	.word 0xa1a00168  ! 284: FABSq	dis not found

jmptr_1_160:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 285: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_1_161:
	nop
	ta T_CHANGE_HPRIV
	setx 0x431e0514ad550551, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 286: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9a4c9d0  ! 287: FDIVd	fdivd	%f50, %f16, %f20
	.word 0x8d903995  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x1995, %pstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_163:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 289: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0x97a4c9c6  ! 290: FDIVd	fdivd	%f50, %f6, %f42
cmp_1_164:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
    mov 0x1, %r10
cmp_startwait1_164:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_164
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait1_164:
    brnz,a %r10, cmp_wait1_164
    ld [%r23], %r10
    ba,a cmp_startwait1_164
    mov 0x1, %r10
continue_cmp_1_164:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    ldxa [0x10]%asi, %r13       !Get enabled threads
    andn %r13, 0xff, %r16
    brz,a %r16, cmp_multi_core_1_164
    mov 0xfa, %r17
    best_set_reg(0x1a39c28e4c2d4aa5, %r16, %r17)
cmp_multi_core_1_164:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r13, %r14        !Apply core-enabled mask 
    andn %r14, 0x1, %r14  !Leave master thread
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9192c008  ! 291: WRPR_PIL_R	wrpr	%r11, %r8, %pil
	.word 0xc1bfdb60  ! 292: STDFA_R	stda	%f0, [%r0, %r31]
donret_1_165:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_165-donret_1_165-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006274c5 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x39e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	done
donretarg_1_165:
	.word 0xd6ffe040  ! 293: SWAPA_I	swapa	%r11, [%r31 + 0x0040] %asi
br_longdelay1_1_166:
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0xbfe7c000  ! 294: SAVE_R	save	%r31, %r0, %r31
	.word 0xc19fe040  ! 295: LDDFA_I	ldda	[%r31, 0x0040], %f0
	setx 0x02059783fb0ad534, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_167:
	.word 0x39400001  ! 296: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_1_168:
	nop
	ta T_CHANGE_HPRIV
	setx 0xcf4e25324d53cc20, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 297: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 298: BL	bl,a	<label_0x1>
jmptr_1_169:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 299: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_170:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 300: CASA_R	casa	[%r31] %asi, %r8, %r11
	.word 0xd697e010  ! 301: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
cmpenall_1_171:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmpenall_startwait1_171:
    mov 0x1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_1_171
    nop
cmpenall_wait1_171:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait1_171
    nop
    ba,a cmpenall_startwait1_171
continue_cmpenall_1_171:
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_1_171:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r14
    bne,a %xcc, wait_for_cmpstat_1_171
    ldxa [0x58]%asi, %r14       !Running_status
    ldxa [0x10]%asi, %r14       !Get enabled threads
    stxa %r14, [0x50]%asi 
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_1_171:
    cmp %r14, %r16
    bne,a %xcc, wait_for_cmpstat2_1_171
    ldxa [0x58]%asi, %r16       !Running_status
    st %g0, [%r23]              !clear lock
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

	.xword	0x5e0cb42970bec7b5
	.xword	0xdaaaa6ba9aad426a
	.xword	0x44329127095915cf
	.xword	0xd2c1b71d1e640ea9
	.xword	0xf46d254932a1d74a
	.xword	0xa9bc7469cb08c897
	.xword	0x48cb547e25d7e75d
	.xword	0xca3d01d87466f44e
	.xword	0xb2d5c06a367eea9a
	.xword	0x66440fe5091ddfb0
	.xword	0xf36c480917c6755f
	.xword	0x4c342f28d7e8b9ae
	.xword	0x39a24f65d6cdf847
	.xword	0x1d6e26f4ad3ba826
	.xword	0x3240f4ea0ac28fe5
	.xword	0xaed783d269711147
	.xword	0xd56a0533da86550e
	.xword	0x9bb80b2941c066cf
	.xword	0xa923c710ddce4a71
	.xword	0x4e1a73d778c124fa
	.xword	0xa191e0be3872745f
	.xword	0x01bcb1e84da7d4f7
	.xword	0x7c21e5092eedc158
	.xword	0xb8f4de0b1031d1db
	.xword	0xbdd62a00dc73e4f9
	.xword	0x9b9cad2b4c9ee388
	.xword	0xd203a71a6911f11f
	.xword	0x6b93782606ec3187
	.xword	0x9b01e44e177de168
	.xword	0x682fbfde4e65030c
	.xword	0x5b55236ec0b7ef2e
	.xword	0x6248a4f04c6566d1
	.xword	0xef57a0f7fbd5f813
	.xword	0x442c85f6fdea76ec
	.xword	0xaf07437eacc65ffa
	.xword	0x18551f413049ccbb
	.xword	0x9b22eeeb177673d7
	.xword	0xa6b28319ec325925
	.xword	0x4ff68b2f46b21014
	.xword	0x79371d8efeab6c31
	.xword	0x50502f45b9c1a098
	.xword	0x04a48e646ede6cfc
	.xword	0xf5eb8906181bd807
	.xword	0xb2b2dc69253f79dc
	.xword	0x01a474b0ba9f5a44
	.xword	0x840754f7e69e81f0
	.xword	0x472d03c1ae2ba227
	.xword	0x350695e3de8fd29b
	.xword	0x9eb6c131ffbcce81
	.xword	0x76f3c27f93102dfa
	.xword	0xb22716957bd1aa37
	.xword	0x0b94b9040d5d1810
	.xword	0x60c37d1805066dea
	.xword	0xb78e3d6a78dc99cb
	.xword	0x6efc8e819a202650
	.xword	0x3d4dc0113995cd8f
	.xword	0xdf1ca1f2b442b2f5
	.xword	0x5ae327f4895de30c
	.xword	0xad3f284d42eba36c
	.xword	0x2e3eacbe8d2702b7
	.xword	0x110c979a77d94ebd
	.xword	0xeae6102bd5a9d69a
	.xword	0x48e2e8277be0413b
	.xword	0x4477988f41085386
	.xword	0x2f3f46157f85cb83
	.xword	0x1f10f25386759ab9
	.xword	0xb7787b0aaad1f2d6
	.xword	0x64ca319ba011dbee
	.xword	0x6c56997ad316baa7
	.xword	0x3a616245329868ed
	.xword	0x7dbc9ee58c79437a
	.xword	0x940d327d3e3c88ef
	.xword	0x806d2b335747cc57
	.xword	0xd5e715deb03b13cd
	.xword	0xb0fac220f1ff776d
	.xword	0x4d05673c335e5d2e
	.xword	0x4b8e9a55f8ba315e
	.xword	0x30c499c348e9783d
	.xword	0xb51d6fae96ba810f
	.xword	0xcb9b420e8f408242
	.xword	0xa021aef0cafa77bf
	.xword	0x7af17cd726b97a0e
	.xword	0x4e8825aee0cc2504
	.xword	0xc3d923e4f3ace000
	.xword	0xea8b5c79e2290cf4
	.xword	0x3e453b31e4ca084f
	.xword	0x6cb08fe9685b0967
	.xword	0x9d60020edea3f350
	.xword	0x8b3d6dd67cdb8e80
	.xword	0x1ba036791f597503
	.xword	0xe1994cc22e70ca5d
	.xword	0x020a87f29066372a
	.xword	0xdc8a6c9cf30704d7
	.xword	0x8bafb185e08eff5e
	.xword	0xe2b38167d09b39b9
	.xword	0x2b9aab2be87a6227
	.xword	0xa8ec38e10438d661
	.xword	0x16ada8de7b995d90
	.xword	0x078750ae01b1de6b
	.xword	0x36c173e357583ec3
	.xword	0x72476a042349f883
	.xword	0x6ea8fcf2e603cf0b
	.xword	0x884ec1f5255c7355
	.xword	0xf72322f89e665718
	.xword	0xe778cdbdd6ca9451
	.xword	0xd461d8bb2ed2e284
	.xword	0xd08b8aed74860ed5
	.xword	0x29772f5a480848fe
	.xword	0x1eff4dc35a09308e
	.xword	0xa55bcc4c2d9d5367
	.xword	0x600bb64a67c2b350
	.xword	0x26496d62fe4600d6
	.xword	0xfc4c770bcda76e4a
	.xword	0xa1891a4910ca65b6
	.xword	0x6b5d0d2118c0647d
	.xword	0x8e01f4ea58a3fb10
	.xword	0x953a75f526bd1b69
	.xword	0xecfe0e502be9aec9
	.xword	0x9356b4ee96ae7734
	.xword	0x91e8733f93c18994
	.xword	0x57c84ebee5636275
	.xword	0x416a3c0ccd828371
	.xword	0xc16931d12009868a
	.xword	0xa025c59f9b5c2fda
	.xword	0xda0768d17d67b183
	.xword	0x4f76121c6dfd4b98
	.xword	0x73c1d614df129543
	.xword	0xe466f4dddc9f642a
	.xword	0x901f095ca00acd84
	.xword	0x5a4c092ca739fa16
	.xword	0x27ad36683fefa2af
	.xword	0xa736e794dfef98fe
	.xword	0xbfd005b63b2198d4
	.xword	0x4247a7b01a91b52e
	.xword	0xd9e23c72c739458e
	.xword	0x0acfeb13c14436d5
	.xword	0x0de60db3cf8f88c1
	.xword	0xf6930e11d5cce598
	.xword	0xd05886a7a2d77257
	.xword	0x6df3d8123b96a7fb
	.xword	0x48676264703cde13
	.xword	0x83e26c834d5f9d08
	.xword	0x3bf7cf03ea47a9b6
	.xword	0xca51d3650717c8ca
	.xword	0x53cea7475b77c329
	.xword	0x4d6de56edce9d07e
	.xword	0xe2be870dfad513ee
	.xword	0x9bfa3a927ac7e194
	.xword	0x49eed9791e29e18e
	.xword	0x277dc88d5a5eeeac
	.xword	0x298cc358e0c45351
	.xword	0xb70bfd13391b8090
	.xword	0x7909702108d99e7e
	.xword	0x640ed7a43cf64b1b
	.xword	0xda4b1d16a98a17dc
	.xword	0x7aa63bb7aa2dd9c7
	.xword	0x96c8ac0fc7704b00
	.xword	0xe0ea526cec01b4a6
	.xword	0x8bc7a604541f9989
	.xword	0x7a530317b9197a6b
	.xword	0x6f8e1f164e7299f0
	.xword	0x932dc9ca95998e8d
	.xword	0x9961dcf4593177e0
	.xword	0x279c8aa5a3e0bef5
	.xword	0x2e9afc9b0854ddaa
	.xword	0xc24978888985b9e1
	.xword	0x8193a96d0044454e
	.xword	0x7f14a9606df39324
	.xword	0x077b8531e10ed301
	.xword	0x457074d3c17fdc68
	.xword	0xa76470070da37c94
	.xword	0xd6397738430be50a
	.xword	0xf47c37c1c6109474
	.xword	0xd4467f3e7c4a545c
	.xword	0x080e06482281c983
	.xword	0x046f04fc3794b1ba
	.xword	0xeecc4b1bc6f30636
	.xword	0x20ae49fbfb6e3613
	.xword	0x5fb027fccfc1a433
	.xword	0xef7fdb73d2b5fad5
	.xword	0x1855db0a183b8a6e
	.xword	0xae1372be6fce8027
	.xword	0xd122e902970e4848
	.xword	0xc6ba3aa0e9b5c5c4
	.xword	0xe90b8e55948aabd7
	.xword	0xd0c93f3119bed6b0
	.xword	0x6569bb4dea594714
	.xword	0xe964953cae1a674a
	.xword	0xc47bc7b322e848b5
	.xword	0xca4d4d415dcdf0e3
	.xword	0x726b092dbba2875c
	.xword	0xd9bed5ea33e4d596
	.xword	0x796f3eb09a1fee0b
	.xword	0x39f2a78b9b8dafcd
	.xword	0xc96bb6c3dbc71a3b
	.xword	0xd0d97ca121891d05
	.xword	0xea1a259f85ed305b
	.xword	0xf3e3c8a58456c145
	.xword	0x9914f92d45b5a286
	.xword	0x7f7ec63ccb5e0bba
	.xword	0x5b8fe32776cfdaed
	.xword	0x98a15a95bbfaefa3
	.xword	0x2ecfc9d3725fe6e1
	.xword	0xd360e9b5ac43d76f
	.xword	0xcfd993648994715d
	.xword	0x41a966433ebbb67d
	.xword	0x5ea74ef32d6dded7
	.xword	0xb20041593ce00951
	.xword	0x15ee1395252fdbcf
	.xword	0xe3a224797b66e98e
	.xword	0x06721833d4514d0f
	.xword	0x5e3055ecfa4eae84
	.xword	0x37d283ad29aa2e45
	.xword	0xf601d6b72a510490
	.xword	0x98f840071808642d
	.xword	0x95bd10c87b22709f
	.xword	0x527d38cea77ea4f8
	.xword	0x079206867a010d9d
	.xword	0x3d7c58ebaca92626
	.xword	0x8925f8b884577c57
	.xword	0x6603b5f243afb6d2
	.xword	0xdee19bc396723d6e
	.xword	0x760290527c03fe7a
	.xword	0x52e392cee44e3ca6
	.xword	0xdbd9a8f79d387b50
	.xword	0xe567e0c138faaf54
	.xword	0x7986b115f24c5cbf
	.xword	0xfc9a416142511034
	.xword	0xe7fab62f9e2fb550
	.xword	0x0f70fa05834592f6
	.xword	0xef2fac0bc90caf74
	.xword	0xb31be91a27a2180a
	.xword	0xcd93f7f0942719fe
	.xword	0x8acb6360664e2c50
	.xword	0x2073d07fd5f8cae0
	.xword	0xd3696e3a79f3c426
	.xword	0x5aa757a38658bc99
	.xword	0xa860f64940f8488a
	.xword	0xb07de388f31e1122
	.xword	0x8e75ccce5518dfea
	.xword	0xfcae00a9961c681f
	.xword	0xe431412406862709
	.xword	0x2fff75df93d2d8a1
	.xword	0xf78a59880ff88ec2
	.xword	0x13b7edf5e2edee93
	.xword	0x779a992f2e280cda
	.xword	0xa168933d8eed6fcb
	.xword	0x8ded19d47fad43e4
	.xword	0xa0cda3cf45830b30
	.xword	0x8b93655c052059c4
	.xword	0x18f2fd2160c5417c
	.xword	0x4312de6dc81ff1ff
	.xword	0x9a68da9b052a0470
	.xword	0x9e8441ddaa69936b
	.xword	0x264486c807d76137
	.xword	0xacd49af88bfa89f8

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
# 877 "diag.j"
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
	TTE_CP	 = 1,
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
	TTE_CP	 = 1,
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
	TTE_IE	 = 0,
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
	TTE_CV	 = 1,
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
	TTE_Size	 = 0,
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
	TTE_Size	 = 3,
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
	.xword	0x7d975c0f4ce79f51
	.xword	0x5f69ce29b9a82d5e
	.xword	0x44a98ba87fe17163
	.xword	0x232e779db6300fa0
	.xword	0x90dbb689f290e934
	.xword	0xa74965ef1ae5906a
	.xword	0x485668343b8043a9
	.xword	0xa7cb8d2426a41ae7
	.xword	0xa264713337523341
	.xword	0xc8fa1667997a08ae
	.xword	0xd187325e909876c2
	.xword	0x3311f6160c53e85c
	.xword	0x62d731d7dff8ad8b
	.xword	0xb6c369b41809d274
	.xword	0xee6ffb60320e2d4e
	.xword	0x6f157372b0ef0ecd
	.xword	0x1572c8c730da1efd
	.xword	0xeb066beabf2a142a
	.xword	0x78ef79bf2c13afdf
	.xword	0xe2fb8db92812c8e5
	.xword	0x91a07666a9739327
	.xword	0x3576f55e96f1419f
	.xword	0x20ced70dacd76103
	.xword	0xfada5462903ca1c0
	.xword	0x9f21eae82979048b
	.xword	0xa50ce6ec40438b96
	.xword	0x0c6e370c64d8c6a3
	.xword	0xa7bc0761eae5e3f8
	.xword	0x475ba2d36bec1072
	.xword	0xba771629b27fb8ad
	.xword	0xa668bd74dabec926
	.xword	0x66d1aeacaaaaac2b



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
	TTE_E	 = 1,
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
	TTE_Size	 = 0,
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
	.xword	0xc84da1f86e589c42
	.xword	0xdceb8db057cd341b
	.xword	0xc35b26032b8eea7f
	.xword	0xb06ec9c9df7183a0
	.xword	0xd5885e3d01e85314
	.xword	0xf79f1c1db2b3650e
	.xword	0x7fca549eb07e26c0
	.xword	0x89e4ab76294c29f6
	.xword	0x54b0ec9c106d3b24
	.xword	0x372fd7d9b953682d
	.xword	0x998fcc8cf06c2486
	.xword	0x638a76e44060ca6d
	.xword	0x6de99b8bb9f691b0
	.xword	0x8342fb98b2edc8da
	.xword	0x9a236a3ffa63720b
	.xword	0xa056103eb2d58d37
	.xword	0xed6428f6dd38083f
	.xword	0x1965c4d8ba35cd8f
	.xword	0xf99312c9cc62cfbd
	.xword	0x7663321752941628
	.xword	0x58750fbd229a79a5
	.xword	0x7b5bcfb1f2397308
	.xword	0x01fe3e2de2bfa552
	.xword	0xecee1ac42bd87302
	.xword	0xfd511b9f8f8d8072
	.xword	0xac208cc80b5bc50b
	.xword	0x88ba5ca14e4a49c1
	.xword	0xd04b3ed9c011a6bc
	.xword	0x725af881055fa76a
	.xword	0xbfada8dd4a21f7fe
	.xword	0x8aa4520713c27c7c
	.xword	0x9a1192358704cd12



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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
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
	Name	 = .MyDATA_2,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_2,
	hypervisor
}

.data
	.xword	0xb9c1f2a9e1016fa9
	.xword	0xf32964ff79de0948
	.xword	0xcabdb2e190bbd4e4
	.xword	0xf818cfaad8f77a20
	.xword	0x6e525378361e58b0
	.xword	0x8df894575a682156
	.xword	0x89c9b110e4dce85d
	.xword	0xbe8609c2d31ceb20
	.xword	0x5232283fc6625a5c
	.xword	0xf53bb0d961ca0682
	.xword	0xb212332159e4148a
	.xword	0x1e11f31efbbc7060
	.xword	0x10609b36c692b1ec
	.xword	0xd17e6da2cf82eb59
	.xword	0xd613b219cc14ce52
	.xword	0xd001720b77ee8358
	.xword	0xd89757f2587954f6
	.xword	0xd16c0da89ce957f8
	.xword	0x347942f2741a5958
	.xword	0xfda7c795ec8a958f
	.xword	0x6fd416c8f4d3e273
	.xword	0xefb9c04f8b8fdd64
	.xword	0xc22ea02c51d26b30
	.xword	0xcf5363c59f30dfe1
	.xword	0xdc2bf86cc529783c
	.xword	0x9c87637485ac1312
	.xword	0xa01056eb4dc5954f
	.xword	0x4ce0f11e8c3582de
	.xword	0x68d0bb46e216ac40
	.xword	0x932c02c1a5728cc0
	.xword	0x1b09c6d76ee1908b
	.xword	0xb1e4912807f25710



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
	.xword	0xc5c0385a1714ccdc
	.xword	0x2cab4127bd7778c2
	.xword	0xc989333f9a6c7ea5
	.xword	0x43a0337125e270ea
	.xword	0x18958cc820f9c2c6
	.xword	0x9a9442c12af8d295
	.xword	0xf83987708a1ba285
	.xword	0xe8cf464e00ce9929
	.xword	0x92d8f0a15ae5cb4e
	.xword	0x2280d7fbe5fbe1bb
	.xword	0x4c225e2b214489f2
	.xword	0x6ee0db793f4d16df
	.xword	0x9ffd1c88841fd490
	.xword	0xe23ccff2a0f9d538
	.xword	0x523ea82305eca2b7
	.xword	0xfcf9a7a7221e3495
	.xword	0xa8fd8a2e4dacb0d6
	.xword	0x3064f50df698cb89
	.xword	0x2e66cdc866c8ada4
	.xword	0x9a03e0ad0a874a82
	.xword	0xea6667dab6548258
	.xword	0x6ce026fc73cac752
	.xword	0x1e1e7103554b986b
	.xword	0xb27b0643b2e50521
	.xword	0xac54c3d5009cea2d
	.xword	0x81a851d0ed771b62
	.xword	0x2c1e7201f42e247e
	.xword	0xc057b39e0b9f47ef
	.xword	0xf91df0a6bb4920a0
	.xword	0xcda4bc6d32560d68
	.xword	0xdcbe5d7fd74359f0
	.xword	0x02437f9b37f5213c





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

.text
nuff_said_0:
	fdivd %f0, %f4, %f6
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

.text
nuff_said_1:
	fdivs %f0, %f4, %f6
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
nuff_said_2:
	fdivd %f0, %f4, %f8
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
	TTE_Size	 = 0,
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

