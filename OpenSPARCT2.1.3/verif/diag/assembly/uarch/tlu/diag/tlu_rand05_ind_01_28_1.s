/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_01_28_1.s
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
# 5 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 30 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 59 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_Tag_Overflow
#define My_HT0_Tag_Overflow \
    done;nop;

#define H_T0_Tag_Overflow
#define My_T0_Tag_Overflow \
    done;nop;

#define H_T1_Tag_Overflow_0x23
#define SUN_H_T1_Tag_Overflow_0x23 \
    done;nop;

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
# 168 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
    save %i7, %g0, %i7;  \
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc; \
    stw %l2, [%i7];\
    restore %i7, %g0, %i7; \
    retry
#define H_T0_Trap_Instruction_1
#define My_T0_Trap_Instruction_1 \
    umul %o4, 2, %o5;\
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc; \
    stw %l2, [%i7];\
    illtrap;\
    retry
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
    inc %l3;\
    inc %o3;\
    umul %o3, 2, %o4;\
    stw %o4, [%i7];\
    save %i7, %g0, %i7 ;\
    restore %i7, %g0, %i7 ;\
    done ;\
    nop; 
#define H_T0_Trap_Instruction_4
#define My_T0_Trap_Instruction_4 \
    umul %i4, 2, %l5;\
    inc %o1;\
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc; \
    retry ;\
    illtrap
#define H_T0_Trap_Instruction_5
#define My_T0_Trap_Instruction_5 \
    umul %i7, 2, %l1;\
    inc %o5;\
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc; \
    sdiv    %r2, %r10, %r0; \
    retry

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
    umul %o4, 2, %o5;\
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 4, %l2;\
    stw %l2, [%i7];\
    wrpr %l2, %tnpc; \
    restore %i7, %g0, %i7 ;;\
    retry
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
    inc %l3;\
    inc %o3;\
    umul %o3, 2, %o4;\
    inc %i3;\
    save %i7, %g0, %i7 ;\
    restore %i7, %g0, %i7 ;\
    done ;\
    nop; 
#define H_T1_Trap_Instruction_4
#define My_T1_Trap_Instruction_4 \
    umul %i4, 2, %l5;\
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    stw %l2, [%i7];\
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc; \
    retry ;\
    illtrap
#define H_T1_Trap_Instruction_5
#define My_T1_Trap_Instruction_5 \
    umul %i7, 2, %l1;\
    inc %o5;\
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc; \
    sdiv    %r2, %r10, %r0; \
    retry

#define H_HT0_Trap_Instruction_0 
#define My_HT0_Trap_Instruction_0 \
    rd %asi, %l2;\
    mov 0x80, %l3;\
    stxa %l3, [%l3] 0x57;\
    stw %l2, [%i7];\
    done;\
    nop;nop;nop

#define H_HT0_Trap_Instruction_1
#define My_HT0_Trap_Instruction_1 \
    rd %asi, %l2;\
    mov 0x80, %l3;\
    stxa %l3, [%l3] 0x5f;\
    done;\
    nop;nop;nop;nop
#define H_HT0_Trap_Instruction_2
#define My_HT0_Trap_Instruction_2 \
    umul %i6, 2, %l4;\
    stw %l4, [%i7];\
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc; \
    sdiv    %r2, %r0, %r0; \
    retry
#define H_HT0_Trap_Instruction_3
#define My_HT0_Trap_Instruction_3 \
    umul %i5, 3, %l3;\
    inc %o6;\
    illtrap ;\
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc; \
    retry
#define H_HT0_Trap_Instruction_4
#define My_HT0_Trap_Instruction_4 \
    save %i7, %g0, %i7;  \
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 4, %l2;\
    stw %l2, [%i7];\
    wrpr %l2, %tnpc; \
    restore %i7, %g0, %i7 ;\
    retry
#define H_HT0_Trap_Instruction_5
#define My_HT0_Trap_Instruction_5 \
    ba htrap_5_ext;\
    nop; retry;\
    nop; nop; nop; nop; nop

#define H_HT0_Mem_Address_Not_Aligned_0x34
#define My_HT0_Mem_Address_Not_Aligned_0x34 \
    done ;\
    nop; 
#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 \
    ba 7f; \
    rdhpr %htstate, %l3;\
    8: done; \
    7: ba 8b;\
    wrhpr %l3, 1, %htstate;nop

#define H_HT0_DAE_so_page_0x30
#define My_HT0_DAE_so_page_0x30 \
    restore %i7, %g0, %i7;\
    rd %fprs, %l2; \
    wr %l2, 0x4, %fprs ;\
    done; \
    nop;
#define H_HT0_DAE_invalid_asi_0x14
#define SUN_H_HT0_DAE_invalid_asi_0x14 \
    save %i7, %g0, %i7; \
    rd %fprs, %l2; \
    wr %l2, 0x4, %fprs ;\
    done; \
    nop;
#define H_HT0_DAE_privilege_violation_0x15
#define SUN_H_HT0_DAE_privilege_violation_0x15 \
    save %i7, %g0, %i7; \
    rd %fprs, %l2; \
    wr %l2, 0x4, %fprs ;\
    done; \
    nop;
#define H_HT0_Privileged_Action_0x37
#define My_HT0_Privileged_Action_0x37 \
    done; \
    nop; nop
#define H_HT0_Lddf_Mem_Address_Not_Aligned_0x35
#define My_HT0_Lddf_Mem_Address_Not_Aligned_0x35 \
    rdpr %tpc, %l2; \
    add %l2, 0x4, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 0x4, %l2; \
    wrpr %l2, %tnpc; \
    retry
#define H_HT0_Stdf_Mem_Address_Not_Aligned_0x36
#define My_HT0_Stdf_Mem_Address_Not_Aligned_0x36 \
    rdpr %tpc, %l2; \
    add %l2, 0x4, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 0x4, %l2; \
    wrpr %l2, %tnpc; \
    retry
#define H_HT0_Fp_exception_other_0x22
#define My_HT0_Fp_exception_other_0x22 \
    umul %i5, 4, %l2;\
    save %i7, %g0, %i7; \
    stw %l2, [%i7];\
    done; \
    nop
#define H_HT0_Division_By_Zero
#define My_HT0_Division_By_Zero \
    umul %i5, 4, %l2;\
    done; \
    nop; nop
#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero \
    inc %l6;\
    dec %l5;\
    umul %i5, 4, %l2;\
    done; \
    nop; nop
#define H_T1_Division_By_Zero_0x28
#define My_H_T1_Division_By_Zero_0x28 \
    inc %l6;\
    dec %l5;\
    umul %i5, 4, %l2;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    done; \
    nop; nop

#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero\
    inc %l6;\
    dec %l5;\
    umul %i5, 4, %l2;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    done; \
    nop; nop

#define H_T1_Fp_Exception_Other_0x22
#define My_H_T1_Fp_Exception_Other_0x22 \
    inc %l6;\
    dec %l5;\
    umul %i5, 4, %l2;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    done; \
    nop; nop
#define H_T1_Privileged_Opcode_0x11
#define SUN_H_T1_Privileged_Opcode_0x11 \
    umul %i5, 4, %l2;\
    restore %i7, %g0, %i7;\
    stw %l5, [%i7];\
    done; \
    nop;

#define H_HT0_Privileged_opcode_0x11
#define My_HT0_Privileged_opcode_0x11 \
    done;nop

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
    done;nop

#define H_T1_Fp_exception_other_0x22
#define My_T1_Fp_exception_other_0x22 \
    restore %i7, %g0, %i7 ; \
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    ldx [%l2], %l2;\
    done; 

#define H_T0_Fp_exception_other_0x22
#define My_T0_Fp_exception_other_0x22 \
    inc %l6;\
    dec %l5;\
    umul %i5, 4, %l2;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    stw %l2, [%i7];\
    done; \
    nop

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
    done; nop;
#define  H_HT0_IAE_unauth_access_0x0b
#define  SUN_H_HT0_IAE_unauth_access_0x0b \
    done; nop;

#define H_HT0_data_access_protection_0x6c
#define SUN_H_HT0_data_access_protection_0x6c   ba daccess_prot_handler; nop

#define H_HT0_PA_Watchpoint_0x61
#define My_H_HT0_PA_Watchpoint_0x61 \
    done;nop

#define H_T0_VA_Watchpoint_0x62
#define My_T0_VA_Watchpoint_0x62 \
    done; nop

#define H_T1_VA_Watchpoint_0x62
#define SUN_H_T1_VA_Watchpoint_0x62 \
    done; nop

#define H_HT0_VA_Watchpoint_0x62
#define My_H_HT0_VA_Watchpoint_0x62 \
    done; nop

#define H_T0_Instruction_VA_Watchpoint_0x75
#define SUN_H_T0_Instruction_VA_Watchpoint_0x75 \
    done;nop

#define H_T1_Instruction_VA_Watchpoint_0x75
#define SUN_H_T1_Instruction_VA_Watchpoint_0x75 \
    done;nop

#define H_HT0_Instruction_VA_Watchpoint_0x75
#define SUN_H_HT0_Instruction_VA_Watchpoint_0x75 \
    done;nop

#define H_HT0_Instruction_Breakpoint_0x76
#define SUN_H_HT0_Instruction_Breakpoint_0x76 \
    rdhpr %htstate, %g1;\
    wrhpr %g1, 0x400, %htstate;\
    retry;nop
# 696 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_Instruction_address_range_0x0d
#define SUN_H_HT0_Instruction_address_range_0x0d \
    done;nop

#define H_HT0_mem_real_range_0x2d
#define SUN_H_HT0_mem_real_range_0x2d \
    done;nop

#define H_HT0_mem_address_range_0x2e
#define SUN_H_HT0_mem_address_range_0x2e \
    done;nop

#define H_HT0_DAE_nc_page_0x16
#define SUN_H_HT0_DAE_nc_page_0x16 \
    done;nop

#define H_HT0_DAE_nfo_page_0x17
#define SUN_H_HT0_DAE_nfo_page_0x17 \
    done;nop
# 717 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_unauth_access_0x0b
#define SUN_H_HT0_IAE_unauth_access_0x0b \
    done;nop
# 722 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_nfo_page_0x0c
#define SUN_H_HT0_IAE_nfo_page_0x0c \
    done;nop
# 731 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 12 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!! START of Interrupt Handlers !!!!!!!!!!!!!!!!!

#define H_HT0_Externally_Initiated_Reset_0x03
#define SUN_H_HT0_Externally_Initiated_Reset_0x03 \
    ldxa    [%g0] ASI_LSU_CTL_REG, %g1; \
    set cregs_lsu_ctl_reg_r64, %g1; \
    stxa    %g1, [%g0] ASI_LSU_CTL_REG; \
    retry;nop

#define My_External_Reset \
    ldxa    [%g0] ASI_LSU_CTL_REG, %g5; \
    set cregs_lsu_ctl_reg_r64, %g5; \
    stxa    %g5, [%g0] ASI_LSU_CTL_REG; \
    retry;nop

!!!!! SPU Interrupt Handlers

#define H_HT0_Control_Word_Queue_Interrupt_0x3c
#define My_HT0_Control_Word_Queue_Interrupt_0x3c \
    	mov 0x20,%g1; mov 1, %g2;stxa %g2,[%g1]0x40; retry

#define H_HT0_Modular_Arithmetic_Interrupt_0x3d
#define My_H_HT0_Modular_Arithmetic_Interrupt_0x3d \
    	mov 0x80,%g1; stxa %g0,[%g1]0x40; retry
# 39 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! HW interrupt handlers

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g5 ;\
    ldxa    [%g0] ASI_SWVR_INTR_R, %g4 ;\
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g3 ;\
    cmp %g5, %g3 ;\
    nop; \
    retry;

!!!!! Queue interrupt handler
# 53 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 153 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! Hstick-match trap handler
# 156 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 201 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! SW interuupt handlers
# 204 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 694 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 262 "diag.j"
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
	mov 0xb5, %r14
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
	mov 0x31, %r14
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
	mov 0xb1, %r14
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
	mov 0xb1, %r30
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

    !# set  CWQ data
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
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_0:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00a  ! 1: CASA_R	casa	[%r31] %asi, %r10, %r12
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_7_1:
	setx 0x086c015a4d2ca0c1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 4: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd8880e60  ! 5: LDUBA_R	lduba	[%r0, %r0] 0x73, %r12
splash_cmpr_7_2:
	setx 0x27cfa410f19a6127, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 6: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8d7e010  ! 7: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r12
splash_cmpr_7_3:
	setx 0xed448433e2058774, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 8: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93a109d3  ! 9: FDIVd	fdivd	%f4, %f50, %f40
splash_lsu_7_4:
	setx 0x8353097678132c4d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d02033  ! 11: Tcc_I	tne	icc_or_xcc, %r0 + 51
debug_7_5:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 12: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1454000  ! 13: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
	.word 0xe847c000  ! 14: LDSW_R	ldsw	[%r31 + %r0], %r20
DS_7_6:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 15: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916b685c  ! 16: SDIVX_I	sdivx	%r13, 0x085c, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_8) + 0, 16, 16)) -> intp(6,0,11)
intvec_7_8:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_7_9:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 18: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_7_10:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 19: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_11:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 20: CASA_R	casa	[%r31] %asi, %r8, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01971  ! 21: FqTOd	dis not found

	.word 0xe08008a0  ! 22: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_7_13:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d950013  ! 23: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
	.word 0xe08008a0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r16
splash_hpstate_7_14:
	.word 0x81982406  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0406, %hpstate
	.word 0x9afa4003  ! 27: SDIVcc_R	sdivcc 	%r9, %r3, %r13
DS_7_15:
	.word 0x9ba489c8  ! 1: FDIVd	fdivd	%f18, %f8, %f44
	.word 0x91a409c3  ! 1: FDIVd	fdivd	%f16, %f34, %f8
	normalw
	.word 0x91458000  ! 28: RD_SOFTINT_REG	rd	%softint, %r8
splash_hpstate_7_16:
	.word 0x81982e54  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e54, %hpstate
	.word 0xa750c000  ! 30: RDPR_TT	rdpr	%tt, %r19
	.word 0x87802058  ! 31: WRASI_I	wr	%r0, 0x0058, %asi
memptr_7_17:
	set 0x60140000, %r31
	.word 0x8580ea90  ! 32: WRCCR_I	wr	%r3, 0x0a90, %ccr
tagged_7_18:
	tsubcctv %r19, 0x155d, %r19
	.word 0xd407e5ee  ! 33: LDUW_I	lduw	[%r31 + 0x05ee], %r10
cwp_7_19:
    set user_data_start, %o7
	.word 0x93902000  ! 34: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
cwp_7_20:
    set user_data_start, %o7
	.word 0x93902001  ! 35: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_21:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 36: CASA_R	casa	[%r31] %asi, %r11, %r10
	.word 0x91d020b3  ! 37: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xa1902000  ! 38: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xd477c000  ! 39: STX_R	stx	%r10, [%r31 + %r0]
memptr_7_22:
	set 0x60340000, %r31
	.word 0x858031cb  ! 40: WRCCR_I	wr	%r0, 0x11cb, %ccr
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_23:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 41: CASA_R	casa	[%r31] %asi, %r11, %r10
	.word 0x87802010  ! 42: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd437fdc5  ! 43: STH_I	sth	%r10, [%r31 + 0xfffffdc5]
pmu_7_24:
	nop
	setx 0xfffff09cfffff7e7, %g1, %g7
	.word 0xa3800007  ! 44: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd4d7e000  ! 45: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
splash_lsu_7_25:
	setx 0x54fd5ec788890d5b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 46: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_26:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 47: CASA_R	casa	[%r31] %asi, %r11, %r10
splash_cmpr_7_27:
	setx 0xff65243dadd70a89, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 48: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01968  ! 49: FqTOd	dis not found

	.word 0xd8cfe000  ! 50: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
	.word 0xd88804a0  ! 51: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0xa1902005  ! 52: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_cmpr_7_29:
	setx 0x5624314e9dcf5162, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 53: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 54: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_7_30:
	setx 0xee7666301075c5b6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 55: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01966  ! 56: FqTOd	dis not found

	.word 0x95a08dd0  ! 57: FdMULq	fdmulq	
splash_decr_7_32:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r7, [%r1] 0x45
	.word 0xa7824002  ! 58: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r2, %-
	.word 0x30700001  ! 59: BPA	<illegal instruction>
	.word 0x8790205b  ! 60: WRPR_TT_I	wrpr	%r0, 0x005b, %tt
	.word 0xa9a01a67  ! 61: FqTOi	fqtoi	
splash_cmpr_7_33:
	setx 0x8813745f5e77cfda, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01970  ! 63: FqTOd	dis not found

splash_cmpr_7_35:
	setx 0x9256f2efb2690db2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 64: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda8008a0  ! 65: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_lsu_7_36:
	setx 0x590a973fe9d6fad5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 66: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_7_37:
	setx 0x314a91212556ce0b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 67: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x97454000  ! 68: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0xd8cfe010  ! 69: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_38:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 70: RDPC	rd	%pc, %r19
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 71: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9850010  ! 72: WR_SET_SOFTINT_R	wr	%r20, %r16, %set_softint
	.word 0xa1902000  ! 73: WRPR_GL_I	wrpr	%r0, 0x0000, %-
memptr_7_39:
	set user_data_start, %r31
	.word 0x85846d60  ! 74: WRCCR_I	wr	%r17, 0x0d60, %ccr
cwp_7_40:
    set user_data_start, %o7
	.word 0x93902001  ! 75: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87902219  ! 76: WRPR_TT_I	wrpr	%r0, 0x0219, %tt
	.word 0x91d02034  ! 77: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_tba_7_41:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 78: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd2dfe030  ! 79: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r9
splash_tba_7_42:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 80: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_7_43:
	setx 0x2888c77dc772303f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 81: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802055  ! 82: WRASI_I	wr	%r0, 0x0055, %asi
change_to_randtl_7_44:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_44:
	.word 0x8f902002  ! 83: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_lsu_7_45:
	setx 0xc0f0142229971d6b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 84: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 85: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_46:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 86: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_hpstate_7_47:
	.word 0x81982f47  ! 87: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f47, %hpstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 88: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x98a8c002  ! 89: ANDNcc_R	andncc 	%r3, %r2, %r12
	.word 0xa5454000  ! 90: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
splash_cmpr_7_48:
	setx 0x1e6928ecf02adec5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 91: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_49:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f4, %f18, %f0
	.word 0x91b40306  ! 92: ALIGNADDRESS	alignaddr	%r16, %r6, %r8
tagged_7_50:
	tsubcctv %r14, 0x173a, %r5
	.word 0xe607faea  ! 93: LDUW_I	lduw	[%r31 + 0xfffffaea], %r19
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_51
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_51
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_51:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 94: RDPC	rd	%pc, %r18
tagged_7_52:
	tsubcctv %r16, 0x1075, %r3
	.word 0xd607faea  ! 95: LDUW_I	lduw	[%r31 + 0xfffffaea], %r11
	.word 0x87802014  ! 96: WRASI_I	wr	%r0, 0x0014, %asi
debug_7_53:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 97: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_7_54:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 98: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
splash_cmpr_7_55:
	setx 0x54c1adeae5a05298, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 99: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01971  ! 100: FqTOd	dis not found

splash_cmpr_7_57:
	setx 0x2f52255d05ef083f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97a00574  ! 102: FSQRTq	fsqrt	
intveclr_7_58:
	setx 0xdcda2aa988c346a7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 103: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_7_59:
	.word 0x8198208c  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x008c, %hpstate
	.word 0x8d9021ee  ! 105: WRPR_PSTATE_I	wrpr	%r0, 0x01ee, %pstate
	.word 0xe53fc000  ! 106: STDF_R	std	%f18, [%r0, %r31]
cwp_7_60:
    set user_data_start, %o7
	.word 0x93902007  ! 107: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x26700001  ! 108: BPL	<illegal instruction>
	.word 0xa1480000  ! 109: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0xdad804a0  ! 110: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0x2c700001  ! 111: BPNEG	<illegal instruction>
debug_7_61:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 112: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_7_62:
	nop
	setx 0xfffffe69fffff4ed, %g1, %g7
	.word 0xa3800007  ! 113: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xda8008a0  ! 114: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 115: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 116: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xdad00e60  ! 117: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r13
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_63
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_63:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 118: RDPC	rd	%pc, %r10
	rd %pc, %r19
	add %r19, (ivw_7_64-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_64:
	.word 0x91934006  ! 119: WRPR_PIL_R	wrpr	%r13, %r6, %pil
	.word 0xe48008a0  ! 120: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x87802004  ! 121: WRASI_I	wr	%r0, 0x0004, %asi
memptr_7_65:
	set 0x60340000, %r31
	.word 0x8582f11d  ! 122: WRCCR_I	wr	%r11, 0x111d, %ccr
cwp_7_66:
    set user_data_start, %o7
	.word 0x93902006  ! 123: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 124: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9834011  ! 125: WR_SET_SOFTINT_R	wr	%r13, %r17, %set_softint
	.word 0xa190200d  ! 126: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x9ba009c8  ! 127: FDIVd	fdivd	%f0, %f8, %f44
debug_7_67:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 128: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_7_68:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 129: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 130: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x87802088  ! 131: WRASI_I	wr	%r0, 0x0088, %asi
debug_7_69:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 132: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
DS_7_70:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc958e90f	! Random illegal ?
	.word 0xd910800d  ! 1: LDQF_R	-	[%r2, %r13], %f12
	.word 0x99a08832  ! 133: FADDs	fadds	%f2, %f18, %f12
	.word 0xd0d004a0  ! 134: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	rd %pc, %r19
	add %r19, (ivw_7_71-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_71:
	.word 0x91948010  ! 135: WRPR_PIL_R	wrpr	%r18, %r16, %pil
splash_tba_7_72:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 136: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_7_73:
	setx 0xc2a6f52f07635496, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 137: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 138: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xa7a00171  ! 139: FABSq	dis not found

	.word 0x87802014  ! 140: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa3480000  ! 141: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
debug_7_74:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 142: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd027eaa8  ! 143: STW_I	stw	%r8, [%r31 + 0x0aa8]
splash_lsu_7_75:
	setx 0xcfa7a9c767a40b47, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 144: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_76
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_76
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_76:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 145: RDPC	rd	%pc, %r8
debug_7_77:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 146: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802016  ! 147: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x879023b2  ! 148: WRPR_TT_I	wrpr	%r0, 0x03b2, %tt
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_78) + 40, 16, 16)) -> intp(3,0,25)
intvec_7_78:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 150: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_7_79:
	setx 0xedbd1a00ef3fdc5b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 151: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd6880e40  ! 152: LDUBA_R	lduba	[%r0, %r0] 0x72, %r11
mondo_7_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d924005  ! 153: WRPR_WSTATE_R	wrpr	%r9, %r5, %wstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_81:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e001  ! 154: CASA_R	casa	[%r31] %asi, %r1, %r11
DS_7_82:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 155: SAVE_R	save	%r31, %r0, %r31
	.word 0xa0808000  ! 156: ADDcc_R	addcc 	%r2, %r0, %r16
splash_cmpr_7_83:
	setx 0xc57302bdc04679da, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 157: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd86feaa8  ! 158: LDSTUB_I	ldstub	%r12, [%r31 + 0x0aa8]
splash_cmpr_7_84:
	setx 0xdd2c1075eb59ccc2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 159: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd897e010  ! 160: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_85
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_85:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 161: RDPC	rd	%pc, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r16
mondo_7_86:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d910008  ! 163: WRPR_WSTATE_R	wrpr	%r4, %r8, %wstate
	.word 0x8d9028d7  ! 164: WRPR_PSTATE_I	wrpr	%r0, 0x08d7, %pstate
	.word 0x2e700001  ! 165: BPVS	<illegal instruction>
	.word 0xe097e020  ! 166: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r16
donret_7_87:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_87-donret_7_87-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_87:
	.word 0xe0ffeaa8  ! 167: SWAPA_I	swapa	%r16, [%r31 + 0x0aa8] %asi
	.word 0x87802004  ! 168: WRASI_I	wr	%r0, 0x0004, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_88)+8, 16, 16)) -> intp(7,1,3)
xir_7_88:
	.word 0xa984378e  ! 169: WR_SET_SOFTINT_I	wr	%r16, 0x178e, %set_softint
splash_hpstate_7_89:
	.word 0x81982ede  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ede, %hpstate
DS_7_90:
	.word 0x9ba309c3  ! 1: FDIVd	fdivd	%f12, %f34, %f44
	.word 0xb9401804	! Random illegal ?
	.word 0x97a209c3  ! 1: FDIVd	fdivd	%f8, %f34, %f42
	.word 0x9ba14829  ! 171: FADDs	fadds	%f5, %f9, %f13
	.word 0xad812c12  ! 172: WR_SOFTINT_REG_I	wr	%r4, 0x0c12, %softint
	.word 0x87902238  ! 173: WRPR_TT_I	wrpr	%r0, 0x0238, %tt
splash_decr_7_91:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa7848011  ! 174: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r17, %-
donret_7_92:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_92-donret_7_92), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_92:
	.word 0xdafff1ca  ! 175: SWAPA_I	swapa	%r13, [%r31 + 0xfffff1ca] %asi
	.word 0xdac00e60  ! 176: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r13
intveclr_7_93:
	setx 0x7f2f0ebdcecf0eac, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 177: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_7_94:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d90c012  ! 178: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
DS_7_95:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 179: RESTORE_R	restore	%r31, %r0, %r31
tagged_7_96:
	tsubcctv %r4, 0x1552, %r21
	.word 0xda07f1ca  ! 180: LDUW_I	lduw	[%r31 + 0xfffff1ca], %r13
splash_tba_7_97:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 181: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_7_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 182: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xab8124a6  ! 183: WR_CLEAR_SOFTINT_I	wr	%r4, 0x04a6, %clear_softint
change_to_randtl_7_99:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_99:
	.word 0x8f902000  ! 184: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_7_100:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 185: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_7_101:
	taddcctv %r13, 0x144e, %r16
	.word 0xda07fbf7  ! 186: LDUW_I	lduw	[%r31 + 0xfffffbf7], %r13
	rd %pc, %r19
	add %r19, (ivw_7_102-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_102:
	.word 0x91900011  ! 187: WRPR_PIL_R	wrpr	%r0, %r17, %pil
	.word 0x87802020  ! 188: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8d9020d8  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x00d8, %pstate
debug_7_103:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 190: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xda97e020  ! 191: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r13
splash_lsu_7_104:
	setx 0x8b6879fd4d5c566b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 192: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_105:
	setx 0x6b3ed7aa73f7f276, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 193: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_106:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 194: CASA_R	casa	[%r31] %asi, %r20, %r13
	.word 0x87802088  ! 195: WRASI_I	wr	%r0, 0x0088, %asi
debug_7_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 196: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_7_108:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 197: SAVE_R	save	%r31, %r0, %r31
	.word 0x96fc719a  ! 198: SDIVcc_I	sdivcc 	%r17, 0xfffff19a, %r11
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 199: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90263e  ! 200: WRPR_PSTATE_I	wrpr	%r0, 0x063e, %pstate
memptr_7_109:
	set 0x60340000, %r31
	.word 0x8581e7c4  ! 201: WRCCR_I	wr	%r7, 0x07c4, %ccr
	.word 0x93a0016d  ! 202: FABSq	dis not found

splash_cmpr_7_110:
	setx 0xf941dfcb2fe1fcbf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 203: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd88008a0  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x96812a53  ! 205: ADDcc_I	addcc 	%r4, 0x0a53, %r11
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_111
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_111
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_111:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 206: RDPC	rd	%pc, %r13
	.word 0x81510000  ! 207: RDPR_TICK	<illegal instruction>
	.word 0x879020a8  ! 208: WRPR_TT_I	wrpr	%r0, 0x00a8, %tt
	.word 0x91d02032  ! 209: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe8d004a0  ! 210: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01964  ! 211: FqTOd	dis not found

DS_7_113:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x97a209cd  ! 1: FDIVd	fdivd	%f8, %f44, %f42
	normalw
	.word 0x97458000  ! 212: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xd66fe43a  ! 213: LDSTUB_I	ldstub	%r11, [%r31 + 0x043a]
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_114
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_114:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 214: RDPC	rd	%pc, %r20
intveclr_7_115:
	setx 0x969ddb2a2fc637ab, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 215: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa784ec60  ! 216: WR_GRAPHICS_STATUS_REG_I	wr	%r19, 0x0c60, %-
debug_7_116:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 217: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x966c371c  ! 218: UDIVX_I	udivx 	%r16, 0xfffff71c, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936a688f  ! 219: SDIVX_I	sdivx	%r9, 0x088f, %r9
	.word 0x36700001  ! 220: BPGE	<illegal instruction>
	.word 0xd08804a0  ! 221: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	.word 0x87802055  ! 222: WRASI_I	wr	%r0, 0x0055, %asi
splash_tba_7_118:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 223: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_7_119:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x97a409c5  ! 1: FDIVd	fdivd	%f16, %f36, %f42
	.word 0xd711000a  ! 1: LDQF_R	-	[%r4, %r10], %f11
	.word 0xa5a48820  ! 224: FADDs	fadds	%f18, %f0, %f18
mondo_7_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d928006  ! 225: WRPR_WSTATE_R	wrpr	%r10, %r6, %wstate
	.word 0xd4c804a0  ! 226: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
DS_7_121:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 227: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd497e030  ! 228: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
intveclr_7_122:
	setx 0xc05a6619cfbeb070, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 229: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_7_123:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x99a00545  ! 1: FSQRTd	fsqrt	
	.word 0x93a48822  ! 230: FADDs	fadds	%f18, %f2, %f9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_124)+16, 16, 16)) -> intp(7,1,3)
xir_7_124:
	.word 0xa9817ba8  ! 231: WR_SET_SOFTINT_I	wr	%r5, 0x1ba8, %set_softint
DS_7_125:
	.word 0xa1a089c1  ! 1: FDIVd	fdivd	%f2, %f32, %f16
	.word 0xe9328011  ! 1: STQF_R	-	%f20, [%r17, %r10]
	normalw
	.word 0x93458000  ! 232: RD_SOFTINT_REG	rd	%softint, %r9
mondo_7_126:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d910012  ! 233: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
	.word 0x87802020  ! 234: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe49004a0  ! 235: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 236: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d9020d1  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x00d1, %pstate
	.word 0xe527c000  ! 238: STF_R	st	%f18, [%r0, %r31]
mondo_7_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d948002  ! 239: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
	.word 0x9150c000  ! 240: RDPR_TT	rdpr	%tt, %r8
	.word 0xa7480000  ! 241: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_128
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_128:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 242: RDPC	rd	%pc, %r17
mondo_7_129:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d934013  ! 243: WRPR_WSTATE_R	wrpr	%r13, %r19, %wstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_130:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r19
	setx 0xf8c47aede28be4db, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_131:
	.word 0x39400001  ! 245: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_7_132:
	setx 0x71890212494bd1dc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 246: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_7_133:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 247: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_134) + 0, 16, 16)) -> intp(7,0,11)
intvec_7_134:
	.word 0x39400001  ! 248: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 249: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe6880e80  ! 250: LDUBA_R	lduba	[%r0, %r0] 0x74, %r19
splash_hpstate_7_135:
	.word 0x81982554  ! 251: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0554, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01963  ! 252: FqTOd	dis not found

	.word 0xa9a00173  ! 253: FABSq	dis not found

	.word 0xd73fc000  ! 254: STDF_R	std	%f11, [%r0, %r31]
	.word 0x8d90215e  ! 255: WRPR_PSTATE_I	wrpr	%r0, 0x015e, %pstate
	.word 0x8d902c12  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x0c12, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95693122  ! 257: SDIVX_I	sdivx	%r4, 0xfffff122, %r10
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 259: WRASI_I	wr	%r0, 0x0004, %asi
debug_7_138:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 260: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r12
debug_7_139:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 262: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab844010  ! 263: WR_CLEAR_SOFTINT_R	wr	%r17, %r16, %clear_softint
debug_7_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 264: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x879023aa  ! 265: WRPR_TT_I	wrpr	%r0, 0x03aa, %tt
DS_7_141:
	.word 0x95a4c9c0  ! 1: FDIVd	fdivd	%f50, %f0, %f10
	.word 0xbfe7c000  ! 266: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_142) + 16, 16, 16)) -> intp(6,0,13)
intvec_7_142:
	.word 0x39400001  ! 267: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196b  ! 268: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 269: LDX_R	ldx	[%r31 + %r0], %r12
memptr_7_144:
	set user_data_start, %r31
	.word 0x8584697f  ! 270: WRCCR_I	wr	%r17, 0x097f, %ccr
debug_7_145:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 271: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa9800000  ! 272: WR_SET_SOFTINT_R	wr	%r0, %r0, %set_softint
	.word 0x81510000  ! 273: RDPR_TICK	<illegal instruction>
memptr_7_146:
	set 0x60740000, %r31
	.word 0x8584f40b  ! 274: WRCCR_I	wr	%r19, 0x140b, %ccr
	.word 0xa190200f  ! 275: WRPR_GL_I	wrpr	%r0, 0x000f, %-
memptr_7_147:
	set user_data_start, %r31
	.word 0x858432ce  ! 276: WRCCR_I	wr	%r16, 0x12ce, %ccr
	.word 0x87802014  ! 277: WRASI_I	wr	%r0, 0x0014, %asi
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_148
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_148:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 278: RDPC	rd	%pc, %r12
pmu_7_149:
	nop
	setx 0xfffffe61fffff0d8, %g1, %g7
	.word 0xa3800007  ! 279: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_7_150:
	setx 0x143950b2222fff69, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 280: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a0196b  ! 281: FqTOd	dis not found

splash_cmpr_7_152:
	setx 0x6fadbc8a555cb1f6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 282: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902000  ! 283: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xd68008a0  ! 284: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
debug_7_153:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 285: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
splash_hpstate_7_154:
	.word 0x81982a07  ! 286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a07, %hpstate
splash_hpstate_7_155:
	.word 0x8198200c  ! 287: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000c, %hpstate
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_156
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_156
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_156:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 288: RDPC	rd	%pc, %r11
splash_tba_7_157:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 289: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_158
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_158
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_158:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 290: RDPC	rd	%pc, %r9
memptr_7_159:
	set user_data_start, %r31
	.word 0x85823efa  ! 291: WRCCR_I	wr	%r8, 0x1efa, %ccr
	.word 0x8d9034a6  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x14a6, %pstate
	.word 0xa5480000  ! 293: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
debug_7_160:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 294: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d903d31  ! 295: WRPR_PSTATE_I	wrpr	%r0, 0x1d31, %pstate
memptr_7_161:
	set 0x60140000, %r31
	.word 0x8580a63d  ! 296: WRCCR_I	wr	%r2, 0x063d, %ccr
	.word 0x3c700001  ! 297: BPPOS	<illegal instruction>
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_162:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 298: CASA_R	casa	[%r31] %asi, %r17, %r12
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_163
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_163:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 299: RDPC	rd	%pc, %r13
splash_cmpr_7_164:
	setx 0x7eb6987f26bb3691, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 300: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d90384e  ! 301: WRPR_PSTATE_I	wrpr	%r0, 0x184e, %pstate
debug_7_165:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 302: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_166)+48, 16, 16)) -> intp(7,1,3)
xir_7_166:
	.word 0xa980b48e  ! 303: WR_SET_SOFTINT_I	wr	%r2, 0x148e, %set_softint
splash_cmpr_7_167:
	setx 0xead20d24034f644a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 304: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 305: WRFPRS_I	wr	%r0, 0x0004, %fprs
tagged_7_168:
	tsubcctv %r26, 0x17b0, %r25
	.word 0xd807e4ae  ! 306: LDUW_I	lduw	[%r31 + 0x04ae], %r12
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_169
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_169
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_169:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 307: RDPC	rd	%pc, %r8
	.word 0xa1902004  ! 308: WRPR_GL_I	wrpr	%r0, 0x0004, %-
memptr_7_170:
	set 0x60140000, %r31
	.word 0x8582a852  ! 309: WRCCR_I	wr	%r10, 0x0852, %ccr
DS_7_171:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x91b0430b  ! 310: ALIGNADDRESS	alignaddr	%r1, %r11, %r8
	.word 0xe677e758  ! 311: STX_I	stx	%r19, [%r31 + 0x0758]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97693618  ! 312: SDIVX_I	sdivx	%r4, 0xfffff618, %r11
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 313: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_decr_7_173:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa780c008  ! 314: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r8, %-
	.word 0x99a409c4  ! 315: FDIVd	fdivd	%f16, %f4, %f12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6a637d  ! 316: SDIVX_I	sdivx	%r9, 0x037d, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x81510000  ! 318: RDPR_TICK	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0196b  ! 319: FqTOd	dis not found

DS_7_176:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 320: SAVE_R	save	%r31, %r0, %r31
	.word 0xa5a00168  ! 321: FABSq	dis not found

	.word 0x93a00161  ! 322: FABSq	dis not found

	.word 0xa190200f  ! 323: WRPR_GL_I	wrpr	%r0, 0x000f, %-
change_to_randtl_7_177:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_177:
	.word 0x8f902002  ! 324: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa1a00171  ! 325: FABSq	dis not found

	.word 0x87902397  ! 326: WRPR_TT_I	wrpr	%r0, 0x0397, %tt
	.word 0x879022c7  ! 327: WRPR_TT_I	wrpr	%r0, 0x02c7, %tt
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_178
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_178
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_178:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 328: RDPC	rd	%pc, %r17
	.word 0x919065fa  ! 329: WRPR_PIL_I	wrpr	%r1, 0x05fa, %pil
	.word 0x3e800001  ! 330: BVC	bvc,a	<label_0x1>
memptr_7_179:
	set 0x60740000, %r31
	.word 0x8584eb81  ! 331: WRCCR_I	wr	%r19, 0x0b81, %ccr
splash_cmpr_7_180:
	setx 0x89adce16e032be0a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 332: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_181:
	setx 0x68320aafcf00f259, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 333: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_182:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 334: CASA_R	casa	[%r31] %asi, %r10, %r8
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 335: CASA_R	casa	[%r31] %asi, %r10, %r8
DS_7_184:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f8, %f18, %f6
	.word 0xa5b14304  ! 336: ALIGNADDRESS	alignaddr	%r5, %r4, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 337: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xa190200e  ! 338: WRPR_GL_I	wrpr	%r0, 0x000e, %-
tagged_7_185:
	taddcctv %r22, 0x1250, %r3
	.word 0xd607e82e  ! 339: LDUW_I	lduw	[%r31 + 0x082e], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_186) + 48, 16, 16)) -> intp(4,0,3)
intvec_7_186:
	.word 0x39400001  ! 340: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe030  ! 341: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 342: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_7_187:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_187:
	.word 0x8f902001  ! 343: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd66fe82e  ! 344: LDSTUB_I	ldstub	%r11, [%r31 + 0x082e]
	.word 0x87802010  ! 345: WRASI_I	wr	%r0, 0x0010, %asi
intveclr_7_188:
	setx 0xa5c50ce4f628dbf4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 346: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_7_189:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_189:
	.word 0x8f902001  ! 347: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_lsu_7_190:
	setx 0x62c08d5008089b51, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 348: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 349: Tcc_I	ta	icc_or_xcc, %r0 + 179
debug_7_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 350: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_192) + 16, 16, 16)) -> intp(4,0,11)
intvec_7_192:
	.word 0x39400001  ! 351: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_193
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_193:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 352: RDPC	rd	%pc, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01966  ! 353: FqTOd	dis not found

change_to_randtl_7_195:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_195:
	.word 0x8f902003  ! 354: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_lsu_7_196:
	setx 0xf738301deca90c73, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 355: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 356: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
debug_7_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 357: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_198)+8, 16, 16)) -> intp(7,1,3)
xir_7_198:
	.word 0xa981f8ec  ! 358: WR_SET_SOFTINT_I	wr	%r7, 0x18ec, %set_softint
	.word 0x99902000  ! 359: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
splash_lsu_7_199:
	setx 0xcf8c349b1e7026f5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 360: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 361: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01969  ! 362: FqTOd	dis not found

cwp_7_201:
    set user_data_start, %o7
	.word 0x93902001  ! 363: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_randtl_7_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_202:
	.word 0x8f902002  ! 364: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd937e831  ! 365: STQF_I	-	%f12, [0x0831, %r31]
	.word 0x8790219f  ! 366: WRPR_TT_I	wrpr	%r0, 0x019f, %tt
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_203:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e013  ! 367: CASA_R	casa	[%r31] %asi, %r19, %r12
tagged_7_204:
	tsubcctv %r7, 0x1820, %r12
	.word 0xd807e831  ! 368: LDUW_I	lduw	[%r31 + 0x0831], %r12
	.word 0xd847c000  ! 369: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0xd81fc000  ! 370: LDD_R	ldd	[%r31 + %r0], %r12
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_205
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_205:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 371: RDPC	rd	%pc, %r11
	.word 0x8d903e3d  ! 372: WRPR_PSTATE_I	wrpr	%r0, 0x1e3d, %pstate
splash_lsu_7_206:
	setx 0x655fec84d64ba127, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 373: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 374: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8d9033a1  ! 375: WRPR_PSTATE_I	wrpr	%r0, 0x13a1, %pstate
splash_hpstate_7_207:
	.word 0x81982885  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0885, %hpstate
	rd %pc, %r19
	add %r19, (ivw_7_208-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_208:
	.word 0x9191000d  ! 377: WRPR_PIL_R	wrpr	%r4, %r13, %pil
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_209
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_209:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e003  ! 378: CASA_R	casa	[%r31] %asi, %r3, %r13
cwp_7_210:
    set user_data_start, %o7
	.word 0x93902002  ! 379: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d90334f  ! 380: WRPR_PSTATE_I	wrpr	%r0, 0x134f, %pstate
	.word 0xdac7e010  ! 381: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r13
	.word 0xdb27c000  ! 382: STF_R	st	%f13, [%r0, %r31]
change_to_randtl_7_211:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_211:
	.word 0x8f902002  ! 383: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	rd %pc, %r19
	add %r19, (ivw_7_212-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_212:
	.word 0x9194c00d  ! 384: WRPR_PIL_R	wrpr	%r19, %r13, %pil
splash_cmpr_7_213:
	setx 0x56f6db7e03799572, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 385: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdadfe000  ! 386: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
tagged_7_214:
	tsubcctv %r5, 0x1994, %r18
	.word 0xda07e831  ! 387: LDUW_I	lduw	[%r31 + 0x0831], %r13
debug_7_215:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 388: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_7_216:
	setx 0xb9ca4ca202d9863b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32800001  ! 390: BNE	bne,a	<label_0x1>
	.word 0x91d02032  ! 391: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xdadfe030  ! 392: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
	.word 0x8790214b  ! 393: WRPR_TT_I	wrpr	%r0, 0x014b, %tt
mondo_7_217:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d928000  ! 394: WRPR_WSTATE_R	wrpr	%r10, %r0, %wstate
	.word 0x87902142  ! 395: WRPR_TT_I	wrpr	%r0, 0x0142, %tt
splash_tba_7_218:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 396: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d902259  ! 397: WRPR_PSTATE_I	wrpr	%r0, 0x0259, %pstate
splash_cmpr_7_219:
	setx 0x519818f5e808763f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a149c0  ! 399: FDIVd	fdivd	%f36, %f0, %f48
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b69bd2c  ! 400: SDIVX_I	sdivx	%r6, 0xfffffd2c, %r13
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_0:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00a  ! 1: CASA_R	casa	[%r31] %asi, %r10, %r12
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 2: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_6_1:
	setx 0x44903aaccbc47e4f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 4: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xd8880e40  ! 5: LDUBA_R	lduba	[%r0, %r0] 0x72, %r12
splash_cmpr_6_2:
	setx 0x9637a8f40bd2fbd9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 6: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8d7e030  ! 7: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r12
splash_cmpr_6_3:
	setx 0xf56def6581393bf7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 8: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97a4c9d2  ! 9: FDIVd	fdivd	%f50, %f18, %f42
splash_lsu_6_4:
	setx 0x31d00d4d91776fd1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 11: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_6_5:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 12: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x95454000  ! 13: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	.word 0xe847c000  ! 14: LDSW_R	ldsw	[%r31 + %r0], %r20
DS_6_6:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 15: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56865b7  ! 16: SDIVX_I	sdivx	%r1, 0x05b7, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_8) + 40, 16, 16)) -> intp(7,0,14)
intvec_6_8:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_6_9:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 18: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_6_10:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 19: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_11:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 20: CASA_R	casa	[%r31] %asi, %r8, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01972  ! 21: FqTOd	dis not found

	.word 0xe08008a0  ! 22: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_6_13:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d90c007  ! 23: WRPR_WSTATE_R	wrpr	%r3, %r7, %wstate
	.word 0xe08008a0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r16
splash_hpstate_6_14:
	.word 0x81982285  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0285, %hpstate
	.word 0x9af9c013  ! 27: SDIVcc_R	sdivcc 	%r7, %r19, %r13
DS_6_15:
	.word 0xa7a149c9  ! 1: FDIVd	fdivd	%f36, %f40, %f50
	.word 0x99a189c7  ! 1: FDIVd	fdivd	%f6, %f38, %f12
	normalw
	.word 0x97458000  ! 28: RD_SOFTINT_REG	rd	%softint, %r11
splash_hpstate_6_16:
	.word 0x819828cf  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cf, %hpstate
	.word 0x9350c000  ! 30: RDPR_TT	<illegal instruction>
	.word 0x87802089  ! 31: WRASI_I	wr	%r0, 0x0089, %asi
memptr_6_17:
	set 0x60140000, %r31
	.word 0x858269fa  ! 32: WRCCR_I	wr	%r9, 0x09fa, %ccr
tagged_6_18:
	tsubcctv %r23, 0x1fea, %r11
	.word 0xd407e5ee  ! 33: LDUW_I	lduw	[%r31 + 0x05ee], %r10
cwp_6_19:
    set user_data_start, %o7
	.word 0x93902005  ! 34: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
cwp_6_20:
    set user_data_start, %o7
	.word 0x93902005  ! 35: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_21:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 36: CASA_R	casa	[%r31] %asi, %r11, %r10
	.word 0x91d020b4  ! 37: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xa1902002  ! 38: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd477c000  ! 39: STX_R	stx	%r10, [%r31 + %r0]
memptr_6_22:
	set 0x60140000, %r31
	.word 0x85853e1a  ! 40: WRCCR_I	wr	%r20, 0x1e1a, %ccr
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_23:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 41: CASA_R	casa	[%r31] %asi, %r11, %r10
	.word 0x87802088  ! 42: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd437fdc5  ! 43: STH_I	sth	%r10, [%r31 + 0xfffffdc5]
pmu_6_24:
	nop
	setx 0xffffff61fffff782, %g1, %g7
	.word 0xa3800007  ! 44: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd4d7e020  ! 45: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r10
splash_lsu_6_25:
	setx 0xb878e172c01ff861, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 46: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_26:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 47: CASA_R	casa	[%r31] %asi, %r11, %r10
splash_cmpr_6_27:
	setx 0xc581124005ab5ffd, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 48: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a0196d  ! 49: FqTOd	dis not found

	.word 0xd8cfe030  ! 50: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r12
	.word 0xd88804a0  ! 51: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0xa1902007  ! 52: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_cmpr_6_29:
	setx 0x5fd77435071453c2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 53: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 54: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_6_30:
	setx 0x0a658827d70a0cfd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 55: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01960  ! 56: FqTOd	dis not found

	.word 0x93a44dc4  ! 57: FdMULq	fdmulq	
	.word 0xa7844006  ! 58: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r6, %-
	.word 0x30700001  ! 59: BPA	<illegal instruction>
	.word 0x87902328  ! 60: WRPR_TT_I	wrpr	%r0, 0x0328, %tt
	.word 0x99a01a6b  ! 61: FqTOi	fqtoi	
splash_cmpr_6_33:
	setx 0xa69ee52e11bbbea3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01960  ! 63: FqTOd	dis not found

splash_cmpr_6_35:
	setx 0xd294d3f7f1d163ca, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 64: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda800a80  ! 65: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r13
splash_lsu_6_36:
	setx 0xfc99c3bbf33090db, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 66: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_6_37:
	setx 0x040a5f957479286f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 67: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9454000  ! 68: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0xd8cfe030  ! 69: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_38:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 70: RDPC	rd	%pc, %r20
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 71: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9830007  ! 72: WR_SET_SOFTINT_R	wr	%r12, %r7, %set_softint
	.word 0xa1902008  ! 73: WRPR_GL_I	wrpr	%r0, 0x0008, %-
memptr_6_39:
	set user_data_start, %r31
	.word 0x85817905  ! 74: WRCCR_I	wr	%r5, 0x1905, %ccr
cwp_6_40:
    set user_data_start, %o7
	.word 0x93902002  ! 75: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x879021a5  ! 76: WRPR_TT_I	wrpr	%r0, 0x01a5, %tt
	.word 0x91d02032  ! 77: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_tba_6_41:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 78: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd2dfe020  ! 79: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r9
splash_tba_6_42:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 80: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_6_43:
	setx 0x2449d4eb6d2604f6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 81: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802004  ! 82: WRASI_I	wr	%r0, 0x0004, %asi
change_to_randtl_6_44:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_44:
	.word 0x8f902001  ! 83: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_lsu_6_45:
	setx 0x89566cf439741a07, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 84: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd2800b80  ! 85: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r9
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_46:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 86: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_hpstate_6_47:
	.word 0x81982b0f  ! 87: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0f, %hpstate
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 88: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa4a88010  ! 89: ANDNcc_R	andncc 	%r2, %r16, %r18
	.word 0x99454000  ! 90: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
splash_cmpr_6_48:
	setx 0x204400a2afe01741, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 91: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_49:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f16, %f24, %f30
	.word 0xa9b34313  ! 92: ALIGNADDRESS	alignaddr	%r13, %r19, %r20
tagged_6_50:
	tsubcctv %r4, 0x1566, %r23
	.word 0xe607faea  ! 93: LDUW_I	lduw	[%r31 + 0xfffffaea], %r19
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_51
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_51
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_51:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 94: RDPC	rd	%pc, %r13
tagged_6_52:
	tsubcctv %r12, 0x1ba6, %r10
	.word 0xd607faea  ! 95: LDUW_I	lduw	[%r31 + 0xfffffaea], %r11
	.word 0x87802080  ! 96: WRASI_I	wr	%r0, 0x0080, %asi
debug_6_53:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 97: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_6_54:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 98: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
splash_cmpr_6_55:
	setx 0x59a8e8f2b34a48a6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 99: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01966  ! 100: FqTOd	dis not found

splash_cmpr_6_57:
	setx 0xf3241814b27535fe, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95a00568  ! 102: FSQRTq	fsqrt	
intveclr_6_58:
	setx 0x1e5f00250e29dfe4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 103: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_6_59:
	.word 0x81982f5e  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5e, %hpstate
	.word 0x8d902f55  ! 105: WRPR_PSTATE_I	wrpr	%r0, 0x0f55, %pstate
	.word 0xe53fc000  ! 106: STDF_R	std	%f18, [%r0, %r31]
cwp_6_60:
    set user_data_start, %o7
	.word 0x93902004  ! 107: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x26700001  ! 108: BPL	<illegal instruction>
	.word 0x9b480000  ! 109: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0xdad80e60  ! 110: LDXA_R	ldxa	[%r0, %r0] 0x73, %r13
	.word 0x2c700001  ! 111: BPNEG	<illegal instruction>
debug_6_61:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 112: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_6_62:
	nop
	setx 0xfffff8e2fffff1bd, %g1, %g7
	.word 0xa3800007  ! 113: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xda800be0  ! 114: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r13
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 115: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 116: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xdad00e80  ! 117: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r13
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_63
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_63:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 118: RDPC	rd	%pc, %r12
	rd %pc, %r19
	add %r19, (ivw_6_64-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_64:
	.word 0x9191c007  ! 119: WRPR_PIL_R	wrpr	%r7, %r7, %pil
	.word 0xe4800b00  ! 120: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r18
	.word 0x87802010  ! 121: WRASI_I	wr	%r0, 0x0010, %asi
memptr_6_65:
	set 0x60140000, %r31
	.word 0x858326ad  ! 122: WRCCR_I	wr	%r12, 0x06ad, %ccr
cwp_6_66:
    set user_data_start, %o7
	.word 0x93902007  ! 123: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 124: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9840007  ! 125: WR_SET_SOFTINT_R	wr	%r16, %r7, %set_softint
	.word 0xa190200d  ! 126: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa7a2c9cb  ! 127: FDIVd	fdivd	%f42, %f42, %f50
debug_6_67:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 128: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_6_68:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 129: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 130: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x8780208b  ! 131: WRASI_I	wr	%r0, 0x008b, %asi
debug_6_69:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 132: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
DS_6_70:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x9b42afbd	! Random illegal ?
	.word 0xd114c009  ! 1: LDQF_R	-	[%r19, %r9], %f8
	.word 0x95a04820  ! 133: FADDs	fadds	%f1, %f0, %f10
	.word 0xd0d004a0  ! 134: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	rd %pc, %r19
	add %r19, (ivw_6_71-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_71:
	.word 0x91944014  ! 135: WRPR_PIL_R	wrpr	%r17, %r20, %pil
splash_tba_6_72:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 136: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_6_73:
	setx 0xacdd9afc7574299e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 137: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 138: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x95a00160  ! 139: FABSq	dis not found

	.word 0x87802055  ! 140: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x97480000  ! 141: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
debug_6_74:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 142: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd027eaa8  ! 143: STW_I	stw	%r8, [%r31 + 0x0aa8]
splash_lsu_6_75:
	setx 0x25e6e2cef3fb0e51, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 144: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_76
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_76
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_76:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 145: RDPC	rd	%pc, %r10
debug_6_77:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 146: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802083  ! 147: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0x8790201a  ! 148: WRPR_TT_I	wrpr	%r0, 0x001a, %tt
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_78) + 48, 16, 16)) -> intp(0,0,3)
intvec_6_78:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 150: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_6_79:
	setx 0xae282dce08f1450a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 151: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd68804a0  ! 152: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
mondo_6_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d950007  ! 153: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_81:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e001  ! 154: CASA_R	casa	[%r31] %asi, %r1, %r11
DS_6_82:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 155: SAVE_R	save	%r31, %r0, %r31
	.word 0x9a810006  ! 156: ADDcc_R	addcc 	%r4, %r6, %r13
splash_cmpr_6_83:
	setx 0x6648b564f0fae210, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 157: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd86feaa8  ! 158: LDSTUB_I	ldstub	%r12, [%r31 + 0x0aa8]
splash_cmpr_6_84:
	setx 0xe12ca16a6cbc941f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 159: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd897e010  ! 160: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_85
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_85:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 161: RDPC	rd	%pc, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r16
mondo_6_86:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d920011  ! 163: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
	.word 0x8d903626  ! 164: WRPR_PSTATE_I	wrpr	%r0, 0x1626, %pstate
	.word 0x2e700001  ! 165: BPVS	<illegal instruction>
	.word 0xe097e020  ! 166: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r16
donret_6_87:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_87-donret_6_87-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_87:
	.word 0xe0ffeaa8  ! 167: SWAPA_I	swapa	%r16, [%r31 + 0x0aa8] %asi
	.word 0x87802010  ! 168: WRASI_I	wr	%r0, 0x0010, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_88)+48, 16, 16)) -> intp(6,1,3)
xir_6_88:
	.word 0xa98032c4  ! 169: WR_SET_SOFTINT_I	wr	%r0, 0x12c4, %set_softint
splash_hpstate_6_89:
	.word 0x8198259c  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059c, %hpstate
DS_6_90:
	.word 0xa9a089d4  ! 1: FDIVd	fdivd	%f2, %f20, %f20
	.word 0xdf7d3f46	! Random illegal ?
	.word 0x93a349d0  ! 1: FDIVd	fdivd	%f44, %f16, %f40
	.word 0xa7a5082d  ! 171: FADDs	fadds	%f20, %f13, %f19
	.word 0xad846d5a  ! 172: WR_SOFTINT_REG_I	wr	%r17, 0x0d5a, %softint
	.word 0x879023d3  ! 173: WRPR_TT_I	wrpr	%r0, 0x03d3, %tt
	.word 0xa781000c  ! 174: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r12, %-
donret_6_92:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_92-donret_6_92), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_92:
	.word 0xdafff1ca  ! 175: SWAPA_I	swapa	%r13, [%r31 + 0xfffff1ca] %asi
	.word 0xdac004a0  ! 176: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
intveclr_6_93:
	setx 0xc48f6ee9e848db58, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 177: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_6_94:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d948014  ! 178: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
DS_6_95:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 179: RESTORE_R	restore	%r31, %r0, %r31
tagged_6_96:
	tsubcctv %r26, 0x1abc, %r21
	.word 0xda07f1ca  ! 180: LDUW_I	lduw	[%r31 + 0xfffff1ca], %r13
splash_tba_6_97:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 181: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_6_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 182: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xab82fdfc  ! 183: WR_CLEAR_SOFTINT_I	wr	%r11, 0x1dfc, %clear_softint
change_to_randtl_6_99:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_99:
	.word 0x8f902002  ! 184: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_6_100:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 185: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_6_101:
	taddcctv %r1, 0x13da, %r13
	.word 0xda07fbf7  ! 186: LDUW_I	lduw	[%r31 + 0xfffffbf7], %r13
	rd %pc, %r19
	add %r19, (ivw_6_102-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_102:
	.word 0x9194c001  ! 187: WRPR_PIL_R	wrpr	%r19, %r1, %pil
	.word 0x87802055  ! 188: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x8d902d3a  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x0d3a, %pstate
debug_6_103:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 190: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xda97e020  ! 191: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r13
splash_lsu_6_104:
	setx 0x3f015114f88f1441, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 192: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_105:
	setx 0xb4d1beaedd3c411d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 193: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_106:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 194: CASA_R	casa	[%r31] %asi, %r20, %r13
	.word 0x87802016  ! 195: WRASI_I	wr	%r0, 0x0016, %asi
debug_6_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 196: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_6_108:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 197: SAVE_R	save	%r31, %r0, %r31
	.word 0xa2fd285e  ! 198: SDIVcc_I	sdivcc 	%r20, 0x085e, %r17
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 199: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903e22  ! 200: WRPR_PSTATE_I	wrpr	%r0, 0x1e22, %pstate
memptr_6_109:
	set 0x60140000, %r31
	.word 0x8580e57b  ! 201: WRCCR_I	wr	%r3, 0x057b, %ccr
	.word 0x9ba00168  ! 202: FABSq	dis not found

splash_cmpr_6_110:
	setx 0xd2c6b4f14749669b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 203: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd88008a0  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xa08336d5  ! 205: ADDcc_I	addcc 	%r12, 0xfffff6d5, %r16
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_111
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_111
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_111:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 206: RDPC	rd	%pc, %r11
	.word 0x81510000  ! 207: RDPR_TICK	<illegal instruction>
	.word 0x87902206  ! 208: WRPR_TT_I	wrpr	%r0, 0x0206, %tt
	.word 0x91d020b3  ! 209: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xe8d00e40  ! 210: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01967  ! 211: FqTOd	dis not found

DS_6_113:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x97a009c4  ! 1: FDIVd	fdivd	%f0, %f4, %f42
	normalw
	.word 0x95458000  ! 212: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xd66fe43a  ! 213: LDSTUB_I	ldstub	%r11, [%r31 + 0x043a]
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_114
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_114:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 214: RDPC	rd	%pc, %r9
intveclr_6_115:
	setx 0x4aabfa4e7f840a4e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 215: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7842e2a  ! 216: WR_GRAPHICS_STATUS_REG_I	wr	%r16, 0x0e2a, %-
debug_6_116:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 217: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x986ca3eb  ! 218: UDIVX_I	udivx 	%r18, 0x03eb, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6ca377  ! 219: SDIVX_I	sdivx	%r18, 0x0377, %r13
	.word 0x36700001  ! 220: BPGE	<illegal instruction>
	.word 0xd08804a0  ! 221: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	.word 0x87802020  ! 222: WRASI_I	wr	%r0, 0x0020, %asi
splash_tba_6_118:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 223: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_6_119:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x91a489c4  ! 1: FDIVd	fdivd	%f18, %f4, %f8
	.word 0xd3148010  ! 1: LDQF_R	-	[%r18, %r16], %f9
	.word 0xa3a40820  ! 224: FADDs	fadds	%f16, %f0, %f17
mondo_6_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d944010  ! 225: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0xd4c804a0  ! 226: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
DS_6_121:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 227: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd497e020  ! 228: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
intveclr_6_122:
	setx 0x6b7c45fcb0f89547, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 229: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_6_123:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9ba0054c  ! 1: FSQRTd	fsqrt	
	.word 0x9ba48824  ! 230: FADDs	fadds	%f18, %f4, %f13
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_124)+8, 16, 16)) -> intp(6,1,3)
xir_6_124:
	.word 0xa984e8a7  ! 231: WR_SET_SOFTINT_I	wr	%r19, 0x08a7, %set_softint
DS_6_125:
	.word 0x99a0c9d0  ! 1: FDIVd	fdivd	%f34, %f16, %f12
	.word 0xd532c005  ! 1: STQF_R	-	%f10, [%r5, %r11]
	normalw
	.word 0xa7458000  ! 232: RD_SOFTINT_REG	rd	%softint, %r19
mondo_6_126:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d920011  ! 233: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
	.word 0x87802089  ! 234: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xe49004a0  ! 235: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 236: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d90365c  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x165c, %pstate
	.word 0xe527c000  ! 238: STF_R	st	%f18, [%r0, %r31]
mondo_6_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d904005  ! 239: WRPR_WSTATE_R	wrpr	%r1, %r5, %wstate
	.word 0xa950c000  ! 240: RDPR_TT	rdpr	%tt, %r20
	.word 0x97480000  ! 241: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_128
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_128:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 242: RDPC	rd	%pc, %r13
mondo_6_129:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d904014  ! 243: WRPR_WSTATE_R	wrpr	%r1, %r20, %wstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_130:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r19
	setx 0x0a8afbbb5e073372, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_131:
	.word 0x39400001  ! 245: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_6_132:
	setx 0x3f711d830a79c2ea, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 246: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_6_133:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 247: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_134) + 24, 16, 16)) -> intp(3,0,14)
intvec_6_134:
	.word 0x39400001  ! 248: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 249: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe68804a0  ! 250: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
splash_hpstate_6_135:
	.word 0x8198236e  ! 251: WRHPR_HPSTATE_I	wrhpr	%r0, 0x036e, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01967  ! 252: FqTOd	dis not found

	.word 0x9ba00173  ! 253: FABSq	dis not found

	.word 0xd73fc000  ! 254: STDF_R	std	%f11, [%r0, %r31]
	.word 0x8d90368f  ! 255: WRPR_PSTATE_I	wrpr	%r0, 0x168f, %pstate
	.word 0x8d9023a5  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x03a5, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9969e891  ! 257: SDIVX_I	sdivx	%r7, 0x0891, %r12
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 259: WRASI_I	wr	%r0, 0x0004, %asi
debug_6_138:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 260: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r12
debug_6_139:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 262: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab814012  ! 263: WR_CLEAR_SOFTINT_R	wr	%r5, %r18, %clear_softint
debug_6_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 264: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x879022a7  ! 265: WRPR_TT_I	wrpr	%r0, 0x02a7, %tt
DS_6_141:
	.word 0xa7a2c9cc  ! 1: FDIVd	fdivd	%f42, %f12, %f50
	.word 0xbfe7c000  ! 266: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_142) + 32, 16, 16)) -> intp(0,0,7)
intvec_6_142:
	.word 0x39400001  ! 267: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01964  ! 268: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 269: LDX_R	ldx	[%r31 + %r0], %r12
memptr_6_144:
	set user_data_start, %r31
	.word 0x8584b642  ! 270: WRCCR_I	wr	%r18, 0x1642, %ccr
debug_6_145:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 271: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa982c001  ! 272: WR_SET_SOFTINT_R	wr	%r11, %r1, %set_softint
	.word 0x81510000  ! 273: RDPR_TICK	<illegal instruction>
memptr_6_146:
	set 0x60540000, %r31
	.word 0x8582b1a5  ! 274: WRCCR_I	wr	%r10, 0x11a5, %ccr
	.word 0xa190200e  ! 275: WRPR_GL_I	wrpr	%r0, 0x000e, %-
memptr_6_147:
	set user_data_start, %r31
	.word 0x8580a8ca  ! 276: WRCCR_I	wr	%r2, 0x08ca, %ccr
	.word 0x87802088  ! 277: WRASI_I	wr	%r0, 0x0088, %asi
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_148
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_148:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 278: RDPC	rd	%pc, %r12
pmu_6_149:
	nop
	setx 0xfffffd8fffffffd9, %g1, %g7
	.word 0xa3800007  ! 279: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_6_150:
	setx 0x0036152d7dbc852f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 280: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01964  ! 281: FqTOd	dis not found

splash_cmpr_6_152:
	setx 0xd8892ff0fe2722a4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 282: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902005  ! 283: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xd68008a0  ! 284: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
debug_6_153:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 285: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
splash_hpstate_6_154:
	.word 0x81982844  ! 286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0844, %hpstate
splash_hpstate_6_155:
	.word 0x81982884  ! 287: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0884, %hpstate
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_156
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_156
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_156:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 288: RDPC	rd	%pc, %r8
splash_tba_6_157:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 289: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_158
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_158
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_158:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 290: RDPC	rd	%pc, %r8
memptr_6_159:
	set user_data_start, %r31
	.word 0x8582fde8  ! 291: WRCCR_I	wr	%r11, 0x1de8, %ccr
	.word 0x8d903e4a  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x1e4a, %pstate
	.word 0xa5480000  ! 293: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
debug_6_160:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 294: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d90391c  ! 295: WRPR_PSTATE_I	wrpr	%r0, 0x191c, %pstate
memptr_6_161:
	set 0x60140000, %r31
	.word 0x85813d0d  ! 296: WRCCR_I	wr	%r4, 0x1d0d, %ccr
	.word 0x3c700001  ! 297: BPPOS	<illegal instruction>
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_162:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 298: CASA_R	casa	[%r31] %asi, %r17, %r12
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_163
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_163:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 299: RDPC	rd	%pc, %r10
splash_cmpr_6_164:
	setx 0xf130321498bd4f55, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 300: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903e29  ! 301: WRPR_PSTATE_I	wrpr	%r0, 0x1e29, %pstate
debug_6_165:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 302: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_166)+8, 16, 16)) -> intp(6,1,3)
xir_6_166:
	.word 0xa9843087  ! 303: WR_SET_SOFTINT_I	wr	%r16, 0x1087, %set_softint
splash_cmpr_6_167:
	setx 0xf3b534a9ee444ab7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 304: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 305: WRFPRS_I	wr	%r0, 0x0004, %fprs
tagged_6_168:
	tsubcctv %r9, 0x1825, %r21
	.word 0xd807e4ae  ! 306: LDUW_I	lduw	[%r31 + 0x04ae], %r12
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_169
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_169
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_169:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 307: RDPC	rd	%pc, %r10
	.word 0xa1902009  ! 308: WRPR_GL_I	wrpr	%r0, 0x0009, %-
memptr_6_170:
	set 0x60340000, %r31
	.word 0x85813ca2  ! 309: WRCCR_I	wr	%r4, 0x1ca2, %ccr
DS_6_171:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa1b4c30b  ! 310: ALIGNADDRESS	alignaddr	%r19, %r11, %r16
	.word 0xe677e758  ! 311: STX_I	stx	%r19, [%r31 + 0x0758]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9968e42f  ! 312: SDIVX_I	sdivx	%r3, 0x042f, %r12
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 313: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa782800c  ! 314: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r12, %-
	.word 0xa7a109c0  ! 315: FDIVd	fdivd	%f4, %f0, %f50
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9769a2b8  ! 316: SDIVX_I	sdivx	%r6, 0x02b8, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x81510000  ! 318: RDPR_TICK	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01967  ! 319: FqTOd	dis not found

DS_6_176:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 320: SAVE_R	save	%r31, %r0, %r31
	.word 0x93a00171  ! 321: FABSq	dis not found

	.word 0xa1a0016d  ! 322: FABSq	dis not found

	.word 0xa1902001  ! 323: WRPR_GL_I	wrpr	%r0, 0x0001, %-
change_to_randtl_6_177:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_177:
	.word 0x8f902003  ! 324: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x9ba00170  ! 325: FABSq	dis not found

	.word 0x87902068  ! 326: WRPR_TT_I	wrpr	%r0, 0x0068, %tt
	.word 0x8790220f  ! 327: WRPR_TT_I	wrpr	%r0, 0x020f, %tt
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_178
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_178
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_178:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 328: RDPC	rd	%pc, %r16
	.word 0x91912a72  ! 329: WRPR_PIL_I	wrpr	%r4, 0x0a72, %pil
	.word 0x3e800001  ! 330: BVC	bvc,a	<label_0x1>
memptr_6_179:
	set 0x60740000, %r31
	.word 0x85807d36  ! 331: WRCCR_I	wr	%r1, 0x1d36, %ccr
splash_cmpr_6_180:
	setx 0x2c15531e45d22637, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 332: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_181:
	setx 0xc545b4d67288fd64, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 333: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_182:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 334: CASA_R	casa	[%r31] %asi, %r10, %r8
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 335: CASA_R	casa	[%r31] %asi, %r10, %r8
DS_6_184:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f26, %f18, %f22
	.word 0x95b04312  ! 336: ALIGNADDRESS	alignaddr	%r1, %r18, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 337: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xa190200a  ! 338: WRPR_GL_I	wrpr	%r0, 0x000a, %-
tagged_6_185:
	taddcctv %r9, 0x1f1e, %r9
	.word 0xd607e82e  ! 339: LDUW_I	lduw	[%r31 + 0x082e], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_186) + 16, 16, 16)) -> intp(2,0,21)
intvec_6_186:
	.word 0x39400001  ! 340: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe000  ! 341: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 342: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_6_187:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_187:
	.word 0x8f902001  ! 343: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd66fe82e  ! 344: LDSTUB_I	ldstub	%r11, [%r31 + 0x082e]
	.word 0x87802004  ! 345: WRASI_I	wr	%r0, 0x0004, %asi
intveclr_6_188:
	setx 0x00c9e4a9cc063db0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 346: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_6_189:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_189:
	.word 0x8f902003  ! 347: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_lsu_6_190:
	setx 0x5bac3745cf640f9b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 348: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 349: Tcc_I	ta	icc_or_xcc, %r0 + 52
debug_6_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 350: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_192) + 0, 16, 16)) -> intp(6,0,19)
intvec_6_192:
	.word 0x39400001  ! 351: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_193
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_193:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 352: RDPC	rd	%pc, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01973  ! 353: FqTOd	dis not found

change_to_randtl_6_195:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_195:
	.word 0x8f902002  ! 354: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_lsu_6_196:
	setx 0x85f519fc0648ed4d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 355: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 356: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
debug_6_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 357: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_198)+24, 16, 16)) -> intp(6,1,3)
xir_6_198:
	.word 0xa984e63f  ! 358: WR_SET_SOFTINT_I	wr	%r19, 0x063f, %set_softint
	.word 0x99902003  ! 359: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
splash_lsu_6_199:
	setx 0x4b63d70b0b58ebbf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 360: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 361: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01960  ! 362: FqTOd	dis not found

cwp_6_201:
    set user_data_start, %o7
	.word 0x93902001  ! 363: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_randtl_6_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_202:
	.word 0x8f902000  ! 364: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd937e831  ! 365: STQF_I	-	%f12, [0x0831, %r31]
	.word 0x879023c6  ! 366: WRPR_TT_I	wrpr	%r0, 0x03c6, %tt
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_203:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e013  ! 367: CASA_R	casa	[%r31] %asi, %r19, %r12
tagged_6_204:
	tsubcctv %r9, 0x1229, %r14
	.word 0xd807e831  ! 368: LDUW_I	lduw	[%r31 + 0x0831], %r12
	.word 0xd847c000  ! 369: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0xd81fc000  ! 370: LDD_R	ldd	[%r31 + %r0], %r12
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_205
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_205:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 371: RDPC	rd	%pc, %r8
	.word 0x8d902687  ! 372: WRPR_PSTATE_I	wrpr	%r0, 0x0687, %pstate
splash_lsu_6_206:
	setx 0xb93d239b95552e99, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 373: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 374: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8d903fd6  ! 375: WRPR_PSTATE_I	wrpr	%r0, 0x1fd6, %pstate
splash_hpstate_6_207:
	.word 0x81982bee  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bee, %hpstate
	rd %pc, %r19
	add %r19, (ivw_6_208-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_208:
	.word 0x91908014  ! 377: WRPR_PIL_R	wrpr	%r2, %r20, %pil
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_209
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_209:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e003  ! 378: CASA_R	casa	[%r31] %asi, %r3, %r13
cwp_6_210:
    set user_data_start, %o7
	.word 0x93902007  ! 379: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902c97  ! 380: WRPR_PSTATE_I	wrpr	%r0, 0x0c97, %pstate
	.word 0xdac7e020  ! 381: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r13
	.word 0xdb27c000  ! 382: STF_R	st	%f13, [%r0, %r31]
change_to_randtl_6_211:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_211:
	.word 0x8f902000  ! 383: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	rd %pc, %r19
	add %r19, (ivw_6_212-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_212:
	.word 0x9192000c  ! 384: WRPR_PIL_R	wrpr	%r8, %r12, %pil
splash_cmpr_6_213:
	setx 0xe1c528ca245563d2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 385: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdadfe020  ! 386: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r13
tagged_6_214:
	tsubcctv %r5, 0x1147, %r10
	.word 0xda07e831  ! 387: LDUW_I	lduw	[%r31 + 0x0831], %r13
debug_6_215:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 388: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_6_216:
	setx 0xc61cddaeeaf641b6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32800001  ! 390: BNE	bne,a	<label_0x1>
	.word 0x93d020b4  ! 391: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0xdadfe010  ! 392: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0x87902094  ! 393: WRPR_TT_I	wrpr	%r0, 0x0094, %tt
mondo_6_217:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d92400b  ! 394: WRPR_WSTATE_R	wrpr	%r9, %r11, %wstate
	.word 0x87902382  ! 395: WRPR_TT_I	wrpr	%r0, 0x0382, %tt
splash_tba_6_218:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 396: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d9023ef  ! 397: WRPR_PSTATE_I	wrpr	%r0, 0x03ef, %pstate
splash_cmpr_6_219:
	setx 0x4cff7af9f332aa4a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a0c9c4  ! 399: FDIVd	fdivd	%f34, %f4, %f48
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa168bc98  ! 400: SDIVX_I	sdivx	%r2, 0xfffffc98, %r16
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_0:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00a  ! 1: CASA_R	casa	[%r31] %asi, %r10, %r12
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_5_1:
	setx 0xa74d6f82cccab439, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902001  ! 4: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xd88804a0  ! 5: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
splash_cmpr_5_2:
	setx 0x6a5e3365c3c7343e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 6: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8d7e000  ! 7: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
splash_cmpr_5_3:
	setx 0x6fdb3189c8909253, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 8: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95a249d2  ! 9: FDIVd	fdivd	%f40, %f18, %f10
splash_lsu_5_4:
	setx 0xe1bbb963c14fcfcd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 11: Tcc_I	ta	icc_or_xcc, %r0 + 52
debug_5_5:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 12: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93454000  ! 13: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0xe847c000  ! 14: LDSW_R	ldsw	[%r31 + %r0], %r20
DS_5_6:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 15: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56c78a1  ! 16: SDIVX_I	sdivx	%r17, 0xfffff8a1, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_8) + 0, 16, 16)) -> intp(1,0,7)
intvec_5_8:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_5_9:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 18: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_5_10:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 19: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_11:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 20: CASA_R	casa	[%r31] %asi, %r8, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01973  ! 21: FqTOd	dis not found

	.word 0xe08008a0  ! 22: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_5_13:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d930010  ! 23: WRPR_WSTATE_R	wrpr	%r12, %r16, %wstate
	.word 0xe08008a0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r16
splash_hpstate_5_14:
	.word 0x81982f9e  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9e, %hpstate
	.word 0x96f98004  ! 27: SDIVcc_R	sdivcc 	%r6, %r4, %r11
DS_5_15:
	.word 0x97a0c9c4  ! 1: FDIVd	fdivd	%f34, %f4, %f42
	.word 0xa1a249c4  ! 1: FDIVd	fdivd	%f40, %f4, %f16
	normalw
	.word 0x99458000  ! 28: RD_SOFTINT_REG	rd	%softint, %r12
splash_hpstate_5_16:
	.word 0x81982f44  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f44, %hpstate
	.word 0x9150c000  ! 30: RDPR_TT	<illegal instruction>
	.word 0x87802055  ! 31: WRASI_I	wr	%r0, 0x0055, %asi
memptr_5_17:
	set 0x60740000, %r31
	.word 0x85827bd2  ! 32: WRCCR_I	wr	%r9, 0x1bd2, %ccr
tagged_5_18:
	tsubcctv %r18, 0x1ebd, %r6
	.word 0xd407e5ee  ! 33: LDUW_I	lduw	[%r31 + 0x05ee], %r10
cwp_5_19:
    set user_data_start, %o7
	.word 0x93902001  ! 34: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
cwp_5_20:
    set user_data_start, %o7
	.word 0x93902004  ! 35: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_21:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 36: CASA_R	casa	[%r31] %asi, %r11, %r10
	.word 0x93d020b2  ! 37: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0xa1902003  ! 38: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd477c000  ! 39: STX_R	stx	%r10, [%r31 + %r0]
memptr_5_22:
	set 0x60140000, %r31
	.word 0x8581f971  ! 40: WRCCR_I	wr	%r7, 0x1971, %ccr
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_23:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 41: CASA_R	casa	[%r31] %asi, %r11, %r10
	.word 0x87802089  ! 42: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd437fdc5  ! 43: STH_I	sth	%r10, [%r31 + 0xfffffdc5]
pmu_5_24:
	nop
	setx 0xfffffe4efffff048, %g1, %g7
	.word 0xa3800007  ! 44: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd4d7e020  ! 45: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r10
splash_lsu_5_25:
	setx 0x270caddf3be3e42d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 46: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_26:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 47: CASA_R	casa	[%r31] %asi, %r11, %r10
splash_cmpr_5_27:
	setx 0x271f87e6a2363ab5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 48: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a0196d  ! 49: FqTOd	dis not found

	.word 0xd8cfe010  ! 50: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r12
	.word 0xd88804a0  ! 51: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0xa1902006  ! 52: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_cmpr_5_29:
	setx 0x4a10a4020187e156, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 53: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 54: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_5_30:
	setx 0xd0c428b653704699, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 55: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01967  ! 56: FqTOd	dis not found

	.word 0xa5a10dc8  ! 57: FdMULq	fdmulq	
splash_decr_5_32:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa7828005  ! 58: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r5, %-
	.word 0x30700001  ! 59: BPA	<illegal instruction>
	.word 0x879020b4  ! 60: WRPR_TT_I	wrpr	%r0, 0x00b4, %tt
	.word 0x95a01a72  ! 61: FqTOi	fqtoi	
splash_cmpr_5_33:
	setx 0x248e0243fed60df1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01966  ! 63: FqTOd	dis not found

splash_cmpr_5_35:
	setx 0x3c0794f14bd6c589, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 64: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda8008a0  ! 65: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_lsu_5_36:
	setx 0xe62be98c03b941b7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 66: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_5_37:
	setx 0x5167e1657d446af9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 67: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99454000  ! 68: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0xd8cfe010  ! 69: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_38:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 70: RDPC	rd	%pc, %r8
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 71: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9848014  ! 72: WR_SET_SOFTINT_R	wr	%r18, %r20, %set_softint
	.word 0xa190200a  ! 73: WRPR_GL_I	wrpr	%r0, 0x000a, %-
memptr_5_39:
	set user_data_start, %r31
	.word 0x85837f4a  ! 74: WRCCR_I	wr	%r13, 0x1f4a, %ccr
cwp_5_40:
    set user_data_start, %o7
	.word 0x93902001  ! 75: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8790217f  ! 76: WRPR_TT_I	wrpr	%r0, 0x017f, %tt
	.word 0x91d02034  ! 77: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_tba_5_41:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 78: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd2dfe000  ! 79: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r9
splash_tba_5_42:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 80: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_5_43:
	setx 0xa3ad50ed8a930657, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 81: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802088  ! 82: WRASI_I	wr	%r0, 0x0088, %asi
change_to_randtl_5_44:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_44:
	.word 0x8f902001  ! 83: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_lsu_5_45:
	setx 0xb9af2186e1adf011, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 84: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 85: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_46:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 86: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_hpstate_5_47:
	.word 0x81982f57  ! 87: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f57, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 88: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x94ac8006  ! 89: ANDNcc_R	andncc 	%r18, %r6, %r10
	.word 0x99454000  ! 90: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
splash_cmpr_5_48:
	setx 0x2b12265ebe854456, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 91: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_49:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f28, %f26, %f6
	.word 0x99b50303  ! 92: ALIGNADDRESS	alignaddr	%r20, %r3, %r12
tagged_5_50:
	tsubcctv %r8, 0x1e66, %r12
	.word 0xe607faea  ! 93: LDUW_I	lduw	[%r31 + 0xfffffaea], %r19
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_51
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_51
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_51:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 94: RDPC	rd	%pc, %r18
tagged_5_52:
	tsubcctv %r3, 0x14b2, %r6
	.word 0xd607faea  ! 95: LDUW_I	lduw	[%r31 + 0xfffffaea], %r11
	.word 0x87802089  ! 96: WRASI_I	wr	%r0, 0x0089, %asi
debug_5_53:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 97: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_5_54:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 98: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
splash_cmpr_5_55:
	setx 0x3fda97d207ca1632, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 99: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a0196a  ! 100: FqTOd	dis not found

splash_cmpr_5_57:
	setx 0x3fc8e40470884b6a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9a00574  ! 102: FSQRTq	fsqrt	
intveclr_5_58:
	setx 0x02abdf397d0b84b8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 103: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_5_59:
	.word 0x81982087  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0087, %hpstate
	.word 0x8d902888  ! 105: WRPR_PSTATE_I	wrpr	%r0, 0x0888, %pstate
	.word 0xe53fc000  ! 106: STDF_R	std	%f18, [%r0, %r31]
cwp_5_60:
    set user_data_start, %o7
	.word 0x93902004  ! 107: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x26700001  ! 108: BPL	<illegal instruction>
	.word 0x97480000  ! 109: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xdad804a0  ! 110: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0x2c700001  ! 111: BPNEG	<illegal instruction>
debug_5_61:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 112: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_5_62:
	nop
	setx 0xfffffebbfffff9fe, %g1, %g7
	.word 0xa3800007  ! 113: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xda8008a0  ! 114: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 115: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d020b5  ! 116: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0xdad00e80  ! 117: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r13
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_63
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_63:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 118: RDPC	rd	%pc, %r10
	rd %pc, %r19
	add %r19, (ivw_5_64-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_64:
	.word 0x91948003  ! 119: WRPR_PIL_R	wrpr	%r18, %r3, %pil
	.word 0xe4800b20  ! 120: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r18
	.word 0x87802083  ! 121: WRASI_I	wr	%r0, 0x0083, %asi
memptr_5_65:
	set 0x60740000, %r31
	.word 0x8584bcc1  ! 122: WRCCR_I	wr	%r18, 0x1cc1, %ccr
cwp_5_66:
    set user_data_start, %o7
	.word 0x93902000  ! 123: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 124: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9830001  ! 125: WR_SET_SOFTINT_R	wr	%r12, %r1, %set_softint
	.word 0xa1902009  ! 126: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x99a009d4  ! 127: FDIVd	fdivd	%f0, %f20, %f12
debug_5_67:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 128: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_5_68:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 129: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 130: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x87802010  ! 131: WRASI_I	wr	%r0, 0x0010, %asi
debug_5_69:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 132: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
DS_5_70:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xef5814e9	! Random illegal ?
	.word 0xdb118012  ! 1: LDQF_R	-	[%r6, %r18], %f13
	.word 0x99a0082d  ! 133: FADDs	fadds	%f0, %f13, %f12
	.word 0xd0d00e80  ! 134: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r8
	rd %pc, %r19
	add %r19, (ivw_5_71-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_71:
	.word 0x91924005  ! 135: WRPR_PIL_R	wrpr	%r9, %r5, %pil
splash_tba_5_72:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 136: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_5_73:
	setx 0x2a551825ad5d8d27, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 137: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 138: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x97a00168  ! 139: FABSq	dis not found

	.word 0x8780208b  ! 140: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x9b480000  ! 141: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
debug_5_74:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 142: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd027eaa8  ! 143: STW_I	stw	%r8, [%r31 + 0x0aa8]
splash_lsu_5_75:
	setx 0x4d9df97ba880597f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 144: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_76
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_76
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_76:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 145: RDPC	rd	%pc, %r10
debug_5_77:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 146: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8780204f  ! 147: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x879022b3  ! 148: WRPR_TT_I	wrpr	%r0, 0x02b3, %tt
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_78) + 24, 16, 16)) -> intp(2,0,21)
intvec_5_78:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 150: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_5_79:
	setx 0x870400ddf626939b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 151: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd68804a0  ! 152: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
mondo_5_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d930001  ! 153: WRPR_WSTATE_R	wrpr	%r12, %r1, %wstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_81:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e001  ! 154: CASA_R	casa	[%r31] %asi, %r1, %r11
DS_5_82:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 155: SAVE_R	save	%r31, %r0, %r31
	.word 0x9a840006  ! 156: ADDcc_R	addcc 	%r16, %r6, %r13
splash_cmpr_5_83:
	setx 0xb8b85fce543e3c9f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 157: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd86feaa8  ! 158: LDSTUB_I	ldstub	%r12, [%r31 + 0x0aa8]
splash_cmpr_5_84:
	setx 0x287639744f6b9a02, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 159: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd897e030  ! 160: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_85
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_85:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 161: RDPC	rd	%pc, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r16
mondo_5_86:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d904013  ! 163: WRPR_WSTATE_R	wrpr	%r1, %r19, %wstate
	.word 0x8d9029c2  ! 164: WRPR_PSTATE_I	wrpr	%r0, 0x09c2, %pstate
	.word 0x2e700001  ! 165: BPVS	<illegal instruction>
	.word 0xe097e000  ! 166: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r16
donret_5_87:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_87-donret_5_87-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_87:
	.word 0xe0ffeaa8  ! 167: SWAPA_I	swapa	%r16, [%r31 + 0x0aa8] %asi
	.word 0x87802016  ! 168: WRASI_I	wr	%r0, 0x0016, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_88)+56, 16, 16)) -> intp(5,1,3)
xir_5_88:
	.word 0xa9843fcd  ! 169: WR_SET_SOFTINT_I	wr	%r16, 0x1fcd, %set_softint
splash_hpstate_5_89:
	.word 0x8198264d  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x064d, %hpstate
DS_5_90:
	.word 0x93a209d4  ! 1: FDIVd	fdivd	%f8, %f20, %f40
	.word 0xb37b336d	! Random illegal ?
	.word 0x91a309c2  ! 1: FDIVd	fdivd	%f12, %f2, %f8
	.word 0x9ba48830  ! 171: FADDs	fadds	%f18, %f16, %f13
	.word 0xad80eda3  ! 172: WR_SOFTINT_REG_I	wr	%r3, 0x0da3, %softint
	.word 0x879022a7  ! 173: WRPR_TT_I	wrpr	%r0, 0x02a7, %tt
splash_decr_5_91:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa784800c  ! 174: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r12, %-
donret_5_92:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_92-donret_5_92), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_92:
	.word 0xdafff1ca  ! 175: SWAPA_I	swapa	%r13, [%r31 + 0xfffff1ca] %asi
	.word 0xdac00e60  ! 176: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r13
intveclr_5_93:
	setx 0x51b9db7b5bfd0782, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 177: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_5_94:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d90400c  ! 178: WRPR_WSTATE_R	wrpr	%r1, %r12, %wstate
DS_5_95:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 179: RESTORE_R	restore	%r31, %r0, %r31
tagged_5_96:
	tsubcctv %r9, 0x19be, %r20
	.word 0xda07f1ca  ! 180: LDUW_I	lduw	[%r31 + 0xfffff1ca], %r13
splash_tba_5_97:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 181: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_5_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 182: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xab852d57  ! 183: WR_CLEAR_SOFTINT_I	wr	%r20, 0x0d57, %clear_softint
change_to_randtl_5_99:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_99:
	.word 0x8f902002  ! 184: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_5_100:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 185: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_5_101:
	taddcctv %r12, 0x1c90, %r20
	.word 0xda07fbf7  ! 186: LDUW_I	lduw	[%r31 + 0xfffffbf7], %r13
	rd %pc, %r19
	add %r19, (ivw_5_102-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_102:
	.word 0x91950007  ! 187: WRPR_PIL_R	wrpr	%r20, %r7, %pil
	.word 0x87802010  ! 188: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d902623  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x0623, %pstate
debug_5_103:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 190: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xda97e030  ! 191: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r13
splash_lsu_5_104:
	setx 0x2dbeb69e05290ec3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 192: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_105:
	setx 0x8508e744bf5a72a7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 193: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_106:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 194: CASA_R	casa	[%r31] %asi, %r20, %r13
	.word 0x87802083  ! 195: WRASI_I	wr	%r0, 0x0083, %asi
debug_5_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 196: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_5_108:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 197: SAVE_R	save	%r31, %r0, %r31
	.word 0x92fb6018  ! 198: SDIVcc_I	sdivcc 	%r13, 0x0018, %r9
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 199: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d9039b5  ! 200: WRPR_PSTATE_I	wrpr	%r0, 0x19b5, %pstate
memptr_5_109:
	set 0x60540000, %r31
	.word 0x858022da  ! 201: WRCCR_I	wr	%r0, 0x02da, %ccr
	.word 0x91a00169  ! 202: FABSq	dis not found

splash_cmpr_5_110:
	setx 0x7df720c3bddc1161, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 203: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd88008a0  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x94803085  ! 205: ADDcc_I	addcc 	%r0, 0xfffff085, %r10
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_111
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_111
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_111:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 206: RDPC	rd	%pc, %r10
	.word 0x81510000  ! 207: RDPR_TICK	<illegal instruction>
	.word 0x8790202f  ! 208: WRPR_TT_I	wrpr	%r0, 0x002f, %tt
	.word 0x83d02033  ! 209: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xe8d004a0  ! 210: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01973  ! 211: FqTOd	dis not found

DS_5_113:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x91a409c9  ! 1: FDIVd	fdivd	%f16, %f40, %f8
	normalw
	.word 0x99458000  ! 212: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xd66fe43a  ! 213: LDSTUB_I	ldstub	%r11, [%r31 + 0x043a]
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_114
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_114:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 214: RDPC	rd	%pc, %r8
intveclr_5_115:
	setx 0x0d2030483b48402b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 215: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa78338cb  ! 216: WR_GRAPHICS_STATUS_REG_I	wr	%r12, 0x18cb, %-
debug_5_116:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 217: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9a6d22f7  ! 218: UDIVX_I	udivx 	%r20, 0x02f7, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3687fb9  ! 219: SDIVX_I	sdivx	%r1, 0xffffffb9, %r17
	.word 0x36700001  ! 220: BPGE	<illegal instruction>
	.word 0xd08804a0  ! 221: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	.word 0x87802080  ! 222: WRASI_I	wr	%r0, 0x0080, %asi
splash_tba_5_118:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 223: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_5_119:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa7a249c4  ! 1: FDIVd	fdivd	%f40, %f4, %f50
	.word 0xdb13000a  ! 1: LDQF_R	-	[%r12, %r10], %f13
	.word 0xa3a24822  ! 224: FADDs	fadds	%f9, %f2, %f17
mondo_5_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d934007  ! 225: WRPR_WSTATE_R	wrpr	%r13, %r7, %wstate
	.word 0xd4c80e80  ! 226: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r10
DS_5_121:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 227: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd497e030  ! 228: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
intveclr_5_122:
	setx 0x28f686c2676c43d8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 229: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_5_123:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa1a00542  ! 1: FSQRTd	fsqrt	
	.word 0x91a1c832  ! 230: FADDs	fadds	%f7, %f18, %f8
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_124)+32, 16, 16)) -> intp(5,1,3)
xir_5_124:
	.word 0xa9826da8  ! 231: WR_SET_SOFTINT_I	wr	%r9, 0x0da8, %set_softint
DS_5_125:
	.word 0xa1a449d2  ! 1: FDIVd	fdivd	%f48, %f18, %f16
	.word 0xe1330011  ! 1: STQF_R	-	%f16, [%r17, %r12]
	normalw
	.word 0x9b458000  ! 232: RD_SOFTINT_REG	rd	%softint, %r13
mondo_5_126:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d914009  ! 233: WRPR_WSTATE_R	wrpr	%r5, %r9, %wstate
	.word 0x87802020  ! 234: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe49004a0  ! 235: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 236: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d903549  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x1549, %pstate
	.word 0xe527c000  ! 238: STF_R	st	%f18, [%r0, %r31]
mondo_5_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d94c002  ! 239: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
	.word 0x9b50c000  ! 240: RDPR_TT	<illegal instruction>
	.word 0x95480000  ! 241: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_128
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_128:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 242: RDPC	rd	%pc, %r8
mondo_5_129:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d95000c  ! 243: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_130:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r19
	setx 0xa78abc1fffcf41de, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_131:
	.word 0x39400001  ! 245: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_5_132:
	setx 0xbcf03c2e1c2c2567, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 246: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_5_133:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 247: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_134) + 8, 16, 16)) -> intp(1,0,25)
intvec_5_134:
	.word 0x39400001  ! 248: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 249: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe68804a0  ! 250: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
splash_hpstate_5_135:
	.word 0x8198292f  ! 251: WRHPR_HPSTATE_I	wrhpr	%r0, 0x092f, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01962  ! 252: FqTOd	dis not found

	.word 0x93a00167  ! 253: FABSq	dis not found

	.word 0xd73fc000  ! 254: STDF_R	std	%f11, [%r0, %r31]
	.word 0x8d902680  ! 255: WRPR_PSTATE_I	wrpr	%r0, 0x0680, %pstate
	.word 0x8d903de9  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x1de9, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976b3158  ! 257: SDIVX_I	sdivx	%r12, 0xfffff158, %r11
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802020  ! 259: WRASI_I	wr	%r0, 0x0020, %asi
debug_5_138:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 260: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r12
debug_5_139:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 262: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab824007  ! 263: WR_CLEAR_SOFTINT_R	wr	%r9, %r7, %clear_softint
debug_5_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 264: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87902305  ! 265: WRPR_TT_I	wrpr	%r0, 0x0305, %tt
DS_5_141:
	.word 0x93a4c9c7  ! 1: FDIVd	fdivd	%f50, %f38, %f40
	.word 0xbfe7c000  ! 266: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_142) + 40, 16, 16)) -> intp(5,0,0)
intvec_5_142:
	.word 0x39400001  ! 267: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01966  ! 268: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 269: LDX_R	ldx	[%r31 + %r0], %r12
memptr_5_144:
	set user_data_start, %r31
	.word 0x85842da3  ! 270: WRCCR_I	wr	%r16, 0x0da3, %ccr
debug_5_145:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 271: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa984c00b  ! 272: WR_SET_SOFTINT_R	wr	%r19, %r11, %set_softint
	.word 0x81510000  ! 273: RDPR_TICK	<illegal instruction>
memptr_5_146:
	set 0x60140000, %r31
	.word 0x8580b4cc  ! 274: WRCCR_I	wr	%r2, 0x14cc, %ccr
	.word 0xa190200b  ! 275: WRPR_GL_I	wrpr	%r0, 0x000b, %-
memptr_5_147:
	set user_data_start, %r31
	.word 0x85812c7f  ! 276: WRCCR_I	wr	%r4, 0x0c7f, %ccr
	.word 0x87802089  ! 277: WRASI_I	wr	%r0, 0x0089, %asi
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_148
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_148:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 278: RDPC	rd	%pc, %r11
pmu_5_149:
	nop
	setx 0xfffff159fffffd20, %g1, %g7
	.word 0xa3800007  ! 279: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_5_150:
	setx 0xddd2542153936c0d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 280: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01963  ! 281: FqTOd	dis not found

splash_cmpr_5_152:
	setx 0xa351a6a71fd6ddd9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 282: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902004  ! 283: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xd68008a0  ! 284: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
debug_5_153:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 285: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
splash_hpstate_5_154:
	.word 0x819820c7  ! 286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c7, %hpstate
splash_hpstate_5_155:
	.word 0x81982e46  ! 287: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e46, %hpstate
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_156
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_156
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_156:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 288: RDPC	rd	%pc, %r8
splash_tba_5_157:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 289: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_158
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_158
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_158:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 290: RDPC	rd	%pc, %r17
memptr_5_159:
	set user_data_start, %r31
	.word 0x85843e46  ! 291: WRCCR_I	wr	%r16, 0x1e46, %ccr
	.word 0x8d9032e6  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x12e6, %pstate
	.word 0x95480000  ! 293: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
debug_5_160:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 294: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902361  ! 295: WRPR_PSTATE_I	wrpr	%r0, 0x0361, %pstate
memptr_5_161:
	set 0x60540000, %r31
	.word 0x85807148  ! 296: WRCCR_I	wr	%r1, 0x1148, %ccr
	.word 0x3c700001  ! 297: BPPOS	<illegal instruction>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_162:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 298: CASA_R	casa	[%r31] %asi, %r17, %r12
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_163
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_163:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 299: RDPC	rd	%pc, %r8
splash_cmpr_5_164:
	setx 0x6092dce69c2841cf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 300: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9037af  ! 301: WRPR_PSTATE_I	wrpr	%r0, 0x17af, %pstate
debug_5_165:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 302: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_166)+32, 16, 16)) -> intp(5,1,3)
xir_5_166:
	.word 0xa9847ea7  ! 303: WR_SET_SOFTINT_I	wr	%r17, 0x1ea7, %set_softint
splash_cmpr_5_167:
	setx 0x5c9df906fbc86254, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 304: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 305: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_5_168:
	tsubcctv %r18, 0x1df5, %r26
	.word 0xd807e4ae  ! 306: LDUW_I	lduw	[%r31 + 0x04ae], %r12
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_169
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_169
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_169:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 307: RDPC	rd	%pc, %r12
	.word 0xa1902007  ! 308: WRPR_GL_I	wrpr	%r0, 0x0007, %-
memptr_5_170:
	set 0x60540000, %r31
	.word 0x85847019  ! 309: WRCCR_I	wr	%r17, 0x1019, %ccr
DS_5_171:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x93b08308  ! 310: ALIGNADDRESS	alignaddr	%r2, %r8, %r9
	.word 0xe677e758  ! 311: STX_I	stx	%r19, [%r31 + 0x0758]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996c6833  ! 312: SDIVX_I	sdivx	%r17, 0x0833, %r12
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 313: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_decr_5_173:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r11, [%r1] 0x45
	.word 0xa7848014  ! 314: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r20, %-
	.word 0x93a1c9cb  ! 315: FDIVd	fdivd	%f38, %f42, %f40
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9968adf1  ! 316: SDIVX_I	sdivx	%r2, 0x0df1, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x81510000  ! 318: RDPR_TICK	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01972  ! 319: FqTOd	dis not found

DS_5_176:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 320: SAVE_R	save	%r31, %r0, %r31
	.word 0x9ba00160  ! 321: FABSq	dis not found

	.word 0xa5a00162  ! 322: FABSq	dis not found

	.word 0xa1902001  ! 323: WRPR_GL_I	wrpr	%r0, 0x0001, %-
change_to_randtl_5_177:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_177:
	.word 0x8f902001  ! 324: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93a00165  ! 325: FABSq	dis not found

	.word 0x87902048  ! 326: WRPR_TT_I	wrpr	%r0, 0x0048, %tt
	.word 0x879023d6  ! 327: WRPR_TT_I	wrpr	%r0, 0x03d6, %tt
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_178
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_178
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_178:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 328: RDPC	rd	%pc, %r9
	.word 0x9194fd61  ! 329: WRPR_PIL_I	wrpr	%r19, 0x1d61, %pil
	.word 0x3e800001  ! 330: BVC	bvc,a	<label_0x1>
memptr_5_179:
	set 0x60340000, %r31
	.word 0x8584392e  ! 331: WRCCR_I	wr	%r16, 0x192e, %ccr
splash_cmpr_5_180:
	setx 0x781f7bbecb0f4336, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 332: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_181:
	setx 0x5f31351a339bde6f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 333: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_182:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 334: CASA_R	casa	[%r31] %asi, %r10, %r8
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 335: CASA_R	casa	[%r31] %asi, %r10, %r8
DS_5_184:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f0, %f22, %f20
	.word 0x99b14311  ! 336: ALIGNADDRESS	alignaddr	%r5, %r17, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 337: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xa190200b  ! 338: WRPR_GL_I	wrpr	%r0, 0x000b, %-
tagged_5_185:
	taddcctv %r16, 0x19ea, %r18
	.word 0xd607e82e  ! 339: LDUW_I	lduw	[%r31 + 0x082e], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_186) + 32, 16, 16)) -> intp(1,0,26)
intvec_5_186:
	.word 0x39400001  ! 340: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe020  ! 341: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 342: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_5_187:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_187:
	.word 0x8f902002  ! 343: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd66fe82e  ! 344: LDSTUB_I	ldstub	%r11, [%r31 + 0x082e]
	.word 0x87802088  ! 345: WRASI_I	wr	%r0, 0x0088, %asi
intveclr_5_188:
	setx 0xe1d94bf43dcd98e9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 346: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_5_189:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_189:
	.word 0x8f902000  ! 347: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_5_190:
	setx 0xd8ba2fbb6071138b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 348: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 349: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_5_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 350: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_192) + 8, 16, 16)) -> intp(5,0,15)
intvec_5_192:
	.word 0x39400001  ! 351: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_193
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_193:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 352: RDPC	rd	%pc, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01965  ! 353: FqTOd	dis not found

change_to_randtl_5_195:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_195:
	.word 0x8f902002  ! 354: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_lsu_5_196:
	setx 0x5c7dcea65cfcce6f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 355: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe0800c80  ! 356: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r16
debug_5_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 357: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_198)+16, 16, 16)) -> intp(5,1,3)
xir_5_198:
	.word 0xa9823120  ! 358: WR_SET_SOFTINT_I	wr	%r8, 0x1120, %set_softint
	.word 0x99902005  ! 359: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
splash_lsu_5_199:
	setx 0xac9dc74fc32e9d1f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 360: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 361: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01972  ! 362: FqTOd	dis not found

cwp_5_201:
    set user_data_start, %o7
	.word 0x93902000  ! 363: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
change_to_randtl_5_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_202:
	.word 0x8f902002  ! 364: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd937e831  ! 365: STQF_I	-	%f12, [0x0831, %r31]
	.word 0x87902328  ! 366: WRPR_TT_I	wrpr	%r0, 0x0328, %tt
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_203:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e013  ! 367: CASA_R	casa	[%r31] %asi, %r19, %r12
tagged_5_204:
	tsubcctv %r23, 0x1a8b, %r18
	.word 0xd807e831  ! 368: LDUW_I	lduw	[%r31 + 0x0831], %r12
	.word 0xd847c000  ! 369: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0xd81fc000  ! 370: LDD_R	ldd	[%r31 + %r0], %r12
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_205
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_205:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 371: RDPC	rd	%pc, %r16
	.word 0x8d902940  ! 372: WRPR_PSTATE_I	wrpr	%r0, 0x0940, %pstate
splash_lsu_5_206:
	setx 0x5c0545291bbfefe5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 373: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802083  ! 374: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0x8d90232f  ! 375: WRPR_PSTATE_I	wrpr	%r0, 0x032f, %pstate
splash_hpstate_5_207:
	.word 0x81982227  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0227, %hpstate
	rd %pc, %r19
	add %r19, (ivw_5_208-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_208:
	.word 0x9191800d  ! 377: WRPR_PIL_R	wrpr	%r6, %r13, %pil
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_209
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_209:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e003  ! 378: CASA_R	casa	[%r31] %asi, %r3, %r13
cwp_5_210:
    set user_data_start, %o7
	.word 0x93902000  ! 379: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d90324d  ! 380: WRPR_PSTATE_I	wrpr	%r0, 0x124d, %pstate
	.word 0xdac7e000  ! 381: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r13
	.word 0xdb27c000  ! 382: STF_R	st	%f13, [%r0, %r31]
change_to_randtl_5_211:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_211:
	.word 0x8f902003  ! 383: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	rd %pc, %r19
	add %r19, (ivw_5_212-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_212:
	.word 0x91930012  ! 384: WRPR_PIL_R	wrpr	%r12, %r18, %pil
splash_cmpr_5_213:
	setx 0x47e9e17476955a52, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 385: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdadfe020  ! 386: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r13
tagged_5_214:
	tsubcctv %r13, 0x14fa, %r17
	.word 0xda07e831  ! 387: LDUW_I	lduw	[%r31 + 0x0831], %r13
debug_5_215:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 388: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_5_216:
	setx 0x34a5b0ebfdb13409, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32800001  ! 390: BNE	bne,a	<label_0x1>
	.word 0x83d020b4  ! 391: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xdadfe010  ! 392: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0x879021bf  ! 393: WRPR_TT_I	wrpr	%r0, 0x01bf, %tt
mondo_5_217:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d930012  ! 394: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
	.word 0x87902134  ! 395: WRPR_TT_I	wrpr	%r0, 0x0134, %tt
splash_tba_5_218:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 396: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d903871  ! 397: WRPR_PSTATE_I	wrpr	%r0, 0x1871, %pstate
splash_cmpr_5_219:
	setx 0xaf1a304e113cf687, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93a009d0  ! 399: FDIVd	fdivd	%f0, %f16, %f40
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa968fb6b  ! 400: SDIVX_I	sdivx	%r3, 0xfffffb6b, %r20
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_0:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00a  ! 1: CASA_R	casa	[%r31] %asi, %r10, %r12
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_4_1:
	setx 0x5fc331dc62473097, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200a  ! 4: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd88804a0  ! 5: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
splash_cmpr_4_2:
	setx 0x38d519ad5e00b2ce, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 6: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8d7e010  ! 7: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r12
splash_cmpr_4_3:
	setx 0xf291bc60adaec484, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 8: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9a409d2  ! 9: FDIVd	fdivd	%f16, %f18, %f20
splash_lsu_4_4:
	setx 0xda01e2ec4a1cfeb5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d02033  ! 11: Tcc_I	tne	icc_or_xcc, %r0 + 51
debug_4_5:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 12: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91454000  ! 13: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0xe847c000  ! 14: LDSW_R	ldsw	[%r31 + %r0], %r20
DS_4_6:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 15: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56a72e6  ! 16: SDIVX_I	sdivx	%r9, 0xfffff2e6, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_8) + 0, 16, 16)) -> intp(2,0,0)
intvec_4_8:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_4_9:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 18: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_4_10:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 19: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_11:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 20: CASA_R	casa	[%r31] %asi, %r8, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196d  ! 21: FqTOd	dis not found

	.word 0xe08008a0  ! 22: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_4_13:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d908007  ! 23: WRPR_WSTATE_R	wrpr	%r2, %r7, %wstate
	.word 0xe0800aa0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r16
splash_hpstate_4_14:
	.word 0x81982d84  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d84, %hpstate
	.word 0x9afb4002  ! 27: SDIVcc_R	sdivcc 	%r13, %r2, %r13
DS_4_15:
	.word 0xa1a189c5  ! 1: FDIVd	fdivd	%f6, %f36, %f16
	.word 0xa1a509d4  ! 1: FDIVd	fdivd	%f20, %f20, %f16
	normalw
	.word 0x91458000  ! 28: RD_SOFTINT_REG	rd	%softint, %r8
splash_hpstate_4_16:
	.word 0x819826c6  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c6, %hpstate
	.word 0x9550c000  ! 30: RDPR_TT	<illegal instruction>
	.word 0x87802020  ! 31: WRASI_I	wr	%r0, 0x0020, %asi
memptr_4_17:
	set 0x60540000, %r31
	.word 0x85853a39  ! 32: WRCCR_I	wr	%r20, 0x1a39, %ccr
tagged_4_18:
	tsubcctv %r14, 0x17c8, %r15
	.word 0xd407e5ee  ! 33: LDUW_I	lduw	[%r31 + 0x05ee], %r10
cwp_4_19:
    set user_data_start, %o7
	.word 0x93902003  ! 34: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
cwp_4_20:
    set user_data_start, %o7
	.word 0x93902004  ! 35: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_21:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 36: CASA_R	casa	[%r31] %asi, %r11, %r10
	.word 0x91d02035  ! 37: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902002  ! 38: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd477c000  ! 39: STX_R	stx	%r10, [%r31 + %r0]
memptr_4_22:
	set 0x60340000, %r31
	.word 0x8580e3b7  ! 40: WRCCR_I	wr	%r3, 0x03b7, %ccr
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_23:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 41: CASA_R	casa	[%r31] %asi, %r11, %r10
	.word 0x8780201c  ! 42: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd437fdc5  ! 43: STH_I	sth	%r10, [%r31 + 0xfffffdc5]
pmu_4_24:
	nop
	setx 0xfffffb43fffffbca, %g1, %g7
	.word 0xa3800007  ! 44: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd4d7e000  ! 45: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
splash_lsu_4_25:
	setx 0x8056878983b7cbc5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 46: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_26:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 47: CASA_R	casa	[%r31] %asi, %r11, %r10
splash_cmpr_4_27:
	setx 0x081e56aa92f379d7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 48: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01971  ! 49: FqTOd	dis not found

	.word 0xd8cfe010  ! 50: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r12
	.word 0xd88804a0  ! 51: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0xa1902003  ! 52: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_cmpr_4_29:
	setx 0xd6a6060f3c5823d0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 53: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 54: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_4_30:
	setx 0x66b44d9c5e1ef0c2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 55: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01961  ! 56: FqTOd	dis not found

	.word 0xa3a30dc1  ! 57: FdMULq	fdmulq	
splash_decr_4_32:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa7824001  ! 58: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r1, %-
	.word 0x30700001  ! 59: BPA	<illegal instruction>
	.word 0x879022c8  ! 60: WRPR_TT_I	wrpr	%r0, 0x02c8, %tt
	.word 0xa3a01a6b  ! 61: FqTOi	fqtoi	
splash_cmpr_4_33:
	setx 0x312610fe75549aa2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01961  ! 63: FqTOd	dis not found

splash_cmpr_4_35:
	setx 0x3f9ab633f6552943, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 64: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda800c80  ! 65: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r13
splash_lsu_4_36:
	setx 0xbebc8de475a7fb59, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 66: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_4_37:
	setx 0x1a7d9dadc8f222bb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 67: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9b454000  ! 68: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	.word 0xd8cfe020  ! 69: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
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
	.word 0xa5414000  ! 70: RDPC	rd	%pc, %r18
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 71: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa9814001  ! 72: WR_SET_SOFTINT_R	wr	%r5, %r1, %set_softint
	.word 0xa1902009  ! 73: WRPR_GL_I	wrpr	%r0, 0x0009, %-
memptr_4_39:
	set user_data_start, %r31
	.word 0x85802f17  ! 74: WRCCR_I	wr	%r0, 0x0f17, %ccr
cwp_4_40:
    set user_data_start, %o7
	.word 0x93902004  ! 75: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8790233e  ! 76: WRPR_TT_I	wrpr	%r0, 0x033e, %tt
	.word 0x83d02032  ! 77: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_tba_4_41:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 78: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd2dfe020  ! 79: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r9
splash_tba_4_42:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 80: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_4_43:
	setx 0xe13c69ca24907210, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 81: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780208a  ! 82: WRASI_I	wr	%r0, 0x008a, %asi
change_to_randtl_4_44:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_44:
	.word 0x8f902001  ! 83: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_lsu_4_45:
	setx 0x7fe68bf18bcd0aad, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 84: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 85: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_46:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 86: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_hpstate_4_47:
	.word 0x81982c05  ! 87: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c05, %hpstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 88: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x94a9000a  ! 89: ANDNcc_R	andncc 	%r4, %r10, %r10
	.word 0x97454000  ! 90: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
splash_cmpr_4_48:
	setx 0x7d0fd02237849037, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 91: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_49:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f14, %f28, %f24
	.word 0xa7b00311  ! 92: ALIGNADDRESS	alignaddr	%r0, %r17, %r19
tagged_4_50:
	tsubcctv %r26, 0x1d87, %r18
	.word 0xe607faea  ! 93: LDUW_I	lduw	[%r31 + 0xfffffaea], %r19
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
	.word 0x91414000  ! 94: RDPC	rd	%pc, %r8
tagged_4_52:
	tsubcctv %r15, 0x17c5, %r20
	.word 0xd607faea  ! 95: LDUW_I	lduw	[%r31 + 0xfffffaea], %r11
	.word 0x87802004  ! 96: WRASI_I	wr	%r0, 0x0004, %asi
debug_4_53:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 97: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_4_54:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_54:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_54
    nop
debug_wait4_54:
    ld [%r23], %r16
    brnz %r16, debug_wait4_54
    nop
    ba,a debug_startwait4_54
continue_debug_4_54:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_54:
    cmp %r13, %r15
    bne,a wait_for_stat_4_54
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_54:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_54
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00492  ! 98: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
splash_cmpr_4_55:
	setx 0x1287a6c18d1c505e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 99: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01973  ! 100: FqTOd	dis not found

splash_cmpr_4_57:
	setx 0xa3a8084f59861f52, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a0056a  ! 102: FSQRTq	fsqrt	
intveclr_4_58:
	setx 0xc1cc9b15741b5181, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 103: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_59:
	.word 0x819829dc  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09dc, %hpstate
	.word 0x8d9035f5  ! 105: WRPR_PSTATE_I	wrpr	%r0, 0x15f5, %pstate
	.word 0xe53fc000  ! 106: STDF_R	std	%f18, [%r0, %r31]
cwp_4_60:
    set user_data_start, %o7
	.word 0x93902002  ! 107: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x26700001  ! 108: BPL	<illegal instruction>
	.word 0x9b480000  ! 109: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0xdad804a0  ! 110: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0x2c700001  ! 111: BPNEG	<illegal instruction>
debug_4_61:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 112: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_4_62:
	nop
	setx 0xfffff38cfffffa7f, %g1, %g7
	.word 0xa3800007  ! 113: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xda800ac0  ! 114: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r13
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 115: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x83d020b4  ! 116: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xdad00e80  ! 117: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r13
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_63
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_63:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 118: RDPC	rd	%pc, %r13
	rd %pc, %r19
	add %r19, (ivw_4_64-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_64:
	.word 0x9194000a  ! 119: WRPR_PIL_R	wrpr	%r16, %r10, %pil
	.word 0xe48008a0  ! 120: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x87802010  ! 121: WRASI_I	wr	%r0, 0x0010, %asi
memptr_4_65:
	set 0x60740000, %r31
	.word 0x8584237d  ! 122: WRCCR_I	wr	%r16, 0x037d, %ccr
cwp_4_66:
    set user_data_start, %o7
	.word 0x93902007  ! 123: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 124: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa9818002  ! 125: WR_SET_SOFTINT_R	wr	%r6, %r2, %set_softint
	.word 0xa1902002  ! 126: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x95a009d1  ! 127: FDIVd	fdivd	%f0, %f48, %f10
debug_4_67:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 128: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_4_68:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 129: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 130: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x87802010  ! 131: WRASI_I	wr	%r0, 0x0010, %asi
debug_4_69:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_69:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_69
    nop
debug_wait4_69:
    ld [%r23], %r16
    brnz %r16, debug_wait4_69
    nop
    ba,a debug_startwait4_69
continue_debug_4_69:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_69:
    cmp %r13, %r15
    bne,a wait_for_stat_4_69
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_69:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_69
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe0f00492  ! 132: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
DS_4_70:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbb79ff06	! Random illegal ?
	.word 0xd9114010  ! 1: LDQF_R	-	[%r5, %r16], %f12
	.word 0x9ba2c831  ! 133: FADDs	fadds	%f11, %f17, %f13
	.word 0xd0d004a0  ! 134: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	rd %pc, %r19
	add %r19, (ivw_4_71-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_71:
	.word 0x91928000  ! 135: WRPR_PIL_R	wrpr	%r10, %r0, %pil
splash_tba_4_72:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 136: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_4_73:
	setx 0x508dcd4a6120641c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 137: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 138: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x91a0016a  ! 139: FABSq	dis not found

	.word 0x87802014  ! 140: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x95480000  ! 141: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
debug_4_74:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 142: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd027eaa8  ! 143: STW_I	stw	%r8, [%r31 + 0x0aa8]
splash_lsu_4_75:
	setx 0x7f6c0c1d5574b537, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 144: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_76
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_76
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_76:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 145: RDPC	rd	%pc, %r13
debug_4_77:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 146: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802088  ! 147: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x879022c4  ! 148: WRPR_TT_I	wrpr	%r0, 0x02c4, %tt
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_78) + 16, 16, 16)) -> intp(1,0,13)
intvec_4_78:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 150: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_4_79:
	setx 0x2c822bdc18f93988, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 151: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd68804a0  ! 152: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
mondo_4_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d914003  ! 153: WRPR_WSTATE_R	wrpr	%r5, %r3, %wstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_81:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e001  ! 154: CASA_R	casa	[%r31] %asi, %r1, %r11
DS_4_82:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 155: SAVE_R	save	%r31, %r0, %r31
	.word 0x9284800d  ! 156: ADDcc_R	addcc 	%r18, %r13, %r9
splash_cmpr_4_83:
	setx 0xef6ebb583a2df344, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 157: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd86feaa8  ! 158: LDSTUB_I	ldstub	%r12, [%r31 + 0x0aa8]
splash_cmpr_4_84:
	setx 0x2825b82b5e735f78, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 159: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd897e030  ! 160: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_85
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_85:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 161: RDPC	rd	%pc, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r16
mondo_4_86:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d94c007  ! 163: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
	.word 0x8d902e6f  ! 164: WRPR_PSTATE_I	wrpr	%r0, 0x0e6f, %pstate
	.word 0x2e700001  ! 165: BPVS	<illegal instruction>
	.word 0xe097e030  ! 166: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r16
donret_4_87:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_87-donret_4_87-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_87:
	.word 0xe0ffeaa8  ! 167: SWAPA_I	swapa	%r16, [%r31 + 0x0aa8] %asi
	.word 0x87802014  ! 168: WRASI_I	wr	%r0, 0x0014, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_88)+24, 16, 16)) -> intp(4,1,3)
xir_4_88:
	.word 0xa9852920  ! 169: WR_SET_SOFTINT_I	wr	%r20, 0x0920, %set_softint
splash_hpstate_4_89:
	.word 0x819825ce  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05ce, %hpstate
DS_4_90:
	.word 0x95a409d2  ! 1: FDIVd	fdivd	%f16, %f18, %f10
	.word 0xf76e38c5	! Random illegal ?
	.word 0xa3a049c6  ! 1: FDIVd	fdivd	%f32, %f6, %f48
	.word 0x99a40830  ! 171: FADDs	fadds	%f16, %f16, %f12
	.word 0xad816cca  ! 172: WR_SOFTINT_REG_I	wr	%r5, 0x0cca, %softint
	.word 0x879021a7  ! 173: WRPR_TT_I	wrpr	%r0, 0x01a7, %tt
splash_decr_4_91:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r19, [%r1] 0x45
	.word 0xa780000d  ! 174: WR_GRAPHICS_STATUS_REG_R	wr	%r0, %r13, %-
donret_4_92:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_92-donret_4_92), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_92:
	.word 0xdafff1ca  ! 175: SWAPA_I	swapa	%r13, [%r31 + 0xfffff1ca] %asi
	.word 0xdac004a0  ! 176: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
intveclr_4_93:
	setx 0x85377a1f115a3ba0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 177: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_94:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d90c010  ! 178: WRPR_WSTATE_R	wrpr	%r3, %r16, %wstate
DS_4_95:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 179: RESTORE_R	restore	%r31, %r0, %r31
tagged_4_96:
	tsubcctv %r23, 0x1848, %r6
	.word 0xda07f1ca  ! 180: LDUW_I	lduw	[%r31 + 0xfffff1ca], %r13
splash_tba_4_97:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 181: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_4_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 182: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xab82b804  ! 183: WR_CLEAR_SOFTINT_I	wr	%r10, 0x1804, %clear_softint
change_to_randtl_4_99:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_99:
	.word 0x8f902000  ! 184: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_4_100:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 185: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_4_101:
	taddcctv %r18, 0x1b59, %r3
	.word 0xda07fbf7  ! 186: LDUW_I	lduw	[%r31 + 0xfffffbf7], %r13
	rd %pc, %r19
	add %r19, (ivw_4_102-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_102:
	.word 0x91900004  ! 187: WRPR_PIL_R	wrpr	%r0, %r4, %pil
	.word 0x8780208b  ! 188: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x8d9024dd  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x04dd, %pstate
debug_4_103:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 190: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xda97e020  ! 191: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r13
splash_lsu_4_104:
	setx 0x775dc280dc306a5f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 192: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_105:
	setx 0xc520c6abd6b88dd7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 193: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_106:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 194: CASA_R	casa	[%r31] %asi, %r20, %r13
	.word 0x87802080  ! 195: WRASI_I	wr	%r0, 0x0080, %asi
debug_4_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 196: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_4_108:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 197: SAVE_R	save	%r31, %r0, %r31
	.word 0xa2f9f616  ! 198: SDIVcc_I	sdivcc 	%r7, 0xfffff616, %r17
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 199: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9033a0  ! 200: WRPR_PSTATE_I	wrpr	%r0, 0x13a0, %pstate
memptr_4_109:
	set 0x60140000, %r31
	.word 0x858166db  ! 201: WRCCR_I	wr	%r5, 0x06db, %ccr
	.word 0xa1a0016b  ! 202: FABSq	dis not found

splash_cmpr_4_110:
	setx 0xd9c692476f4001c7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 203: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd88008a0  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xa2807ceb  ! 205: ADDcc_I	addcc 	%r1, 0xfffffceb, %r17
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_111
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_111
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_111:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 206: RDPC	rd	%pc, %r8
	.word 0x81510000  ! 207: RDPR_TICK	<illegal instruction>
	.word 0x879023a8  ! 208: WRPR_TT_I	wrpr	%r0, 0x03a8, %tt
	.word 0x91d02035  ! 209: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe8d00e60  ! 210: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01969  ! 211: FqTOd	dis not found

DS_4_113:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa3a489d1  ! 1: FDIVd	fdivd	%f18, %f48, %f48
	normalw
	.word 0x93458000  ! 212: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xd66fe43a  ! 213: LDSTUB_I	ldstub	%r11, [%r31 + 0x043a]
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_114:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 214: RDPC	rd	%pc, %r11
intveclr_4_115:
	setx 0x6d27aa3ed87d2eef, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 215: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa780e95d  ! 216: WR_GRAPHICS_STATUS_REG_I	wr	%r3, 0x095d, %-
debug_4_116:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 217: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9a6d25bf  ! 218: UDIVX_I	udivx 	%r20, 0x05bf, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956c3398  ! 219: SDIVX_I	sdivx	%r16, 0xfffff398, %r10
	.word 0x36700001  ! 220: BPGE	<illegal instruction>
	.word 0xd08804a0  ! 221: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	.word 0x87802004  ! 222: WRASI_I	wr	%r0, 0x0004, %asi
splash_tba_4_118:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 223: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_4_119:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x93a4c9d3  ! 1: FDIVd	fdivd	%f50, %f50, %f40
	.word 0xe7144014  ! 1: LDQF_R	-	[%r17, %r20], %f19
	.word 0xa1a04831  ! 224: FADDs	fadds	%f1, %f17, %f16
mondo_4_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d94400b  ! 225: WRPR_WSTATE_R	wrpr	%r17, %r11, %wstate
	.word 0xd4c804a0  ! 226: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
DS_4_121:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 227: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd497e000  ! 228: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
intveclr_4_122:
	setx 0x3b596d5afd3fea1c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 229: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_4_123:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa9a00548  ! 1: FSQRTd	fsqrt	
	.word 0x95a0c821  ! 230: FADDs	fadds	%f3, %f1, %f10
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_124)+56, 16, 16)) -> intp(4,1,3)
xir_4_124:
	.word 0xa980204c  ! 231: WR_SET_SOFTINT_I	wr	%r0, 0x004c, %set_softint
DS_4_125:
	.word 0x99a349cd  ! 1: FDIVd	fdivd	%f44, %f44, %f12
	.word 0xd530c008  ! 1: STQF_R	-	%f10, [%r8, %r3]
	normalw
	.word 0x9b458000  ! 232: RD_SOFTINT_REG	rd	%softint, %r13
mondo_4_126:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d90c000  ! 233: WRPR_WSTATE_R	wrpr	%r3, %r0, %wstate
	.word 0x87802016  ! 234: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xe49004a0  ! 235: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 236: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903094  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x1094, %pstate
	.word 0xe527c000  ! 238: STF_R	st	%f18, [%r0, %r31]
mondo_4_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d948014  ! 239: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0x9950c000  ! 240: RDPR_TT	<illegal instruction>
	.word 0x91480000  ! 241: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_128
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_128:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 242: RDPC	rd	%pc, %r10
mondo_4_129:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d94400b  ! 243: WRPR_WSTATE_R	wrpr	%r17, %r11, %wstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_130:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r19
	setx 0x9ae27d88e09f0969, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_131:
	.word 0x39400001  ! 245: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_4_132:
	setx 0x152253bf87d68f90, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 246: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_133:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 247: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_134) + 56, 16, 16)) -> intp(3,0,31)
intvec_4_134:
	.word 0x39400001  ! 248: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 249: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe6880e80  ! 250: LDUBA_R	lduba	[%r0, %r0] 0x74, %r19
splash_hpstate_4_135:
	.word 0x819824ec  ! 251: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04ec, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a0196d  ! 252: FqTOd	dis not found

	.word 0x91a00174  ! 253: FABSq	dis not found

	.word 0xd73fc000  ! 254: STDF_R	std	%f11, [%r0, %r31]
	.word 0x8d903416  ! 255: WRPR_PSTATE_I	wrpr	%r0, 0x1416, %pstate
	.word 0x8d902bd1  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x0bd1, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96a7862  ! 257: SDIVX_I	sdivx	%r9, 0xfffff862, %r20
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8780208a  ! 259: WRASI_I	wr	%r0, 0x008a, %asi
debug_4_138:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_138:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_138
    nop
debug_wait4_138:
    ld [%r23], %r16
    brnz %r16, debug_wait4_138
    nop
    ba,a debug_startwait4_138
continue_debug_4_138:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_138:
    cmp %r13, %r15
    bne,a wait_for_stat_4_138
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_138:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_138
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe0f00492  ! 260: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r12
debug_4_139:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 262: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab800004  ! 263: WR_CLEAR_SOFTINT_R	wr	%r0, %r4, %clear_softint
debug_4_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 264: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87902066  ! 265: WRPR_TT_I	wrpr	%r0, 0x0066, %tt
DS_4_141:
	.word 0x95a1c9d1  ! 1: FDIVd	fdivd	%f38, %f48, %f10
	.word 0xbfe7c000  ! 266: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_142) + 24, 16, 16)) -> intp(6,0,3)
intvec_4_142:
	.word 0x39400001  ! 267: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01966  ! 268: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 269: LDX_R	ldx	[%r31 + %r0], %r12
memptr_4_144:
	set user_data_start, %r31
	.word 0x8581fcf0  ! 270: WRCCR_I	wr	%r7, 0x1cf0, %ccr
debug_4_145:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 271: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa981000c  ! 272: WR_SET_SOFTINT_R	wr	%r4, %r12, %set_softint
	.word 0x81510000  ! 273: RDPR_TICK	<illegal instruction>
memptr_4_146:
	set 0x60740000, %r31
	.word 0x85806557  ! 274: WRCCR_I	wr	%r1, 0x0557, %ccr
	.word 0xa190200d  ! 275: WRPR_GL_I	wrpr	%r0, 0x000d, %-
memptr_4_147:
	set user_data_start, %r31
	.word 0x85807611  ! 276: WRCCR_I	wr	%r1, 0x1611, %ccr
	.word 0x87802055  ! 277: WRASI_I	wr	%r0, 0x0055, %asi
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_148
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_148:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 278: RDPC	rd	%pc, %r16
pmu_4_149:
	nop
	setx 0xfffff8e7fffffdaf, %g1, %g7
	.word 0xa3800007  ! 279: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_4_150:
	setx 0x34f974baef5a65a9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 280: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0196d  ! 281: FqTOd	dis not found

splash_cmpr_4_152:
	setx 0x94e77c46da8dc350, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 282: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902002  ! 283: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xd6800b60  ! 284: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r11
debug_4_153:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_153:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_153
    nop
debug_wait4_153:
    ld [%r23], %r16
    brnz %r16, debug_wait4_153
    nop
    ba,a debug_startwait4_153
continue_debug_4_153:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_153:
    cmp %r13, %r15
    bne,a wait_for_stat_4_153
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_153:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_153
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd8f00492  ! 285: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
splash_hpstate_4_154:
	.word 0x81982edf  ! 286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edf, %hpstate
splash_hpstate_4_155:
	.word 0x819822c5  ! 287: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c5, %hpstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_156
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_156
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_156:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 288: RDPC	rd	%pc, %r10
splash_tba_4_157:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 289: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_158
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_158
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_158:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 290: RDPC	rd	%pc, %r12
memptr_4_159:
	set user_data_start, %r31
	.word 0x8580a81e  ! 291: WRCCR_I	wr	%r2, 0x081e, %ccr
	.word 0x8d903d14  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x1d14, %pstate
	.word 0x99480000  ! 293: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
debug_4_160:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 294: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d9024ac  ! 295: WRPR_PSTATE_I	wrpr	%r0, 0x04ac, %pstate
memptr_4_161:
	set 0x60740000, %r31
	.word 0x8584e5bf  ! 296: WRCCR_I	wr	%r19, 0x05bf, %ccr
	.word 0x3c700001  ! 297: BPPOS	<illegal instruction>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_162:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 298: CASA_R	casa	[%r31] %asi, %r17, %r12
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
	.word 0xa1414000  ! 299: RDPC	rd	%pc, %r16
splash_cmpr_4_164:
	setx 0xda575bf697c57ab9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 300: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903e50  ! 301: WRPR_PSTATE_I	wrpr	%r0, 0x1e50, %pstate
debug_4_165:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_165:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_165
    nop
debug_wait4_165:
    ld [%r23], %r16
    brnz %r16, debug_wait4_165
    nop
    ba,a debug_startwait4_165
continue_debug_4_165:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_165:
    cmp %r13, %r15
    bne,a wait_for_stat_4_165
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_165:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_165
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %19, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00492  ! 302: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_166)+24, 16, 16)) -> intp(4,1,3)
xir_4_166:
	.word 0xa981ae2b  ! 303: WR_SET_SOFTINT_I	wr	%r6, 0x0e2b, %set_softint
splash_cmpr_4_167:
	setx 0x172e5fa795ebc7cb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 304: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 305: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_4_168:
	tsubcctv %r11, 0x1ef8, %r16
	.word 0xd807e4ae  ! 306: LDUW_I	lduw	[%r31 + 0x04ae], %r12
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_169
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_169
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_169:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 307: RDPC	rd	%pc, %r11
	.word 0xa190200b  ! 308: WRPR_GL_I	wrpr	%r0, 0x000b, %-
memptr_4_170:
	set 0x60140000, %r31
	.word 0x8581a54e  ! 309: WRCCR_I	wr	%r6, 0x054e, %ccr
DS_4_171:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa5b4c302  ! 310: ALIGNADDRESS	alignaddr	%r19, %r2, %r18
	.word 0xe677e758  ! 311: STX_I	stx	%r19, [%r31 + 0x0758]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936b2258  ! 312: SDIVX_I	sdivx	%r12, 0x0258, %r9
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 313: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_decr_4_173:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa784c011  ! 314: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r17, %-
	.word 0x91a349d4  ! 315: FDIVd	fdivd	%f44, %f20, %f8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956b7b46  ! 316: SDIVX_I	sdivx	%r13, 0xfffffb46, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x81510000  ! 318: RDPR_TICK	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01970  ! 319: FqTOd	dis not found

DS_4_176:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 320: SAVE_R	save	%r31, %r0, %r31
	.word 0xa1a00172  ! 321: FABSq	dis not found

	.word 0xa1a00173  ! 322: FABSq	dis not found

	.word 0xa1902006  ! 323: WRPR_GL_I	wrpr	%r0, 0x0006, %-
change_to_randtl_4_177:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_177:
	.word 0x8f902000  ! 324: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9ba00160  ! 325: FABSq	dis not found

	.word 0x87902326  ! 326: WRPR_TT_I	wrpr	%r0, 0x0326, %tt
	.word 0x87902013  ! 327: WRPR_TT_I	wrpr	%r0, 0x0013, %tt
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_178
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_178
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_178:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 328: RDPC	rd	%pc, %r10
	.word 0x9192a699  ! 329: WRPR_PIL_I	wrpr	%r10, 0x0699, %pil
	.word 0x3e800001  ! 330: BVC	bvc,a	<label_0x1>
memptr_4_179:
	set 0x60140000, %r31
	.word 0x85812088  ! 331: WRCCR_I	wr	%r4, 0x0088, %ccr
splash_cmpr_4_180:
	setx 0x1a5b32d02a91672c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 332: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_181:
	setx 0x3e2fb962ef50e8cf, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 333: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_182:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 334: CASA_R	casa	[%r31] %asi, %r10, %r8
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 335: CASA_R	casa	[%r31] %asi, %r10, %r8
DS_4_184:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f16, %f22, %f10
	.word 0x99b2830d  ! 336: ALIGNADDRESS	alignaddr	%r10, %r13, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 337: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xa1902002  ! 338: WRPR_GL_I	wrpr	%r0, 0x0002, %-
tagged_4_185:
	taddcctv %r17, 0x13d1, %r6
	.word 0xd607e82e  ! 339: LDUW_I	lduw	[%r31 + 0x082e], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_186) + 48, 16, 16)) -> intp(0,0,9)
intvec_4_186:
	.word 0x39400001  ! 340: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe020  ! 341: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 342: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_4_187:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_187:
	.word 0x8f902002  ! 343: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd66fe82e  ! 344: LDSTUB_I	ldstub	%r11, [%r31 + 0x082e]
	.word 0x87802014  ! 345: WRASI_I	wr	%r0, 0x0014, %asi
intveclr_4_188:
	setx 0x17cbc835049d36f8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 346: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_4_189:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_189:
	.word 0x8f902002  ! 347: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_lsu_4_190:
	setx 0x06d3bbebae8cc35b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 348: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 349: Tcc_I	ta	icc_or_xcc, %r0 + 180
debug_4_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 350: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_192) + 32, 16, 16)) -> intp(3,0,8)
intvec_4_192:
	.word 0x39400001  ! 351: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_193
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_193:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 352: RDPC	rd	%pc, %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01974  ! 353: FqTOd	dis not found

change_to_randtl_4_195:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_195:
	.word 0x8f902001  ! 354: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_lsu_4_196:
	setx 0x47bd3166acacc367, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 355: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe0800b40  ! 356: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r16
debug_4_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 357: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_198)+0, 16, 16)) -> intp(4,1,3)
xir_4_198:
	.word 0xa9843165  ! 358: WR_SET_SOFTINT_I	wr	%r16, 0x1165, %set_softint
	.word 0x99902001  ! 359: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_lsu_4_199:
	setx 0x60cd649e590fcf33, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 360: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 361: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01965  ! 362: FqTOd	dis not found

cwp_4_201:
    set user_data_start, %o7
	.word 0x93902000  ! 363: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
change_to_randtl_4_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_202:
	.word 0x8f902001  ! 364: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd937e831  ! 365: STQF_I	-	%f12, [0x0831, %r31]
	.word 0x879020c0  ! 366: WRPR_TT_I	wrpr	%r0, 0x00c0, %tt
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_203:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e013  ! 367: CASA_R	casa	[%r31] %asi, %r19, %r12
tagged_4_204:
	tsubcctv %r10, 0x175d, %r17
	.word 0xd807e831  ! 368: LDUW_I	lduw	[%r31 + 0x0831], %r12
	.word 0xd847c000  ! 369: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0xd81fc000  ! 370: LDD_R	ldd	[%r31 + %r0], %r12
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
	.word 0x97414000  ! 371: RDPC	rd	%pc, %r11
	.word 0x8d90284c  ! 372: WRPR_PSTATE_I	wrpr	%r0, 0x084c, %pstate
splash_lsu_4_206:
	setx 0xa3d28dc0d1619bbf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 373: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 374: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8d903144  ! 375: WRPR_PSTATE_I	wrpr	%r0, 0x1144, %pstate
splash_hpstate_4_207:
	.word 0x81982705  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0705, %hpstate
	rd %pc, %r19
	add %r19, (ivw_4_208-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_208:
	.word 0x91900011  ! 377: WRPR_PIL_R	wrpr	%r0, %r17, %pil
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_209
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_209:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e003  ! 378: CASA_R	casa	[%r31] %asi, %r3, %r13
cwp_4_210:
    set user_data_start, %o7
	.word 0x93902001  ! 379: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d90234b  ! 380: WRPR_PSTATE_I	wrpr	%r0, 0x034b, %pstate
	.word 0xdac7e020  ! 381: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r13
	.word 0xdb27c000  ! 382: STF_R	st	%f13, [%r0, %r31]
change_to_randtl_4_211:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_211:
	.word 0x8f902000  ! 383: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	rd %pc, %r19
	add %r19, (ivw_4_212-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_212:
	.word 0x9193000c  ! 384: WRPR_PIL_R	wrpr	%r12, %r12, %pil
splash_cmpr_4_213:
	setx 0x6e1257ec32bcab25, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 385: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdadfe030  ! 386: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
tagged_4_214:
	tsubcctv %r18, 0x1bf1, %r5
	.word 0xda07e831  ! 387: LDUW_I	lduw	[%r31 + 0x0831], %r13
debug_4_215:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 388: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_4_216:
	setx 0xdb1886b632a01728, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32800001  ! 390: BNE	bne,a	<label_0x1>
	.word 0x91d02033  ! 391: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xdadfe000  ! 392: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	.word 0x87902388  ! 393: WRPR_TT_I	wrpr	%r0, 0x0388, %tt
mondo_4_217:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d94c002  ! 394: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
	.word 0x879023e6  ! 395: WRPR_TT_I	wrpr	%r0, 0x03e6, %tt
splash_tba_4_218:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 396: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d9039fb  ! 397: WRPR_PSTATE_I	wrpr	%r0, 0x19fb, %pstate
splash_cmpr_4_219:
	setx 0xd947d8cb12d2bedf, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7a049ca  ! 399: FDIVd	fdivd	%f32, %f10, %f50
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996a7b1b  ! 400: SDIVX_I	sdivx	%r9, 0xfffffb1b, %r12
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_0:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00a  ! 1: CASA_R	casa	[%r31] %asi, %r10, %r12
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_3_1:
	setx 0x4fd464fb54736d49, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 4: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xd8880e40  ! 5: LDUBA_R	lduba	[%r0, %r0] 0x72, %r12
splash_cmpr_3_2:
	setx 0xbc8388fe23834fdd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 6: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8d7e010  ! 7: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r12
splash_cmpr_3_3:
	setx 0xc44ba90a7321a6f2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 8: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1a049d0  ! 9: FDIVd	fdivd	%f32, %f16, %f16
splash_lsu_3_4:
	setx 0xc434376436f5fa89, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02032  ! 11: Tcc_I	te	icc_or_xcc, %r0 + 50
debug_3_5:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 12: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa7454000  ! 13: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	.word 0xe847c000  ! 14: LDSW_R	ldsw	[%r31 + %r0], %r20
DS_3_6:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 15: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976839b5  ! 16: SDIVX_I	sdivx	%r0, 0xfffff9b5, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_8) + 8, 16, 16)) -> intp(1,0,19)
intvec_3_8:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_3_9:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 18: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_3_10:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 19: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_11:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 20: CASA_R	casa	[%r31] %asi, %r8, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01963  ! 21: FqTOd	dis not found

	.word 0xe08008a0  ! 22: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_3_13:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d944013  ! 23: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
	.word 0xe08008a0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r16
splash_hpstate_3_14:
	.word 0x8198289f  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089f, %hpstate
	.word 0x92f90014  ! 27: SDIVcc_R	sdivcc 	%r4, %r20, %r9
DS_3_15:
	.word 0xa5a089c3  ! 1: FDIVd	fdivd	%f2, %f34, %f18
	.word 0xa1a249c3  ! 1: FDIVd	fdivd	%f40, %f34, %f16
	normalw
	.word 0xa9458000  ! 28: RD_SOFTINT_REG	rd	%softint, %r20
splash_hpstate_3_16:
	.word 0x81982a06  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a06, %hpstate
	.word 0x9550c000  ! 30: RDPR_TT	<illegal instruction>
	.word 0x87802010  ! 31: WRASI_I	wr	%r0, 0x0010, %asi
memptr_3_17:
	set 0x60740000, %r31
	.word 0x8581e046  ! 32: WRCCR_I	wr	%r7, 0x0046, %ccr
tagged_3_18:
	tsubcctv %r24, 0x1c07, %r13
	.word 0xd407e5ee  ! 33: LDUW_I	lduw	[%r31 + 0x05ee], %r10
cwp_3_19:
    set user_data_start, %o7
	.word 0x93902001  ! 34: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
cwp_3_20:
    set user_data_start, %o7
	.word 0x93902000  ! 35: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_21:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 36: CASA_R	casa	[%r31] %asi, %r11, %r10
	.word 0x91d020b5  ! 37: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xa1902002  ! 38: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd477c000  ! 39: STX_R	stx	%r10, [%r31 + %r0]
memptr_3_22:
	set 0x60740000, %r31
	.word 0x8584e70f  ! 40: WRCCR_I	wr	%r19, 0x070f, %ccr
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_23:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 41: CASA_R	casa	[%r31] %asi, %r11, %r10
	.word 0x8780201c  ! 42: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd437fdc5  ! 43: STH_I	sth	%r10, [%r31 + 0xfffffdc5]
pmu_3_24:
	nop
	setx 0xfffffdb6fffffeb6, %g1, %g7
	.word 0xa3800007  ! 44: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd4d7e010  ! 45: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
splash_lsu_3_25:
	setx 0x79678952aad3d6d5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 46: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_26:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 47: CASA_R	casa	[%r31] %asi, %r11, %r10
splash_cmpr_3_27:
	setx 0x86fd11dd54f22caf, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 48: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01966  ! 49: FqTOd	dis not found

	.word 0xd8cfe030  ! 50: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r12
	.word 0xd88804a0  ! 51: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0xa1902001  ! 52: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_cmpr_3_29:
	setx 0xec9386e4d5a78487, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 53: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 54: WRFPRS_I	wr	%r0, 0x0004, %fprs
intveclr_3_30:
	setx 0xc3c8db97217c889e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 55: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01970  ! 56: FqTOd	dis not found

	.word 0x93a4cdcb  ! 57: FdMULq	fdmulq	
	.word 0xa7800003  ! 58: WR_GRAPHICS_STATUS_REG_R	wr	%r0, %r3, %-
	.word 0x30700001  ! 59: BPA	<illegal instruction>
	.word 0x87902278  ! 60: WRPR_TT_I	wrpr	%r0, 0x0278, %tt
	.word 0xa3a01a6d  ! 61: FqTOi	fqtoi	
splash_cmpr_3_33:
	setx 0x44bb32a378d70409, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01963  ! 63: FqTOd	dis not found

splash_cmpr_3_35:
	setx 0x1d4b37cb6ee555b5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 64: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda800b80  ! 65: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r13
splash_lsu_3_36:
	setx 0x93c325b92297f1db, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 66: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_3_37:
	setx 0x55f9c0e5679ac8cf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 67: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa5454000  ! 68: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0xd8cfe020  ! 69: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_38:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 70: RDPC	rd	%pc, %r8
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 71: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa9828011  ! 72: WR_SET_SOFTINT_R	wr	%r10, %r17, %set_softint
	.word 0xa1902004  ! 73: WRPR_GL_I	wrpr	%r0, 0x0004, %-
memptr_3_39:
	set user_data_start, %r31
	.word 0x85842fb5  ! 74: WRCCR_I	wr	%r16, 0x0fb5, %ccr
cwp_3_40:
    set user_data_start, %o7
	.word 0x93902006  ! 75: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87902359  ! 76: WRPR_TT_I	wrpr	%r0, 0x0359, %tt
	.word 0x93d020b2  ! 77: Tcc_I	tne	icc_or_xcc, %r0 + 178
splash_tba_3_41:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 78: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd2dfe010  ! 79: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r9
splash_tba_3_42:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 80: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_3_43:
	setx 0xda414be5377314fa, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 81: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802080  ! 82: WRASI_I	wr	%r0, 0x0080, %asi
change_to_randtl_3_44:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_44:
	.word 0x8f902000  ! 83: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_3_45:
	setx 0x5f40018bf83aea1f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 84: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd2800ae0  ! 85: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r9
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_46:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 86: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_hpstate_3_47:
	.word 0x8198294c  ! 87: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094c, %hpstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 88: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x94acc005  ! 89: ANDNcc_R	andncc 	%r19, %r5, %r10
	.word 0x99454000  ! 90: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
splash_cmpr_3_48:
	setx 0x575cf7664586b41f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 91: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_49:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f16, %f14, %f16
	.word 0x99b4430d  ! 92: ALIGNADDRESS	alignaddr	%r17, %r13, %r12
tagged_3_50:
	tsubcctv %r6, 0x15ce, %r17
	.word 0xe607faea  ! 93: LDUW_I	lduw	[%r31 + 0xfffffaea], %r19
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_51
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_51
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_51:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 94: RDPC	rd	%pc, %r16
tagged_3_52:
	tsubcctv %r10, 0x1b9c, %r21
	.word 0xd607faea  ! 95: LDUW_I	lduw	[%r31 + 0xfffffaea], %r11
	.word 0x87802004  ! 96: WRASI_I	wr	%r0, 0x0004, %asi
debug_3_53:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 97: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_3_54:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 98: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
splash_cmpr_3_55:
	setx 0x1626f77f4ef9e67d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 99: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01964  ! 100: FqTOd	dis not found

splash_cmpr_3_57:
	setx 0x9ea837c07a09b2eb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97a00571  ! 102: FSQRTq	fsqrt	
intveclr_3_58:
	setx 0x91a44e6922f03bc3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 103: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_3_59:
	.word 0x81982387  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0387, %hpstate
	.word 0x8d903084  ! 105: WRPR_PSTATE_I	wrpr	%r0, 0x1084, %pstate
	.word 0xe53fc000  ! 106: STDF_R	std	%f18, [%r0, %r31]
cwp_3_60:
    set user_data_start, %o7
	.word 0x93902004  ! 107: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x26700001  ! 108: BPL	<illegal instruction>
	.word 0x91480000  ! 109: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0xdad804a0  ! 110: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0x2c700001  ! 111: BPNEG	<illegal instruction>
debug_3_61:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 112: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_3_62:
	nop
	setx 0xfffffe01fffff565, %g1, %g7
	.word 0xa3800007  ! 113: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xda800b40  ! 114: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r13
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 115: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x83d02033  ! 116: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xdad004a0  ! 117: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_63
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_63:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 118: RDPC	rd	%pc, %r20
	rd %pc, %r19
	add %r19, (ivw_3_64-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_64:
	.word 0x91940009  ! 119: WRPR_PIL_R	wrpr	%r16, %r9, %pil
	.word 0xe48008a0  ! 120: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x8780208a  ! 121: WRASI_I	wr	%r0, 0x008a, %asi
memptr_3_65:
	set 0x60740000, %r31
	.word 0x8580a1a1  ! 122: WRCCR_I	wr	%r2, 0x01a1, %ccr
cwp_3_66:
    set user_data_start, %o7
	.word 0x93902000  ! 123: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 124: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa984c003  ! 125: WR_SET_SOFTINT_R	wr	%r19, %r3, %set_softint
	.word 0xa1902002  ! 126: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa9a509c0  ! 127: FDIVd	fdivd	%f20, %f0, %f20
debug_3_67:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 128: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_3_68:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 129: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 130: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x87802089  ! 131: WRASI_I	wr	%r0, 0x0089, %asi
debug_3_69:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 132: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
DS_3_70:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xb54b4ba4	! Random illegal ?
	.word 0xe711c014  ! 1: LDQF_R	-	[%r7, %r20], %f19
	.word 0x9ba30826  ! 133: FADDs	fadds	%f12, %f6, %f13
	.word 0xd0d004a0  ! 134: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	rd %pc, %r19
	add %r19, (ivw_3_71-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_71:
	.word 0x91900014  ! 135: WRPR_PIL_R	wrpr	%r0, %r20, %pil
splash_tba_3_72:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 136: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_3_73:
	setx 0x7b81c90711c968d8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 137: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 138: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x93a0016d  ! 139: FABSq	dis not found

	.word 0x87802004  ! 140: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93480000  ! 141: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
debug_3_74:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 142: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd027eaa8  ! 143: STW_I	stw	%r8, [%r31 + 0x0aa8]
splash_lsu_3_75:
	setx 0xd89827d748ea3e41, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 144: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_76
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_76
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_76:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 145: RDPC	rd	%pc, %r9
debug_3_77:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 146: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802020  ! 147: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8790228d  ! 148: WRPR_TT_I	wrpr	%r0, 0x028d, %tt
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_78) + 40, 16, 16)) -> intp(2,0,28)
intvec_3_78:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 150: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_3_79:
	setx 0xd740c1f573b8a0ce, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 151: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd68804a0  ! 152: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
mondo_3_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d908007  ! 153: WRPR_WSTATE_R	wrpr	%r2, %r7, %wstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_81:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e001  ! 154: CASA_R	casa	[%r31] %asi, %r1, %r11
DS_3_82:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 155: SAVE_R	save	%r31, %r0, %r31
	.word 0xa282c009  ! 156: ADDcc_R	addcc 	%r11, %r9, %r17
splash_cmpr_3_83:
	setx 0xcdbec9ecfc4e9310, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 157: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd86feaa8  ! 158: LDSTUB_I	ldstub	%r12, [%r31 + 0x0aa8]
splash_cmpr_3_84:
	setx 0x11f95a1896f06bf5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 159: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd897e010  ! 160: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_85
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_85:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 161: RDPC	rd	%pc, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r16
mondo_3_86:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d92400b  ! 163: WRPR_WSTATE_R	wrpr	%r9, %r11, %wstate
	.word 0x8d903616  ! 164: WRPR_PSTATE_I	wrpr	%r0, 0x1616, %pstate
	.word 0x2e700001  ! 165: BPVS	<illegal instruction>
	.word 0xe097e010  ! 166: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r16
donret_3_87:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_87-donret_3_87-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_87:
	.word 0xe0ffeaa8  ! 167: SWAPA_I	swapa	%r16, [%r31 + 0x0aa8] %asi
	.word 0x87802010  ! 168: WRASI_I	wr	%r0, 0x0010, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_88)+40, 16, 16)) -> intp(3,1,3)
xir_3_88:
	.word 0xa981fe95  ! 169: WR_SET_SOFTINT_I	wr	%r7, 0x1e95, %set_softint
splash_hpstate_3_89:
	.word 0x819820dd  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00dd, %hpstate
DS_3_90:
	.word 0x99a009c8  ! 1: FDIVd	fdivd	%f0, %f8, %f12
	.word 0xf5487a1f	! Random illegal ?
	.word 0xa7a449d3  ! 1: FDIVd	fdivd	%f48, %f50, %f50
	.word 0x95a08834  ! 171: FADDs	fadds	%f2, %f20, %f10
	.word 0xad84e129  ! 172: WR_SOFTINT_REG_I	wr	%r19, 0x0129, %softint
	.word 0x879022b8  ! 173: WRPR_TT_I	wrpr	%r0, 0x02b8, %tt
	.word 0xa7828001  ! 174: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r1, %-
donret_3_92:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_92-donret_3_92), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_92:
	.word 0xdafff1ca  ! 175: SWAPA_I	swapa	%r13, [%r31 + 0xfffff1ca] %asi
	.word 0xdac00e40  ! 176: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r13
intveclr_3_93:
	setx 0x058e4f977852edcd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 177: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_3_94:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d92400d  ! 178: WRPR_WSTATE_R	wrpr	%r9, %r13, %wstate
DS_3_95:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 179: RESTORE_R	restore	%r31, %r0, %r31
tagged_3_96:
	tsubcctv %r19, 0x1690, %r11
	.word 0xda07f1ca  ! 180: LDUW_I	lduw	[%r31 + 0xfffff1ca], %r13
splash_tba_3_97:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 181: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_3_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 182: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xab822997  ! 183: WR_CLEAR_SOFTINT_I	wr	%r8, 0x0997, %clear_softint
change_to_randtl_3_99:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_99:
	.word 0x8f902002  ! 184: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_3_100:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 185: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_3_101:
	taddcctv %r25, 0x128e, %r1
	.word 0xda07fbf7  ! 186: LDUW_I	lduw	[%r31 + 0xfffffbf7], %r13
	rd %pc, %r19
	add %r19, (ivw_3_102-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_102:
	.word 0x91934005  ! 187: WRPR_PIL_R	wrpr	%r13, %r5, %pil
	.word 0x87802088  ! 188: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d90378e  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x178e, %pstate
debug_3_103:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 190: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xda97e010  ! 191: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r13
splash_lsu_3_104:
	setx 0x1e80e98e39a74653, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 192: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_105:
	setx 0xde5c1f7084b44aff, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 193: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_106:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 194: CASA_R	casa	[%r31] %asi, %r20, %r13
	.word 0x87802014  ! 195: WRASI_I	wr	%r0, 0x0014, %asi
debug_3_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 196: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_3_108:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 197: SAVE_R	save	%r31, %r0, %r31
	.word 0x98f872c5  ! 198: SDIVcc_I	sdivcc 	%r1, 0xfffff2c5, %r12
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 199: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903c17  ! 200: WRPR_PSTATE_I	wrpr	%r0, 0x1c17, %pstate
memptr_3_109:
	set 0x60740000, %r31
	.word 0x858476ff  ! 201: WRCCR_I	wr	%r17, 0x16ff, %ccr
	.word 0x93a00167  ! 202: FABSq	dis not found

splash_cmpr_3_110:
	setx 0x17710175c47f2cd0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 203: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8800c60  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r12
	.word 0xa6817e18  ! 205: ADDcc_I	addcc 	%r5, 0xfffffe18, %r19
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_111
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_111
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_111:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 206: RDPC	rd	%pc, %r12
	.word 0x81510000  ! 207: RDPR_TICK	<illegal instruction>
	.word 0x87902323  ! 208: WRPR_TT_I	wrpr	%r0, 0x0323, %tt
	.word 0x93d02033  ! 209: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xe8d004a0  ! 210: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01962  ! 211: FqTOd	dis not found

DS_3_113:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa7a449c3  ! 1: FDIVd	fdivd	%f48, %f34, %f50
	normalw
	.word 0x9b458000  ! 212: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xd66fe43a  ! 213: LDSTUB_I	ldstub	%r11, [%r31 + 0x043a]
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_114
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_114:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 214: RDPC	rd	%pc, %r12
intveclr_3_115:
	setx 0x5025e9c54a6de259, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 215: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa781a44a  ! 216: WR_GRAPHICS_STATUS_REG_I	wr	%r6, 0x044a, %-
debug_3_116:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 217: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa06d3b40  ! 218: UDIVX_I	udivx 	%r20, 0xfffffb40, %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956cb4a5  ! 219: SDIVX_I	sdivx	%r18, 0xfffff4a5, %r10
	.word 0x36700001  ! 220: BPGE	<illegal instruction>
	.word 0xd0880e60  ! 221: LDUBA_R	lduba	[%r0, %r0] 0x73, %r8
	.word 0x87802055  ! 222: WRASI_I	wr	%r0, 0x0055, %asi
splash_tba_3_118:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 223: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_3_119:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9ba109d0  ! 1: FDIVd	fdivd	%f4, %f16, %f44
	.word 0xd1124008  ! 1: LDQF_R	-	[%r9, %r8], %f8
	.word 0x97a50834  ! 224: FADDs	fadds	%f20, %f20, %f11
mondo_3_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d944014  ! 225: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0xd4c804a0  ! 226: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
DS_3_121:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 227: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd497e030  ! 228: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
intveclr_3_122:
	setx 0xa97782c5543090e8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 229: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_3_123:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9ba00541  ! 1: FSQRTd	fsqrt	
	.word 0x9ba44824  ! 230: FADDs	fadds	%f17, %f4, %f13
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_124)+32, 16, 16)) -> intp(3,1,3)
xir_3_124:
	.word 0xa984f89b  ! 231: WR_SET_SOFTINT_I	wr	%r19, 0x189b, %set_softint
DS_3_125:
	.word 0x93a0c9d0  ! 1: FDIVd	fdivd	%f34, %f16, %f40
	.word 0xd1328008  ! 1: STQF_R	-	%f8, [%r8, %r10]
	normalw
	.word 0xa7458000  ! 232: RD_SOFTINT_REG	rd	%softint, %r19
mondo_3_126:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d918011  ! 233: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
	.word 0x87802080  ! 234: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xe49004a0  ! 235: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 236: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902e70  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x0e70, %pstate
	.word 0xe527c000  ! 238: STF_R	st	%f18, [%r0, %r31]
mondo_3_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d924011  ! 239: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
	.word 0x9350c000  ! 240: RDPR_TT	<illegal instruction>
	.word 0x93480000  ! 241: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_128
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_128:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 242: RDPC	rd	%pc, %r16
mondo_3_129:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d900000  ! 243: WRPR_WSTATE_R	wrpr	%r0, %r0, %wstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_130:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r19
	setx 0x1997e20b32753855, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_131:
	.word 0x39400001  ! 245: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_3_132:
	setx 0x47f88e6834300ebd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 246: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_3_133:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 247: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_134) + 0, 16, 16)) -> intp(6,0,2)
intvec_3_134:
	.word 0x39400001  ! 248: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 249: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe68804a0  ! 250: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
splash_hpstate_3_135:
	.word 0x819829ae  ! 251: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09ae, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01964  ! 252: FqTOd	dis not found

	.word 0x95a00160  ! 253: FABSq	dis not found

	.word 0xd73fc000  ! 254: STDF_R	std	%f11, [%r0, %r31]
	.word 0x8d902ef8  ! 255: WRPR_PSTATE_I	wrpr	%r0, 0x0ef8, %pstate
	.word 0x8d9027e4  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x07e4, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96b3674  ! 257: SDIVX_I	sdivx	%r12, 0xfffff674, %r20
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802020  ! 259: WRASI_I	wr	%r0, 0x0020, %asi
debug_3_138:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 260: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r12
debug_3_139:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 262: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab84c000  ! 263: WR_CLEAR_SOFTINT_R	wr	%r19, %r0, %clear_softint
debug_3_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 264: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x879023b5  ! 265: WRPR_TT_I	wrpr	%r0, 0x03b5, %tt
DS_3_141:
	.word 0x91a2c9c5  ! 1: FDIVd	fdivd	%f42, %f36, %f8
	.word 0xbfe7c000  ! 266: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_142) + 16, 16, 16)) -> intp(1,0,25)
intvec_3_142:
	.word 0x39400001  ! 267: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01966  ! 268: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 269: LDX_R	ldx	[%r31 + %r0], %r12
memptr_3_144:
	set user_data_start, %r31
	.word 0x85852ee9  ! 270: WRCCR_I	wr	%r20, 0x0ee9, %ccr
debug_3_145:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 271: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa984c005  ! 272: WR_SET_SOFTINT_R	wr	%r19, %r5, %set_softint
	.word 0x81510000  ! 273: RDPR_TICK	<illegal instruction>
memptr_3_146:
	set 0x60540000, %r31
	.word 0x85832ee6  ! 274: WRCCR_I	wr	%r12, 0x0ee6, %ccr
	.word 0xa1902002  ! 275: WRPR_GL_I	wrpr	%r0, 0x0002, %-
memptr_3_147:
	set user_data_start, %r31
	.word 0x85836fc4  ! 276: WRCCR_I	wr	%r13, 0x0fc4, %ccr
	.word 0x8780201c  ! 277: WRASI_I	wr	%r0, 0x001c, %asi
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_148
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_148:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 278: RDPC	rd	%pc, %r19
pmu_3_149:
	nop
	setx 0xfffff790fffff5e4, %g1, %g7
	.word 0xa3800007  ! 279: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_3_150:
	setx 0x867be565e3622c77, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 280: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196a  ! 281: FqTOd	dis not found

splash_cmpr_3_152:
	setx 0x5060c3422a8905c5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 282: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902005  ! 283: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xd68008a0  ! 284: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
debug_3_153:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 285: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
splash_hpstate_3_154:
	.word 0x8198241e  ! 286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041e, %hpstate
splash_hpstate_3_155:
	.word 0x8198214c  ! 287: WRHPR_HPSTATE_I	wrhpr	%r0, 0x014c, %hpstate
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_156
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_156
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_156:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 288: RDPC	rd	%pc, %r18
splash_tba_3_157:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 289: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_158
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_158
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_158:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 290: RDPC	rd	%pc, %r10
memptr_3_159:
	set user_data_start, %r31
	.word 0x8582a5d0  ! 291: WRCCR_I	wr	%r10, 0x05d0, %ccr
	.word 0x8d902ba1  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x0ba1, %pstate
	.word 0x99480000  ! 293: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
debug_3_160:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 294: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d9038a9  ! 295: WRPR_PSTATE_I	wrpr	%r0, 0x18a9, %pstate
memptr_3_161:
	set 0x60140000, %r31
	.word 0x858466bb  ! 296: WRCCR_I	wr	%r17, 0x06bb, %ccr
	.word 0x3c700001  ! 297: BPPOS	<illegal instruction>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_162:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 298: CASA_R	casa	[%r31] %asi, %r17, %r12
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_163
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_163:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 299: RDPC	rd	%pc, %r8
splash_cmpr_3_164:
	setx 0xc5240509e13f2cd6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 300: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902968  ! 301: WRPR_PSTATE_I	wrpr	%r0, 0x0968, %pstate
debug_3_165:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 302: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_166)+24, 16, 16)) -> intp(3,1,3)
xir_3_166:
	.word 0xa984b06b  ! 303: WR_SET_SOFTINT_I	wr	%r18, 0x106b, %set_softint
splash_cmpr_3_167:
	setx 0x2ba19a1b1ca93a3e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 304: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 305: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_3_168:
	tsubcctv %r19, 0x1afb, %r10
	.word 0xd807e4ae  ! 306: LDUW_I	lduw	[%r31 + 0x04ae], %r12
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_169
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_169
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_169:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 307: RDPC	rd	%pc, %r9
	.word 0xa190200f  ! 308: WRPR_GL_I	wrpr	%r0, 0x000f, %-
memptr_3_170:
	set 0x60540000, %r31
	.word 0x8580716b  ! 309: WRCCR_I	wr	%r1, 0x116b, %ccr
DS_3_171:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa5b40313  ! 310: ALIGNADDRESS	alignaddr	%r16, %r19, %r18
	.word 0xe677e758  ! 311: STX_I	stx	%r19, [%r31 + 0x0758]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976b253d  ! 312: SDIVX_I	sdivx	%r12, 0x053d, %r11
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 313: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa781c011  ! 314: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r17, %-
	.word 0xa7a409d2  ! 315: FDIVd	fdivd	%f16, %f18, %f50
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916b684b  ! 316: SDIVX_I	sdivx	%r13, 0x084b, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x81510000  ! 318: RDPR_TICK	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01964  ! 319: FqTOd	dis not found

DS_3_176:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 320: SAVE_R	save	%r31, %r0, %r31
	.word 0x93a00163  ! 321: FABSq	dis not found

	.word 0xa9a00172  ! 322: FABSq	dis not found

	.word 0xa1902008  ! 323: WRPR_GL_I	wrpr	%r0, 0x0008, %-
change_to_randtl_3_177:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_177:
	.word 0x8f902000  ! 324: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x95a00172  ! 325: FABSq	dis not found

	.word 0x87902371  ! 326: WRPR_TT_I	wrpr	%r0, 0x0371, %tt
	.word 0x879021a5  ! 327: WRPR_TT_I	wrpr	%r0, 0x01a5, %tt
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_178
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_178
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_178:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 328: RDPC	rd	%pc, %r8
	.word 0x91917d08  ! 329: WRPR_PIL_I	wrpr	%r5, 0x1d08, %pil
	.word 0x3e800001  ! 330: BVC	bvc,a	<label_0x1>
memptr_3_179:
	set 0x60740000, %r31
	.word 0x8580f964  ! 331: WRCCR_I	wr	%r3, 0x1964, %ccr
splash_cmpr_3_180:
	setx 0x3602e7371e9b3942, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 332: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_181:
	setx 0xc65eb5c2c2b37504, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 333: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_182:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 334: CASA_R	casa	[%r31] %asi, %r10, %r8
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 335: CASA_R	casa	[%r31] %asi, %r10, %r8
DS_3_184:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f20, %f12, %f14
	.word 0xa1b4c304  ! 336: ALIGNADDRESS	alignaddr	%r19, %r4, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 337: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xa190200b  ! 338: WRPR_GL_I	wrpr	%r0, 0x000b, %-
tagged_3_185:
	taddcctv %r24, 0x1122, %r22
	.word 0xd607e82e  ! 339: LDUW_I	lduw	[%r31 + 0x082e], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_186) + 0, 16, 16)) -> intp(2,0,22)
intvec_3_186:
	.word 0x39400001  ! 340: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe010  ! 341: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 342: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_3_187:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_187:
	.word 0x8f902003  ! 343: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd66fe82e  ! 344: LDSTUB_I	ldstub	%r11, [%r31 + 0x082e]
	.word 0x87802004  ! 345: WRASI_I	wr	%r0, 0x0004, %asi
intveclr_3_188:
	setx 0x28f5a245a21a9693, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 346: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_3_189:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_189:
	.word 0x8f902001  ! 347: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_lsu_3_190:
	setx 0xdae9098abe21ca65, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 348: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 349: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_3_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 350: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_192) + 32, 16, 16)) -> intp(0,0,14)
intvec_3_192:
	.word 0x39400001  ! 351: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_193
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_193:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 352: RDPC	rd	%pc, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196c  ! 353: FqTOd	dis not found

change_to_randtl_3_195:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_195:
	.word 0x8f902003  ! 354: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_lsu_3_196:
	setx 0xcf83d9c1f9880ccf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 355: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe0800b40  ! 356: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r16
debug_3_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 357: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_198)+8, 16, 16)) -> intp(3,1,3)
xir_3_198:
	.word 0xa984e552  ! 358: WR_SET_SOFTINT_I	wr	%r19, 0x0552, %set_softint
	.word 0x99902000  ! 359: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
splash_lsu_3_199:
	setx 0x2beb518c94d48183, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 360: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 361: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01970  ! 362: FqTOd	dis not found

cwp_3_201:
    set user_data_start, %o7
	.word 0x93902000  ! 363: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
change_to_randtl_3_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_202:
	.word 0x8f902002  ! 364: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd937e831  ! 365: STQF_I	-	%f12, [0x0831, %r31]
	.word 0x8790204c  ! 366: WRPR_TT_I	wrpr	%r0, 0x004c, %tt
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_203:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e013  ! 367: CASA_R	casa	[%r31] %asi, %r19, %r12
tagged_3_204:
	tsubcctv %r19, 0x1e90, %r5
	.word 0xd807e831  ! 368: LDUW_I	lduw	[%r31 + 0x0831], %r12
	.word 0xd847c000  ! 369: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0xd81fc000  ! 370: LDD_R	ldd	[%r31 + %r0], %r12
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_205
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_205:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 371: RDPC	rd	%pc, %r17
	.word 0x8d903094  ! 372: WRPR_PSTATE_I	wrpr	%r0, 0x1094, %pstate
splash_lsu_3_206:
	setx 0xd831d92b6030985d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 373: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780208b  ! 374: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x8d903c25  ! 375: WRPR_PSTATE_I	wrpr	%r0, 0x1c25, %pstate
splash_hpstate_3_207:
	.word 0x81982344  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0344, %hpstate
	rd %pc, %r19
	add %r19, (ivw_3_208-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_208:
	.word 0x91934006  ! 377: WRPR_PIL_R	wrpr	%r13, %r6, %pil
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_209
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_209:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e003  ! 378: CASA_R	casa	[%r31] %asi, %r3, %r13
cwp_3_210:
    set user_data_start, %o7
	.word 0x93902006  ! 379: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d9033c2  ! 380: WRPR_PSTATE_I	wrpr	%r0, 0x13c2, %pstate
	.word 0xdac7e010  ! 381: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r13
	.word 0xdb27c000  ! 382: STF_R	st	%f13, [%r0, %r31]
change_to_randtl_3_211:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_211:
	.word 0x8f902001  ! 383: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	rd %pc, %r19
	add %r19, (ivw_3_212-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_212:
	.word 0x91908010  ! 384: WRPR_PIL_R	wrpr	%r2, %r16, %pil
splash_cmpr_3_213:
	setx 0xa134a0061f6b0bb8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 385: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdadfe030  ! 386: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
tagged_3_214:
	tsubcctv %r14, 0x1a86, %r7
	.word 0xda07e831  ! 387: LDUW_I	lduw	[%r31 + 0x0831], %r13
debug_3_215:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 388: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_3_216:
	setx 0x8947b73cb34cc3eb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32800001  ! 390: BNE	bne,a	<label_0x1>
	.word 0x93d020b3  ! 391: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0xdadfe010  ! 392: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0x879021fa  ! 393: WRPR_TT_I	wrpr	%r0, 0x01fa, %tt
mondo_3_217:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d950009  ! 394: WRPR_WSTATE_R	wrpr	%r20, %r9, %wstate
	.word 0x879020f4  ! 395: WRPR_TT_I	wrpr	%r0, 0x00f4, %tt
splash_tba_3_218:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 396: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d903856  ! 397: WRPR_PSTATE_I	wrpr	%r0, 0x1856, %pstate
splash_cmpr_3_219:
	setx 0xc29f640f096c9b6e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95a289d3  ! 399: FDIVd	fdivd	%f10, %f50, %f10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56920a1  ! 400: SDIVX_I	sdivx	%r4, 0x00a1, %r18
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_0:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00a  ! 1: CASA_R	casa	[%r31] %asi, %r10, %r12
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 2: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_2_1:
	setx 0xb8ff85d74d9d7a15, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902002  ! 4: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd8880e60  ! 5: LDUBA_R	lduba	[%r0, %r0] 0x73, %r12
splash_cmpr_2_2:
	setx 0x6f599e1e590a555f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 6: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8d7e000  ! 7: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
splash_cmpr_2_3:
	setx 0x944efda5dc9b3632, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 8: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9a409c3  ! 9: FDIVd	fdivd	%f16, %f34, %f20
splash_lsu_2_4:
	setx 0x0eb9192d0cb33947, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 11: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_2_5:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 12: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x97454000  ! 13: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0xe847c000  ! 14: LDSW_R	ldsw	[%r31 + %r0], %r20
DS_2_6:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 15: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7687ea3  ! 16: SDIVX_I	sdivx	%r1, 0xfffffea3, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_8) + 48, 16, 16)) -> intp(3,0,23)
intvec_2_8:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_2_9:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 18: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_2_10:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 19: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_11:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 20: CASA_R	casa	[%r31] %asi, %r8, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01971  ! 21: FqTOd	dis not found

	.word 0xe08008a0  ! 22: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_2_13:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d92000b  ! 23: WRPR_WSTATE_R	wrpr	%r8, %r11, %wstate
	.word 0xe0800c20  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r16
splash_hpstate_2_14:
	.word 0x8198238e  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038e, %hpstate
	.word 0x98fa8002  ! 27: SDIVcc_R	sdivcc 	%r10, %r2, %r12
DS_2_15:
	.word 0x95a109c7  ! 1: FDIVd	fdivd	%f4, %f38, %f10
	.word 0xa1a409d1  ! 1: FDIVd	fdivd	%f16, %f48, %f16
	normalw
	.word 0xa5458000  ! 28: RD_SOFTINT_REG	rd	%softint, %r18
splash_hpstate_2_16:
	.word 0x81982ecd  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecd, %hpstate
	.word 0x9350c000  ! 30: RDPR_TT	<illegal instruction>
	.word 0x87802010  ! 31: WRASI_I	wr	%r0, 0x0010, %asi
memptr_2_17:
	set 0x60140000, %r31
	.word 0x8581bbf9  ! 32: WRCCR_I	wr	%r6, 0x1bf9, %ccr
tagged_2_18:
	tsubcctv %r8, 0x1986, %r15
	.word 0xd407e5ee  ! 33: LDUW_I	lduw	[%r31 + 0x05ee], %r10
cwp_2_19:
    set user_data_start, %o7
	.word 0x93902006  ! 34: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
cwp_2_20:
    set user_data_start, %o7
	.word 0x93902003  ! 35: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_21:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 36: CASA_R	casa	[%r31] %asi, %r11, %r10
	.word 0x91d02033  ! 37: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa190200c  ! 38: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xd477c000  ! 39: STX_R	stx	%r10, [%r31 + %r0]
memptr_2_22:
	set 0x60740000, %r31
	.word 0x858064b1  ! 40: WRCCR_I	wr	%r1, 0x04b1, %ccr
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_23:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 41: CASA_R	casa	[%r31] %asi, %r11, %r10
	.word 0x8780208a  ! 42: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0xd437fdc5  ! 43: STH_I	sth	%r10, [%r31 + 0xfffffdc5]
pmu_2_24:
	nop
	setx 0xfffffb6bfffff0dc, %g1, %g7
	.word 0xa3800007  ! 44: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd4d7e030  ! 45: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
splash_lsu_2_25:
	setx 0x047047906a835979, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 46: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_26:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 47: CASA_R	casa	[%r31] %asi, %r11, %r10
splash_cmpr_2_27:
	setx 0xd4cb540d47240760, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 48: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01969  ! 49: FqTOd	dis not found

	.word 0xd8cfe030  ! 50: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r12
	.word 0xd88804a0  ! 51: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0xa1902000  ! 52: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_cmpr_2_29:
	setx 0x83f3115ecf8d28f1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 53: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 54: WRFPRS_I	wr	%r0, 0x0004, %fprs
intveclr_2_30:
	setx 0x22ba19fa9c6a7cc1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 55: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01971  ! 56: FqTOd	dis not found

	.word 0xa7a48dc7  ! 57: FdMULq	fdmulq	
	.word 0xa780c003  ! 58: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r3, %-
	.word 0x30700001  ! 59: BPA	<illegal instruction>
	.word 0x87902365  ! 60: WRPR_TT_I	wrpr	%r0, 0x0365, %tt
	.word 0xa5a01a6c  ! 61: FqTOi	fqtoi	
splash_cmpr_2_33:
	setx 0x2b0e5dfe8a767d2b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01974  ! 63: FqTOd	dis not found

splash_cmpr_2_35:
	setx 0x919adc7a558b2aa6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 64: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda8008a0  ! 65: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_lsu_2_36:
	setx 0x8dcabe0109a81057, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 66: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_2_37:
	setx 0x6037b452b596f5db, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 67: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa3454000  ! 68: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0xd8cfe020  ! 69: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
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
	.word 0x93414000  ! 70: RDPC	rd	%pc, %r9
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 71: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa981c005  ! 72: WR_SET_SOFTINT_R	wr	%r7, %r5, %set_softint
	.word 0xa1902009  ! 73: WRPR_GL_I	wrpr	%r0, 0x0009, %-
memptr_2_39:
	set user_data_start, %r31
	.word 0x8584ff85  ! 74: WRCCR_I	wr	%r19, 0x1f85, %ccr
cwp_2_40:
    set user_data_start, %o7
	.word 0x93902003  ! 75: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87902177  ! 76: WRPR_TT_I	wrpr	%r0, 0x0177, %tt
	.word 0x93d020b2  ! 77: Tcc_I	tne	icc_or_xcc, %r0 + 178
splash_tba_2_41:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 78: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd2dfe030  ! 79: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r9
splash_tba_2_42:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 80: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_2_43:
	setx 0xd21732b14faa036f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 81: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780208b  ! 82: WRASI_I	wr	%r0, 0x008b, %asi
change_to_randtl_2_44:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_44:
	.word 0x8f902000  ! 83: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_2_45:
	setx 0x5c5d370d89ff0deb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 84: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 85: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_46:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 86: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_hpstate_2_47:
	.word 0x81982557  ! 87: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0557, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 88: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x98ac4002  ! 89: ANDNcc_R	andncc 	%r17, %r2, %r12
	.word 0xa9454000  ! 90: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
splash_cmpr_2_48:
	setx 0x06a5a2c040ae4326, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 91: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_49:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f0, %f16, %f14
	.word 0x95b40311  ! 92: ALIGNADDRESS	alignaddr	%r16, %r17, %r10
tagged_2_50:
	tsubcctv %r9, 0x1f87, %r11
	.word 0xe607faea  ! 93: LDUW_I	lduw	[%r31 + 0xfffffaea], %r19
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
	.word 0x95414000  ! 94: RDPC	rd	%pc, %r10
tagged_2_52:
	tsubcctv %r6, 0x10f6, %r23
	.word 0xd607faea  ! 95: LDUW_I	lduw	[%r31 + 0xfffffaea], %r11
	.word 0x8780201c  ! 96: WRASI_I	wr	%r0, 0x001c, %asi
debug_2_53:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 97: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_2_54:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 98: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
splash_cmpr_2_55:
	setx 0xc8f4fd6af843a498, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 99: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01974  ! 100: FqTOd	dis not found

splash_cmpr_2_57:
	setx 0x3f789cd6979c7e16, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1a00568  ! 102: FSQRTq	fsqrt	
intveclr_2_58:
	setx 0x1a1f8fe6171b0a5b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 103: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_59:
	.word 0x8198264e  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x064e, %hpstate
	.word 0x8d903661  ! 105: WRPR_PSTATE_I	wrpr	%r0, 0x1661, %pstate
	.word 0xe53fc000  ! 106: STDF_R	std	%f18, [%r0, %r31]
cwp_2_60:
    set user_data_start, %o7
	.word 0x93902006  ! 107: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x26700001  ! 108: BPL	<illegal instruction>
	.word 0xa1480000  ! 109: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0xdad80e60  ! 110: LDXA_R	ldxa	[%r0, %r0] 0x73, %r13
	.word 0x2c700001  ! 111: BPNEG	<illegal instruction>
debug_2_61:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 112: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_2_62:
	nop
	setx 0xfffffd6efffff31b, %g1, %g7
	.word 0xa3800007  ! 113: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xda8008a0  ! 114: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 115: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d020b2  ! 116: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xdad00e80  ! 117: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r13
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_63
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_63:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 118: RDPC	rd	%pc, %r12
	rd %pc, %r19
	add %r19, (ivw_2_64-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_64:
	.word 0x9194c008  ! 119: WRPR_PIL_R	wrpr	%r19, %r8, %pil
	.word 0xe48008a0  ! 120: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x87802088  ! 121: WRASI_I	wr	%r0, 0x0088, %asi
memptr_2_65:
	set 0x60740000, %r31
	.word 0x8582f490  ! 122: WRCCR_I	wr	%r11, 0x1490, %ccr
cwp_2_66:
    set user_data_start, %o7
	.word 0x93902005  ! 123: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 124: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9834000  ! 125: WR_SET_SOFTINT_R	wr	%r13, %r0, %set_softint
	.word 0xa190200a  ! 126: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x95a289c5  ! 127: FDIVd	fdivd	%f10, %f36, %f10
debug_2_67:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 128: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_2_68:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 129: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 130: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x8780208a  ! 131: WRASI_I	wr	%r0, 0x008a, %asi
debug_2_69:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 132: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
DS_2_70:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdd45f56a	! Random illegal ?
	.word 0xd7144008  ! 1: LDQF_R	-	[%r17, %r8], %f11
	.word 0x95a4c834  ! 133: FADDs	fadds	%f19, %f20, %f10
	.word 0xd0d004a0  ! 134: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	rd %pc, %r19
	add %r19, (ivw_2_71-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_71:
	.word 0x91940000  ! 135: WRPR_PIL_R	wrpr	%r16, %r0, %pil
splash_tba_2_72:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 136: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_2_73:
	setx 0xc8c6f4a68863ac52, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 137: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 138: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xa1a0016c  ! 139: FABSq	dis not found

	.word 0x87802004  ! 140: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9b480000  ! 141: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
debug_2_74:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 142: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd027eaa8  ! 143: STW_I	stw	%r8, [%r31 + 0x0aa8]
splash_lsu_2_75:
	setx 0xbbbc05e611919fbf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 144: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_76
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_76
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_76:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 145: RDPC	rd	%pc, %r16
debug_2_77:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 146: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802058  ! 147: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8790205f  ! 148: WRPR_TT_I	wrpr	%r0, 0x005f, %tt
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_78) + 48, 16, 16)) -> intp(5,0,30)
intvec_2_78:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 150: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_2_79:
	setx 0x623908a45d646da3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 151: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd68804a0  ! 152: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
mondo_2_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d920006  ! 153: WRPR_WSTATE_R	wrpr	%r8, %r6, %wstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_81:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e001  ! 154: CASA_R	casa	[%r31] %asi, %r1, %r11
DS_2_82:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 155: SAVE_R	save	%r31, %r0, %r31
	.word 0x92848010  ! 156: ADDcc_R	addcc 	%r18, %r16, %r9
splash_cmpr_2_83:
	setx 0xe98fc311f80612ff, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 157: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd86feaa8  ! 158: LDSTUB_I	ldstub	%r12, [%r31 + 0x0aa8]
splash_cmpr_2_84:
	setx 0x3e6063029fbe621e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 159: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd897e000  ! 160: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_85
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_85:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 161: RDPC	rd	%pc, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r16
mondo_2_86:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d930004  ! 163: WRPR_WSTATE_R	wrpr	%r12, %r4, %wstate
	.word 0x8d9029cf  ! 164: WRPR_PSTATE_I	wrpr	%r0, 0x09cf, %pstate
	.word 0x2e700001  ! 165: BPVS	<illegal instruction>
	.word 0xe097e020  ! 166: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r16
donret_2_87:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_87-donret_2_87-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_87:
	.word 0xe0ffeaa8  ! 167: SWAPA_I	swapa	%r16, [%r31 + 0x0aa8] %asi
	.word 0x87802089  ! 168: WRASI_I	wr	%r0, 0x0089, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_88)+56, 16, 16)) -> intp(2,1,3)
xir_2_88:
	.word 0xa981f0e2  ! 169: WR_SET_SOFTINT_I	wr	%r7, 0x10e2, %set_softint
splash_hpstate_2_89:
	.word 0x81982e9e  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9e, %hpstate
DS_2_90:
	.word 0xa7a0c9c5  ! 1: FDIVd	fdivd	%f34, %f36, %f50
	.word 0x9f54d4cf	! Random illegal ?
	.word 0xa7a449c2  ! 1: FDIVd	fdivd	%f48, %f2, %f50
	.word 0x99a2082d  ! 171: FADDs	fadds	%f8, %f13, %f12
	.word 0xad81743e  ! 172: WR_SOFTINT_REG_I	wr	%r5, 0x143e, %softint
	.word 0x879020a0  ! 173: WRPR_TT_I	wrpr	%r0, 0x00a0, %tt
	.word 0xa782800c  ! 174: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r12, %-
donret_2_92:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_92-donret_2_92), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_92:
	.word 0xdafff1ca  ! 175: SWAPA_I	swapa	%r13, [%r31 + 0xfffff1ca] %asi
	.word 0xdac004a0  ! 176: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
intveclr_2_93:
	setx 0x97bf74818531e6e6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 177: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_94:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d944010  ! 178: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
DS_2_95:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 179: RESTORE_R	restore	%r31, %r0, %r31
tagged_2_96:
	tsubcctv %r21, 0x1c7d, %r26
	.word 0xda07f1ca  ! 180: LDUW_I	lduw	[%r31 + 0xfffff1ca], %r13
splash_tba_2_97:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 181: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_2_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 182: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xab80af30  ! 183: WR_CLEAR_SOFTINT_I	wr	%r2, 0x0f30, %clear_softint
change_to_randtl_2_99:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_99:
	.word 0x8f902000  ! 184: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_2_100:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 185: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_2_101:
	taddcctv %r3, 0x1b8e, %r19
	.word 0xda07fbf7  ! 186: LDUW_I	lduw	[%r31 + 0xfffffbf7], %r13
	rd %pc, %r19
	add %r19, (ivw_2_102-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_102:
	.word 0x91948013  ! 187: WRPR_PIL_R	wrpr	%r18, %r19, %pil
	.word 0x87802089  ! 188: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d903714  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x1714, %pstate
debug_2_103:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 190: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xda97e020  ! 191: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r13
splash_lsu_2_104:
	setx 0x91cdd30fb75f0655, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 192: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_105:
	setx 0x70c41ad24b3b1824, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 193: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_106:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 194: CASA_R	casa	[%r31] %asi, %r20, %r13
	.word 0x8780204f  ! 195: WRASI_I	wr	%r0, 0x004f, %asi
debug_2_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 196: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_2_108:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 197: SAVE_R	save	%r31, %r0, %r31
	.word 0x98f96c13  ! 198: SDIVcc_I	sdivcc 	%r5, 0x0c13, %r12
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 199: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d9024c0  ! 200: WRPR_PSTATE_I	wrpr	%r0, 0x04c0, %pstate
memptr_2_109:
	set 0x60540000, %r31
	.word 0x8581668e  ! 201: WRCCR_I	wr	%r5, 0x068e, %ccr
	.word 0xa3a00171  ! 202: FABSq	dis not found

splash_cmpr_2_110:
	setx 0x202bafbd9ad1777b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 203: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd88008a0  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x928121bf  ! 205: ADDcc_I	addcc 	%r4, 0x01bf, %r9
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_111
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_111
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_111:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 206: RDPC	rd	%pc, %r8
	.word 0x81510000  ! 207: RDPR_TICK	<illegal instruction>
	.word 0x879022d4  ! 208: WRPR_TT_I	wrpr	%r0, 0x02d4, %tt
	.word 0x91d02033  ! 209: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe8d00e40  ! 210: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01962  ! 211: FqTOd	dis not found

DS_2_113:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa5a109cd  ! 1: FDIVd	fdivd	%f4, %f44, %f18
	normalw
	.word 0x95458000  ! 212: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xd66fe43a  ! 213: LDSTUB_I	ldstub	%r11, [%r31 + 0x043a]
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_114:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 214: RDPC	rd	%pc, %r20
intveclr_2_115:
	setx 0xe9712c641dcd0cfa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 215: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa784ba84  ! 216: WR_GRAPHICS_STATUS_REG_I	wr	%r18, 0x1a84, %-
debug_2_116:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 217: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x96692e79  ! 218: UDIVX_I	udivx 	%r4, 0x0e79, %r11
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996aa8a6  ! 219: SDIVX_I	sdivx	%r10, 0x08a6, %r12
	.word 0x36700001  ! 220: BPGE	<illegal instruction>
	.word 0xd0880e80  ! 221: LDUBA_R	lduba	[%r0, %r0] 0x74, %r8
	.word 0x87802004  ! 222: WRASI_I	wr	%r0, 0x0004, %asi
splash_tba_2_118:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 223: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_2_119:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa1a189d4  ! 1: FDIVd	fdivd	%f6, %f20, %f16
	.word 0xd914800b  ! 1: LDQF_R	-	[%r18, %r11], %f12
	.word 0x95a1c820  ! 224: FADDs	fadds	%f7, %f0, %f10
mondo_2_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d94800c  ! 225: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
	.word 0xd4c804a0  ! 226: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
DS_2_121:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 227: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd497e000  ! 228: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
intveclr_2_122:
	setx 0x41bc76f1f7bf670f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 229: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_2_123:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa7a0054a  ! 1: FSQRTd	fsqrt	
	.word 0x9ba20832  ! 230: FADDs	fadds	%f8, %f18, %f13
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_124)+24, 16, 16)) -> intp(2,1,3)
xir_2_124:
	.word 0xa984bddb  ! 231: WR_SET_SOFTINT_I	wr	%r18, 0x1ddb, %set_softint
DS_2_125:
	.word 0x9ba009cc  ! 1: FDIVd	fdivd	%f0, %f12, %f44
	.word 0xd7308011  ! 1: STQF_R	-	%f11, [%r17, %r2]
	normalw
	.word 0x97458000  ! 232: RD_SOFTINT_REG	rd	%softint, %r11
mondo_2_126:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d940008  ! 233: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
	.word 0x8780208a  ! 234: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0xe49004a0  ! 235: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 236: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d903bf9  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x1bf9, %pstate
	.word 0xe527c000  ! 238: STF_R	st	%f18, [%r0, %r31]
mondo_2_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d950005  ! 239: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	.word 0x9150c000  ! 240: RDPR_TT	<illegal instruction>
	.word 0x93480000  ! 241: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_128
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_128:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 242: RDPC	rd	%pc, %r20
mondo_2_129:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d920013  ! 243: WRPR_WSTATE_R	wrpr	%r8, %r19, %wstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_130:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r19
	setx 0x124c842ad17c1579, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_131:
	.word 0x39400001  ! 245: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_2_132:
	setx 0x7a0a19d5e0be2dd8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 246: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_133:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 247: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_134) + 16, 16, 16)) -> intp(1,0,27)
intvec_2_134:
	.word 0x39400001  ! 248: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 249: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe68804a0  ! 250: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
splash_hpstate_2_135:
	.word 0x819824fd  ! 251: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04fd, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01966  ! 252: FqTOd	dis not found

	.word 0x95a00173  ! 253: FABSq	dis not found

	.word 0xd73fc000  ! 254: STDF_R	std	%f11, [%r0, %r31]
	.word 0x8d903291  ! 255: WRPR_PSTATE_I	wrpr	%r0, 0x1291, %pstate
	.word 0x8d903f1d  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x1f1d, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6aa939  ! 257: SDIVX_I	sdivx	%r10, 0x0939, %r13
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 259: WRASI_I	wr	%r0, 0x0004, %asi
debug_2_138:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 260: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r12
debug_2_139:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 262: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab820010  ! 263: WR_CLEAR_SOFTINT_R	wr	%r8, %r16, %clear_softint
debug_2_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 264: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x879022ff  ! 265: WRPR_TT_I	wrpr	%r0, 0x02ff, %tt
DS_2_141:
	.word 0x97a149c7  ! 1: FDIVd	fdivd	%f36, %f38, %f42
	.word 0xbfe7c000  ! 266: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_142) + 40, 16, 16)) -> intp(3,0,17)
intvec_2_142:
	.word 0x39400001  ! 267: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01961  ! 268: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 269: LDX_R	ldx	[%r31 + %r0], %r12
memptr_2_144:
	set user_data_start, %r31
	.word 0x85843876  ! 270: WRCCR_I	wr	%r16, 0x1876, %ccr
debug_2_145:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 271: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa985000b  ! 272: WR_SET_SOFTINT_R	wr	%r20, %r11, %set_softint
	.word 0x81510000  ! 273: RDPR_TICK	<illegal instruction>
memptr_2_146:
	set 0x60340000, %r31
	.word 0x8580afff  ! 274: WRCCR_I	wr	%r2, 0x0fff, %ccr
	.word 0xa1902002  ! 275: WRPR_GL_I	wrpr	%r0, 0x0002, %-
memptr_2_147:
	set user_data_start, %r31
	.word 0x85803ad6  ! 276: WRCCR_I	wr	%r0, 0x1ad6, %ccr
	.word 0x8780204f  ! 277: WRASI_I	wr	%r0, 0x004f, %asi
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_148
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_148:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 278: RDPC	rd	%pc, %r13
pmu_2_149:
	nop
	setx 0xfffffcc9fffff150, %g1, %g7
	.word 0xa3800007  ! 279: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_2_150:
	setx 0xc1a04ad966b592c5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 280: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196a  ! 281: FqTOd	dis not found

splash_cmpr_2_152:
	setx 0xbdb45c598afdb4ec, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 282: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902003  ! 283: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xd68008a0  ! 284: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
debug_2_153:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 285: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
splash_hpstate_2_154:
	.word 0x8198265d  ! 286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065d, %hpstate
splash_hpstate_2_155:
	.word 0x8198298c  ! 287: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098c, %hpstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_156
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_156
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_156:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 288: RDPC	rd	%pc, %r9
splash_tba_2_157:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 289: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_158
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_158
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_158:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 290: RDPC	rd	%pc, %r12
memptr_2_159:
	set user_data_start, %r31
	.word 0x8582bcc2  ! 291: WRCCR_I	wr	%r10, 0x1cc2, %ccr
	.word 0x8d9034c0  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x14c0, %pstate
	.word 0xa7480000  ! 293: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
debug_2_160:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 294: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902881  ! 295: WRPR_PSTATE_I	wrpr	%r0, 0x0881, %pstate
memptr_2_161:
	set 0x60740000, %r31
	.word 0x858477aa  ! 296: WRCCR_I	wr	%r17, 0x17aa, %ccr
	.word 0x3c700001  ! 297: BPPOS	<illegal instruction>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_162:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 298: CASA_R	casa	[%r31] %asi, %r17, %r12
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
	.word 0x93414000  ! 299: RDPC	rd	%pc, %r9
splash_cmpr_2_164:
	setx 0x1dd32f29443fdfb2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 300: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902291  ! 301: WRPR_PSTATE_I	wrpr	%r0, 0x0291, %pstate
debug_2_165:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 302: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_166)+56, 16, 16)) -> intp(2,1,3)
xir_2_166:
	.word 0xa985255d  ! 303: WR_SET_SOFTINT_I	wr	%r20, 0x055d, %set_softint
splash_cmpr_2_167:
	setx 0xaf3d9931bdb3e809, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 304: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 305: WRFPRS_I	wr	%r0, 0x0004, %fprs
tagged_2_168:
	tsubcctv %r24, 0x1f27, %r20
	.word 0xd807e4ae  ! 306: LDUW_I	lduw	[%r31 + 0x04ae], %r12
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_169
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_169
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_169:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 307: RDPC	rd	%pc, %r11
	.word 0xa1902001  ! 308: WRPR_GL_I	wrpr	%r0, 0x0001, %-
memptr_2_170:
	set 0x60740000, %r31
	.word 0x858161df  ! 309: WRCCR_I	wr	%r5, 0x01df, %ccr
DS_2_171:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa7b4c30d  ! 310: ALIGNADDRESS	alignaddr	%r19, %r13, %r19
	.word 0xe677e758  ! 311: STX_I	stx	%r19, [%r31 + 0x0758]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916c3c3a  ! 312: SDIVX_I	sdivx	%r16, 0xfffffc3a, %r8
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 313: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa780c011  ! 314: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r17, %-
	.word 0x97a109d3  ! 315: FDIVd	fdivd	%f4, %f50, %f42
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976a77ac  ! 316: SDIVX_I	sdivx	%r9, 0xfffff7ac, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x81510000  ! 318: RDPR_TICK	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01970  ! 319: FqTOd	dis not found

DS_2_176:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 320: SAVE_R	save	%r31, %r0, %r31
	.word 0xa1a00168  ! 321: FABSq	dis not found

	.word 0x95a00166  ! 322: FABSq	dis not found

	.word 0xa1902009  ! 323: WRPR_GL_I	wrpr	%r0, 0x0009, %-
change_to_randtl_2_177:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_177:
	.word 0x8f902000  ! 324: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa1a00173  ! 325: FABSq	dis not found

	.word 0x87902151  ! 326: WRPR_TT_I	wrpr	%r0, 0x0151, %tt
	.word 0x8790214c  ! 327: WRPR_TT_I	wrpr	%r0, 0x014c, %tt
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_178
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_178
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_178:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 328: RDPC	rd	%pc, %r9
	.word 0x919433fa  ! 329: WRPR_PIL_I	wrpr	%r16, 0x13fa, %pil
	.word 0x3e800001  ! 330: BVC	bvc,a	<label_0x1>
memptr_2_179:
	set 0x60540000, %r31
	.word 0x8584f569  ! 331: WRCCR_I	wr	%r19, 0x1569, %ccr
splash_cmpr_2_180:
	setx 0x995320a5456fdfb8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 332: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_181:
	setx 0x200375ccc5564093, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 333: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_182:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 334: CASA_R	casa	[%r31] %asi, %r10, %r8
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 335: CASA_R	casa	[%r31] %asi, %r10, %r8
DS_2_184:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f20, %f12, %f4
	.word 0x9bb50305  ! 336: ALIGNADDRESS	alignaddr	%r20, %r5, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 337: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xa190200e  ! 338: WRPR_GL_I	wrpr	%r0, 0x000e, %-
tagged_2_185:
	taddcctv %r7, 0x169e, %r16
	.word 0xd607e82e  ! 339: LDUW_I	lduw	[%r31 + 0x082e], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_186) + 32, 16, 16)) -> intp(5,0,2)
intvec_2_186:
	.word 0x39400001  ! 340: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe020  ! 341: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 342: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_2_187:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_187:
	.word 0x8f902003  ! 343: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd66fe82e  ! 344: LDSTUB_I	ldstub	%r11, [%r31 + 0x082e]
	.word 0x8780208b  ! 345: WRASI_I	wr	%r0, 0x008b, %asi
intveclr_2_188:
	setx 0x15f5d5436c7535b8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 346: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_2_189:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_189:
	.word 0x8f902003  ! 347: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_lsu_2_190:
	setx 0x6afb125c90e0b4fb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 348: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 349: Tcc_I	ta	icc_or_xcc, %r0 + 179
debug_2_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 350: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_192) + 0, 16, 16)) -> intp(3,0,28)
intvec_2_192:
	.word 0x39400001  ! 351: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_193
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_193:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 352: RDPC	rd	%pc, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01971  ! 353: FqTOd	dis not found

change_to_randtl_2_195:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_195:
	.word 0x8f902000  ! 354: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_2_196:
	setx 0x165527e4f245a217, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 355: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 356: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
debug_2_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 357: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_198)+0, 16, 16)) -> intp(2,1,3)
xir_2_198:
	.word 0xa9832b13  ! 358: WR_SET_SOFTINT_I	wr	%r12, 0x0b13, %set_softint
	.word 0x99902001  ! 359: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_lsu_2_199:
	setx 0x081072e1818b0df7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 360: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 361: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01962  ! 362: FqTOd	dis not found

cwp_2_201:
    set user_data_start, %o7
	.word 0x93902007  ! 363: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
change_to_randtl_2_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_202:
	.word 0x8f902000  ! 364: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd937e831  ! 365: STQF_I	-	%f12, [0x0831, %r31]
	.word 0x87902241  ! 366: WRPR_TT_I	wrpr	%r0, 0x0241, %tt
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_203:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e013  ! 367: CASA_R	casa	[%r31] %asi, %r19, %r12
tagged_2_204:
	tsubcctv %r7, 0x15b4, %r4
	.word 0xd807e831  ! 368: LDUW_I	lduw	[%r31 + 0x0831], %r12
	.word 0xd847c000  ! 369: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0xd81fc000  ! 370: LDD_R	ldd	[%r31 + %r0], %r12
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
	.word 0xa1414000  ! 371: RDPC	rd	%pc, %r16
	.word 0x8d902857  ! 372: WRPR_PSTATE_I	wrpr	%r0, 0x0857, %pstate
splash_lsu_2_206:
	setx 0xd07ea937cc8d0181, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 373: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780208a  ! 374: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0x8d9021c0  ! 375: WRPR_PSTATE_I	wrpr	%r0, 0x01c0, %pstate
splash_hpstate_2_207:
	.word 0x819827be  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07be, %hpstate
	rd %pc, %r19
	add %r19, (ivw_2_208-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_208:
	.word 0x91950006  ! 377: WRPR_PIL_R	wrpr	%r20, %r6, %pil
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_209
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_209:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e003  ! 378: CASA_R	casa	[%r31] %asi, %r3, %r13
cwp_2_210:
    set user_data_start, %o7
	.word 0x93902001  ! 379: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d903803  ! 380: WRPR_PSTATE_I	wrpr	%r0, 0x1803, %pstate
	.word 0xdac7e000  ! 381: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r13
	.word 0xdb27c000  ! 382: STF_R	st	%f13, [%r0, %r31]
change_to_randtl_2_211:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_211:
	.word 0x8f902002  ! 383: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	rd %pc, %r19
	add %r19, (ivw_2_212-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_212:
	.word 0x91950013  ! 384: WRPR_PIL_R	wrpr	%r20, %r19, %pil
splash_cmpr_2_213:
	setx 0x7b6bea4763c1be93, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 385: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdadfe000  ! 386: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
tagged_2_214:
	tsubcctv %r21, 0x1dea, %r20
	.word 0xda07e831  ! 387: LDUW_I	lduw	[%r31 + 0x0831], %r13
debug_2_215:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 388: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_2_216:
	setx 0xa4f6e8d1a780d88d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32800001  ! 390: BNE	bne,a	<label_0x1>
	.word 0x93d020b3  ! 391: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0xdadfe010  ! 392: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0x87902148  ! 393: WRPR_TT_I	wrpr	%r0, 0x0148, %tt
mondo_2_217:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d904010  ! 394: WRPR_WSTATE_R	wrpr	%r1, %r16, %wstate
	.word 0x8790209d  ! 395: WRPR_TT_I	wrpr	%r0, 0x009d, %tt
splash_tba_2_218:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 396: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d90215a  ! 397: WRPR_PSTATE_I	wrpr	%r0, 0x015a, %pstate
splash_cmpr_2_219:
	setx 0xf3967ad287fee936, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93a249d4  ! 399: FDIVd	fdivd	%f40, %f20, %f40
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93686385  ! 400: SDIVX_I	sdivx	%r1, 0x0385, %r9
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_0:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00a  ! 1: CASA_R	casa	[%r31] %asi, %r10, %r12
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 2: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_1_1:
	setx 0x3e1675c16f6f9e85, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 4: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xd88804a0  ! 5: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
splash_cmpr_1_2:
	setx 0x6c2ca7236a453411, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 6: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8d7e000  ! 7: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
splash_cmpr_1_3:
	setx 0x8168cc14ce67cd88, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 8: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a509c4  ! 9: FDIVd	fdivd	%f20, %f4, %f12
splash_lsu_1_4:
	setx 0xc8c3b06517ec59d3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 11: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_1_5:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 12: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9b454000  ! 13: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	.word 0xe847c000  ! 14: LDSW_R	ldsw	[%r31 + %r0], %r20
DS_1_6:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 15: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96c68d4  ! 16: SDIVX_I	sdivx	%r17, 0x08d4, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_8) + 0, 16, 16)) -> intp(2,0,3)
intvec_1_8:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_1_9:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 18: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_1_10:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 19: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_11:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 20: CASA_R	casa	[%r31] %asi, %r8, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01974  ! 21: FqTOd	dis not found

	.word 0xe08008a0  ! 22: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_1_13:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d918005  ! 23: WRPR_WSTATE_R	wrpr	%r6, %r5, %wstate
	.word 0xe0800c20  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r16
splash_hpstate_1_14:
	.word 0x8198220f  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020f, %hpstate
	.word 0x94f80006  ! 27: SDIVcc_R	sdivcc 	%r0, %r6, %r10
DS_1_15:
	.word 0xa1a009cc  ! 1: FDIVd	fdivd	%f0, %f12, %f16
	.word 0x9ba4c9cb  ! 1: FDIVd	fdivd	%f50, %f42, %f44
	normalw
	.word 0x9b458000  ! 28: RD_SOFTINT_REG	rd	%softint, %r13
splash_hpstate_1_16:
	.word 0x8198249d  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049d, %hpstate
	.word 0x9750c000  ! 30: RDPR_TT	<illegal instruction>
	.word 0x87802020  ! 31: WRASI_I	wr	%r0, 0x0020, %asi
memptr_1_17:
	set 0x60340000, %r31
	.word 0x85827831  ! 32: WRCCR_I	wr	%r9, 0x1831, %ccr
tagged_1_18:
	tsubcctv %r9, 0x1fac, %r10
	.word 0xd407e5ee  ! 33: LDUW_I	lduw	[%r31 + 0x05ee], %r10
cwp_1_19:
    set user_data_start, %o7
	.word 0x93902006  ! 34: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
cwp_1_20:
    set user_data_start, %o7
	.word 0x93902003  ! 35: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_21:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 36: CASA_R	casa	[%r31] %asi, %r11, %r10
	.word 0x91d02032  ! 37: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa1902002  ! 38: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd477c000  ! 39: STX_R	stx	%r10, [%r31 + %r0]
memptr_1_22:
	set 0x60340000, %r31
	.word 0x8580b155  ! 40: WRCCR_I	wr	%r2, 0x1155, %ccr
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_23:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 41: CASA_R	casa	[%r31] %asi, %r11, %r10
	.word 0x87802010  ! 42: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd437fdc5  ! 43: STH_I	sth	%r10, [%r31 + 0xfffffdc5]
pmu_1_24:
	nop
	setx 0xffffffadfffff5c7, %g1, %g7
	.word 0xa3800007  ! 44: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd4d7e000  ! 45: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
splash_lsu_1_25:
	setx 0x69f5c59cb0014b09, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 46: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_26:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 47: CASA_R	casa	[%r31] %asi, %r11, %r10
splash_cmpr_1_27:
	setx 0x5d1764764cf0ab36, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 48: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01971  ! 49: FqTOd	dis not found

	.word 0xd8cfe020  ! 50: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
	.word 0xd88804a0  ! 51: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0xa1902001  ! 52: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_cmpr_1_29:
	setx 0xf667b56df22f6237, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 53: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 54: WRFPRS_I	wr	%r0, 0x0004, %fprs
intveclr_1_30:
	setx 0x2920ecdaa644dc41, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 55: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01974  ! 56: FqTOd	dis not found

	.word 0x91a04dc6  ! 57: FdMULq	fdmulq	
splash_decr_1_32:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa780c014  ! 58: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r20, %-
	.word 0x30700001  ! 59: BPA	<illegal instruction>
	.word 0x879020a9  ! 60: WRPR_TT_I	wrpr	%r0, 0x00a9, %tt
	.word 0x95a01a61  ! 61: FqTOi	fqtoi	
splash_cmpr_1_33:
	setx 0xd835be41afbc67d8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01965  ! 63: FqTOd	dis not found

splash_cmpr_1_35:
	setx 0x524a88ae3b4c99e4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 64: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda800a60  ! 65: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r13
splash_lsu_1_36:
	setx 0x867428aae30f28ff, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 66: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_1_37:
	setx 0x0400c3aaf3f47983, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 67: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9b454000  ! 68: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	.word 0xd8cfe010  ! 69: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r12
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
	.word 0x97414000  ! 70: RDPC	rd	%pc, %r11
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 71: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9824005  ! 72: WR_SET_SOFTINT_R	wr	%r9, %r5, %set_softint
	.word 0xa190200f  ! 73: WRPR_GL_I	wrpr	%r0, 0x000f, %-
memptr_1_39:
	set user_data_start, %r31
	.word 0x8584e64d  ! 74: WRCCR_I	wr	%r19, 0x064d, %ccr
cwp_1_40:
    set user_data_start, %o7
	.word 0x93902001  ! 75: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x879022a0  ! 76: WRPR_TT_I	wrpr	%r0, 0x02a0, %tt
	.word 0x91d02033  ! 77: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_tba_1_41:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 78: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd2dfe000  ! 79: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r9
splash_tba_1_42:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 80: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_1_43:
	setx 0x1aa46a87a87440b9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 81: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802080  ! 82: WRASI_I	wr	%r0, 0x0080, %asi
change_to_randtl_1_44:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_44:
	.word 0x8f902000  ! 83: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_1_45:
	setx 0xfe82983fbf144751, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 84: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd2800ae0  ! 85: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r9
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_46:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 86: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_hpstate_1_47:
	.word 0x81982d16  ! 87: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d16, %hpstate
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 88: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa4aa4005  ! 89: ANDNcc_R	andncc 	%r9, %r5, %r18
	.word 0x93454000  ! 90: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
splash_cmpr_1_48:
	setx 0xf22ce5ae6ff8e012, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 91: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_49:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f4, %f20, %f16
	.word 0x9bb14304  ! 92: ALIGNADDRESS	alignaddr	%r5, %r4, %r13
tagged_1_50:
	tsubcctv %r13, 0x16dd, %r9
	.word 0xe607faea  ! 93: LDUW_I	lduw	[%r31 + 0xfffffaea], %r19
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
	.word 0x97414000  ! 94: RDPC	rd	%pc, %r11
tagged_1_52:
	tsubcctv %r12, 0x1ac4, %r22
	.word 0xd607faea  ! 95: LDUW_I	lduw	[%r31 + 0xfffffaea], %r11
	.word 0x87802080  ! 96: WRASI_I	wr	%r0, 0x0080, %asi
debug_1_53:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 97: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_1_54:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 98: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
splash_cmpr_1_55:
	setx 0x3e87be1fd6295f92, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 99: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01966  ! 100: FqTOd	dis not found

splash_cmpr_1_57:
	setx 0x41fcbe5c73614837, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a0056d  ! 102: FSQRTq	fsqrt	
intveclr_1_58:
	setx 0x4e0a2c11a1c72c3d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 103: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_59:
	.word 0x8198274f  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x074f, %hpstate
	.word 0x8d903703  ! 105: WRPR_PSTATE_I	wrpr	%r0, 0x1703, %pstate
	.word 0xe53fc000  ! 106: STDF_R	std	%f18, [%r0, %r31]
cwp_1_60:
    set user_data_start, %o7
	.word 0x93902007  ! 107: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x26700001  ! 108: BPL	<illegal instruction>
	.word 0x93480000  ! 109: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0xdad804a0  ! 110: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0x2c700001  ! 111: BPNEG	<illegal instruction>
debug_1_61:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 112: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_1_62:
	nop
	setx 0xfffff0dbfffff20c, %g1, %g7
	.word 0xa3800007  ! 113: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xda800ba0  ! 114: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r13
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 115: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x83d02032  ! 116: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xdad004a0  ! 117: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_63
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_63:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 118: RDPC	rd	%pc, %r10
	rd %pc, %r19
	add %r19, (ivw_1_64-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_64:
	.word 0x91944002  ! 119: WRPR_PIL_R	wrpr	%r17, %r2, %pil
	.word 0xe4800b00  ! 120: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r18
	.word 0x8780204f  ! 121: WRASI_I	wr	%r0, 0x004f, %asi
memptr_1_65:
	set 0x60740000, %r31
	.word 0x858372ad  ! 122: WRCCR_I	wr	%r13, 0x12ad, %ccr
cwp_1_66:
    set user_data_start, %o7
	.word 0x93902007  ! 123: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 124: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa980c004  ! 125: WR_SET_SOFTINT_R	wr	%r3, %r4, %set_softint
	.word 0xa1902003  ! 126: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x97a209c5  ! 127: FDIVd	fdivd	%f8, %f36, %f42
debug_1_67:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 128: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_1_68:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 129: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 130: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x8780204f  ! 131: WRASI_I	wr	%r0, 0x004f, %asi
debug_1_69:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 132: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
DS_1_70:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x97478e6c	! Random illegal ?
	.word 0xe1108007  ! 1: LDQF_R	-	[%r2, %r7], %f16
	.word 0xa9a44828  ! 133: FADDs	fadds	%f17, %f8, %f20
	.word 0xd0d004a0  ! 134: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	rd %pc, %r19
	add %r19, (ivw_1_71-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_71:
	.word 0x91924001  ! 135: WRPR_PIL_R	wrpr	%r9, %r1, %pil
splash_tba_1_72:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 136: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_1_73:
	setx 0x655472a43035a957, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 137: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 138: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xa9a00170  ! 139: FABSq	dis not found

	.word 0x87802080  ! 140: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x99480000  ! 141: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
debug_1_74:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 142: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd027eaa8  ! 143: STW_I	stw	%r8, [%r31 + 0x0aa8]
splash_lsu_1_75:
	setx 0x260a0d20020783ad, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 144: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_76
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_76
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_76:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 145: RDPC	rd	%pc, %r13
debug_1_77:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 146: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802088  ! 147: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8790213a  ! 148: WRPR_TT_I	wrpr	%r0, 0x013a, %tt
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_78) + 24, 16, 16)) -> intp(6,0,24)
intvec_1_78:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 150: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_1_79:
	setx 0x4a68315517b62744, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 151: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd68804a0  ! 152: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
mondo_1_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d940004  ! 153: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_81:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e001  ! 154: CASA_R	casa	[%r31] %asi, %r1, %r11
DS_1_82:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 155: SAVE_R	save	%r31, %r0, %r31
	.word 0x9a84400d  ! 156: ADDcc_R	addcc 	%r17, %r13, %r13
splash_cmpr_1_83:
	setx 0xcd1a815dab7ef4c0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 157: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd86feaa8  ! 158: LDSTUB_I	ldstub	%r12, [%r31 + 0x0aa8]
splash_cmpr_1_84:
	setx 0x7395d5ca7c62ab7b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 159: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd897e000  ! 160: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_85
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_85:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 161: RDPC	rd	%pc, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r16
mondo_1_86:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d910001  ! 163: WRPR_WSTATE_R	wrpr	%r4, %r1, %wstate
	.word 0x8d902444  ! 164: WRPR_PSTATE_I	wrpr	%r0, 0x0444, %pstate
	.word 0x2e700001  ! 165: BPVS	<illegal instruction>
	.word 0xe097e020  ! 166: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r16
donret_1_87:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_87-donret_1_87-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_87:
	.word 0xe0ffeaa8  ! 167: SWAPA_I	swapa	%r16, [%r31 + 0x0aa8] %asi
	.word 0x8780201c  ! 168: WRASI_I	wr	%r0, 0x001c, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_88)+8, 16, 16)) -> intp(1,1,3)
xir_1_88:
	.word 0xa984ecbf  ! 169: WR_SET_SOFTINT_I	wr	%r19, 0x0cbf, %set_softint
splash_hpstate_1_89:
	.word 0x81982384  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0384, %hpstate
DS_1_90:
	.word 0x93a209d1  ! 1: FDIVd	fdivd	%f8, %f48, %f40
	.word 0xbf6d53e9	! Random illegal ?
	.word 0x95a349c2  ! 1: FDIVd	fdivd	%f44, %f2, %f10
	.word 0x9ba28826  ! 171: FADDs	fadds	%f10, %f6, %f13
	.word 0xad81bc23  ! 172: WR_SOFTINT_REG_I	wr	%r6, 0x1c23, %softint
	.word 0x879022cd  ! 173: WRPR_TT_I	wrpr	%r0, 0x02cd, %tt
splash_decr_1_91:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa7830006  ! 174: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r6, %-
donret_1_92:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_92-donret_1_92), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_92:
	.word 0xdafff1ca  ! 175: SWAPA_I	swapa	%r13, [%r31 + 0xfffff1ca] %asi
	.word 0xdac00e80  ! 176: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r13
intveclr_1_93:
	setx 0xb9b2d74c1310341e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 177: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_94:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d90c00d  ! 178: WRPR_WSTATE_R	wrpr	%r3, %r13, %wstate
DS_1_95:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 179: RESTORE_R	restore	%r31, %r0, %r31
tagged_1_96:
	tsubcctv %r18, 0x1fab, %r18
	.word 0xda07f1ca  ! 180: LDUW_I	lduw	[%r31 + 0xfffff1ca], %r13
splash_tba_1_97:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 181: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_1_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 182: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xab837f7e  ! 183: WR_CLEAR_SOFTINT_I	wr	%r13, 0x1f7e, %clear_softint
change_to_randtl_1_99:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_99:
	.word 0x8f902003  ! 184: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
debug_1_100:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 185: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_1_101:
	taddcctv %r5, 0x1654, %r12
	.word 0xda07fbf7  ! 186: LDUW_I	lduw	[%r31 + 0xfffffbf7], %r13
	rd %pc, %r19
	add %r19, (ivw_1_102-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_102:
	.word 0x91944009  ! 187: WRPR_PIL_R	wrpr	%r17, %r9, %pil
	.word 0x87802089  ! 188: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d902540  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x0540, %pstate
debug_1_103:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 190: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xda97e010  ! 191: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r13
splash_lsu_1_104:
	setx 0x328a3f2f7dfb7af5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 192: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_105:
	setx 0x524925d6b9f663e2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 193: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_106:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 194: CASA_R	casa	[%r31] %asi, %r20, %r13
	.word 0x8780204f  ! 195: WRASI_I	wr	%r0, 0x004f, %asi
debug_1_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 196: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_1_108:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 197: SAVE_R	save	%r31, %r0, %r31
	.word 0x92f96648  ! 198: SDIVcc_I	sdivcc 	%r5, 0x0648, %r9
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 199: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902ad1  ! 200: WRPR_PSTATE_I	wrpr	%r0, 0x0ad1, %pstate
memptr_1_109:
	set 0x60540000, %r31
	.word 0x85846a3a  ! 201: WRCCR_I	wr	%r17, 0x0a3a, %ccr
	.word 0x91a0016a  ! 202: FABSq	dis not found

splash_cmpr_1_110:
	setx 0x676d670ec2aef99d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 203: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd88008a0  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xa284377b  ! 205: ADDcc_I	addcc 	%r16, 0xfffff77b, %r17
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_111
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_111
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_111:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 206: RDPC	rd	%pc, %r16
	.word 0x81510000  ! 207: RDPR_TICK	<illegal instruction>
	.word 0x8790239b  ! 208: WRPR_TT_I	wrpr	%r0, 0x039b, %tt
	.word 0x83d02034  ! 209: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xe8d004a0  ! 210: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01971  ! 211: FqTOd	dis not found

DS_1_113:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x95a149cc  ! 1: FDIVd	fdivd	%f36, %f12, %f10
	normalw
	.word 0x91458000  ! 212: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd66fe43a  ! 213: LDSTUB_I	ldstub	%r11, [%r31 + 0x043a]
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_114:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 214: RDPC	rd	%pc, %r10
intveclr_1_115:
	setx 0x93fcbec094cbcd53, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 215: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7826f37  ! 216: WR_GRAPHICS_STATUS_REG_I	wr	%r9, 0x0f37, %-
debug_1_116:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 217: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa86d2552  ! 218: UDIVX_I	udivx 	%r20, 0x0552, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996c2a39  ! 219: SDIVX_I	sdivx	%r16, 0x0a39, %r12
	.word 0x36700001  ! 220: BPGE	<illegal instruction>
	.word 0xd08804a0  ! 221: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	.word 0x8780204f  ! 222: WRASI_I	wr	%r0, 0x004f, %asi
splash_tba_1_118:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 223: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_1_119:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x91a449c0  ! 1: FDIVd	fdivd	%f48, %f0, %f8
	.word 0xe511c009  ! 1: LDQF_R	-	[%r7, %r9], %f18
	.word 0xa5a0c830  ! 224: FADDs	fadds	%f3, %f16, %f18
mondo_1_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d95000d  ! 225: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
	.word 0xd4c804a0  ! 226: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
DS_1_121:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 227: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd497e000  ! 228: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
intveclr_1_122:
	setx 0x2caae2bf535f0632, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 229: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_1_123:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x99a00552  ! 1: FSQRTd	fsqrt	
	.word 0xa1a10824  ! 230: FADDs	fadds	%f4, %f4, %f16
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_124)+40, 16, 16)) -> intp(1,1,3)
xir_1_124:
	.word 0xa9822cb4  ! 231: WR_SET_SOFTINT_I	wr	%r8, 0x0cb4, %set_softint
DS_1_125:
	.word 0x93a049d0  ! 1: FDIVd	fdivd	%f32, %f16, %f40
	.word 0xd934c001  ! 1: STQF_R	-	%f12, [%r1, %r19]
	normalw
	.word 0xa5458000  ! 232: RD_SOFTINT_REG	rd	%softint, %r18
mondo_1_126:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d940013  ! 233: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
	.word 0x87802020  ! 234: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe49004a0  ! 235: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 236: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903845  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x1845, %pstate
	.word 0xe527c000  ! 238: STF_R	st	%f18, [%r0, %r31]
mondo_1_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d944007  ! 239: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
	.word 0xa950c000  ! 240: RDPR_TT	<illegal instruction>
	.word 0x97480000  ! 241: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_128
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_128:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 242: RDPC	rd	%pc, %r16
mondo_1_129:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d940010  ! 243: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_130:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r19
	setx 0x0cea9cf907d3ef82, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_131:
	.word 0x39400001  ! 245: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_1_132:
	setx 0xb4cc1cf042819ae5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 246: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_133:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 247: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_134) + 32, 16, 16)) -> intp(0,0,4)
intvec_1_134:
	.word 0x39400001  ! 248: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 249: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe6880e40  ! 250: LDUBA_R	lduba	[%r0, %r0] 0x72, %r19
splash_hpstate_1_135:
	.word 0x81982357  ! 251: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0357, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01967  ! 252: FqTOd	dis not found

	.word 0xa3a00173  ! 253: FABSq	dis not found

	.word 0xd73fc000  ! 254: STDF_R	std	%f11, [%r0, %r31]
	.word 0x8d90269f  ! 255: WRPR_PSTATE_I	wrpr	%r0, 0x069f, %pstate
	.word 0x8d90303f  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x103f, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956a3ad2  ! 257: SDIVX_I	sdivx	%r8, 0xfffffad2, %r10
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802089  ! 259: WRASI_I	wr	%r0, 0x0089, %asi
debug_1_138:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 260: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r12
debug_1_139:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 262: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab81c013  ! 263: WR_CLEAR_SOFTINT_R	wr	%r7, %r19, %clear_softint
debug_1_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 264: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x879020d6  ! 265: WRPR_TT_I	wrpr	%r0, 0x00d6, %tt
DS_1_141:
	.word 0xa9a1c9c9  ! 1: FDIVd	fdivd	%f38, %f40, %f20
	.word 0xbfe7c000  ! 266: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_142) + 48, 16, 16)) -> intp(5,0,22)
intvec_1_142:
	.word 0x39400001  ! 267: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01962  ! 268: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 269: LDX_R	ldx	[%r31 + %r0], %r12
memptr_1_144:
	set user_data_start, %r31
	.word 0x8582fb93  ! 270: WRCCR_I	wr	%r11, 0x1b93, %ccr
debug_1_145:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 271: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa984800b  ! 272: WR_SET_SOFTINT_R	wr	%r18, %r11, %set_softint
	.word 0x81510000  ! 273: RDPR_TICK	<illegal instruction>
memptr_1_146:
	set 0x60540000, %r31
	.word 0x85846f2a  ! 274: WRCCR_I	wr	%r17, 0x0f2a, %ccr
	.word 0xa1902004  ! 275: WRPR_GL_I	wrpr	%r0, 0x0004, %-
memptr_1_147:
	set user_data_start, %r31
	.word 0x85803a09  ! 276: WRCCR_I	wr	%r0, 0x1a09, %ccr
	.word 0x87802083  ! 277: WRASI_I	wr	%r0, 0x0083, %asi
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_148
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_148:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 278: RDPC	rd	%pc, %r12
pmu_1_149:
	nop
	setx 0xfffff8c9ffffff80, %g1, %g7
	.word 0xa3800007  ! 279: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_1_150:
	setx 0x53def80040f93b21, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 280: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01960  ! 281: FqTOd	dis not found

splash_cmpr_1_152:
	setx 0xb0161f84ceea4a38, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 282: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902005  ! 283: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xd68008a0  ! 284: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
debug_1_153:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 285: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
splash_hpstate_1_154:
	.word 0x81982ccc  ! 286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ccc, %hpstate
splash_hpstate_1_155:
	.word 0x8198261f  ! 287: WRHPR_HPSTATE_I	wrhpr	%r0, 0x061f, %hpstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_156
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_156
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_156:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 288: RDPC	rd	%pc, %r12
splash_tba_1_157:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 289: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_158
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_158
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_158:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 290: RDPC	rd	%pc, %r11
memptr_1_159:
	set user_data_start, %r31
	.word 0x85813ba2  ! 291: WRCCR_I	wr	%r4, 0x1ba2, %ccr
	.word 0x8d902f92  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x0f92, %pstate
	.word 0x99480000  ! 293: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
debug_1_160:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 294: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902388  ! 295: WRPR_PSTATE_I	wrpr	%r0, 0x0388, %pstate
memptr_1_161:
	set 0x60140000, %r31
	.word 0x8582f7ff  ! 296: WRCCR_I	wr	%r11, 0x17ff, %ccr
	.word 0x3c700001  ! 297: BPPOS	<illegal instruction>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_162:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 298: CASA_R	casa	[%r31] %asi, %r17, %r12
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
	.word 0xa1414000  ! 299: RDPC	rd	%pc, %r16
splash_cmpr_1_164:
	setx 0x32d5b2526e9a4ecf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 300: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9021d7  ! 301: WRPR_PSTATE_I	wrpr	%r0, 0x01d7, %pstate
debug_1_165:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 302: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_166)+16, 16, 16)) -> intp(1,1,3)
xir_1_166:
	.word 0xa984eb42  ! 303: WR_SET_SOFTINT_I	wr	%r19, 0x0b42, %set_softint
splash_cmpr_1_167:
	setx 0x591b3fd4ad471c7e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 304: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 305: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_1_168:
	tsubcctv %r16, 0x182c, %r24
	.word 0xd807e4ae  ! 306: LDUW_I	lduw	[%r31 + 0x04ae], %r12
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_169
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_169
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_169:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 307: RDPC	rd	%pc, %r12
	.word 0xa1902005  ! 308: WRPR_GL_I	wrpr	%r0, 0x0005, %-
memptr_1_170:
	set 0x60340000, %r31
	.word 0x8584fa92  ! 309: WRCCR_I	wr	%r19, 0x1a92, %ccr
DS_1_171:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x91b0430d  ! 310: ALIGNADDRESS	alignaddr	%r1, %r13, %r8
	.word 0xe677e758  ! 311: STX_I	stx	%r19, [%r31 + 0x0758]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96c3c9b  ! 312: SDIVX_I	sdivx	%r16, 0xfffffc9b, %r20
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 313: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_decr_1_173:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa782c003  ! 314: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r3, %-
	.word 0x99a489c9  ! 315: FDIVd	fdivd	%f18, %f40, %f12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76cf4ed  ! 316: SDIVX_I	sdivx	%r19, 0xfffff4ed, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x81510000  ! 318: RDPR_TICK	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01962  ! 319: FqTOd	dis not found

DS_1_176:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 320: SAVE_R	save	%r31, %r0, %r31
	.word 0xa3a0016a  ! 321: FABSq	dis not found

	.word 0x95a0016b  ! 322: FABSq	dis not found

	.word 0xa1902003  ! 323: WRPR_GL_I	wrpr	%r0, 0x0003, %-
change_to_randtl_1_177:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_177:
	.word 0x8f902003  ! 324: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x99a00160  ! 325: FABSq	dis not found

	.word 0x879020ea  ! 326: WRPR_TT_I	wrpr	%r0, 0x00ea, %tt
	.word 0x879021c1  ! 327: WRPR_TT_I	wrpr	%r0, 0x01c1, %tt
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_178
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_178
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_178:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 328: RDPC	rd	%pc, %r11
	.word 0x9194252f  ! 329: WRPR_PIL_I	wrpr	%r16, 0x052f, %pil
	.word 0x3e800001  ! 330: BVC	bvc,a	<label_0x1>
memptr_1_179:
	set 0x60540000, %r31
	.word 0x858064a5  ! 331: WRCCR_I	wr	%r1, 0x04a5, %ccr
splash_cmpr_1_180:
	setx 0x641adfc55f984e6c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 332: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_181:
	setx 0x26cc6f991805c0c6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 333: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_182:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 334: CASA_R	casa	[%r31] %asi, %r10, %r8
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 335: CASA_R	casa	[%r31] %asi, %r10, %r8
DS_1_184:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f4, %f22, %f18
	.word 0xa3b50306  ! 336: ALIGNADDRESS	alignaddr	%r20, %r6, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 337: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xa190200b  ! 338: WRPR_GL_I	wrpr	%r0, 0x000b, %-
tagged_1_185:
	taddcctv %r10, 0x109f, %r26
	.word 0xd607e82e  ! 339: LDUW_I	lduw	[%r31 + 0x082e], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_186) + 8, 16, 16)) -> intp(4,0,9)
intvec_1_186:
	.word 0x39400001  ! 340: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe030  ! 341: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 342: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_1_187:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_187:
	.word 0x8f902000  ! 343: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd66fe82e  ! 344: LDSTUB_I	ldstub	%r11, [%r31 + 0x082e]
	.word 0x87802010  ! 345: WRASI_I	wr	%r0, 0x0010, %asi
intveclr_1_188:
	setx 0x86886027f10f5feb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 346: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_1_189:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_189:
	.word 0x8f902000  ! 347: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_1_190:
	setx 0xa2882405868630df, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 348: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 349: Tcc_I	ta	icc_or_xcc, %r0 + 178
debug_1_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 350: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_192) + 24, 16, 16)) -> intp(3,0,27)
intvec_1_192:
	.word 0x39400001  ! 351: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_193
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_193:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 352: RDPC	rd	%pc, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01968  ! 353: FqTOd	dis not found

change_to_randtl_1_195:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_195:
	.word 0x8f902000  ! 354: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_1_196:
	setx 0xd85d1771ec505ec7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 355: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe0800c00  ! 356: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r16
debug_1_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 357: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_198)+0, 16, 16)) -> intp(1,1,3)
xir_1_198:
	.word 0xa980a032  ! 358: WR_SET_SOFTINT_I	wr	%r2, 0x0032, %set_softint
	.word 0x99902000  ! 359: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
splash_lsu_1_199:
	setx 0xf43fc09ab3041e1f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 360: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 361: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01974  ! 362: FqTOd	dis not found

cwp_1_201:
    set user_data_start, %o7
	.word 0x93902007  ! 363: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
change_to_randtl_1_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_202:
	.word 0x8f902002  ! 364: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd937e831  ! 365: STQF_I	-	%f12, [0x0831, %r31]
	.word 0x87902119  ! 366: WRPR_TT_I	wrpr	%r0, 0x0119, %tt
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_203:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e013  ! 367: CASA_R	casa	[%r31] %asi, %r19, %r12
tagged_1_204:
	tsubcctv %r15, 0x111c, %r12
	.word 0xd807e831  ! 368: LDUW_I	lduw	[%r31 + 0x0831], %r12
	.word 0xd847c000  ! 369: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0xd81fc000  ! 370: LDD_R	ldd	[%r31 + %r0], %r12
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
	.word 0x91414000  ! 371: RDPC	rd	%pc, %r8
	.word 0x8d902da5  ! 372: WRPR_PSTATE_I	wrpr	%r0, 0x0da5, %pstate
splash_lsu_1_206:
	setx 0x365f42a13eedf66d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 373: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 374: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d90219e  ! 375: WRPR_PSTATE_I	wrpr	%r0, 0x019e, %pstate
splash_hpstate_1_207:
	.word 0x8198286d  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x086d, %hpstate
	rd %pc, %r19
	add %r19, (ivw_1_208-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_208:
	.word 0x91948008  ! 377: WRPR_PIL_R	wrpr	%r18, %r8, %pil
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_209
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_209:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e003  ! 378: CASA_R	casa	[%r31] %asi, %r3, %r13
cwp_1_210:
    set user_data_start, %o7
	.word 0x93902000  ! 379: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902ccf  ! 380: WRPR_PSTATE_I	wrpr	%r0, 0x0ccf, %pstate
	.word 0xdac7e030  ! 381: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r13
	.word 0xdb27c000  ! 382: STF_R	st	%f13, [%r0, %r31]
change_to_randtl_1_211:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_211:
	.word 0x8f902001  ! 383: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	rd %pc, %r19
	add %r19, (ivw_1_212-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_212:
	.word 0x9192c004  ! 384: WRPR_PIL_R	wrpr	%r11, %r4, %pil
splash_cmpr_1_213:
	setx 0x0a29be18de7b5f03, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 385: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdadfe020  ! 386: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r13
tagged_1_214:
	tsubcctv %r13, 0x10c6, %r26
	.word 0xda07e831  ! 387: LDUW_I	lduw	[%r31 + 0x0831], %r13
debug_1_215:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 388: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_1_216:
	setx 0xa02ac132dc8144b6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32800001  ! 390: BNE	bne,a	<label_0x1>
	.word 0x91d020b3  ! 391: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xdadfe020  ! 392: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r13
	.word 0x8790220d  ! 393: WRPR_TT_I	wrpr	%r0, 0x020d, %tt
mondo_1_217:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d930011  ! 394: WRPR_WSTATE_R	wrpr	%r12, %r17, %wstate
	.word 0x87902142  ! 395: WRPR_TT_I	wrpr	%r0, 0x0142, %tt
splash_tba_1_218:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 396: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d903649  ! 397: WRPR_PSTATE_I	wrpr	%r0, 0x1649, %pstate
splash_cmpr_1_219:
	setx 0x357789aec753c7ce, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91a409c3  ! 399: FDIVd	fdivd	%f16, %f34, %f8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9969e5ac  ! 400: SDIVX_I	sdivx	%r7, 0x05ac, %r12
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_0:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00a  ! 1: CASA_R	casa	[%r31] %asi, %r10, %r12
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_1:
	setx 0x99e4ff473235d845, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 4: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd8880e60  ! 5: LDUBA_R	lduba	[%r0, %r0] 0x73, %r12
splash_cmpr_0_2:
	setx 0x58ca36671496716a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 6: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8d7e010  ! 7: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r12
splash_cmpr_0_3:
	setx 0xa96ead397f6b70e6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 8: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a049c8  ! 9: FDIVd	fdivd	%f32, %f8, %f48
splash_lsu_0_4:
	setx 0x3498e108251b5f65, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b4  ! 11: Tcc_I	te	icc_or_xcc, %r0 + 180
debug_0_5:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 12: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa9454000  ! 13: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0xe847c000  ! 14: LDSW_R	ldsw	[%r31 + %r0], %r20
DS_0_6:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 15: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6ae72c  ! 16: SDIVX_I	sdivx	%r11, 0x072c, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_8) + 16, 16, 16)) -> intp(1,0,4)
intvec_0_8:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_0_9:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 18: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_0_10:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 19: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_11:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 20: CASA_R	casa	[%r31] %asi, %r8, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01962  ! 21: FqTOd	dis not found

	.word 0xe08008a0  ! 22: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_0_13:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d950003  ! 23: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
	.word 0xe08008a0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r16
splash_hpstate_0_14:
	.word 0x8198294c  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094c, %hpstate
	.word 0x90fc0010  ! 27: SDIVcc_R	sdivcc 	%r16, %r16, %r8
DS_0_15:
	.word 0x95a109c8  ! 1: FDIVd	fdivd	%f4, %f8, %f10
	.word 0x95a249cb  ! 1: FDIVd	fdivd	%f40, %f42, %f10
	normalw
	.word 0xa9458000  ! 28: RD_SOFTINT_REG	rd	%softint, %r20
splash_hpstate_0_16:
	.word 0x81982acd  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acd, %hpstate
	.word 0x9550c000  ! 30: RDPR_TT	<illegal instruction>
	.word 0x87802020  ! 31: WRASI_I	wr	%r0, 0x0020, %asi
memptr_0_17:
	set 0x60140000, %r31
	.word 0x858165ee  ! 32: WRCCR_I	wr	%r5, 0x05ee, %ccr
tagged_0_18:
	tsubcctv %r9, 0x129c, %r2
	.word 0xd407e5ee  ! 33: LDUW_I	lduw	[%r31 + 0x05ee], %r10
cwp_0_19:
    set user_data_start, %o7
	.word 0x93902003  ! 34: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
cwp_0_20:
    set user_data_start, %o7
	.word 0x93902006  ! 35: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_21:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 36: CASA_R	casa	[%r31] %asi, %r11, %r10
	.word 0x91d02034  ! 37: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa190200d  ! 38: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd477c000  ! 39: STX_R	stx	%r10, [%r31 + %r0]
memptr_0_22:
	set 0x60740000, %r31
	.word 0x85853dc5  ! 40: WRCCR_I	wr	%r20, 0x1dc5, %ccr
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_23:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 41: CASA_R	casa	[%r31] %asi, %r11, %r10
	.word 0x87802020  ! 42: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xd437fdc5  ! 43: STH_I	sth	%r10, [%r31 + 0xfffffdc5]
pmu_0_24:
	nop
	setx 0xfffffc90fffffe59, %g1, %g7
	.word 0xa3800007  ! 44: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd4d7e030  ! 45: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
splash_lsu_0_25:
	setx 0x005b8d0f178d64a1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 46: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_26:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 47: CASA_R	casa	[%r31] %asi, %r11, %r10
splash_cmpr_0_27:
	setx 0x4dca3167acf22ee4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 48: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01967  ! 49: FqTOd	dis not found

	.word 0xd8cfe000  ! 50: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
	.word 0xd8880e40  ! 51: LDUBA_R	lduba	[%r0, %r0] 0x72, %r12
	.word 0xa1902007  ! 52: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_cmpr_0_29:
	setx 0x8ba78752cc0dd328, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 53: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 54: WRFPRS_I	wr	%r0, 0x0004, %fprs
intveclr_0_30:
	setx 0x7128d4e9a8fec2d9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 55: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01967  ! 56: FqTOd	dis not found

	.word 0xa1a00dc3  ! 57: FdMULq	fdmulq	
splash_decr_0_32:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r19, [%r1] 0x45
	.word 0xa7818004  ! 58: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r4, %-
	.word 0x30700001  ! 59: BPA	<illegal instruction>
	.word 0x87902354  ! 60: WRPR_TT_I	wrpr	%r0, 0x0354, %tt
	.word 0xa5a01a62  ! 61: FqTOi	fqtoi	
splash_cmpr_0_33:
	setx 0xe5c3265366d247fa, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01970  ! 63: FqTOd	dis not found

splash_cmpr_0_35:
	setx 0x9db2cea02152e688, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 64: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda800be0  ! 65: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r13
splash_lsu_0_36:
	setx 0xe90863a402547a11, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 66: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_37:
	setx 0xcb3d566194d6e261, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 67: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99454000  ! 68: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0xd8cfe000  ! 69: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_38:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 70: RDPC	rd	%pc, %r9
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 71: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa985000a  ! 72: WR_SET_SOFTINT_R	wr	%r20, %r10, %set_softint
	.word 0xa1902007  ! 73: WRPR_GL_I	wrpr	%r0, 0x0007, %-
memptr_0_39:
	set user_data_start, %r31
	.word 0x85807aea  ! 74: WRCCR_I	wr	%r1, 0x1aea, %ccr
cwp_0_40:
    set user_data_start, %o7
	.word 0x93902005  ! 75: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87902190  ! 76: WRPR_TT_I	wrpr	%r0, 0x0190, %tt
	.word 0x91d02034  ! 77: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_tba_0_41:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 78: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd2dfe000  ! 79: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r9
splash_tba_0_42:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 80: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_0_43:
	setx 0x8be2f5550654a528, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 81: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802058  ! 82: WRASI_I	wr	%r0, 0x0058, %asi
change_to_randtl_0_44:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_44:
	.word 0x8f902000  ! 83: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_0_45:
	setx 0xcbc9a6fd222ad947, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 84: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 85: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_46:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 86: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_hpstate_0_47:
	.word 0x81982487  ! 87: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0487, %hpstate
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 88: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x90ac8002  ! 89: ANDNcc_R	andncc 	%r18, %r2, %r8
	.word 0x99454000  ! 90: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
splash_cmpr_0_48:
	setx 0xe8a4bed3d6bc575b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 91: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_49:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f12, %f16, %f18
	.word 0xa7b24306  ! 92: ALIGNADDRESS	alignaddr	%r9, %r6, %r19
tagged_0_50:
	tsubcctv %r6, 0x1f87, %r20
	.word 0xe607faea  ! 93: LDUW_I	lduw	[%r31 + 0xfffffaea], %r19
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_51
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_51
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_51:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 94: RDPC	rd	%pc, %r11
tagged_0_52:
	tsubcctv %r20, 0x17ec, %r24
	.word 0xd607faea  ! 95: LDUW_I	lduw	[%r31 + 0xfffffaea], %r11
	.word 0x87802088  ! 96: WRASI_I	wr	%r0, 0x0088, %asi
debug_0_53:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 97: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_54:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_54:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_54
    nop
debug_wait0_54:
    ld [%r23], %r16
    brnz %r16, debug_wait0_54
    nop
    ba,a debug_startwait0_54
continue_debug_0_54:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_54:
    cmp %r13, %r15
    bne,a wait_for_stat_0_54
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_54:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_54
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00492  ! 98: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
splash_cmpr_0_55:
	setx 0x8575e5bd1e566a83, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 99: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01974  ! 100: FqTOd	dis not found

splash_cmpr_0_57:
	setx 0xc076d50c91020a01, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5a00566  ! 102: FSQRTq	fsqrt	
intveclr_0_58:
	setx 0x5cab4b5c93b46b96, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 103: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_0_59:
	.word 0x8198255f  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055f, %hpstate
	.word 0x8d9030c1  ! 105: WRPR_PSTATE_I	wrpr	%r0, 0x10c1, %pstate
	.word 0xe53fc000  ! 106: STDF_R	std	%f18, [%r0, %r31]
cwp_0_60:
    set user_data_start, %o7
	.word 0x93902004  ! 107: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x26700001  ! 108: BPL	<illegal instruction>
	.word 0x9b480000  ! 109: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0xdad80e40  ! 110: LDXA_R	ldxa	[%r0, %r0] 0x72, %r13
	.word 0x2c700001  ! 111: BPNEG	<illegal instruction>
debug_0_61:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 112: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_0_62:
	nop
	setx 0xfffff47afffff6a9, %g1, %g7
	.word 0xa3800007  ! 113: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xda800b40  ! 114: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r13
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 115: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93d02034  ! 116: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xdad004a0  ! 117: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_63
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_63:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 118: RDPC	rd	%pc, %r18
cmp_0_64:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_64:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_64
    nop
cmp_wait0_64:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_64
    nop
    ba,a cmp_startwait0_64
continue_cmp_0_64:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 26, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91904005  ! 119: WRPR_PIL_R	wrpr	%r1, %r5, %pil
	.word 0xe48008a0  ! 120: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x87802080  ! 121: WRASI_I	wr	%r0, 0x0080, %asi
memptr_0_65:
	set 0x60740000, %r31
	.word 0x85832aa8  ! 122: WRCCR_I	wr	%r12, 0x0aa8, %ccr
cwp_0_66:
    set user_data_start, %o7
	.word 0x93902007  ! 123: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 124: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9814005  ! 125: WR_SET_SOFTINT_R	wr	%r5, %r5, %set_softint
	.word 0xa1902001  ! 126: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x97a289c4  ! 127: FDIVd	fdivd	%f10, %f4, %f42
debug_0_67:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 128: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_68:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 129: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 130: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x87802088  ! 131: WRASI_I	wr	%r0, 0x0088, %asi
debug_0_69:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_69:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_69
    nop
debug_wait0_69:
    ld [%r23], %r16
    brnz %r16, debug_wait0_69
    nop
    ba,a debug_startwait0_69
continue_debug_0_69:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_69:
    cmp %r13, %r15
    bne,a wait_for_stat_0_69
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_69:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_69
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00492  ! 132: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
DS_0_70:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xab59a8bb	! Random illegal ?
	.word 0xe9108014  ! 1: LDQF_R	-	[%r2, %r20], %f20
	.word 0x91a24833  ! 133: FADDs	fadds	%f9, %f19, %f8
	.word 0xd0d00e40  ! 134: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r8
cmp_0_71:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_71:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_71
    nop
cmp_wait0_71:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_71
    nop
    ba,a cmp_startwait0_71
continue_cmp_0_71:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 46, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91950011  ! 135: WRPR_PIL_R	wrpr	%r20, %r17, %pil
splash_tba_0_72:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 136: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_0_73:
	setx 0x19f96d5aed9475d5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 137: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 138: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xa9a00165  ! 139: FABSq	dis not found

	.word 0x87802088  ! 140: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x91480000  ! 141: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
debug_0_74:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 142: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd027eaa8  ! 143: STW_I	stw	%r8, [%r31 + 0x0aa8]
splash_lsu_0_75:
	setx 0xdf2d42f78f22cc57, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 144: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_76
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_76
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_76:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 145: RDPC	rd	%pc, %r11
debug_0_77:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 146: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802083  ! 147: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0x87902285  ! 148: WRPR_TT_I	wrpr	%r0, 0x0285, %tt
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_78) + 32, 16, 16)) -> intp(7,0,25)
intvec_0_78:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 150: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_79:
	setx 0x9bb4053f70d4612b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 151: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd68804a0  ! 152: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
mondo_0_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d918001  ! 153: WRPR_WSTATE_R	wrpr	%r6, %r1, %wstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_81:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e001  ! 154: CASA_R	casa	[%r31] %asi, %r1, %r11
DS_0_82:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 155: SAVE_R	save	%r31, %r0, %r31
	.word 0x98810013  ! 156: ADDcc_R	addcc 	%r4, %r19, %r12
splash_cmpr_0_83:
	setx 0x3f32bc0a01a24936, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 157: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd86feaa8  ! 158: LDSTUB_I	ldstub	%r12, [%r31 + 0x0aa8]
splash_cmpr_0_84:
	setx 0x116abd46cba2305f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 159: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd897e030  ! 160: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_85
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_85:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 161: RDPC	rd	%pc, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r16
mondo_0_86:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d944001  ! 163: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
	.word 0x8d902adb  ! 164: WRPR_PSTATE_I	wrpr	%r0, 0x0adb, %pstate
	.word 0x2e700001  ! 165: BPVS	<illegal instruction>
	.word 0xe097e020  ! 166: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r16
donret_0_87:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_87-donret_0_87-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_87:
	.word 0xe0ffeaa8  ! 167: SWAPA_I	swapa	%r16, [%r31 + 0x0aa8] %asi
	.word 0x87802016  ! 168: WRASI_I	wr	%r0, 0x0016, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_88)+8, 16, 16)) -> intp(0,1,3)
xir_0_88:
	.word 0xa98335ec  ! 169: WR_SET_SOFTINT_I	wr	%r12, 0x15ec, %set_softint
splash_hpstate_0_89:
	.word 0x819826d4  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d4, %hpstate
DS_0_90:
	.word 0xa7a189d2  ! 1: FDIVd	fdivd	%f6, %f18, %f50
	.word 0xf36b87f6	! Random illegal ?
	.word 0xa5a009cc  ! 1: FDIVd	fdivd	%f0, %f12, %f18
	.word 0x9ba4482a  ! 171: FADDs	fadds	%f17, %f10, %f13
	.word 0xad8071ca  ! 172: WR_SOFTINT_REG_I	wr	%r1, 0x11ca, %softint
	.word 0x87902193  ! 173: WRPR_TT_I	wrpr	%r0, 0x0193, %tt
splash_decr_0_91:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa7840011  ! 174: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r17, %-
donret_0_92:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_92-donret_0_92), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_92:
	.word 0xdafff1ca  ! 175: SWAPA_I	swapa	%r13, [%r31 + 0xfffff1ca] %asi
	.word 0xdac00e60  ! 176: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r13
intveclr_0_93:
	setx 0xaf906d38ebc4348e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 177: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_94:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d95000d  ! 178: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
DS_0_95:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 179: RESTORE_R	restore	%r31, %r0, %r31
tagged_0_96:
	tsubcctv %r12, 0x1e00, %r21
	.word 0xda07f1ca  ! 180: LDUW_I	lduw	[%r31 + 0xfffff1ca], %r13
splash_tba_0_97:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 181: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_0_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 182: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xab84bbf7  ! 183: WR_CLEAR_SOFTINT_I	wr	%r18, 0x1bf7, %clear_softint
change_to_randtl_0_99:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_99:
	.word 0x8f902000  ! 184: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_0_100:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 185: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_0_101:
	taddcctv %r25, 0x15c3, %r14
	.word 0xda07fbf7  ! 186: LDUW_I	lduw	[%r31 + 0xfffffbf7], %r13
cmp_0_102:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_102:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_102
    nop
cmp_wait0_102:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_102
    nop
    ba,a cmp_startwait0_102
continue_cmp_0_102:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x44, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9191c014  ! 187: WRPR_PIL_R	wrpr	%r7, %r20, %pil
	.word 0x8780208a  ! 188: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0x8d9021fa  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x01fa, %pstate
debug_0_103:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 190: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xda97e000  ! 191: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r13
splash_lsu_0_104:
	setx 0xe7a7d52daddff90b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 192: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_105:
	setx 0x9a58dfa409e26fe8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 193: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_106:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 194: CASA_R	casa	[%r31] %asi, %r20, %r13
	.word 0x87802058  ! 195: WRASI_I	wr	%r0, 0x0058, %asi
debug_0_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 196: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_108:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 197: SAVE_R	save	%r31, %r0, %r31
	.word 0x96faa15f  ! 198: SDIVcc_I	sdivcc 	%r10, 0x015f, %r11
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 199: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d9020db  ! 200: WRPR_PSTATE_I	wrpr	%r0, 0x00db, %pstate
memptr_0_109:
	set 0x60540000, %r31
	.word 0x858539c7  ! 201: WRCCR_I	wr	%r20, 0x19c7, %ccr
	.word 0x99a00162  ! 202: FABSq	dis not found

splash_cmpr_0_110:
	setx 0x3b34d4a66f47e527, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 203: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8800ae0  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r12
	.word 0xa683643a  ! 205: ADDcc_I	addcc 	%r13, 0x043a, %r19
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_111
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_111
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_111:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 206: RDPC	rd	%pc, %r20
	.word 0x81510000  ! 207: RDPR_TICK	<illegal instruction>
	.word 0x87902074  ! 208: WRPR_TT_I	wrpr	%r0, 0x0074, %tt
	.word 0x93d02033  ! 209: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xe8d00e80  ! 210: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a0196d  ! 211: FqTOd	dis not found

DS_0_113:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa3a009c9  ! 1: FDIVd	fdivd	%f0, %f40, %f48
	normalw
	.word 0x97458000  ! 212: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xd66fe43a  ! 213: LDSTUB_I	ldstub	%r11, [%r31 + 0x043a]
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_114
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_114:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 214: RDPC	rd	%pc, %r9
intveclr_0_115:
	setx 0x979d6ec74c567384, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 215: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa784f427  ! 216: WR_GRAPHICS_STATUS_REG_I	wr	%r19, 0x1427, %-
debug_0_116:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 217: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9868ea77  ! 218: UDIVX_I	udivx 	%r3, 0x0a77, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916823a9  ! 219: SDIVX_I	sdivx	%r0, 0x03a9, %r8
	.word 0x36700001  ! 220: BPGE	<illegal instruction>
	.word 0xd0880e60  ! 221: LDUBA_R	lduba	[%r0, %r0] 0x73, %r8
	.word 0x8780208a  ! 222: WRASI_I	wr	%r0, 0x008a, %asi
splash_tba_0_118:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 223: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_0_119:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa7a089d4  ! 1: FDIVd	fdivd	%f2, %f20, %f50
	.word 0xd112c013  ! 1: LDQF_R	-	[%r11, %r19], %f8
	.word 0x95a00834  ! 224: FADDs	fadds	%f0, %f20, %f10
mondo_0_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d92c006  ! 225: WRPR_WSTATE_R	wrpr	%r11, %r6, %wstate
	.word 0xd4c804a0  ! 226: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
DS_0_121:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 227: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd497e000  ! 228: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
intveclr_0_122:
	setx 0xaad55928be6fbb97, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 229: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_123:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x91a0054d  ! 1: FSQRTd	fsqrt	
	.word 0x91a20827  ! 230: FADDs	fadds	%f8, %f7, %f8
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_124)+24, 16, 16)) -> intp(0,1,3)
xir_0_124:
	.word 0xa9853a58  ! 231: WR_SET_SOFTINT_I	wr	%r20, 0x1a58, %set_softint
DS_0_125:
	.word 0xa3a489c3  ! 1: FDIVd	fdivd	%f18, %f34, %f48
	.word 0xd7344013  ! 1: STQF_R	-	%f11, [%r19, %r17]
	normalw
	.word 0xa5458000  ! 232: RD_SOFTINT_REG	rd	%softint, %r18
mondo_0_126:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d91c005  ! 233: WRPR_WSTATE_R	wrpr	%r7, %r5, %wstate
	.word 0x87802010  ! 234: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xe49004a0  ! 235: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 236: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903bae  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x1bae, %pstate
	.word 0xe527c000  ! 238: STF_R	st	%f18, [%r0, %r31]
mondo_0_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d920003  ! 239: WRPR_WSTATE_R	wrpr	%r8, %r3, %wstate
	.word 0x9350c000  ! 240: RDPR_TT	<illegal instruction>
	.word 0xa7480000  ! 241: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_128
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_128:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 242: RDPC	rd	%pc, %r19
mondo_0_129:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d91800c  ! 243: WRPR_WSTATE_R	wrpr	%r6, %r12, %wstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_130:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r19
	setx 0xe2bd905ad5a90149, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_131:
	.word 0x39400001  ! 245: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_132:
	setx 0x2dc6f27305b535bf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 246: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_133:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 247: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_134) + 8, 16, 16)) -> intp(5,0,7)
intvec_0_134:
	.word 0x39400001  ! 248: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 249: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe6880e40  ! 250: LDUBA_R	lduba	[%r0, %r0] 0x72, %r19
splash_hpstate_0_135:
	.word 0x8198272e  ! 251: WRHPR_HPSTATE_I	wrhpr	%r0, 0x072e, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01968  ! 252: FqTOd	dis not found

	.word 0x97a00161  ! 253: FABSq	dis not found

	.word 0xd73fc000  ! 254: STDF_R	std	%f11, [%r0, %r31]
	.word 0x8d903080  ! 255: WRPR_PSTATE_I	wrpr	%r0, 0x1080, %pstate
	.word 0x8d903475  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x1475, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996b25b7  ! 257: SDIVX_I	sdivx	%r12, 0x05b7, %r12
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8780208a  ! 259: WRASI_I	wr	%r0, 0x008a, %asi
debug_0_138:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_138:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_138
    nop
debug_wait0_138:
    ld [%r23], %r16
    brnz %r16, debug_wait0_138
    nop
    ba,a debug_startwait0_138
continue_debug_0_138:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_138:
    cmp %r13, %r15
    bne,a wait_for_stat_0_138
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_138:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_138
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd2f00492  ! 260: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r12
debug_0_139:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 262: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab828011  ! 263: WR_CLEAR_SOFTINT_R	wr	%r10, %r17, %clear_softint
debug_0_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 264: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x879023eb  ! 265: WRPR_TT_I	wrpr	%r0, 0x03eb, %tt
DS_0_141:
	.word 0x99a409cc  ! 1: FDIVd	fdivd	%f16, %f12, %f12
	.word 0xbfe7c000  ! 266: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_142) + 32, 16, 16)) -> intp(5,0,11)
intvec_0_142:
	.word 0x39400001  ! 267: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01969  ! 268: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 269: LDX_R	ldx	[%r31 + %r0], %r12
memptr_0_144:
	set user_data_start, %r31
	.word 0x858427ca  ! 270: WRCCR_I	wr	%r16, 0x07ca, %ccr
debug_0_145:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 271: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa980c012  ! 272: WR_SET_SOFTINT_R	wr	%r3, %r18, %set_softint
	.word 0x81510000  ! 273: RDPR_TICK	<illegal instruction>
memptr_0_146:
	set 0x60540000, %r31
	.word 0x858375cd  ! 274: WRCCR_I	wr	%r13, 0x15cd, %ccr
	.word 0xa1902009  ! 275: WRPR_GL_I	wrpr	%r0, 0x0009, %-
memptr_0_147:
	set user_data_start, %r31
	.word 0x8581b129  ! 276: WRCCR_I	wr	%r6, 0x1129, %ccr
	.word 0x87802058  ! 277: WRASI_I	wr	%r0, 0x0058, %asi
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_148
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_148:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 278: RDPC	rd	%pc, %r12
pmu_0_149:
	nop
	setx 0xfffffe12fffffc47, %g1, %g7
	.word 0xa3800007  ! 279: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_0_150:
	setx 0xce191061763c36fb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 280: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01971  ! 281: FqTOd	dis not found

splash_cmpr_0_152:
	setx 0xbfb80eb65c6fc861, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 282: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902001  ! 283: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xd6800c20  ! 284: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r11
debug_0_153:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_153:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_153
    nop
debug_wait0_153:
    ld [%r23], %r16
    brnz %r16, debug_wait0_153
    nop
    ba,a debug_startwait0_153
continue_debug_0_153:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_153:
    cmp %r13, %r15
    bne,a wait_for_stat_0_153
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_153:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_153
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00492  ! 285: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
splash_hpstate_0_154:
	.word 0x81982ade  ! 286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ade, %hpstate
splash_hpstate_0_155:
	.word 0x81982107  ! 287: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0107, %hpstate
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_156
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_156
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_156:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 288: RDPC	rd	%pc, %r18
splash_tba_0_157:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 289: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_158
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_158
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_158:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 290: RDPC	rd	%pc, %r13
memptr_0_159:
	set user_data_start, %r31
	.word 0x8581a543  ! 291: WRCCR_I	wr	%r6, 0x0543, %ccr
	.word 0x8d902586  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x0586, %pstate
	.word 0x99480000  ! 293: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
debug_0_160:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 294: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902852  ! 295: WRPR_PSTATE_I	wrpr	%r0, 0x0852, %pstate
memptr_0_161:
	set 0x60340000, %r31
	.word 0x8581ab05  ! 296: WRCCR_I	wr	%r6, 0x0b05, %ccr
	.word 0x3c700001  ! 297: BPPOS	<illegal instruction>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_162:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 298: CASA_R	casa	[%r31] %asi, %r17, %r12
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_163
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_163:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 299: RDPC	rd	%pc, %r12
splash_cmpr_0_164:
	setx 0x68c8452c249005fd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 300: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903ae2  ! 301: WRPR_PSTATE_I	wrpr	%r0, 0x1ae2, %pstate
debug_0_165:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_165:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_165
    nop
debug_wait0_165:
    ld [%r23], %r16
    brnz %r16, debug_wait0_165
    nop
    ba,a debug_startwait0_165
continue_debug_0_165:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_165:
    cmp %r13, %r15
    bne,a wait_for_stat_0_165
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_165:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_165
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00492  ! 302: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_166)+8, 16, 16)) -> intp(0,1,3)
xir_0_166:
	.word 0xa984a4ae  ! 303: WR_SET_SOFTINT_I	wr	%r18, 0x04ae, %set_softint
splash_cmpr_0_167:
	setx 0xf19d2611ef0f20f7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 304: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 305: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_0_168:
	tsubcctv %r1, 0x1dd1, %r26
	.word 0xd807e4ae  ! 306: LDUW_I	lduw	[%r31 + 0x04ae], %r12
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_169
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_169
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_169:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 307: RDPC	rd	%pc, %r8
	.word 0xa190200f  ! 308: WRPR_GL_I	wrpr	%r0, 0x000f, %-
memptr_0_170:
	set 0x60540000, %r31
	.word 0x8581a758  ! 309: WRCCR_I	wr	%r6, 0x0758, %ccr
DS_0_171:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa7b34304  ! 310: ALIGNADDRESS	alignaddr	%r13, %r4, %r19
	.word 0xe677e758  ! 311: STX_I	stx	%r19, [%r31 + 0x0758]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936cb261  ! 312: SDIVX_I	sdivx	%r18, 0xfffff261, %r9
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 313: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_decr_0_173:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa7840002  ! 314: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r2, %-
	.word 0x93a449c3  ! 315: FDIVd	fdivd	%f48, %f34, %f40
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9168ff9f  ! 316: SDIVX_I	sdivx	%r3, 0xffffff9f, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x81510000  ! 318: RDPR_TICK	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01971  ! 319: FqTOd	dis not found

DS_0_176:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 320: SAVE_R	save	%r31, %r0, %r31
	.word 0x99a00172  ! 321: FABSq	dis not found

	.word 0x9ba00171  ! 322: FABSq	dis not found

	.word 0xa190200e  ! 323: WRPR_GL_I	wrpr	%r0, 0x000e, %-
change_to_randtl_0_177:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_177:
	.word 0x8f902001  ! 324: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa7a0016a  ! 325: FABSq	dis not found

	.word 0x879022f2  ! 326: WRPR_TT_I	wrpr	%r0, 0x02f2, %tt
	.word 0x8790234c  ! 327: WRPR_TT_I	wrpr	%r0, 0x034c, %tt
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_178
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_178
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_178:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 328: RDPC	rd	%pc, %r8
	.word 0x91916fd5  ! 329: WRPR_PIL_I	wrpr	%r5, 0x0fd5, %pil
	.word 0x3e800001  ! 330: BVC	bvc,a	<label_0x1>
memptr_0_179:
	set 0x60740000, %r31
	.word 0x8585282e  ! 331: WRCCR_I	wr	%r20, 0x082e, %ccr
splash_cmpr_0_180:
	setx 0x09025097603f82a1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 332: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_181:
	setx 0xb2f233e39e109fa9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 333: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_182:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 334: CASA_R	casa	[%r31] %asi, %r10, %r8
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 335: CASA_R	casa	[%r31] %asi, %r10, %r8
DS_0_184:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f24, %f30, %f10
	.word 0x97b04313  ! 336: ALIGNADDRESS	alignaddr	%r1, %r19, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 337: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xa190200c  ! 338: WRPR_GL_I	wrpr	%r0, 0x000c, %-
tagged_0_185:
	taddcctv %r23, 0x114c, %r2
	.word 0xd607e82e  ! 339: LDUW_I	lduw	[%r31 + 0x082e], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_186) + 0, 16, 16)) -> intp(2,0,13)
intvec_0_186:
	.word 0x39400001  ! 340: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe010  ! 341: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 342: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_0_187:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_187:
	.word 0x8f902000  ! 343: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd66fe82e  ! 344: LDSTUB_I	ldstub	%r11, [%r31 + 0x082e]
	.word 0x87802014  ! 345: WRASI_I	wr	%r0, 0x0014, %asi
intveclr_0_188:
	setx 0x681714b491549e4a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 346: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_189:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_189:
	.word 0x8f902000  ! 347: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_0_190:
	setx 0x78ea76712ce96317, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 348: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b2  ! 349: Tcc_I	tne	icc_or_xcc, %r0 + 178
debug_0_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 350: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_192) + 0, 16, 16)) -> intp(6,0,24)
intvec_0_192:
	.word 0x39400001  ! 351: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_193
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_193:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 352: RDPC	rd	%pc, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01961  ! 353: FqTOd	dis not found

change_to_randtl_0_195:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_195:
	.word 0x8f902002  ! 354: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_lsu_0_196:
	setx 0xde3200f1a29c0f8b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 355: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 356: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
debug_0_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 357: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_198)+8, 16, 16)) -> intp(0,1,3)
xir_0_198:
	.word 0xa982a831  ! 358: WR_SET_SOFTINT_I	wr	%r10, 0x0831, %set_softint
	.word 0x99902002  ! 359: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
splash_lsu_0_199:
	setx 0xfcc26e5ccdd230f7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 360: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 361: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01973  ! 362: FqTOd	dis not found

cwp_0_201:
    set user_data_start, %o7
	.word 0x93902007  ! 363: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
change_to_randtl_0_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_202:
	.word 0x8f902002  ! 364: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd937e831  ! 365: STQF_I	-	%f12, [0x0831, %r31]
	.word 0x87902118  ! 366: WRPR_TT_I	wrpr	%r0, 0x0118, %tt
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_203:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e013  ! 367: CASA_R	casa	[%r31] %asi, %r19, %r12
tagged_0_204:
	tsubcctv %r17, 0x12a1, %r9
	.word 0xd807e831  ! 368: LDUW_I	lduw	[%r31 + 0x0831], %r12
	.word 0xd847c000  ! 369: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0xd81fc000  ! 370: LDD_R	ldd	[%r31 + %r0], %r12
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_205
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_205:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 371: RDPC	rd	%pc, %r13
	.word 0x8d9023c2  ! 372: WRPR_PSTATE_I	wrpr	%r0, 0x03c2, %pstate
splash_lsu_0_206:
	setx 0x8bccb1a614dd295d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 373: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 374: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d902cd8  ! 375: WRPR_PSTATE_I	wrpr	%r0, 0x0cd8, %pstate
splash_hpstate_0_207:
	.word 0x819821e4  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01e4, %hpstate
cmp_0_208:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_208:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_208
    nop
cmp_wait0_208:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_208
    nop
    ba,a cmp_startwait0_208
continue_cmp_0_208:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xf2, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91928003  ! 377: WRPR_PIL_R	wrpr	%r10, %r3, %pil
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_209
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_209:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e003  ! 378: CASA_R	casa	[%r31] %asi, %r3, %r13
cwp_0_210:
    set user_data_start, %o7
	.word 0x93902005  ! 379: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902908  ! 380: WRPR_PSTATE_I	wrpr	%r0, 0x0908, %pstate
	.word 0xdac7e010  ! 381: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r13
	.word 0xdb27c000  ! 382: STF_R	st	%f13, [%r0, %r31]
change_to_randtl_0_211:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_211:
	.word 0x8f902003  ! 383: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
cmp_0_212:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_212:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_212
    nop
cmp_wait0_212:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_212
    nop
    ba,a cmp_startwait0_212
continue_cmp_0_212:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x86, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91918009  ! 384: WRPR_PIL_R	wrpr	%r6, %r9, %pil
splash_cmpr_0_213:
	setx 0x78f3679a2f2ea4f1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 385: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdadfe010  ! 386: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
tagged_0_214:
	tsubcctv %r12, 0x172d, %r13
	.word 0xda07e831  ! 387: LDUW_I	lduw	[%r31 + 0x0831], %r13
debug_0_215:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 388: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_0_216:
	setx 0xce8e38018b289712, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32800001  ! 390: BNE	bne,a	<label_0x1>
	.word 0x83d02034  ! 391: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xdadfe030  ! 392: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
	.word 0x8790219b  ! 393: WRPR_TT_I	wrpr	%r0, 0x019b, %tt
mondo_0_217:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d93000b  ! 394: WRPR_WSTATE_R	wrpr	%r12, %r11, %wstate
	.word 0x87902356  ! 395: WRPR_TT_I	wrpr	%r0, 0x0356, %tt
splash_tba_0_218:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 396: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d9022a5  ! 397: WRPR_PSTATE_I	wrpr	%r0, 0x02a5, %pstate
splash_cmpr_0_219:
	setx 0x47158ce708584fe4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5a489d0  ! 399: FDIVd	fdivd	%f18, %f16, %f18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936c791d  ! 400: SDIVX_I	sdivx	%r17, 0xfffff91d, %r9
cmpenall_0_221:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmpenall_startwait0_221:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_0_221
    nop
cmpenall_wait0_221:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait0_221
    nop
    ba,a cmpenall_startwait0_221
continue_cmpenall_0_221:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_0_221:
    cmp %r13, %r15
    bne,a wait_for_cmpstat_0_221
    ldxa [0x58]%asi, %r15       !Running_status
    mov 0xff, %r14              !All threads running
    stxa %r14, [0x50]%asi 
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_cmpstat2_0_221:
    cmp %r14, %r15
    bne,a wait_for_cmpstat2_0_221
    ldxa [0x58]%asi, %r15       !Running_status
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

	.xword	0x64da7df8c15eb166
	.xword	0xcbb1d8caf94a5e6c
	.xword	0xf0948084465432b8
	.xword	0x7fe25c33dbc11c72
	.xword	0x3699ccce85e236b7
	.xword	0x95bf3349629f4072
	.xword	0xfa0b5d46f1728e40
	.xword	0x4700ff42e1df1566
	.xword	0x60c06017d34e9987
	.xword	0x501fe5f15081bd65
	.xword	0x5d856992ab3d29ad
	.xword	0xe7aaa87f3d3ae8ce
	.xword	0xf5c2a8758c73ba88
	.xword	0x7b846e5111830e53
	.xword	0x3dacd6debff3d0a3
	.xword	0xcf051fbc0b7eec6f
	.xword	0x74dd489a4c3173c9
	.xword	0x86d071591c40ee00
	.xword	0xeae930ced7a771d5
	.xword	0x0f9a058eb8fb8bf8
	.xword	0xd68bf43e04c19abf
	.xword	0x954af07f5b61751f
	.xword	0x79a45dab497a7945
	.xword	0x32a762729365e0e8
	.xword	0xbea824562a81a25c
	.xword	0xa3bfbe08c44fcb32
	.xword	0xadc583cfa2b2dfa1
	.xword	0xc6de122667e236c3
	.xword	0xcd290d8971a921cf
	.xword	0x908bffeddf19506a
	.xword	0x29b1ac6a3453bf94
	.xword	0x9aa8d559c7a4de78
	.xword	0x8f740ae73c75cdc7
	.xword	0xa187643402c9b19a
	.xword	0x592a8699cb5758c6
	.xword	0x13acc3733f71055d
	.xword	0xe712777e2863b85a
	.xword	0x23b80049628d8789
	.xword	0x13c831d70e08207d
	.xword	0xcd65a557b960da8a
	.xword	0x3c98b0c37b9697d1
	.xword	0x6cabc5bc711f60e5
	.xword	0xf683de4d9f64177e
	.xword	0xdec68dacfdef16b7
	.xword	0x51e5991e8af43c95
	.xword	0x5549ca0124a6f3f5
	.xword	0xb35308f9b5f8e6f6
	.xword	0x6d3d76dd4f0f36ec
	.xword	0xbbce220318a8d4c2
	.xword	0x9a0aeef5bb40e6ac
	.xword	0x71d4dcde2ee5df8c
	.xword	0x509e6692afececae
	.xword	0x29e47f8ded189e56
	.xword	0x36e4ad3cc11661f3
	.xword	0x054f21d2e2c40f3f
	.xword	0xa5eb88c1cd4302cb
	.xword	0x23fc8c046b4a3006
	.xword	0xd6f3a71e0eed35d6
	.xword	0x9950d22a1ade343d
	.xword	0x5c059728fd624c02
	.xword	0xa6f55d8384d60dcf
	.xword	0xe9d371fa02cb0636
	.xword	0xf5d4fc71a901967d
	.xword	0xfbd7133f1ccb843f
	.xword	0x0bc76279e16df2cf
	.xword	0xa8435cfd867f39bf
	.xword	0x0aa7ddbe3f5be0af
	.xword	0xcd5d87d7a950a8f7
	.xword	0x3aeeb71413aa0ce0
	.xword	0x994a3a11973f02f7
	.xword	0x0608b39fbb284e47
	.xword	0x751fda6be22aeea3
	.xword	0x3e0dd16fa184478c
	.xword	0xd61e66d57072b294
	.xword	0x98d816a41d11e85f
	.xword	0x1691f2a12781cfd7
	.xword	0x6743402099711353
	.xword	0x5d9ff9923e9d530c
	.xword	0x32cb640f4b6c7ae8
	.xword	0x152f371873c000f0
	.xword	0x9653ed9c7177300a
	.xword	0x8a8fd6b981c79a6a
	.xword	0x2a894f800c7cee79
	.xword	0xb55e2f34928186c9
	.xword	0xc81071878e8b8ecd
	.xword	0x41d6007eafee99cd
	.xword	0xce5c7a355616bfef
	.xword	0x77dd3b026b7b710c
	.xword	0xdb4ddb13564a4607
	.xword	0x17a25d7d6b86ad40
	.xword	0xdc299e3f034f24ad
	.xword	0x60f5d00aba3320a5
	.xword	0xc5db089e95afb4be
	.xword	0x0bad21fc269671a3
	.xword	0xf5e577c23c4fbe0c
	.xword	0xace2fd8c608cf2fa
	.xword	0xa8010cbe687af08c
	.xword	0x215c96363777fb27
	.xword	0xeb1ffc4b056938df
	.xword	0xb3c650eb656ea070
	.xword	0x5c2ac32bfc93aa83
	.xword	0x0020d07d5661fec7
	.xword	0xaec207baf6e021f6
	.xword	0x92eb8deb5d95c2a3
	.xword	0x84946a1bb5454b45
	.xword	0x5caefbb6c7ac5c1b
	.xword	0xfa20432260c4466e
	.xword	0x1682004993ba97ae
	.xword	0x0f5081c769449479
	.xword	0x3c7c407dc261c228
	.xword	0xae732cfcf4ea915b
	.xword	0x0e121f4de5e6d1f0
	.xword	0x6200b50755e16232
	.xword	0x1549302bb4b21fcc
	.xword	0xfe1229eff800e730
	.xword	0x2727d323325ea4fc
	.xword	0x4b2684fd712db143
	.xword	0xeebcfa7a4828c6d8
	.xword	0xf6a84e95f42981be
	.xword	0x3ced599ab5ee38be
	.xword	0x6cc7925d05f5c07c
	.xword	0x0ea790774d01b593
	.xword	0x924617db39ed5965
	.xword	0xeb3273a417befc45
	.xword	0xbefd379a30afdd68
	.xword	0x9e40b0bf1a19c55e
	.xword	0x4ceae36570323f21
	.xword	0xb9ed256103793458
	.xword	0x2f543c9ef802a687
	.xword	0xacc3142a360a0578
	.xword	0x643a0bd4ab365284
	.xword	0xdd4d296b60826976
	.xword	0x8a196f057e814ee1
	.xword	0x46f6cf52b150d9a3
	.xword	0x04e768b4024b1898
	.xword	0x7029d02b1d0bd276
	.xword	0xba3980c1cb46ebaf
	.xword	0x6729127d8934848f
	.xword	0xf0148b0e6ac5660e
	.xword	0x8dc1cf9a81db8d9c
	.xword	0xc12e60210cf36c90
	.xword	0xbd45aa9f42f49a08
	.xword	0x48c812bd7ecb210b
	.xword	0x911f6b94ddeb7521
	.xword	0xc0e0045a406fe4a0
	.xword	0xb63c39aaebd33a36
	.xword	0x7b52f17904766de8
	.xword	0x70ed64a1fed6fe18
	.xword	0x32020161b1314d00
	.xword	0x09b28a09de47ca64
	.xword	0xc7dbca3e5b8400d8
	.xword	0x2e03d18c555b6feb
	.xword	0xad92e30605f09d88
	.xword	0xbeb5512b0ba808af
	.xword	0xc40ce0c1742e5898
	.xword	0xaad5f82b673f87f3
	.xword	0xed59f125e280aca6
	.xword	0x78825384806b92f6
	.xword	0x5913ebd64d68fa01
	.xword	0xfbff26fd7085fc0c
	.xword	0xc1f47bd641e64321
	.xword	0x54391b49417f79aa
	.xword	0x33f251aca50d83be
	.xword	0x380646dd3a8bbb1f
	.xword	0x3cbd87c9877bcc73
	.xword	0x7cbba66dfd9c123e
	.xword	0x5de0ecee30b42eff
	.xword	0x5a12f1c186f9bfaa
	.xword	0xf6aabc50c92132d8
	.xword	0xb822fc5767b0d626
	.xword	0xe9c1a1ed02603902
	.xword	0x1b822fd7c66a602f
	.xword	0xc8f05059b65c7390
	.xword	0xcd925e318bd17b7f
	.xword	0x7d7d97a29663e254
	.xword	0x2dbb40622f3641db
	.xword	0x6edf71f94d33947b
	.xword	0xe2e12152a9d5598a
	.xword	0xb52e753b57647fc8
	.xword	0x53df7380f229f2dc
	.xword	0xe05bf3fd5ea89cf9
	.xword	0x9e05c9d5cec3ab83
	.xword	0x3fdf1b239e816c7a
	.xword	0xef37f86fb04c60f1
	.xword	0xcfb33df6c55bfa7e
	.xword	0x014fce361c695703
	.xword	0x718d42cab957ac4d
	.xword	0xd29e48df2c6b2f26
	.xword	0x350a28ce2260c881
	.xword	0xc34525a58c76d0de
	.xword	0xc2752b833e30fab0
	.xword	0xff09ecb294b665a5
	.xword	0x2062fb482a6e4413
	.xword	0x083d84d4f27f5cee
	.xword	0x40c768fd02cc003d
	.xword	0x95d322d5f2527a8c
	.xword	0x32eee9a6fa026efa
	.xword	0xc8042b96103440db
	.xword	0x4bf3e2b39ab893fb
	.xword	0xa0701d4d5db0919d
	.xword	0xc42d94ec028d60df
	.xword	0xdfa8873f447e2314
	.xword	0x926a9215c0374dc2
	.xword	0x8f3cd4f5cf823528
	.xword	0xdcca80f2cf6fecdb
	.xword	0x6d9ce1fcc9ae16e8
	.xword	0x072dce34b17f3d4b
	.xword	0x50c11698b3e7c6f1
	.xword	0x7669d30ee0f80446
	.xword	0xe8a569dab264eaef
	.xword	0x37e7bd64652e9786
	.xword	0xf006f2722ed0521c
	.xword	0x682d3358b3a155fa
	.xword	0x26a6382c4815d396
	.xword	0xb730007ed46b495b
	.xword	0xa9a93049f008006e
	.xword	0xdd878f9923b67db9
	.xword	0x4b1e58fe928f9222
	.xword	0xf5759966bf09e439
	.xword	0x2fce1b4b488b27a6
	.xword	0xc840033eca35dbfb
	.xword	0x6c7f900e7f53d5ae
	.xword	0x3ce69520aec27748
	.xword	0x1b1b0999cd4e7f8a
	.xword	0xa99980c52d39b05a
	.xword	0x167d4399bfd6cb8b
	.xword	0x269c4ea8be58ca80
	.xword	0x2c388d4d8acb8877
	.xword	0x32ccfbd85651b6f3
	.xword	0x1b76800582fc7ef8
	.xword	0x3168575dc949fdd5
	.xword	0x1f3124d23d997b57
	.xword	0x7d04bc4ed16cfb76
	.xword	0x05f2220f0c2e09b4
	.xword	0x0ae16f3a5133e4d6
	.xword	0x89f3e0a352cdd82d
	.xword	0xe71246f06f9f6c9e
	.xword	0x8ad9a846fd37d821
	.xword	0x4f25792c4695ba56
	.xword	0x1245deccffe3496d
	.xword	0x200dc6aff0f1b3f7
	.xword	0xda1c695eb5c2c7f2
	.xword	0x4acc526d28d7d1c1
	.xword	0xc13d10b604c2231a
	.xword	0xc5c774f30a298381
	.xword	0x503c7514a911afdc
	.xword	0x3fd14ffe75f4df8b
	.xword	0xba5264d3103a86ff
	.xword	0xb1abdbaa3d35c20e
	.xword	0x3a4700e50b4d6a27
	.xword	0x8d9d89ec205e6fa0
	.xword	0xbc32e9741a5628a0
	.xword	0x373fff027ae40d83
	.xword	0xb19f8c8abddf3816
	.xword	0x57f49bbd1dbce7aa
	.xword	0xd8400e507f63d6b6

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
# 492 "diag.j"
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
	TTE_X	 = 1
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
	.xword	0xfea655926ae3c1db
	.xword	0x0f49d51e562f05e2
	.xword	0x36e2c2fba10810ff
	.xword	0x1c230c1121aa5635
	.xword	0x8759da12a12ddc39
	.xword	0x6f889fda289a3d4f
	.xword	0x29f0d45a77cc228b
	.xword	0x72cf86ef115ca3d9
	.xword	0xf2700e0f1d7212ef
	.xword	0xb4e6b9765cf149fa
	.xword	0x06aafe09e4a10f98
	.xword	0x896b0dccb16576bb
	.xword	0xa7791e7d5d3320ea
	.xword	0x260fb4abe124421a
	.xword	0xb3f72307ffd605d4
	.xword	0x8dacf5a9937cc6eb
	.xword	0xbeffb4eb9800e400
	.xword	0x5c7216f36f32ad47
	.xword	0x7afe09e8693c58da
	.xword	0x0872df494fb15c3b
	.xword	0x09c19388aa5fc34a
	.xword	0xb1cd2755a29b7ff1
	.xword	0x00b839d195592cd1
	.xword	0x648e8879478fa515
	.xword	0x1c48ed2b59ff9491
	.xword	0x3094db64c226edbf
	.xword	0x95ff20de2c1ca714
	.xword	0xd3842f49032f0364
	.xword	0x215174583648614c
	.xword	0x622da1658b84ab9a
	.xword	0xdfa010a3f4299015
	.xword	0xae25f7d6b48bfaa5



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


attr_data {
	Name	 = .MyDATA_1,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_1,
	hypervisor
}

.data
	.xword	0x6abc91f5406d7be6
	.xword	0x8b902d164eabd024
	.xword	0x0ea6c3a1fece80ed
	.xword	0x35d3d78f81129101
	.xword	0xd0b94e6fc924c164
	.xword	0x22c20b695f90101c
	.xword	0x1681c9007c1718db
	.xword	0x6a2ea9cf4107cc73
	.xword	0x46f1369118fe3321
	.xword	0x52d127fdb3c00aad
	.xword	0x3cfdb9ed446f1e8a
	.xword	0xab406861ccf55165
	.xword	0xc83e2e49dfafdebd
	.xword	0xdbe44b8dc096dd3d
	.xword	0xb3e06282d29d34e5
	.xword	0x0f21cf5115c9924d
	.xword	0x41cec6285f1ed3ad
	.xword	0xaf5a65de95808f74
	.xword	0xfaf7bee1f745f133
	.xword	0x7b1a889837ec9ca5
	.xword	0xadd86933be4e3f74
	.xword	0x5bd37806fa34eb84
	.xword	0x6a7888ed4998277a
	.xword	0xfd2fa87d6865b91f
	.xword	0xc2f7ce2e28798fcf
	.xword	0x09039e61bc551f81
	.xword	0xab52abd8bda1f763
	.xword	0x01ce1d0fdce919d9
	.xword	0xc6fd1877b39e5c75
	.xword	0xf075ce746eec7fb7
	.xword	0x75ecae83f1e9e5b1
	.xword	0xd7036c22ce88b155



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
	TTE_P	 = 1,
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
	.xword	0x7c54cbec92dc5543
	.xword	0xaf69ddec2cfe166e
	.xword	0x77f5ba73410acf65
	.xword	0xa867ac95448f9c01
	.xword	0x5cd9c29fc2a25ae1
	.xword	0x0b10990b82983732
	.xword	0x9e8190c113cab61e
	.xword	0x563ea5ca0774edd2
	.xword	0x0eb4ced33b4aae35
	.xword	0xb636f01989ff0ce5
	.xword	0xd578a9c4511412bf
	.xword	0x1b055c5b8cf1caec
	.xword	0xe41ce42759a6deda
	.xword	0x2011a4a4e28d8e75
	.xword	0xde7e68eeaaf0c104
	.xword	0x06a79040a8f96427
	.xword	0x47bb6f16cef53f73
	.xword	0x48538ca48f8f6849
	.xword	0xdb8dde6b323be52d
	.xword	0xb567c2854d38a797
	.xword	0x4f806f81d96aa6c3
	.xword	0xf2ccc57d6a48153e
	.xword	0xff033481005cf18e
	.xword	0x2992a4bc6ccfbeff
	.xword	0xdaf5a6c76661ad66
	.xword	0x28936b19acdb41a4
	.xword	0xaf5ae8608136b6f7
	.xword	0xf5f2c56054314b39
	.xword	0x48ba9b2397b143f6
	.xword	0x93642486facc43a4
	.xword	0xf628ad6af43b258d
	.xword	0x89da0d79ed687775



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
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
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
	.xword	0x313b98b69cf88afb
	.xword	0x973f93c9323ede83
	.xword	0x84cbf961185ab9e4
	.xword	0x99e0a8260db7aaf2
	.xword	0x30d255b5cfc3df84
	.xword	0x1bafe3e26274f083
	.xword	0xaf22c026fee48ea3
	.xword	0xc9d0aed16f9fbfa2
	.xword	0x234c2fd456dbbdfa
	.xword	0xd57f341a50988df2
	.xword	0x8c757642fbfe11b9
	.xword	0x76c083d614fdea5d
	.xword	0xac36a9521cbbdb5a
	.xword	0x621307be21eb434a
	.xword	0x73466372aee8eeab
	.xword	0xe3b98080a37a1cc9
	.xword	0xbb5cc4d00240ba69
	.xword	0x144fe2a191492244
	.xword	0x5730c7e255dede3f
	.xword	0x5f76ea6cd8637b95
	.xword	0x087b83898935b7b4
	.xword	0xb2a3f6b15f7f34e5
	.xword	0xb10f8fe870cadc23
	.xword	0x24d956ac5cad631a
	.xword	0xde0055f02cbcff13
	.xword	0x46fba488f2dbede8
	.xword	0xd6c509b66214e170
	.xword	0x70d4bef748809d66
	.xword	0xc3fb05dacaf6d445
	.xword	0x32db2ee2842ff5ea
	.xword	0x5e35b2b3a9226fb3
	.xword	0x0523bc771320f95b



#if 0
#endif

