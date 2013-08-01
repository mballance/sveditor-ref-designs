/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_10_11_8.s
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
#define TRAP_SECT_HV_ALSO
#define DMMU_SKIP_IF_NO_TTE	

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

#define H_T1_VA_Watchpoint_0x62
#define My_T1_VA_Watchpoint_0x62 \
    done; nop

#define H_HT0_VA_Watchpoint_0x62
#define My_HT0_VA_Watchpoint_0x62 \
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
    done;nop
# 707 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 724 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_unauth_access_0x0b
#define SUN_H_HT0_IAE_unauth_access_0x0b \
    done;nop
# 729 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_nfo_page_0x0c
#define SUN_H_HT0_IAE_nfo_page_0x0c \
    done;nop
# 738 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 12 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!! START of Interrupt Handlers !!!!!!!!!!!!!!!!!

#define H_HT0_Externally_Initiated_Reset_0x03
#define SUN_H_HT0_Externally_Initiated_Reset_0x03 \
    setx External_Reset_Handler, %g6, %g7; \
    jmp %g7; \
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
# 35 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 135 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! Hstick-match trap handler
# 138 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 183 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! SW interuupt handlers
# 186 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
	rd	%softint, %g3; \
	sethi	%hi(0x8000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	rd	%pcr, %g0; \
	retry; \
	nop                                 

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
	rd	%softint, %g3; \
	sethi	%hi(0x8000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	rd	%pcr, %g0; \
	retry; \
	nop                                 

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
	rd	%softint, %g3; \
	sethi	%hi(0x8000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	rd	%pcr, %g0; \
	retry; \
	nop                                
# 676 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 244 "diag.j"
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
    set retry_with_base_tba, %g2;\
    jmp %g2;\
    nop

#define SUN_H_HT0_IAE_nfo_page_0x0c \
    set retry_with_base_tba, %g2;\
    jmp %g2;\
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
	mov 0x35, %r14
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
	mov 0x35, %r14
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
	mov 0x34, %r14
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
	mov 0xb3, %r30
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

    ! Set up fpr MPU traps 
    set 0x1ff8bfff, %g2
    wr %g2, %g0, %pcr
setup_cmp:
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x58]%asi, %r14
	stxa %r14, [0x50]%asi
    wr %r0, %r12, %asi
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
mondo_7_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d90c007  ! 1: WRPR_WSTATE_R	wrpr	%r3, %r7, %wstate
	.word 0x8d9033e4  ! 2: WRPR_PSTATE_I	wrpr	%r0, 0x13e4, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 3: LDX_R	ldx	[%r31 + %r0], %r13
	setx 0x3e1973005f16ad4e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_1:
	.word 0x39400001  ! 4: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9968e343  ! 5: SDIVX_I	sdivx	%r3, 0x0343, %r12
	.word 0xab82c002  ! 6: WR_CLEAR_SOFTINT_R	wr	%r11, %r2, %clear_softint
splash_cmpr_7_3:
	setx 0x5785d037a41b640e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802089  ! 8: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d902e0d  ! 9: WRPR_PSTATE_I	wrpr	%r0, 0x0e0d, %pstate
	.word 0xd637e0e3  ! 10: STH_I	sth	%r11, [%r31 + 0x00e3]
	.word 0xd6800b00  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r11
splash_cmpr_7_4:
	setx 0x57ed409fcd68a373, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 12: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_7_5:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 13: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_7_6:
	setx 0x46c609c0b2484acb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 14: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 15: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_7_7:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f18, %f6, %f0
	.word 0xa3b10306  ! 16: ALIGNADDRESS	alignaddr	%r4, %r6, %r17
	.word 0x819823b4  ! 17: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03b4, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01969  ! 18: FqTOd	dis not found

	.word 0xd797e0e3  ! 19: LDQFA_I	-	[%r31, 0x00e3], %f11
	.word 0x98d48003  ! 20: UMULcc_R	umulcc 	%r18, %r3, %r12
tagged_7_9:
	taddcctv %r12, 0x1fe5, %r19
	.word 0xe807e0e3  ! 21: LDUW_I	lduw	[%r31 + 0x00e3], %r20
	.word 0x91d02033  ! 22: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe89fc020  ! 23: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	setx ivw_7_10, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_10:
	.word 0x95a00174  ! 24: FABSq	dis not found

	.word 0xe49fc020  ! 25: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
	.word 0x8198209e  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009e, %hpstate
	.word 0xa550c000  ! 27: RDPR_TT	rdpr	%tt, %r18
	setx ivw_7_11, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_11:
	.word 0x91a00162  ! 28: FABSq	dis not found

	.word 0x87902244  ! 29: WRPR_TT_I	wrpr	%r0, 0x0244, %tt
mondo_7_12:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d904005  ! 30: WRPR_WSTATE_R	wrpr	%r1, %r5, %wstate
	.word 0x95a489d0  ! 31: FDIVd	fdivd	%f18, %f16, %f10
	.word 0x9f802cc0  ! 32: SIR	sir	0x0cc0
	.word 0xe41fc000  ! 33: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x36700001  ! 34: BPGE	<illegal instruction>
donret_7_13:
	nop
	setx donretarg_7_13, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r16, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_13:
	.word 0xe4fffe6a  ! 35: SWAPA_I	swapa	%r18, [%r31 + 0xfffffe6a] %asi
DS_7_14:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xf14bee86	! Random illegal ?
	.word 0xe1118004  ! 1: LDQF_R	-	[%r6, %r4], %f16
	.word 0xa9a4c820  ! 36: FADDs	fadds	%f19, %f0, %f20
	.word 0x92c23ed9  ! 37: ADDCcc_I	addccc 	%r8, 0xfffffed9, %r9
	.word 0xe517c000  ! 38: LDQF_R	-	[%r31, %r0], %f18
splash_cmpr_7_15:
	setx 0xfd922dba319098af, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 39: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_7_16, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_16:
	.word 0x93a0016b  ! 40: FABSq	dis not found

	.word 0xd49fc020  ! 41: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
splash_cmpr_7_17:
	setx 0x96ec9c8810e8d315, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 42: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802a63  ! 43: SIR	sir	0x0a63
	.word 0x90db0007  ! 44: SMULcc_R	smulcc 	%r12, %r7, %r8
splash_lsu_7_18:
	setx 0x2545922c3d55a5fb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 45: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 46: RD_STICK_REG	stbar
	.word 0x93902001  ! 47: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x3a700001  ! 48: BPCC	<illegal instruction>
	.word 0xd4800c60  ! 49: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01974  ! 50: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01972  ! 51: FqTOd	dis not found

	setx 0x9d9580bd79f9af17, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_21:
	.word 0x39400001  ! 52: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe207c000  ! 53: LDUW_R	lduw	[%r31 + %r0], %r17
	.word 0xe337fa5d  ! 54: STQF_I	-	%f17, [0x1a5d, %r31]
splash_cmpr_7_22:
	setx 0x1663bb8683329c6b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_23:
	setx 0x784b81bfb027ec31, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 56: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe21ffa5d  ! 57: LDD_I	ldd	[%r31 + 0xfffffa5d], %r17
splash_cmpr_7_24:
	setx 0xda9831a2bf367e73, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_7_25:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 59: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe2c00e60  ! 60: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r17
	.word 0x93902004  ! 61: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_cmpr_7_26:
	setx 0x729787a5740345c6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_27:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd9114007  ! 1: LDQF_R	-	[%r5, %r7], %f12
	.word 0xa9a14832  ! 63: FADDs	fadds	%f5, %f18, %f20
	.word 0xa1500000  ! 64: RDPR_TPC	<illegal instruction>
	.word 0xe69004a0  ! 65: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
donret_7_28:
	nop
	setx donretarg_7_28, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r8, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_28:
	.word 0xe6fffa5d  ! 66: SWAPA_I	swapa	%r19, [%r31 + 0xfffffa5d] %asi
debug_7_29:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 67: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_7_30:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 68: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
change_to_randtl_7_31:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_31:
	.word 0x8f902003  ! 69: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
!$EV trig_pc_d(1, @VA(.MAIN.xir_7_32)) -> intp(7,1,3)
xir_7_32:
	.word 0xa9817734  ! 70: WR_SET_SOFTINT_I	wr	%r5, 0x1734, %set_softint
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 71: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902002  ! 72: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
mondo_7_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d92c000  ! 73: WRPR_WSTATE_R	wrpr	%r11, %r0, %wstate
	.word 0x91450000  ! 74: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0x968036eb  ! 75: ADDcc_I	addcc 	%r0, 0xfffff6eb, %r11
mondo_7_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d92c013  ! 76: WRPR_WSTATE_R	wrpr	%r11, %r19, %wstate
	.word 0x81982e8d  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8d, %hpstate
	.word 0xd527fcdf  ! 78: STF_I	st	%f10, [0x1cdf, %r31]
	.word 0xd597fcdf  ! 79: LDQFA_I	-	[%r31, 0x1cdf], %f10
tagged_7_35:
	taddcctv %r13, 0x12a8, %r9
	.word 0xd407fcdf  ! 80: LDUW_I	lduw	[%r31 + 0xfffffcdf], %r10
	.word 0x91500000  ! 81: RDPR_TPC	rdpr	%tpc, %r8
intveclr_7_36:
	setx 0xc4ddd5fcd73e0564, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 82: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd66ffcdf  ! 84: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffffcdf]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b682601  ! 85: SDIVX_I	sdivx	%r0, 0x0601, %r13
intveclr_7_38:
	setx 0x5899cd19aff29fe3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_7_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d950008  ! 87: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
	.word 0x2e700001  ! 88: BPVS	<illegal instruction>
debug_7_40:
	nop
	setx debug_7_40 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 89: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_7_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 90: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81982cb6  ! 91: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cb6, %hpstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 92: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx ivw_7_42, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_42:
	.word 0x91a00172  ! 93: FABSq	dis not found

	.word 0xd647ec7e  ! 94: LDSW_I	ldsw	[%r31 + 0x0c7e], %r11
	.word 0x2a800001  ! 95: BCS	bcs,a	<label_0x1>
	.word 0xd6d804a0  ! 96: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_7_43)) -> intp(7,1,3)
xir_7_43:
	.word 0xa981ad35  ! 97: WR_SET_SOFTINT_I	wr	%r6, 0x0d35, %set_softint
	.word 0x8d903108  ! 98: WRPR_PSTATE_I	wrpr	%r0, 0x1108, %pstate
mondo_7_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d918007  ! 99: WRPR_WSTATE_R	wrpr	%r6, %r7, %wstate
	.word 0x91d020b4  ! 100: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x879022a4  ! 101: WRPR_TT_I	wrpr	%r0, 0x02a4, %tt
debug_7_45:
	nop
	setx debug_7_45 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 102: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd71fc000  ! 103: LDDF_R	ldd	[%r31, %r0], %f11
DS_7_46:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 104: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd69004a0  ! 105: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0xd69ffa49  ! 106: LDDA_I	ldda	[%r31, + 0xfffffa49] %asi, %r11
	.word 0x87902027  ! 107: WRPR_TT_I	wrpr	%r0, 0x0027, %tt
	.word 0x91450000  ! 108: RD_SET_SOFTINT	rd	%set_softint, %r8
debug_7_47:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 109: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81982355  ! 110: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0355, %hpstate
	.word 0x9ba4c9c2  ! 111: FDIVd	fdivd	%f50, %f2, %f44
debug_7_48:
	nop
	setx debug_7_48 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 112: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802089  ! 113: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81982ae6  ! 114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ae6, %hpstate
	.word 0x81982f27  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f27, %hpstate
intveclr_7_49:
	setx 0x50edce4ac4a5dd2c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 116: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 117: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xa66ca061  ! 118: UDIVX_I	udivx 	%r18, 0x0061, %r19
	.word 0xd08008a0  ! 119: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
tagged_7_50:
	tsubcctv %r26, 0x18c5, %r5
	.word 0xd007f324  ! 120: LDUW_I	lduw	[%r31 + 0xfffff324], %r8
	.word 0xa1902005  ! 121: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_tba_7_51:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 122: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_7_52:
	nop
	setx debug_7_52 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 123: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200e  ! 124: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01971  ! 125: FqTOd	dis not found

debug_7_54:
	nop
	setx debug_7_54 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 126: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902001  ! 127: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_randtl_7_55:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_55:
	.word 0x8f902003  ! 128: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
intveclr_7_56:
	setx 0x2fee6f8433e05a8d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_57:
	setx 0x407acbdef169a3ab, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 130: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_58:
	setx 0x638e2cd3f513f87b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 131: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 132: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x8198297c  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x097c, %hpstate
intveclr_7_59:
	setx 0x75c83c3179aebfc2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 134: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd66ff324  ! 135: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff324]
	.word 0xd627f324  ! 136: STW_I	stw	%r11, [%r31 + 0xfffff324]
	.word 0xd69fc020  ! 137: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
debug_7_60:
	nop
	setx debug_7_60 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 138: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_7_61:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d934007  ! 139: WRPR_WSTATE_R	wrpr	%r13, %r7, %wstate
	.word 0xd677f324  ! 140: STX_I	stx	%r11, [%r31 + 0xfffff324]
	.word 0x8d903681  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x1681, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_62)) -> intp(7,0,15)
intvec_7_62:
	.word 0x39400001  ! 142: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8198232c  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x032c, %hpstate
	setx 0x45242a188b3762f0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_63:
	.word 0x39400001  ! 144: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_7_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d940006  ! 145: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
splash_lsu_7_65:
	setx 0xefa5e9fd05a0e3cf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 146: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 147: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
mondo_7_66:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d934012  ! 148: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
DS_7_67:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 149: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
DS_7_68:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f22, %f0, %f16
	.word 0x95b3030c  ! 150: ALIGNADDRESS	alignaddr	%r12, %r12, %r10
intveclr_7_69:
	setx 0x957f992eb6c89a18, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 151: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd657f324  ! 152: LDSH_I	ldsh	[%r31 + 0xfffff324], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 153: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd727c006  ! 154: STF_R	st	%f11, [%r6, %r31]
	.word 0x93d020b3  ! 155: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0xa981c005  ! 156: WR_SET_SOFTINT_R	wr	%r7, %r5, %set_softint
debug_7_70:
	nop
	setx debug_7_70 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 157: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 158: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x93902006  ! 159: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91a1c9c8  ! 160: FDIVd	fdivd	%f38, %f8, %f8
DS_7_71:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f26, %f16, %f22
	.word 0x95b1830c  ! 161: ALIGNADDRESS	alignaddr	%r6, %r12, %r10
donret_7_72:
	nop
	setx donretarg_7_72, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r1, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_72:
	.word 0xdafff324  ! 162: SWAPA_I	swapa	%r13, [%r31 + 0xfffff324] %asi
debug_7_73:
	nop
	setx debug_7_73 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_7_74:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 164: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902007  ! 165: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x93500000  ! 166: RDPR_TPC	rdpr	%tpc, %r9
	.word 0x8d902046  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x0046, %pstate
splash_cmpr_7_75:
	setx 0xa0550883193aabe5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 168: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902005  ! 169: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_7_76:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd532c00d  ! 1: STQF_R	-	%f10, [%r13, %r11]
	normalw
	.word 0x99458000  ! 170: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8790201a  ! 171: WRPR_TT_I	wrpr	%r0, 0x001a, %tt
splash_cmpr_7_77:
	setx 0x79ecf8336991206a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02032  ! 173: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902003  ! 174: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	setx ivw_7_78, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_78:
	.word 0x95a00165  ! 175: FABSq	dis not found

splash_cmpr_7_79:
	setx 0x6b6851cbf4bd88bf, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 176: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_80:
	setx 0xdf08a5adb20b1953, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe7e7c030  ! 178: CASA_I	casa	[%r31] 0x 1, %r16, %r19
intveclr_7_81:
	setx 0x9199a515d7e4f3e0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 179: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa190200a  ! 180: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xe727c010  ! 181: STF_R	st	%f19, [%r16, %r31]
	.word 0xe68008a0  ! 182: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x81b01021  ! 183: SIAM	siam	1
	.word 0xa1902007  ! 184: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xe61fc000  ! 185: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x2c800001  ! 186: BNEG	bneg,a	<label_0x1>
	.word 0x20800001  ! 187: BN	bn,a	<label_0x1>
	.word 0xe69ff324  ! 188: LDDA_I	ldda	[%r31, + 0xfffff324] %asi, %r19
splash_cmpr_7_82:
	setx 0x43c8c7cbd35b3fa1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 189: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe67ff324  ! 190: SWAP_I	swap	%r19, [%r31 + 0xfffff324]
	setx 0xd4aba557f53e5154, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_83:
	.word 0x39400001  ! 191: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
mondo_7_84:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d944001  ! 193: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
DS_7_85:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 194: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe6bff324  ! 195: STDA_I	stda	%r19, [%r31 + 0xfffff324] %asi
mondo_7_86:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d908007  ! 196: WRPR_WSTATE_R	wrpr	%r2, %r7, %wstate
change_to_randtl_7_87:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_87:
	.word 0x8f902002  ! 197: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01968  ! 198: FqTOd	dis not found

donret_7_89:
	nop
	setx donretarg_7_89, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r9, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_89:
	.word 0xe6fff324  ! 199: SWAPA_I	swapa	%r19, [%r31 + 0xfffff324] %asi
change_to_randtl_7_90:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_90:
	.word 0x8f902000  ! 200: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 201: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93d020b5  ! 202: Tcc_I	tne	icc_or_xcc, %r0 + 181
mondo_7_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d930008  ! 203: WRPR_WSTATE_R	wrpr	%r12, %r8, %wstate
	.word 0x38700001  ! 204: BPGU	<illegal instruction>
	.word 0x819827d4  ! 205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d4, %hpstate
	.word 0xe797f324  ! 206: LDQFA_I	-	[%r31, 0x1324], %f19
	.word 0x38800001  ! 207: BGU	bgu,a	<label_0x1>
splash_tba_7_92:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 208: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8198269f  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069f, %hpstate
	.word 0x9f803521  ! 210: SIR	sir	0x1521
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01973  ! 211: FqTOd	dis not found

	.word 0xe717c000  ! 212: LDQF_R	-	[%r31, %r0], %f19
	.word 0x81460000  ! 213: RD_STICK_REG	stbar
	.word 0xe6dfe020  ! 214: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r19
	.word 0xa190200c  ! 215: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_cmpr_7_94:
	setx 0x934262e09f4a1921, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902632  ! 217: WRPR_PSTATE_I	wrpr	%r0, 0x0632, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a0196c  ! 218: FqTOd	dis not found

debug_7_96:
	nop
	setx debug_7_96 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 219: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_7_97:
	setx 0x479aa9a5f12ac61f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 220: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd06ffc1f  ! 221: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffc1f]
	.word 0xd0d7e030  ! 222: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
tagged_7_98:
	tsubcctv %r9, 0x1e57, %r20
	.word 0xd007fc1f  ! 223: LDUW_I	lduw	[%r31 + 0xfffffc1f], %r8
	.word 0xa1a409ca  ! 224: FDIVd	fdivd	%f16, %f10, %f16
mondo_7_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d948007  ! 225: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
splash_cmpr_7_100:
	setx 0x4c3a89bc4c6345f7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 226: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f8034bb  ! 227: SIR	sir	0x14bb
	.word 0xa1902008  ! 228: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8790224f  ! 229: WRPR_TT_I	wrpr	%r0, 0x024f, %tt
donret_7_101:
	nop
	setx donretarg_7_101, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r17, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_101:
	.word 0xd2ffeed1  ! 230: SWAPA_I	swapa	%r9, [%r31 + 0x0ed1] %asi
change_to_randtl_7_102:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_102:
	.word 0x8f902001  ! 231: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, @VA(.MAIN.xir_7_103)) -> intp(7,1,3)
xir_7_103:
	.word 0xa981be14  ! 232: WR_SET_SOFTINT_I	wr	%r6, 0x1e14, %set_softint
	.word 0xd20fc000  ! 233: LDUB_R	ldub	[%r31 + %r0], %r9
debug_7_104:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 234: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd207c000  ! 235: LDUW_R	lduw	[%r31 + %r0], %r9
change_to_randtl_7_105:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_105:
	.word 0x8f902002  ! 236: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_7_106:
	setx 0x059b272376aa6947, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 237: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_7_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d948005  ! 238: WRPR_WSTATE_R	wrpr	%r18, %r5, %wstate
splash_tba_7_108:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 239: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd29ffeae  ! 240: LDDA_I	ldda	[%r31, + 0xfffffeae] %asi, %r9
	.word 0xd28804a0  ! 241: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
DS_7_109:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd7148013  ! 1: LDQF_R	-	[%r18, %r19], %f11
	.word 0x97a48823  ! 242: FADDs	fadds	%f18, %f3, %f11
debug_7_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 243: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x3c800001  ! 244: BPOS	bpos,a	<label_0x1>
	setx ivw_7_111, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_111:
	.word 0x99a00166  ! 245: FABSq	dis not found

tagged_7_112:
	tsubcctv %r22, 0x11e1, %r24
	.word 0xd407feae  ! 246: LDUW_I	lduw	[%r31 + 0xfffffeae], %r10
	.word 0xd407c000  ! 247: LDUW_R	lduw	[%r31 + %r0], %r10
debug_7_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 248: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 249: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 250: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_7_114:
	setx 0x40fb373f93ed38cb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 251: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 252: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_7_115:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 253: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xd47ffeae  ! 254: SWAP_I	swap	%r10, [%r31 + 0xfffffeae]
	.word 0xd537feae  ! 255: STQF_I	-	%f10, [0x1eae, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_116)) -> intp(5,0,1)
intvec_7_116:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x24800001  ! 257: BLE	ble,a	<label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa5a2c9cc  ! 259: FDIVd	fdivd	%f42, %f12, %f18
splash_tba_7_117:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 260: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x83d02032  ! 261: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8198236f  ! 262: WRHPR_HPSTATE_I	wrhpr	%r0, 0x036f, %hpstate
change_to_randtl_7_118:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_118:
	.word 0x8f902001  ! 263: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 264: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xad843357  ! 265: WR_SOFTINT_REG_I	wr	%r16, 0x1357, %softint
	.word 0x90a80000  ! 266: ANDNcc_R	andncc 	%r0, %r0, %r8
!$EV trig_pc_d(1, @VA(.MAIN.xir_7_119)) -> intp(7,1,3)
xir_7_119:
	.word 0xa9817b04  ! 267: WR_SET_SOFTINT_I	wr	%r5, 0x1b04, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_120)) -> intp(7,0,15)
intvec_7_120:
	.word 0x39400001  ! 268: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 269: WRASI_I	wr	%r0, 0x0010, %asi
splash_cmpr_7_121:
	setx 0x75e821a4824ec436, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 270: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa8fc8014  ! 271: SDIVcc_R	sdivcc 	%r18, %r20, %r20
	.word 0xe807c000  ! 272: LDUW_R	lduw	[%r31 + %r0], %r20
	setx ivw_7_122, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_122:
	.word 0x91a00169  ! 273: FABSq	dis not found

mondo_7_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d900008  ! 274: WRPR_WSTATE_R	wrpr	%r0, %r8, %wstate
splash_cmpr_7_124:
	setx 0x77ae8312578ef7d5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 275: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 276: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xa6484008  ! 277: MULX_R	mulx 	%r1, %r8, %r19
splash_cmpr_7_125:
	setx 0x0b1be345fce71c9b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91480000  ! 279: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
debug_7_126:
	nop
	setx debug_7_126 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 280: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x28700001  ! 281: BPLEU	<illegal instruction>
	.word 0x93902003  ! 282: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87802080  ! 283: WRASI_I	wr	%r0, 0x0080, %asi
change_to_randtl_7_127:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_127:
	.word 0x8f902001  ! 284: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01967  ! 285: FqTOd	dis not found

	.word 0x87802016  ! 286: WRASI_I	wr	%r0, 0x0016, %asi
splash_cmpr_7_129:
	setx 0xee18001a4bf3d48b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 287: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790208f  ! 288: WRPR_TT_I	wrpr	%r0, 0x008f, %tt
	.word 0xa1a01a60  ! 289: FqTOi	fqtoi	
	.word 0xe81fffcf  ! 290: LDD_I	ldd	[%r31 + 0xffffffcf], %r20
	.word 0xe88008a0  ! 291: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
splash_cmpr_7_130:
	setx 0x848470911328ea71, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 292: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe93fc008  ! 293: STDF_R	std	%f20, [%r8, %r31]
	.word 0x8790225a  ! 294: WRPR_TT_I	wrpr	%r0, 0x025a, %tt
	.word 0xe857c000  ! 295: LDSH_R	ldsh	[%r31 + %r0], %r20
	.word 0x3e800001  ! 296: BVC	bvc,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 297: LDX_R	ldx	[%r31 + %r0], %r20
DS_7_131:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 298: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	setx ivw_7_132, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_132:
	.word 0xa3a0016c  ! 299: FABSq	dis not found

	.word 0x9f802be5  ! 300: SIR	sir	0x0be5
	.word 0x96d9000b  ! 301: SMULcc_R	smulcc 	%r4, %r11, %r11
	.word 0x87802010  ! 302: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x9f803108  ! 303: SIR	sir	0x1108
	.word 0xd28008a0  ! 304: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd2800b20  ! 305: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r9
splash_lsu_7_133:
	setx 0xfc05016683b228b9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 306: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_7_134:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 307: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x91d02035  ! 308: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_tba_7_135:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 309: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd27ff5df  ! 310: SWAP_I	swap	%r9, [%r31 + 0xfffff5df]
debug_7_136:
	nop
	setx debug_7_136 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 311: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_7_137:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 312: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd2d804a0  ! 313: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0xd2c00e40  ! 314: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9368fb91  ! 315: SDIVX_I	sdivx	%r3, 0xfffffb91, %r9
	.word 0x819829f5  ! 316: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09f5, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r18
DS_7_139:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe532800d  ! 1: STQF_R	-	%f18, [%r13, %r10]
	normalw
	.word 0x93458000  ! 318: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xe607c000  ! 319: LDUW_R	lduw	[%r31 + %r0], %r19
mondo_7_140:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d910010  ! 320: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1693cbe  ! 321: SDIVX_I	sdivx	%r4, 0xfffffcbe, %r16
	.word 0xd537c008  ! 322: STQF_R	-	%f10, [%r8, %r31]
	.word 0xab818001  ! 323: WR_CLEAR_SOFTINT_R	wr	%r6, %r1, %clear_softint
	.word 0xd4800a80  ! 324: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r10
	.word 0xa9834011  ! 325: WR_SET_SOFTINT_R	wr	%r13, %r17, %set_softint
mondo_7_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d91800b  ! 326: WRPR_WSTATE_R	wrpr	%r6, %r11, %wstate
	.word 0x81460000  ! 327: RD_STICK_REG	stbar
change_to_randtl_7_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_143:
	.word 0x8f902001  ! 328: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_7_144:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_144:
	.word 0x8f902001  ! 329: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902002  ! 330: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd4dfe010  ! 331: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r10
pmu_7_145:
	nop
	setx 0xfffff790fffff09a, %g1, %g7
	.word 0xa3800007  ! 332: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d802004  ! 333: WRFPRS_I	wr	%r0, 0x0004, %fprs
mondo_7_146:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d92c00b  ! 334: WRPR_WSTATE_R	wrpr	%r11, %r11, %wstate
intveclr_7_147:
	setx 0x547c5a53ef0e7215, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 335: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 336: WRASI_I	wr	%r0, 0x004f, %asi
splash_cmpr_7_148:
	setx 0x06c4bc1ed9e0c40b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02035  ! 338: Tcc_I	tne	icc_or_xcc, %r0 + 53
change_to_randtl_7_149:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_149:
	.word 0x8f902003  ! 339: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x2c800001  ! 340: BNEG	bneg,a	<label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976ae493  ! 341: SDIVX_I	sdivx	%r11, 0x0493, %r11
debug_7_151:
	nop
	setx debug_7_151 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 342: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_7_152:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 343: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd647e7a8  ! 344: LDSW_I	ldsw	[%r31 + 0x07a8], %r11
	.word 0xa545c000  ! 345: RD_TICK_CMPR_REG	rd	%-, %r18
splash_tba_7_153:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 346: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f80324b  ! 347: SIR	sir	0x124b
	.word 0x91d02032  ! 348: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d903ee1  ! 349: WRPR_PSTATE_I	wrpr	%r0, 0x1ee1, %pstate
	.word 0x87802010  ! 350: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x81982fdd  ! 351: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdd, %hpstate
	.word 0x3a800001  ! 352: BCC	bcc,a	<label_0x1>
	.word 0xe88804a0  ! 353: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
splash_cmpr_7_154:
	setx 0xac41734f449ed49e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 354: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_7_155:
	setx 0xec59fdefcdb35ed7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 355: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_7_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d91c003  ! 356: WRPR_WSTATE_R	wrpr	%r7, %r3, %wstate
	.word 0x36700001  ! 357: BPGE	<illegal instruction>
mondo_7_157:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d904002  ! 358: WRPR_WSTATE_R	wrpr	%r1, %r2, %wstate
DS_7_158:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f20, %f26, %f4
	.word 0xa3b3030d  ! 359: ALIGNADDRESS	alignaddr	%r12, %r13, %r17
	setx ivw_7_159, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_159:
	.word 0x91a0016a  ! 360: FABSq	dis not found

	.word 0xd26ff7b0  ! 361: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffff7b0]
splash_tba_7_160:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 362: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa5a349c7  ! 363: FDIVd	fdivd	%f44, %f38, %f18
	.word 0xd28008a0  ! 364: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
debug_7_161:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 365: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_7_162:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_162:
	.word 0x8f902002  ! 366: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x986c400d  ! 367: UDIVX_R	udivx 	%r17, %r13, %r12
	.word 0x81982c17  ! 368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c17, %hpstate
DS_7_163:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb30a409  ! 1: STQF_I	-	%f13, [0x0409, %r2]
	normalw
	.word 0x91458000  ! 369: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36cbdb2  ! 370: SDIVX_I	sdivx	%r18, 0xfffffdb2, %r17
	.word 0xd2d004a0  ! 371: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
debug_7_165:
	nop
	setx debug_7_165 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 372: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_7_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d944004  ! 373: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
	.word 0x87902118  ! 374: WRPR_TT_I	wrpr	%r0, 0x0118, %tt
	.word 0x99902003  ! 375: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x28700001  ! 376: BPLEU	<illegal instruction>
	.word 0xa1902009  ! 377: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x87802016  ! 378: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xa2816ad5  ! 379: ADDcc_I	addcc 	%r5, 0x0ad5, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 380: LDX_R	ldx	[%r31 + %r0], %r19
tagged_7_167:
	taddcctv %r12, 0x1152, %r5
	.word 0xe607f8ba  ! 381: LDUW_I	lduw	[%r31 + 0xfffff8ba], %r19
	.word 0xe61fc000  ! 382: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x93902001  ! 383: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982106  ! 384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0106, %hpstate
	.word 0x26700001  ! 385: BPL	<illegal instruction>
mondo_7_168:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d94c000  ! 386: WRPR_WSTATE_R	wrpr	%r19, %r0, %wstate
	.word 0x93902005  ! 387: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_cmpr_7_169:
	setx 0xf8d6a33566c28960, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 388: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_7_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d910013  ! 389: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
mondo_7_171:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d934008  ! 390: WRPR_WSTATE_R	wrpr	%r13, %r8, %wstate
	.word 0xa1902008  ! 391: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	setx ivw_7_172, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_172:
	.word 0xa9a00165  ! 392: FABSq	dis not found

	setx 0xcd43642abf61a87e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_173:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_174:
	setx 0x4af6581183f270d0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 394: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_175:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe7124003  ! 1: LDQF_R	-	[%r9, %r3], %f19
	.word 0xa1a18823  ! 395: FADDs	fadds	%f6, %f3, %f16
mondo_7_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d914005  ! 396: WRPR_WSTATE_R	wrpr	%r5, %r5, %wstate
	.word 0x8198223c  ! 397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x023c, %hpstate
	.word 0x8d802000  ! 398: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_7_177:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d934003  ! 399: WRPR_WSTATE_R	wrpr	%r13, %r3, %wstate
splash_cmpr_7_178:
	setx 0x2a0d274f3a000686, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 400: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_7_179, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_179:
	.word 0xa5a00168  ! 401: FABSq	dis not found

splash_cmpr_7_180:
	setx 0x2b11408fd9a83e3b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 402: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_181:
	nop
	setx debug_7_181 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 403: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1520000  ! 404: RDPR_PIL	<illegal instruction>
DS_7_182:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f24, %f26, %f28
	.word 0xa1b4c313  ! 405: ALIGNADDRESS	alignaddr	%r19, %r19, %r16
mondo_7_183:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d944008  ! 406: WRPR_WSTATE_R	wrpr	%r17, %r8, %wstate
mondo_7_184:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d92c010  ! 407: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
	.word 0x81982d36  ! 408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d36, %hpstate
	.word 0x83d02033  ! 409: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x93902006  ! 410: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87802089  ! 411: WRASI_I	wr	%r0, 0x0089, %asi
mondo_7_185:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d914010  ! 412: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
splash_tba_7_186:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 413: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_7_187:
	setx 0x2c562faa4b85ae60, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 414: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_7_188:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 415: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9a84c012  ! 416: ADDcc_R	addcc 	%r19, %r18, %r13
	.word 0x99902002  ! 417: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xe46ff8ba  ! 418: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffff8ba]
DS_7_189:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x95b40308  ! 419: ALIGNADDRESS	alignaddr	%r16, %r8, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36c2db8  ! 420: SDIVX_I	sdivx	%r16, 0x0db8, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01973  ! 421: FqTOd	dis not found

	.word 0x8d903fcf  ! 422: WRPR_PSTATE_I	wrpr	%r0, 0x1fcf, %pstate
	.word 0x97a009c4  ! 423: FDIVd	fdivd	%f0, %f4, %f42
tagged_7_192:
	tsubcctv %r24, 0x1aed, %r21
	.word 0xd007ec55  ! 424: LDUW_I	lduw	[%r31 + 0x0c55], %r8
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 425: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 426: LDX_R	ldx	[%r31 + %r0], %r8
debug_7_193:
	nop
	setx debug_7_193 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 427: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93d02035  ! 428: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xd04fec55  ! 429: LDSB_I	ldsb	[%r31 + 0x0c55], %r8
	.word 0xd08fe020  ! 430: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x97520000  ! 432: RDPR_PIL	rdpr	%pil, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95696635  ! 433: SDIVX_I	sdivx	%r5, 0x0635, %r10
mondo_7_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d92c001  ! 434: WRPR_WSTATE_R	wrpr	%r11, %r1, %wstate
debug_7_196:
	nop
	setx debug_7_196 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 435: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_7_197:
	taddcctv %r15, 0x1e83, %r18
	.word 0xe007ef0e  ! 436: LDUW_I	lduw	[%r31 + 0x0f0e], %r16
	.word 0x91d02034  ! 437: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe0800aa0  ! 438: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r16
	.word 0x93d020b4  ! 439: Tcc_I	tne	icc_or_xcc, %r0 + 180
splash_cmpr_7_198:
	setx 0x6f577b4c81b044b2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 440: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_7_199:
	setx 0xe93bc986d86f2f23, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 441: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe0800b40  ! 442: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r16
	.word 0x9f802889  ! 443: SIR	sir	0x0889
intveclr_7_200:
	setx 0x301a21ea4738cdbb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 444: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b3  ! 445: Tcc_I	te	icc_or_xcc, %r0 + 179
mondo_7_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d920014  ! 446: WRPR_WSTATE_R	wrpr	%r8, %r20, %wstate
	.word 0x99902000  ! 447: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
mondo_7_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d924003  ! 448: WRPR_WSTATE_R	wrpr	%r9, %r3, %wstate
	.word 0xe137c00c  ! 449: STQF_R	-	%f16, [%r12, %r31]
	setx 0xbce075ccc73734c6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_203:
	.word 0x39400001  ! 450: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879020bc  ! 451: WRPR_TT_I	wrpr	%r0, 0x00bc, %tt
change_to_randtl_7_204:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_204:
	.word 0x8f902002  ! 452: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x9f802260  ! 453: SIR	sir	0x0260
	.word 0x99500000  ! 454: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x8198270e  ! 455: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070e, %hpstate
debug_7_205:
	nop
	setx debug_7_205 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 456: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_7_206:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 457: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa968fd7d  ! 458: SDIVX_I	sdivx	%r3, 0xfffffd7d, %r20
tagged_7_208:
	tsubcctv %r2, 0x1d74, %r20
	.word 0xd007e283  ! 459: LDUW_I	lduw	[%r31 + 0x0283], %r8
	.word 0xd08008a0  ! 460: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
debug_7_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 461: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802089  ! 462: WRASI_I	wr	%r0, 0x0089, %asi
change_to_randtl_7_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_210:
	.word 0x8f902001  ! 463: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd09fe283  ! 464: LDDA_I	ldda	[%r31, + 0x0283] %asi, %r8
	.word 0x98808008  ! 465: ADDcc_R	addcc 	%r2, %r8, %r12
	.word 0x9f802977  ! 466: SIR	sir	0x0977
	.word 0x879020eb  ! 467: WRPR_TT_I	wrpr	%r0, 0x00eb, %tt
debug_7_211:
	nop
	setx debug_7_211 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 468: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe4c004a0  ! 469: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r18
	.word 0xe4c7e010  ! 470: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r18
	.word 0xe48008a0  ! 471: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 472: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_7_212:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 473: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8790211e  ! 474: WRPR_TT_I	wrpr	%r0, 0x011e, %tt
splash_tba_7_213:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 475: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_7_214:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 476: SAVE_R	save	%r31, %r0, %r31
	.word 0xe48804a0  ! 477: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
debug_7_215:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 478: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe4c804a0  ! 479: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r18
	.word 0x99a089c2  ! 480: FDIVd	fdivd	%f2, %f2, %f12
	.word 0x93902000  ! 481: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
intveclr_7_216:
	setx 0xedd8b60a4250c187, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_7_217:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe132c009  ! 1: STQF_R	-	%f16, [%r9, %r11]
	normalw
	.word 0x9b458000  ! 483: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x87802010  ! 484: WRASI_I	wr	%r0, 0x0010, %asi
debug_7_218:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 485: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x26700001  ! 486: BPL	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01966  ! 487: FqTOd	dis not found

splash_cmpr_7_220:
	setx 0x6a3346d22d7ddce2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 488: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 489: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 490: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xe897e000  ! 491: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r20
	.word 0xe88804a0  ! 492: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
intveclr_7_221:
	setx 0x8ab65194192afe3c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 493: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe847e9df  ! 494: LDSW_I	ldsw	[%r31 + 0x09df], %r20
	.word 0xe827e9df  ! 495: STW_I	stw	%r20, [%r31 + 0x09df]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99683d35  ! 496: SDIVX_I	sdivx	%r0, 0xfffffd35, %r12
	.word 0x9f8034c7  ! 497: SIR	sir	0x14c7
	.word 0x99454000  ! 498: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0xd0dfe020  ! 499: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r8
	.word 0x87802010  ! 500: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd127c003  ! 501: STF_R	st	%f8, [%r3, %r31]
	.word 0x819827e7  ! 502: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07e7, %hpstate
splash_tba_7_223:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 503: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x99902001  ! 504: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xd0d7e020  ! 505: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 506: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_7_224:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xf77fe2f3	! Random illegal ?
	.word 0xd7110000  ! 1: LDQF_R	-	[%r4, %r0], %f11
	.word 0xa5a40830  ! 507: FADDs	fadds	%f16, %f16, %f18
	.word 0x87902045  ! 508: WRPR_TT_I	wrpr	%r0, 0x0045, %tt
splash_lsu_7_225:
	setx 0xc5b1cc8f6fad8733, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 509: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd2800c20  ! 510: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r9
	.word 0xd25ff2d8  ! 511: LDX_I	ldx	[%r31 + 0xfffff2d8], %r9
	.word 0x8198210e  ! 512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010e, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_226)) -> intp(4,0,14)
intvec_7_226:
	.word 0x39400001  ! 513: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 514: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902937  ! 515: WRPR_PSTATE_I	wrpr	%r0, 0x0937, %pstate
	.word 0xa1902003  ! 516: WRPR_GL_I	wrpr	%r0, 0x0003, %-
intveclr_7_227:
	setx 0xf0834d5db499d130, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 517: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_7_228:
	nop
	setx donretarg_7_228, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r1, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_228:
	.word 0xd2fff2d8  ! 518: SWAPA_I	swapa	%r9, [%r31 + 0xfffff2d8] %asi
	.word 0x819824b6  ! 519: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04b6, %hpstate
	.word 0x81b01021  ! 520: SIAM	siam	1
	.word 0xd2c00e60  ! 521: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r9
	.word 0x38700001  ! 522: BPGU	<illegal instruction>
	.word 0x2e800001  ! 523: BVS	bvs,a	<label_0x1>
tagged_7_229:
	taddcctv %r12, 0x1cac, %r3
	.word 0xd207f2d8  ! 524: LDUW_I	lduw	[%r31 + 0xfffff2d8], %r9
intveclr_7_230:
	setx 0x2f2d78c904716ef4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_231:
	setx 0x6c7bda45747f8d35, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 526: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902004  ! 527: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x98c2bcd6  ! 528: ADDCcc_I	addccc 	%r10, 0xfffffcd6, %r12
	.word 0x8780201c  ! 529: WRASI_I	wr	%r0, 0x001c, %asi
splash_cmpr_7_232:
	setx 0x07e673b858cdc5d6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 530: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_7_233:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d918005  ! 531: WRPR_WSTATE_R	wrpr	%r6, %r5, %wstate
	.word 0x879021a5  ! 532: WRPR_TT_I	wrpr	%r0, 0x01a5, %tt
	.word 0x91d02032  ! 533: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe4800a60  ! 534: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r18
	.word 0x97a2c9c5  ! 535: FDIVd	fdivd	%f42, %f36, %f42
	.word 0xe8dfe000  ! 536: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
	.word 0xa7a1c9c0  ! 537: FDIVd	fdivd	%f38, %f0, %f50
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96c673c  ! 538: SDIVX_I	sdivx	%r17, 0x073c, %r20
	.word 0x91540000  ! 539: RDPR_GL	rdpr	%-, %r8
	.word 0xd6dfe000  ! 540: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
splash_tba_7_235:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 541: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x99480000  ! 542: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 543: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_7_236:
	tsubcctv %r23, 0x1546, %r21
	.word 0xe607e600  ! 544: LDUW_I	lduw	[%r31 + 0x0600], %r19
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 545: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_7_237:
	setx 0x09c2bca1e6e1edf2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 546: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_7_238:
	setx 0x8266bb873bf9950a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8790201d  ! 548: WRPR_TT_I	wrpr	%r0, 0x001d, %tt
	setx 0x1b376d9271c4c96f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_239:
	.word 0x39400001  ! 549: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_7_240:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d924000  ! 550: WRPR_WSTATE_R	wrpr	%r9, %r0, %wstate
intveclr_7_241:
	setx 0x256926465f3952c9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 551: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8790200a  ! 552: WRPR_TT_I	wrpr	%r0, 0x000a, %tt
	.word 0xe6c7e030  ! 553: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r19
	.word 0x93902005  ! 554: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe68008a0  ! 555: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x9b454000  ! 556: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
tagged_7_242:
	tsubcctv %r20, 0x1cec, %r26
	.word 0xe807e600  ! 557: LDUW_I	lduw	[%r31 + 0x0600], %r20
debug_7_243:
	nop
	setx debug_7_243 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 558: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x22800001  ! 559: BE	be,a	<label_0x1>
intveclr_7_244:
	setx 0x8726f4974d1408d0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 560: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_245:
	setx 0x0dc94696e00ec8ff, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 561: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903489  ! 562: WRPR_PSTATE_I	wrpr	%r0, 0x1489, %pstate
debug_7_246:
	nop
	setx debug_7_246 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 563: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x403b4f6bc23bac97, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_247:
	.word 0x39400001  ! 564: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_7_248:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 565: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_7_249:
	setx 0xca98e1f1a91ccb46, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 566: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902004  ! 567: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x87802004  ! 568: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9b53c000  ! 569: RDPR_FQ	<illegal instruction>
	.word 0x9ba00570  ! 570: FSQRTq	fsqrt	
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 571: LDX_R	ldx	[%r31 + %r0], %r9
debug_7_250:
	nop
	setx debug_7_250 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 572: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01970  ! 573: FqTOd	dis not found

	.word 0x93b4cfe6  ! 574: FONES	e	%f9
splash_cmpr_7_252:
	setx 0x26d7e190b9b90f73, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 575: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 576: LDX_R	ldx	[%r31 + %r0], %r11
	setx 0xfd4dce9615ad5c44, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_253:
	.word 0x39400001  ! 577: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6c7e020  ! 578: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
	.word 0x8d902ac7  ! 579: WRPR_PSTATE_I	wrpr	%r0, 0x0ac7, %pstate
	.word 0x91d020b3  ! 580: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x87802080  ! 581: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd737c004  ! 582: STQF_R	-	%f11, [%r4, %r31]
	.word 0x9a688005  ! 583: UDIVX_R	udivx 	%r2, %r5, %r13
splash_cmpr_7_254:
	setx 0xcbb5598ebb3fa55e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 584: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_255:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd9134004  ! 1: LDQF_R	-	[%r13, %r4], %f12
	.word 0x99a24828  ! 585: FADDs	fadds	%f9, %f8, %f12
mondo_7_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d92c002  ! 586: WRPR_WSTATE_R	wrpr	%r11, %r2, %wstate
	.word 0xe53fc00a  ! 587: STDF_R	std	%f18, [%r10, %r31]
tagged_7_257:
	taddcctv %r12, 0x1515, %r23
	.word 0xe407e600  ! 588: LDUW_I	lduw	[%r31 + 0x0600], %r18
pmu_7_258:
	nop
	setx 0xfffff215fffff868, %g1, %g7
	.word 0xa3800007  ! 589: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xad80b3f6  ! 590: WR_SOFTINT_REG_I	wr	%r2, 0x13f6, %softint
tagged_7_259:
	taddcctv %r6, 0x10e2, %r5
	.word 0xe407e4ec  ! 591: LDUW_I	lduw	[%r31 + 0x04ec], %r18
	.word 0x93520000  ! 592: RDPR_PIL	<illegal instruction>
change_to_randtl_7_260:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_260:
	.word 0x8f902000  ! 593: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd827e4ec  ! 594: STW_I	stw	%r12, [%r31 + 0x04ec]
	.word 0x81460000  ! 595: RD_STICK_REG	stbar
mondo_7_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d94800c  ! 596: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
	.word 0x8d902ede  ! 597: WRPR_PSTATE_I	wrpr	%r0, 0x0ede, %pstate
	.word 0x87902294  ! 598: WRPR_TT_I	wrpr	%r0, 0x0294, %tt
	.word 0x8d903113  ! 599: WRPR_PSTATE_I	wrpr	%r0, 0x1113, %pstate
	.word 0x81982d8d  ! 600: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8d, %hpstate
	.word 0x93902000  ! 601: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81460000  ! 602: RD_STICK_REG	stbar
	.word 0x26800001  ! 603: BL	bl,a	<label_0x1>
debug_7_262:
	nop
	setx debug_7_262 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 604: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902003  ! 605: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_tba_7_263:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 606: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_7_264:
	nop
	setx debug_7_264 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 607: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x819821ad  ! 608: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01ad, %hpstate
change_to_randtl_7_265:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_265:
	.word 0x8f902001  ! 609: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902003  ! 610: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd8c7e000  ! 611: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r12
intveclr_7_266:
	setx 0x552df4a79df0ebb2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 612: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 613: WRPR_GL_I	wrpr	%r0, 0x0008, %-
debug_7_267:
	nop
	setx debug_7_267 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 614: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd8cfe020  ! 615: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
debug_7_268:
	nop
	setx debug_7_268 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 616: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_7_269:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d940014  ! 617: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 618: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_7_270:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 619: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x28700001  ! 620: BPLEU	<illegal instruction>
	.word 0x93902002  ! 621: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
mondo_7_271:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d91c002  ! 622: WRPR_WSTATE_R	wrpr	%r7, %r2, %wstate
splash_lsu_7_272:
	setx 0x8171f19003b807fb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 623: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_7_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d910005  ! 624: WRPR_WSTATE_R	wrpr	%r4, %r5, %wstate
	.word 0xd88804a0  ! 625: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
splash_cmpr_7_274:
	setx 0xdff0da06d37e2ec2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 626: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 627: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_7_275:
	setx 0xc99bd39f63187413, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 628: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 629: BL	bl,a	<label_0x1>
mondo_7_276:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d91400c  ! 630: WRPR_WSTATE_R	wrpr	%r5, %r12, %wstate
	setx ivw_7_277, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_277:
	.word 0xa7a00172  ! 631: FABSq	dis not found

	.word 0xd4c004a0  ! 632: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
splash_cmpr_7_278:
	setx 0x5c70071403879be6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 633: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x99a01a61  ! 635: FqTOi	fqtoi	
	.word 0xd647e4ec  ! 636: LDSW_I	ldsw	[%r31 + 0x04ec], %r11
debug_7_279:
	nop
	setx debug_7_279 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 637: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996c33f2  ! 638: SDIVX_I	sdivx	%r16, 0xfffff3f2, %r12
splash_tba_7_281:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 639: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_7_282:
	setx 0xc7cb6b482334a257, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 640: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_7_283:
	nop
	setx debug_7_283 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 641: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_284)) -> intp(6,0,3)
intvec_7_284:
	.word 0x39400001  ! 642: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 643: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6aa719  ! 644: SDIVX_I	sdivx	%r10, 0x0719, %r13
	.word 0xd2d00e80  ! 645: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01965  ! 646: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b68bdbd  ! 647: SDIVX_I	sdivx	%r2, 0xfffffdbd, %r13
pmu_7_288:
	nop
	setx 0xfffff79efffff912, %g1, %g7
	.word 0xa3800007  ! 648: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 649: LDX_R	ldx	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 650: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe01ff035  ! 651: LDD_I	ldd	[%r31 + 0xfffff035], %r16
mondo_7_289:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d950000  ! 652: WRPR_WSTATE_R	wrpr	%r20, %r0, %wstate
splash_lsu_7_290:
	setx 0xffba2afb759c3e07, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 653: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_7_291:
	nop
	setx debug_7_291 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 654: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902004  ! 655: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x81982916  ! 656: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0916, %hpstate
tagged_7_292:
	tsubcctv %r9, 0x1a7b, %r21
	.word 0xe007f035  ! 657: LDUW_I	lduw	[%r31 + 0xfffff035], %r16
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01968  ! 658: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9168a681  ! 659: SDIVX_I	sdivx	%r2, 0x0681, %r8
	.word 0x81510000  ! 660: RDPR_TICK	rdpr	%tick, %r0
	setx 0x8c661c37242626ef, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_295:
	.word 0x39400001  ! 661: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_7_296:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 662: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_7_297:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe330c011  ! 1: STQF_R	-	%f17, [%r17, %r3]
	normalw
	.word 0x97458000  ! 663: RD_SOFTINT_REG	rd	%softint, %r11
pmu_7_298:
	nop
	setx 0xfffff284fffff8ae, %g1, %g7
	.word 0xa3800007  ! 664: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_7_299:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_299:
	.word 0x8f902000  ! 665: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_7_300:
	nop
	setx debug_7_300 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 666: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902005  ! 667: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd68008a0  ! 668: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_tba_7_301:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 669: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_302)) -> intp(3,0,23)
intvec_7_302:
	.word 0x39400001  ! 670: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_7_303:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 671: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_7_304:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d920011  ! 672: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
	.word 0xd68804a0  ! 673: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0xd6800bc0  ! 674: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r11
	setx 0x8176b65dae78dce7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_305:
	.word 0x39400001  ! 675: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802088  ! 676: WRASI_I	wr	%r0, 0x0088, %asi
	setx ivw_7_306, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_306:
	.word 0xa1a0016d  ! 677: FABSq	dis not found

	.word 0xa945c000  ! 678: RD_TICK_CMPR_REG	rd	%-, %r20
splash_lsu_7_307:
	setx 0x0b22e8184bb60133, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 679: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_7_308:
	tsubcctv %r26, 0x1ce0, %r19
	.word 0xe807eed1  ! 680: LDUW_I	lduw	[%r31 + 0x0ed1], %r20
splash_cmpr_7_309:
	setx 0xcb832dc165cf8da4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 681: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879021af  ! 682: WRPR_TT_I	wrpr	%r0, 0x01af, %tt
tagged_7_310:
	tsubcctv %r14, 0x1f6f, %r25
	.word 0xe807eed1  ! 683: LDUW_I	lduw	[%r31 + 0x0ed1], %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36c3175  ! 684: SDIVX_I	sdivx	%r16, 0xfffff175, %r17
change_to_randtl_7_312:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_312:
	.word 0x8f902000  ! 685: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_7_313:
	nop
	setx debug_7_313 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 686: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_7_314:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_314:
	.word 0x8f902002  ! 687: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_7_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d900006  ! 688: WRPR_WSTATE_R	wrpr	%r0, %r6, %wstate
	.word 0x93902005  ! 689: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_7_316:
	nop
	setx debug_7_316 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 690: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0xbaf1b25448699036, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_317:
	.word 0x39400001  ! 691: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 692: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 693: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xad81aa20  ! 694: WR_SOFTINT_REG_I	wr	%r6, 0x0a20, %softint
	.word 0x87802058  ! 695: WRASI_I	wr	%r0, 0x0058, %asi
change_to_randtl_7_318:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_318:
	.word 0x8f902001  ! 696: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a0196c  ! 697: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916ca906  ! 698: SDIVX_I	sdivx	%r18, 0x0906, %r8
debug_7_321:
	nop
	setx debug_7_321 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 699: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_7_322:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 700: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_7_323:
	taddcctv %r6, 0x1372, %r1
	.word 0xe407f52a  ! 701: LDUW_I	lduw	[%r31 + 0xfffff52a], %r18
mondo_7_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d91800a  ! 702: WRPR_WSTATE_R	wrpr	%r6, %r10, %wstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 703: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902669  ! 704: WRPR_PSTATE_I	wrpr	%r0, 0x0669, %pstate
	.word 0xa1a01a63  ! 705: FqTOi	fqtoi	
	.word 0x819824bc  ! 706: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04bc, %hpstate
	setx ivw_7_325, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_325:
	.word 0xa7a00173  ! 707: FABSq	dis not found

	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 708: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 709: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8198272f  ! 710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x072f, %hpstate
	.word 0xd237f52a  ! 711: STH_I	sth	%r9, [%r31 + 0xfffff52a]
	.word 0x9f802d97  ! 712: SIR	sir	0x0d97
	.word 0xd317c000  ! 713: LDQF_R	-	[%r31, %r0], %f9
splash_cmpr_7_326:
	setx 0xa7722639961f82fa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 714: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 715: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_7_327:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 716: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_7_328:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d91c012  ! 717: WRPR_WSTATE_R	wrpr	%r7, %r18, %wstate
	.word 0xd337e0ec  ! 718: STQF_I	-	%f9, [0x00ec, %r31]
	.word 0x97454000  ! 719: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0x99902002  ! 720: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xd48008a0  ! 721: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_cmpr_7_329:
	setx 0x67955eb2358c8720, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 722: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_330:
	setx 0xe28d866241fcc829, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 723: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_7_331, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_331:
	.word 0xa7a00174  ! 724: FABSq	dis not found

splash_tba_7_332:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 725: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790236b  ! 726: WRPR_TT_I	wrpr	%r0, 0x036b, %tt
	.word 0x91d02033  ! 727: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe20fe0ec  ! 728: LDUB_I	ldub	[%r31 + 0x00ec], %r17
	.word 0x81510000  ! 729: RDPR_TICK	rdpr	%tick, %r0
	setx ivw_7_333, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_333:
	.word 0x9ba00166  ! 730: FABSq	dis not found

	.word 0x91d020b4  ! 731: Tcc_I	ta	icc_or_xcc, %r0 + 180
mondo_7_334:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d91c014  ! 732: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
	.word 0x93902007  ! 733: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x87802004  ! 734: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802055  ! 735: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xe917c000  ! 736: LDQF_R	-	[%r31, %r0], %f20
	setx ivw_7_335, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_335:
	.word 0x97a00169  ! 737: FABSq	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_336)) -> intp(5,0,11)
intvec_7_336:
	.word 0x39400001  ! 738: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_7_337:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x91a00547  ! 1: FSQRTd	fsqrt	
	.word 0xa5a20828  ! 739: FADDs	fadds	%f8, %f8, %f18
change_to_randtl_7_338:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_338:
	.word 0x8f902001  ! 740: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_7_339:
	setx 0x7c3f63036c3d3122, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 741: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe68008a0  ! 742: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
debug_7_340:
	nop
	setx debug_7_340 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 743: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99687ccb  ! 744: SDIVX_I	sdivx	%r1, 0xfffffccb, %r12
splash_htba_7_342:
	set 0x00390000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 745: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd01ffb39  ! 746: LDD_I	ldd	[%r31 + 0xfffffb39], %r8
	.word 0x2a800001  ! 747: BCS	bcs,a	<label_0x1>
	.word 0x93902003  ! 748: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_7_343:
	setx 0x6ec0f67c40db808d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 749: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7a009c4  ! 750: FDIVd	fdivd	%f0, %f4, %f50
	.word 0xad81fa91  ! 751: WR_SOFTINT_REG_I	wr	%r7, 0x1a91, %softint
debug_7_344:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 752: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93454000  ! 753: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0x87902073  ! 754: WRPR_TT_I	wrpr	%r0, 0x0073, %tt
	.word 0xe28804a0  ! 755: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 756: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_7_345:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 757: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8d903ddc  ! 758: WRPR_PSTATE_I	wrpr	%r0, 0x1ddc, %pstate
	.word 0x879023e9  ! 759: WRPR_TT_I	wrpr	%r0, 0x03e9, %tt
DS_7_346:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f4, %f28, %f8
	.word 0x91b00313  ! 760: ALIGNADDRESS	alignaddr	%r0, %r19, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01971  ! 761: FqTOd	dis not found

	.word 0xda4fc000  ! 762: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196a  ! 763: FqTOd	dis not found

	.word 0xa190200f  ! 764: WRPR_GL_I	wrpr	%r0, 0x000f, %-
mondo_7_349:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d928004  ! 765: WRPR_WSTATE_R	wrpr	%r10, %r4, %wstate
	.word 0xd327ed48  ! 766: STF_I	st	%f9, [0x0d48, %r31]
	.word 0xd2c804a0  ! 767: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 768: LDX_R	ldx	[%r31 + %r0], %r9
DS_7_350:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 769: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd257ed48  ! 770: LDSH_I	ldsh	[%r31 + 0x0d48], %r9
	.word 0xd28fe020  ! 771: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r9
DS_7_351:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa5b48303  ! 772: ALIGNADDRESS	alignaddr	%r18, %r3, %r18
	.word 0xab84c009  ! 773: WR_CLEAR_SOFTINT_R	wr	%r19, %r9, %clear_softint
	.word 0xe457c000  ! 774: LDSH_R	ldsh	[%r31 + %r0], %r18
intveclr_7_352:
	setx 0xa2047dd7f90f0064, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 775: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_7_353:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d91c00a  ! 776: WRPR_WSTATE_R	wrpr	%r7, %r10, %wstate
mondo_7_354:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d948002  ! 777: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
	.word 0xe41fc000  ! 778: LDD_R	ldd	[%r31 + %r0], %r18
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 779: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01969  ! 780: FqTOd	dis not found

	.word 0xd037ed48  ! 781: STH_I	sth	%r8, [%r31 + 0x0d48]
splash_lsu_7_356:
	setx 0x0f1bb4cf6fb79f25, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 782: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_7_357:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 783: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xd11fed48  ! 784: LDDF_I	ldd	[%r31, 0x0d48], %f8
debug_7_358:
	nop
	setx debug_7_358 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 785: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_7_359:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe3124001  ! 1: LDQF_R	-	[%r9, %r1], %f17
	.word 0x97a1882d  ! 786: FADDs	fadds	%f6, %f13, %f11
splash_cmpr_7_360:
	setx 0x4a37e5108b1f5d21, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 787: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 788: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 789: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01974  ! 790: FqTOd	dis not found

	.word 0x8d902a7d  ! 791: WRPR_PSTATE_I	wrpr	%r0, 0x0a7d, %pstate
	.word 0xe68008a0  ! 792: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
splash_cmpr_7_362:
	setx 0x071bc9275e272cdc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 793: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x19ba7b9616ad449c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_363:
	.word 0x39400001  ! 794: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802063  ! 795: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x20700001  ! 796: BPN	<illegal instruction>
	.word 0xe67fed48  ! 797: SWAP_I	swap	%r19, [%r31 + 0x0d48]
	.word 0x8d90396c  ! 798: WRPR_PSTATE_I	wrpr	%r0, 0x196c, %pstate
change_to_randtl_7_364:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_364:
	.word 0x8f902000  ! 799: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 800: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe677c007  ! 801: STX_R	stx	%r19, [%r31 + %r7]
	.word 0xe6c7e010  ! 802: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r19
splash_htba_7_365:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 803: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_7_366:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d92c000  ! 804: WRPR_WSTATE_R	wrpr	%r11, %r0, %wstate
	setx ivw_7_367, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_367:
	.word 0x93a00172  ! 805: FABSq	dis not found

	.word 0x879023d9  ! 806: WRPR_TT_I	wrpr	%r0, 0x03d9, %tt
	.word 0x91d02034  ! 807: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa950c000  ! 808: RDPR_TT	rdpr	%tt, %r20
	.word 0x8d90242a  ! 809: WRPR_PSTATE_I	wrpr	%r0, 0x042a, %pstate
	.word 0x87902391  ! 810: WRPR_TT_I	wrpr	%r0, 0x0391, %tt
	.word 0xe48008a0  ! 811: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe537ed48  ! 812: STQF_I	-	%f18, [0x0d48, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 813: LDX_R	ldx	[%r31 + %r0], %r18
mondo_7_368:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d950003  ! 814: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
	setx 0x07b8cd4136a1fd46, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_369:
	.word 0x39400001  ! 815: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_7_370:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d91c014  ! 816: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
tagged_7_371:
	taddcctv %r3, 0x19fa, %r4
	.word 0xe407ed48  ! 817: LDUW_I	lduw	[%r31 + 0x0d48], %r18
splash_cmpr_7_372:
	setx 0xcca980a761223773, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 818: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_373:
	nop
	setx debug_7_373 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 819: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 820: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe48804a0  ! 821: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
mondo_7_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d934013  ! 822: WRPR_WSTATE_R	wrpr	%r13, %r19, %wstate
	.word 0x97a4cdca  ! 823: FdMULq	fdmulq	
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 824: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902dc4  ! 825: WRPR_PSTATE_I	wrpr	%r0, 0x0dc4, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 826: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4dfe020  ! 827: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
	.word 0xab830012  ! 828: WR_CLEAR_SOFTINT_R	wr	%r12, %r18, %clear_softint
	.word 0xd46fed48  ! 829: LDSTUB_I	ldstub	%r10, [%r31 + 0x0d48]
	setx 0x6ae9836503158d57, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_375:
	.word 0x39400001  ! 830: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_7_376:
	nop
	setx debug_7_376 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 831: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x879023a9  ! 832: WRPR_TT_I	wrpr	%r0, 0x03a9, %tt
	setx ivw_7_377, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_377:
	.word 0x95a00170  ! 833: FABSq	dis not found

	.word 0x99540000  ! 834: RDPR_GL	rdpr	%-, %r12
	.word 0xd73fed48  ! 835: STDF_I	std	%f11, [0x0d48, %r31]
	.word 0xa190200f  ! 836: WRPR_GL_I	wrpr	%r0, 0x000f, %-
DS_7_378:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xdb5f9b1c	! Random illegal ?
	.word 0xa5a00554  ! 1: FSQRTd	fsqrt	
	.word 0x97a24832  ! 837: FADDs	fadds	%f9, %f18, %f11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 838: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6900e80  ! 839: LDUHA_R	lduha	[%r0, %r0] 0x74, %r11
	.word 0x93902001  ! 840: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
debug_7_379:
	nop
	setx debug_7_379 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 841: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_7_380:
	setx 0x65e4407d3178af89, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 842: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_7_381:
	setx 0xffe17d561fa4b4bb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 843: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 844: RDPR_TICK	rdpr	%tick, %r0
	setx ivw_7_382, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_382:
	.word 0x95a00174  ! 845: FABSq	dis not found

	.word 0xd89004a0  ! 846: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0xd91fc000  ! 847: LDDF_R	ldd	[%r31, %r0], %f12
change_to_randtl_7_383:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_383:
	.word 0x8f902001  ! 848: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd88008a0  ! 849: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_tba_7_384:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 850: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_7_385:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd510c001  ! 1: LDQF_R	-	[%r3, %r1], %f10
	.word 0xa1a24831  ! 851: FADDs	fadds	%f9, %f17, %f16
debug_7_386:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 852: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936a303c  ! 853: SDIVX_I	sdivx	%r8, 0xfffff03c, %r9
	.word 0xe647f42d  ! 854: LDSW_I	ldsw	[%r31 + 0xfffff42d], %r19
	.word 0xe717c000  ! 855: LDQF_R	-	[%r31, %r0], %f19
	.word 0x87802089  ! 856: WRASI_I	wr	%r0, 0x0089, %asi
intveclr_7_388:
	setx 0xb4ca04dde9ac86e1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 857: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_7_389:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe734c009  ! 1: STQF_R	-	%f19, [%r9, %r19]
	normalw
	.word 0x9b458000  ! 858: RD_SOFTINT_REG	rd	%softint, %r13
debug_7_390:
	nop
	setx debug_7_390 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 859: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d90387e  ! 860: WRPR_PSTATE_I	wrpr	%r0, 0x187e, %pstate
	.word 0xad82e3bf  ! 861: WR_SOFTINT_REG_I	wr	%r11, 0x03bf, %softint
splash_cmpr_7_391:
	setx 0x2c1770f1e19232f6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 862: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_392:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xf541e6bb	! Random illegal ?
	.word 0xd7148014  ! 1: LDQF_R	-	[%r18, %r20], %f11
	.word 0x95a4c823  ! 863: FADDs	fadds	%f19, %f3, %f10
	.word 0xd8880e60  ! 864: LDUBA_R	lduba	[%r0, %r0] 0x73, %r12
splash_cmpr_7_393:
	setx 0x5f04df1bc7e15798, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 865: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_394:
	nop
	setx debug_7_394 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 866: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd8d004a0  ! 867: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0x9b480000  ! 868: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	setx 0xd15804347af961e1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_395:
	.word 0x39400001  ! 869: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x90dd0005  ! 870: SMULcc_R	smulcc 	%r20, %r5, %r8
	.word 0xa190200a  ! 871: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_lsu_7_396:
	setx 0x6bed186b093ef6b1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 872: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_7_397:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_397:
	.word 0x8f902001  ! 873: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe63ff1d4  ! 874: STD_I	std	%r19, [%r31 + 0xfffff1d4]
splash_cmpr_7_398:
	setx 0x6647c3604064550d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 875: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_399:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe9314003  ! 1: STQF_R	-	%f20, [%r3, %r5]
	normalw
	.word 0x93458000  ! 876: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x93902005  ! 877: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902009  ! 878: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 879: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87902231  ! 880: WRPR_TT_I	wrpr	%r0, 0x0231, %tt
splash_cmpr_7_400:
	setx 0x113a8389ed210b11, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 881: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b2  ! 882: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x22700001  ! 883: BPE	<illegal instruction>
	.word 0xe317c000  ! 884: LDQF_R	-	[%r31, %r0], %f17
	.word 0x8d9036bc  ! 885: WRPR_PSTATE_I	wrpr	%r0, 0x16bc, %pstate
splash_cmpr_7_401:
	setx 0x3b6fa411c16499d4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 886: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe2d00e40  ! 887: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r17
splash_lsu_7_402:
	setx 0x9fc4a1fb45c55e03, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 888: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_7_403:
	setx 0xb3d8125e5650f8cc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 889: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 890: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x99a009ca  ! 891: FDIVd	fdivd	%f0, %f10, %f12
DS_7_404:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe5348007  ! 1: STQF_R	-	%f18, [%r7, %r18]
	normalw
	.word 0x9b458000  ! 892: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8d902ad0  ! 893: WRPR_PSTATE_I	wrpr	%r0, 0x0ad0, %pstate
	.word 0x8d903fe7  ! 894: WRPR_PSTATE_I	wrpr	%r0, 0x1fe7, %pstate
	.word 0x8d903101  ! 895: WRPR_PSTATE_I	wrpr	%r0, 0x1101, %pstate
splash_cmpr_7_405:
	setx 0x4244cfddd095babe, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 896: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2a800001  ! 897: BCS	bcs,a	<label_0x1>
splash_cmpr_7_406:
	setx 0x3aaa56c5a56735ef, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 898: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_407:
	setx 0xd0489155879b79f5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 899: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_408)) -> intp(5,0,17)
intvec_7_408:
	.word 0x39400001  ! 900: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_7_409:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d940002  ! 901: WRPR_WSTATE_R	wrpr	%r16, %r2, %wstate
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 902: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 903: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01973  ! 904: FqTOd	dis not found

pmu_7_411:
	nop
	setx 0xfffff0cafffffb0b, %g1, %g7
	.word 0xa3800007  ! 905: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_7_412:
	setx 0x37945dcdcae29804, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 906: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9b45c000  ! 907: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xd86ff1d4  ! 908: LDSTUB_I	ldstub	%r12, [%r31 + 0xfffff1d4]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 909: LDX_R	ldx	[%r31 + %r0], %r12
tagged_7_413:
	taddcctv %r24, 0x19fd, %r16
	.word 0xd807f1d4  ! 910: LDUW_I	lduw	[%r31 + 0xfffff1d4], %r12
DS_7_414:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe1326c9d  ! 1: STQF_I	-	%f16, [0x0c9d, %r9]
	normalw
	.word 0x9b458000  ! 911: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8d802000  ! 912: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93d02034  ! 913: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x879021f9  ! 914: WRPR_TT_I	wrpr	%r0, 0x01f9, %tt
	.word 0x91d02033  ! 915: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_cmpr_7_415:
	setx 0xd9fb0cfbaead9357, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 916: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_7_416:
	setx 0xc12bdac6d89cdd04, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 917: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_7_417:
	nop
	setx debug_7_417 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 918: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx ivw_7_418, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_418:
	.word 0x95a00174  ! 919: FABSq	dis not found

	.word 0x93902004  ! 920: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_7_419:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 921: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd397ea29  ! 922: LDQFA_I	-	[%r31, 0x0a29], %f9
	.word 0x879020a6  ! 923: WRPR_TT_I	wrpr	%r0, 0x00a6, %tt
	.word 0xd33fc012  ! 924: STDF_R	std	%f9, [%r18, %r31]
	.word 0xa190200c  ! 925: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa1902000  ! 926: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xd25fea29  ! 927: LDX_I	ldx	[%r31 + 0x0a29], %r9
	setx ivw_7_420, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_420:
	.word 0xa3a00170  ! 928: FABSq	dis not found

	.word 0xdac7e030  ! 929: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196c  ! 930: FqTOd	dis not found

intveclr_7_422:
	setx 0x30e1c2398076fdb9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 931: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_7_423:
	nop
	setx debug_7_423 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 932: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x819829e4  ! 933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09e4, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 934: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_7_424:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d950010  ! 935: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
	.word 0xd21fc000  ! 936: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196b  ! 937: FqTOd	dis not found

mondo_7_426:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d948003  ! 938: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
	.word 0x87802063  ! 939: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x93902005  ! 940: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd43fc00d  ! 941: STD_R	std	%r10, [%r31 + %r13]
	.word 0xd48fe030  ! 942: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
	.word 0x94dc0002  ! 943: SMULcc_R	smulcc 	%r16, %r2, %r10
	.word 0xd00fc000  ! 944: LDUB_R	ldub	[%r31 + %r0], %r8
	.word 0x93902006  ! 945: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
donret_7_427:
	nop
	setx donretarg_7_427, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r5, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_427:
	.word 0xd0ffea29  ! 946: SWAPA_I	swapa	%r8, [%r31 + 0x0a29] %asi
DS_7_428:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 947: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd09fc020  ! 948: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
splash_lsu_7_429:
	setx 0xf152a7e19f428a85, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 949: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 950: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xd0d7e030  ! 951: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
splash_lsu_7_430:
	setx 0x348834ed170d0185, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 952: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 953: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01960  ! 954: FqTOd	dis not found

	.word 0x93902004  ! 955: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa1902001  ! 956: WRPR_GL_I	wrpr	%r0, 0x0001, %-
debug_7_432:
	nop
	setx debug_7_432 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 957: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_7_433:
	setx 0xbea08ced64461c55, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 958: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_7_434:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd1330001  ! 1: STQF_R	-	%f8, [%r1, %r12]
	normalw
	.word 0x91458000  ! 959: RD_SOFTINT_REG	rd	%softint, %r8
splash_htba_7_435:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 960: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x9f802ecf  ! 961: SIR	sir	0x0ecf
	.word 0xd68008a0  ! 962: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 963: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_7_436:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_436:
	.word 0x8f902000  ! 964: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x99902004  ! 965: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
splash_cmpr_7_437:
	setx 0xac631356bb4854b8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 966: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879021ff  ! 967: WRPR_TT_I	wrpr	%r0, 0x01ff, %tt
splash_lsu_7_438:
	setx 0x7fcb8fada0482933, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_439:
	setx 0xea35827c4371ac6f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 969: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902860  ! 970: WRPR_PSTATE_I	wrpr	%r0, 0x0860, %pstate
	.word 0xd61fc000  ! 971: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd657c000  ! 972: LDSH_R	ldsh	[%r31 + %r0], %r11
change_to_randtl_7_440:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_440:
	.word 0x8f902002  ! 973: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d9030ea  ! 974: WRPR_PSTATE_I	wrpr	%r0, 0x10ea, %pstate
splash_cmpr_7_441:
	setx 0xbeebaa0b2733bc15, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 975: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879021b7  ! 976: WRPR_TT_I	wrpr	%r0, 0x01b7, %tt
	.word 0x9b480000  ! 977: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
debug_7_442:
	nop
	setx debug_7_442 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 978: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_7_443:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 979: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d903314  ! 980: WRPR_PSTATE_I	wrpr	%r0, 0x1314, %pstate
tagged_7_444:
	tsubcctv %r22, 0x1193, %r2
	.word 0xe407ec60  ! 981: LDUW_I	lduw	[%r31 + 0x0c60], %r18
	.word 0x87802080  ! 982: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93902002  ! 983: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xe41fc000  ! 984: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x81510000  ! 985: RDPR_TICK	rdpr	%tick, %r0
	.word 0x93d02034  ! 986: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xe48008a0  ! 987: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
splash_tba_7_445:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 988: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_7_446:
	setx 0xe6ec736b0079e90a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 989: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_7_447:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d948007  ! 990: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
change_to_randtl_7_448:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_448:
	.word 0x8f902000  ! 991: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902000  ! 992: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa9480000  ! 993: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0x8d802004  ! 994: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa980c007  ! 995: WR_SET_SOFTINT_R	wr	%r3, %r7, %set_softint
debug_7_449:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 996: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_7_450:
	setx 0xc1a10e6ff639827c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 997: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd28fe010  ! 998: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r9
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
mondo_6_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d940005  ! 1: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
	.word 0x8d90233f  ! 2: WRPR_PSTATE_I	wrpr	%r0, 0x033f, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 3: LDX_R	ldx	[%r31 + %r0], %r13
	setx 0xb428fe957488ad38, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_1:
	.word 0x39400001  ! 4: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9968e07d  ! 5: SDIVX_I	sdivx	%r3, 0x007d, %r12
	.word 0xab850003  ! 6: WR_CLEAR_SOFTINT_R	wr	%r20, %r3, %clear_softint
splash_cmpr_6_3:
	setx 0x5875de633415b3b3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802014  ! 8: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d903a74  ! 9: WRPR_PSTATE_I	wrpr	%r0, 0x1a74, %pstate
	.word 0xd637e0e3  ! 10: STH_I	sth	%r11, [%r31 + 0x00e3]
	.word 0xd6800c40  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r11
splash_cmpr_6_4:
	setx 0x7c22f21c7aa51001, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 12: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_6_5:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 13: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_6_6:
	setx 0x0aa8a31a0b3f61a1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 14: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 15: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_6_7:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f16, %f16, %f4
	.word 0xa5b00302  ! 16: ALIGNADDRESS	alignaddr	%r0, %r2, %r18
	.word 0x819828c4  ! 17: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c4, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01972  ! 18: FqTOd	dis not found

	.word 0xd797e0e3  ! 19: LDQFA_I	-	[%r31, 0x00e3], %f11
	.word 0xa4d20000  ! 20: UMULcc_R	umulcc 	%r8, %r0, %r18
tagged_6_9:
	taddcctv %r25, 0x1dd3, %r22
	.word 0xe807e0e3  ! 21: LDUW_I	lduw	[%r31 + 0x00e3], %r20
	.word 0x91d02035  ! 22: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe89fc020  ! 23: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	setx ivw_6_10, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_10:
	.word 0x91a00174  ! 24: FABSq	dis not found

	.word 0xe49fc020  ! 25: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
	.word 0x8198245e  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x045e, %hpstate
	.word 0x9750c000  ! 27: RDPR_TT	<illegal instruction>
	setx ivw_6_11, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_11:
	.word 0x91a00167  ! 28: FABSq	dis not found

	.word 0x87902107  ! 29: WRPR_TT_I	wrpr	%r0, 0x0107, %tt
mondo_6_12:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d930009  ! 30: WRPR_WSTATE_R	wrpr	%r12, %r9, %wstate
	.word 0xa9a149d3  ! 31: FDIVd	fdivd	%f36, %f50, %f20
	.word 0x9f803462  ! 32: SIR	sir	0x1462
	.word 0xe41fc000  ! 33: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x36700001  ! 34: BPGE	<illegal instruction>
donret_6_13:
	nop
	setx donretarg_6_13, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r21, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_13:
	.word 0xe4fffe6a  ! 35: SWAPA_I	swapa	%r18, [%r31 + 0xfffffe6a] %asi
DS_6_14:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0x8b653e4c	! Random illegal ?
	.word 0xd7108001  ! 1: LDQF_R	-	[%r2, %r1], %f11
	.word 0x93a2c829  ! 36: FADDs	fadds	%f11, %f9, %f9
	.word 0x9ac53505  ! 37: ADDCcc_I	addccc 	%r20, 0xfffff505, %r13
	.word 0xe517c000  ! 38: LDQF_R	-	[%r31, %r0], %f18
splash_cmpr_6_15:
	setx 0xa884c46778b4caa3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 39: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_6_16, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_16:
	.word 0xa5a00174  ! 40: FABSq	dis not found

	.word 0xd49fc020  ! 41: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
splash_cmpr_6_17:
	setx 0x5a033f58d41131b4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 42: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f803ebd  ! 43: SIR	sir	0x1ebd
	.word 0x96dc4009  ! 44: SMULcc_R	smulcc 	%r17, %r9, %r11
splash_lsu_6_18:
	setx 0x16ea328ff936263d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 45: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 46: RD_STICK_REG	stbar
	.word 0x93902006  ! 47: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x3a700001  ! 48: BPCC	<illegal instruction>
	.word 0xd4800b20  ! 49: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196a  ! 50: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a0196a  ! 51: FqTOd	dis not found

	setx 0x534f467d6b863396, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_21:
	.word 0x39400001  ! 52: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe207c000  ! 53: LDUW_R	lduw	[%r31 + %r0], %r17
	.word 0xe337fa5d  ! 54: STQF_I	-	%f17, [0x1a5d, %r31]
splash_cmpr_6_22:
	setx 0x6a94a5c58647b299, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_23:
	setx 0xe1b7ccb38c5b7f92, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 56: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe21ffa5d  ! 57: LDD_I	ldd	[%r31 + 0xfffffa5d], %r17
splash_cmpr_6_24:
	setx 0x83583713bf022c8c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_6_25:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 59: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe2c00e60  ! 60: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r17
	.word 0x93902003  ! 61: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_cmpr_6_26:
	setx 0x6cdd0c5b15abceee, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_27:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe912c00b  ! 1: LDQF_R	-	[%r11, %r11], %f20
	.word 0xa9a4482b  ! 63: FADDs	fadds	%f17, %f11, %f20
	.word 0x99500000  ! 64: RDPR_TPC	<illegal instruction>
	.word 0xe69004a0  ! 65: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
donret_6_28:
	nop
	setx donretarg_6_28, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r2, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_28:
	.word 0xe6fffa5d  ! 66: SWAPA_I	swapa	%r19, [%r31 + 0xfffffa5d] %asi
debug_6_29:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 67: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_6_30:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 68: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
change_to_randtl_6_31:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_31:
	.word 0x8f902003  ! 69: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
!$EV trig_pc_d(1, @VA(.MAIN.xir_6_32)) -> intp(6,1,3)
xir_6_32:
	.word 0xa98365d9  ! 70: WR_SET_SOFTINT_I	wr	%r13, 0x05d9, %set_softint
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 71: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902001  ! 72: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
mondo_6_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d90400c  ! 73: WRPR_WSTATE_R	wrpr	%r1, %r12, %wstate
	.word 0xa9450000  ! 74: RD_SET_SOFTINT	rd	%set_softint, %r20
	.word 0x9680ba29  ! 75: ADDcc_I	addcc 	%r2, 0xfffffa29, %r11
mondo_6_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d928011  ! 76: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
	.word 0x819828ed  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ed, %hpstate
	.word 0xd527fcdf  ! 78: STF_I	st	%f10, [0x1cdf, %r31]
	.word 0xd597fcdf  ! 79: LDQFA_I	-	[%r31, 0x1cdf], %f10
tagged_6_35:
	taddcctv %r1, 0x1755, %r21
	.word 0xd407fcdf  ! 80: LDUW_I	lduw	[%r31 + 0xfffffcdf], %r10
	.word 0x9b500000  ! 81: RDPR_TPC	rdpr	%tpc, %r13
intveclr_6_36:
	setx 0xe303f147db1f6978, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 82: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd66ffcdf  ! 84: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffffcdf]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936cf0c9  ! 85: SDIVX_I	sdivx	%r19, 0xfffff0c9, %r9
intveclr_6_38:
	setx 0xb65bb2e3eed9478a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_6_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d920008  ! 87: WRPR_WSTATE_R	wrpr	%r8, %r8, %wstate
	.word 0x2e700001  ! 88: BPVS	<illegal instruction>
debug_6_40:
	nop
	setx debug_6_40 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 89: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_6_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 90: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81982e74  ! 91: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e74, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 92: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx ivw_6_42, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_42:
	.word 0x95a00170  ! 93: FABSq	dis not found

	.word 0xd647ec7e  ! 94: LDSW_I	ldsw	[%r31 + 0x0c7e], %r11
	.word 0x2a800001  ! 95: BCS	bcs,a	<label_0x1>
	.word 0xd6d804a0  ! 96: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_6_43)) -> intp(6,1,3)
xir_6_43:
	.word 0xa980a266  ! 97: WR_SET_SOFTINT_I	wr	%r2, 0x0266, %set_softint
	.word 0x8d9034a7  ! 98: WRPR_PSTATE_I	wrpr	%r0, 0x14a7, %pstate
mondo_6_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d930012  ! 99: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
	.word 0x91d020b2  ! 100: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x879022ce  ! 101: WRPR_TT_I	wrpr	%r0, 0x02ce, %tt
debug_6_45:
	nop
	setx debug_6_45 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 102: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd71fc000  ! 103: LDDF_R	ldd	[%r31, %r0], %f11
DS_6_46:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 104: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd6900e40  ! 105: LDUHA_R	lduha	[%r0, %r0] 0x72, %r11
	.word 0xd69ffa49  ! 106: LDDA_I	ldda	[%r31, + 0xfffffa49] %asi, %r11
	.word 0x879023f1  ! 107: WRPR_TT_I	wrpr	%r0, 0x03f1, %tt
	.word 0xa3450000  ! 108: RD_SET_SOFTINT	rd	%set_softint, %r17
debug_6_47:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 109: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8198208d  ! 110: WRHPR_HPSTATE_I	wrhpr	%r0, 0x008d, %hpstate
	.word 0x95a2c9d3  ! 111: FDIVd	fdivd	%f42, %f50, %f10
debug_6_48:
	nop
	setx debug_6_48 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 112: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802016  ! 113: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x81982247  ! 114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0247, %hpstate
	.word 0x81982217  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0217, %hpstate
intveclr_6_49:
	setx 0x78051d5852e5603e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 116: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 117: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa468640d  ! 118: UDIVX_I	udivx 	%r1, 0x040d, %r18
	.word 0xd08008a0  ! 119: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
tagged_6_50:
	tsubcctv %r1, 0x16cd, %r1
	.word 0xd007f324  ! 120: LDUW_I	lduw	[%r31 + 0xfffff324], %r8
	.word 0xa190200d  ! 121: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_tba_6_51:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 122: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_6_52:
	nop
	setx debug_6_52 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 123: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902007  ! 124: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a0196d  ! 125: FqTOd	dis not found

debug_6_54:
	nop
	setx debug_6_54 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 126: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902001  ! 127: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_randtl_6_55:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_55:
	.word 0x8f902002  ! 128: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_6_56:
	setx 0x3e483ef8c202cc96, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_57:
	setx 0xf7f5eadc737cfa58, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 130: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_58:
	setx 0x5f2f88d8bef7a62d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 131: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 132: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x81982c7e  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c7e, %hpstate
intveclr_6_59:
	setx 0xf217a81ad33c2999, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 134: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd66ff324  ! 135: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff324]
	.word 0xd627f324  ! 136: STW_I	stw	%r11, [%r31 + 0xfffff324]
	.word 0xd69fc020  ! 137: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
debug_6_60:
	nop
	setx debug_6_60 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 138: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_6_61:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d93400b  ! 139: WRPR_WSTATE_R	wrpr	%r13, %r11, %wstate
	.word 0xd677f324  ! 140: STX_I	stx	%r11, [%r31 + 0xfffff324]
	.word 0x8d902ae5  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x0ae5, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_62)) -> intp(4,0,31)
intvec_6_62:
	.word 0x39400001  ! 142: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81982936  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0936, %hpstate
	setx 0x5d44837af8acb754, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_63:
	.word 0x39400001  ! 144: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_6_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d94c014  ! 145: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
splash_lsu_6_65:
	setx 0x2c9a990332496439, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 146: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 147: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
mondo_6_66:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d920013  ! 148: WRPR_WSTATE_R	wrpr	%r8, %r19, %wstate
DS_6_67:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 149: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
DS_6_68:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f2, %f14, %f4
	.word 0x9bb4830a  ! 150: ALIGNADDRESS	alignaddr	%r18, %r10, %r13
intveclr_6_69:
	setx 0x2e46f8a602d4d942, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 151: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd657f324  ! 152: LDSH_I	ldsh	[%r31 + 0xfffff324], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 153: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd727c006  ! 154: STF_R	st	%f11, [%r6, %r31]
	.word 0x91d020b3  ! 155: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xa9844007  ! 156: WR_SET_SOFTINT_R	wr	%r17, %r7, %set_softint
debug_6_70:
	nop
	setx debug_6_70 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 157: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 158: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x93902000  ! 159: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x9ba489d3  ! 160: FDIVd	fdivd	%f18, %f50, %f44
DS_6_71:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f6, %f18, %f0
	.word 0x97b18300  ! 161: ALIGNADDRESS	alignaddr	%r6, %r0, %r11
donret_6_72:
	nop
	setx donretarg_6_72, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r17, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_72:
	.word 0xdafff324  ! 162: SWAPA_I	swapa	%r13, [%r31 + 0xfffff324] %asi
debug_6_73:
	nop
	setx debug_6_73 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_6_74:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 164: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200d  ! 165: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x91500000  ! 166: RDPR_TPC	rdpr	%tpc, %r8
	.word 0x8d9036d9  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x16d9, %pstate
splash_cmpr_6_75:
	setx 0xbd67d92c731dca83, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 168: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902002  ! 169: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_6_76:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd530c013  ! 1: STQF_R	-	%f10, [%r19, %r3]
	normalw
	.word 0xa7458000  ! 170: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0x87902376  ! 171: WRPR_TT_I	wrpr	%r0, 0x0376, %tt
splash_cmpr_6_77:
	setx 0x1210b8e4e7e0d758, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02034  ! 173: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902002  ! 174: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	setx ivw_6_78, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_78:
	.word 0x97a00173  ! 175: FABSq	dis not found

splash_cmpr_6_79:
	setx 0x99cd1fe6538c2b0b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 176: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_80:
	setx 0x98c176699d093e3a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe7e7c030  ! 178: CASA_I	casa	[%r31] 0x 1, %r16, %r19
intveclr_6_81:
	setx 0x104a378300fc12bd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 179: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 180: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xe727c010  ! 181: STF_R	st	%f19, [%r16, %r31]
	.word 0xe68008a0  ! 182: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x81b01021  ! 183: SIAM	siam	1
	.word 0xa1902006  ! 184: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xe61fc000  ! 185: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x2c800001  ! 186: BNEG	bneg,a	<label_0x1>
	.word 0x20800001  ! 187: BN	bn,a	<label_0x1>
	.word 0xe69ff324  ! 188: LDDA_I	ldda	[%r31, + 0xfffff324] %asi, %r19
splash_cmpr_6_82:
	setx 0x2ee4284c7c3dfe34, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 189: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe67ff324  ! 190: SWAP_I	swap	%r19, [%r31 + 0xfffff324]
	setx 0xb42a7ed2d57bba1f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_83:
	.word 0x39400001  ! 191: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
mondo_6_84:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d948002  ! 193: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
DS_6_85:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 194: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe6bff324  ! 195: STDA_I	stda	%r19, [%r31 + 0xfffff324] %asi
mondo_6_86:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d94800b  ! 196: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
change_to_randtl_6_87:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_87:
	.word 0x8f902003  ! 197: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01967  ! 198: FqTOd	dis not found

donret_6_89:
	nop
	setx donretarg_6_89, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r17, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_89:
	.word 0xe6fff324  ! 199: SWAPA_I	swapa	%r19, [%r31 + 0xfffff324] %asi
change_to_randtl_6_90:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_90:
	.word 0x8f902000  ! 200: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 201: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 202: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_6_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d908007  ! 203: WRPR_WSTATE_R	wrpr	%r2, %r7, %wstate
	.word 0x38700001  ! 204: BPGU	<illegal instruction>
	.word 0x81982525  ! 205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0525, %hpstate
	.word 0xe797f324  ! 206: LDQFA_I	-	[%r31, 0x1324], %f19
	.word 0x38800001  ! 207: BGU	bgu,a	<label_0x1>
splash_tba_6_92:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 208: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x819820c7  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c7, %hpstate
	.word 0x9f802d15  ! 210: SIR	sir	0x0d15
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01970  ! 211: FqTOd	dis not found

	.word 0xe717c000  ! 212: LDQF_R	-	[%r31, %r0], %f19
	.word 0x81460000  ! 213: RD_STICK_REG	stbar
	.word 0xe6dfe000  ! 214: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r19
	.word 0xa1902008  ! 215: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_cmpr_6_94:
	setx 0x41162085d1e404aa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9022af  ! 217: WRPR_PSTATE_I	wrpr	%r0, 0x02af, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01961  ! 218: FqTOd	dis not found

debug_6_96:
	nop
	setx debug_6_96 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 219: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_6_97:
	setx 0xd84a50adc5aecf14, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 220: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd06ffc1f  ! 221: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffc1f]
	.word 0xd0d7e020  ! 222: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
tagged_6_98:
	tsubcctv %r5, 0x1cab, %r7
	.word 0xd007fc1f  ! 223: LDUW_I	lduw	[%r31 + 0xfffffc1f], %r8
	.word 0x97a449d2  ! 224: FDIVd	fdivd	%f48, %f18, %f42
mondo_6_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d91c00b  ! 225: WRPR_WSTATE_R	wrpr	%r7, %r11, %wstate
splash_cmpr_6_100:
	setx 0xe1c28fdd37000cfb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 226: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802030  ! 227: SIR	sir	0x0030
	.word 0xa1902004  ! 228: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x879023fd  ! 229: WRPR_TT_I	wrpr	%r0, 0x03fd, %tt
donret_6_101:
	nop
	setx donretarg_6_101, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r16, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_101:
	.word 0xd2ffeed1  ! 230: SWAPA_I	swapa	%r9, [%r31 + 0x0ed1] %asi
change_to_randtl_6_102:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_102:
	.word 0x8f902002  ! 231: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
!$EV trig_pc_d(1, @VA(.MAIN.xir_6_103)) -> intp(6,1,3)
xir_6_103:
	.word 0xa981a9ab  ! 232: WR_SET_SOFTINT_I	wr	%r6, 0x09ab, %set_softint
	.word 0xd20fc000  ! 233: LDUB_R	ldub	[%r31 + %r0], %r9
debug_6_104:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 234: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd207c000  ! 235: LDUW_R	lduw	[%r31 + %r0], %r9
change_to_randtl_6_105:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_105:
	.word 0x8f902003  ! 236: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
intveclr_6_106:
	setx 0x896b57b5030037aa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 237: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_6_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d944007  ! 238: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
splash_tba_6_108:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 239: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd29ffeae  ! 240: LDDA_I	ldda	[%r31, + 0xfffffeae] %asi, %r9
	.word 0xd28804a0  ! 241: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
DS_6_109:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd311000d  ! 1: LDQF_R	-	[%r4, %r13], %f9
	.word 0x97a4c833  ! 242: FADDs	fadds	%f19, %f19, %f11
debug_6_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 243: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x3c800001  ! 244: BPOS	bpos,a	<label_0x1>
	setx ivw_6_111, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_111:
	.word 0x95a0016d  ! 245: FABSq	dis not found

tagged_6_112:
	tsubcctv %r13, 0x16b0, %r15
	.word 0xd407feae  ! 246: LDUW_I	lduw	[%r31 + 0xfffffeae], %r10
	.word 0xd407c000  ! 247: LDUW_R	lduw	[%r31 + %r0], %r10
debug_6_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 248: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 249: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 250: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_6_114:
	setx 0xe6da3cb564c1d6a9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 251: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 252: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_6_115:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 253: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xd47ffeae  ! 254: SWAP_I	swap	%r10, [%r31 + 0xfffffeae]
	.word 0xd537feae  ! 255: STQF_I	-	%f10, [0x1eae, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_116)) -> intp(1,0,6)
intvec_6_116:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x24800001  ! 257: BLE	ble,a	<label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa3a449cb  ! 259: FDIVd	fdivd	%f48, %f42, %f48
splash_tba_6_117:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 260: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02032  ! 261: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x819820f5  ! 262: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00f5, %hpstate
change_to_randtl_6_118:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_118:
	.word 0x8f902002  ! 263: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 264: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xad81fbfe  ! 265: WR_SOFTINT_REG_I	wr	%r7, 0x1bfe, %softint
	.word 0x90aa4005  ! 266: ANDNcc_R	andncc 	%r9, %r5, %r8
!$EV trig_pc_d(1, @VA(.MAIN.xir_6_119)) -> intp(6,1,3)
xir_6_119:
	.word 0xa9813a90  ! 267: WR_SET_SOFTINT_I	wr	%r4, 0x1a90, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_120)) -> intp(0,0,8)
intvec_6_120:
	.word 0x39400001  ! 268: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 269: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_6_121:
	setx 0xd778d88a1f2e1eda, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 270: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x94fa4014  ! 271: SDIVcc_R	sdivcc 	%r9, %r20, %r10
	.word 0xe807c000  ! 272: LDUW_R	lduw	[%r31 + %r0], %r20
	setx ivw_6_122, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_122:
	.word 0x9ba0016d  ! 273: FABSq	dis not found

mondo_6_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d92c013  ! 274: WRPR_WSTATE_R	wrpr	%r11, %r19, %wstate
splash_cmpr_6_124:
	setx 0x6b1f6b6a4471e470, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 275: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 276: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xa64cc006  ! 277: MULX_R	mulx 	%r19, %r6, %r19
splash_cmpr_6_125:
	setx 0x0a9042a4be3e6888, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3480000  ! 279: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
debug_6_126:
	nop
	setx debug_6_126 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 280: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x28700001  ! 281: BPLEU	<illegal instruction>
	.word 0x93902005  ! 282: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87802016  ! 283: WRASI_I	wr	%r0, 0x0016, %asi
change_to_randtl_6_127:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_127:
	.word 0x8f902002  ! 284: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01963  ! 285: FqTOd	dis not found

	.word 0x87802004  ! 286: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_6_129:
	setx 0x0820d3ab514e1f0a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 287: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790202a  ! 288: WRPR_TT_I	wrpr	%r0, 0x002a, %tt
	.word 0x99a01a70  ! 289: FqTOi	fqtoi	
	.word 0xe81fffcf  ! 290: LDD_I	ldd	[%r31 + 0xffffffcf], %r20
	.word 0xe88008a0  ! 291: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
splash_cmpr_6_130:
	setx 0x0023302e5ac06bd6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 292: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe93fc008  ! 293: STDF_R	std	%f20, [%r8, %r31]
	.word 0x879020bb  ! 294: WRPR_TT_I	wrpr	%r0, 0x00bb, %tt
	.word 0xe857c000  ! 295: LDSH_R	ldsh	[%r31 + %r0], %r20
	.word 0x3e800001  ! 296: BVC	bvc,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 297: LDX_R	ldx	[%r31 + %r0], %r20
DS_6_131:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 298: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	setx ivw_6_132, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_132:
	.word 0xa7a00174  ! 299: FABSq	dis not found

	.word 0x9f802fd9  ! 300: SIR	sir	0x0fd9
	.word 0xa0d88014  ! 301: SMULcc_R	smulcc 	%r2, %r20, %r16
	.word 0x87802089  ! 302: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x9f803c94  ! 303: SIR	sir	0x1c94
	.word 0xd28008a0  ! 304: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd28008a0  ! 305: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_lsu_6_133:
	setx 0x41fa26c0bf8d955b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 306: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_6_134:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 307: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x83d02032  ! 308: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_tba_6_135:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 309: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd27ff5df  ! 310: SWAP_I	swap	%r9, [%r31 + 0xfffff5df]
debug_6_136:
	nop
	setx debug_6_136 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 311: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_6_137:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 312: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd2d804a0  ! 313: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0xd2c004a0  ! 314: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916b7478  ! 315: SDIVX_I	sdivx	%r13, 0xfffff478, %r8
	.word 0x819823fc  ! 316: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03fc, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r18
DS_6_139:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe532400c  ! 1: STQF_R	-	%f18, [%r12, %r9]
	normalw
	.word 0xa1458000  ! 318: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0xe607c000  ! 319: LDUW_R	lduw	[%r31 + %r0], %r19
mondo_6_140:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d94800b  ! 320: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996d3636  ! 321: SDIVX_I	sdivx	%r20, 0xfffff636, %r12
	.word 0xd537c008  ! 322: STQF_R	-	%f10, [%r8, %r31]
	.word 0xab834009  ! 323: WR_CLEAR_SOFTINT_R	wr	%r13, %r9, %clear_softint
	.word 0xd4800bc0  ! 324: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r10
	.word 0xa9824011  ! 325: WR_SET_SOFTINT_R	wr	%r9, %r17, %set_softint
mondo_6_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d950013  ! 326: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
	.word 0x81460000  ! 327: RD_STICK_REG	stbar
change_to_randtl_6_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_143:
	.word 0x8f902002  ! 328: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
change_to_randtl_6_144:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_144:
	.word 0x8f902000  ! 329: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902002  ! 330: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd4dfe000  ! 331: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
pmu_6_145:
	nop
	setx 0xfffff5f6ffffffa8, %g1, %g7
	.word 0xa3800007  ! 332: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d802000  ! 333: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_6_146:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d948003  ! 334: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
intveclr_6_147:
	setx 0x7225a9cbb090b545, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 335: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 336: WRASI_I	wr	%r0, 0x0058, %asi
splash_cmpr_6_148:
	setx 0x9097d86e5c27b1eb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b4  ! 338: Tcc_I	ta	icc_or_xcc, %r0 + 180
change_to_randtl_6_149:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_149:
	.word 0x8f902003  ! 339: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x2c800001  ! 340: BNEG	bneg,a	<label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6c6dcc  ! 341: SDIVX_I	sdivx	%r17, 0x0dcc, %r13
debug_6_151:
	nop
	setx debug_6_151 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 342: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_6_152:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 343: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd647e7a8  ! 344: LDSW_I	ldsw	[%r31 + 0x07a8], %r11
	.word 0xa145c000  ! 345: RD_TICK_CMPR_REG	rd	%-, %r16
splash_tba_6_153:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 346: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f80356d  ! 347: SIR	sir	0x156d
	.word 0x93d02032  ! 348: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8d902f9d  ! 349: WRPR_PSTATE_I	wrpr	%r0, 0x0f9d, %pstate
	.word 0x87802080  ! 350: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x81982bec  ! 351: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bec, %hpstate
	.word 0x3a800001  ! 352: BCC	bcc,a	<label_0x1>
	.word 0xe88804a0  ! 353: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
splash_cmpr_6_154:
	setx 0xa9e347a7c07260e7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 354: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_6_155:
	setx 0x3ab8d6026954705d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 355: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_6_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d94c011  ! 356: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
	.word 0x36700001  ! 357: BPGE	<illegal instruction>
mondo_6_157:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d90c009  ! 358: WRPR_WSTATE_R	wrpr	%r3, %r9, %wstate
DS_6_158:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f0, %f18, %f8
	.word 0x99b20311  ! 359: ALIGNADDRESS	alignaddr	%r8, %r17, %r12
	setx ivw_6_159, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_159:
	.word 0x95a0016a  ! 360: FABSq	dis not found

	.word 0xd26ff7b0  ! 361: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffff7b0]
splash_tba_6_160:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 362: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa9a509c0  ! 363: FDIVd	fdivd	%f20, %f0, %f20
	.word 0xd28008a0  ! 364: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
debug_6_161:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 365: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_6_162:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_162:
	.word 0x8f902000  ! 366: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa46b000a  ! 367: UDIVX_R	udivx 	%r12, %r10, %r18
	.word 0x81982c27  ! 368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c27, %hpstate
DS_6_163:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd134615a  ! 1: STQF_I	-	%f8, [0x015a, %r17]
	normalw
	.word 0x91458000  ! 369: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9693be2  ! 370: SDIVX_I	sdivx	%r4, 0xfffffbe2, %r20
	.word 0xd2d004a0  ! 371: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
debug_6_165:
	nop
	setx debug_6_165 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 372: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_6_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d950003  ! 373: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
	.word 0x8790207d  ! 374: WRPR_TT_I	wrpr	%r0, 0x007d, %tt
	.word 0x99902005  ! 375: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x28700001  ! 376: BPLEU	<illegal instruction>
	.word 0xa1902003  ! 377: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x87802088  ! 378: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x9481f2fd  ! 379: ADDcc_I	addcc 	%r7, 0xfffff2fd, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 380: LDX_R	ldx	[%r31 + %r0], %r19
tagged_6_167:
	taddcctv %r26, 0x1dff, %r23
	.word 0xe607f8ba  ! 381: LDUW_I	lduw	[%r31 + 0xfffff8ba], %r19
	.word 0xe61fc000  ! 382: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x93902002  ! 383: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982dbe  ! 384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dbe, %hpstate
	.word 0x26700001  ! 385: BPL	<illegal instruction>
mondo_6_168:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d940005  ! 386: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
	.word 0x93902002  ! 387: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_cmpr_6_169:
	setx 0x6688595e2fd41925, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 388: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_6_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d948010  ! 389: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
mondo_6_171:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d914007  ! 390: WRPR_WSTATE_R	wrpr	%r5, %r7, %wstate
	.word 0xa1902008  ! 391: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	setx ivw_6_172, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_172:
	.word 0x93a00172  ! 392: FABSq	dis not found

	setx 0x4ad5846e9a9b0eb0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_173:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_174:
	setx 0xdadad9c979643b49, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 394: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_175:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd711800c  ! 1: LDQF_R	-	[%r6, %r12], %f11
	.word 0x91a30824  ! 395: FADDs	fadds	%f12, %f4, %f8
mondo_6_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d930006  ! 396: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
	.word 0x819828a5  ! 397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08a5, %hpstate
	.word 0x8d802000  ! 398: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_6_177:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d930009  ! 399: WRPR_WSTATE_R	wrpr	%r12, %r9, %wstate
splash_cmpr_6_178:
	setx 0x61a5cf6b9bbc987b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 400: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_6_179, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_179:
	.word 0x93a00171  ! 401: FABSq	dis not found

splash_cmpr_6_180:
	setx 0xbcaba585005b6071, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 402: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_181:
	nop
	setx debug_6_181 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 403: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x97520000  ! 404: RDPR_PIL	<illegal instruction>
DS_6_182:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f12, %f22, %f4
	.word 0x97b50301  ! 405: ALIGNADDRESS	alignaddr	%r20, %r1, %r11
mondo_6_183:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d92c005  ! 406: WRPR_WSTATE_R	wrpr	%r11, %r5, %wstate
mondo_6_184:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d944004  ! 407: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
	.word 0x8198232e  ! 408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x032e, %hpstate
	.word 0x83d02035  ! 409: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x93902006  ! 410: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87802020  ! 411: WRASI_I	wr	%r0, 0x0020, %asi
mondo_6_185:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d91c00b  ! 412: WRPR_WSTATE_R	wrpr	%r7, %r11, %wstate
splash_tba_6_186:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 413: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_6_187:
	setx 0x456ee9866967c4b0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 414: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_6_188:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 415: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9281000b  ! 416: ADDcc_R	addcc 	%r4, %r11, %r9
	.word 0x99902005  ! 417: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xe46ff8ba  ! 418: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffff8ba]
DS_6_189:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x99b28311  ! 419: ALIGNADDRESS	alignaddr	%r10, %r17, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996c72ea  ! 420: SDIVX_I	sdivx	%r17, 0xfffff2ea, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196d  ! 421: FqTOd	dis not found

	.word 0x8d903dd0  ! 422: WRPR_PSTATE_I	wrpr	%r0, 0x1dd0, %pstate
	.word 0x91a4c9c7  ! 423: FDIVd	fdivd	%f50, %f38, %f8
tagged_6_192:
	tsubcctv %r11, 0x1da7, %r16
	.word 0xd007ec55  ! 424: LDUW_I	lduw	[%r31 + 0x0c55], %r8
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 425: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 426: LDX_R	ldx	[%r31 + %r0], %r8
debug_6_193:
	nop
	setx debug_6_193 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 427: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x83d02032  ! 428: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xd04fec55  ! 429: LDSB_I	ldsb	[%r31 + 0x0c55], %r8
	.word 0xd08fe000  ! 430: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x93520000  ! 432: RDPR_PIL	rdpr	%pil, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6ae788  ! 433: SDIVX_I	sdivx	%r11, 0x0788, %r13
mondo_6_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d92c011  ! 434: WRPR_WSTATE_R	wrpr	%r11, %r17, %wstate
debug_6_196:
	nop
	setx debug_6_196 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 435: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_6_197:
	taddcctv %r17, 0x1e93, %r26
	.word 0xe007ef0e  ! 436: LDUW_I	lduw	[%r31 + 0x0f0e], %r16
	.word 0x91d02033  ! 437: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe08008a0  ! 438: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x91d02034  ! 439: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_6_198:
	setx 0xfc86374e06fcb15e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 440: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_6_199:
	setx 0xf29c87cdb6b4281d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 441: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 442: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x9f803fb6  ! 443: SIR	sir	0x1fb6
intveclr_6_200:
	setx 0xcc5bf201c615f2f0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 444: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 445: Tcc_I	ta	icc_or_xcc, %r0 + 179
mondo_6_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d940012  ! 446: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
	.word 0x99902000  ! 447: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
mondo_6_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d930002  ! 448: WRPR_WSTATE_R	wrpr	%r12, %r2, %wstate
	.word 0xe137c00c  ! 449: STQF_R	-	%f16, [%r12, %r31]
	setx 0xd71943fb5d125f1c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_203:
	.word 0x39400001  ! 450: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902265  ! 451: WRPR_TT_I	wrpr	%r0, 0x0265, %tt
change_to_randtl_6_204:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_204:
	.word 0x8f902001  ! 452: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x9f803df6  ! 453: SIR	sir	0x1df6
	.word 0xa7500000  ! 454: RDPR_TPC	rdpr	%tpc, %r19
	.word 0x81982a5f  ! 455: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5f, %hpstate
debug_6_205:
	nop
	setx debug_6_205 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 456: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_6_206:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 457: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6cfdfb  ! 458: SDIVX_I	sdivx	%r19, 0xfffffdfb, %r13
tagged_6_208:
	tsubcctv %r10, 0x16ca, %r10
	.word 0xd007e283  ! 459: LDUW_I	lduw	[%r31 + 0x0283], %r8
	.word 0xd08008a0  ! 460: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
debug_6_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 461: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802014  ! 462: WRASI_I	wr	%r0, 0x0014, %asi
change_to_randtl_6_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_210:
	.word 0x8f902002  ! 463: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd09fe283  ! 464: LDDA_I	ldda	[%r31, + 0x0283] %asi, %r8
	.word 0x9081c012  ! 465: ADDcc_R	addcc 	%r7, %r18, %r8
	.word 0x9f803d6b  ! 466: SIR	sir	0x1d6b
	.word 0x8790215e  ! 467: WRPR_TT_I	wrpr	%r0, 0x015e, %tt
debug_6_211:
	nop
	setx debug_6_211 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 468: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe4c004a0  ! 469: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r18
	.word 0xe4c7e010  ! 470: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r18
	.word 0xe48008a0  ! 471: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 472: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_6_212:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 473: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x879023c4  ! 474: WRPR_TT_I	wrpr	%r0, 0x03c4, %tt
splash_tba_6_213:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 475: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_6_214:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 476: SAVE_R	save	%r31, %r0, %r31
	.word 0xe4880e60  ! 477: LDUBA_R	lduba	[%r0, %r0] 0x73, %r18
debug_6_215:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 478: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe4c804a0  ! 479: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r18
	.word 0x9ba109d0  ! 480: FDIVd	fdivd	%f4, %f16, %f44
	.word 0x93902007  ! 481: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
intveclr_6_216:
	setx 0x86cea8b23cbe7d67, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_6_217:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xdb310009  ! 1: STQF_R	-	%f13, [%r9, %r4]
	normalw
	.word 0x91458000  ! 483: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x87802004  ! 484: WRASI_I	wr	%r0, 0x0004, %asi
debug_6_218:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 485: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x26700001  ! 486: BPL	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01973  ! 487: FqTOd	dis not found

splash_cmpr_6_220:
	setx 0x12a8a8f0687312fd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 488: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 489: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 490: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe897e020  ! 491: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r20
	.word 0xe8880e80  ! 492: LDUBA_R	lduba	[%r0, %r0] 0x74, %r20
intveclr_6_221:
	setx 0xe7fe38d22776eb70, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 493: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe847e9df  ! 494: LDSW_I	ldsw	[%r31 + 0x09df], %r20
	.word 0xe827e9df  ! 495: STW_I	stw	%r20, [%r31 + 0x09df]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56a3a26  ! 496: SDIVX_I	sdivx	%r8, 0xfffffa26, %r18
	.word 0x9f803f3a  ! 497: SIR	sir	0x1f3a
	.word 0x91454000  ! 498: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0xd0dfe030  ! 499: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r8
	.word 0x8780201c  ! 500: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd127c003  ! 501: STF_R	st	%f8, [%r3, %r31]
	.word 0x81982324  ! 502: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0324, %hpstate
splash_tba_6_223:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 503: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x99902004  ! 504: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xd0d7e020  ! 505: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 506: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_6_224:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xe3704af0	! Random illegal ?
	.word 0xe5150005  ! 1: LDQF_R	-	[%r20, %r5], %f18
	.word 0x97a4c821  ! 507: FADDs	fadds	%f19, %f1, %f11
	.word 0x87902084  ! 508: WRPR_TT_I	wrpr	%r0, 0x0084, %tt
splash_lsu_6_225:
	setx 0x1c1f01103534a0c1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 509: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd2800c80  ! 510: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r9
	.word 0xd25ff2d8  ! 511: LDX_I	ldx	[%r31 + 0xfffff2d8], %r9
	.word 0x819824ae  ! 512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04ae, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_226)) -> intp(5,0,13)
intvec_6_226:
	.word 0x39400001  ! 513: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 514: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d9037c4  ! 515: WRPR_PSTATE_I	wrpr	%r0, 0x17c4, %pstate
	.word 0xa1902008  ! 516: WRPR_GL_I	wrpr	%r0, 0x0008, %-
intveclr_6_227:
	setx 0xeecb4da5ee7b0455, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 517: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_6_228:
	nop
	setx donretarg_6_228, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r3, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_228:
	.word 0xd2fff2d8  ! 518: SWAPA_I	swapa	%r9, [%r31 + 0xfffff2d8] %asi
	.word 0x81982794  ! 519: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0794, %hpstate
	.word 0x81b01021  ! 520: SIAM	siam	1
	.word 0xd2c004a0  ! 521: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	.word 0x38700001  ! 522: BPGU	<illegal instruction>
	.word 0x2e800001  ! 523: BVS	bvs,a	<label_0x1>
tagged_6_229:
	taddcctv %r7, 0x1540, %r17
	.word 0xd207f2d8  ! 524: LDUW_I	lduw	[%r31 + 0xfffff2d8], %r9
intveclr_6_230:
	setx 0x163b3a364bb377be, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_231:
	setx 0x98e6297a987fa03a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 526: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902009  ! 527: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x96c2e59a  ! 528: ADDCcc_I	addccc 	%r11, 0x059a, %r11
	.word 0x87802080  ! 529: WRASI_I	wr	%r0, 0x0080, %asi
splash_cmpr_6_232:
	setx 0xee2a6e2e285183c3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 530: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_6_233:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d944001  ! 531: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
	.word 0x879023c5  ! 532: WRPR_TT_I	wrpr	%r0, 0x03c5, %tt
	.word 0x91d020b2  ! 533: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xe48008a0  ! 534: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa5a009cc  ! 535: FDIVd	fdivd	%f0, %f12, %f18
	.word 0xe8dfe020  ! 536: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r20
	.word 0xa3a449c9  ! 537: FDIVd	fdivd	%f48, %f40, %f48
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9168743b  ! 538: SDIVX_I	sdivx	%r1, 0xfffff43b, %r8
	.word 0x99540000  ! 539: RDPR_GL	rdpr	%-, %r12
	.word 0xd6dfe000  ! 540: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
splash_tba_6_235:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 541: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x95480000  ! 542: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 543: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_6_236:
	tsubcctv %r5, 0x1490, %r15
	.word 0xe607e600  ! 544: LDUW_I	lduw	[%r31 + 0x0600], %r19
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 545: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_6_237:
	setx 0xe46d99e73c2e3e2c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 546: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_6_238:
	setx 0xacfed820f060169d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879021bc  ! 548: WRPR_TT_I	wrpr	%r0, 0x01bc, %tt
	setx 0xf8cce42c7c7d0385, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_239:
	.word 0x39400001  ! 549: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_6_240:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d914003  ! 550: WRPR_WSTATE_R	wrpr	%r5, %r3, %wstate
intveclr_6_241:
	setx 0x830f33dec18c6b0b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 551: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879021fa  ! 552: WRPR_TT_I	wrpr	%r0, 0x01fa, %tt
	.word 0xe6c7e030  ! 553: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r19
	.word 0x93902006  ! 554: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe68008a0  ! 555: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x97454000  ! 556: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
tagged_6_242:
	tsubcctv %r19, 0x11d1, %r14
	.word 0xe807e600  ! 557: LDUW_I	lduw	[%r31 + 0x0600], %r20
debug_6_243:
	nop
	setx debug_6_243 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 558: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x22800001  ! 559: BE	be,a	<label_0x1>
intveclr_6_244:
	setx 0x34297f23a6f489e5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 560: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_245:
	setx 0x107b2ce946516ebf, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 561: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902c21  ! 562: WRPR_PSTATE_I	wrpr	%r0, 0x0c21, %pstate
debug_6_246:
	nop
	setx debug_6_246 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 563: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0xbae8a507825c23e2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_247:
	.word 0x39400001  ! 564: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_6_248:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 565: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_6_249:
	setx 0x1f0ab49baac17604, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 566: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902003  ! 567: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x87802089  ! 568: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xa753c000  ! 569: RDPR_FQ	<illegal instruction>
	.word 0xa7a00573  ! 570: FSQRTq	fsqrt	
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 571: LDX_R	ldx	[%r31 + %r0], %r9
debug_6_250:
	nop
	setx debug_6_250 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 572: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01972  ! 573: FqTOd	dis not found

	.word 0xa1b30feb  ! 574: FONES	e	%f16
splash_cmpr_6_252:
	setx 0xe0cf56ebf71165e8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 575: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 576: LDX_R	ldx	[%r31 + %r0], %r11
	setx 0x1257d08e0fd2763d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_253:
	.word 0x39400001  ! 577: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6c7e020  ! 578: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
	.word 0x8d9032b9  ! 579: WRPR_PSTATE_I	wrpr	%r0, 0x12b9, %pstate
	.word 0x91d020b5  ! 580: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x87802010  ! 581: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd737c004  ! 582: STQF_R	-	%f11, [%r4, %r31]
	.word 0xa66d000b  ! 583: UDIVX_R	udivx 	%r20, %r11, %r19
splash_cmpr_6_254:
	setx 0x767d7c9a731f3000, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 584: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_255:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd510000b  ! 1: LDQF_R	-	[%r0, %r11], %f10
	.word 0x91a1c827  ! 585: FADDs	fadds	%f7, %f7, %f8
mondo_6_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d948010  ! 586: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	.word 0xe53fc00a  ! 587: STDF_R	std	%f18, [%r10, %r31]
tagged_6_257:
	taddcctv %r11, 0x14f2, %r22
	.word 0xe407e600  ! 588: LDUW_I	lduw	[%r31 + 0x0600], %r18
pmu_6_258:
	nop
	setx 0xfffffa13fffff08f, %g1, %g7
	.word 0xa3800007  ! 589: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xad806295  ! 590: WR_SOFTINT_REG_I	wr	%r1, 0x0295, %softint
tagged_6_259:
	taddcctv %r2, 0x16a7, %r5
	.word 0xe407e4ec  ! 591: LDUW_I	lduw	[%r31 + 0x04ec], %r18
	.word 0x95520000  ! 592: RDPR_PIL	<illegal instruction>
change_to_randtl_6_260:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_260:
	.word 0x8f902001  ! 593: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd827e4ec  ! 594: STW_I	stw	%r12, [%r31 + 0x04ec]
	.word 0x81460000  ! 595: RD_STICK_REG	stbar
mondo_6_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d944011  ! 596: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
	.word 0x8d9038e8  ! 597: WRPR_PSTATE_I	wrpr	%r0, 0x18e8, %pstate
	.word 0x87902167  ! 598: WRPR_TT_I	wrpr	%r0, 0x0167, %tt
	.word 0x8d9029db  ! 599: WRPR_PSTATE_I	wrpr	%r0, 0x09db, %pstate
	.word 0x81982f2d  ! 600: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f2d, %hpstate
	.word 0x93902007  ! 601: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81460000  ! 602: RD_STICK_REG	stbar
	.word 0x26800001  ! 603: BL	bl,a	<label_0x1>
debug_6_262:
	nop
	setx debug_6_262 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 604: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902001  ! 605: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_tba_6_263:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 606: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_6_264:
	nop
	setx debug_6_264 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 607: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81982c8d  ! 608: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8d, %hpstate
change_to_randtl_6_265:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_265:
	.word 0x8f902000  ! 609: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902004  ! 610: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd8c7e030  ! 611: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r12
intveclr_6_266:
	setx 0xbb8e84c4c4186baa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 612: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 613: WRPR_GL_I	wrpr	%r0, 0x0004, %-
debug_6_267:
	nop
	setx debug_6_267 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 614: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd8cfe030  ! 615: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r12
debug_6_268:
	nop
	setx debug_6_268 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 616: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_6_269:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d900010  ! 617: WRPR_WSTATE_R	wrpr	%r0, %r16, %wstate
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 618: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_tba_6_270:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 619: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x28700001  ! 620: BPLEU	<illegal instruction>
	.word 0x93902000  ! 621: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_6_271:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d900009  ! 622: WRPR_WSTATE_R	wrpr	%r0, %r9, %wstate
splash_lsu_6_272:
	setx 0x2b57e2a5a3026d8d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 623: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_6_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d904008  ! 624: WRPR_WSTATE_R	wrpr	%r1, %r8, %wstate
	.word 0xd8880e60  ! 625: LDUBA_R	lduba	[%r0, %r0] 0x73, %r12
splash_cmpr_6_274:
	setx 0x3817e86c0eebe990, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 626: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 627: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_6_275:
	setx 0x0fd3d1903138b825, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 628: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 629: BL	bl,a	<label_0x1>
mondo_6_276:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d944007  ! 630: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
	setx ivw_6_277, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_277:
	.word 0x9ba00174  ! 631: FABSq	dis not found

	.word 0xd4c00e80  ! 632: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r10
splash_cmpr_6_278:
	setx 0x39d487022e80038f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 633: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xa7a01a70  ! 635: FqTOi	fqtoi	
	.word 0xd647e4ec  ! 636: LDSW_I	ldsw	[%r31 + 0x04ec], %r11
debug_6_279:
	nop
	setx debug_6_279 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 637: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95687ce1  ! 638: SDIVX_I	sdivx	%r1, 0xfffffce1, %r10
splash_tba_6_281:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 639: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_6_282:
	setx 0x63d617697ac5f3c5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 640: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_6_283:
	nop
	setx debug_6_283 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 641: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_284)) -> intp(2,0,5)
intvec_6_284:
	.word 0x39400001  ! 642: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 643: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6d30f5  ! 644: SDIVX_I	sdivx	%r20, 0xfffff0f5, %r13
	.word 0xd2d004a0  ! 645: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01973  ! 646: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76a2d10  ! 647: SDIVX_I	sdivx	%r8, 0x0d10, %r19
pmu_6_288:
	nop
	setx 0xfffffc66fffff8c5, %g1, %g7
	.word 0xa3800007  ! 648: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 649: LDX_R	ldx	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 650: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe01ff035  ! 651: LDD_I	ldd	[%r31 + 0xfffff035], %r16
mondo_6_289:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d950000  ! 652: WRPR_WSTATE_R	wrpr	%r20, %r0, %wstate
splash_lsu_6_290:
	setx 0xf6ccc2d1eed9ff8b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 653: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_6_291:
	nop
	setx debug_6_291 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 654: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902002  ! 655: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982d46  ! 656: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d46, %hpstate
tagged_6_292:
	tsubcctv %r18, 0x1dc0, %r14
	.word 0xe007f035  ! 657: LDUW_I	lduw	[%r31 + 0xfffff035], %r16
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01961  ! 658: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36aab5d  ! 659: SDIVX_I	sdivx	%r10, 0x0b5d, %r17
	.word 0x81510000  ! 660: RDPR_TICK	rdpr	%tick, %r0
	setx 0x0a9d0fadd05e1316, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_295:
	.word 0x39400001  ! 661: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_6_296:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 662: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_6_297:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe3324001  ! 1: STQF_R	-	%f17, [%r1, %r9]
	normalw
	.word 0x99458000  ! 663: RD_SOFTINT_REG	rd	%softint, %r12
pmu_6_298:
	nop
	setx 0xfffffac5fffff7db, %g1, %g7
	.word 0xa3800007  ! 664: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_6_299:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_299:
	.word 0x8f902000  ! 665: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_6_300:
	nop
	setx debug_6_300 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 666: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902003  ! 667: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd68008a0  ! 668: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_tba_6_301:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 669: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_302)) -> intp(0,0,21)
intvec_6_302:
	.word 0x39400001  ! 670: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_6_303:
	set 0x003a0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 671: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_6_304:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d91c009  ! 672: WRPR_WSTATE_R	wrpr	%r7, %r9, %wstate
	.word 0xd6880e40  ! 673: LDUBA_R	lduba	[%r0, %r0] 0x72, %r11
	.word 0xd68008a0  ! 674: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	setx 0x8bc8322c4015e5ec, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_305:
	.word 0x39400001  ! 675: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 676: WRASI_I	wr	%r0, 0x0010, %asi
	setx ivw_6_306, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_306:
	.word 0x95a00174  ! 677: FABSq	dis not found

	.word 0x9545c000  ! 678: RD_TICK_CMPR_REG	rd	%-, %r10
splash_lsu_6_307:
	setx 0x6329d43544b5db5f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 679: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_6_308:
	tsubcctv %r5, 0x1d85, %r1
	.word 0xe807eed1  ! 680: LDUW_I	lduw	[%r31 + 0x0ed1], %r20
splash_cmpr_6_309:
	setx 0x4686978a92cae0b6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 681: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902355  ! 682: WRPR_TT_I	wrpr	%r0, 0x0355, %tt
tagged_6_310:
	tsubcctv %r9, 0x1626, %r4
	.word 0xe807eed1  ! 683: LDUW_I	lduw	[%r31 + 0x0ed1], %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996ca4cb  ! 684: SDIVX_I	sdivx	%r18, 0x04cb, %r12
change_to_randtl_6_312:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_312:
	.word 0x8f902001  ! 685: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_6_313:
	nop
	setx debug_6_313 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 686: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_6_314:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_314:
	.word 0x8f902000  ! 687: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
mondo_6_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d900003  ! 688: WRPR_WSTATE_R	wrpr	%r0, %r3, %wstate
	.word 0x93902000  ! 689: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
debug_6_316:
	nop
	setx debug_6_316 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 690: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x3842a0d914f6b33e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_317:
	.word 0x39400001  ! 691: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 692: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 693: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xad827eb4  ! 694: WR_SOFTINT_REG_I	wr	%r9, 0x1eb4, %softint
	.word 0x87802016  ! 695: WRASI_I	wr	%r0, 0x0016, %asi
change_to_randtl_6_318:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_318:
	.word 0x8f902002  ! 696: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01971  ! 697: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36d3bf8  ! 698: SDIVX_I	sdivx	%r20, 0xfffffbf8, %r17
debug_6_321:
	nop
	setx debug_6_321 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 699: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_6_322:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 700: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_6_323:
	taddcctv %r15, 0x1214, %r17
	.word 0xe407f52a  ! 701: LDUW_I	lduw	[%r31 + 0xfffff52a], %r18
mondo_6_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d920011  ! 702: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 703: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90294b  ! 704: WRPR_PSTATE_I	wrpr	%r0, 0x094b, %pstate
	.word 0x97a01a65  ! 705: FqTOi	fqtoi	
	.word 0x819825ec  ! 706: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05ec, %hpstate
	setx ivw_6_325, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_325:
	.word 0x97a00173  ! 707: FABSq	dis not found

	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 708: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 709: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x81982556  ! 710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0556, %hpstate
	.word 0xd237f52a  ! 711: STH_I	sth	%r9, [%r31 + 0xfffff52a]
	.word 0x9f8038c8  ! 712: SIR	sir	0x18c8
	.word 0xd317c000  ! 713: LDQF_R	-	[%r31, %r0], %f9
splash_cmpr_6_326:
	setx 0x64185d8abd978d2b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 714: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 715: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_tba_6_327:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 716: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_6_328:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d948012  ! 717: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
	.word 0xd337e0ec  ! 718: STQF_I	-	%f9, [0x00ec, %r31]
	.word 0x95454000  ! 719: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	.word 0x99902002  ! 720: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xd48008a0  ! 721: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_cmpr_6_329:
	setx 0x09147f43dcbe21c3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 722: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_330:
	setx 0x12245f1e61a5c992, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 723: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_6_331, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_331:
	.word 0x9ba00162  ! 724: FABSq	dis not found

splash_tba_6_332:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 725: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790218c  ! 726: WRPR_TT_I	wrpr	%r0, 0x018c, %tt
	.word 0x91d02034  ! 727: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe20fe0ec  ! 728: LDUB_I	ldub	[%r31 + 0x00ec], %r17
	.word 0x81510000  ! 729: RDPR_TICK	rdpr	%tick, %r0
	setx ivw_6_333, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_333:
	.word 0xa5a00162  ! 730: FABSq	dis not found

	.word 0x91d02032  ! 731: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_6_334:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d934004  ! 732: WRPR_WSTATE_R	wrpr	%r13, %r4, %wstate
	.word 0x93902006  ! 733: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87802004  ! 734: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802080  ! 735: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xe917c000  ! 736: LDQF_R	-	[%r31, %r0], %f20
	setx ivw_6_335, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_335:
	.word 0x93a00166  ! 737: FABSq	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_336)) -> intp(3,0,6)
intvec_6_336:
	.word 0x39400001  ! 738: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_6_337:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x99a00542  ! 1: FSQRTd	fsqrt	
	.word 0x9ba28831  ! 739: FADDs	fadds	%f10, %f17, %f13
change_to_randtl_6_338:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_338:
	.word 0x8f902001  ! 740: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_6_339:
	setx 0xd91e475f9ec943b5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 741: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe68008a0  ! 742: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
debug_6_340:
	nop
	setx debug_6_340 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 743: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6c3de7  ! 744: SDIVX_I	sdivx	%r16, 0xfffffde7, %r13
splash_htba_6_342:
	set 0x003a0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 745: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd01ffb39  ! 746: LDD_I	ldd	[%r31 + 0xfffffb39], %r8
	.word 0x2a800001  ! 747: BCS	bcs,a	<label_0x1>
	.word 0x93902005  ! 748: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_6_343:
	setx 0x532d8e710244504f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 749: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93a309d2  ! 750: FDIVd	fdivd	%f12, %f18, %f40
	.word 0xad82ab08  ! 751: WR_SOFTINT_REG_I	wr	%r10, 0x0b08, %softint
debug_6_344:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 752: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa3454000  ! 753: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0x87902138  ! 754: WRPR_TT_I	wrpr	%r0, 0x0138, %tt
	.word 0xe28804a0  ! 755: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 756: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_6_345:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 757: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x8d903363  ! 758: WRPR_PSTATE_I	wrpr	%r0, 0x1363, %pstate
	.word 0x879021e7  ! 759: WRPR_TT_I	wrpr	%r0, 0x01e7, %tt
DS_6_346:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f26, %f4, %f20
	.word 0xa3b50308  ! 760: ALIGNADDRESS	alignaddr	%r20, %r8, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01968  ! 761: FqTOd	dis not found

	.word 0xda4fc000  ! 762: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01974  ! 763: FqTOd	dis not found

	.word 0xa1902006  ! 764: WRPR_GL_I	wrpr	%r0, 0x0006, %-
mondo_6_349:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d928014  ! 765: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
	.word 0xd327ed48  ! 766: STF_I	st	%f9, [0x0d48, %r31]
	.word 0xd2c80e60  ! 767: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 768: LDX_R	ldx	[%r31 + %r0], %r9
DS_6_350:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 769: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd257ed48  ! 770: LDSH_I	ldsh	[%r31 + 0x0d48], %r9
	.word 0xd28fe030  ! 771: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r9
DS_6_351:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa1b28314  ! 772: ALIGNADDRESS	alignaddr	%r10, %r20, %r16
	.word 0xab804013  ! 773: WR_CLEAR_SOFTINT_R	wr	%r1, %r19, %clear_softint
	.word 0xe457c000  ! 774: LDSH_R	ldsh	[%r31 + %r0], %r18
intveclr_6_352:
	setx 0x240098b413f9848e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 775: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_6_353:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d918006  ! 776: WRPR_WSTATE_R	wrpr	%r6, %r6, %wstate
mondo_6_354:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d948005  ! 777: WRPR_WSTATE_R	wrpr	%r18, %r5, %wstate
	.word 0xe41fc000  ! 778: LDD_R	ldd	[%r31 + %r0], %r18
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 779: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01963  ! 780: FqTOd	dis not found

	.word 0xd037ed48  ! 781: STH_I	sth	%r8, [%r31 + 0x0d48]
splash_lsu_6_356:
	setx 0x83ffcf517b866169, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 782: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_6_357:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 783: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xd11fed48  ! 784: LDDF_I	ldd	[%r31, 0x0d48], %f8
debug_6_358:
	nop
	setx debug_6_358 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 785: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_6_359:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb144007  ! 1: LDQF_R	-	[%r17, %r7], %f13
	.word 0x99a4882b  ! 786: FADDs	fadds	%f18, %f11, %f12
splash_cmpr_6_360:
	setx 0xc5b5099b3515e5b0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 787: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 788: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 789: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01964  ! 790: FqTOd	dis not found

	.word 0x8d9029a4  ! 791: WRPR_PSTATE_I	wrpr	%r0, 0x09a4, %pstate
	.word 0xe6800ac0  ! 792: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r19
splash_cmpr_6_362:
	setx 0xae8d45e0e5588a0a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 793: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xf9258167f73e1df9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_363:
	.word 0x39400001  ! 794: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 795: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x20700001  ! 796: BPN	<illegal instruction>
	.word 0xe67fed48  ! 797: SWAP_I	swap	%r19, [%r31 + 0x0d48]
	.word 0x8d902fd7  ! 798: WRPR_PSTATE_I	wrpr	%r0, 0x0fd7, %pstate
change_to_randtl_6_364:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_364:
	.word 0x8f902000  ! 799: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 800: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe677c007  ! 801: STX_R	stx	%r19, [%r31 + %r7]
	.word 0xe6c7e010  ! 802: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r19
splash_htba_6_365:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 803: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_6_366:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d950013  ! 804: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
	setx ivw_6_367, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_367:
	.word 0xa7a0016b  ! 805: FABSq	dis not found

	.word 0x87902381  ! 806: WRPR_TT_I	wrpr	%r0, 0x0381, %tt
	.word 0x93d02034  ! 807: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xa950c000  ! 808: RDPR_TT	<illegal instruction>
	.word 0x8d903278  ! 809: WRPR_PSTATE_I	wrpr	%r0, 0x1278, %pstate
	.word 0x8790236e  ! 810: WRPR_TT_I	wrpr	%r0, 0x036e, %tt
	.word 0xe4800c40  ! 811: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r18
	.word 0xe537ed48  ! 812: STQF_I	-	%f18, [0x0d48, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 813: LDX_R	ldx	[%r31 + %r0], %r18
mondo_6_368:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d920014  ! 814: WRPR_WSTATE_R	wrpr	%r8, %r20, %wstate
	setx 0x44fa3059a444fec2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_369:
	.word 0x39400001  ! 815: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_6_370:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d918004  ! 816: WRPR_WSTATE_R	wrpr	%r6, %r4, %wstate
tagged_6_371:
	taddcctv %r18, 0x1df5, %r13
	.word 0xe407ed48  ! 817: LDUW_I	lduw	[%r31 + 0x0d48], %r18
splash_cmpr_6_372:
	setx 0x7953c2d7bdc64cfb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 818: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_373:
	nop
	setx debug_6_373 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 819: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 820: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe4880e40  ! 821: LDUBA_R	lduba	[%r0, %r0] 0x72, %r18
mondo_6_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d91c012  ! 822: WRPR_WSTATE_R	wrpr	%r7, %r18, %wstate
	.word 0xa1a1cdd2  ! 823: FdMULq	fdmulq	
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 824: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903caf  ! 825: WRPR_PSTATE_I	wrpr	%r0, 0x1caf, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 826: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4dfe010  ! 827: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r10
	.word 0xab81400b  ! 828: WR_CLEAR_SOFTINT_R	wr	%r5, %r11, %clear_softint
	.word 0xd46fed48  ! 829: LDSTUB_I	ldstub	%r10, [%r31 + 0x0d48]
	setx 0x82568418c20d4d80, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_375:
	.word 0x39400001  ! 830: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_6_376:
	nop
	setx debug_6_376 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 831: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x879021a5  ! 832: WRPR_TT_I	wrpr	%r0, 0x01a5, %tt
	setx ivw_6_377, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_377:
	.word 0x93a00173  ! 833: FABSq	dis not found

	.word 0x91540000  ! 834: RDPR_GL	rdpr	%-, %r8
	.word 0xd73fed48  ! 835: STDF_I	std	%f11, [0x0d48, %r31]
	.word 0xa1902003  ! 836: WRPR_GL_I	wrpr	%r0, 0x0003, %-
DS_6_378:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xe151b9cb	! Random illegal ?
	.word 0x93a00543  ! 1: FSQRTd	fsqrt	
	.word 0x91a3482a  ! 837: FADDs	fadds	%f13, %f10, %f8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 838: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd69004a0  ! 839: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0x93902004  ! 840: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_6_379:
	nop
	setx debug_6_379 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 841: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_6_380:
	setx 0x5b7d20ae799ebab0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 842: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_6_381:
	setx 0x119c787f5bab6b0d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 843: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 844: RDPR_TICK	rdpr	%tick, %r0
	setx ivw_6_382, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_382:
	.word 0x9ba0016c  ! 845: FABSq	dis not found

	.word 0xd89004a0  ! 846: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0xd91fc000  ! 847: LDDF_R	ldd	[%r31, %r0], %f12
change_to_randtl_6_383:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_383:
	.word 0x8f902001  ! 848: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd8800aa0  ! 849: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r12
splash_tba_6_384:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 850: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_6_385:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd1144011  ! 1: LDQF_R	-	[%r17, %r17], %f8
	.word 0x95a14830  ! 851: FADDs	fadds	%f5, %f16, %f10
debug_6_386:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 852: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6b62b3  ! 853: SDIVX_I	sdivx	%r13, 0x02b3, %r13
	.word 0xe647f42d  ! 854: LDSW_I	ldsw	[%r31 + 0xfffff42d], %r19
	.word 0xe717c000  ! 855: LDQF_R	-	[%r31, %r0], %f19
	.word 0x87802089  ! 856: WRASI_I	wr	%r0, 0x0089, %asi
intveclr_6_388:
	setx 0xda38e816fd1c71c3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 857: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_6_389:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd5310014  ! 1: STQF_R	-	%f10, [%r20, %r4]
	normalw
	.word 0x9b458000  ! 858: RD_SOFTINT_REG	rd	%softint, %r13
debug_6_390:
	nop
	setx debug_6_390 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 859: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902cc4  ! 860: WRPR_PSTATE_I	wrpr	%r0, 0x0cc4, %pstate
	.word 0xad81e88d  ! 861: WR_SOFTINT_REG_I	wr	%r7, 0x088d, %softint
splash_cmpr_6_391:
	setx 0x4c3b17ad7b0c2e6c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 862: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_392:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xd177cf5d	! Random illegal ?
	.word 0xd5148000  ! 1: LDQF_R	-	[%r18, %r0], %f10
	.word 0xa9a2c824  ! 863: FADDs	fadds	%f11, %f4, %f20
	.word 0xd88804a0  ! 864: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
splash_cmpr_6_393:
	setx 0xc0656ed6ac5ec423, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 865: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_394:
	nop
	setx debug_6_394 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 866: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd8d004a0  ! 867: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0x91480000  ! 868: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	setx 0xbb377a38fd4ee256, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_395:
	.word 0x39400001  ! 869: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x96da400d  ! 870: SMULcc_R	smulcc 	%r9, %r13, %r11
	.word 0xa1902009  ! 871: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_lsu_6_396:
	setx 0xd10e403b0939c721, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 872: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_6_397:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_397:
	.word 0x8f902001  ! 873: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe63ff1d4  ! 874: STD_I	std	%r19, [%r31 + 0xfffff1d4]
splash_cmpr_6_398:
	setx 0x227341982128bf58, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 875: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_399:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd132c012  ! 1: STQF_R	-	%f8, [%r18, %r11]
	normalw
	.word 0x91458000  ! 876: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x93902006  ! 877: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa1902001  ! 878: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 879: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879020ea  ! 880: WRPR_TT_I	wrpr	%r0, 0x00ea, %tt
splash_cmpr_6_400:
	setx 0x98706a7997a71a37, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 881: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02032  ! 882: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x22700001  ! 883: BPE	<illegal instruction>
	.word 0xe317c000  ! 884: LDQF_R	-	[%r31, %r0], %f17
	.word 0x8d902765  ! 885: WRPR_PSTATE_I	wrpr	%r0, 0x0765, %pstate
splash_cmpr_6_401:
	setx 0x17a1cb1f697d5a8a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 886: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe2d00e60  ! 887: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r17
splash_lsu_6_402:
	setx 0xdd092bb9936978b5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 888: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_6_403:
	setx 0xe1bffb5e77b59e75, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 889: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 890: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa7a149d4  ! 891: FDIVd	fdivd	%f36, %f20, %f50
DS_6_404:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd9350000  ! 1: STQF_R	-	%f12, [%r0, %r20]
	normalw
	.word 0x93458000  ! 892: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8d9026a6  ! 893: WRPR_PSTATE_I	wrpr	%r0, 0x06a6, %pstate
	.word 0x8d902136  ! 894: WRPR_PSTATE_I	wrpr	%r0, 0x0136, %pstate
	.word 0x8d9038f2  ! 895: WRPR_PSTATE_I	wrpr	%r0, 0x18f2, %pstate
splash_cmpr_6_405:
	setx 0xaaa83beae1d32f6a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 896: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2a800001  ! 897: BCS	bcs,a	<label_0x1>
splash_cmpr_6_406:
	setx 0xbd98b3b022403a73, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 898: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_407:
	setx 0xa9455f487c997deb, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 899: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_408)) -> intp(3,0,15)
intvec_6_408:
	.word 0x39400001  ! 900: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_6_409:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d914001  ! 901: WRPR_WSTATE_R	wrpr	%r5, %r1, %wstate
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 902: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 903: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01972  ! 904: FqTOd	dis not found

pmu_6_411:
	nop
	setx 0xfffff266fffffc3b, %g1, %g7
	.word 0xa3800007  ! 905: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_6_412:
	setx 0x33fffd06f2503f6e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 906: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9145c000  ! 907: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0xd86ff1d4  ! 908: LDSTUB_I	ldstub	%r12, [%r31 + 0xfffff1d4]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 909: LDX_R	ldx	[%r31 + %r0], %r12
tagged_6_413:
	taddcctv %r2, 0x1797, %r7
	.word 0xd807f1d4  ! 910: LDUW_I	lduw	[%r31 + 0xfffff1d4], %r12
DS_6_414:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd3333dad  ! 1: STQF_I	-	%f9, [0x1dad, %r12]
	normalw
	.word 0xa1458000  ! 911: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x8d802004  ! 912: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x91d020b4  ! 913: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x879021ca  ! 914: WRPR_TT_I	wrpr	%r0, 0x01ca, %tt
	.word 0x83d020b5  ! 915: Tcc_I	te	icc_or_xcc, %r0 + 181
splash_cmpr_6_415:
	setx 0x521a9d8adb91c9a4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 916: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_6_416:
	setx 0x3a53ed98e743fc76, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 917: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_6_417:
	nop
	setx debug_6_417 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 918: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx ivw_6_418, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_418:
	.word 0x99a00167  ! 919: FABSq	dis not found

	.word 0x93902007  ! 920: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
debug_6_419:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 921: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd397ea29  ! 922: LDQFA_I	-	[%r31, 0x0a29], %f9
	.word 0x879023ab  ! 923: WRPR_TT_I	wrpr	%r0, 0x03ab, %tt
	.word 0xd33fc012  ! 924: STDF_R	std	%f9, [%r18, %r31]
	.word 0xa1902000  ! 925: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa1902003  ! 926: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd25fea29  ! 927: LDX_I	ldx	[%r31 + 0x0a29], %r9
	setx ivw_6_420, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_420:
	.word 0x91a00168  ! 928: FABSq	dis not found

	.word 0xdac7e010  ! 929: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01971  ! 930: FqTOd	dis not found

intveclr_6_422:
	setx 0x3937af348ccde3fa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 931: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_6_423:
	nop
	setx debug_6_423 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 932: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x819826dd  ! 933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06dd, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 934: Tcc_R	te	icc_or_xcc, %r0 + %r30
mondo_6_424:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d91c013  ! 935: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
	.word 0xd21fc000  ! 936: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01974  ! 937: FqTOd	dis not found

mondo_6_426:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d934009  ! 938: WRPR_WSTATE_R	wrpr	%r13, %r9, %wstate
	.word 0x87802020  ! 939: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x93902007  ! 940: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd43fc00d  ! 941: STD_R	std	%r10, [%r31 + %r13]
	.word 0xd48fe020  ! 942: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	.word 0x94d8800c  ! 943: SMULcc_R	smulcc 	%r2, %r12, %r10
	.word 0xd00fc000  ! 944: LDUB_R	ldub	[%r31 + %r0], %r8
	.word 0x93902006  ! 945: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
donret_6_427:
	nop
	setx donretarg_6_427, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r15, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_427:
	.word 0xd0ffea29  ! 946: SWAPA_I	swapa	%r8, [%r31 + 0x0a29] %asi
DS_6_428:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 947: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd09fc020  ! 948: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
splash_lsu_6_429:
	setx 0x0858f6d381dcd081, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 949: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 950: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xd0d7e010  ! 951: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
splash_lsu_6_430:
	setx 0xa75bcda5f4d1b8e3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 952: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 953: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01971  ! 954: FqTOd	dis not found

	.word 0x93902000  ! 955: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa190200f  ! 956: WRPR_GL_I	wrpr	%r0, 0x000f, %-
debug_6_432:
	nop
	setx debug_6_432 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 957: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_6_433:
	setx 0x5ab30bbb855cb3d1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 958: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_6_434:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd7344010  ! 1: STQF_R	-	%f11, [%r16, %r17]
	normalw
	.word 0x99458000  ! 959: RD_SOFTINT_REG	rd	%softint, %r12
splash_htba_6_435:
	set 0x003a0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 960: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x9f802a57  ! 961: SIR	sir	0x0a57
	.word 0xd68008a0  ! 962: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 963: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_6_436:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_436:
	.word 0x8f902002  ! 964: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x99902001  ! 965: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_cmpr_6_437:
	setx 0x9f78dce582a702d4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 966: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790211b  ! 967: WRPR_TT_I	wrpr	%r0, 0x011b, %tt
splash_lsu_6_438:
	setx 0x792b2fc5cec82179, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_439:
	setx 0xec80ccb717e60655, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 969: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9022ff  ! 970: WRPR_PSTATE_I	wrpr	%r0, 0x02ff, %pstate
	.word 0xd61fc000  ! 971: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd657c000  ! 972: LDSH_R	ldsh	[%r31 + %r0], %r11
change_to_randtl_6_440:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_440:
	.word 0x8f902002  ! 973: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d903803  ! 974: WRPR_PSTATE_I	wrpr	%r0, 0x1803, %pstate
splash_cmpr_6_441:
	setx 0xff413c36a3b796c7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 975: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879023f7  ! 976: WRPR_TT_I	wrpr	%r0, 0x03f7, %tt
	.word 0xa9480000  ! 977: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
debug_6_442:
	nop
	setx debug_6_442 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 978: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_6_443:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 979: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d90397b  ! 980: WRPR_PSTATE_I	wrpr	%r0, 0x197b, %pstate
tagged_6_444:
	tsubcctv %r22, 0x1a62, %r21
	.word 0xe407ec60  ! 981: LDUW_I	lduw	[%r31 + 0x0c60], %r18
	.word 0x87802020  ! 982: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x93902007  ! 983: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xe41fc000  ! 984: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x81510000  ! 985: RDPR_TICK	rdpr	%tick, %r0
	.word 0x83d020b4  ! 986: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xe48008a0  ! 987: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
splash_tba_6_445:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 988: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_6_446:
	setx 0x20aacc5882e69218, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 989: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_6_447:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d920000  ! 990: WRPR_WSTATE_R	wrpr	%r8, %r0, %wstate
change_to_randtl_6_448:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_448:
	.word 0x8f902001  ! 991: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902007  ! 992: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa5480000  ! 993: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	.word 0x8d802000  ! 994: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa9814011  ! 995: WR_SET_SOFTINT_R	wr	%r5, %r17, %set_softint
debug_6_449:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 996: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_6_450:
	setx 0xdf96c6fb4dd620f7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 997: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd28fe020  ! 998: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r9
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
mondo_5_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d934002  ! 1: WRPR_WSTATE_R	wrpr	%r13, %r2, %wstate
	.word 0x8d902d21  ! 2: WRPR_PSTATE_I	wrpr	%r0, 0x0d21, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 3: LDX_R	ldx	[%r31 + %r0], %r13
	setx 0x65edd02ed9132e1f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_1:
	.word 0x39400001  ! 4: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76c372d  ! 5: SDIVX_I	sdivx	%r16, 0xfffff72d, %r19
	.word 0xab804006  ! 6: WR_CLEAR_SOFTINT_R	wr	%r1, %r6, %clear_softint
splash_cmpr_5_3:
	setx 0x8dc87eca8f9f1a73, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802058  ! 8: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8d90323f  ! 9: WRPR_PSTATE_I	wrpr	%r0, 0x123f, %pstate
	.word 0xd637e0e3  ! 10: STH_I	sth	%r11, [%r31 + 0x00e3]
	.word 0xd68008a0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_5_4:
	setx 0xf27c06e06865c964, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 12: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_5_5:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 13: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_5_6:
	setx 0xb7b0c6017bd1977b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 14: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 15: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_5_7:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f0, %f18, %f6
	.word 0x93b44311  ! 16: ALIGNADDRESS	alignaddr	%r17, %r17, %r9
	.word 0x81982fb7  ! 17: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fb7, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01966  ! 18: FqTOd	dis not found

	.word 0xd797e0e3  ! 19: LDQFA_I	-	[%r31, 0x00e3], %f11
	.word 0xa2d1c007  ! 20: UMULcc_R	umulcc 	%r7, %r7, %r17
tagged_5_9:
	taddcctv %r3, 0x189d, %r16
	.word 0xe807e0e3  ! 21: LDUW_I	lduw	[%r31 + 0x00e3], %r20
	.word 0x93d02035  ! 22: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xe89fc020  ! 23: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	setx ivw_5_10, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_10:
	.word 0x97a00161  ! 24: FABSq	dis not found

	.word 0xe49fc020  ! 25: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
	.word 0x81982154  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0154, %hpstate
	.word 0x9150c000  ! 27: RDPR_TT	<illegal instruction>
	setx ivw_5_11, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_11:
	.word 0xa1a0016b  ! 28: FABSq	dis not found

	.word 0x87902302  ! 29: WRPR_TT_I	wrpr	%r0, 0x0302, %tt
mondo_5_12:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d934001  ! 30: WRPR_WSTATE_R	wrpr	%r13, %r1, %wstate
	.word 0xa5a509c6  ! 31: FDIVd	fdivd	%f20, %f6, %f18
	.word 0x9f802664  ! 32: SIR	sir	0x0664
	.word 0xe41fc000  ! 33: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x36700001  ! 34: BPGE	<illegal instruction>
donret_5_13:
	nop
	setx donretarg_5_13, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r0, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_13:
	.word 0xe4fffe6a  ! 35: SWAPA_I	swapa	%r18, [%r31 + 0xfffffe6a] %asi
DS_5_14:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xf351a7fe	! Random illegal ?
	.word 0xd711c00c  ! 1: LDQF_R	-	[%r7, %r12], %f11
	.word 0xa7a1c834  ! 36: FADDs	fadds	%f7, %f20, %f19
	.word 0x92c4fde6  ! 37: ADDCcc_I	addccc 	%r19, 0xfffffde6, %r9
	.word 0xe517c000  ! 38: LDQF_R	-	[%r31, %r0], %f18
splash_cmpr_5_15:
	setx 0x32218dafbb7d5151, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 39: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_5_16, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_16:
	.word 0xa1a00164  ! 40: FABSq	dis not found

	.word 0xd49fc020  ! 41: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
splash_cmpr_5_17:
	setx 0xb8f4277fc69d1c6e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 42: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802cf5  ! 43: SIR	sir	0x0cf5
	.word 0xa4d90011  ! 44: SMULcc_R	smulcc 	%r4, %r17, %r18
splash_lsu_5_18:
	setx 0x48e05e7fb593ce1d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 45: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 46: RD_STICK_REG	stbar
	.word 0x93902003  ! 47: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x3a700001  ! 48: BPCC	<illegal instruction>
	.word 0xd48008a0  ! 49: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01965  ! 50: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01973  ! 51: FqTOd	dis not found

	setx 0xc4417f5b1959bd76, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_21:
	.word 0x39400001  ! 52: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe207c000  ! 53: LDUW_R	lduw	[%r31 + %r0], %r17
	.word 0xe337fa5d  ! 54: STQF_I	-	%f17, [0x1a5d, %r31]
splash_cmpr_5_22:
	setx 0x393eb8cef422d678, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_23:
	setx 0x27e596e556920ef0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 56: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe21ffa5d  ! 57: LDD_I	ldd	[%r31 + 0xfffffa5d], %r17
splash_cmpr_5_24:
	setx 0x0438c7e88cffef3e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_5_25:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 59: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe2c004a0  ! 60: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r17
	.word 0x93902000  ! 61: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_cmpr_5_26:
	setx 0xff6da5dfd8e16535, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_27:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd1100007  ! 1: LDQF_R	-	[%r0, %r7], %f8
	.word 0x99a08820  ! 63: FADDs	fadds	%f2, %f0, %f12
	.word 0xa1500000  ! 64: RDPR_TPC	<illegal instruction>
	.word 0xe69004a0  ! 65: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
donret_5_28:
	nop
	setx donretarg_5_28, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r25, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_28:
	.word 0xe6fffa5d  ! 66: SWAPA_I	swapa	%r19, [%r31 + 0xfffffa5d] %asi
debug_5_29:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 67: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_5_30:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 68: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
change_to_randtl_5_31:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_31:
	.word 0x8f902002  ! 69: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
!$EV trig_pc_d(1, @VA(.MAIN.xir_5_32)) -> intp(5,1,3)
xir_5_32:
	.word 0xa9812fdc  ! 70: WR_SET_SOFTINT_I	wr	%r4, 0x0fdc, %set_softint
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 71: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902001  ! 72: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
mondo_5_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d940004  ! 73: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
	.word 0xa3450000  ! 74: RD_SET_SOFTINT	rd	%set_softint, %r17
	.word 0xa6842ee2  ! 75: ADDcc_I	addcc 	%r16, 0x0ee2, %r19
mondo_5_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d944014  ! 76: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0x8198263c  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x063c, %hpstate
	.word 0xd527fcdf  ! 78: STF_I	st	%f10, [0x1cdf, %r31]
	.word 0xd597fcdf  ! 79: LDQFA_I	-	[%r31, 0x1cdf], %f10
tagged_5_35:
	taddcctv %r18, 0x12f5, %r21
	.word 0xd407fcdf  ! 80: LDUW_I	lduw	[%r31 + 0xfffffcdf], %r10
	.word 0x93500000  ! 81: RDPR_TPC	rdpr	%tpc, %r9
intveclr_5_36:
	setx 0xc5c41e6d71147290, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 82: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6800b00  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r11
	.word 0xd66ffcdf  ! 84: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffffcdf]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9769fe77  ! 85: SDIVX_I	sdivx	%r7, 0xfffffe77, %r11
intveclr_5_38:
	setx 0xd366c7b2de82ca0e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_5_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d94c008  ! 87: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
	.word 0x2e700001  ! 88: BPVS	<illegal instruction>
debug_5_40:
	nop
	setx debug_5_40 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 89: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_5_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 90: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x819820a7  ! 91: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00a7, %hpstate
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 92: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx ivw_5_42, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_42:
	.word 0x9ba00161  ! 93: FABSq	dis not found

	.word 0xd647ec7e  ! 94: LDSW_I	ldsw	[%r31 + 0x0c7e], %r11
	.word 0x2a800001  ! 95: BCS	bcs,a	<label_0x1>
	.word 0xd6d804a0  ! 96: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_5_43)) -> intp(5,1,3)
xir_5_43:
	.word 0xa98072c8  ! 97: WR_SET_SOFTINT_I	wr	%r1, 0x12c8, %set_softint
	.word 0x8d903f87  ! 98: WRPR_PSTATE_I	wrpr	%r0, 0x1f87, %pstate
mondo_5_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d930003  ! 99: WRPR_WSTATE_R	wrpr	%r12, %r3, %wstate
	.word 0x83d02035  ! 100: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x879023c1  ! 101: WRPR_TT_I	wrpr	%r0, 0x03c1, %tt
debug_5_45:
	nop
	setx debug_5_45 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 102: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd71fc000  ! 103: LDDF_R	ldd	[%r31, %r0], %f11
DS_5_46:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 104: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd69004a0  ! 105: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0xd69ffa49  ! 106: LDDA_I	ldda	[%r31, + 0xfffffa49] %asi, %r11
	.word 0x87902098  ! 107: WRPR_TT_I	wrpr	%r0, 0x0098, %tt
	.word 0xa1450000  ! 108: RD_SET_SOFTINT	rd	%set_softint, %r16
debug_5_47:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 109: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81982645  ! 110: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0645, %hpstate
	.word 0x91a489c1  ! 111: FDIVd	fdivd	%f18, %f32, %f8
debug_5_48:
	nop
	setx debug_5_48 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 112: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802063  ! 113: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x81982dc5  ! 114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc5, %hpstate
	.word 0x8198281e  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081e, %hpstate
intveclr_5_49:
	setx 0x3e1e5a951fe75e13, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 116: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 117: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x986d20c1  ! 118: UDIVX_I	udivx 	%r20, 0x00c1, %r12
	.word 0xd08008a0  ! 119: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
tagged_5_50:
	tsubcctv %r4, 0x19b3, %r9
	.word 0xd007f324  ! 120: LDUW_I	lduw	[%r31 + 0xfffff324], %r8
	.word 0xa1902009  ! 121: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_tba_5_51:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 122: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_5_52:
	nop
	setx debug_5_52 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 123: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902006  ! 124: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01974  ! 125: FqTOd	dis not found

debug_5_54:
	nop
	setx debug_5_54 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 126: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902004  ! 127: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
change_to_randtl_5_55:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_55:
	.word 0x8f902003  ! 128: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
intveclr_5_56:
	setx 0x505472274c3850fd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_57:
	setx 0x0112ab59e6bbfe0c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 130: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_58:
	setx 0xcb267bf0a60f52e6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 131: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 132: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x81982597  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0597, %hpstate
intveclr_5_59:
	setx 0xfb6467002dbf20fb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 134: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd66ff324  ! 135: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff324]
	.word 0xd627f324  ! 136: STW_I	stw	%r11, [%r31 + 0xfffff324]
	.word 0xd69fc020  ! 137: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
debug_5_60:
	nop
	setx debug_5_60 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 138: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_5_61:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d934011  ! 139: WRPR_WSTATE_R	wrpr	%r13, %r17, %wstate
	.word 0xd677f324  ! 140: STX_I	stx	%r11, [%r31 + 0xfffff324]
	.word 0x8d902c38  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x0c38, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_62)) -> intp(0,0,28)
intvec_5_62:
	.word 0x39400001  ! 142: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x819829c7  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c7, %hpstate
	setx 0xd6bfe3c0bcd40d38, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_63:
	.word 0x39400001  ! 144: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_5_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d92c001  ! 145: WRPR_WSTATE_R	wrpr	%r11, %r1, %wstate
splash_lsu_5_65:
	setx 0xea3ec1a86d001799, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 146: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 147: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
mondo_5_66:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d91c014  ! 148: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
DS_5_67:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 149: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
DS_5_68:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f30, %f16, %f12
	.word 0x93b20306  ! 150: ALIGNADDRESS	alignaddr	%r8, %r6, %r9
intveclr_5_69:
	setx 0xa4f60c8b0d49ab50, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 151: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd657f324  ! 152: LDSH_I	ldsh	[%r31 + 0xfffff324], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 153: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd727c006  ! 154: STF_R	st	%f11, [%r6, %r31]
	.word 0x91d020b5  ! 155: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xa9828009  ! 156: WR_SET_SOFTINT_R	wr	%r10, %r9, %set_softint
debug_5_70:
	nop
	setx debug_5_70 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 157: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 158: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x93902004  ! 159: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x95a049c1  ! 160: FDIVd	fdivd	%f32, %f32, %f10
DS_5_71:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f20, %f18, %f12
	.word 0x99b20306  ! 161: ALIGNADDRESS	alignaddr	%r8, %r6, %r12
donret_5_72:
	nop
	setx donretarg_5_72, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r15, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_72:
	.word 0xdafff324  ! 162: SWAPA_I	swapa	%r13, [%r31 + 0xfffff324] %asi
debug_5_73:
	nop
	setx debug_5_73 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_5_74:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 164: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902003  ! 165: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x99500000  ! 166: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x8d9038ff  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x18ff, %pstate
splash_cmpr_5_75:
	setx 0xa9317b9d78ab6fac, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 168: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902001  ! 169: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_5_76:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe734000d  ! 1: STQF_R	-	%f19, [%r13, %r16]
	normalw
	.word 0x93458000  ! 170: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x87902283  ! 171: WRPR_TT_I	wrpr	%r0, 0x0283, %tt
splash_cmpr_5_77:
	setx 0xb793e3b2bc6d2dcb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02033  ! 173: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x93902006  ! 174: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	setx ivw_5_78, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_78:
	.word 0x97a00170  ! 175: FABSq	dis not found

splash_cmpr_5_79:
	setx 0x825eb57da6e5ebdd, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 176: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_80:
	setx 0xa4bbe668abe3bbc4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe7e7c030  ! 178: CASA_I	casa	[%r31] 0x 1, %r16, %r19
intveclr_5_81:
	setx 0x1f8ff7a0ce0f136e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 179: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa190200c  ! 180: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xe727c010  ! 181: STF_R	st	%f19, [%r16, %r31]
	.word 0xe6800c20  ! 182: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r19
	.word 0x81b01021  ! 183: SIAM	siam	1
	.word 0xa190200b  ! 184: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xe61fc000  ! 185: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x2c800001  ! 186: BNEG	bneg,a	<label_0x1>
	.word 0x20800001  ! 187: BN	bn,a	<label_0x1>
	.word 0xe69ff324  ! 188: LDDA_I	ldda	[%r31, + 0xfffff324] %asi, %r19
splash_cmpr_5_82:
	setx 0x6978d7b8d772c70f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 189: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe67ff324  ! 190: SWAP_I	swap	%r19, [%r31 + 0xfffff324]
	setx 0x70d1be87c7a3dfa9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_83:
	.word 0x39400001  ! 191: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
mondo_5_84:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d944003  ! 193: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
DS_5_85:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 194: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe6bff324  ! 195: STDA_I	stda	%r19, [%r31 + 0xfffff324] %asi
mondo_5_86:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d950012  ! 196: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
change_to_randtl_5_87:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_87:
	.word 0x8f902003  ! 197: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01964  ! 198: FqTOd	dis not found

donret_5_89:
	nop
	setx donretarg_5_89, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r27, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_89:
	.word 0xe6fff324  ! 199: SWAPA_I	swapa	%r19, [%r31 + 0xfffff324] %asi
change_to_randtl_5_90:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_90:
	.word 0x8f902000  ! 200: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 201: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93d02032  ! 202: Tcc_I	tne	icc_or_xcc, %r0 + 50
mondo_5_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d950007  ! 203: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
	.word 0x38700001  ! 204: BPGU	<illegal instruction>
	.word 0x8198222c  ! 205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x022c, %hpstate
	.word 0xe797f324  ! 206: LDQFA_I	-	[%r31, 0x1324], %f19
	.word 0x38800001  ! 207: BGU	bgu,a	<label_0x1>
splash_tba_5_92:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 208: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982d07  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d07, %hpstate
	.word 0x9f8024b3  ! 210: SIR	sir	0x04b3
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196c  ! 211: FqTOd	dis not found

	.word 0xe717c000  ! 212: LDQF_R	-	[%r31, %r0], %f19
	.word 0x81460000  ! 213: RD_STICK_REG	stbar
	.word 0xe6dfe020  ! 214: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r19
	.word 0xa1902006  ! 215: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_cmpr_5_94:
	setx 0x06682d3021014880, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902c8a  ! 217: WRPR_PSTATE_I	wrpr	%r0, 0x0c8a, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01966  ! 218: FqTOd	dis not found

debug_5_96:
	nop
	setx debug_5_96 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 219: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_5_97:
	setx 0x32ca24d6e75e3624, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 220: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd06ffc1f  ! 221: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffc1f]
	.word 0xd0d7e000  ! 222: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
tagged_5_98:
	tsubcctv %r22, 0x1897, %r14
	.word 0xd007fc1f  ! 223: LDUW_I	lduw	[%r31 + 0xfffffc1f], %r8
	.word 0x93a149d3  ! 224: FDIVd	fdivd	%f36, %f50, %f40
mondo_5_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d90c001  ! 225: WRPR_WSTATE_R	wrpr	%r3, %r1, %wstate
splash_cmpr_5_100:
	setx 0xe5bfe416dc0bf764, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 226: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802fdb  ! 227: SIR	sir	0x0fdb
	.word 0xa190200f  ! 228: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x879020e6  ! 229: WRPR_TT_I	wrpr	%r0, 0x00e6, %tt
donret_5_101:
	nop
	setx donretarg_5_101, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r20, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_101:
	.word 0xd2ffeed1  ! 230: SWAPA_I	swapa	%r9, [%r31 + 0x0ed1] %asi
change_to_randtl_5_102:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_102:
	.word 0x8f902002  ! 231: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
!$EV trig_pc_d(1, @VA(.MAIN.xir_5_103)) -> intp(5,1,3)
xir_5_103:
	.word 0xa982b203  ! 232: WR_SET_SOFTINT_I	wr	%r10, 0x1203, %set_softint
	.word 0xd20fc000  ! 233: LDUB_R	ldub	[%r31 + %r0], %r9
debug_5_104:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 234: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd207c000  ! 235: LDUW_R	lduw	[%r31 + %r0], %r9
change_to_randtl_5_105:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_105:
	.word 0x8f902001  ! 236: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_5_106:
	setx 0x446b0f878fd6344c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 237: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_5_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d948004  ! 238: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
splash_tba_5_108:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 239: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd29ffeae  ! 240: LDDA_I	ldda	[%r31, + 0xfffffeae] %asi, %r9
	.word 0xd2880e40  ! 241: LDUBA_R	lduba	[%r0, %r0] 0x72, %r9
DS_5_109:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd9100009  ! 1: LDQF_R	-	[%r0, %r9], %f12
	.word 0x93a5082d  ! 242: FADDs	fadds	%f20, %f13, %f9
debug_5_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 243: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x3c800001  ! 244: BPOS	bpos,a	<label_0x1>
	setx ivw_5_111, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_111:
	.word 0x95a00170  ! 245: FABSq	dis not found

tagged_5_112:
	tsubcctv %r24, 0x17d4, %r12
	.word 0xd407feae  ! 246: LDUW_I	lduw	[%r31 + 0xfffffeae], %r10
	.word 0xd407c000  ! 247: LDUW_R	lduw	[%r31 + %r0], %r10
debug_5_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 248: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 249: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 250: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_5_114:
	setx 0xe8250d9d3742cc8b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 251: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 252: Tcc_I	ta	icc_or_xcc, %r0 + 180
DS_5_115:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 253: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xd47ffeae  ! 254: SWAP_I	swap	%r10, [%r31 + 0xfffffeae]
	.word 0xd537feae  ! 255: STQF_I	-	%f10, [0x1eae, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_116)) -> intp(7,0,25)
intvec_5_116:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x24800001  ! 257: BLE	ble,a	<label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97a089c1  ! 259: FDIVd	fdivd	%f2, %f32, %f42
splash_tba_5_117:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 260: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d020b3  ! 261: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x81982817  ! 262: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0817, %hpstate
change_to_randtl_5_118:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_118:
	.word 0x8f902002  ! 263: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 264: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xad80e4d0  ! 265: WR_SOFTINT_REG_I	wr	%r3, 0x04d0, %softint
	.word 0xa6a94012  ! 266: ANDNcc_R	andncc 	%r5, %r18, %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_5_119)) -> intp(5,1,3)
xir_5_119:
	.word 0xa984308a  ! 267: WR_SET_SOFTINT_I	wr	%r16, 0x108a, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_120)) -> intp(5,0,31)
intvec_5_120:
	.word 0x39400001  ! 268: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 269: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_5_121:
	setx 0x3ad96956a82f80c1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 270: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9af8c005  ! 271: SDIVcc_R	sdivcc 	%r3, %r5, %r13
	.word 0xe807c000  ! 272: LDUW_R	lduw	[%r31 + %r0], %r20
	setx ivw_5_122, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_122:
	.word 0x95a00165  ! 273: FABSq	dis not found

mondo_5_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d91c013  ! 274: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
splash_cmpr_5_124:
	setx 0xff88b1de712c7156, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 275: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 276: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x904a8004  ! 277: MULX_R	mulx 	%r10, %r4, %r8
splash_cmpr_5_125:
	setx 0x0592961bbf3f0750, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9480000  ! 279: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
debug_5_126:
	nop
	setx debug_5_126 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 280: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x28700001  ! 281: BPLEU	<illegal instruction>
	.word 0x93902006  ! 282: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87802016  ! 283: WRASI_I	wr	%r0, 0x0016, %asi
change_to_randtl_5_127:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_127:
	.word 0x8f902002  ! 284: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01962  ! 285: FqTOd	dis not found

	.word 0x87802088  ! 286: WRASI_I	wr	%r0, 0x0088, %asi
splash_cmpr_5_129:
	setx 0x60a55317cc3290f2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 287: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790222b  ! 288: WRPR_TT_I	wrpr	%r0, 0x022b, %tt
	.word 0x9ba01a62  ! 289: FqTOi	fqtoi	
	.word 0xe81fffcf  ! 290: LDD_I	ldd	[%r31 + 0xffffffcf], %r20
	.word 0xe8800c60  ! 291: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r20
splash_cmpr_5_130:
	setx 0x1baa753943c08fdb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 292: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe93fc008  ! 293: STDF_R	std	%f20, [%r8, %r31]
	.word 0x879020dc  ! 294: WRPR_TT_I	wrpr	%r0, 0x00dc, %tt
	.word 0xe857c000  ! 295: LDSH_R	ldsh	[%r31 + %r0], %r20
	.word 0x3e800001  ! 296: BVC	bvc,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 297: LDX_R	ldx	[%r31 + %r0], %r20
DS_5_131:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 298: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	setx ivw_5_132, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_132:
	.word 0xa1a00161  ! 299: FABSq	dis not found

	.word 0x9f80218e  ! 300: SIR	sir	0x018e
	.word 0xa2dcc00b  ! 301: SMULcc_R	smulcc 	%r19, %r11, %r17
	.word 0x87802058  ! 302: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x9f80324c  ! 303: SIR	sir	0x124c
	.word 0xd2800b60  ! 304: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r9
	.word 0xd2800b00  ! 305: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r9
splash_lsu_5_133:
	setx 0x6f6f07c198760a2d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 306: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_5_134:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 307: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x91d02035  ! 308: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_tba_5_135:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 309: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd27ff5df  ! 310: SWAP_I	swap	%r9, [%r31 + 0xfffff5df]
debug_5_136:
	nop
	setx debug_5_136 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 311: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_5_137:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 312: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd2d804a0  ! 313: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0xd2c004a0  ! 314: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916867c3  ! 315: SDIVX_I	sdivx	%r1, 0x07c3, %r8
	.word 0x81982c37  ! 316: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c37, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r18
DS_5_139:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd130c011  ! 1: STQF_R	-	%f8, [%r17, %r3]
	normalw
	.word 0x93458000  ! 318: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xe607c000  ! 319: LDUW_R	lduw	[%r31 + %r0], %r19
mondo_5_140:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d924014  ! 320: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9168e2f1  ! 321: SDIVX_I	sdivx	%r3, 0x02f1, %r8
	.word 0xd537c008  ! 322: STQF_R	-	%f10, [%r8, %r31]
	.word 0xab818009  ! 323: WR_CLEAR_SOFTINT_R	wr	%r6, %r9, %clear_softint
	.word 0xd4800ae0  ! 324: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r10
	.word 0xa981c004  ! 325: WR_SET_SOFTINT_R	wr	%r7, %r4, %set_softint
mondo_5_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d928013  ! 326: WRPR_WSTATE_R	wrpr	%r10, %r19, %wstate
	.word 0x81460000  ! 327: RD_STICK_REG	stbar
change_to_randtl_5_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_143:
	.word 0x8f902003  ! 328: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
change_to_randtl_5_144:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_144:
	.word 0x8f902000  ! 329: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902001  ! 330: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd4dfe020  ! 331: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
pmu_5_145:
	nop
	setx 0xfffffc4efffffd3f, %g1, %g7
	.word 0xa3800007  ! 332: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d802000  ! 333: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_5_146:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d92c012  ! 334: WRPR_WSTATE_R	wrpr	%r11, %r18, %wstate
intveclr_5_147:
	setx 0xe7fd1c6bcaeef95e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 335: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 336: WRASI_I	wr	%r0, 0x0014, %asi
splash_cmpr_5_148:
	setx 0xddb43ede967979fd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 338: Tcc_I	ta	icc_or_xcc, %r0 + 53
change_to_randtl_5_149:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_149:
	.word 0x8f902000  ! 339: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x2c800001  ! 340: BNEG	bneg,a	<label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96ca808  ! 341: SDIVX_I	sdivx	%r18, 0x0808, %r20
debug_5_151:
	nop
	setx debug_5_151 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 342: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_5_152:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 343: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd647e7a8  ! 344: LDSW_I	ldsw	[%r31 + 0x07a8], %r11
	.word 0x9b45c000  ! 345: RD_TICK_CMPR_REG	rd	%-, %r13
splash_tba_5_153:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 346: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f8029d8  ! 347: SIR	sir	0x09d8
	.word 0x91d020b2  ! 348: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8d903f1d  ! 349: WRPR_PSTATE_I	wrpr	%r0, 0x1f1d, %pstate
	.word 0x87802004  ! 350: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x81982776  ! 351: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0776, %hpstate
	.word 0x3a800001  ! 352: BCC	bcc,a	<label_0x1>
	.word 0xe8880e40  ! 353: LDUBA_R	lduba	[%r0, %r0] 0x72, %r20
splash_cmpr_5_154:
	setx 0xec388210ec0ab573, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 354: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_5_155:
	setx 0x6130aef7759ef448, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 355: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_5_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d950012  ! 356: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	.word 0x36700001  ! 357: BPGE	<illegal instruction>
mondo_5_157:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d924005  ! 358: WRPR_WSTATE_R	wrpr	%r9, %r5, %wstate
DS_5_158:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f12, %f2, %f6
	.word 0x99b2c301  ! 359: ALIGNADDRESS	alignaddr	%r11, %r1, %r12
	setx ivw_5_159, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_159:
	.word 0xa9a00165  ! 360: FABSq	dis not found

	.word 0xd26ff7b0  ! 361: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffff7b0]
splash_tba_5_160:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 362: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91a209cd  ! 363: FDIVd	fdivd	%f8, %f44, %f8
	.word 0xd28008a0  ! 364: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
debug_5_161:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 365: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_5_162:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_162:
	.word 0x8f902001  ! 366: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa86a4009  ! 367: UDIVX_R	udivx 	%r9, %r9, %r20
	.word 0x819824f5  ! 368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04f5, %hpstate
DS_5_163:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe33439af  ! 1: STQF_I	-	%f17, [0x19af, %r16]
	normalw
	.word 0x99458000  ! 369: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916c2968  ! 370: SDIVX_I	sdivx	%r16, 0x0968, %r8
	.word 0xd2d004a0  ! 371: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
debug_5_165:
	nop
	setx debug_5_165 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 372: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_5_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d944001  ! 373: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
	.word 0x879023d7  ! 374: WRPR_TT_I	wrpr	%r0, 0x03d7, %tt
	.word 0x99902000  ! 375: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x28700001  ! 376: BPLEU	<illegal instruction>
	.word 0xa1902004  ! 377: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x87802089  ! 378: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x9a812fae  ! 379: ADDcc_I	addcc 	%r4, 0x0fae, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 380: LDX_R	ldx	[%r31 + %r0], %r19
tagged_5_167:
	taddcctv %r20, 0x119d, %r6
	.word 0xe607f8ba  ! 381: LDUW_I	lduw	[%r31 + 0xfffff8ba], %r19
	.word 0xe61fc000  ! 382: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x93902004  ! 383: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x81982ecf  ! 384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecf, %hpstate
	.word 0x26700001  ! 385: BPL	<illegal instruction>
mondo_5_168:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d934000  ! 386: WRPR_WSTATE_R	wrpr	%r13, %r0, %wstate
	.word 0x93902007  ! 387: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_cmpr_5_169:
	setx 0x5c088e7899cc8384, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 388: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_5_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d914010  ! 389: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
mondo_5_171:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d94c005  ! 390: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
	.word 0xa190200c  ! 391: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	setx ivw_5_172, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_172:
	.word 0xa3a00174  ! 392: FABSq	dis not found

	setx 0x82ec7df74cd20a85, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_173:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_174:
	setx 0x11cf55de0b853742, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 394: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_175:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd5118013  ! 1: LDQF_R	-	[%r6, %r19], %f10
	.word 0x91a04833  ! 395: FADDs	fadds	%f1, %f19, %f8
mondo_5_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d94c00b  ! 396: WRPR_WSTATE_R	wrpr	%r19, %r11, %wstate
	.word 0x81982226  ! 397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0226, %hpstate
	.word 0x8d802004  ! 398: WRFPRS_I	wr	%r0, 0x0004, %fprs
mondo_5_177:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d900008  ! 399: WRPR_WSTATE_R	wrpr	%r0, %r8, %wstate
splash_cmpr_5_178:
	setx 0x50bd73872da4c806, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 400: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_5_179, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_179:
	.word 0x91a00173  ! 401: FABSq	dis not found

splash_cmpr_5_180:
	setx 0x12cf4112a4448677, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 402: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_181:
	nop
	setx debug_5_181 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 403: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9b520000  ! 404: RDPR_PIL	<illegal instruction>
DS_5_182:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f26, %f30, %f0
	.word 0xa3b44305  ! 405: ALIGNADDRESS	alignaddr	%r17, %r5, %r17
mondo_5_183:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d944012  ! 406: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
mondo_5_184:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d914005  ! 407: WRPR_WSTATE_R	wrpr	%r5, %r5, %wstate
	.word 0x8198238c  ! 408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038c, %hpstate
	.word 0x91d02035  ! 409: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902002  ! 410: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87802004  ! 411: WRASI_I	wr	%r0, 0x0004, %asi
mondo_5_185:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d918002  ! 412: WRPR_WSTATE_R	wrpr	%r6, %r2, %wstate
splash_tba_5_186:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 413: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_5_187:
	setx 0x3b26726d1e1472c6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 414: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_5_188:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 415: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9680c00b  ! 416: ADDcc_R	addcc 	%r3, %r11, %r11
	.word 0x99902000  ! 417: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xe46ff8ba  ! 418: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffff8ba]
DS_5_189:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa9b34305  ! 419: ALIGNADDRESS	alignaddr	%r13, %r5, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916abe60  ! 420: SDIVX_I	sdivx	%r10, 0xfffffe60, %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a0196d  ! 421: FqTOd	dis not found

	.word 0x8d902c24  ! 422: WRPR_PSTATE_I	wrpr	%r0, 0x0c24, %pstate
	.word 0x93a289c4  ! 423: FDIVd	fdivd	%f10, %f4, %f40
tagged_5_192:
	tsubcctv %r2, 0x10c7, %r16
	.word 0xd007ec55  ! 424: LDUW_I	lduw	[%r31 + 0x0c55], %r8
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 425: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 426: LDX_R	ldx	[%r31 + %r0], %r8
debug_5_193:
	nop
	setx debug_5_193 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 427: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x83d020b4  ! 428: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xd04fec55  ! 429: LDSB_I	ldsb	[%r31 + 0x0c55], %r8
	.word 0xd08fe020  ! 430: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x95520000  ! 432: RDPR_PIL	rdpr	%pil, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96cba69  ! 433: SDIVX_I	sdivx	%r18, 0xfffffa69, %r20
mondo_5_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d908010  ! 434: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
debug_5_196:
	nop
	setx debug_5_196 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 435: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_5_197:
	taddcctv %r21, 0x1da2, %r16
	.word 0xe007ef0e  ! 436: LDUW_I	lduw	[%r31 + 0x0f0e], %r16
	.word 0x93d020b4  ! 437: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0xe0800ac0  ! 438: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r16
	.word 0x91d020b2  ! 439: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_cmpr_5_198:
	setx 0x259b51d1d7d134cd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 440: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_5_199:
	setx 0x13d9d86b66093933, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 441: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe0800c20  ! 442: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r16
	.word 0x9f802bc2  ! 443: SIR	sir	0x0bc2
intveclr_5_200:
	setx 0x3952f32288176604, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 444: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d02035  ! 445: Tcc_I	te	icc_or_xcc, %r0 + 53
mondo_5_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d92c007  ! 446: WRPR_WSTATE_R	wrpr	%r11, %r7, %wstate
	.word 0x99902000  ! 447: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
mondo_5_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d948007  ! 448: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
	.word 0xe137c00c  ! 449: STQF_R	-	%f16, [%r12, %r31]
	setx 0x66ad17e8cdbd87d3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_203:
	.word 0x39400001  ! 450: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790224c  ! 451: WRPR_TT_I	wrpr	%r0, 0x024c, %tt
change_to_randtl_5_204:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_204:
	.word 0x8f902000  ! 452: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9f803dd4  ! 453: SIR	sir	0x1dd4
	.word 0xa5500000  ! 454: RDPR_TPC	<illegal instruction>
	.word 0x81982255  ! 455: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0255, %hpstate
debug_5_205:
	nop
	setx debug_5_205 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 456: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_5_206:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 457: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9169ea6e  ! 458: SDIVX_I	sdivx	%r7, 0x0a6e, %r8
tagged_5_208:
	tsubcctv %r21, 0x1dd5, %r7
	.word 0xd007e283  ! 459: LDUW_I	lduw	[%r31 + 0x0283], %r8
	.word 0xd08008a0  ! 460: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
debug_5_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 461: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802088  ! 462: WRASI_I	wr	%r0, 0x0088, %asi
change_to_randtl_5_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_210:
	.word 0x8f902000  ! 463: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd09fe283  ! 464: LDDA_I	ldda	[%r31, + 0x0283] %asi, %r8
	.word 0xa2814011  ! 465: ADDcc_R	addcc 	%r5, %r17, %r17
	.word 0x9f802e8d  ! 466: SIR	sir	0x0e8d
	.word 0x879023c0  ! 467: WRPR_TT_I	wrpr	%r0, 0x03c0, %tt
debug_5_211:
	nop
	setx debug_5_211 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 468: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe4c004a0  ! 469: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r18
	.word 0xe4c7e020  ! 470: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r18
	.word 0xe48008a0  ! 471: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 472: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_5_212:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 473: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x879023a1  ! 474: WRPR_TT_I	wrpr	%r0, 0x03a1, %tt
splash_tba_5_213:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 475: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_5_214:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 476: SAVE_R	save	%r31, %r0, %r31
	.word 0xe4880e40  ! 477: LDUBA_R	lduba	[%r0, %r0] 0x72, %r18
debug_5_215:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 478: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe4c804a0  ! 479: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r18
	.word 0xa5a049c9  ! 480: FDIVd	fdivd	%f32, %f40, %f18
	.word 0x93902002  ! 481: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
intveclr_5_216:
	setx 0xc8d7ad55c445d2b9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_5_217:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd7308002  ! 1: STQF_R	-	%f11, [%r2, %r2]
	normalw
	.word 0xa3458000  ! 483: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x87802016  ! 484: WRASI_I	wr	%r0, 0x0016, %asi
debug_5_218:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 485: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x26700001  ! 486: BPL	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01960  ! 487: FqTOd	dis not found

splash_cmpr_5_220:
	setx 0xb1ecdaa237d18d63, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 488: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 489: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 490: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xe897e010  ! 491: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r20
	.word 0xe8880e60  ! 492: LDUBA_R	lduba	[%r0, %r0] 0x73, %r20
intveclr_5_221:
	setx 0x2a3be9cbd1385fb5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 493: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe847e9df  ! 494: LDSW_I	ldsw	[%r31 + 0x09df], %r20
	.word 0xe827e9df  ! 495: STW_I	stw	%r20, [%r31 + 0x09df]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956aff7f  ! 496: SDIVX_I	sdivx	%r11, 0xffffff7f, %r10
	.word 0x9f802fc4  ! 497: SIR	sir	0x0fc4
	.word 0xa9454000  ! 498: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0xd0dfe030  ! 499: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r8
	.word 0x87802020  ! 500: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xd127c003  ! 501: STF_R	st	%f8, [%r3, %r31]
	.word 0x819827ef  ! 502: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07ef, %hpstate
splash_tba_5_223:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 503: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x99902002  ! 504: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xd0d7e030  ! 505: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 506: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_5_224:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xb764412c	! Random illegal ?
	.word 0xd710c012  ! 1: LDQF_R	-	[%r3, %r18], %f11
	.word 0x95a00833  ! 507: FADDs	fadds	%f0, %f19, %f10
	.word 0x87902211  ! 508: WRPR_TT_I	wrpr	%r0, 0x0211, %tt
splash_lsu_5_225:
	setx 0x50aaf94920d3b221, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 509: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 510: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd25ff2d8  ! 511: LDX_I	ldx	[%r31 + 0xfffff2d8], %r9
	.word 0x819821ce  ! 512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01ce, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_226)) -> intp(5,0,23)
intvec_5_226:
	.word 0x39400001  ! 513: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 514: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9021af  ! 515: WRPR_PSTATE_I	wrpr	%r0, 0x01af, %pstate
	.word 0xa1902007  ! 516: WRPR_GL_I	wrpr	%r0, 0x0007, %-
intveclr_5_227:
	setx 0x9c2d2c15df2ac58b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 517: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_5_228:
	nop
	setx donretarg_5_228, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r21, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_228:
	.word 0xd2fff2d8  ! 518: SWAPA_I	swapa	%r9, [%r31 + 0xfffff2d8] %asi
	.word 0x81982774  ! 519: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0774, %hpstate
	.word 0x81b01021  ! 520: SIAM	siam	1
	.word 0xd2c004a0  ! 521: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	.word 0x38700001  ! 522: BPGU	<illegal instruction>
	.word 0x2e800001  ! 523: BVS	bvs,a	<label_0x1>
tagged_5_229:
	taddcctv %r9, 0x13f1, %r25
	.word 0xd207f2d8  ! 524: LDUW_I	lduw	[%r31 + 0xfffff2d8], %r9
intveclr_5_230:
	setx 0xcba3fc338a5c3535, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_231:
	setx 0x011be6d359320042, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 526: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902009  ! 527: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x9ac33074  ! 528: ADDCcc_I	addccc 	%r12, 0xfffff074, %r13
	.word 0x8780201c  ! 529: WRASI_I	wr	%r0, 0x001c, %asi
splash_cmpr_5_232:
	setx 0x2682e6eee570fcec, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 530: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_5_233:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d918005  ! 531: WRPR_WSTATE_R	wrpr	%r6, %r5, %wstate
	.word 0x879020df  ! 532: WRPR_TT_I	wrpr	%r0, 0x00df, %tt
	.word 0x83d02033  ! 533: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xe4800b40  ! 534: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r18
	.word 0xa9a0c9cc  ! 535: FDIVd	fdivd	%f34, %f12, %f20
	.word 0xe8dfe030  ! 536: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
	.word 0x99a289d3  ! 537: FDIVd	fdivd	%f10, %f50, %f12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916ca9ad  ! 538: SDIVX_I	sdivx	%r18, 0x09ad, %r8
	.word 0xa1540000  ! 539: RDPR_GL	rdpr	%-, %r16
	.word 0xd6dfe010  ! 540: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
splash_tba_5_235:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 541: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x95480000  ! 542: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 543: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_5_236:
	tsubcctv %r16, 0x1dfb, %r3
	.word 0xe607e600  ! 544: LDUW_I	lduw	[%r31 + 0x0600], %r19
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 545: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_5_237:
	setx 0x9222891097860899, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 546: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_5_238:
	setx 0xe719fc77ce10a076, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879023f2  ! 548: WRPR_TT_I	wrpr	%r0, 0x03f2, %tt
	setx 0x44e763e473537fef, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_239:
	.word 0x39400001  ! 549: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_5_240:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d91c001  ! 550: WRPR_WSTATE_R	wrpr	%r7, %r1, %wstate
intveclr_5_241:
	setx 0x08e9d82e4426c928, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 551: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8790203f  ! 552: WRPR_TT_I	wrpr	%r0, 0x003f, %tt
	.word 0xe6c7e030  ! 553: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r19
	.word 0x93902003  ! 554: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe68008a0  ! 555: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x93454000  ! 556: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
tagged_5_242:
	tsubcctv %r23, 0x1157, %r1
	.word 0xe807e600  ! 557: LDUW_I	lduw	[%r31 + 0x0600], %r20
debug_5_243:
	nop
	setx debug_5_243 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 558: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x22800001  ! 559: BE	be,a	<label_0x1>
intveclr_5_244:
	setx 0xf457e699a0649eb8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 560: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_245:
	setx 0xb9e6bf68889cccd8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 561: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9024ea  ! 562: WRPR_PSTATE_I	wrpr	%r0, 0x04ea, %pstate
debug_5_246:
	nop
	setx debug_5_246 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 563: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x7ae0dfd85484d088, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_247:
	.word 0x39400001  ! 564: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_5_248:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 565: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_5_249:
	setx 0x753c866ce1ff81ad, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 566: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200b  ! 567: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x87802080  ! 568: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa553c000  ! 569: RDPR_FQ	<illegal instruction>
	.word 0x93a00564  ! 570: FSQRTq	fsqrt	
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 571: LDX_R	ldx	[%r31 + %r0], %r9
debug_5_250:
	nop
	setx debug_5_250 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 572: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01965  ! 573: FqTOd	dis not found

	.word 0x93b34fe8  ! 574: FONES	e	%f9
splash_cmpr_5_252:
	setx 0xde38bc08b84ab13d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 575: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 576: LDX_R	ldx	[%r31 + %r0], %r11
	setx 0x5b0b95a94aa09f42, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_253:
	.word 0x39400001  ! 577: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6c7e010  ! 578: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r11
	.word 0x8d9023b8  ! 579: WRPR_PSTATE_I	wrpr	%r0, 0x03b8, %pstate
	.word 0x91d02034  ! 580: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87802080  ! 581: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd737c004  ! 582: STQF_R	-	%f11, [%r4, %r31]
	.word 0x92688013  ! 583: UDIVX_R	udivx 	%r2, %r19, %r9
splash_cmpr_5_254:
	setx 0xe9dbc199e70b1a89, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 584: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_255:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd3100013  ! 1: LDQF_R	-	[%r0, %r19], %f9
	.word 0xa1a4c830  ! 585: FADDs	fadds	%f19, %f16, %f16
mondo_5_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d90c00a  ! 586: WRPR_WSTATE_R	wrpr	%r3, %r10, %wstate
	.word 0xe53fc00a  ! 587: STDF_R	std	%f18, [%r10, %r31]
tagged_5_257:
	taddcctv %r1, 0x199b, %r8
	.word 0xe407e600  ! 588: LDUW_I	lduw	[%r31 + 0x0600], %r18
pmu_5_258:
	nop
	setx 0xfffffaf0fffff078, %g1, %g7
	.word 0xa3800007  ! 589: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xad833823  ! 590: WR_SOFTINT_REG_I	wr	%r12, 0x1823, %softint
tagged_5_259:
	taddcctv %r20, 0x156a, %r17
	.word 0xe407e4ec  ! 591: LDUW_I	lduw	[%r31 + 0x04ec], %r18
	.word 0x93520000  ! 592: RDPR_PIL	<illegal instruction>
change_to_randtl_5_260:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_260:
	.word 0x8f902001  ! 593: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd827e4ec  ! 594: STW_I	stw	%r12, [%r31 + 0x04ec]
	.word 0x81460000  ! 595: RD_STICK_REG	stbar
mondo_5_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d90c014  ! 596: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
	.word 0x8d9034d6  ! 597: WRPR_PSTATE_I	wrpr	%r0, 0x14d6, %pstate
	.word 0x87902110  ! 598: WRPR_TT_I	wrpr	%r0, 0x0110, %tt
	.word 0x8d902e09  ! 599: WRPR_PSTATE_I	wrpr	%r0, 0x0e09, %pstate
	.word 0x819823d5  ! 600: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d5, %hpstate
	.word 0x93902006  ! 601: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81460000  ! 602: RD_STICK_REG	stbar
	.word 0x26800001  ! 603: BL	bl,a	<label_0x1>
debug_5_262:
	nop
	setx debug_5_262 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 604: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902006  ! 605: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_tba_5_263:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 606: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_5_264:
	nop
	setx debug_5_264 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 607: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81982c9c  ! 608: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9c, %hpstate
change_to_randtl_5_265:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_265:
	.word 0x8f902001  ! 609: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902001  ! 610: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd8c7e000  ! 611: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r12
intveclr_5_266:
	setx 0x7341b80977b6de5c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 612: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902001  ! 613: WRPR_GL_I	wrpr	%r0, 0x0001, %-
debug_5_267:
	nop
	setx debug_5_267 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 614: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd8cfe020  ! 615: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
debug_5_268:
	nop
	setx debug_5_268 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 616: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_5_269:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d910011  ! 617: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 618: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_5_270:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 619: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x28700001  ! 620: BPLEU	<illegal instruction>
	.word 0x93902002  ! 621: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
mondo_5_271:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d950001  ! 622: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
splash_lsu_5_272:
	setx 0xeb48499c162769a7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 623: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_5_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d904011  ! 624: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
	.word 0xd88804a0  ! 625: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
splash_cmpr_5_274:
	setx 0xa0a4940ed7becb8b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 626: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 627: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_5_275:
	setx 0xa2e17b140147c603, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 628: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 629: BL	bl,a	<label_0x1>
mondo_5_276:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d934007  ! 630: WRPR_WSTATE_R	wrpr	%r13, %r7, %wstate
	setx ivw_5_277, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_277:
	.word 0xa9a00164  ! 631: FABSq	dis not found

	.word 0xd4c00e60  ! 632: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r10
splash_cmpr_5_278:
	setx 0x26e7321a8e62a2ee, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 633: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xa9a01a67  ! 635: FqTOi	fqtoi	
	.word 0xd647e4ec  ! 636: LDSW_I	ldsw	[%r31 + 0x04ec], %r11
debug_5_279:
	nop
	setx debug_5_279 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 637: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa769be1d  ! 638: SDIVX_I	sdivx	%r6, 0xfffffe1d, %r19
splash_tba_5_281:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 639: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_5_282:
	setx 0xef0afc34f1b37b6f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 640: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_5_283:
	nop
	setx debug_5_283 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 641: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_284)) -> intp(1,0,31)
intvec_5_284:
	.word 0x39400001  ! 642: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 643: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b696442  ! 644: SDIVX_I	sdivx	%r5, 0x0442, %r13
	.word 0xd2d004a0  ! 645: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01973  ! 646: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916a69ee  ! 647: SDIVX_I	sdivx	%r9, 0x09ee, %r8
pmu_5_288:
	nop
	setx 0xfffff44cfffff37d, %g1, %g7
	.word 0xa3800007  ! 648: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 649: LDX_R	ldx	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 650: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe01ff035  ! 651: LDD_I	ldd	[%r31 + 0xfffff035], %r16
mondo_5_289:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d950006  ! 652: WRPR_WSTATE_R	wrpr	%r20, %r6, %wstate
splash_lsu_5_290:
	setx 0x197da911340e8307, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 653: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_5_291:
	nop
	setx debug_5_291 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 654: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902003  ! 655: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81982e4c  ! 656: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4c, %hpstate
tagged_5_292:
	tsubcctv %r7, 0x1efd, %r26
	.word 0xe007f035  ! 657: LDUW_I	lduw	[%r31 + 0xfffff035], %r16
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01966  ! 658: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916b6974  ! 659: SDIVX_I	sdivx	%r13, 0x0974, %r8
	.word 0x81510000  ! 660: RDPR_TICK	rdpr	%tick, %r0
	setx 0xe9a8772561cd8a3c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_295:
	.word 0x39400001  ! 661: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_5_296:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 662: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_5_297:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd135000d  ! 1: STQF_R	-	%f8, [%r13, %r20]
	normalw
	.word 0xa9458000  ! 663: RD_SOFTINT_REG	rd	%softint, %r20
pmu_5_298:
	nop
	setx 0xfffff516fffff58c, %g1, %g7
	.word 0xa3800007  ! 664: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_5_299:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_299:
	.word 0x8f902001  ! 665: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_5_300:
	nop
	setx debug_5_300 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 666: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902005  ! 667: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd68008a0  ! 668: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_tba_5_301:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 669: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_302)) -> intp(3,0,30)
intvec_5_302:
	.word 0x39400001  ! 670: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_5_303:
	set 0x003b0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 671: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_5_304:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d930011  ! 672: WRPR_WSTATE_R	wrpr	%r12, %r17, %wstate
	.word 0xd68804a0  ! 673: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0xd68008a0  ! 674: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	setx 0x5ac590c1d8247f5a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_305:
	.word 0x39400001  ! 675: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 676: WRASI_I	wr	%r0, 0x0014, %asi
	setx ivw_5_306, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_306:
	.word 0xa5a00162  ! 677: FABSq	dis not found

	.word 0x9145c000  ! 678: RD_TICK_CMPR_REG	rd	%-, %r8
splash_lsu_5_307:
	setx 0x4b2a926bf0252d07, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 679: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_5_308:
	tsubcctv %r8, 0x18fb, %r14
	.word 0xe807eed1  ! 680: LDUW_I	lduw	[%r31 + 0x0ed1], %r20
splash_cmpr_5_309:
	setx 0x2c4a16d86955d388, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 681: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879023a3  ! 682: WRPR_TT_I	wrpr	%r0, 0x03a3, %tt
tagged_5_310:
	tsubcctv %r2, 0x147f, %r6
	.word 0xe807eed1  ! 683: LDUW_I	lduw	[%r31 + 0x0ed1], %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976b765f  ! 684: SDIVX_I	sdivx	%r13, 0xfffff65f, %r11
change_to_randtl_5_312:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_312:
	.word 0x8f902001  ! 685: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_5_313:
	nop
	setx debug_5_313 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 686: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_5_314:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_314:
	.word 0x8f902002  ! 687: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_5_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d948012  ! 688: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
	.word 0x93902007  ! 689: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
debug_5_316:
	nop
	setx debug_5_316 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 690: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0xf6e7fd5dd5d98658, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_317:
	.word 0x39400001  ! 691: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 692: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 693: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xad807491  ! 694: WR_SOFTINT_REG_I	wr	%r1, 0x1491, %softint
	.word 0x87802089  ! 695: WRASI_I	wr	%r0, 0x0089, %asi
change_to_randtl_5_318:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_318:
	.word 0x8f902002  ! 696: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01965  ! 697: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936aa2eb  ! 698: SDIVX_I	sdivx	%r10, 0x02eb, %r9
debug_5_321:
	nop
	setx debug_5_321 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 699: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_5_322:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 700: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_5_323:
	taddcctv %r24, 0x1642, %r6
	.word 0xe407f52a  ! 701: LDUW_I	lduw	[%r31 + 0xfffff52a], %r18
mondo_5_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d94800a  ! 702: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 703: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9022d0  ! 704: WRPR_PSTATE_I	wrpr	%r0, 0x02d0, %pstate
	.word 0x93a01a61  ! 705: FqTOi	fqtoi	
	.word 0x8198279c  ! 706: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079c, %hpstate
	setx ivw_5_325, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_325:
	.word 0x9ba00166  ! 707: FABSq	dis not found

	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 708: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 709: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8198211f  ! 710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011f, %hpstate
	.word 0xd237f52a  ! 711: STH_I	sth	%r9, [%r31 + 0xfffff52a]
	.word 0x9f8031a5  ! 712: SIR	sir	0x11a5
	.word 0xd317c000  ! 713: LDQF_R	-	[%r31, %r0], %f9
splash_cmpr_5_326:
	setx 0x0ded5d45efb0f216, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 714: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 715: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_5_327:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 716: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_5_328:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d948006  ! 717: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
	.word 0xd337e0ec  ! 718: STQF_I	-	%f9, [0x00ec, %r31]
	.word 0x91454000  ! 719: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0x99902000  ! 720: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xd48008a0  ! 721: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_cmpr_5_329:
	setx 0xb4319284c7844933, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 722: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_330:
	setx 0xd429a3b516112bb8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 723: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_5_331, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_331:
	.word 0x97a00164  ! 724: FABSq	dis not found

splash_tba_5_332:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 725: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879022a1  ! 726: WRPR_TT_I	wrpr	%r0, 0x02a1, %tt
	.word 0x91d02033  ! 727: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe20fe0ec  ! 728: LDUB_I	ldub	[%r31 + 0x00ec], %r17
	.word 0x81510000  ! 729: RDPR_TICK	rdpr	%tick, %r0
	setx ivw_5_333, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_333:
	.word 0x95a00169  ! 730: FABSq	dis not found

	.word 0x91d02035  ! 731: Tcc_I	ta	icc_or_xcc, %r0 + 53
mondo_5_334:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d910013  ! 732: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
	.word 0x93902001  ! 733: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87802010  ! 734: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x87802080  ! 735: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xe917c000  ! 736: LDQF_R	-	[%r31, %r0], %f20
	setx ivw_5_335, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_335:
	.word 0x97a0016a  ! 737: FABSq	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_336)) -> intp(1,0,18)
intvec_5_336:
	.word 0x39400001  ! 738: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_5_337:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x91a00553  ! 1: FSQRTd	fsqrt	
	.word 0xa1a44831  ! 739: FADDs	fadds	%f17, %f17, %f16
change_to_randtl_5_338:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_338:
	.word 0x8f902001  ! 740: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_5_339:
	setx 0xc86bd8de4ab20c7b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 741: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe6800c40  ! 742: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r19
debug_5_340:
	nop
	setx debug_5_340 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 743: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956aac4b  ! 744: SDIVX_I	sdivx	%r10, 0x0c4b, %r10
splash_htba_5_342:
	set 0x003b0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 745: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd01ffb39  ! 746: LDD_I	ldd	[%r31 + 0xfffffb39], %r8
	.word 0x2a800001  ! 747: BCS	bcs,a	<label_0x1>
	.word 0x93902002  ! 748: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_lsu_5_343:
	setx 0x07237e18c40b0b5d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 749: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa3a349d4  ! 750: FDIVd	fdivd	%f44, %f20, %f48
	.word 0xad8420cb  ! 751: WR_SOFTINT_REG_I	wr	%r16, 0x00cb, %softint
debug_5_344:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 752: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93454000  ! 753: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0x879023b4  ! 754: WRPR_TT_I	wrpr	%r0, 0x03b4, %tt
	.word 0xe28804a0  ! 755: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 756: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_5_345:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 757: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x8d9024c7  ! 758: WRPR_PSTATE_I	wrpr	%r0, 0x04c7, %pstate
	.word 0x879021dd  ! 759: WRPR_TT_I	wrpr	%r0, 0x01dd, %tt
DS_5_346:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f28, %f4, %f14
	.word 0x9bb4430b  ! 760: ALIGNADDRESS	alignaddr	%r17, %r11, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01971  ! 761: FqTOd	dis not found

	.word 0xda4fc000  ! 762: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a0196c  ! 763: FqTOd	dis not found

	.word 0xa190200e  ! 764: WRPR_GL_I	wrpr	%r0, 0x000e, %-
mondo_5_349:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d940006  ! 765: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
	.word 0xd327ed48  ! 766: STF_I	st	%f9, [0x0d48, %r31]
	.word 0xd2c80e60  ! 767: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 768: LDX_R	ldx	[%r31 + %r0], %r9
DS_5_350:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 769: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd257ed48  ! 770: LDSH_I	ldsh	[%r31 + 0x0d48], %r9
	.word 0xd28fe000  ! 771: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r9
DS_5_351:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa9b44310  ! 772: ALIGNADDRESS	alignaddr	%r17, %r16, %r20
	.word 0xab804004  ! 773: WR_CLEAR_SOFTINT_R	wr	%r1, %r4, %clear_softint
	.word 0xe457c000  ! 774: LDSH_R	ldsh	[%r31 + %r0], %r18
intveclr_5_352:
	setx 0xf4518afdfcc86086, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 775: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_5_353:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d94c014  ! 776: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
mondo_5_354:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d924004  ! 777: WRPR_WSTATE_R	wrpr	%r9, %r4, %wstate
	.word 0xe41fc000  ! 778: LDD_R	ldd	[%r31 + %r0], %r18
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 779: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01974  ! 780: FqTOd	dis not found

	.word 0xd037ed48  ! 781: STH_I	sth	%r8, [%r31 + 0x0d48]
splash_lsu_5_356:
	setx 0xa54880472bafe60f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 782: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_5_357:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 783: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xd11fed48  ! 784: LDDF_I	ldd	[%r31, 0x0d48], %f8
debug_5_358:
	nop
	setx debug_5_358 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 785: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_5_359:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd310c00d  ! 1: LDQF_R	-	[%r3, %r13], %f9
	.word 0x93a40831  ! 786: FADDs	fadds	%f16, %f17, %f9
splash_cmpr_5_360:
	setx 0x4e5ededa4c83fcbf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 787: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 788: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 789: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01969  ! 790: FqTOd	dis not found

	.word 0x8d903da2  ! 791: WRPR_PSTATE_I	wrpr	%r0, 0x1da2, %pstate
	.word 0xe6800b60  ! 792: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r19
splash_cmpr_5_362:
	setx 0x9029efcdaf8034f9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 793: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xdf7e2f703a2e349f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_363:
	.word 0x39400001  ! 794: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 795: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x20700001  ! 796: BPN	<illegal instruction>
	.word 0xe67fed48  ! 797: SWAP_I	swap	%r19, [%r31 + 0x0d48]
	.word 0x8d903d5c  ! 798: WRPR_PSTATE_I	wrpr	%r0, 0x1d5c, %pstate
change_to_randtl_5_364:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_364:
	.word 0x8f902002  ! 799: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 800: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe677c007  ! 801: STX_R	stx	%r19, [%r31 + %r7]
	.word 0xe6c7e020  ! 802: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r19
splash_htba_5_365:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 803: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_5_366:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d940012  ! 804: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
	setx ivw_5_367, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_367:
	.word 0xa1a00172  ! 805: FABSq	dis not found

	.word 0x879020c1  ! 806: WRPR_TT_I	wrpr	%r0, 0x00c1, %tt
	.word 0x83d02034  ! 807: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x9950c000  ! 808: RDPR_TT	<illegal instruction>
	.word 0x8d903c78  ! 809: WRPR_PSTATE_I	wrpr	%r0, 0x1c78, %pstate
	.word 0x879023f3  ! 810: WRPR_TT_I	wrpr	%r0, 0x03f3, %tt
	.word 0xe48008a0  ! 811: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe537ed48  ! 812: STQF_I	-	%f18, [0x0d48, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 813: LDX_R	ldx	[%r31 + %r0], %r18
mondo_5_368:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d900013  ! 814: WRPR_WSTATE_R	wrpr	%r0, %r19, %wstate
	setx 0x159a138d2f1aff90, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_369:
	.word 0x39400001  ! 815: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_5_370:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d944011  ! 816: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
tagged_5_371:
	taddcctv %r21, 0x1c5a, %r2
	.word 0xe407ed48  ! 817: LDUW_I	lduw	[%r31 + 0x0d48], %r18
splash_cmpr_5_372:
	setx 0x69bb4d480a3904d3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 818: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_373:
	nop
	setx debug_5_373 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 819: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 820: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe4880e60  ! 821: LDUBA_R	lduba	[%r0, %r0] 0x73, %r18
mondo_5_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d928013  ! 822: WRPR_WSTATE_R	wrpr	%r10, %r19, %wstate
	.word 0x91a4cdc3  ! 823: FdMULq	fdmulq	
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 824: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903aea  ! 825: WRPR_PSTATE_I	wrpr	%r0, 0x1aea, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 826: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4dfe010  ! 827: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r10
	.word 0xab81c012  ! 828: WR_CLEAR_SOFTINT_R	wr	%r7, %r18, %clear_softint
	.word 0xd46fed48  ! 829: LDSTUB_I	ldstub	%r10, [%r31 + 0x0d48]
	setx 0xb6b110f3b173e902, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_375:
	.word 0x39400001  ! 830: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_5_376:
	nop
	setx debug_5_376 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 831: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87902048  ! 832: WRPR_TT_I	wrpr	%r0, 0x0048, %tt
	setx ivw_5_377, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_377:
	.word 0x93a0016b  ! 833: FABSq	dis not found

	.word 0xa5540000  ! 834: RDPR_GL	rdpr	%-, %r18
	.word 0xd73fed48  ! 835: STDF_I	std	%f11, [0x0d48, %r31]
	.word 0xa1902006  ! 836: WRPR_GL_I	wrpr	%r0, 0x0006, %-
DS_5_378:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xc1542a21	! Random illegal ?
	.word 0x97a00551  ! 1: FSQRTd	fsqrt	
	.word 0x93a00828  ! 837: FADDs	fadds	%f0, %f8, %f9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 838: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd69004a0  ! 839: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0x93902001  ! 840: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
debug_5_379:
	nop
	setx debug_5_379 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 841: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_5_380:
	setx 0x1329e575f438212e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 842: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_5_381:
	setx 0x72994362edf9b279, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 843: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 844: RDPR_TICK	rdpr	%tick, %r0
	setx ivw_5_382, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_382:
	.word 0xa1a0016c  ! 845: FABSq	dis not found

	.word 0xd89004a0  ! 846: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0xd91fc000  ! 847: LDDF_R	ldd	[%r31, %r0], %f12
change_to_randtl_5_383:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_383:
	.word 0x8f902000  ! 848: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd88008a0  ! 849: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_tba_5_384:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 850: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_5_385:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd5140011  ! 1: LDQF_R	-	[%r16, %r17], %f10
	.word 0xa9a04834  ! 851: FADDs	fadds	%f1, %f20, %f20
debug_5_386:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 852: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916934a8  ! 853: SDIVX_I	sdivx	%r4, 0xfffff4a8, %r8
	.word 0xe647f42d  ! 854: LDSW_I	ldsw	[%r31 + 0xfffff42d], %r19
	.word 0xe717c000  ! 855: LDQF_R	-	[%r31, %r0], %f19
	.word 0x8780204f  ! 856: WRASI_I	wr	%r0, 0x004f, %asi
intveclr_5_388:
	setx 0xd8e3fd23b30c62de, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 857: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_5_389:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe534c011  ! 1: STQF_R	-	%f18, [%r17, %r19]
	normalw
	.word 0xa3458000  ! 858: RD_SOFTINT_REG	rd	%softint, %r17
debug_5_390:
	nop
	setx debug_5_390 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 859: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d9037d3  ! 860: WRPR_PSTATE_I	wrpr	%r0, 0x17d3, %pstate
	.word 0xad8432a3  ! 861: WR_SOFTINT_REG_I	wr	%r16, 0x12a3, %softint
splash_cmpr_5_391:
	setx 0xf5827f4e664faf88, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 862: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_392:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xcd59b9de	! Random illegal ?
	.word 0xd9134006  ! 1: LDQF_R	-	[%r13, %r6], %f12
	.word 0x91a30833  ! 863: FADDs	fadds	%f12, %f19, %f8
	.word 0xd88804a0  ! 864: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
splash_cmpr_5_393:
	setx 0xb222aae1e1ddeb1a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 865: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_394:
	nop
	setx debug_5_394 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 866: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd8d004a0  ! 867: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0xa5480000  ! 868: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	setx 0x59b903f9e264c42b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_395:
	.word 0x39400001  ! 869: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x98d88012  ! 870: SMULcc_R	smulcc 	%r2, %r18, %r12
	.word 0xa1902001  ! 871: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_lsu_5_396:
	setx 0xe351198c0c1809d7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 872: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_5_397:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_397:
	.word 0x8f902003  ! 873: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xe63ff1d4  ! 874: STD_I	std	%r19, [%r31 + 0xfffff1d4]
splash_cmpr_5_398:
	setx 0x2c74b2aa17654476, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 875: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_399:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe5314007  ! 1: STQF_R	-	%f18, [%r7, %r5]
	normalw
	.word 0xa1458000  ! 876: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x93902006  ! 877: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa1902009  ! 878: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 879: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902011  ! 880: WRPR_TT_I	wrpr	%r0, 0x0011, %tt
splash_cmpr_5_400:
	setx 0xa0cdfbdfa206ed98, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 881: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d02035  ! 882: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x22700001  ! 883: BPE	<illegal instruction>
	.word 0xe317c000  ! 884: LDQF_R	-	[%r31, %r0], %f17
	.word 0x8d902b0f  ! 885: WRPR_PSTATE_I	wrpr	%r0, 0x0b0f, %pstate
splash_cmpr_5_401:
	setx 0x295582c41a5224fd, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 886: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe2d00e80  ! 887: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r17
splash_lsu_5_402:
	setx 0x68fc2aba2867ce21, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 888: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_5_403:
	setx 0x524aae7fe301d104, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 889: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 890: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x99a189d4  ! 891: FDIVd	fdivd	%f6, %f20, %f12
DS_5_404:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd1300004  ! 1: STQF_R	-	%f8, [%r4, %r0]
	normalw
	.word 0x93458000  ! 892: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8d9020fe  ! 893: WRPR_PSTATE_I	wrpr	%r0, 0x00fe, %pstate
	.word 0x8d90328b  ! 894: WRPR_PSTATE_I	wrpr	%r0, 0x128b, %pstate
	.word 0x8d903ed3  ! 895: WRPR_PSTATE_I	wrpr	%r0, 0x1ed3, %pstate
splash_cmpr_5_405:
	setx 0xef42a3cb3677fe10, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 896: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2a800001  ! 897: BCS	bcs,a	<label_0x1>
splash_cmpr_5_406:
	setx 0x503ebf180a916943, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 898: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_407:
	setx 0x52c776882b85da4a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 899: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_408)) -> intp(2,0,2)
intvec_5_408:
	.word 0x39400001  ! 900: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_5_409:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d940012  ! 901: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 902: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 903: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a0196c  ! 904: FqTOd	dis not found

pmu_5_411:
	nop
	setx 0xfffff8a5fffff19a, %g1, %g7
	.word 0xa3800007  ! 905: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_5_412:
	setx 0xddd37c1cb4424a5e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 906: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9745c000  ! 907: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0xd86ff1d4  ! 908: LDSTUB_I	ldstub	%r12, [%r31 + 0xfffff1d4]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 909: LDX_R	ldx	[%r31 + %r0], %r12
tagged_5_413:
	taddcctv %r16, 0x1369, %r18
	.word 0xd807f1d4  ! 910: LDUW_I	lduw	[%r31 + 0xfffff1d4], %r12
DS_5_414:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd7352441  ! 1: STQF_I	-	%f11, [0x0441, %r20]
	normalw
	.word 0x91458000  ! 911: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8d802000  ! 912: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d020b4  ! 913: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x879021db  ! 914: WRPR_TT_I	wrpr	%r0, 0x01db, %tt
	.word 0x91d020b5  ! 915: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_cmpr_5_415:
	setx 0x656e2cd0f0c88640, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 916: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_5_416:
	setx 0xc79d1948b2249562, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 917: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_5_417:
	nop
	setx debug_5_417 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 918: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx ivw_5_418, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_418:
	.word 0x97a0016c  ! 919: FABSq	dis not found

	.word 0x93902002  ! 920: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
debug_5_419:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 921: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd397ea29  ! 922: LDQFA_I	-	[%r31, 0x0a29], %f9
	.word 0x8790204d  ! 923: WRPR_TT_I	wrpr	%r0, 0x004d, %tt
	.word 0xd33fc012  ! 924: STDF_R	std	%f9, [%r18, %r31]
	.word 0xa190200c  ! 925: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa190200f  ! 926: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xd25fea29  ! 927: LDX_I	ldx	[%r31 + 0x0a29], %r9
	setx ivw_5_420, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_420:
	.word 0x95a00165  ! 928: FABSq	dis not found

	.word 0xdac7e020  ! 929: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01964  ! 930: FqTOd	dis not found

intveclr_5_422:
	setx 0x020babcdfe71a5ae, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 931: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_5_423:
	nop
	setx debug_5_423 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 932: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x819820e5  ! 933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00e5, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 934: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_5_424:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d914002  ! 935: WRPR_WSTATE_R	wrpr	%r5, %r2, %wstate
	.word 0xd21fc000  ! 936: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01962  ! 937: FqTOd	dis not found

mondo_5_426:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d950005  ! 938: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	.word 0x87802063  ! 939: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x93902000  ! 940: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd43fc00d  ! 941: STD_R	std	%r10, [%r31 + %r13]
	.word 0xd48fe000  ! 942: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r10
	.word 0x94d9000a  ! 943: SMULcc_R	smulcc 	%r4, %r10, %r10
	.word 0xd00fc000  ! 944: LDUB_R	ldub	[%r31 + %r0], %r8
	.word 0x93902002  ! 945: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
donret_5_427:
	nop
	setx donretarg_5_427, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r21, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_427:
	.word 0xd0ffea29  ! 946: SWAPA_I	swapa	%r8, [%r31 + 0x0a29] %asi
DS_5_428:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 947: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd09fc020  ! 948: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
splash_lsu_5_429:
	setx 0xd2e8970c21159f2d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 949: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802088  ! 950: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd0d7e010  ! 951: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
splash_lsu_5_430:
	setx 0x654129a8e3573eeb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 952: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 953: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a0196a  ! 954: FqTOd	dis not found

	.word 0x93902001  ! 955: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa1902003  ! 956: WRPR_GL_I	wrpr	%r0, 0x0003, %-
debug_5_432:
	nop
	setx debug_5_432 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 957: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_5_433:
	setx 0x33f678f0f3cc477d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 958: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_5_434:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd1324012  ! 1: STQF_R	-	%f8, [%r18, %r9]
	normalw
	.word 0x91458000  ! 959: RD_SOFTINT_REG	rd	%softint, %r8
splash_htba_5_435:
	set 0x003b0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 960: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x9f802a24  ! 961: SIR	sir	0x0a24
	.word 0xd6800c00  ! 962: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r11
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 963: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_5_436:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_436:
	.word 0x8f902000  ! 964: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x99902002  ! 965: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
splash_cmpr_5_437:
	setx 0xf9388596772ffad0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 966: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902291  ! 967: WRPR_TT_I	wrpr	%r0, 0x0291, %tt
splash_lsu_5_438:
	setx 0xe8c6fe01dbf71d03, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_439:
	setx 0x9a895f2205b6f4d7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 969: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9037fa  ! 970: WRPR_PSTATE_I	wrpr	%r0, 0x17fa, %pstate
	.word 0xd61fc000  ! 971: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd657c000  ! 972: LDSH_R	ldsh	[%r31 + %r0], %r11
change_to_randtl_5_440:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_440:
	.word 0x8f902001  ! 973: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d9035c2  ! 974: WRPR_PSTATE_I	wrpr	%r0, 0x15c2, %pstate
splash_cmpr_5_441:
	setx 0x7cb37511152df21f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 975: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902255  ! 976: WRPR_TT_I	wrpr	%r0, 0x0255, %tt
	.word 0xa3480000  ! 977: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
debug_5_442:
	nop
	setx debug_5_442 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 978: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_5_443:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 979: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d90202c  ! 980: WRPR_PSTATE_I	wrpr	%r0, 0x002c, %pstate
tagged_5_444:
	tsubcctv %r18, 0x1599, %r16
	.word 0xe407ec60  ! 981: LDUW_I	lduw	[%r31 + 0x0c60], %r18
	.word 0x87802020  ! 982: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x93902004  ! 983: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe41fc000  ! 984: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x81510000  ! 985: RDPR_TICK	rdpr	%tick, %r0
	.word 0x91d02035  ! 986: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe4800c60  ! 987: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r18
splash_tba_5_445:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 988: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_5_446:
	setx 0x8a253ac7a335d0da, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 989: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_5_447:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d94c007  ! 990: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
change_to_randtl_5_448:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_448:
	.word 0x8f902002  ! 991: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x93902004  ! 992: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa9480000  ! 993: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0x8d802004  ! 994: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa980c008  ! 995: WR_SET_SOFTINT_R	wr	%r3, %r8, %set_softint
debug_5_449:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 996: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_5_450:
	setx 0x0a16aa43cc97b4e3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 997: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd28fe030  ! 998: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r9
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
mondo_4_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d92c00a  ! 1: WRPR_WSTATE_R	wrpr	%r11, %r10, %wstate
	.word 0x8d903cc5  ! 2: WRPR_PSTATE_I	wrpr	%r0, 0x1cc5, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 3: LDX_R	ldx	[%r31 + %r0], %r13
	setx 0xf388754138fd5edb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_1:
	.word 0x39400001  ! 4: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6aafd3  ! 5: SDIVX_I	sdivx	%r10, 0x0fd3, %r13
	.word 0xab824012  ! 6: WR_CLEAR_SOFTINT_R	wr	%r9, %r18, %clear_softint
splash_cmpr_4_3:
	setx 0x58398786a0a8a6b2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802089  ! 8: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d902b0a  ! 9: WRPR_PSTATE_I	wrpr	%r0, 0x0b0a, %pstate
	.word 0xd637e0e3  ! 10: STH_I	sth	%r11, [%r31 + 0x00e3]
	.word 0xd68008a0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_4_4:
	setx 0x142fd0dc2186af2a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 12: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_4_5:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 13: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_4_6:
	setx 0xe4553445bac65254, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 14: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 15: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_4_7:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f0, %f0, %f26
	.word 0x9bb40308  ! 16: ALIGNADDRESS	alignaddr	%r16, %r8, %r13
	.word 0x81982abc  ! 17: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0abc, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01970  ! 18: FqTOd	dis not found

	.word 0xd797e0e3  ! 19: LDQFA_I	-	[%r31, 0x00e3], %f11
	.word 0xa2d1c012  ! 20: UMULcc_R	umulcc 	%r7, %r18, %r17
tagged_4_9:
	taddcctv %r12, 0x1779, %r4
	.word 0xe807e0e3  ! 21: LDUW_I	lduw	[%r31 + 0x00e3], %r20
	.word 0x91d02032  ! 22: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe89fc020  ! 23: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	setx ivw_4_10, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_10:
	.word 0x99a00162  ! 24: FABSq	dis not found

	.word 0xe49fc020  ! 25: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
	.word 0x819827ef  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07ef, %hpstate
	.word 0x9150c000  ! 27: RDPR_TT	<illegal instruction>
	setx ivw_4_11, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_11:
	.word 0x9ba00163  ! 28: FABSq	dis not found

	.word 0x879021e9  ! 29: WRPR_TT_I	wrpr	%r0, 0x01e9, %tt
mondo_4_12:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d908005  ! 30: WRPR_WSTATE_R	wrpr	%r2, %r5, %wstate
	.word 0x91a0c9d3  ! 31: FDIVd	fdivd	%f34, %f50, %f8
	.word 0x9f802257  ! 32: SIR	sir	0x0257
	.word 0xe41fc000  ! 33: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x36700001  ! 34: BPGE	<illegal instruction>
donret_4_13:
	nop
	setx donretarg_4_13, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r9, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_13:
	.word 0xe4fffe6a  ! 35: SWAPA_I	swapa	%r18, [%r31 + 0xfffffe6a] %asi
DS_4_14:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xfd6fef68	! Random illegal ?
	.word 0xe111c013  ! 1: LDQF_R	-	[%r7, %r19], %f16
	.word 0x93a50823  ! 36: FADDs	fadds	%f20, %f3, %f9
	.word 0x96c2fdeb  ! 37: ADDCcc_I	addccc 	%r11, 0xfffffdeb, %r11
	.word 0xe517c000  ! 38: LDQF_R	-	[%r31, %r0], %f18
splash_cmpr_4_15:
	setx 0xec16214299f19fb6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 39: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_4_16, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_16:
	.word 0x93a0016b  ! 40: FABSq	dis not found

	.word 0xd49fc020  ! 41: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
splash_cmpr_4_17:
	setx 0x1c42251139279bca, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 42: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f8030f5  ! 43: SIR	sir	0x10f5
	.word 0xa8dc400a  ! 44: SMULcc_R	smulcc 	%r17, %r10, %r20
splash_lsu_4_18:
	setx 0xa8df0d5bed70d023, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 45: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 46: RD_STICK_REG	stbar
	.word 0x93902006  ! 47: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x3a700001  ! 48: BPCC	<illegal instruction>
	.word 0xd4800ae0  ! 49: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01971  ! 50: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01965  ! 51: FqTOd	dis not found

	setx 0xb7989395c6c1893b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_21:
	.word 0x39400001  ! 52: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe207c000  ! 53: LDUW_R	lduw	[%r31 + %r0], %r17
	.word 0xe337fa5d  ! 54: STQF_I	-	%f17, [0x1a5d, %r31]
splash_cmpr_4_22:
	setx 0x9a4e6ed060b64206, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_23:
	setx 0xd2db86edb2d7e143, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 56: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe21ffa5d  ! 57: LDD_I	ldd	[%r31 + 0xfffffa5d], %r17
splash_cmpr_4_24:
	setx 0xbf54a5532db8bde1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_4_25:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 59: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe2c004a0  ! 60: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r17
	.word 0x93902000  ! 61: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_cmpr_4_26:
	setx 0x8c87a93087c8a097, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_27:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe314c006  ! 1: LDQF_R	-	[%r19, %r6], %f17
	.word 0xa3a34830  ! 63: FADDs	fadds	%f13, %f16, %f17
	.word 0x9b500000  ! 64: RDPR_TPC	<illegal instruction>
	.word 0xe6900e80  ! 65: LDUHA_R	lduha	[%r0, %r0] 0x74, %r19
donret_4_28:
	nop
	setx donretarg_4_28, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r6, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_28:
	.word 0xe6fffa5d  ! 66: SWAPA_I	swapa	%r19, [%r31 + 0xfffffa5d] %asi
debug_4_29:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 67: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_4_30:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 68: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
change_to_randtl_4_31:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_31:
	.word 0x8f902000  ! 69: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
!$EV trig_pc_d(1, @VA(.MAIN.xir_4_32)) -> intp(4,1,3)
xir_4_32:
	.word 0xa9827bfe  ! 70: WR_SET_SOFTINT_I	wr	%r9, 0x1bfe, %set_softint
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 71: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x99902000  ! 72: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
mondo_4_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d910002  ! 73: WRPR_WSTATE_R	wrpr	%r4, %r2, %wstate
	.word 0x97450000  ! 74: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0x928229e1  ! 75: ADDcc_I	addcc 	%r8, 0x09e1, %r9
mondo_4_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d920000  ! 76: WRPR_WSTATE_R	wrpr	%r8, %r0, %wstate
	.word 0x81982c14  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c14, %hpstate
	.word 0xd527fcdf  ! 78: STF_I	st	%f10, [0x1cdf, %r31]
	.word 0xd597fcdf  ! 79: LDQFA_I	-	[%r31, 0x1cdf], %f10
tagged_4_35:
	taddcctv %r21, 0x144e, %r26
	.word 0xd407fcdf  ! 80: LDUW_I	lduw	[%r31 + 0xfffffcdf], %r10
	.word 0x99500000  ! 81: RDPR_TPC	rdpr	%tpc, %r12
intveclr_4_36:
	setx 0xd19e8b25125274e5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 82: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6800be0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r11
	.word 0xd66ffcdf  ! 84: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffffcdf]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16b2448  ! 85: SDIVX_I	sdivx	%r12, 0x0448, %r16
intveclr_4_38:
	setx 0x3a2ea56995112781, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d918014  ! 87: WRPR_WSTATE_R	wrpr	%r6, %r20, %wstate
	.word 0x2e700001  ! 88: BPVS	<illegal instruction>
debug_4_40:
	nop
	setx debug_4_40 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 89: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_4_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 90: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x819826ac  ! 91: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06ac, %hpstate
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 92: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx ivw_4_42, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_42:
	.word 0xa1a00174  ! 93: FABSq	dis not found

	.word 0xd647ec7e  ! 94: LDSW_I	ldsw	[%r31 + 0x0c7e], %r11
	.word 0x2a800001  ! 95: BCS	bcs,a	<label_0x1>
	.word 0xd6d804a0  ! 96: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_4_43)) -> intp(4,1,3)
xir_4_43:
	.word 0xa9807c89  ! 97: WR_SET_SOFTINT_I	wr	%r1, 0x1c89, %set_softint
	.word 0x8d90399c  ! 98: WRPR_PSTATE_I	wrpr	%r0, 0x199c, %pstate
mondo_4_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d934012  ! 99: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
	.word 0x91d02035  ! 100: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87902198  ! 101: WRPR_TT_I	wrpr	%r0, 0x0198, %tt
debug_4_45:
	nop
	setx debug_4_45 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 102: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd71fc000  ! 103: LDDF_R	ldd	[%r31, %r0], %f11
DS_4_46:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 104: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd6900e80  ! 105: LDUHA_R	lduha	[%r0, %r0] 0x74, %r11
	.word 0xd69ffa49  ! 106: LDDA_I	ldda	[%r31, + 0xfffffa49] %asi, %r11
	.word 0x87902115  ! 107: WRPR_TT_I	wrpr	%r0, 0x0115, %tt
	.word 0x99450000  ! 108: RD_SET_SOFTINT	rd	%set_softint, %r12
debug_4_47:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 109: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81982ecc  ! 110: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecc, %hpstate
	.word 0x95a189d4  ! 111: FDIVd	fdivd	%f6, %f20, %f10
debug_4_48:
	nop
	setx debug_4_48 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 112: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802063  ! 113: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x81982dfc  ! 114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dfc, %hpstate
	.word 0x8198215c  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015c, %hpstate
intveclr_4_49:
	setx 0xb142e1a456034185, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 116: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 117: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x966c2598  ! 118: UDIVX_I	udivx 	%r16, 0x0598, %r11
	.word 0xd0800c60  ! 119: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r8
tagged_4_50:
	tsubcctv %r23, 0x11d3, %r24
	.word 0xd007f324  ! 120: LDUW_I	lduw	[%r31 + 0xfffff324], %r8
	.word 0xa1902004  ! 121: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_tba_4_51:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 122: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_4_52:
	nop
	setx debug_4_52 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 123: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902004  ! 124: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01962  ! 125: FqTOd	dis not found

debug_4_54:
	nop
	setx debug_4_54 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 126: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902001  ! 127: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_randtl_4_55:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_55:
	.word 0x8f902000  ! 128: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_4_56:
	setx 0xbcf172f5156623f9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_57:
	setx 0xa71c0914b75851e9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 130: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_58:
	setx 0x2ab4027083ce4516, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 131: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 132: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x81982ce5  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ce5, %hpstate
intveclr_4_59:
	setx 0x575a7ff912e69fef, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 134: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd66ff324  ! 135: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff324]
	.word 0xd627f324  ! 136: STW_I	stw	%r11, [%r31 + 0xfffff324]
	.word 0xd69fc020  ! 137: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
debug_4_60:
	nop
	setx debug_4_60 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 138: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_4_61:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d944001  ! 139: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
	.word 0xd677f324  ! 140: STX_I	stx	%r11, [%r31 + 0xfffff324]
	.word 0x8d902c05  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x0c05, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_62)) -> intp(3,0,23)
intvec_4_62:
	.word 0x39400001  ! 142: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81982375  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0375, %hpstate
	setx 0xbf6c6f2bfb377c2e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_63:
	.word 0x39400001  ! 144: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d94c00c  ! 145: WRPR_WSTATE_R	wrpr	%r19, %r12, %wstate
splash_lsu_4_65:
	setx 0x75a3a52002f63c83, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 146: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902000  ! 147: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_4_66:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d900002  ! 148: WRPR_WSTATE_R	wrpr	%r0, %r2, %wstate
DS_4_67:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 149: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
DS_4_68:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f26, %f8, %f18
	.word 0xa1b48312  ! 150: ALIGNADDRESS	alignaddr	%r18, %r18, %r16
intveclr_4_69:
	setx 0x98f5955e7a21aef0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 151: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd657f324  ! 152: LDSH_I	ldsh	[%r31 + 0xfffff324], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 153: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd727c006  ! 154: STF_R	st	%f11, [%r6, %r31]
	.word 0x93d02032  ! 155: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xa9850010  ! 156: WR_SET_SOFTINT_R	wr	%r20, %r16, %set_softint
debug_4_70:
	nop
	setx debug_4_70 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 157: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 158: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x93902002  ! 159: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91a089d0  ! 160: FDIVd	fdivd	%f2, %f16, %f8
DS_4_71:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f6, %f4, %f12
	.word 0x91b48308  ! 161: ALIGNADDRESS	alignaddr	%r18, %r8, %r8
donret_4_72:
	nop
	setx donretarg_4_72, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r18, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_72:
	.word 0xdafff324  ! 162: SWAPA_I	swapa	%r13, [%r31 + 0xfffff324] %asi
debug_4_73:
	nop
	setx debug_4_73 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_4_74:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 164: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200c  ! 165: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x99500000  ! 166: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x8d903e05  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x1e05, %pstate
splash_cmpr_4_75:
	setx 0x234b7f4a0c80c5cc, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 168: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902002  ! 169: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_4_76:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe931c002  ! 1: STQF_R	-	%f20, [%r2, %r7]
	normalw
	.word 0xa9458000  ! 170: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0x879023de  ! 171: WRPR_TT_I	wrpr	%r0, 0x03de, %tt
splash_cmpr_4_77:
	setx 0x0ddd63c2409a1a3e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d02035  ! 173: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x93902005  ! 174: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	setx ivw_4_78, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_78:
	.word 0x99a00173  ! 175: FABSq	dis not found

splash_cmpr_4_79:
	setx 0x44eca3e9db062d28, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 176: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_80:
	setx 0x91d0feafd7703581, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe7e7c030  ! 178: CASA_I	casa	[%r31] 0x 1, %r16, %r19
intveclr_4_81:
	setx 0xb688326f3796b1c3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 179: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902000  ! 180: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xe727c010  ! 181: STF_R	st	%f19, [%r16, %r31]
	.word 0xe6800b20  ! 182: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r19
	.word 0x81b01021  ! 183: SIAM	siam	1
	.word 0xa1902004  ! 184: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xe61fc000  ! 185: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x2c800001  ! 186: BNEG	bneg,a	<label_0x1>
	.word 0x20800001  ! 187: BN	bn,a	<label_0x1>
	.word 0xe69ff324  ! 188: LDDA_I	ldda	[%r31, + 0xfffff324] %asi, %r19
splash_cmpr_4_82:
	setx 0x689460fb0840647a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 189: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe67ff324  ! 190: SWAP_I	swap	%r19, [%r31 + 0xfffff324]
	setx 0xc7ebb39f5c7381ed, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_83:
	.word 0x39400001  ! 191: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
mondo_4_84:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d928007  ! 193: WRPR_WSTATE_R	wrpr	%r10, %r7, %wstate
DS_4_85:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 194: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe6bff324  ! 195: STDA_I	stda	%r19, [%r31 + 0xfffff324] %asi
mondo_4_86:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d908010  ! 196: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
change_to_randtl_4_87:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_87:
	.word 0x8f902002  ! 197: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01963  ! 198: FqTOd	dis not found

donret_4_89:
	nop
	setx donretarg_4_89, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r27, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_89:
	.word 0xe6fff324  ! 199: SWAPA_I	swapa	%r19, [%r31 + 0xfffff324] %asi
change_to_randtl_4_90:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_90:
	.word 0x8f902002  ! 200: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 201: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 202: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_4_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d918009  ! 203: WRPR_WSTATE_R	wrpr	%r6, %r9, %wstate
	.word 0x38700001  ! 204: BPGU	<illegal instruction>
	.word 0x81982346  ! 205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0346, %hpstate
	.word 0xe797f324  ! 206: LDQFA_I	-	[%r31, 0x1324], %f19
	.word 0x38800001  ! 207: BGU	bgu,a	<label_0x1>
splash_tba_4_92:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 208: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x819828ac  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ac, %hpstate
	.word 0x9f8022ab  ! 210: SIR	sir	0x02ab
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01971  ! 211: FqTOd	dis not found

	.word 0xe717c000  ! 212: LDQF_R	-	[%r31, %r0], %f19
	.word 0x81460000  ! 213: RD_STICK_REG	stbar
	.word 0xe6dfe020  ! 214: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r19
	.word 0xa1902003  ! 215: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_cmpr_4_94:
	setx 0xc89fcf6682bdc331, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902ae1  ! 217: WRPR_PSTATE_I	wrpr	%r0, 0x0ae1, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01974  ! 218: FqTOd	dis not found

debug_4_96:
	nop
	setx debug_4_96 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 219: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_4_97:
	setx 0x30fe0c98e63dfde9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 220: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd06ffc1f  ! 221: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffc1f]
	.word 0xd0d7e000  ! 222: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
tagged_4_98:
	tsubcctv %r10, 0x1368, %r15
	.word 0xd007fc1f  ! 223: LDUW_I	lduw	[%r31 + 0xfffffc1f], %r8
	.word 0xa5a449cb  ! 224: FDIVd	fdivd	%f48, %f42, %f18
mondo_4_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d900002  ! 225: WRPR_WSTATE_R	wrpr	%r0, %r2, %wstate
splash_cmpr_4_100:
	setx 0x02e35d6492f72392, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 226: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f80384e  ! 227: SIR	sir	0x184e
	.word 0xa190200e  ! 228: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x87902163  ! 229: WRPR_TT_I	wrpr	%r0, 0x0163, %tt
donret_4_101:
	nop
	setx donretarg_4_101, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r15, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_101:
	.word 0xd2ffeed1  ! 230: SWAPA_I	swapa	%r9, [%r31 + 0x0ed1] %asi
change_to_randtl_4_102:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_102:
	.word 0x8f902001  ! 231: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, @VA(.MAIN.xir_4_103)) -> intp(4,1,3)
xir_4_103:
	.word 0xa984a9e6  ! 232: WR_SET_SOFTINT_I	wr	%r18, 0x09e6, %set_softint
	.word 0xd20fc000  ! 233: LDUB_R	ldub	[%r31 + %r0], %r9
debug_4_104:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 234: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd207c000  ! 235: LDUW_R	lduw	[%r31 + %r0], %r9
change_to_randtl_4_105:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_105:
	.word 0x8f902001  ! 236: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_4_106:
	setx 0x7a98ab02854e2122, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 237: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d948012  ! 238: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
splash_tba_4_108:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 239: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd29ffeae  ! 240: LDDA_I	ldda	[%r31, + 0xfffffeae] %asi, %r9
	.word 0xd2880e80  ! 241: LDUBA_R	lduba	[%r0, %r0] 0x74, %r9
DS_4_109:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd112800c  ! 1: LDQF_R	-	[%r10, %r12], %f8
	.word 0x99a48832  ! 242: FADDs	fadds	%f18, %f18, %f12
debug_4_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 243: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x3c800001  ! 244: BPOS	bpos,a	<label_0x1>
	setx ivw_4_111, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_111:
	.word 0x9ba00174  ! 245: FABSq	dis not found

tagged_4_112:
	tsubcctv %r6, 0x17aa, %r4
	.word 0xd407feae  ! 246: LDUW_I	lduw	[%r31 + 0xfffffeae], %r10
	.word 0xd407c000  ! 247: LDUW_R	lduw	[%r31 + %r0], %r10
debug_4_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 248: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 249: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 250: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_4_114:
	setx 0x587667248311766d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 251: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 252: Tcc_I	ta	icc_or_xcc, %r0 + 179
DS_4_115:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 253: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xd47ffeae  ! 254: SWAP_I	swap	%r10, [%r31 + 0xfffffeae]
	.word 0xd537feae  ! 255: STQF_I	-	%f10, [0x1eae, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_116)) -> intp(5,0,28)
intvec_4_116:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x24800001  ! 257: BLE	ble,a	<label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 258: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa7a1c9cd  ! 259: FDIVd	fdivd	%f38, %f44, %f50
splash_tba_4_117:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 260: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x83d020b2  ! 261: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0x81982747  ! 262: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0747, %hpstate
change_to_randtl_4_118:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_118:
	.word 0x8f902002  ! 263: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 264: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xad81e298  ! 265: WR_SOFTINT_REG_I	wr	%r7, 0x0298, %softint
	.word 0x90ad000b  ! 266: ANDNcc_R	andncc 	%r20, %r11, %r8
!$EV trig_pc_d(1, @VA(.MAIN.xir_4_119)) -> intp(4,1,3)
xir_4_119:
	.word 0xa9846cc1  ! 267: WR_SET_SOFTINT_I	wr	%r17, 0x0cc1, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_120)) -> intp(2,0,30)
intvec_4_120:
	.word 0x39400001  ! 268: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 269: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_4_121:
	setx 0x43b766eedbd68a5a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 270: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x98f8c001  ! 271: SDIVcc_R	sdivcc 	%r3, %r1, %r12
	.word 0xe807c000  ! 272: LDUW_R	lduw	[%r31 + %r0], %r20
	setx ivw_4_122, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_122:
	.word 0x99a00172  ! 273: FABSq	dis not found

mondo_4_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d934000  ! 274: WRPR_WSTATE_R	wrpr	%r13, %r0, %wstate
splash_cmpr_4_124:
	setx 0x8f4cf49de62e2d8d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 275: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 276: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x924c4003  ! 277: MULX_R	mulx 	%r17, %r3, %r9
splash_cmpr_4_125:
	setx 0x9dfb6d831b20c77e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1480000  ! 279: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
debug_4_126:
	nop
	setx debug_4_126 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 280: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x28700001  ! 281: BPLEU	<illegal instruction>
	.word 0x93902000  ! 282: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87802055  ! 283: WRASI_I	wr	%r0, 0x0055, %asi
change_to_randtl_4_127:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_127:
	.word 0x8f902000  ! 284: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01970  ! 285: FqTOd	dis not found

	.word 0x87802088  ! 286: WRASI_I	wr	%r0, 0x0088, %asi
splash_cmpr_4_129:
	setx 0x7d7583601c419493, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 287: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790221a  ! 288: WRPR_TT_I	wrpr	%r0, 0x021a, %tt
	.word 0x97a01a73  ! 289: FqTOi	fqtoi	
	.word 0xe81fffcf  ! 290: LDD_I	ldd	[%r31 + 0xffffffcf], %r20
	.word 0xe88008a0  ! 291: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
splash_cmpr_4_130:
	setx 0xc04d87382724ed7f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 292: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe93fc008  ! 293: STDF_R	std	%f20, [%r8, %r31]
	.word 0x87902081  ! 294: WRPR_TT_I	wrpr	%r0, 0x0081, %tt
	.word 0xe857c000  ! 295: LDSH_R	ldsh	[%r31 + %r0], %r20
	.word 0x3e800001  ! 296: BVC	bvc,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 297: LDX_R	ldx	[%r31 + %r0], %r20
DS_4_131:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 298: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	setx ivw_4_132, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_132:
	.word 0xa3a00164  ! 299: FABSq	dis not found

	.word 0x9f803c11  ! 300: SIR	sir	0x1c11
	.word 0x90d88013  ! 301: SMULcc_R	smulcc 	%r2, %r19, %r8
	.word 0x8780204f  ! 302: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x9f80325d  ! 303: SIR	sir	0x125d
	.word 0xd28008a0  ! 304: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd28008a0  ! 305: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_lsu_4_133:
	setx 0x5d01ba114979839b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 306: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_4_134:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 307: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x91d020b4  ! 308: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_tba_4_135:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 309: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd27ff5df  ! 310: SWAP_I	swap	%r9, [%r31 + 0xfffff5df]
debug_4_136:
	nop
	setx debug_4_136 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 311: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_4_137:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 312: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd2d804a0  ! 313: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0xd2c004a0  ! 314: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996ab801  ! 315: SDIVX_I	sdivx	%r10, 0xfffff801, %r12
	.word 0x81982415  ! 316: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0415, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r18
DS_4_139:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd7348001  ! 1: STQF_R	-	%f11, [%r1, %r18]
	normalw
	.word 0x99458000  ! 318: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xe607c000  ! 319: LDUW_R	lduw	[%r31 + %r0], %r19
mondo_4_140:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d90c002  ! 320: WRPR_WSTATE_R	wrpr	%r3, %r2, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976ae94f  ! 321: SDIVX_I	sdivx	%r11, 0x094f, %r11
	.word 0xd537c008  ! 322: STQF_R	-	%f10, [%r8, %r31]
	.word 0xab824012  ! 323: WR_CLEAR_SOFTINT_R	wr	%r9, %r18, %clear_softint
	.word 0xd48008a0  ! 324: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa9824012  ! 325: WR_SET_SOFTINT_R	wr	%r9, %r18, %set_softint
mondo_4_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d950014  ! 326: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	.word 0x81460000  ! 327: RD_STICK_REG	stbar
change_to_randtl_4_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_143:
	.word 0x8f902003  ! 328: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
change_to_randtl_4_144:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_144:
	.word 0x8f902002  ! 329: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x93902006  ! 330: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd4dfe020  ! 331: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
pmu_4_145:
	nop
	setx 0xfffff1bffffffd0e, %g1, %g7
	.word 0xa3800007  ! 332: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d802000  ! 333: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_4_146:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d948004  ! 334: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
intveclr_4_147:
	setx 0x4028414f82af1f7e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 335: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 336: WRASI_I	wr	%r0, 0x001c, %asi
splash_cmpr_4_148:
	setx 0x43815013b30bceb5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 338: Tcc_I	ta	icc_or_xcc, %r0 + 51
change_to_randtl_4_149:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_149:
	.word 0x8f902001  ! 339: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x2c800001  ! 340: BNEG	bneg,a	<label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996cac3a  ! 341: SDIVX_I	sdivx	%r18, 0x0c3a, %r12
debug_4_151:
	nop
	setx debug_4_151 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 342: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_4_152:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 343: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd647e7a8  ! 344: LDSW_I	ldsw	[%r31 + 0x07a8], %r11
	.word 0x9745c000  ! 345: RD_TICK_CMPR_REG	rd	%-, %r11
splash_tba_4_153:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 346: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f803dd9  ! 347: SIR	sir	0x1dd9
	.word 0x91d02032  ! 348: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d903050  ! 349: WRPR_PSTATE_I	wrpr	%r0, 0x1050, %pstate
	.word 0x87802014  ! 350: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x81982664  ! 351: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0664, %hpstate
	.word 0x3a800001  ! 352: BCC	bcc,a	<label_0x1>
	.word 0xe8880e80  ! 353: LDUBA_R	lduba	[%r0, %r0] 0x74, %r20
splash_cmpr_4_154:
	setx 0x2181622e41d7b01f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 354: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_155:
	setx 0xa818919de69aab99, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 355: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d940011  ! 356: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0x36700001  ! 357: BPGE	<illegal instruction>
mondo_4_157:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d928004  ! 358: WRPR_WSTATE_R	wrpr	%r10, %r4, %wstate
DS_4_158:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f8, %f2, %f18
	.word 0xa7b1430c  ! 359: ALIGNADDRESS	alignaddr	%r5, %r12, %r19
	setx ivw_4_159, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_159:
	.word 0xa3a00163  ! 360: FABSq	dis not found

	.word 0xd26ff7b0  ! 361: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffff7b0]
splash_tba_4_160:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 362: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x97a009c3  ! 363: FDIVd	fdivd	%f0, %f34, %f42
	.word 0xd28008a0  ! 364: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
debug_4_161:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 365: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_4_162:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_162:
	.word 0x8f902000  ! 366: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x926c400a  ! 367: UDIVX_R	udivx 	%r17, %r10, %r9
	.word 0x819824ce  ! 368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04ce, %hpstate
DS_4_163:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe53066d3  ! 1: STQF_I	-	%f18, [0x06d3, %r1]
	normalw
	.word 0xa1458000  ! 369: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996c3357  ! 370: SDIVX_I	sdivx	%r16, 0xfffff357, %r12
	.word 0xd2d00e60  ! 371: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r9
debug_4_165:
	nop
	setx debug_4_165 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 372: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_4_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d91c008  ! 373: WRPR_WSTATE_R	wrpr	%r7, %r8, %wstate
	.word 0x87902153  ! 374: WRPR_TT_I	wrpr	%r0, 0x0153, %tt
	.word 0x99902005  ! 375: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x28700001  ! 376: BPLEU	<illegal instruction>
	.word 0xa1902006  ! 377: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x87802088  ! 378: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xa8843ff3  ! 379: ADDcc_I	addcc 	%r16, 0xfffffff3, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 380: LDX_R	ldx	[%r31 + %r0], %r19
tagged_4_167:
	taddcctv %r12, 0x1d1a, %r10
	.word 0xe607f8ba  ! 381: LDUW_I	lduw	[%r31 + 0xfffff8ba], %r19
	.word 0xe61fc000  ! 382: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x93902004  ! 383: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x81982007  ! 384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0007, %hpstate
	.word 0x26700001  ! 385: BPL	<illegal instruction>
mondo_4_168:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d94c011  ! 386: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
	.word 0x93902007  ! 387: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_cmpr_4_169:
	setx 0x4dda13150e51d38f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 388: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d90000c  ! 389: WRPR_WSTATE_R	wrpr	%r0, %r12, %wstate
mondo_4_171:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d944002  ! 390: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
	.word 0xa1902000  ! 391: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	setx ivw_4_172, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_172:
	.word 0x91a00171  ! 392: FABSq	dis not found

	setx 0xe1b2d80db2420cc8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_173:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_174:
	setx 0xdd9854dad90be08f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 394: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_175:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd114c010  ! 1: LDQF_R	-	[%r19, %r16], %f8
	.word 0xa3a4c834  ! 395: FADDs	fadds	%f19, %f20, %f17
mondo_4_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d908013  ! 396: WRPR_WSTATE_R	wrpr	%r2, %r19, %wstate
	.word 0x81982864  ! 397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0864, %hpstate
	.word 0x8d802004  ! 398: WRFPRS_I	wr	%r0, 0x0004, %fprs
mondo_4_177:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d91400d  ! 399: WRPR_WSTATE_R	wrpr	%r5, %r13, %wstate
splash_cmpr_4_178:
	setx 0x6732368765be3c70, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 400: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_4_179, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_179:
	.word 0x9ba0016c  ! 401: FABSq	dis not found

splash_cmpr_4_180:
	setx 0x87725e7cac600560, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 402: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_181:
	nop
	setx debug_4_181 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 403: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x95520000  ! 404: RDPR_PIL	<illegal instruction>
DS_4_182:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f30, %f18, %f14
	.word 0x95b4c301  ! 405: ALIGNADDRESS	alignaddr	%r19, %r1, %r10
mondo_4_183:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d90800a  ! 406: WRPR_WSTATE_R	wrpr	%r2, %r10, %wstate
mondo_4_184:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d940008  ! 407: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
	.word 0x81982854  ! 408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0854, %hpstate
	.word 0x91d02035  ! 409: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902000  ! 410: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87802063  ! 411: WRASI_I	wr	%r0, 0x0063, %asi
mondo_4_185:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d91c010  ! 412: WRPR_WSTATE_R	wrpr	%r7, %r16, %wstate
splash_tba_4_186:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 413: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_4_187:
	setx 0xb679c7dd7165a766, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 414: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_4_188:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 415: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa2800011  ! 416: ADDcc_R	addcc 	%r0, %r17, %r17
	.word 0x99902000  ! 417: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xe46ff8ba  ! 418: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffff8ba]
DS_4_189:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x91b50314  ! 419: ALIGNADDRESS	alignaddr	%r20, %r20, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36c6177  ! 420: SDIVX_I	sdivx	%r17, 0x0177, %r17
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196d  ! 421: FqTOd	dis not found

	.word 0x8d9039a8  ! 422: WRPR_PSTATE_I	wrpr	%r0, 0x19a8, %pstate
	.word 0x95a2c9ca  ! 423: FDIVd	fdivd	%f42, %f10, %f10
tagged_4_192:
	tsubcctv %r14, 0x1e46, %r24
	.word 0xd007ec55  ! 424: LDUW_I	lduw	[%r31 + 0x0c55], %r8
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 425: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 426: LDX_R	ldx	[%r31 + %r0], %r8
debug_4_193:
	nop
	setx debug_4_193 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 427: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x83d020b2  ! 428: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0xd04fec55  ! 429: LDSB_I	ldsb	[%r31 + 0x0c55], %r8
	.word 0xd08fe030  ! 430: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xa3520000  ! 432: RDPR_PIL	rdpr	%pil, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9768e09c  ! 433: SDIVX_I	sdivx	%r3, 0x009c, %r11
mondo_4_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d908004  ! 434: WRPR_WSTATE_R	wrpr	%r2, %r4, %wstate
debug_4_196:
	nop
	setx debug_4_196 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 435: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_4_197:
	taddcctv %r8, 0x149c, %r26
	.word 0xe007ef0e  ! 436: LDUW_I	lduw	[%r31 + 0x0f0e], %r16
	.word 0x91d02032  ! 437: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe08008a0  ! 438: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x91d02032  ! 439: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_cmpr_4_198:
	setx 0x22688c6ed63b91af, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 440: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_4_199:
	setx 0x8f9e6b497aef72a1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 441: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 442: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x9f803e63  ! 443: SIR	sir	0x1e63
intveclr_4_200:
	setx 0x49cdfc29b624a141, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 444: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 445: Tcc_I	ta	icc_or_xcc, %r0 + 53
mondo_4_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d91800b  ! 446: WRPR_WSTATE_R	wrpr	%r6, %r11, %wstate
	.word 0x99902003  ! 447: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
mondo_4_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d91000b  ! 448: WRPR_WSTATE_R	wrpr	%r4, %r11, %wstate
	.word 0xe137c00c  ! 449: STQF_R	-	%f16, [%r12, %r31]
	setx 0xc9ebfc7f63a2bfd9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_203:
	.word 0x39400001  ! 450: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790237e  ! 451: WRPR_TT_I	wrpr	%r0, 0x037e, %tt
change_to_randtl_4_204:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_204:
	.word 0x8f902002  ! 452: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x9f802d2b  ! 453: SIR	sir	0x0d2b
	.word 0x9b500000  ! 454: RDPR_TPC	<illegal instruction>
	.word 0x81982bff  ! 455: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bff, %hpstate
debug_4_205:
	nop
	setx debug_4_205 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 456: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_4_206:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 457: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1683299  ! 458: SDIVX_I	sdivx	%r0, 0xfffff299, %r16
tagged_4_208:
	tsubcctv %r3, 0x1df9, %r6
	.word 0xd007e283  ! 459: LDUW_I	lduw	[%r31 + 0x0283], %r8
	.word 0xd08008a0  ! 460: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
debug_4_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 461: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802010  ! 462: WRASI_I	wr	%r0, 0x0010, %asi
change_to_randtl_4_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_210:
	.word 0x8f902002  ! 463: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd09fe283  ! 464: LDDA_I	ldda	[%r31, + 0x0283] %asi, %r8
	.word 0x9282c002  ! 465: ADDcc_R	addcc 	%r11, %r2, %r9
	.word 0x9f803cab  ! 466: SIR	sir	0x1cab
	.word 0x8790208a  ! 467: WRPR_TT_I	wrpr	%r0, 0x008a, %tt
debug_4_211:
	nop
	setx debug_4_211 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 468: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe4c00e40  ! 469: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r18
	.word 0xe4c7e000  ! 470: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
	.word 0xe4800ba0  ! 471: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r18
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 472: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_4_212:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 473: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x879020c1  ! 474: WRPR_TT_I	wrpr	%r0, 0x00c1, %tt
splash_tba_4_213:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 475: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_4_214:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 476: SAVE_R	save	%r31, %r0, %r31
	.word 0xe48804a0  ! 477: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
debug_4_215:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 478: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe4c804a0  ! 479: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r18
	.word 0x97a189c3  ! 480: FDIVd	fdivd	%f6, %f34, %f42
	.word 0x93902003  ! 481: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
intveclr_4_216:
	setx 0xed0d6f3f785de70e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_4_217:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd930c014  ! 1: STQF_R	-	%f12, [%r20, %r3]
	normalw
	.word 0x95458000  ! 483: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x87802020  ! 484: WRASI_I	wr	%r0, 0x0020, %asi
debug_4_218:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 485: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x26700001  ! 486: BPL	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196c  ! 487: FqTOd	dis not found

splash_cmpr_4_220:
	setx 0x53de5360c1d7f57f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 488: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 489: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 490: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe897e000  ! 491: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r20
	.word 0xe88804a0  ! 492: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
intveclr_4_221:
	setx 0x4dbde85d4c92bbc0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 493: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe847e9df  ! 494: LDSW_I	ldsw	[%r31 + 0x09df], %r20
	.word 0xe827e9df  ! 495: STW_I	stw	%r20, [%r31 + 0x09df]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16ca059  ! 496: SDIVX_I	sdivx	%r18, 0x0059, %r16
	.word 0x9f8031db  ! 497: SIR	sir	0x11db
	.word 0xa1454000  ! 498: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
	.word 0xd0dfe020  ! 499: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r8
	.word 0x8780201c  ! 500: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd127c003  ! 501: STF_R	st	%f8, [%r3, %r31]
	.word 0x81982b0d  ! 502: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0d, %hpstate
splash_tba_4_223:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 503: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x99902005  ! 504: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xd0d7e030  ! 505: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 506: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_4_224:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xfb6f9d95	! Random illegal ?
	.word 0xe7114003  ! 1: LDQF_R	-	[%r5, %r3], %f19
	.word 0x9ba50832  ! 507: FADDs	fadds	%f20, %f18, %f13
	.word 0x87902069  ! 508: WRPR_TT_I	wrpr	%r0, 0x0069, %tt
splash_lsu_4_225:
	setx 0x4fc5ed82844156a5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 509: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 510: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd25ff2d8  ! 511: LDX_I	ldx	[%r31 + 0xfffff2d8], %r9
	.word 0x819825b7  ! 512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05b7, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_226)) -> intp(2,0,4)
intvec_4_226:
	.word 0x39400001  ! 513: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 514: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902ff8  ! 515: WRPR_PSTATE_I	wrpr	%r0, 0x0ff8, %pstate
	.word 0xa1902001  ! 516: WRPR_GL_I	wrpr	%r0, 0x0001, %-
intveclr_4_227:
	setx 0x187472996e5d2029, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 517: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_4_228:
	nop
	setx donretarg_4_228, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r25, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_228:
	.word 0xd2fff2d8  ! 518: SWAPA_I	swapa	%r9, [%r31 + 0xfffff2d8] %asi
	.word 0x81982347  ! 519: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0347, %hpstate
	.word 0x81b01021  ! 520: SIAM	siam	1
	.word 0xd2c00e80  ! 521: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r9
	.word 0x38700001  ! 522: BPGU	<illegal instruction>
	.word 0x2e800001  ! 523: BVS	bvs,a	<label_0x1>
tagged_4_229:
	taddcctv %r8, 0x11ba, %r25
	.word 0xd207f2d8  ! 524: LDUW_I	lduw	[%r31 + 0xfffff2d8], %r9
intveclr_4_230:
	setx 0xb761403774cf048f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_231:
	setx 0x03cd31e48acc67ce, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 526: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200f  ! 527: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa0c4a5ca  ! 528: ADDCcc_I	addccc 	%r18, 0x05ca, %r16
	.word 0x87802063  ! 529: WRASI_I	wr	%r0, 0x0063, %asi
splash_cmpr_4_232:
	setx 0x2451f15f876548be, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 530: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_233:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d948014  ! 531: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0x87902063  ! 532: WRPR_TT_I	wrpr	%r0, 0x0063, %tt
	.word 0x91d020b3  ! 533: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xe4800be0  ! 534: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r18
	.word 0x91a409d2  ! 535: FDIVd	fdivd	%f16, %f18, %f8
	.word 0xe8dfe030  ! 536: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
	.word 0x93a089d3  ! 537: FDIVd	fdivd	%f2, %f50, %f40
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76d3b8c  ! 538: SDIVX_I	sdivx	%r20, 0xfffffb8c, %r19
	.word 0x95540000  ! 539: RDPR_GL	rdpr	%-, %r10
	.word 0xd6dfe000  ! 540: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
splash_tba_4_235:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 541: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91480000  ! 542: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 543: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_4_236:
	tsubcctv %r3, 0x1663, %r11
	.word 0xe607e600  ! 544: LDUW_I	lduw	[%r31 + 0x0600], %r19
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 545: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_4_237:
	setx 0x8deb079cab86b66b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 546: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_238:
	setx 0xce7de3ce14cb76d3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879022f6  ! 548: WRPR_TT_I	wrpr	%r0, 0x02f6, %tt
	setx 0x719f9ac727c885a5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_239:
	.word 0x39400001  ! 549: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_240:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d90c011  ! 550: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
intveclr_4_241:
	setx 0x4a32f88dd3ae9aab, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 551: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8790213b  ! 552: WRPR_TT_I	wrpr	%r0, 0x013b, %tt
	.word 0xe6c7e020  ! 553: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r19
	.word 0x93902006  ! 554: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe68008a0  ! 555: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x9b454000  ! 556: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
tagged_4_242:
	tsubcctv %r17, 0x1ae5, %r5
	.word 0xe807e600  ! 557: LDUW_I	lduw	[%r31 + 0x0600], %r20
debug_4_243:
	nop
	setx debug_4_243 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 558: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x22800001  ! 559: BE	be,a	<label_0x1>
intveclr_4_244:
	setx 0x088d903b2619188e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 560: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_245:
	setx 0xa253bf4824c56247, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 561: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9036cf  ! 562: WRPR_PSTATE_I	wrpr	%r0, 0x16cf, %pstate
debug_4_246:
	nop
	setx debug_4_246 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 563: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0xca61aa8a4ba92656, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_247:
	.word 0x39400001  ! 564: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_4_248:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 565: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_4_249:
	setx 0xc6222e08b33d378c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 566: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200f  ! 567: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x87802055  ! 568: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xa153c000  ! 569: RDPR_FQ	<illegal instruction>
	.word 0x99a00574  ! 570: FSQRTq	fsqrt	
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 571: LDX_R	ldx	[%r31 + %r0], %r9
debug_4_250:
	nop
	setx debug_4_250 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 572: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01970  ! 573: FqTOd	dis not found

	.word 0x91b04ff3  ! 574: FONES	e	%f8
splash_cmpr_4_252:
	setx 0x94cec2579f9b6bb0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 575: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 576: LDX_R	ldx	[%r31 + %r0], %r11
	setx 0xacb512c0b0ef8b2f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_253:
	.word 0x39400001  ! 577: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6c7e020  ! 578: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
	.word 0x8d902d19  ! 579: WRPR_PSTATE_I	wrpr	%r0, 0x0d19, %pstate
	.word 0x93d02033  ! 580: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x87802010  ! 581: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd737c004  ! 582: STQF_R	-	%f11, [%r4, %r31]
	.word 0x946b4002  ! 583: UDIVX_R	udivx 	%r13, %r2, %r10
splash_cmpr_4_254:
	setx 0x9a0306cbe716873a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 584: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_255:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe3150010  ! 1: LDQF_R	-	[%r20, %r16], %f17
	.word 0x97a2c82d  ! 585: FADDs	fadds	%f11, %f13, %f11
mondo_4_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d944003  ! 586: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
	.word 0xe53fc00a  ! 587: STDF_R	std	%f18, [%r10, %r31]
tagged_4_257:
	taddcctv %r13, 0x15b7, %r26
	.word 0xe407e600  ! 588: LDUW_I	lduw	[%r31 + 0x0600], %r18
pmu_4_258:
	nop
	setx 0xfffffa87fffff824, %g1, %g7
	.word 0xa3800007  ! 589: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xad806dcc  ! 590: WR_SOFTINT_REG_I	wr	%r1, 0x0dcc, %softint
tagged_4_259:
	taddcctv %r3, 0x1b12, %r18
	.word 0xe407e4ec  ! 591: LDUW_I	lduw	[%r31 + 0x04ec], %r18
	.word 0x95520000  ! 592: RDPR_PIL	<illegal instruction>
change_to_randtl_4_260:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_260:
	.word 0x8f902001  ! 593: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd827e4ec  ! 594: STW_I	stw	%r12, [%r31 + 0x04ec]
	.word 0x81460000  ! 595: RD_STICK_REG	stbar
mondo_4_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d918005  ! 596: WRPR_WSTATE_R	wrpr	%r6, %r5, %wstate
	.word 0x8d90277c  ! 597: WRPR_PSTATE_I	wrpr	%r0, 0x077c, %pstate
	.word 0x87902210  ! 598: WRPR_TT_I	wrpr	%r0, 0x0210, %tt
	.word 0x8d902b11  ! 599: WRPR_PSTATE_I	wrpr	%r0, 0x0b11, %pstate
	.word 0x81982ab4  ! 600: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ab4, %hpstate
	.word 0x93902007  ! 601: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81460000  ! 602: RD_STICK_REG	stbar
	.word 0x26800001  ! 603: BL	bl,a	<label_0x1>
debug_4_262:
	nop
	setx debug_4_262 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 604: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902004  ! 605: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_tba_4_263:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 606: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_4_264:
	nop
	setx debug_4_264 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 607: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x819828bd  ! 608: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08bd, %hpstate
change_to_randtl_4_265:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_265:
	.word 0x8f902002  ! 609: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x93902000  ! 610: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd8c7e030  ! 611: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r12
intveclr_4_266:
	setx 0x519f7c01126e6a04, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 612: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 613: WRPR_GL_I	wrpr	%r0, 0x0009, %-
debug_4_267:
	nop
	setx debug_4_267 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 614: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd8cfe020  ! 615: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
debug_4_268:
	nop
	setx debug_4_268 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 616: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_4_269:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d94800c  ! 617: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 618: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_4_270:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 619: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x28700001  ! 620: BPLEU	<illegal instruction>
	.word 0x93902002  ! 621: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
mondo_4_271:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d918006  ! 622: WRPR_WSTATE_R	wrpr	%r6, %r6, %wstate
splash_lsu_4_272:
	setx 0x506f08a7a8110365, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 623: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d944009  ! 624: WRPR_WSTATE_R	wrpr	%r17, %r9, %wstate
	.word 0xd88804a0  ! 625: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
splash_cmpr_4_274:
	setx 0xe986768cadeda356, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 626: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 627: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_4_275:
	setx 0x7caced58cb35dde7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 628: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 629: BL	bl,a	<label_0x1>
mondo_4_276:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d940003  ! 630: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
	setx ivw_4_277, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_277:
	.word 0xa9a00166  ! 631: FABSq	dis not found

	.word 0xd4c004a0  ! 632: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
splash_cmpr_4_278:
	setx 0x0e9c11ecf8527f4f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 633: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x91a01a69  ! 635: FqTOi	fqtoi	
	.word 0xd647e4ec  ! 636: LDSW_I	ldsw	[%r31 + 0x04ec], %r11
debug_4_279:
	nop
	setx debug_4_279 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 637: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976b2a3a  ! 638: SDIVX_I	sdivx	%r12, 0x0a3a, %r11
splash_tba_4_281:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 639: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_4_282:
	setx 0x0974ec358d53140d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 640: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_283:
	nop
	setx debug_4_283 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 641: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_284)) -> intp(3,0,10)
intvec_4_284:
	.word 0x39400001  ! 642: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 643: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9769f57d  ! 644: SDIVX_I	sdivx	%r7, 0xfffff57d, %r11
	.word 0xd2d00e80  ! 645: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01970  ! 646: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16b3c46  ! 647: SDIVX_I	sdivx	%r12, 0xfffffc46, %r16
pmu_4_288:
	nop
	setx 0xfffffb0cfffff992, %g1, %g7
	.word 0xa3800007  ! 648: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 649: LDX_R	ldx	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 650: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe01ff035  ! 651: LDD_I	ldd	[%r31 + 0xfffff035], %r16
mondo_4_289:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d910000  ! 652: WRPR_WSTATE_R	wrpr	%r4, %r0, %wstate
splash_lsu_4_290:
	setx 0x234801b62e2bfed9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 653: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_4_291:
	nop
	setx debug_4_291 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 654: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902003  ! 655: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81982c75  ! 656: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c75, %hpstate
tagged_4_292:
	tsubcctv %r4, 0x163a, %r13
	.word 0xe007f035  ! 657: LDUW_I	lduw	[%r31 + 0xfffff035], %r16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01966  ! 658: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976a6b04  ! 659: SDIVX_I	sdivx	%r9, 0x0b04, %r11
	.word 0x81510000  ! 660: RDPR_TICK	rdpr	%tick, %r0
	setx 0x4dac5017aa47f3d5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_295:
	.word 0x39400001  ! 661: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_4_296:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 662: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_4_297:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb31c002  ! 1: STQF_R	-	%f13, [%r2, %r7]
	normalw
	.word 0x99458000  ! 663: RD_SOFTINT_REG	rd	%softint, %r12
pmu_4_298:
	nop
	setx 0xfffff1a9fffffa7a, %g1, %g7
	.word 0xa3800007  ! 664: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_4_299:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_299:
	.word 0x8f902003  ! 665: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
debug_4_300:
	nop
	setx debug_4_300 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 666: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902007  ! 667: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd68008a0  ! 668: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_tba_4_301:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 669: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_302)) -> intp(3,0,23)
intvec_4_302:
	.word 0x39400001  ! 670: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_4_303:
	set 0x00380000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 671: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_4_304:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d91c013  ! 672: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
	.word 0xd6880e40  ! 673: LDUBA_R	lduba	[%r0, %r0] 0x72, %r11
	.word 0xd68008a0  ! 674: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	setx 0xefee3e74e192339c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_305:
	.word 0x39400001  ! 675: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 676: WRASI_I	wr	%r0, 0x0089, %asi
	setx ivw_4_306, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_306:
	.word 0x97a00160  ! 677: FABSq	dis not found

	.word 0x9745c000  ! 678: RD_TICK_CMPR_REG	rd	%-, %r11
splash_lsu_4_307:
	setx 0x4368586ab05284b3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 679: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_4_308:
	tsubcctv %r17, 0x14da, %r11
	.word 0xe807eed1  ! 680: LDUW_I	lduw	[%r31 + 0x0ed1], %r20
splash_cmpr_4_309:
	setx 0x1f166135d51a7d05, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 681: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902076  ! 682: WRPR_TT_I	wrpr	%r0, 0x0076, %tt
tagged_4_310:
	tsubcctv %r21, 0x1a81, %r14
	.word 0xe807eed1  ! 683: LDUW_I	lduw	[%r31 + 0x0ed1], %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9969bd43  ! 684: SDIVX_I	sdivx	%r6, 0xfffffd43, %r12
change_to_randtl_4_312:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_312:
	.word 0x8f902001  ! 685: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_4_313:
	nop
	setx debug_4_313 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 686: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_4_314:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_314:
	.word 0x8f902001  ! 687: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_4_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d90000c  ! 688: WRPR_WSTATE_R	wrpr	%r0, %r12, %wstate
	.word 0x93902007  ! 689: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
debug_4_316:
	nop
	setx debug_4_316 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 690: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x7ca5d9c90f89d544, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_317:
	.word 0x39400001  ! 691: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 692: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 693: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xad8172ce  ! 694: WR_SOFTINT_REG_I	wr	%r5, 0x12ce, %softint
	.word 0x87802010  ! 695: WRASI_I	wr	%r0, 0x0010, %asi
change_to_randtl_4_318:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_318:
	.word 0x8f902002  ! 696: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01960  ! 697: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5686d6f  ! 698: SDIVX_I	sdivx	%r1, 0x0d6f, %r18
debug_4_321:
	nop
	setx debug_4_321 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 699: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_4_322:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 700: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_4_323:
	taddcctv %r6, 0x197d, %r19
	.word 0xe407f52a  ! 701: LDUW_I	lduw	[%r31 + 0xfffff52a], %r18
mondo_4_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d928002  ! 702: WRPR_WSTATE_R	wrpr	%r10, %r2, %wstate
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 703: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d903e0b  ! 704: WRPR_PSTATE_I	wrpr	%r0, 0x1e0b, %pstate
	.word 0x95a01a69  ! 705: FqTOi	fqtoi	
	.word 0x81982b9d  ! 706: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9d, %hpstate
	setx ivw_4_325, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_325:
	.word 0x9ba00173  ! 707: FABSq	dis not found

	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 708: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 709: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x819827c4  ! 710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c4, %hpstate
	.word 0xd237f52a  ! 711: STH_I	sth	%r9, [%r31 + 0xfffff52a]
	.word 0x9f802343  ! 712: SIR	sir	0x0343
	.word 0xd317c000  ! 713: LDQF_R	-	[%r31, %r0], %f9
splash_cmpr_4_326:
	setx 0x408884af798b599e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 714: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 715: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_4_327:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 716: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_4_328:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d914005  ! 717: WRPR_WSTATE_R	wrpr	%r5, %r5, %wstate
	.word 0xd337e0ec  ! 718: STQF_I	-	%f9, [0x00ec, %r31]
	.word 0x97454000  ! 719: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0x99902004  ! 720: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xd4800ba0  ! 721: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r10
splash_cmpr_4_329:
	setx 0xc5be641ac07c839a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 722: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_330:
	setx 0x2e2d70803e9c5f10, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 723: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_4_331, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_331:
	.word 0x93a0016a  ! 724: FABSq	dis not found

splash_tba_4_332:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 725: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902378  ! 726: WRPR_TT_I	wrpr	%r0, 0x0378, %tt
	.word 0x91d02034  ! 727: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe20fe0ec  ! 728: LDUB_I	ldub	[%r31 + 0x00ec], %r17
	.word 0x81510000  ! 729: RDPR_TICK	rdpr	%tick, %r0
	setx ivw_4_333, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_333:
	.word 0x99a00171  ! 730: FABSq	dis not found

	.word 0x91d02032  ! 731: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_4_334:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d91c002  ! 732: WRPR_WSTATE_R	wrpr	%r7, %r2, %wstate
	.word 0x93902005  ! 733: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87802004  ! 734: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802055  ! 735: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xe917c000  ! 736: LDQF_R	-	[%r31, %r0], %f20
	setx ivw_4_335, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_335:
	.word 0xa5a00164  ! 737: FABSq	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_336)) -> intp(3,0,13)
intvec_4_336:
	.word 0x39400001  ! 738: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_337:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x95a0054a  ! 1: FSQRTd	fsqrt	
	.word 0xa3a50825  ! 739: FADDs	fadds	%f20, %f5, %f17
change_to_randtl_4_338:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_338:
	.word 0x8f902000  ! 740: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_4_339:
	setx 0xaa8ad36709ad7389, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 741: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe68008a0  ! 742: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
debug_4_340:
	nop
	setx debug_4_340 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 743: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56c71cc  ! 744: SDIVX_I	sdivx	%r17, 0xfffff1cc, %r18
splash_htba_4_342:
	set 0x00380000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 745: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd01ffb39  ! 746: LDD_I	ldd	[%r31 + 0xfffffb39], %r8
	.word 0x2a800001  ! 747: BCS	bcs,a	<label_0x1>
	.word 0x93902007  ! 748: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_lsu_4_343:
	setx 0x1fbb00ae4f9fee25, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 749: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93a289c2  ! 750: FDIVd	fdivd	%f10, %f2, %f40
	.word 0xad81286b  ! 751: WR_SOFTINT_REG_I	wr	%r4, 0x086b, %softint
debug_4_344:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 752: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9b454000  ! 753: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	.word 0x8790216c  ! 754: WRPR_TT_I	wrpr	%r0, 0x016c, %tt
	.word 0xe28804a0  ! 755: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 756: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_4_345:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 757: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8d90310b  ! 758: WRPR_PSTATE_I	wrpr	%r0, 0x110b, %pstate
	.word 0x879022fa  ! 759: WRPR_TT_I	wrpr	%r0, 0x02fa, %tt
DS_4_346:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f16, %f6, %f2
	.word 0x97b04309  ! 760: ALIGNADDRESS	alignaddr	%r1, %r9, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a0196a  ! 761: FqTOd	dis not found

	.word 0xda4fc000  ! 762: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01966  ! 763: FqTOd	dis not found

	.word 0xa1902008  ! 764: WRPR_GL_I	wrpr	%r0, 0x0008, %-
mondo_4_349:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d910009  ! 765: WRPR_WSTATE_R	wrpr	%r4, %r9, %wstate
	.word 0xd327ed48  ! 766: STF_I	st	%f9, [0x0d48, %r31]
	.word 0xd2c804a0  ! 767: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 768: LDX_R	ldx	[%r31 + %r0], %r9
DS_4_350:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 769: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd257ed48  ! 770: LDSH_I	ldsh	[%r31 + 0x0d48], %r9
	.word 0xd28fe000  ! 771: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r9
DS_4_351:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x9bb40302  ! 772: ALIGNADDRESS	alignaddr	%r16, %r2, %r13
	.word 0xab80c012  ! 773: WR_CLEAR_SOFTINT_R	wr	%r3, %r18, %clear_softint
	.word 0xe457c000  ! 774: LDSH_R	ldsh	[%r31 + %r0], %r18
intveclr_4_352:
	setx 0xbc50cc62eb599db2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 775: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_353:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d94800b  ! 776: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
mondo_4_354:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d908005  ! 777: WRPR_WSTATE_R	wrpr	%r2, %r5, %wstate
	.word 0xe41fc000  ! 778: LDD_R	ldd	[%r31 + %r0], %r18
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 779: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01960  ! 780: FqTOd	dis not found

	.word 0xd037ed48  ! 781: STH_I	sth	%r8, [%r31 + 0x0d48]
splash_lsu_4_356:
	setx 0x8ca368b2bcbded85, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 782: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_4_357:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 783: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xd11fed48  ! 784: LDDF_I	ldd	[%r31, 0x0d48], %f8
debug_4_358:
	nop
	setx debug_4_358 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 785: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_4_359:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb12c00b  ! 1: LDQF_R	-	[%r11, %r11], %f13
	.word 0x95a2482b  ! 786: FADDs	fadds	%f9, %f11, %f10
splash_cmpr_4_360:
	setx 0x277d2e78cb840a69, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 787: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 788: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 789: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01960  ! 790: FqTOd	dis not found

	.word 0x8d9033da  ! 791: WRPR_PSTATE_I	wrpr	%r0, 0x13da, %pstate
	.word 0xe6800c60  ! 792: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r19
splash_cmpr_4_362:
	setx 0xb1513fa1b03fbb81, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 793: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x8639bd8113135f25, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_363:
	.word 0x39400001  ! 794: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 795: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x20700001  ! 796: BPN	<illegal instruction>
	.word 0xe67fed48  ! 797: SWAP_I	swap	%r19, [%r31 + 0x0d48]
	.word 0x8d9021d7  ! 798: WRPR_PSTATE_I	wrpr	%r0, 0x01d7, %pstate
change_to_randtl_4_364:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_364:
	.word 0x8f902000  ! 799: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 800: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe677c007  ! 801: STX_R	stx	%r19, [%r31 + %r7]
	.word 0xe6c7e030  ! 802: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r19
splash_htba_4_365:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 803: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_4_366:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d94c00d  ! 804: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
	setx ivw_4_367, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_367:
	.word 0x93a0016d  ! 805: FABSq	dis not found

	.word 0x8790214d  ! 806: WRPR_TT_I	wrpr	%r0, 0x014d, %tt
	.word 0x91d02033  ! 807: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9350c000  ! 808: RDPR_TT	<illegal instruction>
	.word 0x8d903c7f  ! 809: WRPR_PSTATE_I	wrpr	%r0, 0x1c7f, %pstate
	.word 0x879023de  ! 810: WRPR_TT_I	wrpr	%r0, 0x03de, %tt
	.word 0xe48008a0  ! 811: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe537ed48  ! 812: STQF_I	-	%f18, [0x0d48, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 813: LDX_R	ldx	[%r31 + %r0], %r18
mondo_4_368:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d91c009  ! 814: WRPR_WSTATE_R	wrpr	%r7, %r9, %wstate
	setx 0xab7f06a59bbdb774, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_369:
	.word 0x39400001  ! 815: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_370:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d920012  ! 816: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
tagged_4_371:
	taddcctv %r4, 0x1627, %r14
	.word 0xe407ed48  ! 817: LDUW_I	lduw	[%r31 + 0x0d48], %r18
splash_cmpr_4_372:
	setx 0x2fb60523624806e7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 818: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_373:
	nop
	setx debug_4_373 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 819: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 820: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe48804a0  ! 821: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
mondo_4_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d910011  ! 822: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
	.word 0x99a40dc9  ! 823: FdMULq	fdmulq	
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 824: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90352c  ! 825: WRPR_PSTATE_I	wrpr	%r0, 0x152c, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 826: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4dfe020  ! 827: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
	.word 0xab840007  ! 828: WR_CLEAR_SOFTINT_R	wr	%r16, %r7, %clear_softint
	.word 0xd46fed48  ! 829: LDSTUB_I	ldstub	%r10, [%r31 + 0x0d48]
	setx 0x800c878f190a3561, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_375:
	.word 0x39400001  ! 830: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_4_376:
	nop
	setx debug_4_376 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 831: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87902248  ! 832: WRPR_TT_I	wrpr	%r0, 0x0248, %tt
	setx ivw_4_377, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_377:
	.word 0xa9a0016a  ! 833: FABSq	dis not found

	.word 0x99540000  ! 834: RDPR_GL	<illegal instruction>
	.word 0xd73fed48  ! 835: STDF_I	std	%f11, [0x0d48, %r31]
	.word 0xa1902006  ! 836: WRPR_GL_I	wrpr	%r0, 0x0006, %-
DS_4_378:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0x89652be8	! Random illegal ?
	.word 0x9ba0054d  ! 1: FSQRTd	fsqrt	
	.word 0x91a40832  ! 837: FADDs	fadds	%f16, %f18, %f8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 838: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6900e60  ! 839: LDUHA_R	lduha	[%r0, %r0] 0x73, %r11
	.word 0x93902003  ! 840: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_4_379:
	nop
	setx debug_4_379 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 841: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_4_380:
	setx 0x377ec0aba4eba089, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 842: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_4_381:
	setx 0x8d606e1f610354f1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 843: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 844: RDPR_TICK	rdpr	%tick, %r0
	setx ivw_4_382, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_382:
	.word 0x93a00162  ! 845: FABSq	dis not found

	.word 0xd89004a0  ! 846: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0xd91fc000  ! 847: LDDF_R	ldd	[%r31, %r0], %f12
change_to_randtl_4_383:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_383:
	.word 0x8f902003  ! 848: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd8800be0  ! 849: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r12
splash_tba_4_384:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 850: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_4_385:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd1118002  ! 1: LDQF_R	-	[%r6, %r2], %f8
	.word 0x99a04823  ! 851: FADDs	fadds	%f1, %f3, %f12
debug_4_386:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 852: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916b2d86  ! 853: SDIVX_I	sdivx	%r12, 0x0d86, %r8
	.word 0xe647f42d  ! 854: LDSW_I	ldsw	[%r31 + 0xfffff42d], %r19
	.word 0xe717c000  ! 855: LDQF_R	-	[%r31, %r0], %f19
	.word 0x87802020  ! 856: WRASI_I	wr	%r0, 0x0020, %asi
intveclr_4_388:
	setx 0x39f74439032538d3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 857: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_4_389:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe7344003  ! 1: STQF_R	-	%f19, [%r3, %r17]
	normalw
	.word 0x91458000  ! 858: RD_SOFTINT_REG	rd	%softint, %r8
debug_4_390:
	nop
	setx debug_4_390 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 859: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902e4a  ! 860: WRPR_PSTATE_I	wrpr	%r0, 0x0e4a, %pstate
	.word 0xad853a4c  ! 861: WR_SOFTINT_REG_I	wr	%r20, 0x1a4c, %softint
splash_cmpr_4_391:
	setx 0xc1348d59216747bd, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 862: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_392:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xc96fc416	! Random illegal ?
	.word 0xd112800a  ! 1: LDQF_R	-	[%r10, %r10], %f8
	.word 0xa9a2c824  ! 863: FADDs	fadds	%f11, %f4, %f20
	.word 0xd8880e40  ! 864: LDUBA_R	lduba	[%r0, %r0] 0x72, %r12
splash_cmpr_4_393:
	setx 0x013d74e62a46fec4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 865: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_394:
	nop
	setx debug_4_394 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 866: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd8d004a0  ! 867: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0x97480000  ! 868: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	setx 0xbec7a8251ad5ae99, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_395:
	.word 0x39400001  ! 869: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa0dc0014  ! 870: SMULcc_R	smulcc 	%r16, %r20, %r16
	.word 0xa190200f  ! 871: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_lsu_4_396:
	setx 0x969f547d6b076b83, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 872: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_4_397:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_397:
	.word 0x8f902002  ! 873: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe63ff1d4  ! 874: STD_I	std	%r19, [%r31 + 0xfffff1d4]
splash_cmpr_4_398:
	setx 0x0fddf426d0fe57ee, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 875: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_399:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd9340011  ! 1: STQF_R	-	%f12, [%r17, %r16]
	normalw
	.word 0x91458000  ! 876: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x93902005  ! 877: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902006  ! 878: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 879: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902334  ! 880: WRPR_TT_I	wrpr	%r0, 0x0334, %tt
splash_cmpr_4_400:
	setx 0xa7c268c15af69751, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 881: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 882: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x22700001  ! 883: BPE	<illegal instruction>
	.word 0xe317c000  ! 884: LDQF_R	-	[%r31, %r0], %f17
	.word 0x8d9034a2  ! 885: WRPR_PSTATE_I	wrpr	%r0, 0x14a2, %pstate
splash_cmpr_4_401:
	setx 0x0b78d19b70578c64, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 886: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe2d004a0  ! 887: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
splash_lsu_4_402:
	setx 0x3ac988a8a1525c61, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 888: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_4_403:
	setx 0x182f504d298579da, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 889: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 890: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x99a409c7  ! 891: FDIVd	fdivd	%f16, %f38, %f12
DS_4_404:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb350002  ! 1: STQF_R	-	%f13, [%r2, %r20]
	normalw
	.word 0xa3458000  ! 892: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x8d903050  ! 893: WRPR_PSTATE_I	wrpr	%r0, 0x1050, %pstate
	.word 0x8d902e1b  ! 894: WRPR_PSTATE_I	wrpr	%r0, 0x0e1b, %pstate
	.word 0x8d903075  ! 895: WRPR_PSTATE_I	wrpr	%r0, 0x1075, %pstate
splash_cmpr_4_405:
	setx 0x567db582d6a31508, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 896: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2a800001  ! 897: BCS	bcs,a	<label_0x1>
splash_cmpr_4_406:
	setx 0x8bbdac379d2dd77c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 898: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_407:
	setx 0x319230acc53bf99d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 899: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_408)) -> intp(5,0,13)
intvec_4_408:
	.word 0x39400001  ! 900: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_409:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d944011  ! 901: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 902: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 903: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01962  ! 904: FqTOd	dis not found

pmu_4_411:
	nop
	setx 0xfffffa9cfffff587, %g1, %g7
	.word 0xa3800007  ! 905: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_4_412:
	setx 0x0cbc05dcb7cf314e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 906: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa545c000  ! 907: RD_TICK_CMPR_REG	rd	%-, %r18
	.word 0xd86ff1d4  ! 908: LDSTUB_I	ldstub	%r12, [%r31 + 0xfffff1d4]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 909: LDX_R	ldx	[%r31 + %r0], %r12
tagged_4_413:
	taddcctv %r18, 0x1dd9, %r16
	.word 0xd807f1d4  ! 910: LDUW_I	lduw	[%r31 + 0xfffff1d4], %r12
DS_4_414:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd330bff4  ! 1: STQF_I	-	%f9, [0x1ff4, %r2]
	normalw
	.word 0xa1458000  ! 911: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x8d802004  ! 912: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x91d020b4  ! 913: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x8790233f  ! 914: WRPR_TT_I	wrpr	%r0, 0x033f, %tt
	.word 0x83d02035  ! 915: Tcc_I	te	icc_or_xcc, %r0 + 53
splash_cmpr_4_415:
	setx 0xe08b293a5b694839, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 916: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_416:
	setx 0x1e829cf00cfc5d3e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 917: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_417:
	nop
	setx debug_4_417 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 918: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx ivw_4_418, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_418:
	.word 0x9ba00164  ! 919: FABSq	dis not found

	.word 0x93902006  ! 920: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_4_419:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 921: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd397ea29  ! 922: LDQFA_I	-	[%r31, 0x0a29], %f9
	.word 0x87902320  ! 923: WRPR_TT_I	wrpr	%r0, 0x0320, %tt
	.word 0xd33fc012  ! 924: STDF_R	std	%f9, [%r18, %r31]
	.word 0xa1902005  ! 925: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xa1902006  ! 926: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd25fea29  ! 927: LDX_I	ldx	[%r31 + 0x0a29], %r9
	setx ivw_4_420, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_420:
	.word 0x91a0016a  ! 928: FABSq	dis not found

	.word 0xdac7e000  ! 929: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a0196a  ! 930: FqTOd	dis not found

intveclr_4_422:
	setx 0xfa136a109cdc997d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 931: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_423:
	nop
	setx debug_4_423 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 932: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81982bf4  ! 933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bf4, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 934: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_4_424:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d94c010  ! 935: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0xd21fc000  ! 936: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01963  ! 937: FqTOd	dis not found

mondo_4_426:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d950001  ! 938: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
	.word 0x87802088  ! 939: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x93902004  ! 940: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd43fc00d  ! 941: STD_R	std	%r10, [%r31 + %r13]
	.word 0xd48fe010  ! 942: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0x92dcc00c  ! 943: SMULcc_R	smulcc 	%r19, %r12, %r9
	.word 0xd00fc000  ! 944: LDUB_R	ldub	[%r31 + %r0], %r8
	.word 0x93902003  ! 945: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
donret_4_427:
	nop
	setx donretarg_4_427, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r6, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_427:
	.word 0xd0ffea29  ! 946: SWAPA_I	swapa	%r8, [%r31 + 0x0a29] %asi
DS_4_428:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 947: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd09fc020  ! 948: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
splash_lsu_4_429:
	setx 0x330885cb167b49bf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 949: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802055  ! 950: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xd0d7e000  ! 951: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
splash_lsu_4_430:
	setx 0xa032c51ddadafca9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 952: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 953: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01972  ! 954: FqTOd	dis not found

	.word 0x93902004  ! 955: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa190200a  ! 956: WRPR_GL_I	wrpr	%r0, 0x000a, %-
debug_4_432:
	nop
	setx debug_4_432 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 957: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_4_433:
	setx 0x971c56ba1c6d2c9f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 958: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_4_434:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb32000a  ! 1: STQF_R	-	%f13, [%r10, %r8]
	normalw
	.word 0xa1458000  ! 959: RD_SOFTINT_REG	rd	%softint, %r16
splash_htba_4_435:
	set 0x00380000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 960: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x9f80219f  ! 961: SIR	sir	0x019f
	.word 0xd68008a0  ! 962: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 963: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_4_436:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_436:
	.word 0x8f902000  ! 964: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x99902001  ! 965: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_cmpr_4_437:
	setx 0x67cba85aac471986, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 966: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902370  ! 967: WRPR_TT_I	wrpr	%r0, 0x0370, %tt
splash_lsu_4_438:
	setx 0xd0239a7c3cd4f3c9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_439:
	setx 0x794f97e7e8ac7cf1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 969: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902511  ! 970: WRPR_PSTATE_I	wrpr	%r0, 0x0511, %pstate
	.word 0xd61fc000  ! 971: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd657c000  ! 972: LDSH_R	ldsh	[%r31 + %r0], %r11
change_to_randtl_4_440:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_440:
	.word 0x8f902001  ! 973: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d903ff7  ! 974: WRPR_PSTATE_I	wrpr	%r0, 0x1ff7, %pstate
splash_cmpr_4_441:
	setx 0x3d85580f3e8d1d21, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 975: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879023e0  ! 976: WRPR_TT_I	wrpr	%r0, 0x03e0, %tt
	.word 0x91480000  ! 977: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
debug_4_442:
	nop
	setx debug_4_442 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 978: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_4_443:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 979: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d90282d  ! 980: WRPR_PSTATE_I	wrpr	%r0, 0x082d, %pstate
tagged_4_444:
	tsubcctv %r2, 0x1d53, %r14
	.word 0xe407ec60  ! 981: LDUW_I	lduw	[%r31 + 0x0c60], %r18
	.word 0x8780201c  ! 982: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x93902003  ! 983: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe41fc000  ! 984: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x81510000  ! 985: RDPR_TICK	rdpr	%tick, %r0
	.word 0x91d020b5  ! 986: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xe48008a0  ! 987: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
splash_tba_4_445:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 988: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_4_446:
	setx 0x73148a7ed90d0bc1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 989: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_447:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d90c00d  ! 990: WRPR_WSTATE_R	wrpr	%r3, %r13, %wstate
change_to_randtl_4_448:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_448:
	.word 0x8f902001  ! 991: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902003  ! 992: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa3480000  ! 993: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0x8d802000  ! 994: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa984c008  ! 995: WR_SET_SOFTINT_R	wr	%r19, %r8, %set_softint
debug_4_449:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 996: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_4_450:
	setx 0xc9413429643f8a69, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 997: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd28fe020  ! 998: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r9
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
mondo_3_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d944012  ! 1: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	.word 0x8d9030b3  ! 2: WRPR_PSTATE_I	wrpr	%r0, 0x10b3, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 3: LDX_R	ldx	[%r31 + %r0], %r13
	setx 0x9d95559907781d31, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_1:
	.word 0x39400001  ! 4: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36cb267  ! 5: SDIVX_I	sdivx	%r18, 0xfffff267, %r17
	.word 0xab80c00b  ! 6: WR_CLEAR_SOFTINT_R	wr	%r3, %r11, %clear_softint
splash_cmpr_3_3:
	setx 0x91f90c1961304c0b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802016  ! 8: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d90248d  ! 9: WRPR_PSTATE_I	wrpr	%r0, 0x048d, %pstate
	.word 0xd637e0e3  ! 10: STH_I	sth	%r11, [%r31 + 0x00e3]
	.word 0xd6800c00  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r11
splash_cmpr_3_4:
	setx 0xde3d3d321494c713, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 12: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_3_5:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 13: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_3_6:
	setx 0x072c666b2fbeee56, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 14: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 15: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_3_7:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f16, %f26, %f0
	.word 0x95b48312  ! 16: ALIGNADDRESS	alignaddr	%r18, %r18, %r10
	.word 0x81982fef  ! 17: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fef, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a0196b  ! 18: FqTOd	dis not found

	.word 0xd797e0e3  ! 19: LDQFA_I	-	[%r31, 0x00e3], %f11
	.word 0x94d00005  ! 20: UMULcc_R	umulcc 	%r0, %r5, %r10
tagged_3_9:
	taddcctv %r1, 0x1a6a, %r10
	.word 0xe807e0e3  ! 21: LDUW_I	lduw	[%r31 + 0x00e3], %r20
	.word 0x91d02035  ! 22: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe89fc020  ! 23: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	setx ivw_3_10, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_10:
	.word 0xa7a00162  ! 24: FABSq	dis not found

	.word 0xe49fc020  ! 25: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
	.word 0x81982d7f  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d7f, %hpstate
	.word 0x9750c000  ! 27: RDPR_TT	<illegal instruction>
	setx ivw_3_11, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_11:
	.word 0x95a00173  ! 28: FABSq	dis not found

	.word 0x879020b1  ! 29: WRPR_TT_I	wrpr	%r0, 0x00b1, %tt
mondo_3_12:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d94000b  ! 30: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
	.word 0xa9a049cc  ! 31: FDIVd	fdivd	%f32, %f12, %f20
	.word 0x9f802f42  ! 32: SIR	sir	0x0f42
	.word 0xe41fc000  ! 33: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x36700001  ! 34: BPGE	<illegal instruction>
donret_3_13:
	nop
	setx donretarg_3_13, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r3, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_13:
	.word 0xe4fffe6a  ! 35: SWAPA_I	swapa	%r18, [%r31 + 0xfffffe6a] %asi
DS_3_14:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xcb424d9b	! Random illegal ?
	.word 0xd7140003  ! 1: LDQF_R	-	[%r16, %r3], %f11
	.word 0xa9a1c832  ! 36: FADDs	fadds	%f7, %f18, %f20
	.word 0x9ac4e2bc  ! 37: ADDCcc_I	addccc 	%r19, 0x02bc, %r13
	.word 0xe517c000  ! 38: LDQF_R	-	[%r31, %r0], %f18
splash_cmpr_3_15:
	setx 0x693e20cfcb9f6a3d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 39: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_3_16, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_16:
	.word 0xa5a0016a  ! 40: FABSq	dis not found

	.word 0xd49fc020  ! 41: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
splash_cmpr_3_17:
	setx 0x61b2d42888200302, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 42: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802a3b  ! 43: SIR	sir	0x0a3b
	.word 0x94dc0011  ! 44: SMULcc_R	smulcc 	%r16, %r17, %r10
splash_lsu_3_18:
	setx 0x9cdf1f8f41541943, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 45: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 46: RD_STICK_REG	stbar
	.word 0x93902002  ! 47: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x3a700001  ! 48: BPCC	<illegal instruction>
	.word 0xd48008a0  ! 49: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01971  ! 50: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a0196a  ! 51: FqTOd	dis not found

	setx 0xcfb5d02c5cccb825, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_21:
	.word 0x39400001  ! 52: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe207c000  ! 53: LDUW_R	lduw	[%r31 + %r0], %r17
	.word 0xe337fa5d  ! 54: STQF_I	-	%f17, [0x1a5d, %r31]
splash_cmpr_3_22:
	setx 0x7581b10f0317cec0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_23:
	setx 0xceff1ea66b122a61, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 56: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe21ffa5d  ! 57: LDD_I	ldd	[%r31 + 0xfffffa5d], %r17
splash_cmpr_3_24:
	setx 0x19050e3da11f8f2e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_3_25:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 59: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe2c00e80  ! 60: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r17
	.word 0x93902003  ! 61: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_cmpr_3_26:
	setx 0xefefdb039efff435, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_27:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd1104003  ! 1: LDQF_R	-	[%r1, %r3], %f8
	.word 0x93a04831  ! 63: FADDs	fadds	%f1, %f17, %f9
	.word 0xa3500000  ! 64: RDPR_TPC	<illegal instruction>
	.word 0xe69004a0  ! 65: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
donret_3_28:
	nop
	setx donretarg_3_28, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r25, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_28:
	.word 0xe6fffa5d  ! 66: SWAPA_I	swapa	%r19, [%r31 + 0xfffffa5d] %asi
debug_3_29:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 67: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_3_30:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 68: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
change_to_randtl_3_31:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_31:
	.word 0x8f902001  ! 69: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, @VA(.MAIN.xir_3_32)) -> intp(3,1,3)
xir_3_32:
	.word 0xa981b794  ! 70: WR_SET_SOFTINT_I	wr	%r6, 0x1794, %set_softint
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 71: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x99902003  ! 72: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
mondo_3_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d930001  ! 73: WRPR_WSTATE_R	wrpr	%r12, %r1, %wstate
	.word 0x91450000  ! 74: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0x98812404  ! 75: ADDcc_I	addcc 	%r4, 0x0404, %r12
mondo_3_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d92c00c  ! 76: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
	.word 0x8198288e  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088e, %hpstate
	.word 0xd527fcdf  ! 78: STF_I	st	%f10, [0x1cdf, %r31]
	.word 0xd597fcdf  ! 79: LDQFA_I	-	[%r31, 0x1cdf], %f10
tagged_3_35:
	taddcctv %r16, 0x107c, %r6
	.word 0xd407fcdf  ! 80: LDUW_I	lduw	[%r31 + 0xfffffcdf], %r10
	.word 0x9b500000  ! 81: RDPR_TPC	rdpr	%tpc, %r13
intveclr_3_36:
	setx 0xf39cdeeea97a7bc5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 82: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd66ffcdf  ! 84: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffffcdf]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36a2cc1  ! 85: SDIVX_I	sdivx	%r8, 0x0cc1, %r17
intveclr_3_38:
	setx 0x349f11f61feede71, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_3_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d92c013  ! 87: WRPR_WSTATE_R	wrpr	%r11, %r19, %wstate
	.word 0x2e700001  ! 88: BPVS	<illegal instruction>
debug_3_40:
	nop
	setx debug_3_40 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 89: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_3_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 90: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x819822e5  ! 91: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02e5, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 92: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx ivw_3_42, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_42:
	.word 0x91a00170  ! 93: FABSq	dis not found

	.word 0xd647ec7e  ! 94: LDSW_I	ldsw	[%r31 + 0x0c7e], %r11
	.word 0x2a800001  ! 95: BCS	bcs,a	<label_0x1>
	.word 0xd6d804a0  ! 96: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_3_43)) -> intp(3,1,3)
xir_3_43:
	.word 0xa984f3a8  ! 97: WR_SET_SOFTINT_I	wr	%r19, 0x13a8, %set_softint
	.word 0x8d9029a6  ! 98: WRPR_PSTATE_I	wrpr	%r0, 0x09a6, %pstate
mondo_3_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d910002  ! 99: WRPR_WSTATE_R	wrpr	%r4, %r2, %wstate
	.word 0x91d02034  ! 100: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x879020ae  ! 101: WRPR_TT_I	wrpr	%r0, 0x00ae, %tt
debug_3_45:
	nop
	setx debug_3_45 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 102: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd71fc000  ! 103: LDDF_R	ldd	[%r31, %r0], %f11
DS_3_46:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 104: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd6900e80  ! 105: LDUHA_R	lduha	[%r0, %r0] 0x74, %r11
	.word 0xd69ffa49  ! 106: LDDA_I	ldda	[%r31, + 0xfffffa49] %asi, %r11
	.word 0x879021ce  ! 107: WRPR_TT_I	wrpr	%r0, 0x01ce, %tt
	.word 0x9b450000  ! 108: RD_SET_SOFTINT	rd	%set_softint, %r13
debug_3_47:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 109: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81982c0f  ! 110: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0f, %hpstate
	.word 0x99a109d1  ! 111: FDIVd	fdivd	%f4, %f48, %f12
debug_3_48:
	nop
	setx debug_3_48 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 112: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802088  ! 113: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x81982fad  ! 114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fad, %hpstate
	.word 0x81982cbf  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cbf, %hpstate
intveclr_3_49:
	setx 0x9c30da59ac7b4ba3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 116: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 117: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x966c6b62  ! 118: UDIVX_I	udivx 	%r17, 0x0b62, %r11
	.word 0xd08008a0  ! 119: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
tagged_3_50:
	tsubcctv %r21, 0x19b6, %r4
	.word 0xd007f324  ! 120: LDUW_I	lduw	[%r31 + 0xfffff324], %r8
	.word 0xa1902006  ! 121: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_tba_3_51:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 122: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_3_52:
	nop
	setx debug_3_52 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 123: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902004  ! 124: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01967  ! 125: FqTOd	dis not found

debug_3_54:
	nop
	setx debug_3_54 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 126: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902006  ! 127: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
change_to_randtl_3_55:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_55:
	.word 0x8f902002  ! 128: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_3_56:
	setx 0x4ab588c7cacfad69, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_57:
	setx 0x8600016a08605643, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 130: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_58:
	setx 0x73b029c4d91c3785, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 131: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 132: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x8198283f  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x083f, %hpstate
intveclr_3_59:
	setx 0x710ea8e1a1022150, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 134: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd66ff324  ! 135: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff324]
	.word 0xd627f324  ! 136: STW_I	stw	%r11, [%r31 + 0xfffff324]
	.word 0xd69fc020  ! 137: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
debug_3_60:
	nop
	setx debug_3_60 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 138: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_3_61:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d90c003  ! 139: WRPR_WSTATE_R	wrpr	%r3, %r3, %wstate
	.word 0xd677f324  ! 140: STX_I	stx	%r11, [%r31 + 0xfffff324]
	.word 0x8d902a8b  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x0a8b, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_62)) -> intp(7,0,7)
intvec_3_62:
	.word 0x39400001  ! 142: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8198213c  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x013c, %hpstate
	setx 0x0daa34a9f86e9400, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_63:
	.word 0x39400001  ! 144: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_3_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d910000  ! 145: WRPR_WSTATE_R	wrpr	%r4, %r0, %wstate
splash_lsu_3_65:
	setx 0x4354eac86e6fa387, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 146: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 147: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
mondo_3_66:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d910008  ! 148: WRPR_WSTATE_R	wrpr	%r4, %r8, %wstate
DS_3_67:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 149: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
DS_3_68:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f18, %f8, %f4
	.word 0x91b34309  ! 150: ALIGNADDRESS	alignaddr	%r13, %r9, %r8
intveclr_3_69:
	setx 0xb5123da023f8a67e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 151: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd657f324  ! 152: LDSH_I	ldsh	[%r31 + 0xfffff324], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 153: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd727c006  ! 154: STF_R	st	%f11, [%r6, %r31]
	.word 0x83d020b4  ! 155: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xa982c003  ! 156: WR_SET_SOFTINT_R	wr	%r11, %r3, %set_softint
debug_3_70:
	nop
	setx debug_3_70 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 157: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 158: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x93902001  ! 159: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa7a089c3  ! 160: FDIVd	fdivd	%f2, %f34, %f50
DS_3_71:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f18, %f6, %f28
	.word 0xa3b50310  ! 161: ALIGNADDRESS	alignaddr	%r20, %r16, %r17
donret_3_72:
	nop
	setx donretarg_3_72, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r14, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_72:
	.word 0xdafff324  ! 162: SWAPA_I	swapa	%r13, [%r31 + 0xfffff324] %asi
debug_3_73:
	nop
	setx debug_3_73 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_3_74:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 164: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902002  ! 165: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa9500000  ! 166: RDPR_TPC	rdpr	%tpc, %r20
	.word 0x8d90288a  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x088a, %pstate
splash_cmpr_3_75:
	setx 0xd6485f13d4ecba3d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 168: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902001  ! 169: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_3_76:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe732000b  ! 1: STQF_R	-	%f19, [%r11, %r8]
	normalw
	.word 0x9b458000  ! 170: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x87902081  ! 171: WRPR_TT_I	wrpr	%r0, 0x0081, %tt
splash_cmpr_3_77:
	setx 0x1156028200fc824b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 173: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902001  ! 174: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	setx ivw_3_78, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_78:
	.word 0x9ba00165  ! 175: FABSq	dis not found

splash_cmpr_3_79:
	setx 0x2521c1e82e980780, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 176: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_80:
	setx 0x4b7c3cc54036dd7c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe7e7c030  ! 178: CASA_I	casa	[%r31] 0x 1, %r16, %r19
intveclr_3_81:
	setx 0x83a3162363e8e15f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 179: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 180: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xe727c010  ! 181: STF_R	st	%f19, [%r16, %r31]
	.word 0xe6800b80  ! 182: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r19
	.word 0x81b01021  ! 183: SIAM	siam	1
	.word 0xa1902001  ! 184: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xe61fc000  ! 185: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x2c800001  ! 186: BNEG	bneg,a	<label_0x1>
	.word 0x20800001  ! 187: BN	bn,a	<label_0x1>
	.word 0xe69ff324  ! 188: LDDA_I	ldda	[%r31, + 0xfffff324] %asi, %r19
splash_cmpr_3_82:
	setx 0x508ffbd6027fa5ee, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 189: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe67ff324  ! 190: SWAP_I	swap	%r19, [%r31 + 0xfffff324]
	setx 0x6dffc73fdd8fdb4b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_83:
	.word 0x39400001  ! 191: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
mondo_3_84:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d91c008  ! 193: WRPR_WSTATE_R	wrpr	%r7, %r8, %wstate
DS_3_85:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 194: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe6bff324  ! 195: STDA_I	stda	%r19, [%r31 + 0xfffff324] %asi
mondo_3_86:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d908013  ! 196: WRPR_WSTATE_R	wrpr	%r2, %r19, %wstate
change_to_randtl_3_87:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_87:
	.word 0x8f902002  ! 197: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a0196b  ! 198: FqTOd	dis not found

donret_3_89:
	nop
	setx donretarg_3_89, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r2, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_89:
	.word 0xe6fff324  ! 199: SWAPA_I	swapa	%r19, [%r31 + 0xfffff324] %asi
change_to_randtl_3_90:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_90:
	.word 0x8f902000  ! 200: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 201: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b5  ! 202: Tcc_I	ta	icc_or_xcc, %r0 + 181
mondo_3_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d948008  ! 203: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
	.word 0x38700001  ! 204: BPGU	<illegal instruction>
	.word 0x81982e06  ! 205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e06, %hpstate
	.word 0xe797f324  ! 206: LDQFA_I	-	[%r31, 0x1324], %f19
	.word 0x38800001  ! 207: BGU	bgu,a	<label_0x1>
splash_tba_3_92:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 208: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8198269d  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069d, %hpstate
	.word 0x9f80219b  ! 210: SIR	sir	0x019b
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a0196d  ! 211: FqTOd	dis not found

	.word 0xe717c000  ! 212: LDQF_R	-	[%r31, %r0], %f19
	.word 0x81460000  ! 213: RD_STICK_REG	stbar
	.word 0xe6dfe000  ! 214: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r19
	.word 0xa190200a  ! 215: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_cmpr_3_94:
	setx 0x0237c3cefc496cae, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d90304c  ! 217: WRPR_PSTATE_I	wrpr	%r0, 0x104c, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01970  ! 218: FqTOd	dis not found

debug_3_96:
	nop
	setx debug_3_96 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 219: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_3_97:
	setx 0xdc373dedfc8a85a7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 220: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd06ffc1f  ! 221: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffc1f]
	.word 0xd0d7e020  ! 222: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
tagged_3_98:
	tsubcctv %r17, 0x1371, %r21
	.word 0xd007fc1f  ! 223: LDUW_I	lduw	[%r31 + 0xfffffc1f], %r8
	.word 0xa7a0c9c3  ! 224: FDIVd	fdivd	%f34, %f34, %f50
mondo_3_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d914013  ! 225: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
splash_cmpr_3_100:
	setx 0xc0e982a35dc82981, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 226: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802757  ! 227: SIR	sir	0x0757
	.word 0xa1902008  ! 228: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x87902247  ! 229: WRPR_TT_I	wrpr	%r0, 0x0247, %tt
donret_3_101:
	nop
	setx donretarg_3_101, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r19, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_101:
	.word 0xd2ffeed1  ! 230: SWAPA_I	swapa	%r9, [%r31 + 0x0ed1] %asi
change_to_randtl_3_102:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_102:
	.word 0x8f902000  ! 231: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
!$EV trig_pc_d(1, @VA(.MAIN.xir_3_103)) -> intp(3,1,3)
xir_3_103:
	.word 0xa9802f01  ! 232: WR_SET_SOFTINT_I	wr	%r0, 0x0f01, %set_softint
	.word 0xd20fc000  ! 233: LDUB_R	ldub	[%r31 + %r0], %r9
debug_3_104:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 234: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd207c000  ! 235: LDUW_R	lduw	[%r31 + %r0], %r9
change_to_randtl_3_105:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_105:
	.word 0x8f902000  ! 236: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_3_106:
	setx 0x8453ddf18f0db622, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 237: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_3_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d944003  ! 238: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
splash_tba_3_108:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 239: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd29ffeae  ! 240: LDDA_I	ldda	[%r31, + 0xfffffeae] %asi, %r9
	.word 0xd28804a0  ! 241: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
DS_3_109:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd7150003  ! 1: LDQF_R	-	[%r20, %r3], %f11
	.word 0x99a08834  ! 242: FADDs	fadds	%f2, %f20, %f12
debug_3_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 243: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x3c800001  ! 244: BPOS	bpos,a	<label_0x1>
	setx ivw_3_111, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_111:
	.word 0x95a00167  ! 245: FABSq	dis not found

tagged_3_112:
	tsubcctv %r14, 0x19e1, %r23
	.word 0xd407feae  ! 246: LDUW_I	lduw	[%r31 + 0xfffffeae], %r10
	.word 0xd407c000  ! 247: LDUW_R	lduw	[%r31 + %r0], %r10
debug_3_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 248: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 249: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 250: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_3_114:
	setx 0x2e41a7e4e53afe67, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 251: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 252: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_3_115:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 253: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xd47ffeae  ! 254: SWAP_I	swap	%r10, [%r31 + 0xfffffeae]
	.word 0xd537feae  ! 255: STQF_I	-	%f10, [0x1eae, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_116)) -> intp(5,0,25)
intvec_3_116:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x24800001  ! 257: BLE	ble,a	<label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91a009d0  ! 259: FDIVd	fdivd	%f0, %f16, %f8
splash_tba_3_117:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 260: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93d02033  ! 261: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x81982bf7  ! 262: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bf7, %hpstate
change_to_randtl_3_118:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_118:
	.word 0x8f902001  ! 263: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 264: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xad82fa8e  ! 265: WR_SOFTINT_REG_I	wr	%r11, 0x1a8e, %softint
	.word 0x98ab4010  ! 266: ANDNcc_R	andncc 	%r13, %r16, %r12
!$EV trig_pc_d(1, @VA(.MAIN.xir_3_119)) -> intp(3,1,3)
xir_3_119:
	.word 0xa98133d7  ! 267: WR_SET_SOFTINT_I	wr	%r4, 0x13d7, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_120)) -> intp(0,0,17)
intvec_3_120:
	.word 0x39400001  ! 268: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 269: WRASI_I	wr	%r0, 0x004f, %asi
splash_cmpr_3_121:
	setx 0x769cc20b7f750dab, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 270: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa4fb4011  ! 271: SDIVcc_R	sdivcc 	%r13, %r17, %r18
	.word 0xe807c000  ! 272: LDUW_R	lduw	[%r31 + %r0], %r20
	setx ivw_3_122, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_122:
	.word 0x91a0016c  ! 273: FABSq	dis not found

mondo_3_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d900007  ! 274: WRPR_WSTATE_R	wrpr	%r0, %r7, %wstate
splash_cmpr_3_124:
	setx 0x9c71f59a6c8a8fa1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 275: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 276: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xa24ac00b  ! 277: MULX_R	mulx 	%r11, %r11, %r17
splash_cmpr_3_125:
	setx 0xa68d803d1d15645e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9b480000  ! 279: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
debug_3_126:
	nop
	setx debug_3_126 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 280: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x28700001  ! 281: BPLEU	<illegal instruction>
	.word 0x93902003  ! 282: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87802010  ! 283: WRASI_I	wr	%r0, 0x0010, %asi
change_to_randtl_3_127:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_127:
	.word 0x8f902002  ! 284: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01967  ! 285: FqTOd	dis not found

	.word 0x87802020  ! 286: WRASI_I	wr	%r0, 0x0020, %asi
splash_cmpr_3_129:
	setx 0x866398b700411796, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 287: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790205f  ! 288: WRPR_TT_I	wrpr	%r0, 0x005f, %tt
	.word 0x99a01a73  ! 289: FqTOi	fqtoi	
	.word 0xe81fffcf  ! 290: LDD_I	ldd	[%r31 + 0xffffffcf], %r20
	.word 0xe88008a0  ! 291: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
splash_cmpr_3_130:
	setx 0xf598a03c0de39927, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 292: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe93fc008  ! 293: STDF_R	std	%f20, [%r8, %r31]
	.word 0x87902287  ! 294: WRPR_TT_I	wrpr	%r0, 0x0287, %tt
	.word 0xe857c000  ! 295: LDSH_R	ldsh	[%r31 + %r0], %r20
	.word 0x3e800001  ! 296: BVC	bvc,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 297: LDX_R	ldx	[%r31 + %r0], %r20
DS_3_131:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 298: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	setx ivw_3_132, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_132:
	.word 0xa1a00170  ! 299: FABSq	dis not found

	.word 0x9f8020fb  ! 300: SIR	sir	0x00fb
	.word 0xa4db4000  ! 301: SMULcc_R	smulcc 	%r13, %r0, %r18
	.word 0x87802014  ! 302: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x9f802400  ! 303: SIR	sir	0x0400
	.word 0xd28008a0  ! 304: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd28008a0  ! 305: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_lsu_3_133:
	setx 0x081f4960278f4079, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 306: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_3_134:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 307: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x91d02033  ! 308: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_tba_3_135:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 309: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd27ff5df  ! 310: SWAP_I	swap	%r9, [%r31 + 0xfffff5df]
debug_3_136:
	nop
	setx debug_3_136 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 311: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_3_137:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 312: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd2d804a0  ! 313: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0xd2c004a0  ! 314: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56a3c8f  ! 315: SDIVX_I	sdivx	%r8, 0xfffffc8f, %r18
	.word 0x81982de6  ! 316: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0de6, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r18
DS_3_139:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd730c014  ! 1: STQF_R	-	%f11, [%r20, %r3]
	normalw
	.word 0xa7458000  ! 318: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0xe607c000  ! 319: LDUW_R	lduw	[%r31 + %r0], %r19
mondo_3_140:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d908004  ! 320: WRPR_WSTATE_R	wrpr	%r2, %r4, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7692855  ! 321: SDIVX_I	sdivx	%r4, 0x0855, %r19
	.word 0xd537c008  ! 322: STQF_R	-	%f10, [%r8, %r31]
	.word 0xab80400a  ! 323: WR_CLEAR_SOFTINT_R	wr	%r1, %r10, %clear_softint
	.word 0xd48008a0  ! 324: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa9818004  ! 325: WR_SET_SOFTINT_R	wr	%r6, %r4, %set_softint
mondo_3_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d94400c  ! 326: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
	.word 0x81460000  ! 327: RD_STICK_REG	stbar
change_to_randtl_3_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_143:
	.word 0x8f902002  ! 328: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
change_to_randtl_3_144:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_144:
	.word 0x8f902000  ! 329: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902003  ! 330: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd4dfe010  ! 331: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r10
pmu_3_145:
	nop
	setx 0xfffff31afffff15b, %g1, %g7
	.word 0xa3800007  ! 332: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d802004  ! 333: WRFPRS_I	wr	%r0, 0x0004, %fprs
mondo_3_146:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d924007  ! 334: WRPR_WSTATE_R	wrpr	%r9, %r7, %wstate
intveclr_3_147:
	setx 0x0126e83fcd242d71, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 335: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 336: WRASI_I	wr	%r0, 0x0020, %asi
splash_cmpr_3_148:
	setx 0x0c0479593999cf05, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b4  ! 338: Tcc_I	ta	icc_or_xcc, %r0 + 180
change_to_randtl_3_149:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_149:
	.word 0x8f902002  ! 339: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x2c800001  ! 340: BNEG	bneg,a	<label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936ca91a  ! 341: SDIVX_I	sdivx	%r18, 0x091a, %r9
debug_3_151:
	nop
	setx debug_3_151 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 342: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_3_152:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 343: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd647e7a8  ! 344: LDSW_I	ldsw	[%r31 + 0x07a8], %r11
	.word 0xa545c000  ! 345: RD_TICK_CMPR_REG	rd	%-, %r18
splash_tba_3_153:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 346: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f802b96  ! 347: SIR	sir	0x0b96
	.word 0x91d02035  ! 348: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d903449  ! 349: WRPR_PSTATE_I	wrpr	%r0, 0x1449, %pstate
	.word 0x87802089  ! 350: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81982c8f  ! 351: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8f, %hpstate
	.word 0x3a800001  ! 352: BCC	bcc,a	<label_0x1>
	.word 0xe88804a0  ! 353: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
splash_cmpr_3_154:
	setx 0x8203bdaa24f1b2be, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 354: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_3_155:
	setx 0x0035abbfdbddde49, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 355: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_3_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d928011  ! 356: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
	.word 0x36700001  ! 357: BPGE	<illegal instruction>
mondo_3_157:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d930013  ! 358: WRPR_WSTATE_R	wrpr	%r12, %r19, %wstate
DS_3_158:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f22, %f2, %f12
	.word 0x95b2c310  ! 359: ALIGNADDRESS	alignaddr	%r11, %r16, %r10
	setx ivw_3_159, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_159:
	.word 0x9ba00170  ! 360: FABSq	dis not found

	.word 0xd26ff7b0  ! 361: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffff7b0]
splash_tba_3_160:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 362: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91a189d2  ! 363: FDIVd	fdivd	%f6, %f18, %f8
	.word 0xd28008a0  ! 364: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
debug_3_161:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 365: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_3_162:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_162:
	.word 0x8f902002  ! 366: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa26d0006  ! 367: UDIVX_R	udivx 	%r20, %r6, %r17
	.word 0x81982197  ! 368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0197, %hpstate
DS_3_163:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe730ae44  ! 1: STQF_I	-	%f19, [0x0e44, %r2]
	normalw
	.word 0x93458000  ! 369: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6c3327  ! 370: SDIVX_I	sdivx	%r16, 0xfffff327, %r13
	.word 0xd2d004a0  ! 371: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
debug_3_165:
	nop
	setx debug_3_165 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 372: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_3_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d920010  ! 373: WRPR_WSTATE_R	wrpr	%r8, %r16, %wstate
	.word 0x879021d8  ! 374: WRPR_TT_I	wrpr	%r0, 0x01d8, %tt
	.word 0x99902000  ! 375: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x28700001  ! 376: BPLEU	<illegal instruction>
	.word 0xa190200b  ! 377: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x87802055  ! 378: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x94803fb1  ! 379: ADDcc_I	addcc 	%r0, 0xffffffb1, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 380: LDX_R	ldx	[%r31 + %r0], %r19
tagged_3_167:
	taddcctv %r25, 0x1ccd, %r14
	.word 0xe607f8ba  ! 381: LDUW_I	lduw	[%r31 + 0xfffff8ba], %r19
	.word 0xe61fc000  ! 382: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x93902006  ! 383: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8198298d  ! 384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098d, %hpstate
	.word 0x26700001  ! 385: BPL	<illegal instruction>
mondo_3_168:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d948006  ! 386: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
	.word 0x93902006  ! 387: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_cmpr_3_169:
	setx 0xe24f4b7bf2fa6e8b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 388: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_3_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d930007  ! 389: WRPR_WSTATE_R	wrpr	%r12, %r7, %wstate
mondo_3_171:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d950014  ! 390: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	.word 0xa190200d  ! 391: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	setx ivw_3_172, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_172:
	.word 0x91a0016a  ! 392: FABSq	dis not found

	setx 0x0e24509a95414fe5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_173:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_174:
	setx 0xb7dadf0f058fdda1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 394: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_175:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd710c011  ! 1: LDQF_R	-	[%r3, %r17], %f11
	.word 0x91a48821  ! 395: FADDs	fadds	%f18, %f1, %f8
mondo_3_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d908008  ! 396: WRPR_WSTATE_R	wrpr	%r2, %r8, %wstate
	.word 0x8198294f  ! 397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094f, %hpstate
	.word 0x8d802000  ! 398: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_3_177:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d92000d  ! 399: WRPR_WSTATE_R	wrpr	%r8, %r13, %wstate
splash_cmpr_3_178:
	setx 0xd2a543ffa5675910, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 400: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_3_179, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_179:
	.word 0x9ba00169  ! 401: FABSq	dis not found

splash_cmpr_3_180:
	setx 0x3069297fe016c642, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 402: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_181:
	nop
	setx debug_3_181 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 403: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93520000  ! 404: RDPR_PIL	<illegal instruction>
DS_3_182:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f10, %f6, %f24
	.word 0xa9b00303  ! 405: ALIGNADDRESS	alignaddr	%r0, %r3, %r20
mondo_3_183:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d924013  ! 406: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
mondo_3_184:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d91c002  ! 407: WRPR_WSTATE_R	wrpr	%r7, %r2, %wstate
	.word 0x8198213f  ! 408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x013f, %hpstate
	.word 0x91d020b2  ! 409: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x93902003  ! 410: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87802080  ! 411: WRASI_I	wr	%r0, 0x0080, %asi
mondo_3_185:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d920001  ! 412: WRPR_WSTATE_R	wrpr	%r8, %r1, %wstate
splash_tba_3_186:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 413: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_3_187:
	setx 0x73b769fdaf06939d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 414: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_3_188:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 415: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9a834013  ! 416: ADDcc_R	addcc 	%r13, %r19, %r13
	.word 0x99902003  ! 417: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xe46ff8ba  ! 418: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffff8ba]
DS_3_189:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa3b4c30b  ! 419: ALIGNADDRESS	alignaddr	%r19, %r11, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916c65c8  ! 420: SDIVX_I	sdivx	%r17, 0x05c8, %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01971  ! 421: FqTOd	dis not found

	.word 0x8d902e76  ! 422: WRPR_PSTATE_I	wrpr	%r0, 0x0e76, %pstate
	.word 0xa3a089c5  ! 423: FDIVd	fdivd	%f2, %f36, %f48
tagged_3_192:
	tsubcctv %r19, 0x1486, %r13
	.word 0xd007ec55  ! 424: LDUW_I	lduw	[%r31 + 0x0c55], %r8
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 425: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 426: LDX_R	ldx	[%r31 + %r0], %r8
debug_3_193:
	nop
	setx debug_3_193 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 427: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93d02033  ! 428: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xd04fec55  ! 429: LDSB_I	ldsb	[%r31 + 0x0c55], %r8
	.word 0xd08fe010  ! 430: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x97520000  ! 432: RDPR_PIL	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6b63e0  ! 433: SDIVX_I	sdivx	%r13, 0x03e0, %r13
mondo_3_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d94c00d  ! 434: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
debug_3_196:
	nop
	setx debug_3_196 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 435: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_3_197:
	taddcctv %r17, 0x19f5, %r25
	.word 0xe007ef0e  ! 436: LDUW_I	lduw	[%r31 + 0x0f0e], %r16
	.word 0x91d02032  ! 437: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe08008a0  ! 438: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x91d02034  ! 439: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_3_198:
	setx 0x63ec8eb9876df79d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 440: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_3_199:
	setx 0x9e098e13c7c65be5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 441: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe0800a60  ! 442: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r16
	.word 0x9f802104  ! 443: SIR	sir	0x0104
intveclr_3_200:
	setx 0x1c418d4fe8978b7b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 444: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 445: Tcc_I	ta	icc_or_xcc, %r0 + 53
mondo_3_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d90c002  ! 446: WRPR_WSTATE_R	wrpr	%r3, %r2, %wstate
	.word 0x99902001  ! 447: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
mondo_3_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d950002  ! 448: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
	.word 0xe137c00c  ! 449: STQF_R	-	%f16, [%r12, %r31]
	setx 0xbd8e1916b99a2de2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_203:
	.word 0x39400001  ! 450: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902138  ! 451: WRPR_TT_I	wrpr	%r0, 0x0138, %tt
change_to_randtl_3_204:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_204:
	.word 0x8f902000  ! 452: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9f803ad7  ! 453: SIR	sir	0x1ad7
	.word 0xa1500000  ! 454: RDPR_TPC	<illegal instruction>
	.word 0x8198289f  ! 455: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089f, %hpstate
debug_3_205:
	nop
	setx debug_3_205 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 456: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_3_206:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 457: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996b26d8  ! 458: SDIVX_I	sdivx	%r12, 0x06d8, %r12
tagged_3_208:
	tsubcctv %r26, 0x17bf, %r16
	.word 0xd007e283  ! 459: LDUW_I	lduw	[%r31 + 0x0283], %r8
	.word 0xd08008a0  ! 460: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
debug_3_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 461: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802016  ! 462: WRASI_I	wr	%r0, 0x0016, %asi
change_to_randtl_3_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_210:
	.word 0x8f902002  ! 463: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd09fe283  ! 464: LDDA_I	ldda	[%r31, + 0x0283] %asi, %r8
	.word 0xa681c014  ! 465: ADDcc_R	addcc 	%r7, %r20, %r19
	.word 0x9f803318  ! 466: SIR	sir	0x1318
	.word 0x879021ad  ! 467: WRPR_TT_I	wrpr	%r0, 0x01ad, %tt
debug_3_211:
	nop
	setx debug_3_211 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 468: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe4c004a0  ! 469: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r18
	.word 0xe4c7e000  ! 470: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
	.word 0xe48008a0  ! 471: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 472: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_3_212:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 473: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x879021c3  ! 474: WRPR_TT_I	wrpr	%r0, 0x01c3, %tt
splash_tba_3_213:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 475: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_3_214:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 476: SAVE_R	save	%r31, %r0, %r31
	.word 0xe48804a0  ! 477: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
debug_3_215:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 478: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe4c804a0  ! 479: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r18
	.word 0x97a409d0  ! 480: FDIVd	fdivd	%f16, %f16, %f42
	.word 0x93902001  ! 481: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
intveclr_3_216:
	setx 0x698737bfe50fceb6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_3_217:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd1310010  ! 1: STQF_R	-	%f8, [%r16, %r4]
	normalw
	.word 0x91458000  ! 483: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x87802010  ! 484: WRASI_I	wr	%r0, 0x0010, %asi
debug_3_218:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 485: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x26700001  ! 486: BPL	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01963  ! 487: FqTOd	dis not found

splash_cmpr_3_220:
	setx 0x9d2bc0ceb3c0f446, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 488: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 489: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 490: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe897e010  ! 491: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r20
	.word 0xe8880e60  ! 492: LDUBA_R	lduba	[%r0, %r0] 0x73, %r20
intveclr_3_221:
	setx 0x713f02b3df170d82, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 493: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe847e9df  ! 494: LDSW_I	ldsw	[%r31 + 0x09df], %r20
	.word 0xe827e9df  ! 495: STW_I	stw	%r20, [%r31 + 0x09df]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9369a326  ! 496: SDIVX_I	sdivx	%r6, 0x0326, %r9
	.word 0x9f802394  ! 497: SIR	sir	0x0394
	.word 0x93454000  ! 498: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0xd0dfe020  ! 499: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r8
	.word 0x87802016  ! 500: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xd127c003  ! 501: STF_R	st	%f8, [%r3, %r31]
	.word 0x819820af  ! 502: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00af, %hpstate
splash_tba_3_223:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 503: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x99902000  ! 504: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xd0d7e030  ! 505: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 506: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_3_224:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xf358dd82	! Random illegal ?
	.word 0xe1110014  ! 1: LDQF_R	-	[%r4, %r20], %f16
	.word 0x93a44830  ! 507: FADDs	fadds	%f17, %f16, %f9
	.word 0x8790222b  ! 508: WRPR_TT_I	wrpr	%r0, 0x022b, %tt
splash_lsu_3_225:
	setx 0x1c76dca5a4408153, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 509: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 510: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd25ff2d8  ! 511: LDX_I	ldx	[%r31 + 0xfffff2d8], %r9
	.word 0x8198230f  ! 512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030f, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_226)) -> intp(4,0,29)
intvec_3_226:
	.word 0x39400001  ! 513: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 514: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9032f4  ! 515: WRPR_PSTATE_I	wrpr	%r0, 0x12f4, %pstate
	.word 0xa1902002  ! 516: WRPR_GL_I	wrpr	%r0, 0x0002, %-
intveclr_3_227:
	setx 0x18980407f2181ae9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 517: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_3_228:
	nop
	setx donretarg_3_228, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r13, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_228:
	.word 0xd2fff2d8  ! 518: SWAPA_I	swapa	%r9, [%r31 + 0xfffff2d8] %asi
	.word 0x81982234  ! 519: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0234, %hpstate
	.word 0x81b01021  ! 520: SIAM	siam	1
	.word 0xd2c004a0  ! 521: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	.word 0x38700001  ! 522: BPGU	<illegal instruction>
	.word 0x2e800001  ! 523: BVS	bvs,a	<label_0x1>
tagged_3_229:
	taddcctv %r20, 0x1502, %r5
	.word 0xd207f2d8  ! 524: LDUW_I	lduw	[%r31 + 0xfffff2d8], %r9
intveclr_3_230:
	setx 0x40e5c087d18c8b6f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_231:
	setx 0xa397932ada650858, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 526: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902008  ! 527: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xa8c0ebe6  ! 528: ADDCcc_I	addccc 	%r3, 0x0be6, %r20
	.word 0x87802016  ! 529: WRASI_I	wr	%r0, 0x0016, %asi
splash_cmpr_3_232:
	setx 0x6240f578183af7d5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 530: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_3_233:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d918000  ! 531: WRPR_WSTATE_R	wrpr	%r6, %r0, %wstate
	.word 0x879021b6  ! 532: WRPR_TT_I	wrpr	%r0, 0x01b6, %tt
	.word 0x91d020b4  ! 533: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xe48008a0  ! 534: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa5a1c9c9  ! 535: FDIVd	fdivd	%f38, %f40, %f18
	.word 0xe8dfe030  ! 536: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
	.word 0xa7a089c4  ! 537: FDIVd	fdivd	%f2, %f4, %f50
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956c3b99  ! 538: SDIVX_I	sdivx	%r16, 0xfffffb99, %r10
	.word 0x9b540000  ! 539: RDPR_GL	rdpr	%-, %r13
	.word 0xd6dfe010  ! 540: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
splash_tba_3_235:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 541: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa5480000  ! 542: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 543: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_3_236:
	tsubcctv %r4, 0x1872, %r20
	.word 0xe607e600  ! 544: LDUW_I	lduw	[%r31 + 0x0600], %r19
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 545: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_3_237:
	setx 0xb43d20c2a3ebf195, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 546: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_3_238:
	setx 0x31a43d7cf28e80d2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902195  ! 548: WRPR_TT_I	wrpr	%r0, 0x0195, %tt
	setx 0x1edea2d70895e150, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_239:
	.word 0x39400001  ! 549: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_3_240:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d914005  ! 550: WRPR_WSTATE_R	wrpr	%r5, %r5, %wstate
intveclr_3_241:
	setx 0x15763430503e7b1d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 551: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902279  ! 552: WRPR_TT_I	wrpr	%r0, 0x0279, %tt
	.word 0xe6c7e010  ! 553: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r19
	.word 0x93902006  ! 554: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe6800c00  ! 555: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r19
	.word 0x97454000  ! 556: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
tagged_3_242:
	tsubcctv %r5, 0x1256, %r14
	.word 0xe807e600  ! 557: LDUW_I	lduw	[%r31 + 0x0600], %r20
debug_3_243:
	nop
	setx debug_3_243 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 558: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x22800001  ! 559: BE	be,a	<label_0x1>
intveclr_3_244:
	setx 0xfd1dff83a295d3a7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 560: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_245:
	setx 0x97187774f88cb6c7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 561: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9029d6  ! 562: WRPR_PSTATE_I	wrpr	%r0, 0x09d6, %pstate
debug_3_246:
	nop
	setx debug_3_246 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 563: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x51911e3d0e58b71a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_247:
	.word 0x39400001  ! 564: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_3_248:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 565: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_3_249:
	setx 0xf49a66e648cca739, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 566: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902007  ! 567: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x87802080  ! 568: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x9553c000  ! 569: RDPR_FQ	<illegal instruction>
	.word 0x99a00560  ! 570: FSQRTq	fsqrt	
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 571: LDX_R	ldx	[%r31 + %r0], %r9
debug_3_250:
	nop
	setx debug_3_250 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 572: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01967  ! 573: FqTOd	dis not found

	.word 0x95b20fe8  ! 574: FONES	e	%f10
splash_cmpr_3_252:
	setx 0x634b378cfc1d3acd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 575: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 576: LDX_R	ldx	[%r31 + %r0], %r11
	setx 0xc353db94413c1693, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_253:
	.word 0x39400001  ! 577: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6c7e010  ! 578: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r11
	.word 0x8d902f72  ! 579: WRPR_PSTATE_I	wrpr	%r0, 0x0f72, %pstate
	.word 0x91d02032  ! 580: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87802088  ! 581: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd737c004  ! 582: STQF_R	-	%f11, [%r4, %r31]
	.word 0x926d0008  ! 583: UDIVX_R	udivx 	%r20, %r8, %r9
splash_cmpr_3_254:
	setx 0x06f17015045eb3a6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 584: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_255:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe911400a  ! 1: LDQF_R	-	[%r5, %r10], %f20
	.word 0x99a14828  ! 585: FADDs	fadds	%f5, %f8, %f12
mondo_3_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d904009  ! 586: WRPR_WSTATE_R	wrpr	%r1, %r9, %wstate
	.word 0xe53fc00a  ! 587: STDF_R	std	%f18, [%r10, %r31]
tagged_3_257:
	taddcctv %r20, 0x1eea, %r9
	.word 0xe407e600  ! 588: LDUW_I	lduw	[%r31 + 0x0600], %r18
pmu_3_258:
	nop
	setx 0xfffff6b3ffffff85, %g1, %g7
	.word 0xa3800007  ! 589: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xad812400  ! 590: WR_SOFTINT_REG_I	wr	%r4, 0x0400, %softint
tagged_3_259:
	taddcctv %r16, 0x11e3, %r1
	.word 0xe407e4ec  ! 591: LDUW_I	lduw	[%r31 + 0x04ec], %r18
	.word 0xa3520000  ! 592: RDPR_PIL	<illegal instruction>
change_to_randtl_3_260:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_260:
	.word 0x8f902000  ! 593: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd827e4ec  ! 594: STW_I	stw	%r12, [%r31 + 0x04ec]
	.word 0x81460000  ! 595: RD_STICK_REG	stbar
mondo_3_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d940000  ! 596: WRPR_WSTATE_R	wrpr	%r16, %r0, %wstate
	.word 0x8d903cfc  ! 597: WRPR_PSTATE_I	wrpr	%r0, 0x1cfc, %pstate
	.word 0x87902313  ! 598: WRPR_TT_I	wrpr	%r0, 0x0313, %tt
	.word 0x8d903323  ! 599: WRPR_PSTATE_I	wrpr	%r0, 0x1323, %pstate
	.word 0x81982ced  ! 600: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ced, %hpstate
	.word 0x93902007  ! 601: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81460000  ! 602: RD_STICK_REG	stbar
	.word 0x26800001  ! 603: BL	bl,a	<label_0x1>
debug_3_262:
	nop
	setx debug_3_262 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 604: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902007  ! 605: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_tba_3_263:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 606: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_3_264:
	nop
	setx debug_3_264 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 607: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81982385  ! 608: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0385, %hpstate
change_to_randtl_3_265:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_265:
	.word 0x8f902002  ! 609: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x93902004  ! 610: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd8c7e010  ! 611: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
intveclr_3_266:
	setx 0x1751d0b2fb7e633e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 612: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa190200b  ! 613: WRPR_GL_I	wrpr	%r0, 0x000b, %-
debug_3_267:
	nop
	setx debug_3_267 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 614: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd8cfe010  ! 615: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r12
debug_3_268:
	nop
	setx debug_3_268 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 616: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_3_269:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d920012  ! 617: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 618: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_3_270:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 619: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x28700001  ! 620: BPLEU	<illegal instruction>
	.word 0x93902003  ! 621: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
mondo_3_271:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d90400c  ! 622: WRPR_WSTATE_R	wrpr	%r1, %r12, %wstate
splash_lsu_3_272:
	setx 0x9847bdb322afdb49, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 623: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_3_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d900013  ! 624: WRPR_WSTATE_R	wrpr	%r0, %r19, %wstate
	.word 0xd8880e40  ! 625: LDUBA_R	lduba	[%r0, %r0] 0x72, %r12
splash_cmpr_3_274:
	setx 0xfd64859671329e55, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 626: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 627: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_3_275:
	setx 0x79b5a9a23ee42335, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 628: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 629: BL	bl,a	<label_0x1>
mondo_3_276:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d920008  ! 630: WRPR_WSTATE_R	wrpr	%r8, %r8, %wstate
	setx ivw_3_277, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_277:
	.word 0x99a00170  ! 631: FABSq	dis not found

	.word 0xd4c004a0  ! 632: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
splash_cmpr_3_278:
	setx 0x346dda502510e5c2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 633: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x97a01a69  ! 635: FqTOi	fqtoi	
	.word 0xd647e4ec  ! 636: LDSW_I	ldsw	[%r31 + 0x04ec], %r11
debug_3_279:
	nop
	setx debug_3_279 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 637: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936af0f2  ! 638: SDIVX_I	sdivx	%r11, 0xfffff0f2, %r9
splash_tba_3_281:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 639: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_3_282:
	setx 0xac8dce2a8b126a75, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 640: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_3_283:
	nop
	setx debug_3_283 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 641: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_284)) -> intp(5,0,15)
intvec_3_284:
	.word 0x39400001  ! 642: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 643: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9769e16d  ! 644: SDIVX_I	sdivx	%r7, 0x016d, %r11
	.word 0xd2d00e40  ! 645: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01971  ! 646: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76ce9dd  ! 647: SDIVX_I	sdivx	%r19, 0x09dd, %r19
pmu_3_288:
	nop
	setx 0xfffffab7fffffbf9, %g1, %g7
	.word 0xa3800007  ! 648: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 649: LDX_R	ldx	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 650: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe01ff035  ! 651: LDD_I	ldd	[%r31 + 0xfffff035], %r16
mondo_3_289:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d92c006  ! 652: WRPR_WSTATE_R	wrpr	%r11, %r6, %wstate
splash_lsu_3_290:
	setx 0x480ed38b905f2479, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 653: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_3_291:
	nop
	setx debug_3_291 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 654: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902002  ! 655: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982d4c  ! 656: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4c, %hpstate
tagged_3_292:
	tsubcctv %r9, 0x1831, %r2
	.word 0xe007f035  ! 657: LDUW_I	lduw	[%r31 + 0xfffff035], %r16
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a0196c  ! 658: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936b6744  ! 659: SDIVX_I	sdivx	%r13, 0x0744, %r9
	.word 0x81510000  ! 660: RDPR_TICK	rdpr	%tick, %r0
	setx 0x2db8c641105f967a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_295:
	.word 0x39400001  ! 661: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_3_296:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 662: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_3_297:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe9340002  ! 1: STQF_R	-	%f20, [%r2, %r16]
	normalw
	.word 0x99458000  ! 663: RD_SOFTINT_REG	rd	%softint, %r12
pmu_3_298:
	nop
	setx 0xfffff456fffff901, %g1, %g7
	.word 0xa3800007  ! 664: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_3_299:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_299:
	.word 0x8f902000  ! 665: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_3_300:
	nop
	setx debug_3_300 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 666: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902002  ! 667: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd68008a0  ! 668: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_tba_3_301:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 669: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_302)) -> intp(3,0,17)
intvec_3_302:
	.word 0x39400001  ! 670: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_3_303:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 671: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_3_304:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d930007  ! 672: WRPR_WSTATE_R	wrpr	%r12, %r7, %wstate
	.word 0xd6880e40  ! 673: LDUBA_R	lduba	[%r0, %r0] 0x72, %r11
	.word 0xd68008a0  ! 674: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	setx 0x6faf3c9cf516d25c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_305:
	.word 0x39400001  ! 675: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802055  ! 676: WRASI_I	wr	%r0, 0x0055, %asi
	setx ivw_3_306, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_306:
	.word 0x99a0016c  ! 677: FABSq	dis not found

	.word 0xa345c000  ! 678: RD_TICK_CMPR_REG	rd	%-, %r17
splash_lsu_3_307:
	setx 0x20e8af9a6a411d5f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 679: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_3_308:
	tsubcctv %r4, 0x1962, %r1
	.word 0xe807eed1  ! 680: LDUW_I	lduw	[%r31 + 0x0ed1], %r20
splash_cmpr_3_309:
	setx 0x89b163f59863d83f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 681: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879022e4  ! 682: WRPR_TT_I	wrpr	%r0, 0x02e4, %tt
tagged_3_310:
	tsubcctv %r24, 0x1426, %r17
	.word 0xe807eed1  ! 683: LDUW_I	lduw	[%r31 + 0x0ed1], %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996aa7b6  ! 684: SDIVX_I	sdivx	%r10, 0x07b6, %r12
change_to_randtl_3_312:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_312:
	.word 0x8f902002  ! 685: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_3_313:
	nop
	setx debug_3_313 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 686: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_3_314:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_314:
	.word 0x8f902000  ! 687: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
mondo_3_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d950011  ! 688: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
	.word 0x93902006  ! 689: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_3_316:
	nop
	setx debug_3_316 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 690: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x2b90034a0e76dc11, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_317:
	.word 0x39400001  ! 691: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 692: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 693: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xad826d2f  ! 694: WR_SOFTINT_REG_I	wr	%r9, 0x0d2f, %softint
	.word 0x87802058  ! 695: WRASI_I	wr	%r0, 0x0058, %asi
change_to_randtl_3_318:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_318:
	.word 0x8f902000  ! 696: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01971  ! 697: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9683675  ! 698: SDIVX_I	sdivx	%r0, 0xfffff675, %r20
debug_3_321:
	nop
	setx debug_3_321 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 699: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_3_322:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 700: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_3_323:
	taddcctv %r23, 0x1591, %r14
	.word 0xe407f52a  ! 701: LDUW_I	lduw	[%r31 + 0xfffff52a], %r18
mondo_3_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d940000  ! 702: WRPR_WSTATE_R	wrpr	%r16, %r0, %wstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 703: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902235  ! 704: WRPR_PSTATE_I	wrpr	%r0, 0x0235, %pstate
	.word 0xa3a01a69  ! 705: FqTOi	fqtoi	
	.word 0x81982796  ! 706: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0796, %hpstate
	setx ivw_3_325, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_325:
	.word 0x95a00174  ! 707: FABSq	dis not found

	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 708: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 709: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81982525  ! 710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0525, %hpstate
	.word 0xd237f52a  ! 711: STH_I	sth	%r9, [%r31 + 0xfffff52a]
	.word 0x9f803ffb  ! 712: SIR	sir	0x1ffb
	.word 0xd317c000  ! 713: LDQF_R	-	[%r31, %r0], %f9
splash_cmpr_3_326:
	setx 0x0a3c0634fc8ff882, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 714: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 715: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_3_327:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 716: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_3_328:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d908001  ! 717: WRPR_WSTATE_R	wrpr	%r2, %r1, %wstate
	.word 0xd337e0ec  ! 718: STQF_I	-	%f9, [0x00ec, %r31]
	.word 0xa1454000  ! 719: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
	.word 0x99902001  ! 720: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xd48008a0  ! 721: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_cmpr_3_329:
	setx 0xb52a1680bb6b78ee, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 722: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_330:
	setx 0xdcfdd1b2dbadc998, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 723: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_3_331, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_331:
	.word 0xa1a00173  ! 724: FABSq	dis not found

splash_tba_3_332:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 725: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790203b  ! 726: WRPR_TT_I	wrpr	%r0, 0x003b, %tt
	.word 0x91d02032  ! 727: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe20fe0ec  ! 728: LDUB_I	ldub	[%r31 + 0x00ec], %r17
	.word 0x81510000  ! 729: RDPR_TICK	rdpr	%tick, %r0
	setx ivw_3_333, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_333:
	.word 0x91a00173  ! 730: FABSq	dis not found

	.word 0x91d02033  ! 731: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_3_334:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d94800b  ! 732: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
	.word 0x93902002  ! 733: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87802004  ! 734: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802010  ! 735: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xe917c000  ! 736: LDQF_R	-	[%r31, %r0], %f20
	setx ivw_3_335, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_335:
	.word 0x99a00165  ! 737: FABSq	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_336)) -> intp(7,0,9)
intvec_3_336:
	.word 0x39400001  ! 738: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_3_337:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa9a00554  ! 1: FSQRTd	fsqrt	
	.word 0x97a04833  ! 739: FADDs	fadds	%f1, %f19, %f11
change_to_randtl_3_338:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_338:
	.word 0x8f902002  ! 740: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_3_339:
	setx 0x2662d69310cd67a2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 741: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe6800a80  ! 742: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r19
debug_3_340:
	nop
	setx debug_3_340 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 743: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96ce16f  ! 744: SDIVX_I	sdivx	%r19, 0x016f, %r20
splash_htba_3_342:
	set 0x00390000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 745: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd01ffb39  ! 746: LDD_I	ldd	[%r31 + 0xfffffb39], %r8
	.word 0x2a800001  ! 747: BCS	bcs,a	<label_0x1>
	.word 0x93902000  ! 748: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_3_343:
	setx 0xb0cea7565b0676b5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 749: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7a509d2  ! 750: FDIVd	fdivd	%f20, %f18, %f50
	.word 0xad8028d2  ! 751: WR_SOFTINT_REG_I	wr	%r0, 0x08d2, %softint
debug_3_344:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 752: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91454000  ! 753: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0x87902382  ! 754: WRPR_TT_I	wrpr	%r0, 0x0382, %tt
	.word 0xe2880e40  ! 755: LDUBA_R	lduba	[%r0, %r0] 0x72, %r17
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 756: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_3_345:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 757: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x8d902c9b  ! 758: WRPR_PSTATE_I	wrpr	%r0, 0x0c9b, %pstate
	.word 0x87902284  ! 759: WRPR_TT_I	wrpr	%r0, 0x0284, %tt
DS_3_346:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f16, %f2, %f10
	.word 0x91b4c305  ! 760: ALIGNADDRESS	alignaddr	%r19, %r5, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01970  ! 761: FqTOd	dis not found

	.word 0xda4fc000  ! 762: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01965  ! 763: FqTOd	dis not found

	.word 0xa1902008  ! 764: WRPR_GL_I	wrpr	%r0, 0x0008, %-
mondo_3_349:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d918012  ! 765: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
	.word 0xd327ed48  ! 766: STF_I	st	%f9, [0x0d48, %r31]
	.word 0xd2c804a0  ! 767: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 768: LDX_R	ldx	[%r31 + %r0], %r9
DS_3_350:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 769: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd257ed48  ! 770: LDSH_I	ldsh	[%r31 + 0x0d48], %r9
	.word 0xd28fe010  ! 771: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r9
DS_3_351:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x97b44314  ! 772: ALIGNADDRESS	alignaddr	%r17, %r20, %r11
	.word 0xab844008  ! 773: WR_CLEAR_SOFTINT_R	wr	%r17, %r8, %clear_softint
	.word 0xe457c000  ! 774: LDSH_R	ldsh	[%r31 + %r0], %r18
intveclr_3_352:
	setx 0x188f22a6339396c8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 775: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_3_353:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d918014  ! 776: WRPR_WSTATE_R	wrpr	%r6, %r20, %wstate
mondo_3_354:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d920005  ! 777: WRPR_WSTATE_R	wrpr	%r8, %r5, %wstate
	.word 0xe41fc000  ! 778: LDD_R	ldd	[%r31 + %r0], %r18
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 779: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01964  ! 780: FqTOd	dis not found

	.word 0xd037ed48  ! 781: STH_I	sth	%r8, [%r31 + 0x0d48]
splash_lsu_3_356:
	setx 0x201152c1bb012083, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 782: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_3_357:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 783: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xd11fed48  ! 784: LDDF_I	ldd	[%r31, 0x0d48], %f8
debug_3_358:
	nop
	setx debug_3_358 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 785: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_3_359:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd9104014  ! 1: LDQF_R	-	[%r1, %r20], %f12
	.word 0xa9a2c834  ! 786: FADDs	fadds	%f11, %f20, %f20
splash_cmpr_3_360:
	setx 0x8e0fe4c28052e5ec, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 787: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 788: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 789: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01974  ! 790: FqTOd	dis not found

	.word 0x8d903555  ! 791: WRPR_PSTATE_I	wrpr	%r0, 0x1555, %pstate
	.word 0xe68008a0  ! 792: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
splash_cmpr_3_362:
	setx 0x55daffbeb14bc0e0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 793: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x5ef3ee7d0ccf4a77, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_363:
	.word 0x39400001  ! 794: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 795: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x20700001  ! 796: BPN	<illegal instruction>
	.word 0xe67fed48  ! 797: SWAP_I	swap	%r19, [%r31 + 0x0d48]
	.word 0x8d90206b  ! 798: WRPR_PSTATE_I	wrpr	%r0, 0x006b, %pstate
change_to_randtl_3_364:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_364:
	.word 0x8f902001  ! 799: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 800: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe677c007  ! 801: STX_R	stx	%r19, [%r31 + %r7]
	.word 0xe6c7e020  ! 802: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r19
splash_htba_3_365:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 803: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_3_366:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d900007  ! 804: WRPR_WSTATE_R	wrpr	%r0, %r7, %wstate
	setx ivw_3_367, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_367:
	.word 0xa9a00174  ! 805: FABSq	dis not found

	.word 0x87902199  ! 806: WRPR_TT_I	wrpr	%r0, 0x0199, %tt
	.word 0x91d02032  ! 807: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x9550c000  ! 808: RDPR_TT	<illegal instruction>
	.word 0x8d90366c  ! 809: WRPR_PSTATE_I	wrpr	%r0, 0x166c, %pstate
	.word 0x87902390  ! 810: WRPR_TT_I	wrpr	%r0, 0x0390, %tt
	.word 0xe48008a0  ! 811: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe537ed48  ! 812: STQF_I	-	%f18, [0x0d48, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 813: LDX_R	ldx	[%r31 + %r0], %r18
mondo_3_368:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d92c005  ! 814: WRPR_WSTATE_R	wrpr	%r11, %r5, %wstate
	setx 0x32061374f7d2595f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_369:
	.word 0x39400001  ! 815: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_3_370:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d950006  ! 816: WRPR_WSTATE_R	wrpr	%r20, %r6, %wstate
tagged_3_371:
	taddcctv %r13, 0x1053, %r6
	.word 0xe407ed48  ! 817: LDUW_I	lduw	[%r31 + 0x0d48], %r18
splash_cmpr_3_372:
	setx 0xcf19d0ceb80b8062, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 818: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_373:
	nop
	setx debug_3_373 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 819: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 820: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe48804a0  ! 821: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
mondo_3_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d934003  ! 822: WRPR_WSTATE_R	wrpr	%r13, %r3, %wstate
	.word 0x95a0cdca  ! 823: FdMULq	fdmulq	
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 824: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903ece  ! 825: WRPR_PSTATE_I	wrpr	%r0, 0x1ece, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 826: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4dfe030  ! 827: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
	.word 0xab844004  ! 828: WR_CLEAR_SOFTINT_R	wr	%r17, %r4, %clear_softint
	.word 0xd46fed48  ! 829: LDSTUB_I	ldstub	%r10, [%r31 + 0x0d48]
	setx 0x00a0fb1355886281, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_375:
	.word 0x39400001  ! 830: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_3_376:
	nop
	setx debug_3_376 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 831: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8790224c  ! 832: WRPR_TT_I	wrpr	%r0, 0x024c, %tt
	setx ivw_3_377, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_377:
	.word 0x91a00160  ! 833: FABSq	dis not found

	.word 0x91540000  ! 834: RDPR_GL	<illegal instruction>
	.word 0xd73fed48  ! 835: STDF_I	std	%f11, [0x0d48, %r31]
	.word 0xa1902005  ! 836: WRPR_GL_I	wrpr	%r0, 0x0005, %-
DS_3_378:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xd540fd87	! Random illegal ?
	.word 0xa1a00547  ! 1: FSQRTd	fsqrt	
	.word 0x93a14826  ! 837: FADDs	fadds	%f5, %f6, %f9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 838: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6900e60  ! 839: LDUHA_R	lduha	[%r0, %r0] 0x73, %r11
	.word 0x93902003  ! 840: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_3_379:
	nop
	setx debug_3_379 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 841: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_3_380:
	setx 0x42e946c68b7ce791, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 842: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_3_381:
	setx 0xe7b4724c215b10b1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 843: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 844: RDPR_TICK	rdpr	%tick, %r0
	setx ivw_3_382, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_382:
	.word 0x95a00165  ! 845: FABSq	dis not found

	.word 0xd89004a0  ! 846: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0xd91fc000  ! 847: LDDF_R	ldd	[%r31, %r0], %f12
change_to_randtl_3_383:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_383:
	.word 0x8f902000  ! 848: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd8800b20  ! 849: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r12
splash_tba_3_384:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 850: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_3_385:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe914000d  ! 1: LDQF_R	-	[%r16, %r13], %f20
	.word 0x93a0c822  ! 851: FADDs	fadds	%f3, %f2, %f9
debug_3_386:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 852: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9168f52e  ! 853: SDIVX_I	sdivx	%r3, 0xfffff52e, %r8
	.word 0xe647f42d  ! 854: LDSW_I	ldsw	[%r31 + 0xfffff42d], %r19
	.word 0xe717c000  ! 855: LDQF_R	-	[%r31, %r0], %f19
	.word 0x87802014  ! 856: WRASI_I	wr	%r0, 0x0014, %asi
intveclr_3_388:
	setx 0x5756a4cbb9fd5fe3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 857: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_3_389:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd734000b  ! 1: STQF_R	-	%f11, [%r11, %r16]
	normalw
	.word 0x95458000  ! 858: RD_SOFTINT_REG	rd	%softint, %r10
debug_3_390:
	nop
	setx debug_3_390 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 859: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902867  ! 860: WRPR_PSTATE_I	wrpr	%r0, 0x0867, %pstate
	.word 0xad8520e4  ! 861: WR_SOFTINT_REG_I	wr	%r20, 0x00e4, %softint
splash_cmpr_3_391:
	setx 0xf3e0b124c4084707, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 862: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_392:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0x91614a3e	! Random illegal ?
	.word 0xd914400d  ! 1: LDQF_R	-	[%r17, %r13], %f12
	.word 0x97a0c824  ! 863: FADDs	fadds	%f3, %f4, %f11
	.word 0xd8880e40  ! 864: LDUBA_R	lduba	[%r0, %r0] 0x72, %r12
splash_cmpr_3_393:
	setx 0xe5aaf5247ff52f57, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 865: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_394:
	nop
	setx debug_3_394 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 866: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd8d00e40  ! 867: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r12
	.word 0xa3480000  ! 868: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	setx 0x7f0e4a30108a2d40, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_395:
	.word 0x39400001  ! 869: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa8dcc00b  ! 870: SMULcc_R	smulcc 	%r19, %r11, %r20
	.word 0xa1902006  ! 871: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_lsu_3_396:
	setx 0xf7cfb56171161c4b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 872: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_3_397:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_397:
	.word 0x8f902002  ! 873: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe63ff1d4  ! 874: STD_I	std	%r19, [%r31 + 0xfffff1d4]
splash_cmpr_3_398:
	setx 0xafbb37a38d19c054, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 875: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_399:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb35000b  ! 1: STQF_R	-	%f13, [%r11, %r20]
	normalw
	.word 0x93458000  ! 876: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x93902000  ! 877: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa1902000  ! 878: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 879: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879023a8  ! 880: WRPR_TT_I	wrpr	%r0, 0x03a8, %tt
splash_cmpr_3_400:
	setx 0x153c2b4082ed8d3d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 881: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b4  ! 882: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x22700001  ! 883: BPE	<illegal instruction>
	.word 0xe317c000  ! 884: LDQF_R	-	[%r31, %r0], %f17
	.word 0x8d90394e  ! 885: WRPR_PSTATE_I	wrpr	%r0, 0x194e, %pstate
splash_cmpr_3_401:
	setx 0x2c6a09af5b4a800b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 886: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe2d004a0  ! 887: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
splash_lsu_3_402:
	setx 0x780b7e3a1af19c91, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 888: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_3_403:
	setx 0x1863bc74cb8b8b35, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 889: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 890: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa5a289ca  ! 891: FDIVd	fdivd	%f10, %f10, %f18
DS_3_404:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd534c005  ! 1: STQF_R	-	%f10, [%r5, %r19]
	normalw
	.word 0x91458000  ! 892: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8d9038a5  ! 893: WRPR_PSTATE_I	wrpr	%r0, 0x18a5, %pstate
	.word 0x8d9029f5  ! 894: WRPR_PSTATE_I	wrpr	%r0, 0x09f5, %pstate
	.word 0x8d903a61  ! 895: WRPR_PSTATE_I	wrpr	%r0, 0x1a61, %pstate
splash_cmpr_3_405:
	setx 0xa418d9b8eb9cdcf8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 896: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2a800001  ! 897: BCS	bcs,a	<label_0x1>
splash_cmpr_3_406:
	setx 0xac04b685c1f47af1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 898: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_407:
	setx 0xae39e729e8743fbb, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 899: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_408)) -> intp(4,0,17)
intvec_3_408:
	.word 0x39400001  ! 900: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_3_409:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d91000d  ! 901: WRPR_WSTATE_R	wrpr	%r4, %r13, %wstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 902: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 903: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a0196c  ! 904: FqTOd	dis not found

pmu_3_411:
	nop
	setx 0xfffff358ffffff20, %g1, %g7
	.word 0xa3800007  ! 905: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_3_412:
	setx 0xe98d45fefc9c0507, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 906: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9545c000  ! 907: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0xd86ff1d4  ! 908: LDSTUB_I	ldstub	%r12, [%r31 + 0xfffff1d4]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 909: LDX_R	ldx	[%r31 + %r0], %r12
tagged_3_413:
	taddcctv %r1, 0x1e3c, %r15
	.word 0xd807f1d4  ! 910: LDUW_I	lduw	[%r31 + 0xfffff1d4], %r12
DS_3_414:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd331b969  ! 1: STQF_I	-	%f9, [0x1969, %r6]
	normalw
	.word 0x95458000  ! 911: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x8d802000  ! 912: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93d02035  ! 913: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x879020c6  ! 914: WRPR_TT_I	wrpr	%r0, 0x00c6, %tt
	.word 0x93d020b2  ! 915: Tcc_I	tne	icc_or_xcc, %r0 + 178
splash_cmpr_3_415:
	setx 0x3ece71c4cfd0df9b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 916: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_3_416:
	setx 0xbbf6121c1f7c8114, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 917: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_3_417:
	nop
	setx debug_3_417 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 918: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx ivw_3_418, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_418:
	.word 0x91a00160  ! 919: FABSq	dis not found

	.word 0x93902003  ! 920: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_3_419:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 921: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd397ea29  ! 922: LDQFA_I	-	[%r31, 0x0a29], %f9
	.word 0x87902383  ! 923: WRPR_TT_I	wrpr	%r0, 0x0383, %tt
	.word 0xd33fc012  ! 924: STDF_R	std	%f9, [%r18, %r31]
	.word 0xa190200f  ! 925: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa1902008  ! 926: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd25fea29  ! 927: LDX_I	ldx	[%r31 + 0x0a29], %r9
	setx ivw_3_420, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_420:
	.word 0x91a00167  ! 928: FABSq	dis not found

	.word 0xdac7e010  ! 929: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01973  ! 930: FqTOd	dis not found

intveclr_3_422:
	setx 0xa32a94c5bb947dd8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 931: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_3_423:
	nop
	setx debug_3_423 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 932: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x819829d6  ! 933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d6, %hpstate
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 934: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_3_424:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d91c007  ! 935: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
	.word 0xd21fc000  ! 936: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01963  ! 937: FqTOd	dis not found

mondo_3_426:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d95000d  ! 938: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
	.word 0x8780204f  ! 939: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x93902004  ! 940: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd43fc00d  ! 941: STD_R	std	%r10, [%r31 + %r13]
	.word 0xd48fe010  ! 942: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0xa0dcc007  ! 943: SMULcc_R	smulcc 	%r19, %r7, %r16
	.word 0xd00fc000  ! 944: LDUB_R	ldub	[%r31 + %r0], %r8
	.word 0x93902006  ! 945: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
donret_3_427:
	nop
	setx donretarg_3_427, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r22, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_427:
	.word 0xd0ffea29  ! 946: SWAPA_I	swapa	%r8, [%r31 + 0x0a29] %asi
DS_3_428:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 947: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd09fc020  ! 948: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
splash_lsu_3_429:
	setx 0x03912ade2ab0b459, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 949: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 950: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd0d7e000  ! 951: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
splash_lsu_3_430:
	setx 0xf3aaa0307d8449f7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 952: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 953: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01974  ! 954: FqTOd	dis not found

	.word 0x93902001  ! 955: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa1902006  ! 956: WRPR_GL_I	wrpr	%r0, 0x0006, %-
debug_3_432:
	nop
	setx debug_3_432 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 957: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_3_433:
	setx 0x7fac678a91daa88f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 958: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_3_434:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe3334011  ! 1: STQF_R	-	%f17, [%r17, %r13]
	normalw
	.word 0xa9458000  ! 959: RD_SOFTINT_REG	rd	%softint, %r20
splash_htba_3_435:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 960: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x9f8026c4  ! 961: SIR	sir	0x06c4
	.word 0xd68008a0  ! 962: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 963: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_3_436:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_436:
	.word 0x8f902000  ! 964: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x99902000  ! 965: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
splash_cmpr_3_437:
	setx 0x106ed84e1b7ac793, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 966: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879020cd  ! 967: WRPR_TT_I	wrpr	%r0, 0x00cd, %tt
splash_lsu_3_438:
	setx 0x45f77ce81ba8c6f7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_439:
	setx 0x8d381ffe401650b3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 969: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903f50  ! 970: WRPR_PSTATE_I	wrpr	%r0, 0x1f50, %pstate
	.word 0xd61fc000  ! 971: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd657c000  ! 972: LDSH_R	ldsh	[%r31 + %r0], %r11
change_to_randtl_3_440:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_440:
	.word 0x8f902001  ! 973: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d9020b4  ! 974: WRPR_PSTATE_I	wrpr	%r0, 0x00b4, %pstate
splash_cmpr_3_441:
	setx 0x805906c2c92a78a7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 975: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902209  ! 976: WRPR_TT_I	wrpr	%r0, 0x0209, %tt
	.word 0xa7480000  ! 977: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
debug_3_442:
	nop
	setx debug_3_442 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 978: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_3_443:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 979: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d90246e  ! 980: WRPR_PSTATE_I	wrpr	%r0, 0x046e, %pstate
tagged_3_444:
	tsubcctv %r14, 0x171c, %r9
	.word 0xe407ec60  ! 981: LDUW_I	lduw	[%r31 + 0x0c60], %r18
	.word 0x87802016  ! 982: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x93902002  ! 983: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xe41fc000  ! 984: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x81510000  ! 985: RDPR_TICK	rdpr	%tick, %r0
	.word 0x91d02032  ! 986: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe48008a0  ! 987: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
splash_tba_3_445:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 988: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_3_446:
	setx 0xe9548142d1f0774e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 989: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_3_447:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d94400a  ! 990: WRPR_WSTATE_R	wrpr	%r17, %r10, %wstate
change_to_randtl_3_448:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_448:
	.word 0x8f902002  ! 991: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x93902007  ! 992: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x95480000  ! 993: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x8d802000  ! 994: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa982c00d  ! 995: WR_SET_SOFTINT_R	wr	%r11, %r13, %set_softint
debug_3_449:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 996: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_3_450:
	setx 0x9b14674b6d9559ad, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 997: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd28fe020  ! 998: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r9
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
mondo_2_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d930005  ! 1: WRPR_WSTATE_R	wrpr	%r12, %r5, %wstate
	.word 0x8d903f97  ! 2: WRPR_PSTATE_I	wrpr	%r0, 0x1f97, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 3: LDX_R	ldx	[%r31 + %r0], %r13
	setx 0x93695b14c095b8d8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_1:
	.word 0x39400001  ! 4: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996a222d  ! 5: SDIVX_I	sdivx	%r8, 0x022d, %r12
	.word 0xab848006  ! 6: WR_CLEAR_SOFTINT_R	wr	%r18, %r6, %clear_softint
splash_cmpr_2_3:
	setx 0x2188adaf3d9c5b9b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802020  ! 8: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8d9028a0  ! 9: WRPR_PSTATE_I	wrpr	%r0, 0x08a0, %pstate
	.word 0xd637e0e3  ! 10: STH_I	sth	%r11, [%r31 + 0x00e3]
	.word 0xd68008a0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_2_4:
	setx 0x81a5fada858a0f71, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 12: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_2_5:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 13: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_2_6:
	setx 0xc0515ecb1aeedb29, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 14: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 15: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_2_7:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f14, %f26, %f6
	.word 0x95b40301  ! 16: ALIGNADDRESS	alignaddr	%r16, %r1, %r10
	.word 0x81982925  ! 17: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0925, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a0196a  ! 18: FqTOd	dis not found

	.word 0xd797e0e3  ! 19: LDQFA_I	-	[%r31, 0x00e3], %f11
	.word 0xa6d44002  ! 20: UMULcc_R	umulcc 	%r17, %r2, %r19
tagged_2_9:
	taddcctv %r23, 0x1a6b, %r25
	.word 0xe807e0e3  ! 21: LDUW_I	lduw	[%r31 + 0x00e3], %r20
	.word 0x91d02035  ! 22: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe89fc020  ! 23: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	setx ivw_2_10, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_10:
	.word 0x97a00164  ! 24: FABSq	dis not found

	.word 0xe49fc020  ! 25: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
	.word 0x81982104  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0104, %hpstate
	.word 0xa950c000  ! 27: RDPR_TT	<illegal instruction>
	setx ivw_2_11, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_11:
	.word 0xa9a00166  ! 28: FABSq	dis not found

	.word 0x8790222b  ! 29: WRPR_TT_I	wrpr	%r0, 0x022b, %tt
mondo_2_12:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d948008  ! 30: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
	.word 0xa5a049cb  ! 31: FDIVd	fdivd	%f32, %f42, %f18
	.word 0x9f802fa0  ! 32: SIR	sir	0x0fa0
	.word 0xe41fc000  ! 33: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x36700001  ! 34: BPGE	<illegal instruction>
donret_2_13:
	nop
	setx donretarg_2_13, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r20, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_13:
	.word 0xe4fffe6a  ! 35: SWAPA_I	swapa	%r18, [%r31 + 0xfffffe6a] %asi
DS_2_14:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xb55beb66	! Random illegal ?
	.word 0xd3108001  ! 1: LDQF_R	-	[%r2, %r1], %f9
	.word 0x99a0c826  ! 36: FADDs	fadds	%f3, %f6, %f12
	.word 0x90c2f63d  ! 37: ADDCcc_I	addccc 	%r11, 0xfffff63d, %r8
	.word 0xe517c000  ! 38: LDQF_R	-	[%r31, %r0], %f18
splash_cmpr_2_15:
	setx 0x6f085fe95461bb17, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 39: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_2_16, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_16:
	.word 0x99a0016d  ! 40: FABSq	dis not found

	.word 0xd49fc020  ! 41: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
splash_cmpr_2_17:
	setx 0x01663d66b866d28d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 42: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f80341d  ! 43: SIR	sir	0x141d
	.word 0x90dc800b  ! 44: SMULcc_R	smulcc 	%r18, %r11, %r8
splash_lsu_2_18:
	setx 0x225de153d49d5591, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 45: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 46: RD_STICK_REG	stbar
	.word 0x93902007  ! 47: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x3a700001  ! 48: BPCC	<illegal instruction>
	.word 0xd48008a0  ! 49: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01969  ! 50: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01970  ! 51: FqTOd	dis not found

	setx 0x703a97652b0c280b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_21:
	.word 0x39400001  ! 52: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe207c000  ! 53: LDUW_R	lduw	[%r31 + %r0], %r17
	.word 0xe337fa5d  ! 54: STQF_I	-	%f17, [0x1a5d, %r31]
splash_cmpr_2_22:
	setx 0x175d3e0fdcc7f6ff, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_23:
	setx 0x0cea3c963067dc6c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 56: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe21ffa5d  ! 57: LDD_I	ldd	[%r31 + 0xfffffa5d], %r17
splash_cmpr_2_24:
	setx 0x81f58194689c4f34, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_2_25:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 59: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe2c004a0  ! 60: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r17
	.word 0x93902007  ! 61: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_cmpr_2_26:
	setx 0xb2ac778ed2eecc67, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_27:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe7104014  ! 1: LDQF_R	-	[%r1, %r20], %f19
	.word 0x9ba44821  ! 63: FADDs	fadds	%f17, %f1, %f13
	.word 0xa7500000  ! 64: RDPR_TPC	<illegal instruction>
	.word 0xe6900e40  ! 65: LDUHA_R	lduha	[%r0, %r0] 0x72, %r19
donret_2_28:
	nop
	setx donretarg_2_28, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r21, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_28:
	.word 0xe6fffa5d  ! 66: SWAPA_I	swapa	%r19, [%r31 + 0xfffffa5d] %asi
debug_2_29:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 67: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_2_30:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 68: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
change_to_randtl_2_31:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_31:
	.word 0x8f902003  ! 69: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
!$EV trig_pc_d(1, @VA(.MAIN.xir_2_32)) -> intp(2,1,3)
xir_2_32:
	.word 0xa984a559  ! 70: WR_SET_SOFTINT_I	wr	%r18, 0x0559, %set_softint
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 71: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902003  ! 72: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
mondo_2_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d92c00c  ! 73: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
	.word 0x93450000  ! 74: RD_SET_SOFTINT	rd	%set_softint, %r9
	.word 0xa6836cb9  ! 75: ADDcc_I	addcc 	%r13, 0x0cb9, %r19
mondo_2_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d920006  ! 76: WRPR_WSTATE_R	wrpr	%r8, %r6, %wstate
	.word 0x819823d5  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d5, %hpstate
	.word 0xd527fcdf  ! 78: STF_I	st	%f10, [0x1cdf, %r31]
	.word 0xd597fcdf  ! 79: LDQFA_I	-	[%r31, 0x1cdf], %f10
tagged_2_35:
	taddcctv %r7, 0x1a40, %r2
	.word 0xd407fcdf  ! 80: LDUW_I	lduw	[%r31 + 0xfffffcdf], %r10
	.word 0x93500000  ! 81: RDPR_TPC	rdpr	%tpc, %r9
intveclr_2_36:
	setx 0xb5254754901b7f0d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 82: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6800c20  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r11
	.word 0xd66ffcdf  ! 84: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffffcdf]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56aeebd  ! 85: SDIVX_I	sdivx	%r11, 0x0ebd, %r18
intveclr_2_38:
	setx 0x83939cd25492b112, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d940013  ! 87: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
	.word 0x2e700001  ! 88: BPVS	<illegal instruction>
debug_2_40:
	nop
	setx debug_2_40 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 89: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_2_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 90: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81982afd  ! 91: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0afd, %hpstate
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 92: Tcc_R	te	icc_or_xcc, %r0 + %r30
	setx ivw_2_42, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_42:
	.word 0x99a00170  ! 93: FABSq	dis not found

	.word 0xd647ec7e  ! 94: LDSW_I	ldsw	[%r31 + 0x0c7e], %r11
	.word 0x2a800001  ! 95: BCS	bcs,a	<label_0x1>
	.word 0xd6d80e60  ! 96: LDXA_R	ldxa	[%r0, %r0] 0x73, %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_2_43)) -> intp(2,1,3)
xir_2_43:
	.word 0xa984babf  ! 97: WR_SET_SOFTINT_I	wr	%r18, 0x1abf, %set_softint
	.word 0x8d903185  ! 98: WRPR_PSTATE_I	wrpr	%r0, 0x1185, %pstate
mondo_2_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d904013  ! 99: WRPR_WSTATE_R	wrpr	%r1, %r19, %wstate
	.word 0x83d02034  ! 100: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x87902202  ! 101: WRPR_TT_I	wrpr	%r0, 0x0202, %tt
debug_2_45:
	nop
	setx debug_2_45 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 102: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd71fc000  ! 103: LDDF_R	ldd	[%r31, %r0], %f11
DS_2_46:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 104: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd69004a0  ! 105: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0xd69ffa49  ! 106: LDDA_I	ldda	[%r31, + 0xfffffa49] %asi, %r11
	.word 0x87902304  ! 107: WRPR_TT_I	wrpr	%r0, 0x0304, %tt
	.word 0x91450000  ! 108: RD_SET_SOFTINT	rd	%set_softint, %r8
debug_2_47:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 109: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81982f2d  ! 110: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f2d, %hpstate
	.word 0x9ba149d2  ! 111: FDIVd	fdivd	%f36, %f18, %f44
debug_2_48:
	nop
	setx debug_2_48 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 112: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802004  ! 113: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x81982515  ! 114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0515, %hpstate
	.word 0x81982f44  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f44, %hpstate
intveclr_2_49:
	setx 0x00ba11a3922bf2a4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 116: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 117: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xa06cbb6b  ! 118: UDIVX_I	udivx 	%r18, 0xfffffb6b, %r16
	.word 0xd08008a0  ! 119: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
tagged_2_50:
	tsubcctv %r26, 0x19b2, %r26
	.word 0xd007f324  ! 120: LDUW_I	lduw	[%r31 + 0xfffff324], %r8
	.word 0xa1902004  ! 121: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_tba_2_51:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 122: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_2_52:
	nop
	setx debug_2_52 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 123: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902008  ! 124: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0196c  ! 125: FqTOd	dis not found

debug_2_54:
	nop
	setx debug_2_54 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 126: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902001  ! 127: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_randtl_2_55:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_55:
	.word 0x8f902002  ! 128: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_2_56:
	setx 0x83472f8f97f95bcf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_57:
	setx 0x15186974299487da, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 130: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_58:
	setx 0xa1151f30980bf1e8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 131: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 132: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x819827ff  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07ff, %hpstate
intveclr_2_59:
	setx 0x7ec19cc769f3e00d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 134: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd66ff324  ! 135: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff324]
	.word 0xd627f324  ! 136: STW_I	stw	%r11, [%r31 + 0xfffff324]
	.word 0xd69fc020  ! 137: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
debug_2_60:
	nop
	setx debug_2_60 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 138: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_2_61:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d950000  ! 139: WRPR_WSTATE_R	wrpr	%r20, %r0, %wstate
	.word 0xd677f324  ! 140: STX_I	stx	%r11, [%r31 + 0xfffff324]
	.word 0x8d903980  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x1980, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_62)) -> intp(0,0,26)
intvec_2_62:
	.word 0x39400001  ! 142: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x819822cd  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cd, %hpstate
	setx 0x2f0a60db0e317d1b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_63:
	.word 0x39400001  ! 144: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d94c003  ! 145: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
splash_lsu_2_65:
	setx 0x9a0db981d99eb489, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 146: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 147: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
mondo_2_66:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d934013  ! 148: WRPR_WSTATE_R	wrpr	%r13, %r19, %wstate
DS_2_67:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 149: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
DS_2_68:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f18, %f8, %f26
	.word 0x91b2c302  ! 150: ALIGNADDRESS	alignaddr	%r11, %r2, %r8
intveclr_2_69:
	setx 0x36ba031ae23909d7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 151: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd657f324  ! 152: LDSH_I	ldsh	[%r31 + 0xfffff324], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 153: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd727c006  ! 154: STF_R	st	%f11, [%r6, %r31]
	.word 0x91d020b5  ! 155: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xa9808011  ! 156: WR_SET_SOFTINT_R	wr	%r2, %r17, %set_softint
debug_2_70:
	nop
	setx debug_2_70 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 157: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 158: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x93902000  ! 159: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91a209cc  ! 160: FDIVd	fdivd	%f8, %f12, %f8
DS_2_71:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f26, %f16, %f24
	.word 0xa1b1c301  ! 161: ALIGNADDRESS	alignaddr	%r7, %r1, %r16
donret_2_72:
	nop
	setx donretarg_2_72, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r26, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_72:
	.word 0xdafff324  ! 162: SWAPA_I	swapa	%r13, [%r31 + 0xfffff324] %asi
debug_2_73:
	nop
	setx debug_2_73 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_2_74:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 164: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200a  ! 165: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x93500000  ! 166: RDPR_TPC	<illegal instruction>
	.word 0x8d90340f  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x140f, %pstate
splash_cmpr_2_75:
	setx 0x990d9ccc06d44c9e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 168: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902004  ! 169: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_2_76:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe5328008  ! 1: STQF_R	-	%f18, [%r8, %r10]
	normalw
	.word 0xa3458000  ! 170: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x879023be  ! 171: WRPR_TT_I	wrpr	%r0, 0x03be, %tt
splash_cmpr_2_77:
	setx 0xd886e271f3bfe7d0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b2  ! 173: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x93902004  ! 174: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	setx ivw_2_78, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_78:
	.word 0xa9a00160  ! 175: FABSq	dis not found

splash_cmpr_2_79:
	setx 0xef517a416d6289b7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 176: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_80:
	setx 0xd1bca35ca418965f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe7e7c030  ! 178: CASA_I	casa	[%r31] 0x 1, %r16, %r19
intveclr_2_81:
	setx 0xcb616224d0230d42, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 179: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 180: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xe727c010  ! 181: STF_R	st	%f19, [%r16, %r31]
	.word 0xe6800b00  ! 182: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r19
	.word 0x81b01021  ! 183: SIAM	siam	1
	.word 0xa1902006  ! 184: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xe61fc000  ! 185: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x2c800001  ! 186: BNEG	bneg,a	<label_0x1>
	.word 0x20800001  ! 187: BN	bn,a	<label_0x1>
	.word 0xe69ff324  ! 188: LDDA_I	ldda	[%r31, + 0xfffff324] %asi, %r19
splash_cmpr_2_82:
	setx 0xd6d3c85c4869f683, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 189: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe67ff324  ! 190: SWAP_I	swap	%r19, [%r31 + 0xfffff324]
	setx 0x89ed36e7fef82c61, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_83:
	.word 0x39400001  ! 191: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
mondo_2_84:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d92000d  ! 193: WRPR_WSTATE_R	wrpr	%r8, %r13, %wstate
DS_2_85:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 194: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe6bff324  ! 195: STDA_I	stda	%r19, [%r31 + 0xfffff324] %asi
mondo_2_86:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d91400d  ! 196: WRPR_WSTATE_R	wrpr	%r5, %r13, %wstate
change_to_randtl_2_87:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_87:
	.word 0x8f902001  ! 197: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01964  ! 198: FqTOd	dis not found

donret_2_89:
	nop
	setx donretarg_2_89, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r6, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_89:
	.word 0xe6fff324  ! 199: SWAPA_I	swapa	%r19, [%r31 + 0xfffff324] %asi
change_to_randtl_2_90:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_90:
	.word 0x8f902002  ! 200: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 201: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02034  ! 202: Tcc_I	tne	icc_or_xcc, %r0 + 52
mondo_2_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d93000d  ! 203: WRPR_WSTATE_R	wrpr	%r12, %r13, %wstate
	.word 0x38700001  ! 204: BPGU	<illegal instruction>
	.word 0x81982c2c  ! 205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c2c, %hpstate
	.word 0xe797f324  ! 206: LDQFA_I	-	[%r31, 0x1324], %f19
	.word 0x38800001  ! 207: BGU	bgu,a	<label_0x1>
splash_tba_2_92:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 208: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982d4e  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4e, %hpstate
	.word 0x9f802c4e  ! 210: SIR	sir	0x0c4e
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01971  ! 211: FqTOd	dis not found

	.word 0xe717c000  ! 212: LDQF_R	-	[%r31, %r0], %f19
	.word 0x81460000  ! 213: RD_STICK_REG	stbar
	.word 0xe6dfe030  ! 214: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r19
	.word 0xa1902003  ! 215: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_cmpr_2_94:
	setx 0x78640b33ffc823da, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902876  ! 217: WRPR_PSTATE_I	wrpr	%r0, 0x0876, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01968  ! 218: FqTOd	dis not found

debug_2_96:
	nop
	setx debug_2_96 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 219: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_2_97:
	setx 0xc783541f8e7b2c6a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 220: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd06ffc1f  ! 221: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffc1f]
	.word 0xd0d7e020  ! 222: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
tagged_2_98:
	tsubcctv %r1, 0x1834, %r23
	.word 0xd007fc1f  ! 223: LDUW_I	lduw	[%r31 + 0xfffffc1f], %r8
	.word 0x95a489c4  ! 224: FDIVd	fdivd	%f18, %f4, %f10
mondo_2_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d92000a  ! 225: WRPR_WSTATE_R	wrpr	%r8, %r10, %wstate
splash_cmpr_2_100:
	setx 0xdc3894b53f38dadf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 226: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f8029a1  ! 227: SIR	sir	0x09a1
	.word 0xa190200c  ! 228: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x879020bf  ! 229: WRPR_TT_I	wrpr	%r0, 0x00bf, %tt
donret_2_101:
	nop
	setx donretarg_2_101, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r26, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_101:
	.word 0xd2ffeed1  ! 230: SWAPA_I	swapa	%r9, [%r31 + 0x0ed1] %asi
change_to_randtl_2_102:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_102:
	.word 0x8f902001  ! 231: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, @VA(.MAIN.xir_2_103)) -> intp(2,1,3)
xir_2_103:
	.word 0xa9842971  ! 232: WR_SET_SOFTINT_I	wr	%r16, 0x0971, %set_softint
	.word 0xd20fc000  ! 233: LDUB_R	ldub	[%r31 + %r0], %r9
debug_2_104:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 234: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd207c000  ! 235: LDUW_R	lduw	[%r31 + %r0], %r9
change_to_randtl_2_105:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_105:
	.word 0x8f902003  ! 236: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
intveclr_2_106:
	setx 0xc0186e54b384b163, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 237: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d900011  ! 238: WRPR_WSTATE_R	wrpr	%r0, %r17, %wstate
splash_tba_2_108:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 239: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd29ffeae  ! 240: LDDA_I	ldda	[%r31, + 0xfffffeae] %asi, %r9
	.word 0xd2880e60  ! 241: LDUBA_R	lduba	[%r0, %r0] 0x73, %r9
DS_2_109:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe1140013  ! 1: LDQF_R	-	[%r16, %r19], %f16
	.word 0x91a0882d  ! 242: FADDs	fadds	%f2, %f13, %f8
debug_2_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 243: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x3c800001  ! 244: BPOS	bpos,a	<label_0x1>
	setx ivw_2_111, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_111:
	.word 0x91a00162  ! 245: FABSq	dis not found

tagged_2_112:
	tsubcctv %r21, 0x164a, %r26
	.word 0xd407feae  ! 246: LDUW_I	lduw	[%r31 + 0xfffffeae], %r10
	.word 0xd407c000  ! 247: LDUW_R	lduw	[%r31 + %r0], %r10
debug_2_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 248: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 249: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 250: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_2_114:
	setx 0x8f17340b6bbd31a1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 251: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02034  ! 252: Tcc_I	te	icc_or_xcc, %r0 + 52
DS_2_115:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 253: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xd47ffeae  ! 254: SWAP_I	swap	%r10, [%r31 + 0xfffffeae]
	.word 0xd537feae  ! 255: STQF_I	-	%f10, [0x1eae, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_116)) -> intp(7,0,19)
intvec_2_116:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x24800001  ! 257: BLE	ble,a	<label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 258: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1a1c9d0  ! 259: FDIVd	fdivd	%f38, %f16, %f16
splash_tba_2_117:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 260: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93d02033  ! 261: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x819825e4  ! 262: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05e4, %hpstate
change_to_randtl_2_118:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_118:
	.word 0x8f902000  ! 263: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 264: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xad81a912  ! 265: WR_SOFTINT_REG_I	wr	%r6, 0x0912, %softint
	.word 0x98aa4013  ! 266: ANDNcc_R	andncc 	%r9, %r19, %r12
!$EV trig_pc_d(1, @VA(.MAIN.xir_2_119)) -> intp(2,1,3)
xir_2_119:
	.word 0xa9843313  ! 267: WR_SET_SOFTINT_I	wr	%r16, 0x1313, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_120)) -> intp(7,0,11)
intvec_2_120:
	.word 0x39400001  ! 268: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 269: WRASI_I	wr	%r0, 0x0080, %asi
splash_cmpr_2_121:
	setx 0x59ba916c827e42f5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 270: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa8fac012  ! 271: SDIVcc_R	sdivcc 	%r11, %r18, %r20
	.word 0xe807c000  ! 272: LDUW_R	lduw	[%r31 + %r0], %r20
	setx ivw_2_122, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_122:
	.word 0x9ba00171  ! 273: FABSq	dis not found

mondo_2_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d904011  ! 274: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
splash_cmpr_2_124:
	setx 0x5612ca138a742c08, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 275: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 276: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x924a4013  ! 277: MULX_R	mulx 	%r9, %r19, %r9
splash_cmpr_2_125:
	setx 0x0bd1caae34b9529c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91480000  ! 279: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
debug_2_126:
	nop
	setx debug_2_126 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 280: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x28700001  ! 281: BPLEU	<illegal instruction>
	.word 0x93902004  ! 282: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87802016  ! 283: WRASI_I	wr	%r0, 0x0016, %asi
change_to_randtl_2_127:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_127:
	.word 0x8f902002  ! 284: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01970  ! 285: FqTOd	dis not found

	.word 0x87802004  ! 286: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_2_129:
	setx 0x37fd57bcd7e254a1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 287: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790207a  ! 288: WRPR_TT_I	wrpr	%r0, 0x007a, %tt
	.word 0xa9a01a65  ! 289: FqTOi	fqtoi	
	.word 0xe81fffcf  ! 290: LDD_I	ldd	[%r31 + 0xffffffcf], %r20
	.word 0xe88008a0  ! 291: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
splash_cmpr_2_130:
	setx 0x80071373b37a9474, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 292: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe93fc008  ! 293: STDF_R	std	%f20, [%r8, %r31]
	.word 0x87902155  ! 294: WRPR_TT_I	wrpr	%r0, 0x0155, %tt
	.word 0xe857c000  ! 295: LDSH_R	ldsh	[%r31 + %r0], %r20
	.word 0x3e800001  ! 296: BVC	bvc,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 297: LDX_R	ldx	[%r31 + %r0], %r20
DS_2_131:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 298: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	setx ivw_2_132, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_132:
	.word 0x93a0016b  ! 299: FABSq	dis not found

	.word 0x9f8024d8  ! 300: SIR	sir	0x04d8
	.word 0x92db4014  ! 301: SMULcc_R	smulcc 	%r13, %r20, %r9
	.word 0x87802058  ! 302: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x9f802a89  ! 303: SIR	sir	0x0a89
	.word 0xd28008a0  ! 304: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd2800b00  ! 305: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r9
splash_lsu_2_133:
	setx 0xd9ca29408887b149, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 306: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_2_134:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 307: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x91d020b4  ! 308: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_tba_2_135:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 309: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd27ff5df  ! 310: SWAP_I	swap	%r9, [%r31 + 0xfffff5df]
debug_2_136:
	nop
	setx debug_2_136 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 311: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_2_137:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 312: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd2d804a0  ! 313: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0xd2c004a0  ! 314: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916c7498  ! 315: SDIVX_I	sdivx	%r17, 0xfffff498, %r8
	.word 0x81982556  ! 316: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0556, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r18
DS_2_139:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd1300008  ! 1: STQF_R	-	%f8, [%r8, %r0]
	normalw
	.word 0x93458000  ! 318: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xe607c000  ! 319: LDUW_R	lduw	[%r31 + %r0], %r19
mondo_2_140:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d950007  ! 320: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936cfdcc  ! 321: SDIVX_I	sdivx	%r19, 0xfffffdcc, %r9
	.word 0xd537c008  ! 322: STQF_R	-	%f10, [%r8, %r31]
	.word 0xab82c00b  ! 323: WR_CLEAR_SOFTINT_R	wr	%r11, %r11, %clear_softint
	.word 0xd4800c60  ! 324: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r10
	.word 0xa9820002  ! 325: WR_SET_SOFTINT_R	wr	%r8, %r2, %set_softint
mondo_2_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d900014  ! 326: WRPR_WSTATE_R	wrpr	%r0, %r20, %wstate
	.word 0x81460000  ! 327: RD_STICK_REG	stbar
change_to_randtl_2_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_143:
	.word 0x8f902000  ! 328: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_2_144:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_144:
	.word 0x8f902000  ! 329: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902005  ! 330: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd4dfe030  ! 331: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
pmu_2_145:
	nop
	setx 0xfffff830fffff45c, %g1, %g7
	.word 0xa3800007  ! 332: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d802000  ! 333: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_2_146:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d944002  ! 334: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
intveclr_2_147:
	setx 0xb7a1e98d511f4592, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 335: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 336: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_2_148:
	setx 0xd7386aeb77bcccfc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02034  ! 338: Tcc_I	tne	icc_or_xcc, %r0 + 52
change_to_randtl_2_149:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_149:
	.word 0x8f902003  ! 339: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x2c800001  ! 340: BNEG	bneg,a	<label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6c6c74  ! 341: SDIVX_I	sdivx	%r17, 0x0c74, %r13
debug_2_151:
	nop
	setx debug_2_151 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 342: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_2_152:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 343: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd647e7a8  ! 344: LDSW_I	ldsw	[%r31 + 0x07a8], %r11
	.word 0xa745c000  ! 345: RD_TICK_CMPR_REG	rd	%-, %r19
splash_tba_2_153:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 346: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f8033f0  ! 347: SIR	sir	0x13f0
	.word 0x91d02032  ! 348: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d9023a9  ! 349: WRPR_PSTATE_I	wrpr	%r0, 0x03a9, %pstate
	.word 0x87802020  ! 350: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x81982756  ! 351: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0756, %hpstate
	.word 0x3a800001  ! 352: BCC	bcc,a	<label_0x1>
	.word 0xe88804a0  ! 353: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
splash_cmpr_2_154:
	setx 0xfa09cf9713691de6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 354: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_155:
	setx 0x5126fe800615d4d6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 355: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d91c00a  ! 356: WRPR_WSTATE_R	wrpr	%r7, %r10, %wstate
	.word 0x36700001  ! 357: BPGE	<illegal instruction>
mondo_2_157:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d94c009  ! 358: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
DS_2_158:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f20, %f18, %f12
	.word 0xa1b48302  ! 359: ALIGNADDRESS	alignaddr	%r18, %r2, %r16
	setx ivw_2_159, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_159:
	.word 0x93a00163  ! 360: FABSq	dis not found

	.word 0xd26ff7b0  ! 361: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffff7b0]
splash_tba_2_160:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 362: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x95a209d2  ! 363: FDIVd	fdivd	%f8, %f18, %f10
	.word 0xd28008a0  ! 364: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
debug_2_161:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 365: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_2_162:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_162:
	.word 0x8f902001  ! 366: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x92684009  ! 367: UDIVX_R	udivx 	%r1, %r9, %r9
	.word 0x81982c65  ! 368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c65, %hpstate
DS_2_163:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe33336b1  ! 1: STQF_I	-	%f17, [0x16b1, %r12]
	normalw
	.word 0x97458000  ! 369: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976cf600  ! 370: SDIVX_I	sdivx	%r19, 0xfffff600, %r11
	.word 0xd2d004a0  ! 371: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
debug_2_165:
	nop
	setx debug_2_165 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 372: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_2_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d92c00d  ! 373: WRPR_WSTATE_R	wrpr	%r11, %r13, %wstate
	.word 0x879021d7  ! 374: WRPR_TT_I	wrpr	%r0, 0x01d7, %tt
	.word 0x99902004  ! 375: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x28700001  ! 376: BPLEU	<illegal instruction>
	.word 0xa1902004  ! 377: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x87802020  ! 378: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x90813507  ! 379: ADDcc_I	addcc 	%r4, 0xfffff507, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 380: LDX_R	ldx	[%r31 + %r0], %r19
tagged_2_167:
	taddcctv %r10, 0x12fd, %r10
	.word 0xe607f8ba  ! 381: LDUW_I	lduw	[%r31 + 0xfffff8ba], %r19
	.word 0xe61fc000  ! 382: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x93902003  ! 383: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81982bcc  ! 384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcc, %hpstate
	.word 0x26700001  ! 385: BPL	<illegal instruction>
mondo_2_168:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d90000d  ! 386: WRPR_WSTATE_R	wrpr	%r0, %r13, %wstate
	.word 0x93902004  ! 387: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_cmpr_2_169:
	setx 0x7f656060a2d46fec, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 388: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d900000  ! 389: WRPR_WSTATE_R	wrpr	%r0, %r0, %wstate
mondo_2_171:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d934002  ! 390: WRPR_WSTATE_R	wrpr	%r13, %r2, %wstate
	.word 0xa1902009  ! 391: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	setx ivw_2_172, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_172:
	.word 0xa9a00171  ! 392: FABSq	dis not found

	setx 0xb5f67a49190dbc00, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_173:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_174:
	setx 0x8bbc9c0daf153db4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 394: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_175:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe5128000  ! 1: LDQF_R	-	[%r10, %r0], %f18
	.word 0xa7a40833  ! 395: FADDs	fadds	%f16, %f19, %f19
mondo_2_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d91c000  ! 396: WRPR_WSTATE_R	wrpr	%r7, %r0, %wstate
	.word 0x81982a2c  ! 397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a2c, %hpstate
	.word 0x8d802004  ! 398: WRFPRS_I	wr	%r0, 0x0004, %fprs
mondo_2_177:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d94c008  ! 399: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
splash_cmpr_2_178:
	setx 0x4ef5a7b75f2c070c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 400: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_2_179, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_179:
	.word 0xa5a00166  ! 401: FABSq	dis not found

splash_cmpr_2_180:
	setx 0x3b6dbac5d1e553e7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 402: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_181:
	nop
	setx debug_2_181 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 403: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa9520000  ! 404: RDPR_PIL	<illegal instruction>
DS_2_182:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f18, %f6, %f6
	.word 0x97b48311  ! 405: ALIGNADDRESS	alignaddr	%r18, %r17, %r11
mondo_2_183:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d91800d  ! 406: WRPR_WSTATE_R	wrpr	%r6, %r13, %wstate
mondo_2_184:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d92c007  ! 407: WRPR_WSTATE_R	wrpr	%r11, %r7, %wstate
	.word 0x81982cdc  ! 408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdc, %hpstate
	.word 0x83d02034  ! 409: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x93902001  ! 410: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8780201c  ! 411: WRASI_I	wr	%r0, 0x001c, %asi
mondo_2_185:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d90000a  ! 412: WRPR_WSTATE_R	wrpr	%r0, %r10, %wstate
splash_tba_2_186:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 413: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_2_187:
	setx 0x821c77b296507363, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 414: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_2_188:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 415: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9884000d  ! 416: ADDcc_R	addcc 	%r16, %r13, %r12
	.word 0x99902002  ! 417: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xe46ff8ba  ! 418: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffff8ba]
DS_2_189:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa3b1030a  ! 419: ALIGNADDRESS	alignaddr	%r4, %r10, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996c395c  ! 420: SDIVX_I	sdivx	%r16, 0xfffff95c, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01972  ! 421: FqTOd	dis not found

	.word 0x8d902e6d  ! 422: WRPR_PSTATE_I	wrpr	%r0, 0x0e6d, %pstate
	.word 0xa1a0c9d4  ! 423: FDIVd	fdivd	%f34, %f20, %f16
tagged_2_192:
	tsubcctv %r17, 0x1a4f, %r3
	.word 0xd007ec55  ! 424: LDUW_I	lduw	[%r31 + 0x0c55], %r8
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 425: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 426: LDX_R	ldx	[%r31 + %r0], %r8
debug_2_193:
	nop
	setx debug_2_193 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 427: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x83d02033  ! 428: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xd04fec55  ! 429: LDSB_I	ldsb	[%r31 + 0x0c55], %r8
	.word 0xd08fe020  ! 430: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x95520000  ! 432: RDPR_PIL	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6b7ee7  ! 433: SDIVX_I	sdivx	%r13, 0xfffffee7, %r13
mondo_2_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d950006  ! 434: WRPR_WSTATE_R	wrpr	%r20, %r6, %wstate
debug_2_196:
	nop
	setx debug_2_196 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 435: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_2_197:
	taddcctv %r8, 0x15dc, %r23
	.word 0xe007ef0e  ! 436: LDUW_I	lduw	[%r31 + 0x0f0e], %r16
	.word 0x91d020b5  ! 437: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xe0800b00  ! 438: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r16
	.word 0x91d02032  ! 439: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_cmpr_2_198:
	setx 0x4de0af0165271ac8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 440: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_2_199:
	setx 0x926c0e7b356167cf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 441: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe0800b40  ! 442: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r16
	.word 0x9f803ad0  ! 443: SIR	sir	0x1ad0
intveclr_2_200:
	setx 0x8830c6c24e4e2d28, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 444: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93d02033  ! 445: Tcc_I	tne	icc_or_xcc, %r0 + 51
mondo_2_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d934001  ! 446: WRPR_WSTATE_R	wrpr	%r13, %r1, %wstate
	.word 0x99902003  ! 447: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
mondo_2_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d908001  ! 448: WRPR_WSTATE_R	wrpr	%r2, %r1, %wstate
	.word 0xe137c00c  ! 449: STQF_R	-	%f16, [%r12, %r31]
	setx 0x85950ecb7a5fb68e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_203:
	.word 0x39400001  ! 450: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790231e  ! 451: WRPR_TT_I	wrpr	%r0, 0x031e, %tt
change_to_randtl_2_204:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_204:
	.word 0x8f902001  ! 452: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x9f8026a0  ! 453: SIR	sir	0x06a0
	.word 0xa3500000  ! 454: RDPR_TPC	<illegal instruction>
	.word 0x81982fdc  ! 455: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdc, %hpstate
debug_2_205:
	nop
	setx debug_2_205 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 456: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_2_206:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 457: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36aabfd  ! 458: SDIVX_I	sdivx	%r10, 0x0bfd, %r17
tagged_2_208:
	tsubcctv %r21, 0x18be, %r9
	.word 0xd007e283  ! 459: LDUW_I	lduw	[%r31 + 0x0283], %r8
	.word 0xd08008a0  ! 460: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
debug_2_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 461: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802004  ! 462: WRASI_I	wr	%r0, 0x0004, %asi
change_to_randtl_2_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_210:
	.word 0x8f902001  ! 463: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd09fe283  ! 464: LDDA_I	ldda	[%r31, + 0x0283] %asi, %r8
	.word 0xa0840010  ! 465: ADDcc_R	addcc 	%r16, %r16, %r16
	.word 0x9f803caf  ! 466: SIR	sir	0x1caf
	.word 0x879022fd  ! 467: WRPR_TT_I	wrpr	%r0, 0x02fd, %tt
debug_2_211:
	nop
	setx debug_2_211 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 468: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe4c004a0  ! 469: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r18
	.word 0xe4c7e000  ! 470: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
	.word 0xe48008a0  ! 471: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 472: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_2_212:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 473: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87902116  ! 474: WRPR_TT_I	wrpr	%r0, 0x0116, %tt
splash_tba_2_213:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 475: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_2_214:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 476: SAVE_R	save	%r31, %r0, %r31
	.word 0xe4880e80  ! 477: LDUBA_R	lduba	[%r0, %r0] 0x74, %r18
debug_2_215:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 478: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe4c80e60  ! 479: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r18
	.word 0x9ba409c2  ! 480: FDIVd	fdivd	%f16, %f2, %f44
	.word 0x93902001  ! 481: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
intveclr_2_216:
	setx 0x04c35940da4d7716, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_2_217:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe9324012  ! 1: STQF_R	-	%f20, [%r18, %r9]
	normalw
	.word 0xa7458000  ! 483: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0x87802004  ! 484: WRASI_I	wr	%r0, 0x0004, %asi
debug_2_218:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 485: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x26700001  ! 486: BPL	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01961  ! 487: FqTOd	dis not found

splash_cmpr_2_220:
	setx 0x0aa7cbee9b76f25e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 488: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 489: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 490: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe897e020  ! 491: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r20
	.word 0xe88804a0  ! 492: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
intveclr_2_221:
	setx 0x0180f39f8485e897, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 493: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe847e9df  ! 494: LDSW_I	ldsw	[%r31 + 0x09df], %r20
	.word 0xe827e9df  ! 495: STW_I	stw	%r20, [%r31 + 0x09df]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6a3909  ! 496: SDIVX_I	sdivx	%r8, 0xfffff909, %r13
	.word 0x9f8024e1  ! 497: SIR	sir	0x04e1
	.word 0x93454000  ! 498: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0xd0dfe030  ! 499: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r8
	.word 0x87802014  ! 500: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd127c003  ! 501: STF_R	st	%f8, [%r3, %r31]
	.word 0x81982a9f  ! 502: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9f, %hpstate
splash_tba_2_223:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 503: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x99902000  ! 504: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xd0d7e010  ! 505: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 506: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_2_224:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xbb4d6098	! Random illegal ?
	.word 0xd114400c  ! 1: LDQF_R	-	[%r17, %r12], %f8
	.word 0x93a10822  ! 507: FADDs	fadds	%f4, %f2, %f9
	.word 0x87902140  ! 508: WRPR_TT_I	wrpr	%r0, 0x0140, %tt
splash_lsu_2_225:
	setx 0xdb4b4b2fb7682679, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 509: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 510: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd25ff2d8  ! 511: LDX_I	ldx	[%r31 + 0xfffff2d8], %r9
	.word 0x81982237  ! 512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0237, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_226)) -> intp(0,0,10)
intvec_2_226:
	.word 0x39400001  ! 513: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 514: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902baa  ! 515: WRPR_PSTATE_I	wrpr	%r0, 0x0baa, %pstate
	.word 0xa1902006  ! 516: WRPR_GL_I	wrpr	%r0, 0x0006, %-
intveclr_2_227:
	setx 0xd5453636f30bb393, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 517: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_2_228:
	nop
	setx donretarg_2_228, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r1, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_228:
	.word 0xd2fff2d8  ! 518: SWAPA_I	swapa	%r9, [%r31 + 0xfffff2d8] %asi
	.word 0x81982a57  ! 519: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a57, %hpstate
	.word 0x81b01021  ! 520: SIAM	siam	1
	.word 0xd2c00e40  ! 521: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r9
	.word 0x38700001  ! 522: BPGU	<illegal instruction>
	.word 0x2e800001  ! 523: BVS	bvs,a	<label_0x1>
tagged_2_229:
	taddcctv %r21, 0x1f90, %r7
	.word 0xd207f2d8  ! 524: LDUW_I	lduw	[%r31 + 0xfffff2d8], %r9
intveclr_2_230:
	setx 0xecfc4be794f7a334, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_231:
	setx 0x00af6ed4352f9329, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 526: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902004  ! 527: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x98c4ea0d  ! 528: ADDCcc_I	addccc 	%r19, 0x0a0d, %r12
	.word 0x87802063  ! 529: WRASI_I	wr	%r0, 0x0063, %asi
splash_cmpr_2_232:
	setx 0x0ded11e891101f01, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 530: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_233:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d92c009  ! 531: WRPR_WSTATE_R	wrpr	%r11, %r9, %wstate
	.word 0x8790207e  ! 532: WRPR_TT_I	wrpr	%r0, 0x007e, %tt
	.word 0x91d02035  ! 533: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe48008a0  ! 534: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x9ba309c0  ! 535: FDIVd	fdivd	%f12, %f0, %f44
	.word 0xe8dfe020  ! 536: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r20
	.word 0xa5a249d0  ! 537: FDIVd	fdivd	%f40, %f16, %f18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956cf543  ! 538: SDIVX_I	sdivx	%r19, 0xfffff543, %r10
	.word 0x95540000  ! 539: RDPR_GL	rdpr	%-, %r10
	.word 0xd6dfe000  ! 540: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
splash_tba_2_235:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 541: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa7480000  ! 542: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 543: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_2_236:
	tsubcctv %r16, 0x1878, %r18
	.word 0xe607e600  ! 544: LDUW_I	lduw	[%r31 + 0x0600], %r19
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 545: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_2_237:
	setx 0xbb121d716c0591a6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 546: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_238:
	setx 0x10ef12edf704be0a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902283  ! 548: WRPR_TT_I	wrpr	%r0, 0x0283, %tt
	setx 0x386444a9a3626608, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_239:
	.word 0x39400001  ! 549: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_240:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d90400b  ! 550: WRPR_WSTATE_R	wrpr	%r1, %r11, %wstate
intveclr_2_241:
	setx 0x8ab6654ca23fea8f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 551: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902229  ! 552: WRPR_TT_I	wrpr	%r0, 0x0229, %tt
	.word 0xe6c7e000  ! 553: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r19
	.word 0x93902007  ! 554: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xe6800b60  ! 555: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r19
	.word 0xa7454000  ! 556: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
tagged_2_242:
	tsubcctv %r24, 0x1eeb, %r22
	.word 0xe807e600  ! 557: LDUW_I	lduw	[%r31 + 0x0600], %r20
debug_2_243:
	nop
	setx debug_2_243 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 558: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x22800001  ! 559: BE	be,a	<label_0x1>
intveclr_2_244:
	setx 0xb547c1757547d085, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 560: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_245:
	setx 0x399eb627da4c9d71, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 561: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d90289a  ! 562: WRPR_PSTATE_I	wrpr	%r0, 0x089a, %pstate
debug_2_246:
	nop
	setx debug_2_246 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 563: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x75088f5a77f2f3dc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_247:
	.word 0x39400001  ! 564: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_2_248:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 565: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_2_249:
	setx 0x004f471c53d319da, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 566: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902008  ! 567: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x87802014  ! 568: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x9553c000  ! 569: RDPR_FQ	<illegal instruction>
	.word 0xa5a00573  ! 570: FSQRTq	fsqrt	
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 571: LDX_R	ldx	[%r31 + %r0], %r9
debug_2_250:
	nop
	setx debug_2_250 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 572: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01960  ! 573: FqTOd	dis not found

	.word 0x99b44fe9  ! 574: FONES	e	%f12
splash_cmpr_2_252:
	setx 0xa64b076e59eeac27, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 575: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 576: LDX_R	ldx	[%r31 + %r0], %r11
	setx 0x8077e88dc2725d97, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_253:
	.word 0x39400001  ! 577: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6c7e030  ! 578: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
	.word 0x8d903bac  ! 579: WRPR_PSTATE_I	wrpr	%r0, 0x1bac, %pstate
	.word 0x91d02035  ! 580: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87802055  ! 581: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xd737c004  ! 582: STQF_R	-	%f11, [%r4, %r31]
	.word 0x966ac010  ! 583: UDIVX_R	udivx 	%r11, %r16, %r11
splash_cmpr_2_254:
	setx 0xb7ff1fa2e3dc9e1c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 584: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_255:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe711800c  ! 1: LDQF_R	-	[%r6, %r12], %f19
	.word 0x9ba44826  ! 585: FADDs	fadds	%f17, %f6, %f13
mondo_2_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d90c010  ! 586: WRPR_WSTATE_R	wrpr	%r3, %r16, %wstate
	.word 0xe53fc00a  ! 587: STDF_R	std	%f18, [%r10, %r31]
tagged_2_257:
	taddcctv %r21, 0x1f01, %r22
	.word 0xe407e600  ! 588: LDUW_I	lduw	[%r31 + 0x0600], %r18
pmu_2_258:
	nop
	setx 0xfffff42dfffff0e0, %g1, %g7
	.word 0xa3800007  ! 589: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xad8279db  ! 590: WR_SOFTINT_REG_I	wr	%r9, 0x19db, %softint
tagged_2_259:
	taddcctv %r5, 0x1273, %r13
	.word 0xe407e4ec  ! 591: LDUW_I	lduw	[%r31 + 0x04ec], %r18
	.word 0x93520000  ! 592: RDPR_PIL	<illegal instruction>
change_to_randtl_2_260:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_260:
	.word 0x8f902000  ! 593: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd827e4ec  ! 594: STW_I	stw	%r12, [%r31 + 0x04ec]
	.word 0x81460000  ! 595: RD_STICK_REG	stbar
mondo_2_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d904005  ! 596: WRPR_WSTATE_R	wrpr	%r1, %r5, %wstate
	.word 0x8d903ecc  ! 597: WRPR_PSTATE_I	wrpr	%r0, 0x1ecc, %pstate
	.word 0x87902313  ! 598: WRPR_TT_I	wrpr	%r0, 0x0313, %tt
	.word 0x8d902537  ! 599: WRPR_PSTATE_I	wrpr	%r0, 0x0537, %pstate
	.word 0x81982ec7  ! 600: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec7, %hpstate
	.word 0x93902003  ! 601: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81460000  ! 602: RD_STICK_REG	stbar
	.word 0x26800001  ! 603: BL	bl,a	<label_0x1>
debug_2_262:
	nop
	setx debug_2_262 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 604: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902000  ! 605: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_tba_2_263:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 606: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_2_264:
	nop
	setx debug_2_264 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 607: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x819828dc  ! 608: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08dc, %hpstate
change_to_randtl_2_265:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_265:
	.word 0x8f902003  ! 609: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x93902003  ! 610: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd8c7e010  ! 611: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
intveclr_2_266:
	setx 0x31d3559154109b12, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 612: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902000  ! 613: WRPR_GL_I	wrpr	%r0, 0x0000, %-
debug_2_267:
	nop
	setx debug_2_267 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 614: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd8cfe030  ! 615: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r12
debug_2_268:
	nop
	setx debug_2_268 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 616: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_2_269:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d950014  ! 617: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 618: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_2_270:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 619: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x28700001  ! 620: BPLEU	<illegal instruction>
	.word 0x93902003  ! 621: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
mondo_2_271:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d950008  ! 622: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
splash_lsu_2_272:
	setx 0x3bf76ee9aec98549, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 623: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d92c014  ! 624: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
	.word 0xd88804a0  ! 625: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
splash_cmpr_2_274:
	setx 0xa623b4846f2c20cd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 626: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 627: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_2_275:
	setx 0x15b912c7b2a0dbad, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 628: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 629: BL	bl,a	<label_0x1>
mondo_2_276:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d950005  ! 630: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	setx ivw_2_277, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_277:
	.word 0x91a0016c  ! 631: FABSq	dis not found

	.word 0xd4c00e40  ! 632: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r10
splash_cmpr_2_278:
	setx 0x0f0ed357187d3c58, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 633: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x95a01a60  ! 635: FqTOi	fqtoi	
	.word 0xd647e4ec  ! 636: LDSW_I	ldsw	[%r31 + 0x04ec], %r11
debug_2_279:
	nop
	setx debug_2_279 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 637: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b696f66  ! 638: SDIVX_I	sdivx	%r5, 0x0f66, %r13
splash_tba_2_281:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 639: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_2_282:
	setx 0x679988c3b09f08f2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 640: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_283:
	nop
	setx debug_2_283 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 641: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_284)) -> intp(2,0,1)
intvec_2_284:
	.word 0x39400001  ! 642: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 643: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976d32ba  ! 644: SDIVX_I	sdivx	%r20, 0xfffff2ba, %r11
	.word 0xd2d00e40  ! 645: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01966  ! 646: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9168f85d  ! 647: SDIVX_I	sdivx	%r3, 0xfffff85d, %r8
pmu_2_288:
	nop
	setx 0xfffff9f7fffff681, %g1, %g7
	.word 0xa3800007  ! 648: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 649: LDX_R	ldx	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 650: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe01ff035  ! 651: LDD_I	ldd	[%r31 + 0xfffff035], %r16
mondo_2_289:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d924012  ! 652: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
splash_lsu_2_290:
	setx 0xcf657225f07856e5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 653: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_2_291:
	nop
	setx debug_2_291 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 654: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902006  ! 655: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81982b17  ! 656: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b17, %hpstate
tagged_2_292:
	tsubcctv %r3, 0x108c, %r10
	.word 0xe007f035  ! 657: LDUW_I	lduw	[%r31 + 0xfffff035], %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01964  ! 658: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936b77df  ! 659: SDIVX_I	sdivx	%r13, 0xfffff7df, %r9
	.word 0x81510000  ! 660: RDPR_TICK	rdpr	%tick, %r0
	setx 0x2d2db2fd940fd415, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_295:
	.word 0x39400001  ! 661: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_2_296:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 662: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_2_297:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb31c001  ! 1: STQF_R	-	%f13, [%r1, %r7]
	normalw
	.word 0x99458000  ! 663: RD_SOFTINT_REG	rd	%softint, %r12
pmu_2_298:
	nop
	setx 0xfffff63cfffffac6, %g1, %g7
	.word 0xa3800007  ! 664: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_2_299:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_299:
	.word 0x8f902000  ! 665: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_2_300:
	nop
	setx debug_2_300 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 666: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902002  ! 667: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd68008a0  ! 668: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_tba_2_301:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 669: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_302)) -> intp(3,0,23)
intvec_2_302:
	.word 0x39400001  ! 670: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_2_303:
	set 0x003a0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 671: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_2_304:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d934012  ! 672: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
	.word 0xd68804a0  ! 673: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0xd68008a0  ! 674: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	setx 0x3683c17dba8d24cf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_305:
	.word 0x39400001  ! 675: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 676: WRASI_I	wr	%r0, 0x0020, %asi
	setx ivw_2_306, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_306:
	.word 0x95a0016a  ! 677: FABSq	dis not found

	.word 0x9145c000  ! 678: RD_TICK_CMPR_REG	rd	%-, %r8
splash_lsu_2_307:
	setx 0xcfadc6e69b50f3c7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 679: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_2_308:
	tsubcctv %r17, 0x16ca, %r24
	.word 0xe807eed1  ! 680: LDUW_I	lduw	[%r31 + 0x0ed1], %r20
splash_cmpr_2_309:
	setx 0x459288235e43a35f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 681: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879022de  ! 682: WRPR_TT_I	wrpr	%r0, 0x02de, %tt
tagged_2_310:
	tsubcctv %r3, 0x1c6d, %r24
	.word 0xe807eed1  ! 683: LDUW_I	lduw	[%r31 + 0x0ed1], %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa968b940  ! 684: SDIVX_I	sdivx	%r2, 0xfffff940, %r20
change_to_randtl_2_312:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_312:
	.word 0x8f902000  ! 685: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_2_313:
	nop
	setx debug_2_313 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 686: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_2_314:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_314:
	.word 0x8f902002  ! 687: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_2_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d92400d  ! 688: WRPR_WSTATE_R	wrpr	%r9, %r13, %wstate
	.word 0x93902000  ! 689: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
debug_2_316:
	nop
	setx debug_2_316 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 690: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0xf2dde86e85949809, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_317:
	.word 0x39400001  ! 691: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6800c20  ! 692: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 693: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xad81f5bb  ! 694: WR_SOFTINT_REG_I	wr	%r7, 0x15bb, %softint
	.word 0x87802080  ! 695: WRASI_I	wr	%r0, 0x0080, %asi
change_to_randtl_2_318:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_318:
	.word 0x8f902002  ! 696: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01968  ! 697: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93693ba8  ! 698: SDIVX_I	sdivx	%r4, 0xfffffba8, %r9
debug_2_321:
	nop
	setx debug_2_321 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 699: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_2_322:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 700: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_2_323:
	taddcctv %r12, 0x1f6b, %r22
	.word 0xe407f52a  ! 701: LDUW_I	lduw	[%r31 + 0xfffff52a], %r18
mondo_2_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d93400d  ! 702: WRPR_WSTATE_R	wrpr	%r13, %r13, %wstate
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 703: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902d08  ! 704: WRPR_PSTATE_I	wrpr	%r0, 0x0d08, %pstate
	.word 0x99a01a69  ! 705: FqTOi	fqtoi	
	.word 0x81982006  ! 706: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0006, %hpstate
	setx ivw_2_325, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_325:
	.word 0x99a00173  ! 707: FABSq	dis not found

	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 708: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 709: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982d0f  ! 710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0f, %hpstate
	.word 0xd237f52a  ! 711: STH_I	sth	%r9, [%r31 + 0xfffff52a]
	.word 0x9f802164  ! 712: SIR	sir	0x0164
	.word 0xd317c000  ! 713: LDQF_R	-	[%r31, %r0], %f9
splash_cmpr_2_326:
	setx 0x64a60aad9e68b50d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 714: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 715: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_2_327:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 716: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_2_328:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d91c013  ! 717: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
	.word 0xd337e0ec  ! 718: STQF_I	-	%f9, [0x00ec, %r31]
	.word 0xa7454000  ! 719: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	.word 0x99902000  ! 720: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xd48008a0  ! 721: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_cmpr_2_329:
	setx 0x173a02e5885f4cb3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 722: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_330:
	setx 0xabd1fa3d690d7e80, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 723: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_2_331, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_331:
	.word 0xa7a0016d  ! 724: FABSq	dis not found

splash_tba_2_332:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 725: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790219b  ! 726: WRPR_TT_I	wrpr	%r0, 0x019b, %tt
	.word 0x91d020b5  ! 727: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xe20fe0ec  ! 728: LDUB_I	ldub	[%r31 + 0x00ec], %r17
	.word 0x81510000  ! 729: RDPR_TICK	rdpr	%tick, %r0
	setx ivw_2_333, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_333:
	.word 0x93a0016b  ! 730: FABSq	dis not found

	.word 0x91d02033  ! 731: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_2_334:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d914014  ! 732: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
	.word 0x93902003  ! 733: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87802004  ! 734: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802020  ! 735: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe917c000  ! 736: LDQF_R	-	[%r31, %r0], %f20
	setx ivw_2_335, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_335:
	.word 0xa7a0016c  ! 737: FABSq	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_336)) -> intp(4,0,16)
intvec_2_336:
	.word 0x39400001  ! 738: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_337:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa5a00551  ! 1: FSQRTd	fsqrt	
	.word 0x95a24834  ! 739: FADDs	fadds	%f9, %f20, %f10
change_to_randtl_2_338:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_338:
	.word 0x8f902002  ! 740: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_2_339:
	setx 0xe21187e5abf5415b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 741: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe6800bc0  ! 742: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r19
debug_2_340:
	nop
	setx debug_2_340 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 743: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916cf1dd  ! 744: SDIVX_I	sdivx	%r19, 0xfffff1dd, %r8
splash_htba_2_342:
	set 0x003a0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 745: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd01ffb39  ! 746: LDD_I	ldd	[%r31 + 0xfffffb39], %r8
	.word 0x2a800001  ! 747: BCS	bcs,a	<label_0x1>
	.word 0x93902002  ! 748: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_lsu_2_343:
	setx 0x3cdd26cd67bb6595, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 749: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x97a209ca  ! 750: FDIVd	fdivd	%f8, %f10, %f42
	.word 0xad812358  ! 751: WR_SOFTINT_REG_I	wr	%r4, 0x0358, %softint
debug_2_344:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 752: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x95454000  ! 753: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	.word 0x87902360  ! 754: WRPR_TT_I	wrpr	%r0, 0x0360, %tt
	.word 0xe28804a0  ! 755: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 756: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_2_345:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 757: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x8d90264f  ! 758: WRPR_PSTATE_I	wrpr	%r0, 0x064f, %pstate
	.word 0x87902106  ! 759: WRPR_TT_I	wrpr	%r0, 0x0106, %tt
DS_2_346:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f20, %f30, %f6
	.word 0x9bb48313  ! 760: ALIGNADDRESS	alignaddr	%r18, %r19, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01969  ! 761: FqTOd	dis not found

	.word 0xda4fc000  ! 762: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01973  ! 763: FqTOd	dis not found

	.word 0xa190200b  ! 764: WRPR_GL_I	wrpr	%r0, 0x000b, %-
mondo_2_349:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d948003  ! 765: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
	.word 0xd327ed48  ! 766: STF_I	st	%f9, [0x0d48, %r31]
	.word 0xd2c80e60  ! 767: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 768: LDX_R	ldx	[%r31 + %r0], %r9
DS_2_350:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 769: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd257ed48  ! 770: LDSH_I	ldsh	[%r31 + 0x0d48], %r9
	.word 0xd28fe030  ! 771: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r9
DS_2_351:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x99b28302  ! 772: ALIGNADDRESS	alignaddr	%r10, %r2, %r12
	.word 0xab834013  ! 773: WR_CLEAR_SOFTINT_R	wr	%r13, %r19, %clear_softint
	.word 0xe457c000  ! 774: LDSH_R	ldsh	[%r31 + %r0], %r18
intveclr_2_352:
	setx 0x5585684bec39bb45, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 775: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_353:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d904000  ! 776: WRPR_WSTATE_R	wrpr	%r1, %r0, %wstate
mondo_2_354:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d90c00c  ! 777: WRPR_WSTATE_R	wrpr	%r3, %r12, %wstate
	.word 0xe41fc000  ! 778: LDD_R	ldd	[%r31 + %r0], %r18
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 779: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196c  ! 780: FqTOd	dis not found

	.word 0xd037ed48  ! 781: STH_I	sth	%r8, [%r31 + 0x0d48]
splash_lsu_2_356:
	setx 0x8648a01e15a6155b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 782: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_2_357:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 783: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xd11fed48  ! 784: LDDF_I	ldd	[%r31, 0x0d48], %f8
debug_2_358:
	nop
	setx debug_2_358 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 785: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_2_359:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd1148002  ! 1: LDQF_R	-	[%r18, %r2], %f8
	.word 0xa5a4c830  ! 786: FADDs	fadds	%f19, %f16, %f18
splash_cmpr_2_360:
	setx 0xab645f3563391133, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 787: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 788: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 789: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01967  ! 790: FqTOd	dis not found

	.word 0x8d902401  ! 791: WRPR_PSTATE_I	wrpr	%r0, 0x0401, %pstate
	.word 0xe6800c20  ! 792: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r19
splash_cmpr_2_362:
	setx 0xa305664589ba8329, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 793: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x3b32f1b4cb76fefc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_363:
	.word 0x39400001  ! 794: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 795: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x20700001  ! 796: BPN	<illegal instruction>
	.word 0xe67fed48  ! 797: SWAP_I	swap	%r19, [%r31 + 0x0d48]
	.word 0x8d902e20  ! 798: WRPR_PSTATE_I	wrpr	%r0, 0x0e20, %pstate
change_to_randtl_2_364:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_364:
	.word 0x8f902002  ! 799: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 800: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe677c007  ! 801: STX_R	stx	%r19, [%r31 + %r7]
	.word 0xe6c7e010  ! 802: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r19
splash_htba_2_365:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 803: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_2_366:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d944007  ! 804: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
	setx ivw_2_367, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_367:
	.word 0x9ba00161  ! 805: FABSq	dis not found

	.word 0x879021d2  ! 806: WRPR_TT_I	wrpr	%r0, 0x01d2, %tt
	.word 0x93d02033  ! 807: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x9350c000  ! 808: RDPR_TT	<illegal instruction>
	.word 0x8d90372c  ! 809: WRPR_PSTATE_I	wrpr	%r0, 0x172c, %pstate
	.word 0x87902048  ! 810: WRPR_TT_I	wrpr	%r0, 0x0048, %tt
	.word 0xe4800b60  ! 811: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r18
	.word 0xe537ed48  ! 812: STQF_I	-	%f18, [0x0d48, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 813: LDX_R	ldx	[%r31 + %r0], %r18
mondo_2_368:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d90c012  ! 814: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
	setx 0xde1f3b9e530ddb54, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_369:
	.word 0x39400001  ! 815: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_370:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d900009  ! 816: WRPR_WSTATE_R	wrpr	%r0, %r9, %wstate
tagged_2_371:
	taddcctv %r6, 0x1852, %r22
	.word 0xe407ed48  ! 817: LDUW_I	lduw	[%r31 + 0x0d48], %r18
splash_cmpr_2_372:
	setx 0x139aff3fefae9b71, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 818: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_373:
	nop
	setx debug_2_373 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 819: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 820: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe48804a0  ! 821: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
mondo_2_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d908001  ! 822: WRPR_WSTATE_R	wrpr	%r2, %r1, %wstate
	.word 0x95a18dd4  ! 823: FdMULq	fdmulq	
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 824: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90338c  ! 825: WRPR_PSTATE_I	wrpr	%r0, 0x138c, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 826: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4dfe000  ! 827: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	.word 0xab84c012  ! 828: WR_CLEAR_SOFTINT_R	wr	%r19, %r18, %clear_softint
	.word 0xd46fed48  ! 829: LDSTUB_I	ldstub	%r10, [%r31 + 0x0d48]
	setx 0xbbe4ab1b4dc3a3b9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_375:
	.word 0x39400001  ! 830: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_2_376:
	nop
	setx debug_2_376 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 831: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8790238d  ! 832: WRPR_TT_I	wrpr	%r0, 0x038d, %tt
	setx ivw_2_377, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_377:
	.word 0xa3a0016a  ! 833: FABSq	dis not found

	.word 0x99540000  ! 834: RDPR_GL	<illegal instruction>
	.word 0xd73fed48  ! 835: STDF_I	std	%f11, [0x0d48, %r31]
	.word 0xa1902009  ! 836: WRPR_GL_I	wrpr	%r0, 0x0009, %-
DS_2_378:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0x876fe635	! Random illegal ?
	.word 0x95a00546  ! 1: FSQRTd	fsqrt	
	.word 0x95a04821  ! 837: FADDs	fadds	%f1, %f1, %f10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 838: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd69004a0  ! 839: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0x93902002  ! 840: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
debug_2_379:
	nop
	setx debug_2_379 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 841: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_2_380:
	setx 0xbc0f0dbc54cbff3c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 842: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_2_381:
	setx 0x2d146728b1bb28cd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 843: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 844: RDPR_TICK	rdpr	%tick, %r0
	setx ivw_2_382, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_382:
	.word 0x95a0016c  ! 845: FABSq	dis not found

	.word 0xd8900e80  ! 846: LDUHA_R	lduha	[%r0, %r0] 0x74, %r12
	.word 0xd91fc000  ! 847: LDDF_R	ldd	[%r31, %r0], %f12
change_to_randtl_2_383:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_383:
	.word 0x8f902000  ! 848: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd8800b00  ! 849: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r12
splash_tba_2_384:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 850: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_2_385:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd712c000  ! 1: LDQF_R	-	[%r11, %r0], %f11
	.word 0x95a1882a  ! 851: FADDs	fadds	%f6, %f10, %f10
debug_2_386:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 852: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b683a28  ! 853: SDIVX_I	sdivx	%r0, 0xfffffa28, %r13
	.word 0xe647f42d  ! 854: LDSW_I	ldsw	[%r31 + 0xfffff42d], %r19
	.word 0xe717c000  ! 855: LDQF_R	-	[%r31, %r0], %f19
	.word 0x87802063  ! 856: WRASI_I	wr	%r0, 0x0063, %asi
intveclr_2_388:
	setx 0xeb83cfb31d5710f8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 857: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_2_389:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe3308002  ! 1: STQF_R	-	%f17, [%r2, %r2]
	normalw
	.word 0xa9458000  ! 858: RD_SOFTINT_REG	rd	%softint, %r20
debug_2_390:
	nop
	setx debug_2_390 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 859: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d9031be  ! 860: WRPR_PSTATE_I	wrpr	%r0, 0x11be, %pstate
	.word 0xad81a203  ! 861: WR_SOFTINT_REG_I	wr	%r6, 0x0203, %softint
splash_cmpr_2_391:
	setx 0x6997691fc8f59694, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 862: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_392:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0x8d501156	! Random illegal ?
	.word 0xd5140001  ! 1: LDQF_R	-	[%r16, %r1], %f10
	.word 0x95a04831  ! 863: FADDs	fadds	%f1, %f17, %f10
	.word 0xd88804a0  ! 864: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
splash_cmpr_2_393:
	setx 0x5aa88ab3f7d98d53, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 865: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_394:
	nop
	setx debug_2_394 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 866: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd8d00e60  ! 867: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r12
	.word 0x93480000  ! 868: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	setx 0x557d2ffbb0be9a2f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_395:
	.word 0x39400001  ! 869: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9add000b  ! 870: SMULcc_R	smulcc 	%r20, %r11, %r13
	.word 0xa190200c  ! 871: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_lsu_2_396:
	setx 0x692f8055606e9adb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 872: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_2_397:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_397:
	.word 0x8f902003  ! 873: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xe63ff1d4  ! 874: STD_I	std	%r19, [%r31 + 0xfffff1d4]
splash_cmpr_2_398:
	setx 0x32452295c57ed4ff, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 875: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_399:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe1310012  ! 1: STQF_R	-	%f16, [%r18, %r4]
	normalw
	.word 0x95458000  ! 876: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x93902002  ! 877: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902008  ! 878: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 879: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902257  ! 880: WRPR_TT_I	wrpr	%r0, 0x0257, %tt
splash_cmpr_2_400:
	setx 0xd1052ffd1eb7a4d7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 881: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02032  ! 882: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x22700001  ! 883: BPE	<illegal instruction>
	.word 0xe317c000  ! 884: LDQF_R	-	[%r31, %r0], %f17
	.word 0x8d902d5f  ! 885: WRPR_PSTATE_I	wrpr	%r0, 0x0d5f, %pstate
splash_cmpr_2_401:
	setx 0x4056b517adbfd9d0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 886: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe2d004a0  ! 887: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
splash_lsu_2_402:
	setx 0x2c9da2b67c50ada5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 888: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_2_403:
	setx 0x5a1e05fabea106f9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 889: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 890: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x99a2c9ca  ! 891: FDIVd	fdivd	%f42, %f10, %f12
DS_2_404:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd3328010  ! 1: STQF_R	-	%f9, [%r16, %r10]
	normalw
	.word 0x97458000  ! 892: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x8d903a98  ! 893: WRPR_PSTATE_I	wrpr	%r0, 0x1a98, %pstate
	.word 0x8d90283a  ! 894: WRPR_PSTATE_I	wrpr	%r0, 0x083a, %pstate
	.word 0x8d903313  ! 895: WRPR_PSTATE_I	wrpr	%r0, 0x1313, %pstate
splash_cmpr_2_405:
	setx 0xb957a0cbcfd9870c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 896: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2a800001  ! 897: BCS	bcs,a	<label_0x1>
splash_cmpr_2_406:
	setx 0x91a2e53abded3276, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 898: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_407:
	setx 0xa11363ad3b7001c1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 899: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_408)) -> intp(1,0,26)
intvec_2_408:
	.word 0x39400001  ! 900: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_409:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d90c00c  ! 901: WRPR_WSTATE_R	wrpr	%r3, %r12, %wstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 902: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 903: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a0196c  ! 904: FqTOd	dis not found

pmu_2_411:
	nop
	setx 0xfffffd99fffffbf8, %g1, %g7
	.word 0xa3800007  ! 905: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_2_412:
	setx 0xc6be9472d2824944, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 906: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9145c000  ! 907: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0xd86ff1d4  ! 908: LDSTUB_I	ldstub	%r12, [%r31 + 0xfffff1d4]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 909: LDX_R	ldx	[%r31 + %r0], %r12
tagged_2_413:
	taddcctv %r4, 0x170f, %r7
	.word 0xd807f1d4  ! 910: LDUW_I	lduw	[%r31 + 0xfffff1d4], %r12
DS_2_414:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd731f54c  ! 1: STQF_I	-	%f11, [0x154c, %r7]
	normalw
	.word 0x99458000  ! 911: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8d802004  ! 912: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93d020b3  ! 913: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0x8790234b  ! 914: WRPR_TT_I	wrpr	%r0, 0x034b, %tt
	.word 0x93d02033  ! 915: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_cmpr_2_415:
	setx 0x376a19d0958e7a5f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 916: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_416:
	setx 0x6616bdc301b86016, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 917: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_417:
	nop
	setx debug_2_417 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 918: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx ivw_2_418, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_418:
	.word 0x9ba0016d  ! 919: FABSq	dis not found

	.word 0x93902005  ! 920: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_2_419:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 921: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd397ea29  ! 922: LDQFA_I	-	[%r31, 0x0a29], %f9
	.word 0x879023ef  ! 923: WRPR_TT_I	wrpr	%r0, 0x03ef, %tt
	.word 0xd33fc012  ! 924: STDF_R	std	%f9, [%r18, %r31]
	.word 0xa190200c  ! 925: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa1902004  ! 926: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd25fea29  ! 927: LDX_I	ldx	[%r31 + 0x0a29], %r9
	setx ivw_2_420, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_420:
	.word 0x93a00174  ! 928: FABSq	dis not found

	.word 0xdac7e010  ! 929: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01974  ! 930: FqTOd	dis not found

intveclr_2_422:
	setx 0xe182a11537ed2be2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 931: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_423:
	nop
	setx debug_2_423 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 932: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x819824a7  ! 933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04a7, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 934: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_2_424:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d950005  ! 935: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	.word 0xd21fc000  ! 936: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196d  ! 937: FqTOd	dis not found

mondo_2_426:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d93400a  ! 938: WRPR_WSTATE_R	wrpr	%r13, %r10, %wstate
	.word 0x87802058  ! 939: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x93902004  ! 940: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd43fc00d  ! 941: STD_R	std	%r10, [%r31 + %r13]
	.word 0xd48fe020  ! 942: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	.word 0x94dc4013  ! 943: SMULcc_R	smulcc 	%r17, %r19, %r10
	.word 0xd00fc000  ! 944: LDUB_R	ldub	[%r31 + %r0], %r8
	.word 0x93902005  ! 945: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
donret_2_427:
	nop
	setx donretarg_2_427, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r22, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_427:
	.word 0xd0ffea29  ! 946: SWAPA_I	swapa	%r8, [%r31 + 0x0a29] %asi
DS_2_428:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 947: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd09fc020  ! 948: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
splash_lsu_2_429:
	setx 0x8513c6f9ce97e4e3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 949: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 950: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xd0d7e030  ! 951: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
splash_lsu_2_430:
	setx 0xd7aafc0751871e77, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 952: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 953: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0196c  ! 954: FqTOd	dis not found

	.word 0x93902002  ! 955: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902000  ! 956: WRPR_GL_I	wrpr	%r0, 0x0000, %-
debug_2_432:
	nop
	setx debug_2_432 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 957: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_2_433:
	setx 0xcc477d3446449cd3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 958: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_2_434:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe9304006  ! 1: STQF_R	-	%f20, [%r6, %r1]
	normalw
	.word 0x91458000  ! 959: RD_SOFTINT_REG	rd	%softint, %r8
splash_htba_2_435:
	set 0x003a0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 960: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x9f802dd5  ! 961: SIR	sir	0x0dd5
	.word 0xd6800b40  ! 962: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r11
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 963: Tcc_R	te	icc_or_xcc, %r0 + %r30
change_to_randtl_2_436:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_436:
	.word 0x8f902001  ! 964: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x99902003  ! 965: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
splash_cmpr_2_437:
	setx 0x52a7c404d4e50f1a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 966: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790216d  ! 967: WRPR_TT_I	wrpr	%r0, 0x016d, %tt
splash_lsu_2_438:
	setx 0x4577a4dea86e6215, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_439:
	setx 0x1531460b2dc0f2b1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 969: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902f45  ! 970: WRPR_PSTATE_I	wrpr	%r0, 0x0f45, %pstate
	.word 0xd61fc000  ! 971: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd657c000  ! 972: LDSH_R	ldsh	[%r31 + %r0], %r11
change_to_randtl_2_440:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_440:
	.word 0x8f902001  ! 973: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d902d89  ! 974: WRPR_PSTATE_I	wrpr	%r0, 0x0d89, %pstate
splash_cmpr_2_441:
	setx 0xb9040beefa09bda9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 975: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902237  ! 976: WRPR_TT_I	wrpr	%r0, 0x0237, %tt
	.word 0xa5480000  ! 977: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
debug_2_442:
	nop
	setx debug_2_442 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 978: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_2_443:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 979: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d903fab  ! 980: WRPR_PSTATE_I	wrpr	%r0, 0x1fab, %pstate
tagged_2_444:
	tsubcctv %r26, 0x1e00, %r4
	.word 0xe407ec60  ! 981: LDUW_I	lduw	[%r31 + 0x0c60], %r18
	.word 0x87802055  ! 982: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x93902003  ! 983: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe41fc000  ! 984: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x81510000  ! 985: RDPR_TICK	rdpr	%tick, %r0
	.word 0x83d02035  ! 986: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xe4800b00  ! 987: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r18
splash_tba_2_445:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 988: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_2_446:
	setx 0x97225bbeb26485bf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 989: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_447:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d92c007  ! 990: WRPR_WSTATE_R	wrpr	%r11, %r7, %wstate
change_to_randtl_2_448:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_448:
	.word 0x8f902000  ! 991: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902004  ! 992: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91480000  ! 993: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x8d802000  ! 994: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa9828012  ! 995: WR_SET_SOFTINT_R	wr	%r10, %r18, %set_softint
debug_2_449:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 996: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_2_450:
	setx 0x2757c8d3679f0ff6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 997: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd28fe030  ! 998: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r9
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
mondo_1_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d928013  ! 1: WRPR_WSTATE_R	wrpr	%r10, %r19, %wstate
	.word 0x8d903824  ! 2: WRPR_PSTATE_I	wrpr	%r0, 0x1824, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 3: LDX_R	ldx	[%r31 + %r0], %r13
	setx 0x54f9d66ef240a149, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_1:
	.word 0x39400001  ! 4: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56a398a  ! 5: SDIVX_I	sdivx	%r8, 0xfffff98a, %r18
	.word 0xab84c013  ! 6: WR_CLEAR_SOFTINT_R	wr	%r19, %r19, %clear_softint
splash_cmpr_1_3:
	setx 0x21305a89b0908690, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802063  ! 8: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x8d902cb2  ! 9: WRPR_PSTATE_I	wrpr	%r0, 0x0cb2, %pstate
	.word 0xd637e0e3  ! 10: STH_I	sth	%r11, [%r31 + 0x00e3]
	.word 0xd68008a0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_1_4:
	setx 0xf769bdcc2bfb19ac, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 12: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_1_5:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 13: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_1_6:
	setx 0xf165dfaa84c6adb9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 14: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 15: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_1_7:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f2, %f12, %f30
	.word 0x95b10304  ! 16: ALIGNADDRESS	alignaddr	%r4, %r4, %r10
	.word 0x81982886  ! 17: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0886, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a0196d  ! 18: FqTOd	dis not found

	.word 0xd797e0e3  ! 19: LDQFA_I	-	[%r31, 0x00e3], %f11
	.word 0x96d50013  ! 20: UMULcc_R	umulcc 	%r20, %r19, %r11
tagged_1_9:
	taddcctv %r7, 0x14c5, %r8
	.word 0xe807e0e3  ! 21: LDUW_I	lduw	[%r31 + 0x00e3], %r20
	.word 0x93d02033  ! 22: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xe89fc020  ! 23: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	setx ivw_1_10, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_10:
	.word 0x95a00160  ! 24: FABSq	dis not found

	.word 0xe49fc020  ! 25: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
	.word 0x8198222e  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x022e, %hpstate
	.word 0x9350c000  ! 27: RDPR_TT	<illegal instruction>
	setx ivw_1_11, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_11:
	.word 0x91a00161  ! 28: FABSq	dis not found

	.word 0x8790224e  ! 29: WRPR_TT_I	wrpr	%r0, 0x024e, %tt
mondo_1_12:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d914008  ! 30: WRPR_WSTATE_R	wrpr	%r5, %r8, %wstate
	.word 0x99a309ca  ! 31: FDIVd	fdivd	%f12, %f10, %f12
	.word 0x9f803e97  ! 32: SIR	sir	0x1e97
	.word 0xe41fc000  ! 33: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x36700001  ! 34: BPGE	<illegal instruction>
donret_1_13:
	nop
	setx donretarg_1_13, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r22, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_13:
	.word 0xe4fffe6a  ! 35: SWAPA_I	swapa	%r18, [%r31 + 0xfffffe6a] %asi
DS_1_14:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xc569b915	! Random illegal ?
	.word 0xd912c002  ! 1: LDQF_R	-	[%r11, %r2], %f12
	.word 0xa9a14821  ! 36: FADDs	fadds	%f5, %f1, %f20
	.word 0x98c37fff  ! 37: ADDCcc_I	addccc 	%r13, 0xffffffff, %r12
	.word 0xe517c000  ! 38: LDQF_R	-	[%r31, %r0], %f18
splash_cmpr_1_15:
	setx 0x738d55ff1baf40c9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 39: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_1_16, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_16:
	.word 0x9ba00169  ! 40: FABSq	dis not found

	.word 0xd49fc020  ! 41: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
splash_cmpr_1_17:
	setx 0x198e78f9837f4e57, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 42: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f80244d  ! 43: SIR	sir	0x044d
	.word 0x90dd000b  ! 44: SMULcc_R	smulcc 	%r20, %r11, %r8
splash_lsu_1_18:
	setx 0xd497c5a16a275edb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 45: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 46: RD_STICK_REG	stbar
	.word 0x93902004  ! 47: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x3a700001  ! 48: BPCC	<illegal instruction>
	.word 0xd48008a0  ! 49: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01974  ! 50: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01962  ! 51: FqTOd	dis not found

	setx 0x7a8a1d3c28488382, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_21:
	.word 0x39400001  ! 52: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe207c000  ! 53: LDUW_R	lduw	[%r31 + %r0], %r17
	.word 0xe337fa5d  ! 54: STQF_I	-	%f17, [0x1a5d, %r31]
splash_cmpr_1_22:
	setx 0xc30dc7a9215e6754, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_23:
	setx 0x3b49ce0821577bb4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 56: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe21ffa5d  ! 57: LDD_I	ldd	[%r31 + 0xfffffa5d], %r17
splash_cmpr_1_24:
	setx 0xb1782a35f5d97e19, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_1_25:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 59: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe2c00e80  ! 60: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r17
	.word 0x93902005  ! 61: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_cmpr_1_26:
	setx 0xdae34f473df0b0f6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_27:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd9144002  ! 1: LDQF_R	-	[%r17, %r2], %f12
	.word 0x99a50820  ! 63: FADDs	fadds	%f20, %f0, %f12
	.word 0x91500000  ! 64: RDPR_TPC	<illegal instruction>
	.word 0xe69004a0  ! 65: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
donret_1_28:
	nop
	setx donretarg_1_28, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r12, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_28:
	.word 0xe6fffa5d  ! 66: SWAPA_I	swapa	%r19, [%r31 + 0xfffffa5d] %asi
debug_1_29:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 67: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_1_30:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 68: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
change_to_randtl_1_31:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_31:
	.word 0x8f902002  ! 69: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
!$EV trig_pc_d(1, @VA(.MAIN.xir_1_32)) -> intp(1,1,3)
xir_1_32:
	.word 0xa98261c7  ! 70: WR_SET_SOFTINT_I	wr	%r9, 0x01c7, %set_softint
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 71: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902005  ! 72: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
mondo_1_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d940008  ! 73: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
	.word 0x93450000  ! 74: RD_SET_SOFTINT	rd	%set_softint, %r9
	.word 0x96806f18  ! 75: ADDcc_I	addcc 	%r1, 0x0f18, %r11
mondo_1_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d928002  ! 76: WRPR_WSTATE_R	wrpr	%r10, %r2, %wstate
	.word 0x81982146  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0146, %hpstate
	.word 0xd527fcdf  ! 78: STF_I	st	%f10, [0x1cdf, %r31]
	.word 0xd597fcdf  ! 79: LDQFA_I	-	[%r31, 0x1cdf], %f10
tagged_1_35:
	taddcctv %r3, 0x1074, %r23
	.word 0xd407fcdf  ! 80: LDUW_I	lduw	[%r31 + 0xfffffcdf], %r10
	.word 0x93500000  ! 81: RDPR_TPC	rdpr	%tpc, %r9
intveclr_1_36:
	setx 0x38f77e8cdde689fa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 82: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd66ffcdf  ! 84: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffffcdf]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16c622a  ! 85: SDIVX_I	sdivx	%r17, 0x022a, %r16
intveclr_1_38:
	setx 0x4c5c87c1fa5b3067, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d90800b  ! 87: WRPR_WSTATE_R	wrpr	%r2, %r11, %wstate
	.word 0x2e700001  ! 88: BPVS	<illegal instruction>
debug_1_40:
	nop
	setx debug_1_40 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 89: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_1_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 90: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81982f05  ! 91: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f05, %hpstate
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 92: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	setx ivw_1_42, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_42:
	.word 0x97a00171  ! 93: FABSq	dis not found

	.word 0xd647ec7e  ! 94: LDSW_I	ldsw	[%r31 + 0x0c7e], %r11
	.word 0x2a800001  ! 95: BCS	bcs,a	<label_0x1>
	.word 0xd6d804a0  ! 96: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_1_43)) -> intp(1,1,3)
xir_1_43:
	.word 0xa9847759  ! 97: WR_SET_SOFTINT_I	wr	%r17, 0x1759, %set_softint
	.word 0x8d903424  ! 98: WRPR_PSTATE_I	wrpr	%r0, 0x1424, %pstate
mondo_1_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d928010  ! 99: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
	.word 0x83d02035  ! 100: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8790202d  ! 101: WRPR_TT_I	wrpr	%r0, 0x002d, %tt
debug_1_45:
	nop
	setx debug_1_45 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 102: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd71fc000  ! 103: LDDF_R	ldd	[%r31, %r0], %f11
DS_1_46:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 104: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd69004a0  ! 105: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0xd69ffa49  ! 106: LDDA_I	ldda	[%r31, + 0xfffffa49] %asi, %r11
	.word 0x879022ec  ! 107: WRPR_TT_I	wrpr	%r0, 0x02ec, %tt
	.word 0x95450000  ! 108: RD_SET_SOFTINT	rd	%set_softint, %r10
debug_1_47:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 109: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8198212e  ! 110: WRHPR_HPSTATE_I	wrhpr	%r0, 0x012e, %hpstate
	.word 0x93a509c0  ! 111: FDIVd	fdivd	%f20, %f0, %f40
debug_1_48:
	nop
	setx debug_1_48 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 112: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802004  ! 113: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x819822ec  ! 114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02ec, %hpstate
	.word 0x8198232f  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x032f, %hpstate
intveclr_1_49:
	setx 0x2f8540c207d120ba, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 116: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 117: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x9a69a394  ! 118: UDIVX_I	udivx 	%r6, 0x0394, %r13
	.word 0xd08008a0  ! 119: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
tagged_1_50:
	tsubcctv %r19, 0x1f3b, %r12
	.word 0xd007f324  ! 120: LDUW_I	lduw	[%r31 + 0xfffff324], %r8
	.word 0xa1902002  ! 121: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_tba_1_51:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 122: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_1_52:
	nop
	setx debug_1_52 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 123: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902007  ! 124: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01973  ! 125: FqTOd	dis not found

debug_1_54:
	nop
	setx debug_1_54 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 126: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902007  ! 127: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
change_to_randtl_1_55:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_55:
	.word 0x8f902001  ! 128: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_1_56:
	setx 0xc2aacabbb7bf530c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_57:
	setx 0xe24a4b659ff0c5ff, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 130: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_58:
	setx 0x01e30dd2d674919d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 131: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 132: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x81982745  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0745, %hpstate
intveclr_1_59:
	setx 0x873757440831c9b1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 134: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd66ff324  ! 135: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff324]
	.word 0xd627f324  ! 136: STW_I	stw	%r11, [%r31 + 0xfffff324]
	.word 0xd69fc020  ! 137: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
debug_1_60:
	nop
	setx debug_1_60 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 138: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_1_61:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d904013  ! 139: WRPR_WSTATE_R	wrpr	%r1, %r19, %wstate
	.word 0xd677f324  ! 140: STX_I	stx	%r11, [%r31 + 0xfffff324]
	.word 0x8d903021  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x1021, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_62)) -> intp(5,0,13)
intvec_1_62:
	.word 0x39400001  ! 142: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x819826b4  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06b4, %hpstate
	setx 0xd87e2fd9ce6cac29, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_63:
	.word 0x39400001  ! 144: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d924002  ! 145: WRPR_WSTATE_R	wrpr	%r9, %r2, %wstate
splash_lsu_1_65:
	setx 0xd6c424c4912bd7a5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 146: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902000  ! 147: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_1_66:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d950000  ! 148: WRPR_WSTATE_R	wrpr	%r20, %r0, %wstate
DS_1_67:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 149: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
DS_1_68:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f10, %f6, %f10
	.word 0x97b4c30b  ! 150: ALIGNADDRESS	alignaddr	%r19, %r11, %r11
intveclr_1_69:
	setx 0x72d7ed487af5e19a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 151: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd657f324  ! 152: LDSH_I	ldsh	[%r31 + 0xfffff324], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 153: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd727c006  ! 154: STF_R	st	%f11, [%r6, %r31]
	.word 0x83d020b5  ! 155: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xa9848003  ! 156: WR_SET_SOFTINT_R	wr	%r18, %r3, %set_softint
debug_1_70:
	nop
	setx debug_1_70 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 157: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 158: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x93902007  ! 159: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x97a109d0  ! 160: FDIVd	fdivd	%f4, %f16, %f42
DS_1_71:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f20, %f6, %f2
	.word 0x97b48309  ! 161: ALIGNADDRESS	alignaddr	%r18, %r9, %r11
donret_1_72:
	nop
	setx donretarg_1_72, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r27, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_72:
	.word 0xdafff324  ! 162: SWAPA_I	swapa	%r13, [%r31 + 0xfffff324] %asi
debug_1_73:
	nop
	setx debug_1_73 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_1_74:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 164: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200f  ! 165: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa3500000  ! 166: RDPR_TPC	<illegal instruction>
	.word 0x8d903933  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x1933, %pstate
splash_cmpr_1_75:
	setx 0x907630f1cbbbedae, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 168: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902001  ! 169: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_1_76:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe335000b  ! 1: STQF_R	-	%f17, [%r11, %r20]
	normalw
	.word 0x99458000  ! 170: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x879020da  ! 171: WRPR_TT_I	wrpr	%r0, 0x00da, %tt
splash_cmpr_1_77:
	setx 0x9c80398e310b1789, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d02033  ! 173: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x93902006  ! 174: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	setx ivw_1_78, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_78:
	.word 0x9ba00166  ! 175: FABSq	dis not found

splash_cmpr_1_79:
	setx 0xe523fa5c2843f525, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 176: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_80:
	setx 0x3c4fbfb81f2d948b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe7e7c030  ! 178: CASA_I	casa	[%r31] 0x 1, %r16, %r19
intveclr_1_81:
	setx 0xa7dc6f90c8c1b79b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 179: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa190200e  ! 180: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xe727c010  ! 181: STF_R	st	%f19, [%r16, %r31]
	.word 0xe68008a0  ! 182: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x81b01021  ! 183: SIAM	siam	1
	.word 0xa1902003  ! 184: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xe61fc000  ! 185: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x2c800001  ! 186: BNEG	bneg,a	<label_0x1>
	.word 0x20800001  ! 187: BN	bn,a	<label_0x1>
	.word 0xe69ff324  ! 188: LDDA_I	ldda	[%r31, + 0xfffff324] %asi, %r19
splash_cmpr_1_82:
	setx 0xb56367063a595075, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 189: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe67ff324  ! 190: SWAP_I	swap	%r19, [%r31 + 0xfffff324]
	setx 0x818d5be55edcbdb7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_83:
	.word 0x39400001  ! 191: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
mondo_1_84:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d944003  ! 193: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
DS_1_85:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 194: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe6bff324  ! 195: STDA_I	stda	%r19, [%r31 + 0xfffff324] %asi
mondo_1_86:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d908001  ! 196: WRPR_WSTATE_R	wrpr	%r2, %r1, %wstate
change_to_randtl_1_87:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_87:
	.word 0x8f902002  ! 197: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01973  ! 198: FqTOd	dis not found

donret_1_89:
	nop
	setx donretarg_1_89, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r6, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_89:
	.word 0xe6fff324  ! 199: SWAPA_I	swapa	%r19, [%r31 + 0xfffff324] %asi
change_to_randtl_1_90:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_90:
	.word 0x8f902000  ! 200: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 201: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 202: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_1_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d94800d  ! 203: WRPR_WSTATE_R	wrpr	%r18, %r13, %wstate
	.word 0x38700001  ! 204: BPGU	<illegal instruction>
	.word 0x819827d7  ! 205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d7, %hpstate
	.word 0xe797f324  ! 206: LDQFA_I	-	[%r31, 0x1324], %f19
	.word 0x38800001  ! 207: BGU	bgu,a	<label_0x1>
splash_tba_1_92:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 208: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x819825cc  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cc, %hpstate
	.word 0x9f803abb  ! 210: SIR	sir	0x1abb
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01972  ! 211: FqTOd	dis not found

	.word 0xe717c000  ! 212: LDQF_R	-	[%r31, %r0], %f19
	.word 0x81460000  ! 213: RD_STICK_REG	stbar
	.word 0xe6dfe000  ! 214: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r19
	.word 0xa1902007  ! 215: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_cmpr_1_94:
	setx 0xa8b54776a7077596, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d90374a  ! 217: WRPR_PSTATE_I	wrpr	%r0, 0x174a, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01967  ! 218: FqTOd	dis not found

debug_1_96:
	nop
	setx debug_1_96 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 219: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_1_97:
	setx 0x7ae4f165de98d49d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 220: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd06ffc1f  ! 221: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffc1f]
	.word 0xd0d7e030  ! 222: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
tagged_1_98:
	tsubcctv %r5, 0x18a2, %r16
	.word 0xd007fc1f  ! 223: LDUW_I	lduw	[%r31 + 0xfffffc1f], %r8
	.word 0xa5a349cd  ! 224: FDIVd	fdivd	%f44, %f44, %f18
mondo_1_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d94c002  ! 225: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
splash_cmpr_1_100:
	setx 0x90f10e2d32ce9fd6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 226: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802d0a  ! 227: SIR	sir	0x0d0a
	.word 0xa190200f  ! 228: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x87902223  ! 229: WRPR_TT_I	wrpr	%r0, 0x0223, %tt
donret_1_101:
	nop
	setx donretarg_1_101, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r5, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_101:
	.word 0xd2ffeed1  ! 230: SWAPA_I	swapa	%r9, [%r31 + 0x0ed1] %asi
change_to_randtl_1_102:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_102:
	.word 0x8f902001  ! 231: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, @VA(.MAIN.xir_1_103)) -> intp(1,1,3)
xir_1_103:
	.word 0xa984efca  ! 232: WR_SET_SOFTINT_I	wr	%r19, 0x0fca, %set_softint
	.word 0xd20fc000  ! 233: LDUB_R	ldub	[%r31 + %r0], %r9
debug_1_104:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 234: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd207c000  ! 235: LDUW_R	lduw	[%r31 + %r0], %r9
change_to_randtl_1_105:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_105:
	.word 0x8f902001  ! 236: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_1_106:
	setx 0x11250505bb8b141c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 237: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d920013  ! 238: WRPR_WSTATE_R	wrpr	%r8, %r19, %wstate
splash_tba_1_108:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 239: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd29ffeae  ! 240: LDDA_I	ldda	[%r31, + 0xfffffeae] %asi, %r9
	.word 0xd28804a0  ! 241: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
DS_1_109:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe3148000  ! 1: LDQF_R	-	[%r18, %r0], %f17
	.word 0x97a28828  ! 242: FADDs	fadds	%f10, %f8, %f11
debug_1_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 243: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x3c800001  ! 244: BPOS	bpos,a	<label_0x1>
	setx ivw_1_111, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_111:
	.word 0xa9a00174  ! 245: FABSq	dis not found

tagged_1_112:
	tsubcctv %r24, 0x1452, %r7
	.word 0xd407feae  ! 246: LDUW_I	lduw	[%r31 + 0xfffffeae], %r10
	.word 0xd407c000  ! 247: LDUW_R	lduw	[%r31 + %r0], %r10
debug_1_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 248: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 249: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 250: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_1_114:
	setx 0x2f40dc42ed78eefd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 251: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d02034  ! 252: Tcc_I	tne	icc_or_xcc, %r0 + 52
DS_1_115:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 253: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xd47ffeae  ! 254: SWAP_I	swap	%r10, [%r31 + 0xfffffeae]
	.word 0xd537feae  ! 255: STQF_I	-	%f10, [0x1eae, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_116)) -> intp(2,0,29)
intvec_1_116:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x24800001  ! 257: BLE	ble,a	<label_0x1>
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91a209c0  ! 259: FDIVd	fdivd	%f8, %f0, %f8
splash_tba_1_117:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 260: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d020b3  ! 261: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x8198294d  ! 262: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094d, %hpstate
change_to_randtl_1_118:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_118:
	.word 0x8f902002  ! 263: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 264: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xad84a82c  ! 265: WR_SOFTINT_REG_I	wr	%r18, 0x082c, %softint
	.word 0x98a9c004  ! 266: ANDNcc_R	andncc 	%r7, %r4, %r12
!$EV trig_pc_d(1, @VA(.MAIN.xir_1_119)) -> intp(1,1,3)
xir_1_119:
	.word 0xa981f6d0  ! 267: WR_SET_SOFTINT_I	wr	%r7, 0x16d0, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_120)) -> intp(6,0,1)
intvec_1_120:
	.word 0x39400001  ! 268: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 269: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_1_121:
	setx 0xb828f821febd122c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 270: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa8fc0012  ! 271: SDIVcc_R	sdivcc 	%r16, %r18, %r20
	.word 0xe807c000  ! 272: LDUW_R	lduw	[%r31 + %r0], %r20
	setx ivw_1_122, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_122:
	.word 0x91a0016c  ! 273: FABSq	dis not found

mondo_1_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d948013  ! 274: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
splash_cmpr_1_124:
	setx 0x9309461f0afc7e0a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 275: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 276: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x924a4001  ! 277: MULX_R	mulx 	%r9, %r1, %r9
splash_cmpr_1_125:
	setx 0xc81dc131f4240355, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99480000  ! 279: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
debug_1_126:
	nop
	setx debug_1_126 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 280: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x28700001  ! 281: BPLEU	<illegal instruction>
	.word 0x93902001  ! 282: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87802010  ! 283: WRASI_I	wr	%r0, 0x0010, %asi
change_to_randtl_1_127:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_127:
	.word 0x8f902002  ! 284: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a0196b  ! 285: FqTOd	dis not found

	.word 0x87802004  ! 286: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_1_129:
	setx 0x76f59ce4aec1aaef, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 287: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902219  ! 288: WRPR_TT_I	wrpr	%r0, 0x0219, %tt
	.word 0x9ba01a72  ! 289: FqTOi	fqtoi	
	.word 0xe81fffcf  ! 290: LDD_I	ldd	[%r31 + 0xffffffcf], %r20
	.word 0xe88008a0  ! 291: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
splash_cmpr_1_130:
	setx 0x9267bb4b2b3aa6ce, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 292: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe93fc008  ! 293: STDF_R	std	%f20, [%r8, %r31]
	.word 0x87902250  ! 294: WRPR_TT_I	wrpr	%r0, 0x0250, %tt
	.word 0xe857c000  ! 295: LDSH_R	ldsh	[%r31 + %r0], %r20
	.word 0x3e800001  ! 296: BVC	bvc,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 297: LDX_R	ldx	[%r31 + %r0], %r20
DS_1_131:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 298: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	setx ivw_1_132, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_132:
	.word 0x93a0016a  ! 299: FABSq	dis not found

	.word 0x9f803f4e  ! 300: SIR	sir	0x1f4e
	.word 0xa8dd0003  ! 301: SMULcc_R	smulcc 	%r20, %r3, %r20
	.word 0x87802088  ! 302: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x9f802546  ! 303: SIR	sir	0x0546
	.word 0xd28008a0  ! 304: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd28008a0  ! 305: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_lsu_1_133:
	setx 0x9c5c517d8411438b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 306: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_1_134:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 307: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x91d020b2  ! 308: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_tba_1_135:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 309: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd27ff5df  ! 310: SWAP_I	swap	%r9, [%r31 + 0xfffff5df]
debug_1_136:
	nop
	setx debug_1_136 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 311: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_1_137:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 312: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd2d804a0  ! 313: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0xd2c004a0  ! 314: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6a3adf  ! 315: SDIVX_I	sdivx	%r8, 0xfffffadf, %r13
	.word 0x8198285c  ! 316: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085c, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r18
DS_1_139:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd330c010  ! 1: STQF_R	-	%f9, [%r16, %r3]
	normalw
	.word 0x97458000  ! 318: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xe607c000  ! 319: LDUW_R	lduw	[%r31 + %r0], %r19
mondo_1_140:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d934014  ! 320: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9969aff2  ! 321: SDIVX_I	sdivx	%r6, 0x0ff2, %r12
	.word 0xd537c008  ! 322: STQF_R	-	%f10, [%r8, %r31]
	.word 0xab808001  ! 323: WR_CLEAR_SOFTINT_R	wr	%r2, %r1, %clear_softint
	.word 0xd48008a0  ! 324: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa9828008  ! 325: WR_SET_SOFTINT_R	wr	%r10, %r8, %set_softint
mondo_1_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d910008  ! 326: WRPR_WSTATE_R	wrpr	%r4, %r8, %wstate
	.word 0x81460000  ! 327: RD_STICK_REG	stbar
change_to_randtl_1_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_143:
	.word 0x8f902001  ! 328: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_1_144:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_144:
	.word 0x8f902001  ! 329: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902000  ! 330: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd4dfe000  ! 331: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
pmu_1_145:
	nop
	setx 0xfffffe71fffff397, %g1, %g7
	.word 0xa3800007  ! 332: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d802000  ! 333: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_1_146:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d93000a  ! 334: WRPR_WSTATE_R	wrpr	%r12, %r10, %wstate
intveclr_1_147:
	setx 0xa9ce53b34ff9a39a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 335: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 336: WRASI_I	wr	%r0, 0x0014, %asi
splash_cmpr_1_148:
	setx 0xa464d6351b711fd2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b4  ! 338: Tcc_I	ta	icc_or_xcc, %r0 + 180
change_to_randtl_1_149:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_149:
	.word 0x8f902000  ! 339: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x2c800001  ! 340: BNEG	bneg,a	<label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6a7104  ! 341: SDIVX_I	sdivx	%r9, 0xfffff104, %r13
debug_1_151:
	nop
	setx debug_1_151 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 342: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_1_152:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 343: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd647e7a8  ! 344: LDSW_I	ldsw	[%r31 + 0x07a8], %r11
	.word 0x9745c000  ! 345: RD_TICK_CMPR_REG	rd	%-, %r11
splash_tba_1_153:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 346: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f803c65  ! 347: SIR	sir	0x1c65
	.word 0x91d020b5  ! 348: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8d902800  ! 349: WRPR_PSTATE_I	wrpr	%r0, 0x0800, %pstate
	.word 0x87802063  ! 350: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x81982f07  ! 351: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f07, %hpstate
	.word 0x3a800001  ! 352: BCC	bcc,a	<label_0x1>
	.word 0xe8880e80  ! 353: LDUBA_R	lduba	[%r0, %r0] 0x74, %r20
splash_cmpr_1_154:
	setx 0x3e66323ee23ad44e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 354: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_155:
	setx 0x116fdd9b3ba44406, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 355: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d94c001  ! 356: WRPR_WSTATE_R	wrpr	%r19, %r1, %wstate
	.word 0x36700001  ! 357: BPGE	<illegal instruction>
mondo_1_157:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d94000a  ! 358: WRPR_WSTATE_R	wrpr	%r16, %r10, %wstate
DS_1_158:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f20, %f6, %f20
	.word 0xa5b28308  ! 359: ALIGNADDRESS	alignaddr	%r10, %r8, %r18
	setx ivw_1_159, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_159:
	.word 0x95a00172  ! 360: FABSq	dis not found

	.word 0xd26ff7b0  ! 361: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffff7b0]
splash_tba_1_160:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 362: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91a349d0  ! 363: FDIVd	fdivd	%f44, %f16, %f8
	.word 0xd28008a0  ! 364: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
debug_1_161:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 365: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_1_162:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_162:
	.word 0x8f902001  ! 366: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa46a4012  ! 367: UDIVX_R	udivx 	%r9, %r18, %r18
	.word 0x8198236c  ! 368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x036c, %hpstate
DS_1_163:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe330e304  ! 1: STQF_I	-	%f17, [0x0304, %r3]
	normalw
	.word 0x97458000  ! 369: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956a6ea6  ! 370: SDIVX_I	sdivx	%r9, 0x0ea6, %r10
	.word 0xd2d004a0  ! 371: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
debug_1_165:
	nop
	setx debug_1_165 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 372: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_1_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d924004  ! 373: WRPR_WSTATE_R	wrpr	%r9, %r4, %wstate
	.word 0x87902350  ! 374: WRPR_TT_I	wrpr	%r0, 0x0350, %tt
	.word 0x99902001  ! 375: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x28700001  ! 376: BPLEU	<illegal instruction>
	.word 0xa1902006  ! 377: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x87802055  ! 378: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xa481e40e  ! 379: ADDcc_I	addcc 	%r7, 0x040e, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 380: LDX_R	ldx	[%r31 + %r0], %r19
tagged_1_167:
	taddcctv %r14, 0x102b, %r1
	.word 0xe607f8ba  ! 381: LDUW_I	lduw	[%r31 + 0xfffff8ba], %r19
	.word 0xe61fc000  ! 382: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x93902001  ! 383: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982926  ! 384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0926, %hpstate
	.word 0x26700001  ! 385: BPL	<illegal instruction>
mondo_1_168:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d90c014  ! 386: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
	.word 0x93902002  ! 387: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_cmpr_1_169:
	setx 0x38da1a7555579b03, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 388: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d92c005  ! 389: WRPR_WSTATE_R	wrpr	%r11, %r5, %wstate
mondo_1_171:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d914005  ! 390: WRPR_WSTATE_R	wrpr	%r5, %r5, %wstate
	.word 0xa190200d  ! 391: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	setx ivw_1_172, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_172:
	.word 0x99a00168  ! 392: FABSq	dis not found

	setx 0x37d165f44269e6a8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_173:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_174:
	setx 0x781598df44f5fa49, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 394: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_175:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe3150006  ! 1: LDQF_R	-	[%r20, %r6], %f17
	.word 0x93a00833  ! 395: FADDs	fadds	%f0, %f19, %f9
mondo_1_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d94c011  ! 396: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
	.word 0x8198284f  ! 397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084f, %hpstate
	.word 0x8d802000  ! 398: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_1_177:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d94400b  ! 399: WRPR_WSTATE_R	wrpr	%r17, %r11, %wstate
splash_cmpr_1_178:
	setx 0x89b2006cabbc7e8c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 400: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_1_179, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_179:
	.word 0xa9a00168  ! 401: FABSq	dis not found

splash_cmpr_1_180:
	setx 0xb0f871252a3e0d73, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 402: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_181:
	nop
	setx debug_1_181 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 403: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99520000  ! 404: RDPR_PIL	<illegal instruction>
DS_1_182:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f16, %f24, %f12
	.word 0xa3b00307  ! 405: ALIGNADDRESS	alignaddr	%r0, %r7, %r17
mondo_1_183:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d924010  ! 406: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
mondo_1_184:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d92800c  ! 407: WRPR_WSTATE_R	wrpr	%r10, %r12, %wstate
	.word 0x8198204f  ! 408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x004f, %hpstate
	.word 0x91d02033  ! 409: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902000  ! 410: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87802058  ! 411: WRASI_I	wr	%r0, 0x0058, %asi
mondo_1_185:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d92c00c  ! 412: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
splash_tba_1_186:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 413: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_1_187:
	setx 0x7872f414b5d55678, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 414: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_1_188:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 415: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa8824011  ! 416: ADDcc_R	addcc 	%r9, %r17, %r20
	.word 0x99902001  ! 417: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xe46ff8ba  ! 418: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffff8ba]
DS_1_189:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa5b4c314  ! 419: ALIGNADDRESS	alignaddr	%r19, %r20, %r18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956ceef8  ! 420: SDIVX_I	sdivx	%r19, 0x0ef8, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01967  ! 421: FqTOd	dis not found

	.word 0x8d902396  ! 422: WRPR_PSTATE_I	wrpr	%r0, 0x0396, %pstate
	.word 0x97a4c9c5  ! 423: FDIVd	fdivd	%f50, %f36, %f42
tagged_1_192:
	tsubcctv %r5, 0x1900, %r3
	.word 0xd007ec55  ! 424: LDUW_I	lduw	[%r31 + 0x0c55], %r8
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 425: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 426: LDX_R	ldx	[%r31 + %r0], %r8
debug_1_193:
	nop
	setx debug_1_193 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 427: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93d02032  ! 428: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xd04fec55  ! 429: LDSB_I	ldsb	[%r31 + 0x0c55], %r8
	.word 0xd08fe000  ! 430: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xa5520000  ! 432: RDPR_PIL	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99692b53  ! 433: SDIVX_I	sdivx	%r4, 0x0b53, %r12
mondo_1_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d914006  ! 434: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
debug_1_196:
	nop
	setx debug_1_196 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 435: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_1_197:
	taddcctv %r1, 0x114e, %r2
	.word 0xe007ef0e  ! 436: LDUW_I	lduw	[%r31 + 0x0f0e], %r16
	.word 0x91d02034  ! 437: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe08008a0  ! 438: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x91d02033  ! 439: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_cmpr_1_198:
	setx 0x5a31338018e9f64a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 440: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_1_199:
	setx 0x28d53400bf1e7b2b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 441: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 442: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x9f80279e  ! 443: SIR	sir	0x079e
intveclr_1_200:
	setx 0x8841a7b14667984f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 444: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 445: Tcc_I	ta	icc_or_xcc, %r0 + 178
mondo_1_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d90400b  ! 446: WRPR_WSTATE_R	wrpr	%r1, %r11, %wstate
	.word 0x99902001  ! 447: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
mondo_1_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d92c00b  ! 448: WRPR_WSTATE_R	wrpr	%r11, %r11, %wstate
	.word 0xe137c00c  ! 449: STQF_R	-	%f16, [%r12, %r31]
	setx 0x310481006626e3c3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_203:
	.word 0x39400001  ! 450: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902179  ! 451: WRPR_TT_I	wrpr	%r0, 0x0179, %tt
change_to_randtl_1_204:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_204:
	.word 0x8f902000  ! 452: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9f80279d  ! 453: SIR	sir	0x079d
	.word 0xa9500000  ! 454: RDPR_TPC	<illegal instruction>
	.word 0x819821e4  ! 455: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01e4, %hpstate
debug_1_205:
	nop
	setx debug_1_205 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 456: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_1_206:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 457: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936ced68  ! 458: SDIVX_I	sdivx	%r19, 0x0d68, %r9
tagged_1_208:
	tsubcctv %r26, 0x177f, %r4
	.word 0xd007e283  ! 459: LDUW_I	lduw	[%r31 + 0x0283], %r8
	.word 0xd08008a0  ! 460: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
debug_1_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 461: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802014  ! 462: WRASI_I	wr	%r0, 0x0014, %asi
change_to_randtl_1_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_210:
	.word 0x8f902002  ! 463: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd09fe283  ! 464: LDDA_I	ldda	[%r31, + 0x0283] %asi, %r8
	.word 0x94844001  ! 465: ADDcc_R	addcc 	%r17, %r1, %r10
	.word 0x9f8039af  ! 466: SIR	sir	0x19af
	.word 0x8790207b  ! 467: WRPR_TT_I	wrpr	%r0, 0x007b, %tt
debug_1_211:
	nop
	setx debug_1_211 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 468: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe4c004a0  ! 469: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r18
	.word 0xe4c7e010  ! 470: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r18
	.word 0xe48008a0  ! 471: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 472: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_1_212:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 473: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x879022b8  ! 474: WRPR_TT_I	wrpr	%r0, 0x02b8, %tt
splash_tba_1_213:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 475: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_1_214:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 476: SAVE_R	save	%r31, %r0, %r31
	.word 0xe48804a0  ! 477: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
debug_1_215:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 478: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe4c804a0  ! 479: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r18
	.word 0xa1a009c0  ! 480: FDIVd	fdivd	%f0, %f0, %f16
	.word 0x93902003  ! 481: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
intveclr_1_216:
	setx 0xd4b1b301c1f1e462, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_1_217:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd1340004  ! 1: STQF_R	-	%f8, [%r4, %r16]
	normalw
	.word 0xa5458000  ! 483: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0x8780204f  ! 484: WRASI_I	wr	%r0, 0x004f, %asi
debug_1_218:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 485: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x26700001  ! 486: BPL	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01973  ! 487: FqTOd	dis not found

splash_cmpr_1_220:
	setx 0xb9845552d8bd09e5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 488: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 489: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 490: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xe897e000  ! 491: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r20
	.word 0xe8880e60  ! 492: LDUBA_R	lduba	[%r0, %r0] 0x73, %r20
intveclr_1_221:
	setx 0xde6f20ed76b776ef, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 493: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe847e9df  ! 494: LDSW_I	ldsw	[%r31 + 0x09df], %r20
	.word 0xe827e9df  ! 495: STW_I	stw	%r20, [%r31 + 0x09df]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96ab7f0  ! 496: SDIVX_I	sdivx	%r10, 0xfffff7f0, %r20
	.word 0x9f8028dd  ! 497: SIR	sir	0x08dd
	.word 0x93454000  ! 498: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0xd0dfe030  ! 499: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r8
	.word 0x87802058  ! 500: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xd127c003  ! 501: STF_R	st	%f8, [%r3, %r31]
	.word 0x81982b17  ! 502: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b17, %hpstate
splash_tba_1_223:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 503: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x99902005  ! 504: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xd0d7e000  ! 505: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 506: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_1_224:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xa96f5dc8	! Random illegal ?
	.word 0xd9104003  ! 1: LDQF_R	-	[%r1, %r3], %f12
	.word 0xa5a1882c  ! 507: FADDs	fadds	%f6, %f12, %f18
	.word 0x87902290  ! 508: WRPR_TT_I	wrpr	%r0, 0x0290, %tt
splash_lsu_1_225:
	setx 0xd3508184bfa99ce5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 509: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 510: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd25ff2d8  ! 511: LDX_I	ldx	[%r31 + 0xfffff2d8], %r9
	.word 0x81982f07  ! 512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f07, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_226)) -> intp(4,0,14)
intvec_1_226:
	.word 0x39400001  ! 513: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 514: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d90291f  ! 515: WRPR_PSTATE_I	wrpr	%r0, 0x091f, %pstate
	.word 0xa190200c  ! 516: WRPR_GL_I	wrpr	%r0, 0x000c, %-
intveclr_1_227:
	setx 0x68e421451052c821, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 517: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_1_228:
	nop
	setx donretarg_1_228, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r10, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_228:
	.word 0xd2fff2d8  ! 518: SWAPA_I	swapa	%r9, [%r31 + 0xfffff2d8] %asi
	.word 0x81982856  ! 519: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0856, %hpstate
	.word 0x81b01021  ! 520: SIAM	siam	1
	.word 0xd2c004a0  ! 521: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	.word 0x38700001  ! 522: BPGU	<illegal instruction>
	.word 0x2e800001  ! 523: BVS	bvs,a	<label_0x1>
tagged_1_229:
	taddcctv %r18, 0x1d81, %r24
	.word 0xd207f2d8  ! 524: LDUW_I	lduw	[%r31 + 0xfffff2d8], %r9
intveclr_1_230:
	setx 0xcb220db1d0aebaed, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_231:
	setx 0xb8295272f289a774, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 526: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902001  ! 527: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xa8c37619  ! 528: ADDCcc_I	addccc 	%r13, 0xfffff619, %r20
	.word 0x87802063  ! 529: WRASI_I	wr	%r0, 0x0063, %asi
splash_cmpr_1_232:
	setx 0x1035ebb27bb915f8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 530: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_233:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d930002  ! 531: WRPR_WSTATE_R	wrpr	%r12, %r2, %wstate
	.word 0x87902290  ! 532: WRPR_TT_I	wrpr	%r0, 0x0290, %tt
	.word 0x91d02035  ! 533: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe4800b00  ! 534: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r18
	.word 0x9ba289cc  ! 535: FDIVd	fdivd	%f10, %f12, %f44
	.word 0xe8dfe020  ! 536: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r20
	.word 0xa5a049d4  ! 537: FDIVd	fdivd	%f32, %f20, %f18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76b23e2  ! 538: SDIVX_I	sdivx	%r12, 0x03e2, %r19
	.word 0x93540000  ! 539: RDPR_GL	rdpr	%-, %r9
	.word 0xd6dfe030  ! 540: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r11
splash_tba_1_235:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 541: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa7480000  ! 542: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 543: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_1_236:
	tsubcctv %r19, 0x1a5d, %r11
	.word 0xe607e600  ! 544: LDUW_I	lduw	[%r31 + 0x0600], %r19
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 545: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_1_237:
	setx 0x04a669e54f371531, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 546: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_238:
	setx 0x21d74f90b6680c73, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902063  ! 548: WRPR_TT_I	wrpr	%r0, 0x0063, %tt
	setx 0x79ae903ce98ae3cb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_239:
	.word 0x39400001  ! 549: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_240:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d908009  ! 550: WRPR_WSTATE_R	wrpr	%r2, %r9, %wstate
intveclr_1_241:
	setx 0x20800f414c9ecfa7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 551: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8790233a  ! 552: WRPR_TT_I	wrpr	%r0, 0x033a, %tt
	.word 0xe6c7e000  ! 553: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r19
	.word 0x93902001  ! 554: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe68008a0  ! 555: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x99454000  ! 556: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
tagged_1_242:
	tsubcctv %r18, 0x1f7b, %r4
	.word 0xe807e600  ! 557: LDUW_I	lduw	[%r31 + 0x0600], %r20
debug_1_243:
	nop
	setx debug_1_243 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 558: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x22800001  ! 559: BE	be,a	<label_0x1>
intveclr_1_244:
	setx 0x77b119f82d5469f5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 560: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_245:
	setx 0xfe8cceade31d9f86, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 561: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902e96  ! 562: WRPR_PSTATE_I	wrpr	%r0, 0x0e96, %pstate
debug_1_246:
	nop
	setx debug_1_246 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 563: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0xc799a7f517a0430f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_247:
	.word 0x39400001  ! 564: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_1_248:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 565: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_1_249:
	setx 0x7c3f21e25dee74fa, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 566: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902003  ! 567: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8780204f  ! 568: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xa353c000  ! 569: RDPR_FQ	<illegal instruction>
	.word 0x91a00574  ! 570: FSQRTq	fsqrt	
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 571: LDX_R	ldx	[%r31 + %r0], %r9
debug_1_250:
	nop
	setx debug_1_250 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 572: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01970  ! 573: FqTOd	dis not found

	.word 0xa9b30fe4  ! 574: FONES	e	%f20
splash_cmpr_1_252:
	setx 0x0a46b4a038911973, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 575: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 576: LDX_R	ldx	[%r31 + %r0], %r11
	setx 0x0958e8384e46bb64, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_253:
	.word 0x39400001  ! 577: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6c7e010  ! 578: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r11
	.word 0x8d9025f9  ! 579: WRPR_PSTATE_I	wrpr	%r0, 0x05f9, %pstate
	.word 0x83d02032  ! 580: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x87802089  ! 581: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd737c004  ! 582: STQF_R	-	%f11, [%r4, %r31]
	.word 0xa66b0010  ! 583: UDIVX_R	udivx 	%r12, %r16, %r19
splash_cmpr_1_254:
	setx 0x576a2be06f687bb1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 584: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_255:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xdb108007  ! 1: LDQF_R	-	[%r2, %r7], %f13
	.word 0x95a48827  ! 585: FADDs	fadds	%f18, %f7, %f10
mondo_1_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d950014  ! 586: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	.word 0xe53fc00a  ! 587: STDF_R	std	%f18, [%r10, %r31]
tagged_1_257:
	taddcctv %r13, 0x143a, %r14
	.word 0xe407e600  ! 588: LDUW_I	lduw	[%r31 + 0x0600], %r18
pmu_1_258:
	nop
	setx 0xfffff66bfffffba0, %g1, %g7
	.word 0xa3800007  ! 589: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xad853ac6  ! 590: WR_SOFTINT_REG_I	wr	%r20, 0x1ac6, %softint
tagged_1_259:
	taddcctv %r10, 0x12f7, %r12
	.word 0xe407e4ec  ! 591: LDUW_I	lduw	[%r31 + 0x04ec], %r18
	.word 0xa1520000  ! 592: RDPR_PIL	<illegal instruction>
change_to_randtl_1_260:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_260:
	.word 0x8f902001  ! 593: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd827e4ec  ! 594: STW_I	stw	%r12, [%r31 + 0x04ec]
	.word 0x81460000  ! 595: RD_STICK_REG	stbar
mondo_1_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d90c005  ! 596: WRPR_WSTATE_R	wrpr	%r3, %r5, %wstate
	.word 0x8d902115  ! 597: WRPR_PSTATE_I	wrpr	%r0, 0x0115, %pstate
	.word 0x879021eb  ! 598: WRPR_TT_I	wrpr	%r0, 0x01eb, %tt
	.word 0x8d903b9a  ! 599: WRPR_PSTATE_I	wrpr	%r0, 0x1b9a, %pstate
	.word 0x81982606  ! 600: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0606, %hpstate
	.word 0x93902003  ! 601: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81460000  ! 602: RD_STICK_REG	stbar
	.word 0x26800001  ! 603: BL	bl,a	<label_0x1>
debug_1_262:
	nop
	setx debug_1_262 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 604: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902004  ! 605: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_tba_1_263:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 606: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_1_264:
	nop
	setx debug_1_264 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 607: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x819825be  ! 608: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05be, %hpstate
change_to_randtl_1_265:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_265:
	.word 0x8f902002  ! 609: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x93902007  ! 610: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd8c7e010  ! 611: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
intveclr_1_266:
	setx 0x3ba84e2d57bda83a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 612: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa190200b  ! 613: WRPR_GL_I	wrpr	%r0, 0x000b, %-
debug_1_267:
	nop
	setx debug_1_267 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 614: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd8cfe020  ! 615: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
debug_1_268:
	nop
	setx debug_1_268 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 616: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_1_269:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d914006  ! 617: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 618: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_1_270:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 619: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x28700001  ! 620: BPLEU	<illegal instruction>
	.word 0x93902002  ! 621: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
mondo_1_271:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d948003  ! 622: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
splash_lsu_1_272:
	setx 0xe13c56a33c4726a7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 623: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d930011  ! 624: WRPR_WSTATE_R	wrpr	%r12, %r17, %wstate
	.word 0xd88804a0  ! 625: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
splash_cmpr_1_274:
	setx 0x4bd182fe0f50ed2a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 626: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 627: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_1_275:
	setx 0x213cc9aabab06101, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 628: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 629: BL	bl,a	<label_0x1>
mondo_1_276:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d908009  ! 630: WRPR_WSTATE_R	wrpr	%r2, %r9, %wstate
	setx ivw_1_277, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_277:
	.word 0x95a00174  ! 631: FABSq	dis not found

	.word 0xd4c00e40  ! 632: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r10
splash_cmpr_1_278:
	setx 0xedf185e59eb5eb51, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 633: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x91a01a71  ! 635: FqTOi	fqtoi	
	.word 0xd647e4ec  ! 636: LDSW_I	ldsw	[%r31 + 0x04ec], %r11
debug_1_279:
	nop
	setx debug_1_279 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 637: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6d2c8a  ! 638: SDIVX_I	sdivx	%r20, 0x0c8a, %r13
splash_tba_1_281:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 639: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_1_282:
	setx 0xf70c1f7332431a04, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 640: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_283:
	nop
	setx debug_1_283 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 641: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_284)) -> intp(3,0,8)
intvec_1_284:
	.word 0x39400001  ! 642: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 643: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56b3238  ! 644: SDIVX_I	sdivx	%r12, 0xfffff238, %r18
	.word 0xd2d004a0  ! 645: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01971  ! 646: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996a20c9  ! 647: SDIVX_I	sdivx	%r8, 0x00c9, %r12
pmu_1_288:
	nop
	setx 0xfffff477fffff857, %g1, %g7
	.word 0xa3800007  ! 648: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 649: LDX_R	ldx	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 650: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe01ff035  ! 651: LDD_I	ldd	[%r31 + 0xfffff035], %r16
mondo_1_289:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d95000c  ! 652: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
splash_lsu_1_290:
	setx 0x368d0b26477498e1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 653: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_1_291:
	nop
	setx debug_1_291 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 654: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902005  ! 655: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8198237d  ! 656: WRHPR_HPSTATE_I	wrhpr	%r0, 0x037d, %hpstate
tagged_1_292:
	tsubcctv %r17, 0x1e32, %r4
	.word 0xe007f035  ! 657: LDUW_I	lduw	[%r31 + 0xfffff035], %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01970  ! 658: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9769e1e6  ! 659: SDIVX_I	sdivx	%r7, 0x01e6, %r11
	.word 0x81510000  ! 660: RDPR_TICK	rdpr	%tick, %r0
	setx 0x99ce8e78d28692bb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_295:
	.word 0x39400001  ! 661: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_1_296:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 662: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_1_297:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd7314012  ! 1: STQF_R	-	%f11, [%r18, %r5]
	normalw
	.word 0x9b458000  ! 663: RD_SOFTINT_REG	rd	%softint, %r13
pmu_1_298:
	nop
	setx 0xfffff733fffff732, %g1, %g7
	.word 0xa3800007  ! 664: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_1_299:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_299:
	.word 0x8f902001  ! 665: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_1_300:
	nop
	setx debug_1_300 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 666: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902000  ! 667: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd68008a0  ! 668: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_tba_1_301:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 669: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_302)) -> intp(6,0,25)
intvec_1_302:
	.word 0x39400001  ! 670: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_1_303:
	set 0x003b0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 671: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_1_304:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d924000  ! 672: WRPR_WSTATE_R	wrpr	%r9, %r0, %wstate
	.word 0xd68804a0  ! 673: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0xd68008a0  ! 674: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	setx 0xa327258e86eaf30e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_305:
	.word 0x39400001  ! 675: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 676: WRASI_I	wr	%r0, 0x0004, %asi
	setx ivw_1_306, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_306:
	.word 0xa3a00163  ! 677: FABSq	dis not found

	.word 0x9345c000  ! 678: RD_TICK_CMPR_REG	rd	%-, %r9
splash_lsu_1_307:
	setx 0x61002f8c851d7bcf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 679: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_1_308:
	tsubcctv %r20, 0x1aa7, %r5
	.word 0xe807eed1  ! 680: LDUW_I	lduw	[%r31 + 0x0ed1], %r20
splash_cmpr_1_309:
	setx 0x066ec536940fcdf6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 681: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902180  ! 682: WRPR_TT_I	wrpr	%r0, 0x0180, %tt
tagged_1_310:
	tsubcctv %r26, 0x13fb, %r5
	.word 0xe807eed1  ! 683: LDUW_I	lduw	[%r31 + 0x0ed1], %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1686849  ! 684: SDIVX_I	sdivx	%r1, 0x0849, %r16
change_to_randtl_1_312:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_312:
	.word 0x8f902000  ! 685: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_1_313:
	nop
	setx debug_1_313 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 686: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_1_314:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_314:
	.word 0x8f902001  ! 687: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_1_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d950005  ! 688: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	.word 0x93902000  ! 689: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
debug_1_316:
	nop
	setx debug_1_316 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 690: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x57e6a0df2d38dfb3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_317:
	.word 0x39400001  ! 691: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 692: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 693: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xad852841  ! 694: WR_SOFTINT_REG_I	wr	%r20, 0x0841, %softint
	.word 0x87802058  ! 695: WRASI_I	wr	%r0, 0x0058, %asi
change_to_randtl_1_318:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_318:
	.word 0x8f902002  ! 696: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01960  ! 697: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996ab3cb  ! 698: SDIVX_I	sdivx	%r10, 0xfffff3cb, %r12
debug_1_321:
	nop
	setx debug_1_321 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 699: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_1_322:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 700: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_1_323:
	taddcctv %r7, 0x10f5, %r26
	.word 0xe407f52a  ! 701: LDUW_I	lduw	[%r31 + 0xfffff52a], %r18
mondo_1_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d928014  ! 702: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 703: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902790  ! 704: WRPR_PSTATE_I	wrpr	%r0, 0x0790, %pstate
	.word 0xa9a01a6d  ! 705: FqTOi	fqtoi	
	.word 0x81982d4e  ! 706: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4e, %hpstate
	setx ivw_1_325, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_325:
	.word 0x95a0016b  ! 707: FABSq	dis not found

	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 708: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 709: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x819829ad  ! 710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09ad, %hpstate
	.word 0xd237f52a  ! 711: STH_I	sth	%r9, [%r31 + 0xfffff52a]
	.word 0x9f802427  ! 712: SIR	sir	0x0427
	.word 0xd317c000  ! 713: LDQF_R	-	[%r31, %r0], %f9
splash_cmpr_1_326:
	setx 0xdacaefe6bb518658, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 714: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 715: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_1_327:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 716: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_1_328:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d950014  ! 717: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	.word 0xd337e0ec  ! 718: STQF_I	-	%f9, [0x00ec, %r31]
	.word 0x9b454000  ! 719: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	.word 0x99902005  ! 720: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xd48008a0  ! 721: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_cmpr_1_329:
	setx 0x2d597c5df5b1956c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 722: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_330:
	setx 0x11a4f6d83acd6706, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 723: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx ivw_1_331, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_331:
	.word 0x91a00168  ! 724: FABSq	dis not found

splash_tba_1_332:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 725: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879023e0  ! 726: WRPR_TT_I	wrpr	%r0, 0x03e0, %tt
	.word 0x91d02034  ! 727: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe20fe0ec  ! 728: LDUB_I	ldub	[%r31 + 0x00ec], %r17
	.word 0x81510000  ! 729: RDPR_TICK	rdpr	%tick, %r0
	setx ivw_1_333, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_333:
	.word 0xa5a0016c  ! 730: FABSq	dis not found

	.word 0x83d020b3  ! 731: Tcc_I	te	icc_or_xcc, %r0 + 179
mondo_1_334:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d90c012  ! 732: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
	.word 0x93902001  ! 733: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87802089  ! 734: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87802020  ! 735: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe917c000  ! 736: LDQF_R	-	[%r31, %r0], %f20
	setx ivw_1_335, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_335:
	.word 0xa3a00167  ! 737: FABSq	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_336)) -> intp(0,0,24)
intvec_1_336:
	.word 0x39400001  ! 738: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_337:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x95a0054b  ! 1: FSQRTd	fsqrt	
	.word 0xa5a20825  ! 739: FADDs	fadds	%f8, %f5, %f18
change_to_randtl_1_338:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_338:
	.word 0x8f902002  ! 740: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_1_339:
	setx 0x8ae691ff1ccafc6c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 741: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe6800b80  ! 742: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r19
debug_1_340:
	nop
	setx debug_1_340 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 743: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996cf06d  ! 744: SDIVX_I	sdivx	%r19, 0xfffff06d, %r12
splash_htba_1_342:
	set 0x003b0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 745: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd01ffb39  ! 746: LDD_I	ldd	[%r31 + 0xfffffb39], %r8
	.word 0x2a800001  ! 747: BCS	bcs,a	<label_0x1>
	.word 0x93902007  ! 748: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_lsu_1_343:
	setx 0x3cca6dfc47c19b75, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 749: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9ba489c7  ! 750: FDIVd	fdivd	%f18, %f38, %f44
	.word 0xad833de8  ! 751: WR_SOFTINT_REG_I	wr	%r12, 0x1de8, %softint
debug_1_344:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 752: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91454000  ! 753: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0x8790224d  ! 754: WRPR_TT_I	wrpr	%r0, 0x024d, %tt
	.word 0xe2880e80  ! 755: LDUBA_R	lduba	[%r0, %r0] 0x74, %r17
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 756: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_1_345:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 757: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x8d903e50  ! 758: WRPR_PSTATE_I	wrpr	%r0, 0x1e50, %pstate
	.word 0x87902392  ! 759: WRPR_TT_I	wrpr	%r0, 0x0392, %tt
DS_1_346:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f28, %f4, %f22
	.word 0xa1b0830a  ! 760: ALIGNADDRESS	alignaddr	%r2, %r10, %r16
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01960  ! 761: FqTOd	dis not found

	.word 0xda4fc000  ! 762: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01970  ! 763: FqTOd	dis not found

	.word 0xa190200e  ! 764: WRPR_GL_I	wrpr	%r0, 0x000e, %-
mondo_1_349:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d924002  ! 765: WRPR_WSTATE_R	wrpr	%r9, %r2, %wstate
	.word 0xd327ed48  ! 766: STF_I	st	%f9, [0x0d48, %r31]
	.word 0xd2c80e80  ! 767: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 768: LDX_R	ldx	[%r31 + %r0], %r9
DS_1_350:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 769: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd257ed48  ! 770: LDSH_I	ldsh	[%r31 + 0x0d48], %r9
	.word 0xd28fe010  ! 771: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r9
DS_1_351:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x95b08302  ! 772: ALIGNADDRESS	alignaddr	%r2, %r2, %r10
	.word 0xab84c011  ! 773: WR_CLEAR_SOFTINT_R	wr	%r19, %r17, %clear_softint
	.word 0xe457c000  ! 774: LDSH_R	ldsh	[%r31 + %r0], %r18
intveclr_1_352:
	setx 0xf1daa629ba60ff98, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 775: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_353:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d95000c  ! 776: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
mondo_1_354:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d940013  ! 777: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
	.word 0xe41fc000  ! 778: LDD_R	ldd	[%r31 + %r0], %r18
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 779: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01967  ! 780: FqTOd	dis not found

	.word 0xd037ed48  ! 781: STH_I	sth	%r8, [%r31 + 0x0d48]
splash_lsu_1_356:
	setx 0xd4f0abf0b2965273, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 782: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_1_357:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 783: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xd11fed48  ! 784: LDDF_I	ldd	[%r31, 0x0d48], %f8
debug_1_358:
	nop
	setx debug_1_358 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 785: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_1_359:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe110c003  ! 1: LDQF_R	-	[%r3, %r3], %f16
	.word 0x95a08821  ! 786: FADDs	fadds	%f2, %f1, %f10
splash_cmpr_1_360:
	setx 0x8065ed170f3ea745, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 787: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 788: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 789: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01973  ! 790: FqTOd	dis not found

	.word 0x8d902666  ! 791: WRPR_PSTATE_I	wrpr	%r0, 0x0666, %pstate
	.word 0xe68008a0  ! 792: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
splash_cmpr_1_362:
	setx 0x9cc7d52856f4a0b4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 793: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xe0c11b695acf56f0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_363:
	.word 0x39400001  ! 794: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 795: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x20700001  ! 796: BPN	<illegal instruction>
	.word 0xe67fed48  ! 797: SWAP_I	swap	%r19, [%r31 + 0x0d48]
	.word 0x8d902a69  ! 798: WRPR_PSTATE_I	wrpr	%r0, 0x0a69, %pstate
change_to_randtl_1_364:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_364:
	.word 0x8f902000  ! 799: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 800: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe677c007  ! 801: STX_R	stx	%r19, [%r31 + %r7]
	.word 0xe6c7e010  ! 802: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r19
splash_htba_1_365:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 803: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_1_366:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d950005  ! 804: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	setx ivw_1_367, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_367:
	.word 0x97a00160  ! 805: FABSq	dis not found

	.word 0x879021c8  ! 806: WRPR_TT_I	wrpr	%r0, 0x01c8, %tt
	.word 0x91d020b3  ! 807: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x9350c000  ! 808: RDPR_TT	<illegal instruction>
	.word 0x8d90330a  ! 809: WRPR_PSTATE_I	wrpr	%r0, 0x130a, %pstate
	.word 0x879023d9  ! 810: WRPR_TT_I	wrpr	%r0, 0x03d9, %tt
	.word 0xe4800b40  ! 811: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r18
	.word 0xe537ed48  ! 812: STQF_I	-	%f18, [0x0d48, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 813: LDX_R	ldx	[%r31 + %r0], %r18
mondo_1_368:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d950000  ! 814: WRPR_WSTATE_R	wrpr	%r20, %r0, %wstate
	setx 0x8b3de3012624872d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_369:
	.word 0x39400001  ! 815: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_370:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d928012  ! 816: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
tagged_1_371:
	taddcctv %r24, 0x110c, %r19
	.word 0xe407ed48  ! 817: LDUW_I	lduw	[%r31 + 0x0d48], %r18
splash_cmpr_1_372:
	setx 0x97e40d426d003ee7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 818: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_373:
	nop
	setx debug_1_373 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 819: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 820: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe48804a0  ! 821: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
mondo_1_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d950005  ! 822: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	.word 0x93a30dd0  ! 823: FdMULq	fdmulq	
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 824: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9025e4  ! 825: WRPR_PSTATE_I	wrpr	%r0, 0x05e4, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 826: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4dfe030  ! 827: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
	.word 0xab834011  ! 828: WR_CLEAR_SOFTINT_R	wr	%r13, %r17, %clear_softint
	.word 0xd46fed48  ! 829: LDSTUB_I	ldstub	%r10, [%r31 + 0x0d48]
	setx 0x8754681e83badb61, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_375:
	.word 0x39400001  ! 830: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_1_376:
	nop
	setx debug_1_376 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 831: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87902193  ! 832: WRPR_TT_I	wrpr	%r0, 0x0193, %tt
	setx ivw_1_377, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_377:
	.word 0x91a00174  ! 833: FABSq	dis not found

	.word 0x93540000  ! 834: RDPR_GL	<illegal instruction>
	.word 0xd73fed48  ! 835: STDF_I	std	%f11, [0x0d48, %r31]
	.word 0xa1902005  ! 836: WRPR_GL_I	wrpr	%r0, 0x0005, %-
DS_1_378:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xe77fddc3	! Random illegal ?
	.word 0xa1a00542  ! 1: FSQRTd	fsqrt	
	.word 0x95a00822  ! 837: FADDs	fadds	%f0, %f2, %f10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 838: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd69004a0  ! 839: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0x93902007  ! 840: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
debug_1_379:
	nop
	setx debug_1_379 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 841: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_1_380:
	setx 0xb96a2d89068d78ed, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 842: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_1_381:
	setx 0x4c11cf0bc5cfae13, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 843: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 844: RDPR_TICK	rdpr	%tick, %r0
	setx ivw_1_382, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_382:
	.word 0x9ba00161  ! 845: FABSq	dis not found

	.word 0xd89004a0  ! 846: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0xd91fc000  ! 847: LDDF_R	ldd	[%r31, %r0], %f12
change_to_randtl_1_383:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_383:
	.word 0x8f902003  ! 848: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd88008a0  ! 849: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_tba_1_384:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 850: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_1_385:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd9108012  ! 1: LDQF_R	-	[%r2, %r18], %f12
	.word 0x97a08831  ! 851: FADDs	fadds	%f2, %f17, %f11
debug_1_386:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 852: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99692ec7  ! 853: SDIVX_I	sdivx	%r4, 0x0ec7, %r12
	.word 0xe647f42d  ! 854: LDSW_I	ldsw	[%r31 + 0xfffff42d], %r19
	.word 0xe717c000  ! 855: LDQF_R	-	[%r31, %r0], %f19
	.word 0x87802004  ! 856: WRASI_I	wr	%r0, 0x0004, %asi
intveclr_1_388:
	setx 0x6babe4e76a9cd1b3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 857: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_1_389:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe5348010  ! 1: STQF_R	-	%f18, [%r16, %r18]
	normalw
	.word 0x97458000  ! 858: RD_SOFTINT_REG	rd	%softint, %r11
debug_1_390:
	nop
	setx debug_1_390 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 859: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d90362e  ! 860: WRPR_PSTATE_I	wrpr	%r0, 0x162e, %pstate
	.word 0xad80f3ec  ! 861: WR_SOFTINT_REG_I	wr	%r3, 0x13ec, %softint
splash_cmpr_1_391:
	setx 0x0ec299aa41f406db, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 862: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_392:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xc5709e7b	! Random illegal ?
	.word 0xe511c001  ! 1: LDQF_R	-	[%r7, %r1], %f18
	.word 0xa5a08824  ! 863: FADDs	fadds	%f2, %f4, %f18
	.word 0xd88804a0  ! 864: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
splash_cmpr_1_393:
	setx 0xcdd9e6dc93c03b90, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 865: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_394:
	nop
	setx debug_1_394 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 866: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd8d004a0  ! 867: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0xa5480000  ! 868: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	setx 0x0d2dae2884db5101, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_395:
	.word 0x39400001  ! 869: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa6d80009  ! 870: SMULcc_R	smulcc 	%r0, %r9, %r19
	.word 0xa1902008  ! 871: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_lsu_1_396:
	setx 0x807d325a7e61fbc3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 872: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_1_397:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_397:
	.word 0x8f902002  ! 873: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe63ff1d4  ! 874: STD_I	std	%r19, [%r31 + 0xfffff1d4]
splash_cmpr_1_398:
	setx 0x401db102870ac8ca, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 875: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_399:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb318011  ! 1: STQF_R	-	%f13, [%r17, %r6]
	normalw
	.word 0xa3458000  ! 876: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x93902006  ! 877: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa1902009  ! 878: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 879: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902052  ! 880: WRPR_TT_I	wrpr	%r0, 0x0052, %tt
splash_cmpr_1_400:
	setx 0x80acf4ece3dd3894, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 881: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02033  ! 882: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x22700001  ! 883: BPE	<illegal instruction>
	.word 0xe317c000  ! 884: LDQF_R	-	[%r31, %r0], %f17
	.word 0x8d90242c  ! 885: WRPR_PSTATE_I	wrpr	%r0, 0x042c, %pstate
splash_cmpr_1_401:
	setx 0x82eaa3408626ed95, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 886: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe2d004a0  ! 887: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
splash_lsu_1_402:
	setx 0x976f5d2d460c9e4f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 888: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_1_403:
	setx 0x2b6044579b7ad879, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 889: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 890: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1a489d2  ! 891: FDIVd	fdivd	%f18, %f18, %f16
DS_1_404:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd930c004  ! 1: STQF_R	-	%f12, [%r4, %r3]
	normalw
	.word 0x95458000  ! 892: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x8d902eb8  ! 893: WRPR_PSTATE_I	wrpr	%r0, 0x0eb8, %pstate
	.word 0x8d9024b0  ! 894: WRPR_PSTATE_I	wrpr	%r0, 0x04b0, %pstate
	.word 0x8d902a8a  ! 895: WRPR_PSTATE_I	wrpr	%r0, 0x0a8a, %pstate
splash_cmpr_1_405:
	setx 0xbc61ace46747b76c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 896: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2a800001  ! 897: BCS	bcs,a	<label_0x1>
splash_cmpr_1_406:
	setx 0xc3cfb52086fe6195, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 898: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_407:
	setx 0x74692f341efd8c4f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 899: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_408)) -> intp(7,0,9)
intvec_1_408:
	.word 0x39400001  ! 900: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_409:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d94c000  ! 901: WRPR_WSTATE_R	wrpr	%r19, %r0, %wstate
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 902: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 903: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01974  ! 904: FqTOd	dis not found

pmu_1_411:
	nop
	setx 0xfffff403fffff3da, %g1, %g7
	.word 0xa3800007  ! 905: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_1_412:
	setx 0x3b0039e379daebf4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 906: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9745c000  ! 907: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0xd86ff1d4  ! 908: LDSTUB_I	ldstub	%r12, [%r31 + 0xfffff1d4]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 909: LDX_R	ldx	[%r31 + %r0], %r12
tagged_1_413:
	taddcctv %r16, 0x1ef8, %r26
	.word 0xd807f1d4  ! 910: LDUW_I	lduw	[%r31 + 0xfffff1d4], %r12
DS_1_414:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe93277ab  ! 1: STQF_I	-	%f20, [0x17ab, %r9]
	normalw
	.word 0x93458000  ! 911: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8d802000  ! 912: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02035  ! 913: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87902038  ! 914: WRPR_TT_I	wrpr	%r0, 0x0038, %tt
	.word 0x91d02035  ! 915: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_1_415:
	setx 0x8f58195241bcac12, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 916: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_416:
	setx 0x0a7bb40cf1fd7d0f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 917: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_417:
	nop
	setx debug_1_417 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 918: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx ivw_1_418, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_418:
	.word 0x91a00167  ! 919: FABSq	dis not found

	.word 0x93902007  ! 920: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
debug_1_419:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 921: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd397ea29  ! 922: LDQFA_I	-	[%r31, 0x0a29], %f9
	.word 0x879023ba  ! 923: WRPR_TT_I	wrpr	%r0, 0x03ba, %tt
	.word 0xd33fc012  ! 924: STDF_R	std	%f9, [%r18, %r31]
	.word 0xa1902006  ! 925: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa1902007  ! 926: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xd25fea29  ! 927: LDX_I	ldx	[%r31 + 0x0a29], %r9
	setx ivw_1_420, %r11, %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_420:
	.word 0xa9a0016c  ! 928: FABSq	dis not found

	.word 0xdac7e030  ! 929: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01964  ! 930: FqTOd	dis not found

intveclr_1_422:
	setx 0xec0f01690540f239, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 931: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_423:
	nop
	setx debug_1_423 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 932: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x819822bc  ! 933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02bc, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 934: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_1_424:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d924010  ! 935: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
	.word 0xd21fc000  ! 936: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01967  ! 937: FqTOd	dis not found

mondo_1_426:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d924001  ! 938: WRPR_WSTATE_R	wrpr	%r9, %r1, %wstate
	.word 0x87802020  ! 939: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x93902003  ! 940: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd43fc00d  ! 941: STD_R	std	%r10, [%r31 + %r13]
	.word 0xd48fe030  ! 942: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
	.word 0x96dcc013  ! 943: SMULcc_R	smulcc 	%r19, %r19, %r11
	.word 0xd00fc000  ! 944: LDUB_R	ldub	[%r31 + %r0], %r8
	.word 0x93902004  ! 945: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
donret_1_427:
	nop
	setx donretarg_1_427, %r11, %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
	stxa %r0, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_427:
	.word 0xd0ffea29  ! 946: SWAPA_I	swapa	%r8, [%r31 + 0x0a29] %asi
DS_1_428:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 947: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd09fc020  ! 948: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
splash_lsu_1_429:
	setx 0x3a8db4fa0e7ff6e1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 949: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 950: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xd0d7e010  ! 951: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
splash_lsu_1_430:
	setx 0x2e417432f7d0304d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 952: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 953: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01963  ! 954: FqTOd	dis not found

	.word 0x93902004  ! 955: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa1902003  ! 956: WRPR_GL_I	wrpr	%r0, 0x0003, %-
debug_1_432:
	nop
	setx debug_1_432 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 957: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_1_433:
	setx 0x61bf00ca274e7167, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 958: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_1_434:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd131800d  ! 1: STQF_R	-	%f8, [%r13, %r6]
	normalw
	.word 0x97458000  ! 959: RD_SOFTINT_REG	rd	%softint, %r11
splash_htba_1_435:
	set 0x003b0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 960: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x9f8032f0  ! 961: SIR	sir	0x12f0
	.word 0xd6800bc0  ! 962: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r11
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 963: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_1_436:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_436:
	.word 0x8f902002  ! 964: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x99902004  ! 965: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
splash_cmpr_1_437:
	setx 0x433099a85d37c98d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 966: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790238b  ! 967: WRPR_TT_I	wrpr	%r0, 0x038b, %tt
splash_lsu_1_438:
	setx 0x86982d7eb55d1047, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_439:
	setx 0x21b40edfe6155926, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 969: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902c64  ! 970: WRPR_PSTATE_I	wrpr	%r0, 0x0c64, %pstate
	.word 0xd61fc000  ! 971: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd657c000  ! 972: LDSH_R	ldsh	[%r31 + %r0], %r11
change_to_randtl_1_440:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_440:
	.word 0x8f902002  ! 973: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d902526  ! 974: WRPR_PSTATE_I	wrpr	%r0, 0x0526, %pstate
splash_cmpr_1_441:
	setx 0x44c93efc819b35e4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 975: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790218c  ! 976: WRPR_TT_I	wrpr	%r0, 0x018c, %tt
	.word 0xa7480000  ! 977: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
debug_1_442:
	nop
	setx debug_1_442 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 978: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_1_443:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 979: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d9034be  ! 980: WRPR_PSTATE_I	wrpr	%r0, 0x14be, %pstate
tagged_1_444:
	tsubcctv %r1, 0x1611, %r13
	.word 0xe407ec60  ! 981: LDUW_I	lduw	[%r31 + 0x0c60], %r18
	.word 0x87802014  ! 982: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93902003  ! 983: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe41fc000  ! 984: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x81510000  ! 985: RDPR_TICK	rdpr	%tick, %r0
	.word 0x93d02034  ! 986: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xe48008a0  ! 987: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
splash_tba_1_445:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 988: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_1_446:
	setx 0x76839d2c432fb8db, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 989: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_447:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d91c013  ! 990: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
change_to_randtl_1_448:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_448:
	.word 0x8f902001  ! 991: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902003  ! 992: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93480000  ! 993: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x8d802000  ! 994: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa9814007  ! 995: WR_SET_SOFTINT_R	wr	%r5, %r7, %set_softint
debug_1_449:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 996: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_1_450:
	setx 0x39c59b119e305071, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 997: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd28fe010  ! 998: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r9
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
mondo_0_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d940004  ! 1: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
	.word 0x8d903d7b  ! 2: WRPR_PSTATE_I	wrpr	%r0, 0x1d7b, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 3: LDX_R	ldx	[%r31 + %r0], %r13
	setx 0xb7371303e68c325d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_1:
	.word 0x39400001  ! 4: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976820e3  ! 5: SDIVX_I	sdivx	%r0, 0x00e3, %r11
	.word 0xab834012  ! 6: WR_CLEAR_SOFTINT_R	wr	%r13, %r18, %clear_softint
splash_cmpr_0_3:
	setx 0x95bc6e06ed3750ad, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780204f  ! 8: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8d9020cb  ! 9: WRPR_PSTATE_I	wrpr	%r0, 0x00cb, %pstate
	.word 0xd637e0e3  ! 10: STH_I	sth	%r11, [%r31 + 0x00e3]
	.word 0xd68008a0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_0_4:
	setx 0x5866626024cedfef, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 12: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_0_5:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 13: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_0_6:
	setx 0x45554336af689655, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 14: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6800b80  ! 15: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r11
DS_0_7:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f18, %f12, %f0
	.word 0xa1b00311  ! 16: ALIGNADDRESS	alignaddr	%r0, %r17, %r16
	.word 0x81982594  ! 17: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0594, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01970  ! 18: FqTOd	dis not found

	.word 0xd797e0e3  ! 19: LDQFA_I	-	[%r31, 0x00e3], %f11
	.word 0xa8d20006  ! 20: UMULcc_R	umulcc 	%r8, %r6, %r20
tagged_0_9:
	taddcctv %r13, 0x13a3, %r2
	.word 0xe807e0e3  ! 21: LDUW_I	lduw	[%r31 + 0x00e3], %r20
	.word 0x91d02033  ! 22: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe89fc020  ! 23: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
cmp_0_10:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r17, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x60]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa5a00172  ! 24: FABSq	dis not found

	.word 0xe49fc020  ! 25: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
	.word 0x81982a6c  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a6c, %hpstate
	.word 0xa950c000  ! 27: RDPR_TT	<illegal instruction>
cmp_0_11:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r2, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x68]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa9a00172  ! 28: FABSq	dis not found

	.word 0x879021a3  ! 29: WRPR_TT_I	wrpr	%r0, 0x01a3, %tt
mondo_0_12:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d91c000  ! 30: WRPR_WSTATE_R	wrpr	%r7, %r0, %wstate
	.word 0xa5a309d2  ! 31: FDIVd	fdivd	%f12, %f18, %f18
	.word 0x9f803e6a  ! 32: SIR	sir	0x1e6a
	.word 0xe41fc000  ! 33: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x36700001  ! 34: BPGE	<illegal instruction>
donret_0_13:
	nop
	setx donretarg_0_13, %r11, %r12
	stxa %r23, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_13:
	.word 0xe4fffe6a  ! 35: SWAPA_I	swapa	%r18, [%r31 + 0xfffffe6a] %asi
DS_0_14:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0x8f4304ad	! Random illegal ?
	.word 0xe3140013  ! 1: LDQF_R	-	[%r16, %r19], %f17
	.word 0xa3a48828  ! 36: FADDs	fadds	%f18, %f8, %f17
	.word 0xa4c37666  ! 37: ADDCcc_I	addccc 	%r13, 0xfffff666, %r18
	.word 0xe517c000  ! 38: LDQF_R	-	[%r31, %r0], %f18
splash_cmpr_0_15:
	setx 0xa8d6b26f88389f6d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 39: WR_STICK_REG_R	wr	%r0, %r1, %-
cmp_0_16:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r12, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x60]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x95a00166  ! 40: FABSq	dis not found

	.word 0xd49fc020  ! 41: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
splash_cmpr_0_17:
	setx 0x208f5bbb1c3c732d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 42: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f803a5d  ! 43: SIR	sir	0x1a5d
	.word 0x94dcc010  ! 44: SMULcc_R	smulcc 	%r19, %r16, %r10
splash_lsu_0_18:
	setx 0xef2a4b35e0f04c77, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 45: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 46: RD_STICK_REG	stbar
	.word 0x93902000  ! 47: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x3a700001  ! 48: BPCC	<illegal instruction>
	.word 0xd48008a0  ! 49: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01974  ! 50: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01967  ! 51: FqTOd	dis not found

	setx 0xad45e445faf581a9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_21:
	.word 0x39400001  ! 52: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe207c000  ! 53: LDUW_R	lduw	[%r31 + %r0], %r17
	.word 0xe337fa5d  ! 54: STQF_I	-	%f17, [0x1a5d, %r31]
splash_cmpr_0_22:
	setx 0x1e2f22602ac8ba49, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_23:
	setx 0x44a9ca848e9e5b51, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 56: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe21ffa5d  ! 57: LDD_I	ldd	[%r31 + 0xfffffa5d], %r17
splash_cmpr_0_24:
	setx 0xf0a7e30257c43575, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_0_25:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 59: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe2c004a0  ! 60: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r17
	.word 0x93902003  ! 61: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_cmpr_0_26:
	setx 0x67efbace81c73350, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_27:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd7144012  ! 1: LDQF_R	-	[%r17, %r18], %f11
	.word 0xa9a1c82a  ! 63: FADDs	fadds	%f7, %f10, %f20
	.word 0xa7500000  ! 64: RDPR_TPC	<illegal instruction>
	.word 0xe6900e40  ! 65: LDUHA_R	lduha	[%r0, %r0] 0x72, %r19
donret_0_28:
	nop
	setx donretarg_0_28, %r11, %r12
	stxa %r1, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_28:
	.word 0xe6fffa5d  ! 66: SWAPA_I	swapa	%r19, [%r31 + 0xfffffa5d] %asi
debug_0_29:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 67: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_30:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 68: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
change_to_randtl_0_31:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_31:
	.word 0x8f902002  ! 69: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_32)) -> intp(0,1,3)
xir_0_32:
	.word 0xa984f96f  ! 70: WR_SET_SOFTINT_I	wr	%r19, 0x196f, %set_softint
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 71: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902004  ! 72: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
mondo_0_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d950009  ! 73: WRPR_WSTATE_R	wrpr	%r20, %r9, %wstate
	.word 0xa1450000  ! 74: RD_SET_SOFTINT	rd	%set_softint, %r16
	.word 0x9481bcdf  ! 75: ADDcc_I	addcc 	%r6, 0xfffffcdf, %r10
mondo_0_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d900012  ! 76: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
	.word 0x81982dbe  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dbe, %hpstate
	.word 0xd527fcdf  ! 78: STF_I	st	%f10, [0x1cdf, %r31]
	.word 0xd597fcdf  ! 79: LDQFA_I	-	[%r31, 0x1cdf], %f10
tagged_0_35:
	taddcctv %r25, 0x14cc, %r21
	.word 0xd407fcdf  ! 80: LDUW_I	lduw	[%r31 + 0xfffffcdf], %r10
	.word 0x97500000  ! 81: RDPR_TPC	rdpr	%tpc, %r11
intveclr_0_36:
	setx 0xec6af7b7ff2f9eb9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 82: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd66ffcdf  ! 84: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffffcdf]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9168ec7e  ! 85: SDIVX_I	sdivx	%r3, 0x0c7e, %r8
intveclr_0_38:
	setx 0x3556c0414876640d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d908013  ! 87: WRPR_WSTATE_R	wrpr	%r2, %r19, %wstate
	.word 0x2e700001  ! 88: BPVS	<illegal instruction>
debug_0_40:
	nop
	setx debug_0_40 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 89: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 90: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81982f05  ! 91: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f05, %hpstate
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 92: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cmp_0_42:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r17, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x60]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x97a00173  ! 93: FABSq	dis not found

	.word 0xd647ec7e  ! 94: LDSW_I	ldsw	[%r31 + 0x0c7e], %r11
	.word 0x2a800001  ! 95: BCS	bcs,a	<label_0x1>
	.word 0xd6d80e40  ! 96: LDXA_R	ldxa	[%r0, %r0] 0x72, %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_43)) -> intp(0,1,3)
xir_0_43:
	.word 0xa982ba49  ! 97: WR_SET_SOFTINT_I	wr	%r10, 0x1a49, %set_softint
	.word 0x8d903a94  ! 98: WRPR_PSTATE_I	wrpr	%r0, 0x1a94, %pstate
mondo_0_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d90c013  ! 99: WRPR_WSTATE_R	wrpr	%r3, %r19, %wstate
	.word 0x91d020b3  ! 100: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x879022c0  ! 101: WRPR_TT_I	wrpr	%r0, 0x02c0, %tt
debug_0_45:
	nop
	setx debug_0_45 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 102: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd71fc000  ! 103: LDDF_R	ldd	[%r31, %r0], %f11
DS_0_46:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 104: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd69004a0  ! 105: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0xd69ffa49  ! 106: LDDA_I	ldda	[%r31, + 0xfffffa49] %asi, %r11
	.word 0x879023fb  ! 107: WRPR_TT_I	wrpr	%r0, 0x03fb, %tt
	.word 0x93450000  ! 108: RD_SET_SOFTINT	rd	%set_softint, %r9
debug_0_47:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 109: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81982797  ! 110: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0797, %hpstate
	.word 0x95a189c8  ! 111: FDIVd	fdivd	%f6, %f8, %f10
debug_0_48:
	nop
	setx debug_0_48 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 112: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802063  ! 113: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x81982d05  ! 114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d05, %hpstate
	.word 0x819824bc  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04bc, %hpstate
intveclr_0_49:
	setx 0x3949e4e8694ff043, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 116: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802063  ! 117: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x906b3324  ! 118: UDIVX_I	udivx 	%r12, 0xfffff324, %r8
	.word 0xd08008a0  ! 119: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
tagged_0_50:
	tsubcctv %r16, 0x1f7a, %r17
	.word 0xd007f324  ! 120: LDUW_I	lduw	[%r31 + 0xfffff324], %r8
	.word 0xa1902008  ! 121: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_tba_0_51:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 122: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_0_52:
	nop
	setx debug_0_52 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 123: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902003  ! 124: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01962  ! 125: FqTOd	dis not found

debug_0_54:
	nop
	setx debug_0_54 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 126: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902002  ! 127: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
change_to_randtl_0_55:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_55:
	.word 0x8f902003  ! 128: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
intveclr_0_56:
	setx 0x1116b308d4b81085, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_57:
	setx 0xd8c35f5225da6c66, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 130: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_58:
	setx 0x6853c7a631297e78, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 131: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 132: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x819823a7  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03a7, %hpstate
intveclr_0_59:
	setx 0x64adf008b9e0e463, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 134: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd66ff324  ! 135: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff324]
	.word 0xd627f324  ! 136: STW_I	stw	%r11, [%r31 + 0xfffff324]
	.word 0xd69fc020  ! 137: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
debug_0_60:
	nop
	setx debug_0_60 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 138: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_61:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d940005  ! 139: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
	.word 0xd677f324  ! 140: STX_I	stx	%r11, [%r31 + 0xfffff324]
	.word 0x8d90362f  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x162f, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_62)) -> intp(5,0,12)
intvec_0_62:
	.word 0x39400001  ! 142: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8198253d  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x053d, %hpstate
	setx 0x4bdac0f0fa1cd330, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_63:
	.word 0x39400001  ! 144: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d934014  ! 145: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
splash_lsu_0_65:
	setx 0xd245c08db3e660cb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 146: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 147: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
mondo_0_66:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d948003  ! 148: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
DS_0_67:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 149: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
DS_0_68:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f28, %f14, %f10
	.word 0x97b08306  ! 150: ALIGNADDRESS	alignaddr	%r2, %r6, %r11
intveclr_0_69:
	setx 0xb8796f1b392ccc93, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 151: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd657f324  ! 152: LDSH_I	ldsh	[%r31 + 0xfffff324], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 153: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd727c006  ! 154: STF_R	st	%f11, [%r6, %r31]
	.word 0x91d02035  ! 155: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa980800a  ! 156: WR_SET_SOFTINT_R	wr	%r2, %r10, %set_softint
debug_0_70:
	nop
	setx debug_0_70 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 157: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 158: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x93902001  ! 159: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x95a209d3  ! 160: FDIVd	fdivd	%f8, %f50, %f10
DS_0_71:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f14, %f16, %f14
	.word 0x9bb44308  ! 161: ALIGNADDRESS	alignaddr	%r17, %r8, %r13
donret_0_72:
	nop
	setx donretarg_0_72, %r11, %r12
	stxa %r17, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_72:
	.word 0xdafff324  ! 162: SWAPA_I	swapa	%r13, [%r31 + 0xfffff324] %asi
debug_0_73:
	nop
	setx debug_0_73 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_0_74:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 164: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902005  ! 165: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x95500000  ! 166: RDPR_TPC	<illegal instruction>
	.word 0x8d902145  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x0145, %pstate
splash_cmpr_0_75:
	setx 0x1b6e001ddcd4e700, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 168: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902003  ! 169: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_0_76:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb314000  ! 1: STQF_R	-	%f13, [%r0, %r5]
	normalw
	.word 0x91458000  ! 170: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x87902326  ! 171: WRPR_TT_I	wrpr	%r0, 0x0326, %tt
splash_cmpr_0_77:
	setx 0xd8888a3f67543922, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02034  ! 173: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902001  ! 174: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
cmp_0_78:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r2, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x60]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa7a00170  ! 175: FABSq	dis not found

splash_cmpr_0_79:
	setx 0xb1fe404f69595363, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 176: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_80:
	setx 0x5170f733ed429142, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe7e7c030  ! 178: CASA_I	casa	[%r31] 0x 1, %r16, %r19
intveclr_0_81:
	setx 0x71aaaa8914699a66, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 179: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa190200f  ! 180: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xe727c010  ! 181: STF_R	st	%f19, [%r16, %r31]
	.word 0xe68008a0  ! 182: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x81b01021  ! 183: SIAM	siam	1
	.word 0xa1902005  ! 184: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xe61fc000  ! 185: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x2c800001  ! 186: BNEG	bneg,a	<label_0x1>
	.word 0x20800001  ! 187: BN	bn,a	<label_0x1>
	.word 0xe69ff324  ! 188: LDDA_I	ldda	[%r31, + 0xfffff324] %asi, %r19
splash_cmpr_0_82:
	setx 0x307864bd4cc146d3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 189: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe67ff324  ! 190: SWAP_I	swap	%r19, [%r31 + 0xfffff324]
	setx 0xee61accadbaaa945, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_83:
	.word 0x39400001  ! 191: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
mondo_0_84:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d94c007  ! 193: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
DS_0_85:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 194: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe6bff324  ! 195: STDA_I	stda	%r19, [%r31 + 0xfffff324] %asi
mondo_0_86:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d91c012  ! 196: WRPR_WSTATE_R	wrpr	%r7, %r18, %wstate
change_to_randtl_0_87:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_87:
	.word 0x8f902003  ! 197: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01967  ! 198: FqTOd	dis not found

donret_0_89:
	nop
	setx donretarg_0_89, %r11, %r12
	stxa %r23, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_89:
	.word 0xe6fff324  ! 199: SWAPA_I	swapa	%r19, [%r31 + 0xfffff324] %asi
change_to_randtl_0_90:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_90:
	.word 0x8f902000  ! 200: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 201: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 202: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_0_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d904012  ! 203: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
	.word 0x38700001  ! 204: BPGU	<illegal instruction>
	.word 0x8198240f  ! 205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040f, %hpstate
	.word 0xe797f324  ! 206: LDQFA_I	-	[%r31, 0x1324], %f19
	.word 0x38800001  ! 207: BGU	bgu,a	<label_0x1>
splash_tba_0_92:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 208: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x819822ad  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02ad, %hpstate
	.word 0x9f803c1f  ! 210: SIR	sir	0x1c1f
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01970  ! 211: FqTOd	dis not found

	.word 0xe717c000  ! 212: LDQF_R	-	[%r31, %r0], %f19
	.word 0x81460000  ! 213: RD_STICK_REG	stbar
	.word 0xe6dfe030  ! 214: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r19
	.word 0xa1902004  ! 215: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_cmpr_0_94:
	setx 0xde96cad68db1bbda, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902b76  ! 217: WRPR_PSTATE_I	wrpr	%r0, 0x0b76, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01974  ! 218: FqTOd	dis not found

debug_0_96:
	nop
	setx debug_0_96 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 219: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_97:
	setx 0xb52b4d7ff98f4ea0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 220: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd06ffc1f  ! 221: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffc1f]
	.word 0xd0d7e020  ! 222: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
tagged_0_98:
	tsubcctv %r11, 0x14ed, %r18
	.word 0xd007fc1f  ! 223: LDUW_I	lduw	[%r31 + 0xfffffc1f], %r8
	.word 0x93a089c0  ! 224: FDIVd	fdivd	%f2, %f0, %f40
mondo_0_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d944008  ! 225: WRPR_WSTATE_R	wrpr	%r17, %r8, %wstate
splash_cmpr_0_100:
	setx 0x98637d60fe6e6d99, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 226: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802ed1  ! 227: SIR	sir	0x0ed1
	.word 0xa190200b  ! 228: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8790235a  ! 229: WRPR_TT_I	wrpr	%r0, 0x035a, %tt
donret_0_101:
	nop
	setx donretarg_0_101, %r11, %r12
	stxa %r17, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_101:
	.word 0xd2ffeed1  ! 230: SWAPA_I	swapa	%r9, [%r31 + 0x0ed1] %asi
change_to_randtl_0_102:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_102:
	.word 0x8f902000  ! 231: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_103)) -> intp(0,1,3)
xir_0_103:
	.word 0xa9847eae  ! 232: WR_SET_SOFTINT_I	wr	%r17, 0x1eae, %set_softint
	.word 0xd20fc000  ! 233: LDUB_R	ldub	[%r31 + %r0], %r9
debug_0_104:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 234: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd207c000  ! 235: LDUW_R	lduw	[%r31 + %r0], %r9
change_to_randtl_0_105:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_105:
	.word 0x8f902003  ! 236: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
intveclr_0_106:
	setx 0xed4bfbc4092d01d7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 237: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d908003  ! 238: WRPR_WSTATE_R	wrpr	%r2, %r3, %wstate
splash_tba_0_108:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 239: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd29ffeae  ! 240: LDDA_I	ldda	[%r31, + 0xfffffeae] %asi, %r9
	.word 0xd28804a0  ! 241: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
DS_0_109:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd712400c  ! 1: LDQF_R	-	[%r9, %r12], %f11
	.word 0x97a18828  ! 242: FADDs	fadds	%f6, %f8, %f11
debug_0_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 243: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x3c800001  ! 244: BPOS	bpos,a	<label_0x1>
cmp_0_111:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r16, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x68]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x95a00164  ! 245: FABSq	dis not found

tagged_0_112:
	tsubcctv %r24, 0x1006, %r26
	.word 0xd407feae  ! 246: LDUW_I	lduw	[%r31 + 0xfffffeae], %r10
	.word 0xd407c000  ! 247: LDUW_R	lduw	[%r31 + %r0], %r10
debug_0_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 248: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 249: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 250: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_114:
	setx 0x044dd061abc820dd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 251: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 252: Tcc_I	ta	icc_or_xcc, %r0 + 181
DS_0_115:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 253: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xd47ffeae  ! 254: SWAP_I	swap	%r10, [%r31 + 0xfffffeae]
	.word 0xd537feae  ! 255: STQF_I	-	%f10, [0x1eae, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_116)) -> intp(5,0,3)
intvec_0_116:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x24800001  ! 257: BLE	ble,a	<label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 258: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1a089c8  ! 259: FDIVd	fdivd	%f2, %f8, %f16
splash_tba_0_117:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 260: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93d02034  ! 261: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x81982f4f  ! 262: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4f, %hpstate
change_to_randtl_0_118:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_118:
	.word 0x8f902000  ! 263: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 264: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xad853fec  ! 265: WR_SOFTINT_REG_I	wr	%r20, 0x1fec, %softint
	.word 0x96acc008  ! 266: ANDNcc_R	andncc 	%r19, %r8, %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_119)) -> intp(0,1,3)
xir_0_119:
	.word 0xa9847fcf  ! 267: WR_SET_SOFTINT_I	wr	%r17, 0x1fcf, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_120)) -> intp(4,0,13)
intvec_0_120:
	.word 0x39400001  ! 268: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802063  ! 269: WRASI_I	wr	%r0, 0x0063, %asi
splash_cmpr_0_121:
	setx 0x50820dfd1dd51c1d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 270: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa8fd0011  ! 271: SDIVcc_R	sdivcc 	%r20, %r17, %r20
	.word 0xe807c000  ! 272: LDUW_R	lduw	[%r31 + %r0], %r20
cmp_0_122:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r19, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x60]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x95a00160  ! 273: FABSq	dis not found

mondo_0_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d950003  ! 274: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
splash_cmpr_0_124:
	setx 0x44d7ebc9b9ab61c9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 275: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 276: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xa84c4007  ! 277: MULX_R	mulx 	%r17, %r7, %r20
splash_cmpr_0_125:
	setx 0xd69efc651a93dbf1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97480000  ! 279: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
debug_0_126:
	nop
	setx debug_0_126 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 280: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x28700001  ! 281: BPLEU	<illegal instruction>
	.word 0x93902006  ! 282: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87802014  ! 283: WRASI_I	wr	%r0, 0x0014, %asi
change_to_randtl_0_127:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_127:
	.word 0x8f902001  ! 284: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a0196b  ! 285: FqTOd	dis not found

	.word 0x87802063  ! 286: WRASI_I	wr	%r0, 0x0063, %asi
splash_cmpr_0_129:
	setx 0x23379c5e2cbf63d8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 287: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902051  ! 288: WRPR_TT_I	wrpr	%r0, 0x0051, %tt
	.word 0xa9a01a68  ! 289: FqTOi	fqtoi	
	.word 0xe81fffcf  ! 290: LDD_I	ldd	[%r31 + 0xffffffcf], %r20
	.word 0xe8800c40  ! 291: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r20
splash_cmpr_0_130:
	setx 0xebe5a9d6cf21ff4f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 292: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe93fc008  ! 293: STDF_R	std	%f20, [%r8, %r31]
	.word 0x879020bc  ! 294: WRPR_TT_I	wrpr	%r0, 0x00bc, %tt
	.word 0xe857c000  ! 295: LDSH_R	ldsh	[%r31 + %r0], %r20
	.word 0x3e800001  ! 296: BVC	bvc,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 297: LDX_R	ldx	[%r31 + %r0], %r20
DS_0_131:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 298: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
cmp_0_132:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r17, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x60]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x97a00170  ! 299: FABSq	dis not found

	.word 0x9f80248d  ! 300: SIR	sir	0x048d
	.word 0x92dc8002  ! 301: SMULcc_R	smulcc 	%r18, %r2, %r9
	.word 0x87802089  ! 302: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x9f8035df  ! 303: SIR	sir	0x15df
	.word 0xd28008a0  ! 304: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd2800a80  ! 305: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r9
splash_lsu_0_133:
	setx 0xf1c343ef0d2c9539, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 306: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_134:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 307: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x91d02035  ! 308: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_tba_0_135:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 309: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd27ff5df  ! 310: SWAP_I	swap	%r9, [%r31 + 0xfffff5df]
debug_0_136:
	nop
	setx debug_0_136 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 311: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_137:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 312: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd2d804a0  ! 313: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0xd2c00e80  ! 314: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56cfc24  ! 315: SDIVX_I	sdivx	%r19, 0xfffffc24, %r18
	.word 0x81982edf  ! 316: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edf, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r18
DS_0_139:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe730400c  ! 1: STQF_R	-	%f19, [%r12, %r1]
	normalw
	.word 0xa7458000  ! 318: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0xe607c000  ! 319: LDUW_R	lduw	[%r31 + %r0], %r19
mondo_0_140:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d930008  ! 320: WRPR_WSTATE_R	wrpr	%r12, %r8, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956a6557  ! 321: SDIVX_I	sdivx	%r9, 0x0557, %r10
	.word 0xd537c008  ! 322: STQF_R	-	%f10, [%r8, %r31]
	.word 0xab84c000  ! 323: WR_CLEAR_SOFTINT_R	wr	%r19, %r0, %clear_softint
	.word 0xd48008a0  ! 324: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa9840006  ! 325: WR_SET_SOFTINT_R	wr	%r16, %r6, %set_softint
mondo_0_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d924010  ! 326: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
	.word 0x81460000  ! 327: RD_STICK_REG	stbar
change_to_randtl_0_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_143:
	.word 0x8f902002  ! 328: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
change_to_randtl_0_144:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_144:
	.word 0x8f902000  ! 329: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902003  ! 330: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd4dfe000  ! 331: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
pmu_0_145:
	nop
	setx 0xfffffd56fffff2a8, %g1, %g7
	.word 0xa3800007  ! 332: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d802000  ! 333: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_0_146:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d928012  ! 334: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
intveclr_0_147:
	setx 0x8566d622892ee732, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 335: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802063  ! 336: WRASI_I	wr	%r0, 0x0063, %asi
splash_cmpr_0_148:
	setx 0xbf518913200681d3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02034  ! 338: Tcc_I	tne	icc_or_xcc, %r0 + 52
change_to_randtl_0_149:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_149:
	.word 0x8f902001  ! 339: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x2c800001  ! 340: BNEG	bneg,a	<label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976ca7a8  ! 341: SDIVX_I	sdivx	%r18, 0x07a8, %r11
debug_0_151:
	nop
	setx debug_0_151 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 342: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_0_152:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 343: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd647e7a8  ! 344: LDSW_I	ldsw	[%r31 + 0x07a8], %r11
	.word 0xa945c000  ! 345: RD_TICK_CMPR_REG	rd	%-, %r20
splash_tba_0_153:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 346: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f8037b0  ! 347: SIR	sir	0x17b0
	.word 0x91d020b3  ! 348: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x8d902a7b  ! 349: WRPR_PSTATE_I	wrpr	%r0, 0x0a7b, %pstate
	.word 0x87802004  ! 350: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x81982a74  ! 351: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a74, %hpstate
	.word 0x3a800001  ! 352: BCC	bcc,a	<label_0x1>
	.word 0xe88804a0  ! 353: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
splash_cmpr_0_154:
	setx 0x1c616759f380f64e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 354: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_155:
	setx 0xf698a143c95220c3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 355: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d914014  ! 356: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
	.word 0x36700001  ! 357: BPGE	<illegal instruction>
mondo_0_157:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d918001  ! 358: WRPR_WSTATE_R	wrpr	%r6, %r1, %wstate
DS_0_158:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f12, %f18, %f20
	.word 0x95b08312  ! 359: ALIGNADDRESS	alignaddr	%r2, %r18, %r10
cmp_0_159:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r11, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x68]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x93a0016a  ! 360: FABSq	dis not found

	.word 0xd26ff7b0  ! 361: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffff7b0]
splash_tba_0_160:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 362: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93a209c0  ! 363: FDIVd	fdivd	%f8, %f0, %f40
	.word 0xd28008a0  ! 364: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
debug_0_161:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 365: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_0_162:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_162:
	.word 0x8f902001  ! 366: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa06c8004  ! 367: UDIVX_R	udivx 	%r18, %r4, %r16
	.word 0x81982206  ! 368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0206, %hpstate
DS_0_163:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe132e67e  ! 1: STQF_I	-	%f16, [0x067e, %r11]
	normalw
	.word 0x9b458000  ! 369: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9368e8a9  ! 370: SDIVX_I	sdivx	%r3, 0x08a9, %r9
	.word 0xd2d00e40  ! 371: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r9
debug_0_165:
	nop
	setx debug_0_165 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 372: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d90400d  ! 373: WRPR_WSTATE_R	wrpr	%r1, %r13, %wstate
	.word 0x879022b8  ! 374: WRPR_TT_I	wrpr	%r0, 0x02b8, %tt
	.word 0x99902003  ! 375: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x28700001  ! 376: BPLEU	<illegal instruction>
	.word 0xa190200a  ! 377: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x87802055  ! 378: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xa68478ba  ! 379: ADDcc_I	addcc 	%r17, 0xfffff8ba, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 380: LDX_R	ldx	[%r31 + %r0], %r19
tagged_0_167:
	taddcctv %r9, 0x15b6, %r12
	.word 0xe607f8ba  ! 381: LDUW_I	lduw	[%r31 + 0xfffff8ba], %r19
	.word 0xe61fc000  ! 382: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x93902005  ! 383: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81982a75  ! 384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a75, %hpstate
	.word 0x26700001  ! 385: BPL	<illegal instruction>
mondo_0_168:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d94c009  ! 386: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
	.word 0x93902007  ! 387: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_cmpr_0_169:
	setx 0x3d795a18bd0a857e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 388: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d904014  ! 389: WRPR_WSTATE_R	wrpr	%r1, %r20, %wstate
mondo_0_171:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d94c003  ! 390: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
	.word 0xa1902001  ! 391: WRPR_GL_I	wrpr	%r0, 0x0001, %-
cmp_0_172:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r2, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x60]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x93a0016d  ! 392: FABSq	dis not found

	setx 0x611f840f9130e7eb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_173:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_174:
	setx 0x737e73612e89b949, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 394: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_175:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd7108006  ! 1: LDQF_R	-	[%r2, %r6], %f11
	.word 0x95a2c831  ! 395: FADDs	fadds	%f11, %f17, %f10
mondo_0_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d910014  ! 396: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
	.word 0x81982326  ! 397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0326, %hpstate
	.word 0x8d802000  ! 398: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_0_177:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d91c004  ! 399: WRPR_WSTATE_R	wrpr	%r7, %r4, %wstate
splash_cmpr_0_178:
	setx 0x512083c7979bcb59, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 400: WR_STICK_REG_R	wr	%r0, %r1, %-
cmp_0_179:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r18, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x68]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9ba00161  ! 401: FABSq	dis not found

splash_cmpr_0_180:
	setx 0xddac2d3ac7a2f4fe, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 402: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_181:
	nop
	setx debug_0_181 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 403: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa9520000  ! 404: RDPR_PIL	<illegal instruction>
DS_0_182:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f20, %f10, %f22
	.word 0x91b50312  ! 405: ALIGNADDRESS	alignaddr	%r20, %r18, %r8
mondo_0_183:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d918013  ! 406: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
mondo_0_184:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d94c00c  ! 407: WRPR_WSTATE_R	wrpr	%r19, %r12, %wstate
	.word 0x819820d6  ! 408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d6, %hpstate
	.word 0x91d020b2  ! 409: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x93902000  ! 410: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87802063  ! 411: WRASI_I	wr	%r0, 0x0063, %asi
mondo_0_185:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d90400b  ! 412: WRPR_WSTATE_R	wrpr	%r1, %r11, %wstate
splash_tba_0_186:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 413: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_0_187:
	setx 0xb8a586b57ad7a957, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 414: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_188:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 415: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa4818013  ! 416: ADDcc_R	addcc 	%r6, %r19, %r18
	.word 0x99902005  ! 417: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xe46ff8ba  ! 418: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffff8ba]
DS_0_189:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa3b1030c  ! 419: ALIGNADDRESS	alignaddr	%r4, %r12, %r17
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936d2c55  ! 420: SDIVX_I	sdivx	%r20, 0x0c55, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01969  ! 421: FqTOd	dis not found

	.word 0x8d902be0  ! 422: WRPR_PSTATE_I	wrpr	%r0, 0x0be0, %pstate
	.word 0x91a149cd  ! 423: FDIVd	fdivd	%f36, %f44, %f8
tagged_0_192:
	tsubcctv %r6, 0x18bd, %r7
	.word 0xd007ec55  ! 424: LDUW_I	lduw	[%r31 + 0x0c55], %r8
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 425: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 426: LDX_R	ldx	[%r31 + %r0], %r8
debug_0_193:
	nop
	setx debug_0_193 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 427: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d020b4  ! 428: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xd04fec55  ! 429: LDSB_I	ldsb	[%r31 + 0x0c55], %r8
	.word 0xd08fe000  ! 430: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x91520000  ! 432: RDPR_PIL	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16cef0e  ! 433: SDIVX_I	sdivx	%r19, 0x0f0e, %r16
mondo_0_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d928011  ! 434: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
debug_0_196:
	nop
	setx debug_0_196 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 435: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_0_197:
	taddcctv %r1, 0x1897, %r18
	.word 0xe007ef0e  ! 436: LDUW_I	lduw	[%r31 + 0x0f0e], %r16
	.word 0x91d02034  ! 437: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe0800ba0  ! 438: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r16
	.word 0x91d02035  ! 439: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_0_198:
	setx 0x1b1f7c6d8902762e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 440: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_199:
	setx 0x99167f3851fd4611, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 441: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 442: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x9f802f3d  ! 443: SIR	sir	0x0f3d
intveclr_0_200:
	setx 0x61dc752642422bd5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 444: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 445: Tcc_I	ta	icc_or_xcc, %r0 + 52
mondo_0_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d920012  ! 446: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
	.word 0x99902000  ! 447: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
mondo_0_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d95000c  ! 448: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
	.word 0xe137c00c  ! 449: STQF_R	-	%f16, [%r12, %r31]
	setx 0x3da6b75378f3cc06, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_203:
	.word 0x39400001  ! 450: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790239a  ! 451: WRPR_TT_I	wrpr	%r0, 0x039a, %tt
change_to_randtl_0_204:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_204:
	.word 0x8f902001  ! 452: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x9f803a51  ! 453: SIR	sir	0x1a51
	.word 0x95500000  ! 454: RDPR_TPC	<illegal instruction>
	.word 0x81982a9c  ! 455: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9c, %hpstate
debug_0_205:
	nop
	setx debug_0_205 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 456: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_0_206:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 457: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916ce283  ! 458: SDIVX_I	sdivx	%r19, 0x0283, %r8
tagged_0_208:
	tsubcctv %r1, 0x11bb, %r15
	.word 0xd007e283  ! 459: LDUW_I	lduw	[%r31 + 0x0283], %r8
	.word 0xd08008a0  ! 460: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
debug_0_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 461: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802004  ! 462: WRASI_I	wr	%r0, 0x0004, %asi
change_to_randtl_0_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_210:
	.word 0x8f902000  ! 463: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd09fe283  ! 464: LDDA_I	ldda	[%r31, + 0x0283] %asi, %r8
	.word 0xa484c005  ! 465: ADDcc_R	addcc 	%r19, %r5, %r18
	.word 0x9f8029df  ! 466: SIR	sir	0x09df
	.word 0x87902265  ! 467: WRPR_TT_I	wrpr	%r0, 0x0265, %tt
debug_0_211:
	nop
	setx debug_0_211 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 468: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe4c004a0  ! 469: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r18
	.word 0xe4c7e010  ! 470: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r18
	.word 0xe48008a0  ! 471: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 472: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_212:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 473: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x879021c2  ! 474: WRPR_TT_I	wrpr	%r0, 0x01c2, %tt
splash_tba_0_213:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 475: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_0_214:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 476: SAVE_R	save	%r31, %r0, %r31
	.word 0xe48804a0  ! 477: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
debug_0_215:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 478: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe4c804a0  ! 479: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r18
	.word 0xa3a509d2  ! 480: FDIVd	fdivd	%f20, %f18, %f48
	.word 0x93902001  ! 481: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
intveclr_0_216:
	setx 0xeb2b6af294fb9d65, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_217:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe130c009  ! 1: STQF_R	-	%f16, [%r9, %r3]
	normalw
	.word 0x97458000  ! 483: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x87802058  ! 484: WRASI_I	wr	%r0, 0x0058, %asi
debug_0_218:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 485: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x26700001  ! 486: BPL	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01963  ! 487: FqTOd	dis not found

splash_cmpr_0_220:
	setx 0x1800117c263a7fec, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 488: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 489: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 490: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe897e010  ! 491: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r20
	.word 0xe8880e60  ! 492: LDUBA_R	lduba	[%r0, %r0] 0x73, %r20
intveclr_0_221:
	setx 0x9e109db1a820bfa6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 493: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe847e9df  ! 494: LDSW_I	ldsw	[%r31 + 0x09df], %r20
	.word 0xe827e9df  ! 495: STW_I	stw	%r20, [%r31 + 0x09df]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956d2fb6  ! 496: SDIVX_I	sdivx	%r20, 0x0fb6, %r10
	.word 0x9f8032d8  ! 497: SIR	sir	0x12d8
	.word 0x91454000  ! 498: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0xd0dfe030  ! 499: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r8
	.word 0x87802063  ! 500: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xd127c003  ! 501: STF_R	st	%f8, [%r3, %r31]
	.word 0x8198285c  ! 502: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085c, %hpstate
splash_tba_0_223:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 503: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x99902005  ! 504: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xd0d7e020  ! 505: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 506: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_224:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xc95897d0	! Random illegal ?
	.word 0xdb11400a  ! 1: LDQF_R	-	[%r5, %r10], %f13
	.word 0x93a50826  ! 507: FADDs	fadds	%f20, %f6, %f9
	.word 0x879020f9  ! 508: WRPR_TT_I	wrpr	%r0, 0x00f9, %tt
splash_lsu_0_225:
	setx 0x0cbef807d144692f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 509: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 510: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd25ff2d8  ! 511: LDX_I	ldx	[%r31 + 0xfffff2d8], %r9
	.word 0x81982487  ! 512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0487, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_226)) -> intp(1,0,10)
intvec_0_226:
	.word 0x39400001  ! 513: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 514: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903438  ! 515: WRPR_PSTATE_I	wrpr	%r0, 0x1438, %pstate
	.word 0xa190200d  ! 516: WRPR_GL_I	wrpr	%r0, 0x000d, %-
intveclr_0_227:
	setx 0x2e6b9f02ea469d04, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 517: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_0_228:
	nop
	setx donretarg_0_228, %r11, %r12
	stxa %r15, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_228:
	.word 0xd2fff2d8  ! 518: SWAPA_I	swapa	%r9, [%r31 + 0xfffff2d8] %asi
	.word 0x819827be  ! 519: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07be, %hpstate
	.word 0x81b01021  ! 520: SIAM	siam	1
	.word 0xd2c004a0  ! 521: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	.word 0x38700001  ! 522: BPGU	<illegal instruction>
	.word 0x2e800001  ! 523: BVS	bvs,a	<label_0x1>
tagged_0_229:
	taddcctv %r26, 0x1033, %r11
	.word 0xd207f2d8  ! 524: LDUW_I	lduw	[%r31 + 0xfffff2d8], %r9
intveclr_0_230:
	setx 0xcf421ad1da029b47, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_231:
	setx 0x042fa099f6152a62, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 526: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200c  ! 527: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa4c52206  ! 528: ADDCcc_I	addccc 	%r20, 0x0206, %r18
	.word 0x87802089  ! 529: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_0_232:
	setx 0x55f9dafff36f74af, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 530: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_233:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d950002  ! 531: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
	.word 0x87902067  ! 532: WRPR_TT_I	wrpr	%r0, 0x0067, %tt
	.word 0x91d020b2  ! 533: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xe48008a0  ! 534: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa9a2c9c6  ! 535: FDIVd	fdivd	%f42, %f6, %f20
	.word 0xe8dfe010  ! 536: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r20
	.word 0x91a1c9c9  ! 537: FDIVd	fdivd	%f38, %f40, %f8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93696600  ! 538: SDIVX_I	sdivx	%r5, 0x0600, %r9
	.word 0x97540000  ! 539: RDPR_GL	rdpr	%-, %r11
	.word 0xd6dfe030  ! 540: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r11
splash_tba_0_235:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 541: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa7480000  ! 542: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 543: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_236:
	tsubcctv %r22, 0x1c2d, %r23
	.word 0xe607e600  ! 544: LDUW_I	lduw	[%r31 + 0x0600], %r19
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 545: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_237:
	setx 0x1619294c494bbf16, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 546: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_238:
	setx 0xce5c7649aad05635, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879023b3  ! 548: WRPR_TT_I	wrpr	%r0, 0x03b3, %tt
	setx 0x3fb53cd7cb483de1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_239:
	.word 0x39400001  ! 549: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_240:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d92c012  ! 550: WRPR_WSTATE_R	wrpr	%r11, %r18, %wstate
intveclr_0_241:
	setx 0x1712fd17a2377a62, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 551: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8790219f  ! 552: WRPR_TT_I	wrpr	%r0, 0x019f, %tt
	.word 0xe6c7e000  ! 553: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r19
	.word 0x93902005  ! 554: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe68008a0  ! 555: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xa9454000  ! 556: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
tagged_0_242:
	tsubcctv %r8, 0x1128, %r24
	.word 0xe807e600  ! 557: LDUW_I	lduw	[%r31 + 0x0600], %r20
debug_0_243:
	nop
	setx debug_0_243 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 558: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x22800001  ! 559: BE	be,a	<label_0x1>
intveclr_0_244:
	setx 0x24c16082221f3b00, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 560: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_245:
	setx 0x007f4a24f808ff8d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 561: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9030e6  ! 562: WRPR_PSTATE_I	wrpr	%r0, 0x10e6, %pstate
debug_0_246:
	nop
	setx debug_0_246 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 563: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x56e2c82d5667c711, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_247:
	.word 0x39400001  ! 564: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_248:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 565: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_0_249:
	setx 0xfe5291511d6b95c6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 566: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902007  ! 567: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x87802014  ! 568: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x9b53c000  ! 569: RDPR_FQ	<illegal instruction>
	.word 0x93a00562  ! 570: FSQRTq	fsqrt	
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 571: LDX_R	ldx	[%r31 + %r0], %r9
debug_0_250:
	nop
	setx debug_0_250 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 572: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01966  ! 573: FqTOd	dis not found

	.word 0x97b44fe4  ! 574: FONES	e	%f11
splash_cmpr_0_252:
	setx 0x541ce0a48c3d3ba2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 575: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 576: LDX_R	ldx	[%r31 + %r0], %r11
	setx 0x019b24f7d713133e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_253:
	.word 0x39400001  ! 577: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6c7e000  ! 578: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r11
	.word 0x8d903a2e  ! 579: WRPR_PSTATE_I	wrpr	%r0, 0x1a2e, %pstate
	.word 0x91d020b5  ! 580: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x87802063  ! 581: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xd737c004  ! 582: STQF_R	-	%f11, [%r4, %r31]
	.word 0x94690001  ! 583: UDIVX_R	udivx 	%r4, %r1, %r10
splash_cmpr_0_254:
	setx 0x307d17d07ca3da17, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 584: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_255:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe9108009  ! 1: LDQF_R	-	[%r2, %r9], %f20
	.word 0xa5a40830  ! 585: FADDs	fadds	%f16, %f16, %f18
mondo_0_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d90400a  ! 586: WRPR_WSTATE_R	wrpr	%r1, %r10, %wstate
	.word 0xe53fc00a  ! 587: STDF_R	std	%f18, [%r10, %r31]
tagged_0_257:
	taddcctv %r12, 0x12e4, %r19
	.word 0xe407e600  ! 588: LDUW_I	lduw	[%r31 + 0x0600], %r18
pmu_0_258:
	nop
	setx 0xfffff2a0fffff5e7, %g1, %g7
	.word 0xa3800007  ! 589: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xad8264ec  ! 590: WR_SOFTINT_REG_I	wr	%r9, 0x04ec, %softint
tagged_0_259:
	taddcctv %r10, 0x17ad, %r15
	.word 0xe407e4ec  ! 591: LDUW_I	lduw	[%r31 + 0x04ec], %r18
	.word 0x99520000  ! 592: RDPR_PIL	<illegal instruction>
change_to_randtl_0_260:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_260:
	.word 0x8f902001  ! 593: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd827e4ec  ! 594: STW_I	stw	%r12, [%r31 + 0x04ec]
	.word 0x81460000  ! 595: RD_STICK_REG	stbar
mondo_0_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d940001  ! 596: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
	.word 0x8d9035fb  ! 597: WRPR_PSTATE_I	wrpr	%r0, 0x15fb, %pstate
	.word 0x87902178  ! 598: WRPR_TT_I	wrpr	%r0, 0x0178, %tt
	.word 0x8d903108  ! 599: WRPR_PSTATE_I	wrpr	%r0, 0x1108, %pstate
	.word 0x819825e6  ! 600: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05e6, %hpstate
	.word 0x93902005  ! 601: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81460000  ! 602: RD_STICK_REG	stbar
	.word 0x26800001  ! 603: BL	bl,a	<label_0x1>
debug_0_262:
	nop
	setx debug_0_262 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 604: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902006  ! 605: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_tba_0_263:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 606: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_0_264:
	nop
	setx debug_0_264 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 607: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x819823ac  ! 608: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03ac, %hpstate
change_to_randtl_0_265:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_265:
	.word 0x8f902000  ! 609: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902006  ! 610: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd8c7e010  ! 611: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
intveclr_0_266:
	setx 0x9caf8404290882f0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 612: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa190200e  ! 613: WRPR_GL_I	wrpr	%r0, 0x000e, %-
debug_0_267:
	nop
	setx debug_0_267 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 614: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd8cfe000  ! 615: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
debug_0_268:
	nop
	setx debug_0_268 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 616: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_269:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d944003  ! 617: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 618: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_0_270:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 619: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x28700001  ! 620: BPLEU	<illegal instruction>
	.word 0x93902001  ! 621: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
mondo_0_271:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d94c011  ! 622: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
splash_lsu_0_272:
	setx 0x3c301184f9e8d8fd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 623: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d94800a  ! 624: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
	.word 0xd8880e40  ! 625: LDUBA_R	lduba	[%r0, %r0] 0x72, %r12
splash_cmpr_0_274:
	setx 0x46c5e0a432241e3e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 626: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 627: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_275:
	setx 0x49e6b0cf29459e77, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 628: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 629: BL	bl,a	<label_0x1>
mondo_0_276:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d948006  ! 630: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
cmp_0_277:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r3, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x68]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x95a00160  ! 631: FABSq	dis not found

	.word 0xd4c004a0  ! 632: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
splash_cmpr_0_278:
	setx 0x30d922667c72cb05, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 633: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x97a01a6b  ! 635: FqTOi	fqtoi	
	.word 0xd647e4ec  ! 636: LDSW_I	ldsw	[%r31 + 0x04ec], %r11
debug_0_279:
	nop
	setx debug_0_279 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 637: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9169a16c  ! 638: SDIVX_I	sdivx	%r6, 0x016c, %r8
splash_tba_0_281:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 639: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_0_282:
	setx 0x2b2a7e899434ce0b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 640: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_283:
	nop
	setx debug_0_283 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 641: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_284)) -> intp(2,0,0)
intvec_0_284:
	.word 0x39400001  ! 642: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 643: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936cbc9a  ! 644: SDIVX_I	sdivx	%r18, 0xfffffc9a, %r9
	.word 0xd2d004a0  ! 645: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01968  ! 646: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1687035  ! 647: SDIVX_I	sdivx	%r1, 0xfffff035, %r16
pmu_0_288:
	nop
	setx 0xfffffb8affffffb2, %g1, %g7
	.word 0xa3800007  ! 648: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 649: LDX_R	ldx	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 650: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe01ff035  ! 651: LDD_I	ldd	[%r31 + 0xfffff035], %r16
mondo_0_289:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d928005  ! 652: WRPR_WSTATE_R	wrpr	%r10, %r5, %wstate
splash_lsu_0_290:
	setx 0xc3a104943fe20bb9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 653: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_291:
	nop
	setx debug_0_291 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 654: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902006  ! 655: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81982ca4  ! 656: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ca4, %hpstate
tagged_0_292:
	tsubcctv %r3, 0x1715, %r17
	.word 0xe007f035  ! 657: LDUW_I	lduw	[%r31 + 0xfffff035], %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01972  ! 658: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976c2ed1  ! 659: SDIVX_I	sdivx	%r16, 0x0ed1, %r11
	.word 0x81510000  ! 660: RDPR_TICK	rdpr	%tick, %r0
	setx 0x5d2b484d753f361c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_295:
	.word 0x39400001  ! 661: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_296:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 662: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_297:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd7350009  ! 1: STQF_R	-	%f11, [%r9, %r20]
	normalw
	.word 0x97458000  ! 663: RD_SOFTINT_REG	rd	%softint, %r11
pmu_0_298:
	nop
	setx 0xfffff169fffffeff, %g1, %g7
	.word 0xa3800007  ! 664: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_0_299:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_299:
	.word 0x8f902003  ! 665: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
debug_0_300:
	nop
	setx debug_0_300 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 666: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902007  ! 667: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd68008a0  ! 668: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_tba_0_301:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 669: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_302)) -> intp(1,0,6)
intvec_0_302:
	.word 0x39400001  ! 670: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_0_303:
	set 0x00380000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 671: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_0_304:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d910012  ! 672: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
	.word 0xd68804a0  ! 673: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0xd68008a0  ! 674: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	setx 0x839faa9874b6f2c0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_305:
	.word 0x39400001  ! 675: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 676: WRASI_I	wr	%r0, 0x0004, %asi
cmp_0_306:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r10, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x60]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa5a00171  ! 677: FABSq	dis not found

	.word 0xa945c000  ! 678: RD_TICK_CMPR_REG	rd	%-, %r20
splash_lsu_0_307:
	setx 0xbc9312ef29ab7f79, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 679: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_308:
	tsubcctv %r24, 0x163f, %r11
	.word 0xe807eed1  ! 680: LDUW_I	lduw	[%r31 + 0x0ed1], %r20
splash_cmpr_0_309:
	setx 0xf5fe85e8c3e91dbd, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 681: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790201e  ! 682: WRPR_TT_I	wrpr	%r0, 0x001e, %tt
tagged_0_310:
	tsubcctv %r1, 0x1572, %r2
	.word 0xe807eed1  ! 683: LDUW_I	lduw	[%r31 + 0x0ed1], %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976a739b  ! 684: SDIVX_I	sdivx	%r9, 0xfffff39b, %r11
change_to_randtl_0_312:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_312:
	.word 0x8f902000  ! 685: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_0_313:
	nop
	setx debug_0_313 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 686: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_0_314:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_314:
	.word 0x8f902002  ! 687: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_0_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d90c000  ! 688: WRPR_WSTATE_R	wrpr	%r3, %r0, %wstate
	.word 0x93902000  ! 689: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
debug_0_316:
	nop
	setx debug_0_316 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 690: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x2fa9847a79970497, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_317:
	.word 0x39400001  ! 691: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6800b80  ! 692: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 693: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xad826acc  ! 694: WR_SOFTINT_REG_I	wr	%r9, 0x0acc, %softint
	.word 0x87802063  ! 695: WRASI_I	wr	%r0, 0x0063, %asi
change_to_randtl_0_318:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_318:
	.word 0x8f902001  ! 696: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01964  ! 697: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56a352a  ! 698: SDIVX_I	sdivx	%r8, 0xfffff52a, %r18
debug_0_321:
	nop
	setx debug_0_321 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 699: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_0_322:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 700: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_0_323:
	taddcctv %r1, 0x1c0e, %r12
	.word 0xe407f52a  ! 701: LDUW_I	lduw	[%r31 + 0xfffff52a], %r18
mondo_0_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d930000  ! 702: WRPR_WSTATE_R	wrpr	%r12, %r0, %wstate
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 703: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902f9b  ! 704: WRPR_PSTATE_I	wrpr	%r0, 0x0f9b, %pstate
	.word 0xa3a01a69  ! 705: FqTOi	fqtoi	
	.word 0x81982205  ! 706: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0205, %hpstate
cmp_0_325:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r5, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x68]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x93a00172  ! 707: FABSq	dis not found

	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 708: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 709: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81982e2c  ! 710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e2c, %hpstate
	.word 0xd237f52a  ! 711: STH_I	sth	%r9, [%r31 + 0xfffff52a]
	.word 0x9f8020ec  ! 712: SIR	sir	0x00ec
	.word 0xd317c000  ! 713: LDQF_R	-	[%r31, %r0], %f9
splash_cmpr_0_326:
	setx 0x45580288339291d0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 714: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 715: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_0_327:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 716: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_0_328:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d90000a  ! 717: WRPR_WSTATE_R	wrpr	%r0, %r10, %wstate
	.word 0xd337e0ec  ! 718: STQF_I	-	%f9, [0x00ec, %r31]
	.word 0x95454000  ! 719: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	.word 0x99902003  ! 720: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xd48008a0  ! 721: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_cmpr_0_329:
	setx 0x6c458f0b71939f3e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 722: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_330:
	setx 0xef17224df9c0c5cd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 723: WR_STICK_REG_R	wr	%r0, %r1, %-
cmp_0_331:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r10, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x68]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa3a00164  ! 724: FABSq	dis not found

splash_tba_0_332:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 725: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902228  ! 726: WRPR_TT_I	wrpr	%r0, 0x0228, %tt
	.word 0x83d020b4  ! 727: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xe20fe0ec  ! 728: LDUB_I	ldub	[%r31 + 0x00ec], %r17
	.word 0x81510000  ! 729: RDPR_TICK	rdpr	%tick, %r0
cmp_0_333:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r17, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x68]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa9a00165  ! 730: FABSq	dis not found

	.word 0x93d02032  ! 731: Tcc_I	tne	icc_or_xcc, %r0 + 50
mondo_0_334:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d930007  ! 732: WRPR_WSTATE_R	wrpr	%r12, %r7, %wstate
	.word 0x93902001  ! 733: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87802063  ! 734: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x87802080  ! 735: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xe917c000  ! 736: LDQF_R	-	[%r31, %r0], %f20
cmp_0_335:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r2, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x68]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x97a00172  ! 737: FABSq	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_336)) -> intp(3,0,16)
intvec_0_336:
	.word 0x39400001  ! 738: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_337:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x91a00551  ! 1: FSQRTd	fsqrt	
	.word 0xa7a34831  ! 739: FADDs	fadds	%f13, %f17, %f19
change_to_randtl_0_338:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_338:
	.word 0x8f902000  ! 740: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_0_339:
	setx 0xb066e0095c71f842, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 741: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe68008a0  ! 742: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
debug_0_340:
	nop
	setx debug_0_340 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 743: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916d3b39  ! 744: SDIVX_I	sdivx	%r20, 0xfffffb39, %r8
splash_htba_0_342:
	set 0x00380000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 745: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd01ffb39  ! 746: LDD_I	ldd	[%r31 + 0xfffffb39], %r8
	.word 0x2a800001  ! 747: BCS	bcs,a	<label_0x1>
	.word 0x93902003  ! 748: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_0_343:
	setx 0x9ca639bcdd3cda8b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 749: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa5a309d3  ! 750: FDIVd	fdivd	%f12, %f50, %f18
	.word 0xad80ed48  ! 751: WR_SOFTINT_REG_I	wr	%r3, 0x0d48, %softint
debug_0_344:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 752: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa3454000  ! 753: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0x879023ae  ! 754: WRPR_TT_I	wrpr	%r0, 0x03ae, %tt
	.word 0xe28804a0  ! 755: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 756: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_0_345:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 757: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x8d9024cd  ! 758: WRPR_PSTATE_I	wrpr	%r0, 0x04cd, %pstate
	.word 0x879021e6  ! 759: WRPR_TT_I	wrpr	%r0, 0x01e6, %tt
DS_0_346:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f6, %f24, %f8
	.word 0xa5b44313  ! 760: ALIGNADDRESS	alignaddr	%r17, %r19, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0196c  ! 761: FqTOd	dis not found

	.word 0xda4fc000  ! 762: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01968  ! 763: FqTOd	dis not found

	.word 0xa1902005  ! 764: WRPR_GL_I	wrpr	%r0, 0x0005, %-
mondo_0_349:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d940005  ! 765: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
	.word 0xd327ed48  ! 766: STF_I	st	%f9, [0x0d48, %r31]
	.word 0xd2c804a0  ! 767: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 768: LDX_R	ldx	[%r31 + %r0], %r9
DS_0_350:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 769: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd257ed48  ! 770: LDSH_I	ldsh	[%r31 + 0x0d48], %r9
	.word 0xd28fe030  ! 771: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r9
DS_0_351:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa5b5030a  ! 772: ALIGNADDRESS	alignaddr	%r20, %r10, %r18
	.word 0xab80000a  ! 773: WR_CLEAR_SOFTINT_R	wr	%r0, %r10, %clear_softint
	.word 0xe457c000  ! 774: LDSH_R	ldsh	[%r31 + %r0], %r18
intveclr_0_352:
	setx 0xda0427661b7ba88a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 775: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_353:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d950005  ! 776: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
mondo_0_354:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d914003  ! 777: WRPR_WSTATE_R	wrpr	%r5, %r3, %wstate
	.word 0xe41fc000  ! 778: LDD_R	ldd	[%r31 + %r0], %r18
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 779: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01963  ! 780: FqTOd	dis not found

	.word 0xd037ed48  ! 781: STH_I	sth	%r8, [%r31 + 0x0d48]
splash_lsu_0_356:
	setx 0x8aaa7bb4b03e403d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 782: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_357:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 783: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xd11fed48  ! 784: LDDF_I	ldd	[%r31, 0x0d48], %f8
debug_0_358:
	nop
	setx debug_0_358 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 785: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_359:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd9104007  ! 1: LDQF_R	-	[%r1, %r7], %f12
	.word 0x9ba18822  ! 786: FADDs	fadds	%f6, %f2, %f13
splash_cmpr_0_360:
	setx 0xa188442c7283c20d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 787: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 788: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 789: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01967  ! 790: FqTOd	dis not found

	.word 0x8d903433  ! 791: WRPR_PSTATE_I	wrpr	%r0, 0x1433, %pstate
	.word 0xe68008a0  ! 792: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
splash_cmpr_0_362:
	setx 0x78340e4d4cf22676, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 793: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x3a552b428d34f1f6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_363:
	.word 0x39400001  ! 794: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 795: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x20700001  ! 796: BPN	<illegal instruction>
	.word 0xe67fed48  ! 797: SWAP_I	swap	%r19, [%r31 + 0x0d48]
	.word 0x8d903abd  ! 798: WRPR_PSTATE_I	wrpr	%r0, 0x1abd, %pstate
change_to_randtl_0_364:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_364:
	.word 0x8f902001  ! 799: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 800: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe677c007  ! 801: STX_R	stx	%r19, [%r31 + %r7]
	.word 0xe6c7e010  ! 802: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r19
splash_htba_0_365:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 803: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_0_366:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d94c014  ! 804: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
cmp_0_367:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r17, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x68]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91a00160  ! 805: FABSq	dis not found

	.word 0x8790205d  ! 806: WRPR_TT_I	wrpr	%r0, 0x005d, %tt
	.word 0x91d020b2  ! 807: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xa550c000  ! 808: RDPR_TT	<illegal instruction>
	.word 0x8d902bf0  ! 809: WRPR_PSTATE_I	wrpr	%r0, 0x0bf0, %pstate
	.word 0x879020b1  ! 810: WRPR_TT_I	wrpr	%r0, 0x00b1, %tt
	.word 0xe48008a0  ! 811: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe537ed48  ! 812: STQF_I	-	%f18, [0x0d48, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 813: LDX_R	ldx	[%r31 + %r0], %r18
mondo_0_368:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d928011  ! 814: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
	setx 0x1f5fbd9ba5d37ec0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_369:
	.word 0x39400001  ! 815: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_370:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d928000  ! 816: WRPR_WSTATE_R	wrpr	%r10, %r0, %wstate
tagged_0_371:
	taddcctv %r13, 0x11f7, %r4
	.word 0xe407ed48  ! 817: LDUW_I	lduw	[%r31 + 0x0d48], %r18
splash_cmpr_0_372:
	setx 0xe17fc023d73463fa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 818: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_373:
	nop
	setx debug_0_373 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 819: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 820: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe4880e80  ! 821: LDUBA_R	lduba	[%r0, %r0] 0x74, %r18
mondo_0_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d91c00c  ! 822: WRPR_WSTATE_R	wrpr	%r7, %r12, %wstate
	.word 0x95a24dc4  ! 823: FdMULq	fdmulq	
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 824: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902c73  ! 825: WRPR_PSTATE_I	wrpr	%r0, 0x0c73, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 826: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4dfe000  ! 827: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	.word 0xab84800c  ! 828: WR_CLEAR_SOFTINT_R	wr	%r18, %r12, %clear_softint
	.word 0xd46fed48  ! 829: LDSTUB_I	ldstub	%r10, [%r31 + 0x0d48]
	setx 0x5ede368ee7c48e34, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_375:
	.word 0x39400001  ! 830: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_376:
	nop
	setx debug_0_376 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 831: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x879021d2  ! 832: WRPR_TT_I	wrpr	%r0, 0x01d2, %tt
cmp_0_377:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r20, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x68]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x95a0016b  ! 833: FABSq	dis not found

	.word 0x97540000  ! 834: RDPR_GL	<illegal instruction>
	.word 0xd73fed48  ! 835: STDF_I	std	%f11, [0x0d48, %r31]
	.word 0xa1902006  ! 836: WRPR_GL_I	wrpr	%r0, 0x0006, %-
DS_0_378:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xe76ac6b8	! Random illegal ?
	.word 0x9ba00547  ! 1: FSQRTd	fsqrt	
	.word 0x97a28830  ! 837: FADDs	fadds	%f10, %f16, %f11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 838: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd69004a0  ! 839: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0x93902000  ! 840: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
debug_0_379:
	nop
	setx debug_0_379 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 841: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_0_380:
	setx 0xbc6aad06ff4416f3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 842: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_381:
	setx 0x7da0de8fa25f0bd1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 843: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 844: RDPR_TICK	rdpr	%tick, %r0
cmp_0_382:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r4, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x60]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x99a0016c  ! 845: FABSq	dis not found

	.word 0xd8900e40  ! 846: LDUHA_R	lduha	[%r0, %r0] 0x72, %r12
	.word 0xd91fc000  ! 847: LDDF_R	ldd	[%r31, %r0], %f12
change_to_randtl_0_383:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_383:
	.word 0x8f902003  ! 848: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd88008a0  ! 849: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_tba_0_384:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 850: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_0_385:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe311c006  ! 1: LDQF_R	-	[%r7, %r6], %f17
	.word 0x99a48826  ! 851: FADDs	fadds	%f18, %f6, %f12
debug_0_386:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 852: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76d342d  ! 853: SDIVX_I	sdivx	%r20, 0xfffff42d, %r19
	.word 0xe647f42d  ! 854: LDSW_I	ldsw	[%r31 + 0xfffff42d], %r19
	.word 0xe717c000  ! 855: LDQF_R	-	[%r31, %r0], %f19
	.word 0x87802016  ! 856: WRASI_I	wr	%r0, 0x0016, %asi
intveclr_0_388:
	setx 0x200b21c69afd0d96, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 857: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_389:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd5324014  ! 1: STQF_R	-	%f10, [%r20, %r9]
	normalw
	.word 0xa5458000  ! 858: RD_SOFTINT_REG	rd	%softint, %r18
debug_0_390:
	nop
	setx debug_0_390 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 859: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902425  ! 860: WRPR_PSTATE_I	wrpr	%r0, 0x0425, %pstate
	.word 0xad8371d4  ! 861: WR_SOFTINT_REG_I	wr	%r13, 0x11d4, %softint
splash_cmpr_0_391:
	setx 0xdd8508928bdac5d3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 862: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_392:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0x914a1ad9	! Random illegal ?
	.word 0xd5150000  ! 1: LDQF_R	-	[%r20, %r0], %f10
	.word 0x99a0c826  ! 863: FADDs	fadds	%f3, %f6, %f12
	.word 0xd88804a0  ! 864: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
splash_cmpr_0_393:
	setx 0xdc90378f95e7dc18, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 865: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_394:
	nop
	setx debug_0_394 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 866: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd8d004a0  ! 867: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0x99480000  ! 868: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	setx 0xcfce7f7e903c2d8e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_395:
	.word 0x39400001  ! 869: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa6db0001  ! 870: SMULcc_R	smulcc 	%r12, %r1, %r19
	.word 0xa190200f  ! 871: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_lsu_0_396:
	setx 0x2a5dd38017c313f9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 872: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_397:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_397:
	.word 0x8f902003  ! 873: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xe63ff1d4  ! 874: STD_I	std	%r19, [%r31 + 0xfffff1d4]
splash_cmpr_0_398:
	setx 0x4e6c37271d9501a1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 875: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_399:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb328010  ! 1: STQF_R	-	%f13, [%r16, %r10]
	normalw
	.word 0xa3458000  ! 876: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x93902001  ! 877: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa1902001  ! 878: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 879: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902116  ! 880: WRPR_TT_I	wrpr	%r0, 0x0116, %tt
splash_cmpr_0_400:
	setx 0xad14d24756efca3f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 881: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 882: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x22700001  ! 883: BPE	<illegal instruction>
	.word 0xe317c000  ! 884: LDQF_R	-	[%r31, %r0], %f17
	.word 0x8d9031e2  ! 885: WRPR_PSTATE_I	wrpr	%r0, 0x11e2, %pstate
splash_cmpr_0_401:
	setx 0x1183815913272871, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 886: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe2d004a0  ! 887: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
splash_lsu_0_402:
	setx 0x59d4dce719eecb05, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 888: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_403:
	setx 0x9994e2f8e50bce68, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 889: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 890: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa5a189d0  ! 891: FDIVd	fdivd	%f6, %f16, %f18
DS_0_404:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd7314009  ! 1: STQF_R	-	%f11, [%r9, %r5]
	normalw
	.word 0xa5458000  ! 892: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0x8d903380  ! 893: WRPR_PSTATE_I	wrpr	%r0, 0x1380, %pstate
	.word 0x8d902240  ! 894: WRPR_PSTATE_I	wrpr	%r0, 0x0240, %pstate
	.word 0x8d903caf  ! 895: WRPR_PSTATE_I	wrpr	%r0, 0x1caf, %pstate
splash_cmpr_0_405:
	setx 0x6a65d7293f54eb6a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 896: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2a800001  ! 897: BCS	bcs,a	<label_0x1>
splash_cmpr_0_406:
	setx 0x6aaad64a12c60143, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 898: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_407:
	setx 0xd952f16f2112b02b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 899: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_408)) -> intp(5,0,20)
intvec_0_408:
	.word 0x39400001  ! 900: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_409:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d90800b  ! 901: WRPR_WSTATE_R	wrpr	%r2, %r11, %wstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 902: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 903: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01971  ! 904: FqTOd	dis not found

pmu_0_411:
	nop
	setx 0xfffff8d9fffff70e, %g1, %g7
	.word 0xa3800007  ! 905: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_0_412:
	setx 0xa94999aa881afbf9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 906: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9945c000  ! 907: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0xd86ff1d4  ! 908: LDSTUB_I	ldstub	%r12, [%r31 + 0xfffff1d4]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 909: LDX_R	ldx	[%r31 + %r0], %r12
tagged_0_413:
	taddcctv %r18, 0x12b6, %r12
	.word 0xd807f1d4  ! 910: LDUW_I	lduw	[%r31 + 0xfffff1d4], %r12
DS_0_414:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe732ea29  ! 1: STQF_I	-	%f19, [0x0a29, %r11]
	normalw
	.word 0xa3458000  ! 911: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x8d802004  ! 912: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x91d020b4  ! 913: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x87902223  ! 914: WRPR_TT_I	wrpr	%r0, 0x0223, %tt
	.word 0x91d02033  ! 915: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_cmpr_0_415:
	setx 0x30cd4a70d862be6d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 916: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_416:
	setx 0xb0d83e84cff373bd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 917: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_417:
	nop
	setx debug_0_417 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 918: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
cmp_0_418:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r20, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x60]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x93a00172  ! 919: FABSq	dis not found

	.word 0x93902001  ! 920: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
debug_0_419:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 921: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd397ea29  ! 922: LDQFA_I	-	[%r31, 0x0a29], %f9
	.word 0x879020d5  ! 923: WRPR_TT_I	wrpr	%r0, 0x00d5, %tt
	.word 0xd33fc012  ! 924: STDF_R	std	%f9, [%r18, %r31]
	.word 0xa1902006  ! 925: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa190200d  ! 926: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd25fea29  ! 927: LDX_I	ldx	[%r31 + 0x0a29], %r9
cmp_0_420:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, %r3, %r14     !Apply mask to random ..
    and %r14, 0xfe, %r14        !Don't set/clear t0
	stxa %r14, [0x60]%asi
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9ba00171  ! 928: FABSq	dis not found

	.word 0xdac7e030  ! 929: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01964  ! 930: FqTOd	dis not found

intveclr_0_422:
	setx 0x0b407e889841e52d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 931: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_423:
	nop
	setx debug_0_423 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 932: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81982466  ! 933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0466, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 934: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_424:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d950002  ! 935: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
	.word 0xd21fc000  ! 936: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a0196a  ! 937: FqTOd	dis not found

mondo_0_426:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d94c00d  ! 938: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
	.word 0x87802063  ! 939: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x93902003  ! 940: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd43fc00d  ! 941: STD_R	std	%r10, [%r31 + %r13]
	.word 0xd48fe000  ! 942: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r10
	.word 0x90d84011  ! 943: SMULcc_R	smulcc 	%r1, %r17, %r8
	.word 0xd00fc000  ! 944: LDUB_R	ldub	[%r31 + %r0], %r8
	.word 0x93902006  ! 945: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
donret_0_427:
	nop
	setx donretarg_0_427, %r11, %r12
	stxa %r18, [%r0] ASI_LSU_CONTROL
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_427:
	.word 0xd0ffea29  ! 946: SWAPA_I	swapa	%r8, [%r31 + 0x0a29] %asi
DS_0_428:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 947: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd09fc020  ! 948: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
splash_lsu_0_429:
	setx 0x6e5c961030b7fe61, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 949: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 950: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd0d7e010  ! 951: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
splash_lsu_0_430:
	setx 0x9fc9889b9698bca9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 952: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 953: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01970  ! 954: FqTOd	dis not found

	.word 0x93902007  ! 955: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1902004  ! 956: WRPR_GL_I	wrpr	%r0, 0x0004, %-
debug_0_432:
	nop
	setx debug_0_432 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 957: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_0_433:
	setx 0x7acb5ea974de3b83, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 958: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_434:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd331c000  ! 1: STQF_R	-	%f9, [%r0, %r7]
	normalw
	.word 0x97458000  ! 959: RD_SOFTINT_REG	rd	%softint, %r11
splash_htba_0_435:
	set 0x00380000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 960: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x9f802c60  ! 961: SIR	sir	0x0c60
	.word 0xd6800b60  ! 962: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r11
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 963: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_0_436:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_436:
	.word 0x8f902002  ! 964: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x99902003  ! 965: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
splash_cmpr_0_437:
	setx 0xac6f9a788ee74678, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 966: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902039  ! 967: WRPR_TT_I	wrpr	%r0, 0x0039, %tt
splash_lsu_0_438:
	setx 0x252a81f88426f021, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_439:
	setx 0x1361fc3a938f76a6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 969: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9026d0  ! 970: WRPR_PSTATE_I	wrpr	%r0, 0x06d0, %pstate
	.word 0xd61fc000  ! 971: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd657c000  ! 972: LDSH_R	ldsh	[%r31 + %r0], %r11
change_to_randtl_0_440:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_440:
	.word 0x8f902002  ! 973: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d90223e  ! 974: WRPR_PSTATE_I	wrpr	%r0, 0x023e, %pstate
splash_cmpr_0_441:
	setx 0x1a792eaa8810f248, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 975: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790229e  ! 976: WRPR_TT_I	wrpr	%r0, 0x029e, %tt
	.word 0xa5480000  ! 977: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
debug_0_442:
	nop
	setx debug_0_442 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 978: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_0_443:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 979: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d90338f  ! 980: WRPR_PSTATE_I	wrpr	%r0, 0x138f, %pstate
tagged_0_444:
	tsubcctv %r11, 0x1b83, %r1
	.word 0xe407ec60  ! 981: LDUW_I	lduw	[%r31 + 0x0c60], %r18
	.word 0x87802010  ! 982: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x93902004  ! 983: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe41fc000  ! 984: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x81510000  ! 985: RDPR_TICK	rdpr	%tick, %r0
	.word 0x83d02033  ! 986: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xe48008a0  ! 987: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
splash_tba_0_445:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 988: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_0_446:
	setx 0xffd58682c24adee3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 989: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_447:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d948012  ! 990: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
change_to_randtl_0_448:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_448:
	.word 0x8f902002  ! 991: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x93902001  ! 992: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93480000  ! 993: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x8d802004  ! 994: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa9830005  ! 995: WR_SET_SOFTINT_R	wr	%r12, %r5, %set_softint
debug_0_449:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 996: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_0_450:
	setx 0x8daaa7408467619b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 997: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd28fe020  ! 998: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r9
cmpenall_0_451:
	nop
	mov 0x50, %r18
	mov 0xff, %r8
	stxa %r8, [%r18] 0x41

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

	.xword	0x1dae783122e7e210
	.xword	0x695698fd3250de63
	.xword	0xf4137eee3eaaca22
	.xword	0x4b230cd7cc0e6713
	.xword	0xf14658719b005c02
	.xword	0x70b8e5ddafa8c6e1
	.xword	0x646bc4eac36a10b6
	.xword	0x30da73842a529869
	.xword	0xafbae2b470ca66d3
	.xword	0xc0594ba11d96c661
	.xword	0xd32d2ec474978496
	.xword	0xc73f0586ed9cc182
	.xword	0xbfc097cc2dcfe1ff
	.xword	0x6b7fcffd122e6dfd
	.xword	0x72ca2a4790fd0916
	.xword	0xd91334de14be91e0
	.xword	0xc98222a25b6ce4e3
	.xword	0xd9046ad78178e710
	.xword	0x9474fca915f3bed4
	.xword	0xd0f5dfb7f06d532c
	.xword	0xcc6543a990e1d850
	.xword	0x31138bf60d9774d8
	.xword	0x55715041fb011c7a
	.xword	0xed5b3652ede50463
	.xword	0xcb9b40661241bbe2
	.xword	0x50e2be0e663b15c8
	.xword	0x295a29775931a588
	.xword	0xb4eff2728a94c96b
	.xword	0x18e11794f2ea0a4b
	.xword	0xc40ca1a694fb2887
	.xword	0xc40c05271f63831d
	.xword	0xe9166747bed7ce08
	.xword	0xbe5cf8bdddbb6a3d
	.xword	0xc709b3f67f152118
	.xword	0x4827df0f53c83e18
	.xword	0x4ec3ca83f9ce03e0
	.xword	0x30401cb8b42f2929
	.xword	0xfaee789248de7b39
	.xword	0x301873e91ff37e18
	.xword	0x75b2f33e43574fa2
	.xword	0x1b8f6d0b7a0f28cb
	.xword	0x156c637444538113
	.xword	0xb8b11fd50e1eb64d
	.xword	0x15739af42f7fc45b
	.xword	0x4e1e7fdfe6eed331
	.xword	0xb6d7f29c4ca922e5
	.xword	0x9b594683ee2be7b8
	.xword	0x052ae2412ddf3f36
	.xword	0xfad286277d9c54cf
	.xword	0x73193b713e7ed831
	.xword	0xa4733ccb1d59b7c8
	.xword	0x44c31cb3c2c5fa24
	.xword	0xeda55c1903d56773
	.xword	0xa9f4211e3bc56778
	.xword	0x6ebdee1fbb02543a
	.xword	0x02fac338486ac499
	.xword	0x7fbb46456284abd6
	.xword	0x2c6557fbe51a7346
	.xword	0x751e5a72f1282c2c
	.xword	0xb14608a4f88fd87f
	.xword	0xccd9d679d022b6a2
	.xword	0x655239d0baa2f437
	.xword	0x9b83f93da043997f
	.xword	0xb3cc46e9d24ad310
	.xword	0x38f0380aecdb125a
	.xword	0x311aade476b8659f
	.xword	0x61e80ee18296b8a3
	.xword	0xcf880627fa99296d
	.xword	0x7a5d114779e032b2
	.xword	0x1d7de58499c05f13
	.xword	0xec8cb1679056d78e
	.xword	0xe77cd3cd41737fe7
	.xword	0x75a5b3bb6b4fbeec
	.xword	0xb2b4a776b5729fce
	.xword	0x322956fa6c53e20d
	.xword	0x9571eee17a665e7c
	.xword	0xfa674e0a326d363e
	.xword	0x187e40cd805fc5a9
	.xword	0xc88e54ea6310aecf
	.xword	0x165f32da1c78883e
	.xword	0x48d7dbdaf8340d08
	.xword	0x6070e9132f3005d3
	.xword	0x6ea9e17935487e37
	.xword	0xeeda48b3c75da96c
	.xword	0x8ffb92d6776d5c74
	.xword	0x3e96ed2c87a36d83
	.xword	0x8fc36db3c21ae9ac
	.xword	0x250cc6bef7414f5f
	.xword	0x9e5ec08373835eec
	.xword	0x4602104397c2e990
	.xword	0xaae7120b9d93bc28
	.xword	0xe15b85806bbf767b
	.xword	0xfa8cb1a3290273bf
	.xword	0xa83033232b668374
	.xword	0x5f6b3f21fea07bc6
	.xword	0x87332988301264a6
	.xword	0x0ec643d079c1f53e
	.xword	0x0d871a34bd1083d5
	.xword	0xdfb7bd7b9b2dae98
	.xword	0xf818bd41a9e2d891
	.xword	0xf9f44d78b4a6d499
	.xword	0x0bbd434e7e9f9949
	.xword	0x991d7a102a8765e5
	.xword	0x965ac5a2ef766f1d
	.xword	0x47b8babdd7f72998
	.xword	0x9df58a97d49ebb30
	.xword	0x5f553a693dc38951
	.xword	0xb732b13802c11d40
	.xword	0x6ba9f75559d0db15
	.xword	0xbe08d6a50f677de7
	.xword	0x20af508e95298a32
	.xword	0x94c5d0bef9ca57af
	.xword	0xac071a8e86be5f25
	.xword	0x9bc894b311db18d9
	.xword	0x5323fd9e3f099dc1
	.xword	0x4cac1526121ec54c
	.xword	0x5441198923c87b59
	.xword	0x4276e353b340a63c
	.xword	0x94b5680fe6b30987
	.xword	0xb38ad0ae9dc90fc4
	.xword	0x826c126b7b34c3d0
	.xword	0xc1cfe4c6d2300924
	.xword	0x4dbc35f5aac3d996
	.xword	0x635e8b806d2dddf6
	.xword	0x47d422fb623456bb
	.xword	0xb98f4c4267a78c9f
	.xword	0x6954f3ad9e9364d2
	.xword	0xdb7aefaf8060bad5
	.xword	0x7c726dd2a774407c
	.xword	0xbbb481f2f6245340
	.xword	0x69fbd57f27b18c3f
	.xword	0xb63ecf125f2296df
	.xword	0xf17224ce9c1f4988
	.xword	0x8669ba5c5e8f5fdb
	.xword	0x84fa6c5f572359c9
	.xword	0xbf62776ae3aa8582
	.xword	0xa5986bf5e1a9788e
	.xword	0x0b0e98752ac2ca49
	.xword	0x37e2031fb44a8d31
	.xword	0x50fdace623e38aae
	.xword	0xe4c6dbe4128a2586
	.xword	0x4b6b334737ea85ab
	.xword	0x68d59641cb7ca15a
	.xword	0xe2c1c9775f56167a
	.xword	0x0e80710884cf92e8
	.xword	0x81068441e908059f
	.xword	0xc5a5a8a8506cd387
	.xword	0x764ae02f684a05f1
	.xword	0x3b46f11568867cca
	.xword	0x888beb513144770c
	.xword	0x7702bcc71d592368
	.xword	0x3519228fcde070ec
	.xword	0xcc38551f10dbee93
	.xword	0xee9ac0d67f2a765a
	.xword	0x731da3985e0c9bf2
	.xword	0xd9d474959f13e5e0
	.xword	0x67160c04c01da368
	.xword	0x1fccf187576a7ace
	.xword	0x06343486c302c53a
	.xword	0x7f91be327a73806b
	.xword	0x88909b5c04db4fa7
	.xword	0x6a52c29d85213f16
	.xword	0x7cbe408a080bb90f
	.xword	0xdea1f15a1382cff0
	.xword	0x7ad8dcd7a1bb6ea0
	.xword	0x3b21dd00ac810919
	.xword	0xb92ef44e35b9da37
	.xword	0xdbe1f45fd2b32e03
	.xword	0x087f4dc39c92efa2
	.xword	0x7223443fd39a5939
	.xword	0xa8fa657a7f2966b6
	.xword	0x3af205b9beea3258
	.xword	0x5935d9aa698e078d
	.xword	0xbb36e384ca1b4157
	.xword	0xc138b583e9be195e
	.xword	0x8ba6f625a12b1752
	.xword	0xe162b83c6ad4bfe5
	.xword	0xce64c8eaa7ec6fbe
	.xword	0x3fe95d24d3f35f79
	.xword	0x028bbb0267c25f5d
	.xword	0x2f198d187f324e7b
	.xword	0x9f66507f16424fe2
	.xword	0x1d2e266e25a9912d
	.xword	0xd9c5575ff223a121
	.xword	0xf93ecb9b8c84b3f9
	.xword	0x698af8f09ed88571
	.xword	0x68178fce25818f54
	.xword	0x2981ed14c1344036
	.xword	0x01288cc602f026c4
	.xword	0xa9c6784b768e7d9f
	.xword	0xdc2d7a8eddf4ae27
	.xword	0xd9f0ad44c92909ec
	.xword	0xcc2faf9050629499
	.xword	0xdcbb96110ae3fcbd
	.xword	0xc2e098ce8ceaae0b
	.xword	0x2ef2078498fb2418
	.xword	0xdf69fb6dbecc91ab
	.xword	0x1f1e96c5879497f3
	.xword	0xfbaea4820f437b59
	.xword	0xee9bba0d2d02c98f
	.xword	0xccbb9f5aee9190d6
	.xword	0xbd4b535d62fe2011
	.xword	0x7c3698d6e59933a1
	.xword	0x62f2d66436719c01
	.xword	0xdbd40a9c2c29c96b
	.xword	0xe4b440bea8ae3f72
	.xword	0xa759820e8f4039a3
	.xword	0x39b032f0772594aa
	.xword	0x22dcb78a50b74ca6
	.xword	0x223e02fa5cbe34b0
	.xword	0xef20cebab60208f3
	.xword	0x23948ea8002e9483
	.xword	0x76e74bafa726c2e7
	.xword	0x17691b59b2eba899
	.xword	0xe926e04c67032f86
	.xword	0x3ca0e5c960d3d5c3
	.xword	0x3c31e87961de77d8
	.xword	0x9323a39f1ef3deaa
	.xword	0xc1d02dadfb6dae9c
	.xword	0x96803b7f627e5ff9
	.xword	0xbfef6ce3abb56c16
	.xword	0x1d90fc650874bfdf
	.xword	0x79331acef81a2be6
	.xword	0xe6e494de54d904ab
	.xword	0xa3ae5a68b89e8345
	.xword	0x7640032c8ca67f8e
	.xword	0xe6c487613a8f8b23
	.xword	0x8efc3a3b85e929ca
	.xword	0xe95ba70e84c9e37c
	.xword	0xb285142373c07cc7
	.xword	0x569e86d6a16f98ff
	.xword	0xc3e24ad06ae309ec
	.xword	0x27452cca28a15586
	.xword	0x15faf91a89c411ad
	.xword	0x00040090885e4510
	.xword	0xecc5a8b13c90ecfb
	.xword	0xb1a077fbd2fc1bf9
	.xword	0xce62551137d5d716
	.xword	0x84030181878a0630
	.xword	0x1e49219a0f0f6ddd
	.xword	0xa0703222eabb6d24
	.xword	0x6b105ede98d1653a
	.xword	0x5fcb7e2a146667d3
	.xword	0xb8ea863cf57b0cfa
	.xword	0x61c0f31916e032d8
	.xword	0x111e6a8bb6c65827
	.xword	0xa4e16736f1978062
	.xword	0xe08eab1241e1f237
	.xword	0x626f8effe61a07cd
	.xword	0xd45a1c6a5f0a811c
	.xword	0xdac7a10a2f0a58cc
	.xword	0x4025a5497cad5876
	.xword	0x64b79a80b3d787a9
	.xword	0xd708cc8981488082
	.xword	0xda5796ed9d7f4268
	.xword	0xe7bbaf74dd64fb6f

.global wdog_2_ext
# 9 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
.global wdog_2_ext
.global retry_with_base_tba

SECTION .HTRAPS
.text
retry_with_base_tba:
    set 0x120000, %r2
    set 0x7fff, %r3
    rdpr %tpc, %r4
    and %r4, %r3, %r4
    or %r2, %r4, %r4
    wrpr %r4, %tpc
    add %r4, 0x4, %r4
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
# 63 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
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
# 396 "diag.j"



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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
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
	TTE_X	 = 0
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
	TTE_CP	 = 0,
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
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
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

