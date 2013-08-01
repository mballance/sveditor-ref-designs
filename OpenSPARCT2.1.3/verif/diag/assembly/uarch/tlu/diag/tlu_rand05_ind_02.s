/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_02.s
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
#define DMMU_SKIP_IF_NO_TTE
#define IMMU_SKIP_IF_NO_TTE

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
# 24 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_T1_Clean_Window_0x24
#define SUN_H_T1_Clean_Window_0x24 \
    rdpr %cleanwin, %l1;\
    add %l1,1,%l1;\
    wrpr %l1, %g0, %cleanwin;\
    retry; nop; nop; nop; nop


#define H_HT0_Software_Initiated_Reset_0x04
#define SUN_H_HT0_Software_Initiated_Reset_0x04 \
    setx Software_Reset_Handler, %g1, %g2 ;\
    jmp %g2 ;\
    nop

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
# 53 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 162 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
    inc %l6;\
    save %i7, %g0, %i7 ;\
    done ;\
    nop; 
#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 \
    restore %i7, %g0, %i7 ;\
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
    restore %i7, %g0, %i7;\
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
    stw %l5, [%i7];\
    umul %i5, 4, %l2;\
    restore %i7, %g0, %i7;\
    done; \
    nop;

#define H_HT0_Privileged_opcode_0x11
#define My_HT0_Privileged_opcode_0x11 \
    xor %i0, %l1, %l1;\
    and %l1, 0xf, %l1; \
    ba hh11_1; \
    not %g0, %l2; \
    hh11_2: done; \
    hh11_1: xor %l1, %l2, %l2; \
    ba hh11_2; \
    jmp %l2;

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
    ba h11_1; \
    not %g0, %l2; \
    h11_2: done; \
    h11_1: xor %l1, %l2, %l2; \
    ba h11_2; \
    jmp %l2;

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
    and %l3, 0xfff, %l3;\
    wrpr %l3, %tstate ;\
    retry;nop;

#define H_T0_Control_Transfer_Instr_0x74
#define My_H_T0_Control_Transfer_Instr_0x74 \
    rdpr %tstate, %l3;\
    and %l3, 0xfff, %l3;\
    wrpr %l3, %tstate ;\
    retry;nop;

#define H_T1_Control_Transfer_Instr_0x74
#define My_H_T1_Control_Transfer_Instr_0x74 \
    rdpr %tstate, %l3;\
    and %l3, 0xfff, %l3;\
    wrpr %l3, %tstate ;\
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

#define H_HT0_Instruction_VA_Watchpoint_0x75
#define SUN_H_HT0_Instruction_VA_Watchpoint_0x75 \
    done;nop

#define H_HT0_Instruction_Breakpoint_0x76
#define SUN_H_HT0_Instruction_Breakpoint_0x76 \
    done;nop
# 685 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_Instruction_address_range_0x0d
#define SUN_H_HT0_Instruction_address_range_0x0d \
    done;nop

#define H_HT0_mem_address_range_0x2e
#define SUN_H_HT0_mem_address_range_0x2e \
    done;nop

!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 12 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!! START of Interrupt Handlers !!!!!!!!!!!!!!!!!

#define H_HT0_Externally_Initiated_Reset_0x03
#define SUN_H_HT0_Externally_Initiated_Reset_0x03 \
    setx External_Reset_Handler, %g1, %g2; \
    jmp %g2; \
    nop 

!!!!! HW interrupt handlers

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g1 ;\
    ldxa    [%g0] ASI_SWVR_INTR_R, %g2 ;\
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g3 ;\
    cmp %g1, %g3 ;\
    nop; \
    retry;

!!!!! Queue interrupt handler
# 36 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 136 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! Hstick-match trap handler
# 139 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 184 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! SW interuupt handlers
# 187 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 215 "diag.j"
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
	mov 0xb4, %r14
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
	mov 0x35, %r14
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
	mov 0x32, %r14
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
	mov 0x35, %r14
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
	mov 0x34, %r30
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

    ta T_CHANGE_HPRIV 

    !Initializing Tick Cmprs
    mov 1, %g2
    sllx %g2, 63, %g2
    or %g1, %g2, %g1
    wrhpr %g1, %g0, %hsys_tick_cmpr
    wr %g1, %g0, %tick_cmpr
    wr %g1, %g0, %sys_tick_cmpr
    ta T_CHANGE_NONHPRIV 

	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_0:
	mov 8, %r18
	.word 0xd2f00852  ! 2: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0xe2dfe000  ! 3: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r17
	.word 0xe20fe001  ! 4: LDUB_I	ldub	[%r31 + 0x0001], %r17
	.word 0x8d902d62  ! 5: WRPR_PSTATE_I	wrpr	%r0, 0x0d62, %pstate
debug_0_1:
	setx debug_0_1 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 6: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_2:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d918010  ! 7: WRPR_WSTATE_R	wrpr	%r6, %r16, %wstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 8: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_3:
	setx 0xab7f37be4fca88d5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 9: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 10: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_0_4:
	setx debug_0_4 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 11: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x28700001  ! 12: BPLEU	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d903ebc  ! 14: WRPR_PSTATE_I	wrpr	%r0, 0x1ebc, %pstate
splash_lsu_0_5:
	setx 0x4aba30acbda0f539, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 15: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_6)) -> intp(0,0,8)
intvec_0_6:
	.word 0x39400001  ! 16: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_7:
	setx debug_0_7 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 17: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa5500000  ! 18: RDPR_TPC	rdpr	%tpc, %r18
splash_lsu_0_8:
	setx 0x3425e31c2964bae7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9834011  ! 20: WR_SET_SOFTINT_R	wr	%r13, %r17, %set_softint
	.word 0x87802016  ! 21: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x83a249d4  ! 22: FDIVd	fdivd	%f40, %f20, %f32
mondo_0_9:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d944001  ! 23: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
tagged_0_10:
	tsubcctv %r13, 0x1b57, %r8
	.word 0xc207e001  ! 24: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xa2f96001  ! 25: SDIVcc_I	sdivcc 	%r5, 0x0001, %r17
debug_0_11:
	mov 0x38, %r18
	.word 0xfef00b12  ! 26: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_0_12:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 27: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879023f5  ! 28: WRPR_TT_I	wrpr	%r0, 0x03f5, %tt
	.word 0x87802010  ! 29: WRASI_I	wr	%r0, 0x0010, %asi
DS_0_13:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f26, %f14, %f18
	.word 0xa5b24310  ! 30: ALIGNADDRESS	alignaddr	%r9, %r16, %r18
	.word 0xe48008a0  ! 31: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x87802004  ! 32: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d9032ef  ! 33: WRPR_PSTATE_I	wrpr	%r0, 0x12ef, %pstate
	.word 0xa1902003  ! 34: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 35: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_14:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d92000a  ! 36: WRPR_WSTATE_R	wrpr	%r8, %r10, %wstate
	.word 0x8b51c000  ! 37: RDPR_TL	rdpr	%tl, %r5
intveclr_0_15:
	set 0xf9284be, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 38: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 39: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8f540000  ! 40: RDPR_GL	rdpr	%-, %r7
	.word 0x95450000  ! 41: RD_SET_SOFTINT	rd	%set_softint, %r10
intveclr_0_16:
	set 0xba01c944, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 42: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	set 0x7dd56221, %r28
	stxa %r28, [%g0] 0x73
intvec_0_17:
	.word 0x39400001  ! 43: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_18:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xdf42431d	! Random illegal ?
	.word 0xe5148002  ! 1: LDQF_R	-	[%r18, %r2], %f18
	.word 0x95a2482d  ! 44: FADDs	fadds	%f9, %f13, %f10
	.word 0xd4900e40  ! 45: LDUHA_R	lduha	[%r0, %r0] 0x72, %r10
	.word 0xd407c000  ! 46: LDUW_R	lduw	[%r31 + %r0], %r10
tagged_0_19:
	taddcctv %r24, 0x151f, %r23
	.word 0xd407e001  ! 47: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x87802089  ! 48: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d802000  ! 49: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9f802001  ! 50: SIR	sir	0x0001
	.word 0x8d903885  ! 51: WRPR_PSTATE_I	wrpr	%r0, 0x1885, %pstate
tagged_0_20:
	tsubcctv %r6, 0x1d7f, %r8
	.word 0xd407e001  ! 52: LDUW_I	lduw	[%r31 + 0x0001], %r10
debug_0_21:
	mov 0x38, %r18
	.word 0xfef00b12  ! 53: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9345c000  ! 54: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0xd3e7c02d  ! 55: CASA_I	casa	[%r31] 0x 1, %r13, %r9
	.word 0x93902003  ! 56: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_0_22:
	setx debug_0_22 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 57: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x83d02032  ! 58: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x9f802001  ! 59: SIR	sir	0x0001
mondo_0_23:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d928012  ! 60: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
mondo_0_24:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d904003  ! 61: WRPR_WSTATE_R	wrpr	%r1, %r3, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 62: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xa7450000  ! 63: RD_SET_SOFTINT	rd	%set_softint, %r19
	.word 0x9b494000  ! 64: RDHPR_HTBA	rdhpr	%htba, %r13
DS_0_25:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 65: SAVE_R	save	%r31, %r0, %r31
	.word 0x91d02035  ! 66: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d9032b1  ! 67: WRPR_PSTATE_I	wrpr	%r0, 0x12b1, %pstate
debug_0_26:
	mov 0x38, %r18
	.word 0xfef00b12  ! 68: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 69: LDX_R	ldx	[%r31 + %r0], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 70: LDX_R	ldx	[%r31 + %r0], %r13
	set 0x6f887f2d, %r28
	stxa %r28, [%g0] 0x73
intvec_0_27:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902d4d  ! 72: WRPR_PSTATE_I	wrpr	%r0, 0x0d4d, %pstate
DS_0_28:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xb16e3d68	! Random illegal ?
	.word 0xd3124014  ! 1: LDQF_R	-	[%r9, %r20], %f9
	.word 0x9ba2482d  ! 73: FADDs	fadds	%f9, %f13, %f13
	.word 0xdac004a0  ! 74: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	ta	T_CHANGE_PRIV	! macro
	set 0x7b7d0cb3, %r28
	stxa %r28, [%g0] 0x73
intvec_0_29:
	.word 0x39400001  ! 76: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200c  ! 77: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xda800c20  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r13
mondo_0_30:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d940011  ! 79: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
mondo_0_31:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d920007  ! 80: WRPR_WSTATE_R	wrpr	%r8, %r7, %wstate
	.word 0xda37e001  ! 81: STH_I	sth	%r13, [%r31 + 0x0001]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_32)) -> intp(0,0,2)
intvec_0_32:
	.word 0x39400001  ! 82: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda8008a0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
change_to_randtl_0_33:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_33:
	.word 0x8f902003  ! 84: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
mondo_0_34:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d91000b  ! 85: WRPR_WSTATE_R	wrpr	%r4, %r11, %wstate
change_to_randtl_0_35:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_35:
	.word 0x8f902003  ! 86: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xda27c00b  ! 87: STW_R	stw	%r13, [%r31 + %r11]
DS_0_36:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe932e001  ! 1: STQF_I	-	%f20, [0x0001, %r11]
	normalw
	.word 0x9b458000  ! 88: RD_SOFTINT_REG	rd	%softint, %r13
debug_0_37:
	setx debug_0_37 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 89: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02035  ! 90: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xdad004a0  ! 91: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 92: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_38)) -> intp(0,1,3)
xir_0_38:
	.word 0xa982a001  ! 93: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 94: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x89514000  ! 95: RDPR_TBA	<illegal instruction>
	.word 0x879023f4  ! 96: WRPR_TT_I	wrpr	%r0, 0x03f4, %tt
DS_0_39:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd734e001  ! 1: STQF_I	-	%f11, [0x0001, %r19]
	normalw
	.word 0x81458000  ! 97: RD_SOFTINT_REG	stbar
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 98: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc0880e80  ! 99: LDUBA_R	lduba	[%r0, %r0] 0x74, %r0
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_40)) -> intp(0,0,2)
intvec_0_40:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc05fc000  ! 101: LDX_R	ldx	[%r31 + %r0], %r0
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 102: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902119  ! 103: WRPR_TT_I	wrpr	%r0, 0x0119, %tt
	.word 0x9f802001  ! 104: SIR	sir	0x0001
tagged_0_41:
	taddcctv %r5, 0x1fd3, %r2
	.word 0xc007e001  ! 105: LDUW_I	lduw	[%r31 + 0x0001], %r0
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc05fc000  ! 106: LDX_R	ldx	[%r31 + %r0], %r0
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 107: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc117c000  ! 108: LDQF_R	-	[%r31, %r0], %f0
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_42)) -> intp(0,1,3)
xir_0_42:
	.word 0xa9846001  ! 109: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	.word 0xc0d804a0  ! 110: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
tagged_0_43:
	taddcctv %r4, 0x1d92, %r18
	.word 0xc007e001  ! 111: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x2a700001  ! 112: BPCS	<illegal instruction>
	.word 0xc02fe001  ! 113: STB_I	stb	%r0, [%r31 + 0x0001]
	.word 0x8d464000  ! 114: RD_STICK_CMPR_REG	rd	%-, %r6
change_to_randtl_0_44:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_44:
	.word 0x8f902000  ! 115: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xccd804a0  ! 116: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	.word 0xcc3fc00b  ! 117: STD_R	std	%r6, [%r31 + %r11]
	.word 0x81500000  ! 118: RDPR_TPC	rdpr	%tpc, %r0
	.word 0xc03fe001  ! 119: STD_I	std	%r0, [%r31 + 0x0001]
	.word 0xc027c00b  ! 120: STW_R	stw	%r0, [%r31 + %r11]
	.word 0x91d02035  ! 121: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8780201c  ! 122: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8da01971  ! 123: FqTOd	dis not found

DS_0_46:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0x895099ff	! Random illegal ?
	.word 0xa7a00547  ! 1: FSQRTd	fsqrt	
	.word 0xa5a0c822  ! 124: FADDs	fadds	%f3, %f2, %f18
	.word 0xe537e001  ! 125: STQF_I	-	%f18, [0x0001, %r31]
	.word 0xa1902003  ! 126: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 127: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x93902005  ! 128: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe48008a0  ! 129: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	set 0xbc96e8fa, %r28
	stxa %r28, [%g0] 0x73
intvec_0_47:
	.word 0x39400001  ! 130: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9810003  ! 131: WR_SET_SOFTINT_R	wr	%r4, %r3, %set_softint
	.word 0x99540000  ! 132: RDPR_GL	<illegal instruction>
intveclr_0_48:
	set 0x1a6cf5b5, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 133: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	set 0xe85a9bb3, %r28
	stxa %r28, [%g0] 0x73
intvec_0_49:
	.word 0x39400001  ! 134: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_50)) -> intp(0,1,3)
xir_0_50:
	.word 0xa980e001  ! 135: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
	.word 0xd91fc000  ! 136: LDDF_R	ldd	[%r31, %r0], %f12
	.word 0x93902007  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x87802020  ! 138: WRASI_I	wr	%r0, 0x0020, %asi
debug_0_51:
	mov 0x38, %r18
	.word 0xfef00b12  ! 139: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9ac36001  ! 140: ADDCcc_I	addccc 	%r13, 0x0001, %r13
	.word 0xa0d1400a  ! 141: UMULcc_R	umulcc 	%r5, %r10, %r16
DS_0_52:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f0, %f6, %f20
	.word 0x8db00313  ! 142: ALIGNADDRESS	alignaddr	%r0, %r19, %r6
	.word 0xcc77c013  ! 143: STX_R	stx	%r6, [%r31 + %r19]
	.word 0x8d903f5f  ! 144: WRPR_PSTATE_I	wrpr	%r0, 0x1f5f, %pstate
splash_tba_0_53:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 145: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xccd7e000  ! 146: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r6
	.word 0xccdfe010  ! 147: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r6
	.word 0x8d802000  ! 148: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x85464000  ! 149: RD_STICK_CMPR_REG	rd	%-, %r2
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_54)) -> intp(0,0,4)
intvec_0_54:
	.word 0x39400001  ! 150: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790219a  ! 151: WRPR_TT_I	wrpr	%r0, 0x019a, %tt
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 152: Tcc_R	te	icc_or_xcc, %r0 + %r30
	set 0x6b2e25c7, %r28
	stxa %r28, [%g0] 0x73
intvec_0_55:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc45fc000  ! 154: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xa1902001  ! 155: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xc49fc020  ! 156: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0xa782e001  ! 157: WR_GRAPHICS_STATUS_REG_I	wr	%r11, 0x0001, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_56)) -> intp(0,0,17)
intvec_0_56:
	.word 0x39400001  ! 158: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc48fe030  ! 160: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r2
intveclr_0_57:
	set 0xc27a747e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 161: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc4900e40  ! 162: LDUHA_R	lduha	[%r0, %r0] 0x72, %r2
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 163: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 164: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_58:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 165: SAVE_R	save	%r31, %r0, %r31
	.word 0xc45fe001  ! 166: LDX_I	ldx	[%r31 + 0x0001], %r2
intveclr_0_59:
	set 0x9bd6e298, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 167: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc49fc020  ! 168: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0xc4c7e010  ! 169: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r2
	.word 0x87902252  ! 170: WRPR_TT_I	wrpr	%r0, 0x0252, %tt
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_60)) -> intp(0,0,28)
intvec_0_60:
	.word 0x39400001  ! 171: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc4800b40  ! 172: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r2
	.word 0xc53fe001  ! 173: STDF_I	std	%f2, [0x0001, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 174: LDX_R	ldx	[%r31 + %r0], %r2
DS_0_61:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd334e001  ! 1: STQF_I	-	%f9, [0x0001, %r19]
	normalw
	.word 0x87458000  ! 175: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0xc6cfe030  ! 176: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r3
	.word 0xc6d004a0  ! 177: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
mondo_0_62:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d920012  ! 178: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
tagged_0_63:
	taddcctv %r18, 0x17cf, %r18
	.word 0xc607e001  ! 179: LDUW_I	lduw	[%r31 + 0x0001], %r3
splash_cmpr_0_64:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1822001  ! 180: WR_STICK_REG_I	wr	%r8, 0x0001, %-
	.word 0x81510000  ! 181: RDPR_TICK	<illegal instruction>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 182: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	set 0x52ce162d, %r28
	stxa %r28, [%g0] 0x73
intvec_0_65:
	.word 0x39400001  ! 183: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc6d7e030  ! 184: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r3
change_to_randtl_0_66:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_66:
	.word 0x8f902000  ! 185: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
mondo_0_67:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d914014  ! 186: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
	.word 0xc6cfe000  ! 187: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r3
splash_lsu_0_68:
	setx 0x1fbab21809530ad5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 188: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc68008a0  ! 189: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x8d802004  ! 190: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8790204f  ! 191: WRPR_TT_I	wrpr	%r0, 0x004f, %tt
	.word 0xc727c014  ! 192: STF_R	st	%f3, [%r20, %r31]
	.word 0xa7a309a7  ! 193: FDIVs	fdivs	%f12, %f7, %f19
	.word 0xa190200e  ! 194: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x93902001  ! 195: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
mondo_0_69:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d940010  ! 196: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
DS_0_70:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 197: RESTORE_R	restore	%r31, %r0, %r31
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_71)) -> intp(0,1,3)
xir_0_71:
	.word 0xa9846001  ! 198: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe6d7e010  ! 200: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r19
	.word 0xe6dfe030  ! 201: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r19
	.word 0x9b45c000  ! 202: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xa1902009  ! 203: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 204: LDX_R	ldx	[%r31 + %r0], %r13
splash_htba_0_72:
	set 0x00390000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 205: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_0_73:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 206: SAVE_R	save	%r31, %r0, %r31
	.word 0xda8008a0  ! 207: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x93902001  ! 208: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 209: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xda8008a0  ! 210: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
DS_0_74:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 211: SAVE_R	save	%r31, %r0, %r31
tagged_0_75:
	taddcctv %r16, 0x13bd, %r12
	.word 0xda07e001  ! 212: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda9fe001  ! 213: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
splash_tba_0_76:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 214: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_0_77:
	taddcctv %r16, 0x15a4, %r22
	.word 0xda07e001  ! 215: LDUW_I	lduw	[%r31 + 0x0001], %r13
splash_lsu_0_78:
	setx 0xe82c9022a6639f57, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 216: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xda8008a0  ! 217: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x93902001  ! 218: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa190200c  ! 219: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xda47c000  ! 220: LDSW_R	ldsw	[%r31 + %r0], %r13
	.word 0xdadfe010  ! 221: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
debug_0_79:
	setx debug_0_79 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 222: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 223: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_80)) -> intp(0,0,2)
intvec_0_80:
	.word 0x39400001  ! 224: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200f  ! 225: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 226: LDX_R	ldx	[%r31 + %r0], %r13
mondo_0_81:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d904001  ! 227: WRPR_WSTATE_R	wrpr	%r1, %r1, %wstate
DS_0_82:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 228: SAVE_R	save	%r31, %r0, %r31
	.word 0xdad804a0  ! 229: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0xdad7e030  ! 230: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb184c001  ! 231: WR_STICK_REG_R	wr	%r19, %r1, %-
	.word 0x9745c000  ! 232: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0x99902001  ! 233: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x8780201c  ! 234: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x93902003  ! 235: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 236: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982947  ! 237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0947, %hpstate
mondo_0_84:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d95000a  ! 238: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
	.word 0xa3504000  ! 239: RDPR_TNPC	rdpr	%tnpc, %r17
tagged_0_85:
	taddcctv %r6, 0x1d65, %r15
	.word 0xe207e001  ! 240: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe28804a0  ! 241: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0xe29fe001  ! 242: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1686001  ! 243: SDIVX_I	sdivx	%r1, 0x0001, %r16
	.word 0xa7454000  ! 244: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	.word 0x81982896  ! 245: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0896, %hpstate
intveclr_0_87:
	set 0xe4d9a77e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 246: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_88:
	setx debug_0_88 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 247: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d802004  ! 248: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe6c7e000  ! 249: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r19
change_to_randtl_0_89:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_89:
	.word 0x8f902004  ! 250: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xe61fe001  ! 251: LDD_I	ldd	[%r31 + 0x0001], %r19
splash_lsu_0_90:
	setx 0x41da74c760274527, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 252: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_91)) -> intp(0,1,3)
xir_0_91:
	.word 0xa9822001  ! 253: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
	.word 0x87902176  ! 254: WRPR_TT_I	wrpr	%r0, 0x0176, %tt
tagged_0_92:
	tsubcctv %r25, 0x1cd7, %r16
	.word 0xe607e001  ! 255: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0x93902006  ! 256: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe63fc00a  ! 257: STD_R	std	%r19, [%r31 + %r10]
	.word 0x87902366  ! 258: WRPR_TT_I	wrpr	%r0, 0x0366, %tt
	.word 0x93d02033  ! 259: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xe657c000  ! 260: LDSH_R	ldsh	[%r31 + %r0], %r19
splash_cmpr_0_93:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1816001  ! 261: WR_STICK_REG_I	wr	%r5, 0x0001, %-
intveclr_0_94:
	set 0x93c49453, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 262: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6cfe020  ! 263: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r19
	.word 0x8790216d  ! 264: WRPR_TT_I	wrpr	%r0, 0x016d, %tt
	.word 0xa9514000  ! 265: RDPR_TBA	rdpr	%tba, %r20
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d903775  ! 267: WRPR_PSTATE_I	wrpr	%r0, 0x1775, %pstate
	.word 0xe88008a0  ! 268: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_95)) -> intp(0,1,3)
xir_0_95:
	.word 0xa9846001  ! 269: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
splash_tba_0_96:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 270: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_0_97:
	setx 0x5a64a6e51844900f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 271: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 272: SIR	sir	0x0001
	.word 0x87902101  ! 273: WRPR_TT_I	wrpr	%r0, 0x0101, %tt
mondo_0_98:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d91c013  ! 274: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
	set 0xa9097b8f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_99:
	.word 0x39400001  ! 275: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_100:
	setx 0xc70dc033af38a09d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 276: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_101:
	mov 0x38, %r18
	.word 0xfef00b12  ! 277: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1902003  ! 278: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xe927e001  ! 279: STF_I	st	%f20, [0x0001, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_102)) -> intp(0,0,5)
intvec_0_102:
	.word 0x39400001  ! 280: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 281: Tcc_I	ta	icc_or_xcc, %r0 + 180
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 283: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x28700001  ! 285: BPLEU	<illegal instruction>
	.word 0x81510000  ! 286: RDPR_TICK	rdpr	%tick, %r0
mondo_0_103:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d914005  ! 287: WRPR_WSTATE_R	wrpr	%r5, %r5, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_104)) -> intp(0,1,3)
xir_0_104:
	.word 0xa982a001  ! 288: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0x99902001  ! 289: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xe89004a0  ! 290: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
splash_tba_0_105:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 291: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 292: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_106:
	setx debug_0_106 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 293: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	ta	T_CHANGE_PRIV	! macro
	.word 0x8780201c  ! 295: WRASI_I	wr	%r0, 0x001c, %asi
splash_lsu_0_107:
	setx 0x674369a9742b0729, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 296: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe84fc000  ! 297: LDSB_R	ldsb	[%r31 + %r0], %r20
	.word 0xe8c7e030  ! 298: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r20
	.word 0xe91fe001  ! 299: LDDF_I	ldd	[%r31, 0x0001], %f20
tagged_0_108:
	tsubcctv %r1, 0x1b29, %r26
	.word 0xe807e001  ! 300: LDUW_I	lduw	[%r31 + 0x0001], %r20
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 301: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 302: SIR	sir	0x0001
DS_0_109:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 303: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x9f802001  ! 304: SIR	sir	0x0001
splash_htba_0_110:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 305: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
intveclr_0_111:
	set 0x218ef8c3, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 306: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_0_112:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 307: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe927e001  ! 308: STF_I	st	%f20, [0x0001, %r31]
	.word 0x91d02032  ! 309: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa9808010  ! 310: WR_SET_SOFTINT_R	wr	%r2, %r16, %set_softint
DS_0_113:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 311: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1464000  ! 312: RD_STICK_CMPR_REG	rd	%-, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 313: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe077c010  ! 314: STX_R	stx	%r16, [%r31 + %r16]
	.word 0x93902001  ! 315: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_0_114:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe134c007  ! 1: STQF_R	-	%f16, [%r7, %r19]
	normalw
	.word 0xa9458000  ! 316: RD_SOFTINT_REG	rd	%softint, %r20
DS_0_115:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x87a00541  ! 1: FSQRTd	fsqrt	
	.word 0xa3a34823  ! 317: FADDs	fadds	%f13, %f3, %f17
tagged_0_116:
	tsubcctv %r24, 0x1bdf, %r26
	.word 0xe207e001  ! 318: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xa9464000  ! 319: RD_STICK_CMPR_REG	rd	%-, %r20
	.word 0x8fa4c9cb  ! 320: FDIVd	fdivd	%f50, %f42, %f38
	.word 0x99450000  ! 321: RD_SET_SOFTINT	rd	%set_softint, %r12
	.word 0x87802063  ! 322: WRASI_I	wr	%r0, 0x0063, %asi
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_117)) -> intp(0,1,3)
xir_0_117:
	.word 0xa9806001  ! 323: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
tagged_0_118:
	tsubcctv %r9, 0x1b32, %r23
	.word 0xd807e001  ! 324: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x93902005  ! 325: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd8d004a0  ! 326: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0xd89fe001  ! 327: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8da01971  ! 328: FqTOd	dis not found

	.word 0x87902315  ! 329: WRPR_TT_I	wrpr	%r0, 0x0315, %tt
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_120)) -> intp(0,0,18)
intvec_0_120:
	.word 0x39400001  ! 330: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902797  ! 331: WRPR_PSTATE_I	wrpr	%r0, 0x0797, %pstate
splash_lsu_0_121:
	setx 0xb3b3f73bdb2a6e0d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 332: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 333: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcc1fc000  ! 334: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0x93902003  ! 335: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b682001  ! 336: SDIVX_I	sdivx	%r0, 0x0001, %r13
	.word 0xa9464000  ! 337: RD_STICK_CMPR_REG	rd	%-, %r20
	set 0x56a6e534, %r28
	stxa %r28, [%g0] 0x73
intvec_0_123:
	.word 0x39400001  ! 338: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879021d0  ! 339: WRPR_TT_I	wrpr	%r0, 0x01d0, %tt
	.word 0x8d902e2b  ! 340: WRPR_PSTATE_I	wrpr	%r0, 0x0e2b, %pstate
intveclr_0_124:
	set 0x9ebfc67d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 341: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 342: WRASI_I	wr	%r0, 0x0010, %asi
	set 0xd7659a73, %r28
	stxa %r28, [%g0] 0x73
intvec_0_125:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89804012  ! 344: WRTICK_R	wr	%r1, %r18, %tick
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 345: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x93902005  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x879020c4  ! 347: WRPR_TT_I	wrpr	%r0, 0x00c4, %tt
	set 0x7da139da, %r28
	stxa %r28, [%g0] 0x73
intvec_0_127:
	.word 0x39400001  ! 348: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 349: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_128:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 350: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x2e700001  ! 351: BPVS	<illegal instruction>
	.word 0x82d44006  ! 352: UMULcc_R	umulcc 	%r17, %r6, %r1
	.word 0xc21fe001  ! 353: LDD_I	ldd	[%r31 + 0x0001], %r1
	.word 0xc28008a0  ! 354: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x93902002  ! 355: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc2c00e60  ! 356: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r1
mondo_0_129:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d950013  ! 357: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
change_to_randtl_0_130:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_130:
	.word 0x8f902001  ! 358: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_0_131:
	taddcctv %r15, 0x1d11, %r15
	.word 0xc207e001  ! 359: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x879023a6  ! 360: WRPR_TT_I	wrpr	%r0, 0x03a6, %tt
	.word 0xc257c000  ! 361: LDSH_R	ldsh	[%r31 + %r0], %r1
splash_htba_0_132:
	set 0x003b0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 362: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x99a01a68  ! 363: FqTOi	fqtoi	
debug_0_133:
	setx debug_0_133 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 364: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_134:
	mov 0x38, %r18
	.word 0xfef00b12  ! 365: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd8d7e000  ! 366: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 367: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa784e001  ! 368: WR_GRAPHICS_STATUS_REG_I	wr	%r19, 0x0001, %-
	set 0x3ba13dd, %r28
	stxa %r28, [%g0] 0x73
intvec_0_135:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 370: WRASI_I	wr	%r0, 0x0089, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_136)) -> intp(0,0,1)
intvec_0_136:
	.word 0x39400001  ! 371: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd91fe001  ! 372: LDDF_I	ldd	[%r31, 0x0001], %f12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 373: LDX_R	ldx	[%r31 + %r0], %r12
DS_0_137:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 374: SAVE_R	save	%r31, %r0, %r31
	.word 0xa1902002  ! 375: WRPR_GL_I	wrpr	%r0, 0x0002, %-
tagged_0_138:
	tsubcctv %r9, 0x1dc4, %r8
	.word 0xd807e001  ! 376: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xad832001  ! 377: WR_SOFTINT_REG_I	wr	%r12, 0x0001, %softint
	.word 0xd8dfe000  ! 378: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r12
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 379: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa569a001  ! 380: SDIVX_I	sdivx	%r6, 0x0001, %r18
tagged_0_140:
	tsubcctv %r1, 0x19be, %r22
	.word 0xe407e001  ! 381: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x87902116  ! 382: WRPR_TT_I	wrpr	%r0, 0x0116, %tt
	.word 0xa1a4c9f1  ! 383: FDIVq	dis not found

	.word 0x3e800001  ! 384: BVC	bvc,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 385: LDX_R	ldx	[%r31 + %r0], %r16
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_141)) -> intp(0,1,3)
xir_0_141:
	.word 0xa9812001  ! 386: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
	.word 0x9669800c  ! 387: UDIVX_R	udivx 	%r6, %r12, %r11
mondo_0_142:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d918012  ! 388: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
intveclr_0_143:
	set 0x6c145f4, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 389: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_144:
	mov 0x38, %r18
	.word 0xfef00b12  ! 390: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_145:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc1150011  ! 1: LDQF_R	-	[%r20, %r17], %f0
	.word 0xa7a28822  ! 391: FADDs	fadds	%f10, %f2, %f19
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 392: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_146:
	mov 0x38, %r18
	.word 0xfef00b12  ! 393: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x94f8a001  ! 394: SDIVcc_I	sdivcc 	%r2, 0x0001, %r10
	set 0xbad31cce, %r28
	stxa %r28, [%g0] 0x73
intvec_0_147:
	.word 0x39400001  ! 395: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 396: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x87802014  ! 397: WRASI_I	wr	%r0, 0x0014, %asi
tagged_0_148:
	tsubcctv %r26, 0x1751, %r17
	.word 0xd407e001  ! 398: LDUW_I	lduw	[%r31 + 0x0001], %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 399: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x9f802001  ! 400: SIR	sir	0x0001
	set 0x2b429a7f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_149:
	.word 0x39400001  ! 401: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 402: RD_STICK_REG	stbar
mondo_0_150:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d92c00c  ! 403: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_151)) -> intp(0,1,3)
xir_0_151:
	.word 0xa982e001  ! 404: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	.word 0x879020da  ! 405: WRPR_TT_I	wrpr	%r0, 0x00da, %tt
	.word 0xd40fc000  ! 406: LDUB_R	ldub	[%r31 + %r0], %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 407: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd40fc000  ! 408: LDUB_R	ldub	[%r31 + %r0], %r10
	.word 0xd447e001  ! 409: LDSW_I	ldsw	[%r31 + 0x0001], %r10
	.word 0xa190200a  ! 410: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x91d02033  ! 411: Tcc_I	ta	icc_or_xcc, %r0 + 51
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_152)) -> intp(0,1,3)
xir_0_152:
	.word 0xa9812001  ! 412: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
	.word 0x8d90313a  ! 413: WRPR_PSTATE_I	wrpr	%r0, 0x113a, %pstate
	.word 0x83504000  ! 414: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0xa984c00c  ! 415: WR_SET_SOFTINT_R	wr	%r19, %r12, %set_softint
	.word 0xa1902004  ! 416: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xc29fc020  ! 417: LDDA_R	ldda	[%r31, %r0] 0x01, %r1
	.word 0xc2cfe030  ! 418: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r1
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 419: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa3454000  ! 420: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
tagged_0_153:
	taddcctv %r2, 0x151a, %r17
	.word 0xe207e001  ! 421: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe29fc020  ! 422: LDDA_R	ldda	[%r31, %r0] 0x01, %r17
splash_lsu_0_154:
	setx 0xde64785daae3b411, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 423: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	set 0xae045827, %r28
	stxa %r28, [%g0] 0x73
intvec_0_155:
	.word 0x39400001  ! 424: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe2900e40  ! 425: LDUHA_R	lduha	[%r0, %r0] 0x72, %r17
	.word 0x8780204f  ! 426: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x99494000  ! 427: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0x91504000  ! 428: RDPR_TNPC	rdpr	%tnpc, %r8
splash_cmpr_0_156:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180e001  ! 429: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	.word 0xd01fe001  ! 430: LDD_I	ldd	[%r31 + 0x0001], %r8
	.word 0x81982695  ! 431: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0695, %hpstate
	.word 0xd08008a0  ! 432: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x93902004  ! 433: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 434: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_157:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d90c00d  ! 435: WRPR_WSTATE_R	wrpr	%r3, %r13, %wstate
	.word 0xa190200c  ! 436: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8b464000  ! 437: RD_STICK_CMPR_REG	rd	%-, %r5
	.word 0xad80e001  ! 438: WR_SOFTINT_REG_I	wr	%r3, 0x0001, %softint
DS_0_158:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc9336001  ! 1: STQF_I	-	%f4, [0x0001, %r13]
	normalw
	.word 0x93458000  ! 439: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x93902006  ! 440: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x83520000  ! 441: RDPR_PIL	rdpr	%pil, %r1
	.word 0x8d504000  ! 442: RDPR_TNPC	rdpr	%tnpc, %r6
intveclr_0_159:
	set 0x30f4b7f5, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 443: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x38800001  ! 444: BGU	bgu,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc1fc000  ! 446: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0x8198281e  ! 447: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081e, %hpstate
debug_0_160:
	setx debug_0_160 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 448: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_161:
	mov 0x38, %r18
	.word 0xfef00b12  ! 449: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_162:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d904013  ! 450: WRPR_WSTATE_R	wrpr	%r1, %r19, %wstate
	.word 0xcc1fe001  ! 451: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0xcc2fe001  ! 452: STB_I	stb	%r6, [%r31 + 0x0001]
	.word 0xccbfc033  ! 453: STDA_R	stda	%r6, [%r31 + %r19] 0x01
intveclr_0_163:
	set 0xd4f2edab, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 454: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_164:
	tsubcctv %r19, 0x1c6c, %r6
	.word 0xcc07e001  ! 455: LDUW_I	lduw	[%r31 + 0x0001], %r6
intveclr_0_165:
	set 0x16114168, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 456: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9b540000  ! 457: RDPR_GL	rdpr	%-, %r13
	.word 0xda8008a0  ! 458: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda1fe001  ! 459: LDD_I	ldd	[%r31 + 0x0001], %r13
	.word 0x83d020b2  ! 460: Tcc_I	te	icc_or_xcc, %r0 + 178
DS_0_166:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f8, %f10, %f30
	.word 0x81b20300  ! 461: ALIGNADDRESS	alignaddr	%r8, %r0, %r0
	.word 0xc0900e40  ! 462: LDUHA_R	lduha	[%r0, %r0] 0x72, %r0
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_167)) -> intp(0,1,3)
xir_0_167:
	.word 0xa980a001  ! 463: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0x93902003  ! 464: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 465: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 466: SIR	sir	0x0001
	.word 0x87802004  ! 467: WRASI_I	wr	%r0, 0x0004, %asi
mondo_0_168:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d904009  ! 468: WRPR_WSTATE_R	wrpr	%r1, %r9, %wstate
	.word 0x8d90390d  ! 469: WRPR_PSTATE_I	wrpr	%r0, 0x190d, %pstate
mondo_0_169:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d94c013  ! 470: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
splash_lsu_0_170:
	setx 0x5d9fe5371ad80017, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 471: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200d  ! 472: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xc09fe001  ! 473: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r0
intveclr_0_171:
	set 0x32b67e53, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 474: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8790217e  ! 475: WRPR_TT_I	wrpr	%r0, 0x017e, %tt
	.word 0xc127c013  ! 476: STF_R	st	%f0, [%r19, %r31]
	.word 0x81464000  ! 477: RD_STICK_CMPR_REG	stbar
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_172)) -> intp(0,0,30)
intvec_0_172:
	.word 0x39400001  ! 478: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa0dc8004  ! 479: SMULcc_R	smulcc 	%r18, %r4, %r16
debug_0_173:
	mov 0x38, %r18
	.word 0xfef00b12  ! 480: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa7454000  ! 481: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	.word 0xa1902002  ! 482: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_tba_0_174:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 483: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x36800001  ! 484: BGE	bge,a	<label_0x1>
	.word 0x91d020b5  ! 485: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xe727c004  ! 486: STF_R	st	%f19, [%r4, %r31]
	.word 0x81510000  ! 487: RDPR_TICK	rdpr	%tick, %r0
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 488: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x87802016  ! 489: WRASI_I	wr	%r0, 0x0016, %asi
debug_0_175:
	setx debug_0_175 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 490: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_176)) -> intp(0,0,26)
intvec_0_176:
	.word 0x39400001  ! 491: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879023e3  ! 492: WRPR_TT_I	wrpr	%r0, 0x03e3, %tt
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_177)) -> intp(0,1,3)
xir_0_177:
	.word 0xa982e001  ! 493: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	.word 0x87802088  ! 494: WRASI_I	wr	%r0, 0x0088, %asi
intveclr_0_178:
	set 0x4da0f3fc, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 495: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	set 0x3f0c9a4b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_179:
	.word 0x39400001  ! 496: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 497: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8790209c  ! 498: WRPR_TT_I	wrpr	%r0, 0x009c, %tt
	.word 0x93500000  ! 499: RDPR_TPC	rdpr	%tpc, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 500: LDX_R	ldx	[%r31 + %r0], %r9
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_180)) -> intp(0,1,3)
xir_0_180:
	.word 0xa984a001  ! 501: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
splash_lsu_0_181:
	setx 0x5cc38ef7fe292f39, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 502: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd2bfc024  ! 503: STDA_R	stda	%r9, [%r31 + %r4] 0x01
	.word 0xd247e001  ! 504: LDSW_I	ldsw	[%r31 + 0x0001], %r9
DS_0_182:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 505: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x87802058  ! 506: WRASI_I	wr	%r0, 0x0058, %asi
tagged_0_183:
	taddcctv %r19, 0x18e9, %r23
	.word 0xd207e001  ! 507: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xa3520000  ! 508: RDPR_PIL	rdpr	%pil, %r17
	.word 0xe21fc000  ! 509: LDD_R	ldd	[%r31 + %r0], %r17
splash_lsu_0_184:
	setx 0x27c0cc1e1a670cff, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 510: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 511: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe20fc000  ! 512: LDUB_R	ldub	[%r31 + %r0], %r17
DS_0_185:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 513: RESTORE_R	restore	%r31, %r0, %r31
mondo_0_186:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d934010  ! 514: WRPR_WSTATE_R	wrpr	%r13, %r16, %wstate
	set 0x8685dad3, %r28
	stxa %r28, [%g0] 0x73
intvec_0_187:
	.word 0x39400001  ! 515: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 516: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8d90368a  ! 517: WRPR_PSTATE_I	wrpr	%r0, 0x168a, %pstate
splash_cmpr_0_188:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1842001  ! 518: WR_STICK_REG_I	wr	%r16, 0x0001, %-
splash_lsu_0_189:
	setx 0x0dec1035e8a98687, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 519: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x95450000  ! 520: RD_SET_SOFTINT	rd	%set_softint, %r10
	.word 0xd4800bc0  ! 521: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r10
mondo_0_190:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d940014  ! 522: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	.word 0x24800001  ! 523: BLE	ble,a	<label_0x1>
	.word 0xd48fe000  ! 524: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r10
	.word 0x8d903b69  ! 525: WRPR_PSTATE_I	wrpr	%r0, 0x1b69, %pstate
intveclr_0_191:
	set 0xe8f82040, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 526: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd5e7c034  ! 527: CASA_I	casa	[%r31] 0x 1, %r20, %r10
	.word 0x81982a5d  ! 528: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5d, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 529: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_htba_0_192:
	set 0x00390000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 530: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_htba_0_193:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 531: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_0_194:
	tsubcctv %r17, 0x1b0f, %r3
	.word 0xd407e001  ! 532: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd43fe001  ! 533: STD_I	std	%r10, [%r31 + 0x0001]
	.word 0x3c700001  ! 534: BPPOS	<illegal instruction>
	.word 0x93d02032  ! 535: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xa2800013  ! 536: ADDcc_R	addcc 	%r0, %r19, %r17
mondo_0_195:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d914006  ! 537: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
	ta	T_CHANGE_PRIV	! macro
debug_0_196:
	setx debug_0_196 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 539: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_htba_0_197:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 540: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe297e010  ! 541: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r17
	.word 0xe25fe001  ! 542: LDX_I	ldx	[%r31 + 0x0001], %r17
	.word 0xa1902004  ! 543: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 544: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x81510000  ! 545: RDPR_TICK	rdpr	%tick, %r0
mondo_0_198:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d914000  ! 546: WRPR_WSTATE_R	wrpr	%r5, %r0, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 547: LDX_R	ldx	[%r31 + %r0], %r17
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 548: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x84c1e001  ! 549: ADDCcc_I	addccc 	%r7, 0x0001, %r2
	.word 0xa7520000  ! 550: RDPR_PIL	rdpr	%pil, %r19
	.word 0x87802080  ! 551: WRASI_I	wr	%r0, 0x0080, %asi
splash_lsu_0_199:
	setx 0x132c1e6a1cd1ae0f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 552: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 553: RD_STICK_REG	stbar
	.word 0xa1902006  ! 554: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xe6c004a0  ! 555: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r19
	.word 0xa9a000c6  ! 556: FNEGd	fnegd	%f6, %f20
	.word 0xe89fc020  ! 557: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 558: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_200:
	mov 0x38, %r18
	.word 0xfef00b12  ! 559: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8790201b  ! 560: WRPR_TT_I	wrpr	%r0, 0x001b, %tt
	.word 0x8d9027b4  ! 561: WRPR_PSTATE_I	wrpr	%r0, 0x07b4, %pstate
intveclr_0_201:
	set 0x172705ee, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 562: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 563: RD_STICK_REG	stbar
tagged_0_202:
	tsubcctv %r17, 0x1053, %r23
	.word 0xe807e001  ! 564: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0xe9e7c026  ! 565: CASA_I	casa	[%r31] 0x 1, %r6, %r20
	.word 0x99902004  ! 566: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xa9a009e1  ! 567: FDIVq	dis not found

tagged_0_203:
	taddcctv %r12, 0x1fd1, %r26
	.word 0xe807e001  ! 568: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x8d902666  ! 569: WRPR_PSTATE_I	wrpr	%r0, 0x0666, %pstate
	.word 0xe8800aa0  ! 570: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r20
	.word 0xe89fe001  ! 571: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r20
	.word 0x93902002  ! 572: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_204)) -> intp(0,1,3)
xir_0_204:
	.word 0xa9812001  ! 573: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_205)) -> intp(0,1,3)
xir_0_205:
	.word 0xa9836001  ! 574: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 575: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe877c001  ! 576: STX_R	stx	%r20, [%r31 + %r1]
splash_tba_0_206:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 577: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_0_207:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d904006  ! 578: WRPR_WSTATE_R	wrpr	%r1, %r6, %wstate
	.word 0xa7500000  ! 579: RDPR_TPC	rdpr	%tpc, %r19
	.word 0xe727e001  ! 580: STF_I	st	%f19, [0x0001, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_208)) -> intp(0,1,3)
xir_0_208:
	.word 0xa982e001  ! 581: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	.word 0xe657c000  ! 582: LDSH_R	ldsh	[%r31 + %r0], %r19
	.word 0xe6800ae0  ! 583: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r19
	.word 0x26800001  ! 584: BL	bl,a	<label_0x1>
	.word 0x93902004  ! 585: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	set 0xeee114f8, %r28
	stxa %r28, [%g0] 0x73
intvec_0_209:
	.word 0x39400001  ! 586: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe637e001  ! 587: STH_I	sth	%r19, [%r31 + 0x0001]
splash_lsu_0_210:
	setx 0x45a778b649fe94ad, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 588: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802063  ! 589: WRASI_I	wr	%r0, 0x0063, %asi
mondo_0_211:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d918002  ! 590: WRPR_WSTATE_R	wrpr	%r6, %r2, %wstate
	.word 0xa8f96001  ! 591: SDIVcc_I	sdivcc 	%r5, 0x0001, %r20
splash_lsu_0_212:
	setx 0xf021bb10c62f72c9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 592: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe8d7e010  ! 593: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r20
tagged_0_213:
	taddcctv %r13, 0x164e, %r25
	.word 0xe807e001  ! 594: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x8ac12001  ! 595: ADDCcc_I	addccc 	%r4, 0x0001, %r5
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_214)) -> intp(0,0,2)
intvec_0_214:
	.word 0x39400001  ! 596: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0x4c5ffccc, %r28
	stxa %r28, [%g0] 0x73
intvec_0_215:
	.word 0x39400001  ! 597: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_216:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d92c00b  ! 598: WRPR_WSTATE_R	wrpr	%r11, %r11, %wstate
mondo_0_217:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d910014  ! 599: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
	.word 0x87802058  ! 600: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8d50c000  ! 601: RDPR_TT	rdpr	%tt, %r6
intveclr_0_218:
	set 0xafb7d58a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 602: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_219:
	setx 0x41aa55a29f9dbb2d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 603: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 604: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xccd004a0  ! 605: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r6
	.word 0xccbfc034  ! 606: STDA_R	stda	%r6, [%r31 + %r20] 0x01
	.word 0xcc37c014  ! 607: STH_R	sth	%r6, [%r31 + %r20]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_220)) -> intp(0,0,0)
intvec_0_220:
	.word 0x39400001  ! 608: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903dde  ! 609: WRPR_PSTATE_I	wrpr	%r0, 0x1dde, %pstate
	.word 0x9f802001  ! 610: SIR	sir	0x0001
	.word 0x87802088  ! 611: WRASI_I	wr	%r0, 0x0088, %asi
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 612: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_0_221:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_221:
	.word 0x8f902004  ! 613: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x8d90233c  ! 614: WRPR_PSTATE_I	wrpr	%r0, 0x033c, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_222)) -> intp(0,0,15)
intvec_0_222:
	.word 0x39400001  ! 615: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_223:
	setx debug_0_223 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 616: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_224)) -> intp(0,0,14)
intvec_0_224:
	.word 0x39400001  ! 617: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0x372b598c, %r28
	stxa %r28, [%g0] 0x73
intvec_0_225:
	.word 0x39400001  ! 618: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_226)) -> intp(0,1,3)
xir_0_226:
	.word 0xa980a001  ! 619: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0x87802055  ! 620: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xa9828006  ! 621: WR_SET_SOFTINT_R	wr	%r10, %r6, %set_softint
	.word 0x87902291  ! 622: WRPR_TT_I	wrpr	%r0, 0x0291, %tt
	.word 0xcc8804a0  ! 623: LDUBA_R	lduba	[%r0, %r0] 0x25, %r6
	.word 0x8f520000  ! 624: RDPR_PIL	rdpr	%pil, %r7
	.word 0x87802063  ! 625: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xce900e60  ! 626: LDUHA_R	lduha	[%r0, %r0] 0x73, %r7
	.word 0xce9004a0  ! 627: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	.word 0x926c2001  ! 628: UDIVX_I	udivx 	%r16, 0x0001, %r9
	.word 0x93902006  ! 629: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_0_227:
	setx 0x4397f7b516758ac1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 630: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x28700001  ! 631: BPLEU	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_228)) -> intp(0,1,3)
xir_0_228:
	.word 0xa982e001  ! 632: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	.word 0xd20fc000  ! 633: LDUB_R	ldub	[%r31 + %r0], %r9
	.word 0x9ad4a001  ! 634: UMULcc_I	umulcc 	%r18, 0x0001, %r13
	.word 0xdb37e001  ! 635: STQF_I	-	%f13, [0x0001, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 636: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89a01971  ! 637: FqTOd	dis not found

mondo_0_230:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d948006  ! 638: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 639: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790227b  ! 640: WRPR_TT_I	wrpr	%r0, 0x027b, %tt
	.word 0x99514000  ! 641: RDPR_TBA	rdpr	%tba, %r12
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 642: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	set 0xfb5dd701, %r28
	stxa %r28, [%g0] 0x73
intvec_0_231:
	.word 0x39400001  ! 643: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x85450000  ! 644: RD_SET_SOFTINT	rd	%set_softint, %r2
intveclr_0_232:
	set 0x397b7cee, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 645: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 646: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc48804a0  ! 648: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0x94d2c002  ! 649: UMULcc_R	umulcc 	%r11, %r2, %r10
	set 0x696798ba, %r28
	stxa %r28, [%g0] 0x73
intvec_0_233:
	.word 0x39400001  ! 650: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_234:
	setx 0xc9646074b32da389, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 651: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_235:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d94400c  ! 652: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
	.word 0x93494000  ! 653: RDHPR_HTBA	rdhpr	%htba, %r9
	.word 0x91d02035  ! 654: Tcc_I	ta	icc_or_xcc, %r0 + 53
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_236)) -> intp(0,0,30)
intvec_0_236:
	.word 0x39400001  ! 655: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8db44ff1  ! 656: FONES	e	%f6
debug_0_237:
	mov 0x38, %r18
	.word 0xfef00b12  ! 657: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d902667  ! 658: WRPR_PSTATE_I	wrpr	%r0, 0x0667, %pstate
DS_0_238:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 659: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xa7842001  ! 660: WR_GRAPHICS_STATUS_REG_I	wr	%r16, 0x0001, %-
	.word 0x87802014  ! 661: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x879023d4  ! 662: WRPR_TT_I	wrpr	%r0, 0x03d4, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xcc5fc000  ! 663: LDX_R	ldx	[%r31 + %r0], %r6
mondo_0_239:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d948001  ! 664: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
	.word 0xcc1fe001  ! 665: LDD_I	ldd	[%r31 + 0x0001], %r6
DS_0_240:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xcb6ae3bb	! Random illegal ?
	.word 0xd5100004  ! 1: LDQF_R	-	[%r0, %r4], %f10
	.word 0x9ba34822  ! 666: FADDs	fadds	%f13, %f2, %f13
	set 0xe51aca6a, %r28
	stxa %r28, [%g0] 0x73
intvec_0_241:
	.word 0x39400001  ! 667: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_242:
	setx 0x6a8ade709ae2c81f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 668: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x89504000  ! 669: RDPR_TNPC	rdpr	%tnpc, %r4
	.word 0xc84fe001  ! 670: LDSB_I	ldsb	[%r31 + 0x0001], %r4
	.word 0xc88008a0  ! 671: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0xc997e001  ! 672: LDQFA_I	-	[%r31, 0x0001], %f4
	set 0xb63aba0d, %r28
	stxa %r28, [%g0] 0x73
intvec_0_243:
	.word 0x39400001  ! 673: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_244:
	setx 0x1bacbf4b625cf125, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 674: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	set 0x9c0991dd, %r28
	stxa %r28, [%g0] 0x73
intvec_0_245:
	.word 0x39400001  ! 675: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_246)) -> intp(0,0,15)
intvec_0_246:
	.word 0x39400001  ! 676: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_247:
	set 0x3ee83d18, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 677: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_248)) -> intp(0,1,3)
xir_0_248:
	.word 0xa980e001  ! 678: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
intveclr_0_249:
	set 0x98a6adce, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 679: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc807c000  ! 680: LDUW_R	lduw	[%r31 + %r0], %r4
	.word 0x87802088  ! 681: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d903cad  ! 682: WRPR_PSTATE_I	wrpr	%r0, 0x1cad, %pstate
	.word 0x8d903c6e  ! 683: WRPR_PSTATE_I	wrpr	%r0, 0x1c6e, %pstate
	.word 0xc837c002  ! 684: STH_R	sth	%r4, [%r31 + %r2]
	.word 0xc927c002  ! 685: STF_R	st	%f4, [%r2, %r31]
	.word 0xc8dfe020  ! 686: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r4
	.word 0x87802016  ! 687: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x93902000  ! 688: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xc8c7e000  ! 689: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r4
	.word 0xc897e020  ! 690: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r4
	.word 0xc85fe001  ! 691: LDX_I	ldx	[%r31 + 0x0001], %r4
DS_0_250:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 692: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc837c002  ! 693: STH_R	sth	%r4, [%r31 + %r2]
	.word 0x83d02033  ! 694: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x87802058  ! 695: WRASI_I	wr	%r0, 0x0058, %asi
mondo_0_251:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d950003  ! 696: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
	.word 0x87802063  ! 697: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xa1454000  ! 698: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
	.word 0x8d902148  ! 699: WRPR_PSTATE_I	wrpr	%r0, 0x0148, %pstate
intveclr_0_252:
	set 0x8a0cbf4b, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 700: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87a01971  ! 701: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_254)) -> intp(0,0,31)
intvec_0_254:
	.word 0x39400001  ! 702: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_255:
	set 0x2104ef60, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 703: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc68fe000  ! 704: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r3
tagged_0_256:
	tsubcctv %r19, 0x1490, %r14
	.word 0xc607e001  ! 705: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x99902001  ! 706: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x8d902029  ! 707: WRPR_PSTATE_I	wrpr	%r0, 0x0029, %pstate
DS_0_257:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 708: SAVE_R	save	%r31, %r0, %r31
DS_0_258:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xb97198a6	! Random illegal ?
	.word 0x9ba00551  ! 1: FSQRTd	fsqrt	
	.word 0xa1a44832  ! 709: FADDs	fadds	%f17, %f18, %f16
	.word 0xe09fe001  ! 710: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r16
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 711: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 712: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9f802001  ! 713: SIR	sir	0x0001
	.word 0xe047e001  ! 714: LDSW_I	ldsw	[%r31 + 0x0001], %r16
	.word 0xe08008a0  ! 715: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x8d90344a  ! 716: WRPR_PSTATE_I	wrpr	%r0, 0x144a, %pstate
DS_0_259:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 717: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x93902000  ! 718: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93d020b3  ! 719: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0xe00fe001  ! 720: LDUB_I	ldub	[%r31 + 0x0001], %r16
tagged_0_260:
	tsubcctv %r16, 0x1d4d, %r14
	.word 0xe007e001  ! 721: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xa1902003  ! 722: WRPR_GL_I	wrpr	%r0, 0x0003, %-
DS_0_261:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 723: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_262)) -> intp(0,0,27)
intvec_0_262:
	.word 0x39400001  ! 724: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 725: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1848004  ! 726: WR_STICK_REG_R	wr	%r18, %r4, %-
	.word 0x9f802001  ! 727: SIR	sir	0x0001
	.word 0x93902002  ! 728: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xe117c000  ! 729: LDQF_R	-	[%r31, %r0], %f16
	.word 0xe097e030  ! 730: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r16
	.word 0x87802089  ! 731: WRASI_I	wr	%r0, 0x0089, %asi
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 732: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8780204f  ! 733: WRASI_I	wr	%r0, 0x004f, %asi
splash_lsu_0_264:
	setx 0x716dfb93d6541b13, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 734: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 735: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	set 0x658f0f83, %r28
	stxa %r28, [%g0] 0x73
intvec_0_265:
	.word 0x39400001  ! 736: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 737: Tcc_R	te	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_266)) -> intp(0,0,3)
intvec_0_266:
	.word 0x39400001  ! 738: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe08fe030  ! 739: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r16
	.word 0xe01fe001  ! 740: LDD_I	ldd	[%r31 + 0x0001], %r16
	.word 0x34700001  ! 741: BPG	<illegal instruction>
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 742: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_267:
	mov 0x38, %r18
	.word 0xfef00b12  ! 743: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe047c000  ! 744: LDSW_R	ldsw	[%r31 + %r0], %r16
mondo_0_268:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d93400c  ! 745: WRPR_WSTATE_R	wrpr	%r13, %r12, %wstate
	.word 0xa1902001  ! 746: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	set 0x6863f162, %r28
	stxa %r28, [%g0] 0x73
intvec_0_269:
	.word 0x39400001  ! 747: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_270:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 748: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8f6a2001  ! 749: SDIVX_I	sdivx	%r8, 0x0001, %r7
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 750: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 751: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_272:
	setx 0xd562fccfadd944c3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 752: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xce1fe001  ! 753: LDD_I	ldd	[%r31 + 0x0001], %r7
DS_0_273:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 754: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x99902000  ! 755: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x87802063  ! 756: WRASI_I	wr	%r0, 0x0063, %asi
tagged_0_274:
	tsubcctv %r2, 0x1f42, %r24
	.word 0xce07e001  ! 757: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0xced7e000  ! 758: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r7
	.word 0xa1902009  ! 759: WRPR_GL_I	wrpr	%r0, 0x0009, %-
mondo_0_275:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d904005  ! 760: WRPR_WSTATE_R	wrpr	%r1, %r5, %wstate
	.word 0x8780201c  ! 761: WRASI_I	wr	%r0, 0x001c, %asi
tagged_0_276:
	tsubcctv %r5, 0x1bfb, %r16
	.word 0xce07e001  ! 762: LDUW_I	lduw	[%r31 + 0x0001], %r7
splash_lsu_0_277:
	setx 0x5a8d785118c82e69, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 763: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xce07c000  ! 764: LDUW_R	lduw	[%r31 + %r0], %r7
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56ce001  ! 765: SDIVX_I	sdivx	%r19, 0x0001, %r18
	.word 0xe537e001  ! 766: STQF_I	-	%f18, [0x0001, %r31]
	.word 0x9f802001  ! 767: SIR	sir	0x0001
	.word 0xe4800aa0  ! 768: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r18
	.word 0x9f802001  ! 769: SIR	sir	0x0001
	set 0x866474c8, %r28
	stxa %r28, [%g0] 0x73
intvec_0_279:
	.word 0x39400001  ! 770: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 771: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe447e001  ! 772: LDSW_I	ldsw	[%r31 + 0x0001], %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 773: LDX_R	ldx	[%r31 + %r0], %r18
splash_lsu_0_280:
	setx 0xfb7485df8f944367, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 774: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903562  ! 775: WRPR_PSTATE_I	wrpr	%r0, 0x1562, %pstate
	.word 0x85a000c9  ! 776: FNEGd	fnegd	%f40, %f2
	.word 0x93d020b4  ! 777: Tcc_I	tne	icc_or_xcc, %r0 + 180
mondo_0_281:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d944007  ! 778: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
	.word 0x89464000  ! 779: RD_STICK_CMPR_REG	rd	%-, %r4
splash_cmpr_0_282:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181e001  ! 780: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	set 0x4939b0dd, %r28
	stxa %r28, [%g0] 0x73
intvec_0_283:
	.word 0x39400001  ! 781: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc80fe001  ! 782: LDUB_I	ldub	[%r31 + 0x0001], %r4
	.word 0xc88804a0  ! 783: LDUBA_R	lduba	[%r0, %r0] 0x25, %r4
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 784: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 785: Tcc_R	te	icc_or_xcc, %r0 + %r30
mondo_0_284:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d90000d  ! 786: WRPR_WSTATE_R	wrpr	%r0, %r13, %wstate
	.word 0xa745c000  ! 787: RD_TICK_CMPR_REG	rd	%-, %r19
DS_0_285:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb12800c  ! 1: LDQF_R	-	[%r10, %r12], %f13
	.word 0x81a24830  ! 788: FADDs	fadds	%f9, %f16, %f0
splash_tba_0_286:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 789: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902007  ! 790: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	set 0x7c353649, %r28
	stxa %r28, [%g0] 0x73
intvec_0_287:
	.word 0x39400001  ! 791: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902075  ! 792: WRPR_TT_I	wrpr	%r0, 0x0075, %tt
DS_0_288:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 793: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
DS_0_289:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd9308012  ! 1: STQF_R	-	%f12, [%r18, %r2]
	normalw
	.word 0x87458000  ! 794: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x9a836001  ! 795: ADDcc_I	addcc 	%r13, 0x0001, %r13
	.word 0xdac00e60  ! 796: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r13
DS_0_290:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0x9d5f88cf	! Random illegal ?
	.word 0xcb150002  ! 1: LDQF_R	-	[%r20, %r2], %f5
	.word 0xa3a4c822  ! 797: FADDs	fadds	%f19, %f2, %f17
	.word 0x93902007  ! 798: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	set 0x596a7d7, %r28
	stxa %r28, [%g0] 0x73
intvec_0_291:
	.word 0x39400001  ! 799: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe29004a0  ! 800: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
	.word 0x87802004  ! 801: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe22fe001  ! 802: STB_I	stb	%r17, [%r31 + 0x0001]
	.word 0x81460000  ! 803: RD_STICK_REG	stbar
	.word 0xa190200d  ! 804: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x28700001  ! 805: BPLEU	<illegal instruction>
	.word 0xe29004a0  ! 806: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_292)) -> intp(0,0,30)
intvec_0_292:
	.word 0x39400001  ! 807: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe29fe001  ! 808: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r17
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 809: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879022d7  ! 810: WRPR_TT_I	wrpr	%r0, 0x02d7, %tt
	.word 0x87802016  ! 811: WRASI_I	wr	%r0, 0x0016, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902007  ! 813: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xe257e001  ! 814: LDSH_I	ldsh	[%r31 + 0x0001], %r17
	.word 0x3a800001  ! 815: BCC	bcc,a	<label_0x1>
	.word 0xe2d004a0  ! 816: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0x87802004  ! 817: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_PRIV	! macro
tagged_0_293:
	taddcctv %r26, 0x1473, %r18
	.word 0xe207e001  ! 819: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe277e001  ! 820: STX_I	stx	%r17, [%r31 + 0x0001]
tagged_0_294:
	tsubcctv %r8, 0x1d86, %r17
	.word 0xe207e001  ! 821: LDUW_I	lduw	[%r31 + 0x0001], %r17
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902007  ! 823: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	set 0x5dfda37e, %r28
	stxa %r28, [%g0] 0x73
intvec_0_295:
	.word 0x39400001  ! 824: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_0_296:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 825: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_htba_0_297:
	set 0x003b0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 826: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87802063  ! 827: WRASI_I	wr	%r0, 0x0063, %asi
debug_0_298:
	setx debug_0_298 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 828: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 829: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xa1450000  ! 830: RD_SET_SOFTINT	rd	%set_softint, %r16
	.word 0x87802055  ! 831: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x81510000  ! 832: RDPR_TICK	rdpr	%tick, %r0
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 833: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93d020b5  ! 834: Tcc_I	tne	icc_or_xcc, %r0 + 181
	set 0x765a714f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_299:
	.word 0x39400001  ! 835: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe197e001  ! 836: LDQFA_I	-	[%r31, 0x0001], %f16
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 837: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe0800a80  ! 838: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r16
	.word 0x89514000  ! 839: RDPR_TBA	rdpr	%tba, %r4
	.word 0xc88008a0  ! 840: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0xc8d804a0  ! 841: LDXA_R	ldxa	[%r0, %r0] 0x25, %r4
	.word 0x87902304  ! 842: WRPR_TT_I	wrpr	%r0, 0x0304, %tt
intveclr_0_300:
	set 0xc474fcb2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 843: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	set 0x7562718e, %r28
	stxa %r28, [%g0] 0x73
intvec_0_301:
	.word 0x39400001  ! 844: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902084  ! 845: WRPR_TT_I	wrpr	%r0, 0x0084, %tt
splash_lsu_0_302:
	setx 0x73758ef48fad73fd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 846: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_303)) -> intp(0,1,3)
xir_0_303:
	.word 0xa9842001  ! 847: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0xc88fe000  ! 848: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r4
	.word 0x93902001  ! 849: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d903fbb  ! 850: WRPR_PSTATE_I	wrpr	%r0, 0x1fbb, %pstate
DS_0_304:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 851: SAVE_R	save	%r31, %r0, %r31
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 852: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa982c003  ! 853: WR_SET_SOFTINT_R	wr	%r11, %r3, %set_softint
	.word 0x83508000  ! 854: RDPR_TSTATE	<illegal instruction>
	.word 0x30700001  ! 855: BPA	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_305)) -> intp(0,1,3)
xir_0_305:
	.word 0xa9816001  ! 856: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	.word 0xc317c000  ! 857: LDQF_R	-	[%r31, %r0], %f1
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_306)) -> intp(0,0,20)
intvec_0_306:
	.word 0x39400001  ! 858: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93d02035  ! 859: Tcc_I	tne	icc_or_xcc, %r0 + 53
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_307)) -> intp(0,1,3)
xir_0_307:
	.word 0xa982a001  ! 860: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_308)) -> intp(0,0,14)
intvec_0_308:
	.word 0x39400001  ! 861: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 862: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902003  ! 863: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc2800bc0  ! 864: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r1
	.word 0x91926001  ! 865: WRPR_PIL_I	wrpr	%r9, 0x0001, %pil
	.word 0xc28008a0  ! 866: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
tagged_0_309:
	taddcctv %r24, 0x16a1, %r16
	.word 0xc207e001  ! 867: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc327e001  ! 868: STF_I	st	%f1, [0x0001, %r31]
splash_tba_0_310:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 869: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	set 0xa0ef807e, %r28
	stxa %r28, [%g0] 0x73
intvec_0_311:
	.word 0x39400001  ! 870: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 871: WRASI_I	wr	%r0, 0x001c, %asi
intveclr_0_312:
	set 0x7b2850bb, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 872: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 873: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_0_313:
	setx debug_0_313 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 874: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x879023e0  ! 875: WRPR_TT_I	wrpr	%r0, 0x03e0, %tt
	.word 0xc327e001  ! 876: STF_I	st	%f1, [0x0001, %r31]
	.word 0x8fa249ad  ! 877: FDIVs	fdivs	%f9, %f13, %f7
	.word 0x93902006  ! 878: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x95520000  ! 879: RDPR_PIL	rdpr	%pil, %r10
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 880: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 881: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8d90372c  ! 882: WRPR_PSTATE_I	wrpr	%r0, 0x172c, %pstate
	.word 0xa1902007  ! 883: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xd4dfe000  ! 884: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	.word 0x91d02035  ! 885: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87504000  ! 886: RDPR_TNPC	rdpr	%tnpc, %r3
	.word 0x87540000  ! 887: RDPR_GL	rdpr	%-, %r3
	.word 0xc6800c20  ! 888: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r3
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_314)) -> intp(0,0,18)
intvec_0_314:
	.word 0x39400001  ! 889: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_315:
	set 0x68f0c855, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 890: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc717c000  ! 891: LDQF_R	-	[%r31, %r0], %f3
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 892: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc647c000  ! 893: LDSW_R	ldsw	[%r31 + %r0], %r3
	.word 0x8d90232d  ! 894: WRPR_PSTATE_I	wrpr	%r0, 0x032d, %pstate
mondo_0_316:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d910006  ! 895: WRPR_WSTATE_R	wrpr	%r4, %r6, %wstate
splash_lsu_0_317:
	setx 0x69fe802b2fe7ac95, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 896: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xad826001  ! 897: WR_SOFTINT_REG_I	wr	%r9, 0x0001, %softint
	.word 0xa9a01a65  ! 898: FqTOi	fqtoi	
	.word 0x8d903d1f  ! 899: WRPR_PSTATE_I	wrpr	%r0, 0x1d1f, %pstate
	.word 0x95a00574  ! 900: FSQRTq	fsqrt	
tagged_0_318:
	tsubcctv %r14, 0x1f09, %r1
	.word 0xd407e001  ! 901: LDUW_I	lduw	[%r31 + 0x0001], %r10
intveclr_0_319:
	set 0x30585ac6, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 902: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_320)) -> intp(0,1,3)
xir_0_320:
	.word 0xa9852001  ! 903: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
DS_0_321:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 904: SAVE_R	save	%r31, %r0, %r31
	.word 0xd49fe001  ! 905: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r10
	.word 0xd48008a0  ! 906: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa190200f  ! 907: WRPR_GL_I	wrpr	%r0, 0x000f, %-
mondo_0_322:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d924014  ! 908: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
debug_0_323:
	mov 0x38, %r18
	.word 0xfef00b12  ! 909: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_324:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 910: SAVE_R	save	%r31, %r0, %r31
change_to_randtl_0_325:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_325:
	.word 0x8f902005  ! 911: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xd41fc000  ! 912: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0x81510000  ! 913: RDPR_TICK	rdpr	%tick, %r0
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_326)) -> intp(0,0,23)
intvec_0_326:
	.word 0x39400001  ! 914: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4c004a0  ! 915: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x926ce001  ! 916: UDIVX_I	udivx 	%r19, 0x0001, %r9
	.word 0x879023b7  ! 917: WRPR_TT_I	wrpr	%r0, 0x03b7, %tt
	.word 0xd337e001  ! 918: STQF_I	-	%f9, [0x0001, %r31]
splash_tba_0_327:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 919: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd2800c60  ! 920: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r9
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_328)) -> intp(0,0,30)
intvec_0_328:
	.word 0x39400001  ! 921: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d520000  ! 922: RDPR_PIL	rdpr	%pil, %r6
mondo_0_329:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d948004  ! 923: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_330)) -> intp(0,0,13)
intvec_0_330:
	.word 0x39400001  ! 924: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_331:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d934000  ! 925: WRPR_WSTATE_R	wrpr	%r13, %r0, %wstate
intveclr_0_332:
	set 0xd27fe49e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 926: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x85454000  ! 927: RD_CLEAR_SOFTINT	rd	%clear_softint, %r2
	.word 0xc447e001  ! 928: LDSW_I	ldsw	[%r31 + 0x0001], %r2
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 929: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x8950c000  ! 930: RDPR_TT	rdpr	%tt, %r4
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_333)) -> intp(0,1,3)
xir_0_333:
	.word 0xa9822001  ! 931: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
splash_lsu_0_334:
	setx 0xddb7f46b5cd5d981, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 932: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	set 0xa6fb759c, %r28
	stxa %r28, [%g0] 0x73
intvec_0_335:
	.word 0x39400001  ! 933: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_336:
	tsubcctv %r10, 0x1651, %r14
	.word 0xc807e001  ! 934: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc897e010  ! 935: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r4
	.word 0xc8cfe000  ! 936: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r4
splash_lsu_0_337:
	setx 0xe88b46e11fc8119d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 937: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_338:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d90c006  ! 938: WRPR_WSTATE_R	wrpr	%r3, %r6, %wstate
	.word 0xc89004a0  ! 939: LDUHA_R	lduha	[%r0, %r0] 0x25, %r4
	.word 0xc88fe030  ! 940: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r4
	.word 0xa750c000  ! 941: RDPR_TT	rdpr	%tt, %r19
	.word 0xe69fe001  ! 942: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r19
	.word 0xa1902002  ! 943: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x87802088  ! 944: WRASI_I	wr	%r0, 0x0088, %asi
	set 0xa2dfeee, %r28
	stxa %r28, [%g0] 0x73
intvec_0_339:
	.word 0x39400001  ! 945: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_340:
	setx debug_0_340 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 946: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe6d804a0  ! 947: LDXA_R	ldxa	[%r0, %r0] 0x25, %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_341)) -> intp(0,1,3)
xir_0_341:
	.word 0xa981a001  ! 948: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe6900e40  ! 950: LDUHA_R	lduha	[%r0, %r0] 0x72, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 951: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x99480000  ! 952: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
tagged_0_342:
	tsubcctv %r14, 0x1889, %r4
	.word 0xd807e001  ! 953: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd89fe001  ! 954: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
tagged_0_343:
	taddcctv %r1, 0x1497, %r19
	.word 0xd807e001  ! 955: LDUW_I	lduw	[%r31 + 0x0001], %r12
tagged_0_344:
	tsubcctv %r6, 0x12ab, %r17
	.word 0xd807e001  ! 956: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x81450000  ! 957: RD_SET_SOFTINT	stbar
	.word 0x8790202b  ! 958: WRPR_TT_I	wrpr	%r0, 0x002b, %tt
	set 0x8ae0c7d6, %r28
	stxa %r28, [%g0] 0x73
intvec_0_345:
	.word 0x39400001  ! 959: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc037e001  ! 960: STH_I	sth	%r0, [%r31 + 0x0001]
mondo_0_346:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d914005  ! 961: WRPR_WSTATE_R	wrpr	%r5, %r5, %wstate
DS_0_347:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f30, %f26, %f8
	.word 0x8fb2c303  ! 962: ALIGNADDRESS	alignaddr	%r11, %r3, %r7
intveclr_0_348:
	set 0x9674c872, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 963: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 964: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x89454000  ! 965: RD_CLEAR_SOFTINT	rd	%clear_softint, %r4
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 966: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 967: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d903678  ! 968: WRPR_PSTATE_I	wrpr	%r0, 0x1678, %pstate
	.word 0x99454000  ! 969: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0x93902005  ! 970: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8198270d  ! 971: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070d, %hpstate
	.word 0xa7508000  ! 972: RDPR_TSTATE	rdpr	%tstate, %r19
debug_0_349:
	setx debug_0_349 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 973: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe65fe001  ! 974: LDX_I	ldx	[%r31 + 0x0001], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 975: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x8d802004  ! 976: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe64fe001  ! 977: LDSB_I	ldsb	[%r31 + 0x0001], %r19
	.word 0xe69fc020  ! 978: LDDA_R	ldda	[%r31, %r0] 0x01, %r19
tagged_0_350:
	tsubcctv %r21, 0x1edf, %r11
	.word 0xe607e001  ! 979: LDUW_I	lduw	[%r31 + 0x0001], %r19
DS_0_351:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8fa00547  ! 1: FSQRTd	fsqrt	
	.word 0x95a2082c  ! 980: FADDs	fadds	%f8, %f12, %f10
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_352)) -> intp(0,0,8)
intvec_0_352:
	.word 0x39400001  ! 981: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 982: LDX_R	ldx	[%r31 + %r0], %r10
splash_lsu_0_353:
	setx 0x4599ee81637c2719, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 983: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_354)) -> intp(0,1,3)
xir_0_354:
	.word 0xa9846001  ! 984: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	.word 0x87902382  ! 985: WRPR_TT_I	wrpr	%r0, 0x0382, %tt
	.word 0xa1902002  ! 986: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xab80c006  ! 987: WR_CLEAR_SOFTINT_R	wr	%r3, %r6, %clear_softint
splash_lsu_0_355:
	setx 0xc887d9d089c08cdd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 988: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_356:
	mov 0x38, %r18
	.word 0xfef00b12  ! 989: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa7a4c9e7  ! 990: FDIVq	dis not found

	set 0x7dbd3488, %r28
	stxa %r28, [%g0] 0x73
intvec_0_357:
	.word 0x39400001  ! 991: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x86d84001  ! 992: SMULcc_R	smulcc 	%r1, %r1, %r3
	.word 0x879021aa  ! 993: WRPR_TT_I	wrpr	%r0, 0x01aa, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 994: LDX_R	ldx	[%r31 + %r0], %r3
change_to_randtl_0_358:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_358:
	.word 0x8f902002  ! 995: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xc6c7e010  ! 996: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r3
	.word 0xc61fc000  ! 997: LDD_R	ldd	[%r31 + %r0], %r3
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 998: Tcc_R	ta	icc_or_xcc, %r0 + %r30
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

	.xword	0x84bbbe71d92eb938
	.xword	0x2b38ce142851a0b5
	.xword	0xf43cb3b45b072195
	.xword	0xb44fe34d9aff6180
	.xword	0x3646133606a01c79
	.xword	0xfefc7e326bd46303
	.xword	0x0eeed25590a60bc1
	.xword	0xe36dc78e7a4c8c40
	.xword	0xafaf7810c53c51ff
	.xword	0x518cd3051396c5d6
	.xword	0x3bcc82ed0be41ef4
	.xword	0x09a9464c06fd4342
	.xword	0xc1a7b495eee62471
	.xword	0xe648c51c7f20afda
	.xword	0x128ed077660052fa
	.xword	0x8edbf38648d5c56b
	.xword	0xc7a0aa1bff4b5cd2
	.xword	0x5bbcd17d410ef2b0
	.xword	0xa1d77b759f5a8603
	.xword	0x16214bbefc6dbe8f
	.xword	0x9a2ca7212ce43fcb
	.xword	0xa43602981507d761
	.xword	0x7761be3cb187ac56
	.xword	0xbe162eee42ed2808
	.xword	0x5abc172899e52026
	.xword	0xcc7ed79d176dad3b
	.xword	0x22dd2ea8c7847715
	.xword	0x6ecc46db7478a602
	.xword	0xffb249f2ef733eed
	.xword	0x160be5a68514a639
	.xword	0xbcf0491b216fdaf5
	.xword	0x4bade1e90b4bfe23
	.xword	0x0f03bad425d9e3ec
	.xword	0xf1dc53d4ee396818
	.xword	0xc69cc31ea52f7c2d
	.xword	0x1f930ea6f03da4e5
	.xword	0xf4184283d95b50e5
	.xword	0x342493e0212b470c
	.xword	0x99801a17ce84cf72
	.xword	0x2687d7c62f0169f5
	.xword	0x68f859ad474ea364
	.xword	0x2445adfcbe147825
	.xword	0x73136a9cf2e72911
	.xword	0x6933c976df7747a5
	.xword	0x97f0d0e8ababb1bf
	.xword	0x8b8df8d57d96a4ef
	.xword	0x99b19ab25d23f0ff
	.xword	0xc2171d081ec5fbc2
	.xword	0x90c2d2d232159ab5
	.xword	0x48790d2a57a4aa15
	.xword	0x6e3694fecf74dfbf
	.xword	0xd98370d272a81f38
	.xword	0xf3f9c5723ec13a4b
	.xword	0x7a544f64312d2550
	.xword	0x546f7a2445a269a3
	.xword	0x419f963d7042d3e1
	.xword	0xa289ef4a10a5b4ea
	.xword	0x9f688a05e239b0eb
	.xword	0x52faa7bb0981eac9
	.xword	0xff90dfe8eaf55234
	.xword	0xa3c0b513a783c6ab
	.xword	0x40836c8945bb598c
	.xword	0xe5523119bbe28297
	.xword	0x4562e6bdfb5a8601
	.xword	0x4035e5a850455d69
	.xword	0x5fe9bdfdef6b0b96
	.xword	0x9993148a74624984
	.xword	0x3ef1040f9bd52546
	.xword	0x18bc2ee0816a28e9
	.xword	0xcf346965406fc075
	.xword	0x8a5f6837ee5fef36
	.xword	0xb6c50afee1b206dc
	.xword	0x79a5af1d57f8527a
	.xword	0x4b007005963898d9
	.xword	0x7c67a8f967fc06db
	.xword	0x475db97a7ee6c79c
	.xword	0x9602a2559176db05
	.xword	0x213f4a17e60382e5
	.xword	0x461fde85909ca723
	.xword	0xbdd77e54b26d6aaa
	.xword	0x1d62d7ed8fae67d9
	.xword	0xf5d2862d372afab8
	.xword	0x6c171faf62eb7eb7
	.xword	0xa4b4db090450da2e
	.xword	0x58555760a7376b5f
	.xword	0x4fe8ac78f91e46d0
	.xword	0xdf35c262b34019e2
	.xword	0x44408dab28a87f03
	.xword	0x95282512db479ca4
	.xword	0x1836933afc92c5fa
	.xword	0xccbd5eecaca6c1d0
	.xword	0x7f5d689b47e34a63
	.xword	0xa1fc16f58c46c456
	.xword	0xa9693659c245f7ec
	.xword	0x1c3635225c633ce3
	.xword	0x1b79d11ab37ea046
	.xword	0xb98b6b75684420c6
	.xword	0x096def955116dc58
	.xword	0x3f75107117acb8ce
	.xword	0xf063065d6a087651
	.xword	0x7aeea7d23c53bebe
	.xword	0x2c1fe0c5720d1d8c
	.xword	0x01799ac54d399e26
	.xword	0x073b3b577817d06e
	.xword	0x33c565682b94c6bb
	.xword	0xe58ec2d3cc50e38c
	.xword	0x1c8ba631c47bee93
	.xword	0x82efdff4e58ece35
	.xword	0xae72bae77b120f96
	.xword	0x23e793f190e382d1
	.xword	0xf56489729d10ee2d
	.xword	0x93f6bb5cd7152ec1
	.xword	0x9bf251d0574c6bf7
	.xword	0xba3c849b40931f85
	.xword	0xd1ccc9272a13003d
	.xword	0x2f2f0416e4181883
	.xword	0x342cc117b676f513
	.xword	0x974fcce33f1c6f93
	.xword	0x636de13d016c6212
	.xword	0x0ec4198f65206615
	.xword	0x480eb762dd11b014
	.xword	0xd79346c81cba982f
	.xword	0x2f86cd1c01ae9264
	.xword	0x7da83f1e13847a82
	.xword	0x3b12015ce1685bd6
	.xword	0xdef8903d05750747
	.xword	0x528e12cd8eb0e9bb
	.xword	0xf08b7cddd154932c
	.xword	0x7bdb469f8ac39492
	.xword	0x25b5538a95470008
	.xword	0xaba6d4bb6ead9758
	.xword	0x25b89ba8a29effbe
	.xword	0x0e2a086e5e3ff001
	.xword	0xcd174203fb881e0d
	.xword	0xa94a7064fcba9197
	.xword	0x1019940b043bf79e
	.xword	0x88e79dba7f726cd3
	.xword	0xfd4340ea7f25acbb
	.xword	0x88ff9eab15a51a73
	.xword	0x75323905026168c8
	.xword	0x1888ea000cff39b3
	.xword	0x9d809cb910d5b3e6
	.xword	0x6061d8d570a68fc6
	.xword	0x2f03a42f9c380efc
	.xword	0x7808400c4a1971d6
	.xword	0x45669f2cc9ae0739
	.xword	0xd156b0105029d728
	.xword	0x09087ff5d90c83ff
	.xword	0x4e332d3202199f42
	.xword	0x9e8e6bf66ef9a038
	.xword	0xdc040c5f7ab824db
	.xword	0xa2215fbb8ea38f74
	.xword	0xe481443ad93fd4e4
	.xword	0x8bdb039c1042b8e9
	.xword	0x9b49832aa3fd2cbf
	.xword	0xefaf5084b90e49f6
	.xword	0x1c38a6130eecdcf9
	.xword	0xe190623a860ac8fd
	.xword	0xc54645053b7dfdaf
	.xword	0xab0ee22c725e93b7
	.xword	0x4ed1a600cfd28c9f
	.xword	0x55dbc3ae12ceed32
	.xword	0xe088d929a47e0892
	.xword	0x8e512f9b7c48596d
	.xword	0xfb1557628ab8c24c
	.xword	0x85534bee10cfdf7e
	.xword	0xbc5258602052d529
	.xword	0x043e2617528b4a21
	.xword	0x3a369503a4612765
	.xword	0x2b82a3302222f3b9
	.xword	0xe22484572863bb80
	.xword	0x056eba375fe3eb52
	.xword	0x6ca2e9e87e2c54cc
	.xword	0xf3c0cd6262617bd8
	.xword	0x3a8f3c489374f676
	.xword	0x31a8448e0f7e66e9
	.xword	0x40da3f981bf1d3f6
	.xword	0xf7fa382d8891377f
	.xword	0x50d8d4064c425a68
	.xword	0x2238e09ccf6c0cf5
	.xword	0x82e1785c11a41de1
	.xword	0xf87d060dacb38736
	.xword	0x4d285e3a60c5b89d
	.xword	0xecae408be08afe01
	.xword	0x7e60b172a5d0ad7e
	.xword	0x09b645ced0cc3445
	.xword	0xc0594ccf644942be
	.xword	0x387664330cfb10c2
	.xword	0xd100f9067eae8edd
	.xword	0x4eb905bb2a107a09
	.xword	0x8d689a74059803f3
	.xword	0x25456198c1e5e241
	.xword	0xc7f297c0ccd168bc
	.xword	0x2603dbe6b35ed8af
	.xword	0x7c7f04b97b78ae87
	.xword	0x65e3338244db65ee
	.xword	0x0ae29a10f81aa841
	.xword	0x29c84e0bed3d5264
	.xword	0xb2f21d0f59208121
	.xword	0x9cfd6ea951e7c62f
	.xword	0x5dc98cbce286e740
	.xword	0xd8ad43cabfe14ce1
	.xword	0x34fe9d645dc38847
	.xword	0xb8170408d703b7e7
	.xword	0x2b73ad74bcd8e78f
	.xword	0xe1dc463157bdd1a6
	.xword	0xdca1579e4525748a
	.xword	0xb278f6bb51a2661c
	.xword	0x5d9c9616fb9b2d86
	.xword	0x11474e8c928552b5
	.xword	0x05c0d39ea948bcfa
	.xword	0xb5b597243975a2d9
	.xword	0x1e0910e4c736b2dd
	.xword	0x3ec905494eb3a1df
	.xword	0x7a36c000dd1bd1c1
	.xword	0x823b58afd8724860
	.xword	0x7f4790ad59483d22
	.xword	0x5dba7b2f6f4d7bfb
	.xword	0x37ef6b27d206e029
	.xword	0x6568f185be151c75
	.xword	0xded3f6de1def3183
	.xword	0x294312f9641b079c
	.xword	0xa76137c5929d467b
	.xword	0x449cda0030f57678
	.xword	0x41c3c3eaa0c173bd
	.xword	0x68c1f8c473eab15d
	.xword	0xa9eabefd98a3a14c
	.xword	0xcde73d3bd70ba654
	.xword	0x2bbb624c3e7fd37e
	.xword	0x4cce1ace01257ef2
	.xword	0x070d9ab2185643b5
	.xword	0xae42e39d7316d12c
	.xword	0x53306cea3bf7f078
	.xword	0x990e67f45d767cda
	.xword	0x86558ccfdd2553a9
	.xword	0x683d2c2e8afa2db7
	.xword	0x6abc38df1d51b945
	.xword	0x16e5d522db3413fe
	.xword	0x38d9bd835eda879d
	.xword	0xa8fe50326192077f
	.xword	0xa9a31ba9f22861d9
	.xword	0x5c75476842de8b41
	.xword	0x96fc2989b2487b44
	.xword	0x00fd7ddf86152072
	.xword	0x56bc8894211f2db8
	.xword	0x732878569c8bb18e
	.xword	0x2612586d084e9d77
	.xword	0x05cddb5d412776a7
	.xword	0xede0ff7b8a8f2623
	.xword	0xc6a0d3ebfeb9d49f
	.xword	0xbf94dd478e161b4d
	.xword	0x8d726db0a1a888be
	.xword	0x94e281f548a0cb2a
	.xword	0x946f1358dcdecb5e
	.xword	0x9f8771e3b044d80f
	.xword	0xc3c63133df9d2db0

.global wdog_2_ext
# 9 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
.global wdog_2_ext

SECTION .HTRAPS
.text
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
    stxa    %g0, [%g0] ASI_ERROR_INJECT
 ! If TT != 2, then goto trap handler
    rdpr %tt, %l1
    cmp %l1, 0x2
    bne wdog_2_goto_handler
    nop
 ! else done
    done
wdog_2_goto_handler:
    rdhpr %htba, %l2
    sllx %l1, 5, %l1
    add %l1, %l2, %l2
    jmp %l2
    nop
# 51 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
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
    stxa    %g0, [%g0] ASI_ERROR_INJECT

    rdpr %tt, %l1
    sllx %l1, 5, %l1
    rdhpr %htba, %l2
    add %l1, %l2, %l2
    rdhpr %hpstate, %l1
    jmp %l2
    wrhpr %l1, 0x20, %hpstate
    nop

wdog_red_ext:
 ! Shift stack down by 1 ...
    rdpr %tl, %l1
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

 ! If TT != 2, then goto trap handler
    rdpr %tt, %l1

    cmp %l1, 0x2
    bne continue_red_other
    nop
 ! else done
    mov 0x1f, %l1
    stxa    %l1, [%g0] ASI_LSU_CTL_REG
    stxa    %g0, [%g0] ASI_ERROR_INJECT
    done
# 329 "diag.j"



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
	TTE_X	 = 1
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
	TTE_X	 = 1
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
	TTE_X	 = 1
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
	TTE_X	 = 1
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
	TTE_E	 = 0,
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
	TTE_E	 = 0,
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
	TTE_CP	 = 1,
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
	TTE_X	 = 1
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
	Name	 = .MyTRAPS_3,
	hypervisor
}


attr_data {
	Name	 = .MyTRAPS_3,
	hypervisor
}

#include "traps.s"



#if 0
#endif

