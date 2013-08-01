/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_12_15_3.s
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

#define H_HT0_mem_address_range_0x2e
#define SUN_H_HT0_mem_address_range_0x2e \
    done;nop

#define H_HT0_DAE_nc_page_0x16
#define SUN_H_HT0_DAE_nc_page_0x16 \
    done;nop

#define H_HT0_DAE_nfo_page_0x17
#define SUN_H_HT0_DAE_nfo_page_0x17 \
    done;nop
# 713 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_unauth_access_0x0b
#define SUN_H_HT0_IAE_unauth_access_0x0b \
    done;nop
# 718 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_nfo_page_0x0c
#define SUN_H_HT0_IAE_nfo_page_0x0c \
    done;nop
# 727 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
    ldxa    [%g0] ASI_LSU_CTL_REG, %g1; \
    set cregs_lsu_ctl_reg_r64, %g1; \
    stxa    %g1, [%g0] ASI_LSU_CTL_REG; \
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
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g1 ;\
    ldxa    [%g0] ASI_SWVR_INTR_R, %g2 ;\
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g3 ;\
    cmp %g1, %g3 ;\
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
    set 0x1ff8bfff, %g2;\
    wr %g2, %g0, %pcr;\
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
    set 0x1ff8bfff, %g2;\
    wr %g2, %g0, %pcr;\
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
    set 0x1ff8bfff, %g2;\
    wr %g2, %g0, %pcr;\
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
	mov 0x31, %r14
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
	mov 0x31, %r14
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
change_to_randtl_7_0:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_0:
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_7_1:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 3: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_7_2:
	.word 0x81982007  ! 4: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0007, %hpstate
splash_cmpr_7_3:
	setx 0xe16adde4958db9a4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 5: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_4
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_4
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_4:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 6: RDPC	rd	%pc, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01960  ! 7: FqTOd	dis not found

memptr_7_6:
	set user_data_start, %r31
	.word 0x8584b0e9  ! 8: WRCCR_I	wr	%r18, 0x10e9, %ccr
mondo_7_7:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d948009  ! 9: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
	.word 0xd48fe000  ! 10: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r10
memptr_7_8:
	set 0x60340000, %r31
	.word 0x8584796c  ! 11: WRCCR_I	wr	%r17, 0x196c, %ccr
splash_cmpr_7_9:
	setx 0x61c15d7326b8cc2a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 12: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_7_10:
	.word 0x81982157  ! 13: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0157, %hpstate
splash_hpstate_7_11:
	.word 0x81982744  ! 14: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0744, %hpstate
	.word 0x91d02032  ! 15: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x99902000  ! 16: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
debug_7_12:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 17: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xd42fe243  ! 18: STB_I	stb	%r10, [%r31 + 0x0243]
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_13
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_13:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00d  ! 19: CASA_R	casa	[%r31] %asi, %r13, %r10
	.word 0x8d90358c  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x158c, %pstate
DS_7_14:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 21: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xd4d7e000  ! 22: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
	.word 0xd53fe243  ! 23: STDF_I	std	%f10, [0x0243, %r31]
	.word 0xd44fe243  ! 24: LDSB_I	ldsb	[%r31 + 0x0243], %r10
	.word 0xd4d7e030  ! 25: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
	.word 0x83d02035  ! 26: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xa5a01a6d  ! 27: FqTOi	fqtoi	
	.word 0x87802016  ! 28: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xe0d7e020  ! 29: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
	.word 0xe127e243  ! 30: STF_I	st	%f16, [0x0243, %r31]
	.word 0x97a00163  ! 31: FABSq	dis not found

splash_tba_7_15:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_7_16:
	.word 0x99a109cc  ! 1: FDIVd	fdivd	%f4, %f12, %f12
	.word 0xe332aa68  ! 1: STQF_I	-	%f17, [0x0a68, %r10]
	normalw
	.word 0x93458000  ! 33: RD_SOFTINT_REG	rd	%softint, %r9
debug_7_17:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 34: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_18
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_18
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_18:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 35: RDPC	rd	%pc, %r9
	.word 0xd0900e80  ! 36: LDUHA_R	lduha	[%r0, %r0] 0x74, %r8
cwp_7_19:
    set user_data_start, %o7
	.word 0x93902000  ! 37: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_tba_7_20:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 38: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd06ffd6b  ! 39: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffd6b]
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 40: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93a149b1  ! 41: FDIVs	fdivs	%f5, %f17, %f9
cwp_7_21:
    set user_data_start, %o7
	.word 0x93902003  ! 42: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d802000  ! 43: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01969  ! 44: FqTOd	dis not found

tagged_7_23:
	taddcctv %r21, 0x12f2, %r19
	.word 0xd407fd6b  ! 45: LDUW_I	lduw	[%r31 + 0xfffffd6b], %r10
	.word 0xd48008a0  ! 46: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_7_24:
	setx 0xa3522fec12a8ddf7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 47: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_7_25:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f12, %f16, %f28
	.word 0x95b34312  ! 48: ALIGNADDRESS	alignaddr	%r13, %r18, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r10
splash_cmpr_7_26:
	setx 0xd9b9809cce5d0787, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 51: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_7_27:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 52: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
intveclr_7_28:
	setx 0x134e13ffbe735704, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 53: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 54: Tcc_R	tne	icc_or_xcc, %r0 + %r30
donret_7_29:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_29-donret_7_29-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_29:
	.word 0xd4fffd6b  ! 55: SWAPA_I	swapa	%r10, [%r31 + 0xfffffd6b] %asi
DS_7_30:
	.word 0x99a049d3  ! 1: FDIVd	fdivd	%f32, %f50, %f12
	.word 0xbfefc000  ! 56: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa46c22ab  ! 57: UDIVX_I	udivx 	%r16, 0x02ab, %r18
	.word 0xd4800ac0  ! 58: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r10
splash_tba_7_31:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 59: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_7_32:
	setx 0x518e0660b76c2f9a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 60: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4c7e000  ! 61: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r10
change_to_randtl_7_33:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_33:
	.word 0x8f902002  ! 62: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd4d804a0  ! 63: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 64: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_hpstate_7_34:
	.word 0x8198219c  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x019c, %hpstate
	.word 0x83d02033  ! 66: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x95a4c9cb  ! 67: FDIVd	fdivd	%f50, %f42, %f10
donret_7_35:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_35-donret_7_35-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_35:
	.word 0xd8fffd90  ! 68: SWAPA_I	swapa	%r12, [%r31 + 0xfffffd90] %asi
	.word 0xd8bfc020  ! 69: STDA_R	stda	%r12, [%r31 + %r0] 0x01
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 70: LDX_R	ldx	[%r31 + %r0], %r12
change_to_randtl_7_36:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_36:
	.word 0x8f902001  ! 71: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd877c000  ! 72: STX_R	stx	%r12, [%r31 + %r0]
	.word 0xd89fc020  ! 73: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
cwp_7_37:
    set user_data_start, %o7
	.word 0x93902000  ! 74: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_tba_7_38:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 75: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_7_39:
	taddcctv %r3, 0x116c, %r11
	.word 0xd807fd90  ! 76: LDUW_I	lduw	[%r31 + 0xfffffd90], %r12
mondo_7_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d92c010  ! 77: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
mondo_7_41:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d91c00c  ! 78: WRPR_WSTATE_R	wrpr	%r7, %r12, %wstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_42:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e007  ! 79: CASA_R	casa	[%r31] %asi, %r7, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 80: LDX_R	ldx	[%r31 + %r0], %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd857c000  ! 82: LDSH_R	ldsh	[%r31 + %r0], %r12
	.word 0x96dd0003  ! 83: SMULcc_R	smulcc 	%r20, %r3, %r11
	.word 0x8d902169  ! 84: WRPR_PSTATE_I	wrpr	%r0, 0x0169, %pstate
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_43
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_43:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 85: RDPC	rd	%pc, %r19
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 86: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_7_44-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_44:
	.word 0x9194c012  ! 87: WRPR_PIL_R	wrpr	%r19, %r18, %pil
splash_cmpr_7_45:
	setx 0xe48f7393b1de8211, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 88: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9021af  ! 89: WRPR_PSTATE_I	wrpr	%r0, 0x01af, %pstate
	.word 0x91d02034  ! 90: Tcc_I	ta	icc_or_xcc, %r0 + 52
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 91: LDX_R	ldx	[%r31 + %r0], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_46) + 16, 16, 16)) -> intp(5,0,3)
intvec_7_46:
	.word 0x39400001  ! 92: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x77ca3582b748bbc8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_47:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 94: Tcc_I	ta	icc_or_xcc, %r0 + 52
change_to_randtl_7_48:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_48:
	.word 0x8f902001  ! 95: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_7_49:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 96: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d020b2  ! 97: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_hpstate_7_50:
	.word 0x81982edd  ! 98: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edd, %hpstate
	.word 0x9f8038b9  ! 99: SIR	sir	0x18b9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 100: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 101: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe48804a0  ! 102: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
	.word 0x8790235d  ! 103: WRPR_TT_I	wrpr	%r0, 0x035d, %tt
splash_cmpr_7_51:
	setx 0x13f85f8a4c3dbfa8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 104: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_7_52:
	tsubcctv %r6, 0x1769, %r13
	.word 0xe407e86a  ! 105: LDUW_I	lduw	[%r31 + 0x086a], %r18
splash_cmpr_7_53:
	setx 0xddd10b2fa7f8a777, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91a0016a  ! 107: FABSq	dis not found

	.word 0x87902340  ! 108: WRPR_TT_I	wrpr	%r0, 0x0340, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6c232f  ! 109: SDIVX_I	sdivx	%r16, 0x032f, %r13
	.word 0xe4c7e010  ! 110: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916c7af1  ! 111: SDIVX_I	sdivx	%r17, 0xfffffaf1, %r8
splash_lsu_7_56:
	setx 0x3a6c20f9b058ecbf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 112: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_7_57:
    set user_data_start, %o7
	.word 0x93902003  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x99a14dc8  ! 114: FdMULq	fdmulq	
	.word 0xd517c000  ! 115: LDQF_R	-	[%r31, %r0], %f10
	.word 0xd46fff0b  ! 116: LDSTUB_I	ldstub	%r10, [%r31 + 0xffffff0b]
	.word 0xad833a5f  ! 117: WR_SOFTINT_REG_I	wr	%r12, 0x1a5f, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_58) + 16, 16, 16)) -> intp(6,0,23)
intvec_7_58:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 119: RDPR_TICK	rdpr	%tick, %r0
cwp_7_59:
    set user_data_start, %o7
	.word 0x93902000  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	rd %pc, %r19
	add %r19, (ivw_7_60-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_60:
	.word 0x91950011  ! 121: WRPR_PIL_R	wrpr	%r20, %r17, %pil
	.word 0xd4c80e60  ! 122: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r10
splash_lsu_7_61:
	setx 0x15b089e4fa740e5b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 123: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_62:
	setx 0x99a48a43dbe9c18e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 124: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_63:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 125: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 126: LDX_R	ldx	[%r31 + %r0], %r10
tagged_7_64:
	tsubcctv %r18, 0x1c2c, %r23
	.word 0xd407eaae  ! 127: LDUW_I	lduw	[%r31 + 0x0aae], %r10
	.word 0xd48008a0  ! 128: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
mondo_7_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d924000  ! 129: WRPR_WSTATE_R	wrpr	%r9, %r0, %wstate
	.word 0x93d02032  ! 130: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xd46feaae  ! 131: LDSTUB_I	ldstub	%r10, [%r31 + 0x0aae]
splash_hpstate_7_66:
	.word 0x8198241e  ! 132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041e, %hpstate
	.word 0x97a0056b  ! 133: FSQRTq	fsqrt	
	.word 0x87802080  ! 134: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d802004  ! 135: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81510000  ! 136: RDPR_TICK	rdpr	%tick, %r0
	.word 0xa3500000  ! 137: RDPR_TPC	rdpr	%tpc, %r17
pmu_7_67:
	nop
	setx 0xfffffec4fffffb18, %g1, %g7
	.word 0xa3800007  ! 138: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_hpstate_7_68:
	.word 0x81982254  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0254, %hpstate
intveclr_7_69:
	setx 0x3ad56bf74862e86d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_70
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_70:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 141: RDPC	rd	%pc, %r8
	.word 0xd28008a0  ! 142: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01960  ! 143: FqTOd	dis not found

splash_lsu_7_72:
	setx 0xbefb8480f55285f1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 144: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_7_73:
    set user_data_start, %o7
	.word 0x93902001  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_cmpr_7_74:
	setx 0x81c763c19fc5ed07, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 146: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_7_75:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_75:
	.word 0x8f902003  ! 147: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
mondo_7_76:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d90c000  ! 148: WRPR_WSTATE_R	wrpr	%r3, %r0, %wstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_77
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_77:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 149: CASA_R	casa	[%r31] %asi, %r17, %r13
intveclr_7_78:
	setx 0x58919ab0498ab7d9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a0196c  ! 151: FqTOd	dis not found

debug_7_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 152: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16b6dd4  ! 153: SDIVX_I	sdivx	%r13, 0x0dd4, %r16
	.word 0xd4800bc0  ! 154: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r10
	.word 0xa190200e  ! 155: WRPR_GL_I	wrpr	%r0, 0x000e, %-
mondo_7_82:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d91c002  ! 156: WRPR_WSTATE_R	wrpr	%r7, %r2, %wstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_83
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_83:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e005  ! 157: CASA_R	casa	[%r31] %asi, %r5, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 158: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4bff810  ! 159: STDA_I	stda	%r10, [%r31 + 0xfffff810] %asi
	.word 0x91d02032  ! 160: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_lsu_7_84:
	setx 0x373b7fc9effcc27f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 161: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_7_85:
	setx 0x7506ca756155eb37, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xad84b3d5  ! 163: WR_SOFTINT_REG_I	wr	%r18, 0x13d5, %softint
DS_7_86:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f14, %f10, %f24
	.word 0x97b0c310  ! 164: ALIGNADDRESS	alignaddr	%r3, %r16, %r11
	.word 0x9f80287e  ! 165: SIR	sir	0x087e
	.word 0xd2880e60  ! 166: LDUBA_R	lduba	[%r0, %r0] 0x73, %r9
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_87
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_87:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 167: RDPC	rd	%pc, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd08008a0  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
splash_cmpr_7_88:
	setx 0x2451c9c5eb1d3583, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 170: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_89)+32, 16, 16)) -> intp(7,1,3)
xir_7_89:
	.word 0xa9812324  ! 171: WR_SET_SOFTINT_I	wr	%r4, 0x0324, %set_softint
intveclr_7_90:
	setx 0x6fbf002d65135570, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902005  ! 173: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x8780208a  ! 174: WRASI_I	wr	%r0, 0x008a, %asi
memptr_7_91:
	set 0x60140000, %r31
	.word 0x8582e900  ! 175: WRCCR_I	wr	%r11, 0x0900, %ccr
	.word 0xd0d7e020  ! 176: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 177: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_decr_7_92:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r9, [%r1] 0x45
	.word 0xa780c00c  ! 178: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r12, %-
memptr_7_93:
	set user_data_start, %r31
	.word 0x8581651a  ! 179: WRCCR_I	wr	%r5, 0x051a, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_94) + 16, 16, 16)) -> intp(0,0,31)
intvec_7_94:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200f  ! 181: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x879021e9  ! 182: WRPR_TT_I	wrpr	%r0, 0x01e9, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 183: LDX_R	ldx	[%r31 + %r0], %r8
splash_tba_7_95:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 184: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_7_96:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 185: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
tagged_7_97:
	taddcctv %r22, 0x1a1b, %r24
	.word 0xd007e0a0  ! 186: LDUW_I	lduw	[%r31 + 0x00a0], %r8
splash_cmpr_7_98:
	setx 0x3d4b05a6ee9eb699, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 187: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_7_99:
	nop
	setx 0xfffff15efffffa12, %g1, %g7
	.word 0xa3800007  ! 188: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_7_100:
    set user_data_start, %o7
	.word 0x93902005  ! 189: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81460000  ! 190: RD_STICK_REG	stbar
change_to_randtl_7_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_101:
	.word 0x8f902001  ! 191: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_7_102:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 192: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 193: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9814010  ! 194: WR_SET_SOFTINT_R	wr	%r5, %r16, %set_softint
	.word 0x8d902eac  ! 195: WRPR_PSTATE_I	wrpr	%r0, 0x0eac, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 196: LDX_R	ldx	[%r31 + %r0], %r8
debug_7_103:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 197: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_7_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_104:
	.word 0x8f902002  ! 198: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d9032df  ! 199: WRPR_PSTATE_I	wrpr	%r0, 0x12df, %pstate
cwp_7_105:
    set user_data_start, %o7
	.word 0x93902000  ! 200: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
pmu_7_106:
	nop
	setx 0xfffff044fffffa9d, %g1, %g7
	.word 0xa3800007  ! 201: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d02033  ! 202: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xa190200d  ! 203: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x9b454000  ! 204: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_107:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 205: CASA_R	casa	[%r31] %asi, %r16, %r9
tagged_7_108:
	tsubcctv %r21, 0x18e8, %r25
	.word 0xd207e0a0  ! 206: LDUW_I	lduw	[%r31 + 0x00a0], %r9
	setx 0x2c56dbb6eb093425, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_109:
	.word 0x39400001  ! 207: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd2d80e80  ! 208: LDXA_R	ldxa	[%r0, %r0] 0x74, %r9
memptr_7_110:
	set 0x60340000, %r31
	.word 0x8580efd1  ! 209: WRCCR_I	wr	%r3, 0x0fd1, %ccr
	.word 0xd327e9cb  ! 210: STF_I	st	%f9, [0x09cb, %r31]
debug_7_111:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 211: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
splash_lsu_7_112:
	setx 0x17cf6d0cb0bf60e5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 212: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93a0c9f0  ! 213: FDIVq	dis not found

memptr_7_113:
	set 0x60540000, %r31
	.word 0x85853b5e  ! 214: WRCCR_I	wr	%r20, 0x1b5e, %ccr
	.word 0xd8dfe030  ! 215: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
memptr_7_114:
	set user_data_start, %r31
	.word 0x8582720e  ! 216: WRCCR_I	wr	%r9, 0x120e, %ccr
splash_lsu_7_115:
	setx 0x99362e876892977b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_116
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_116:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 218: RDPC	rd	%pc, %r11
	.word 0x93450000  ! 219: RD_SET_SOFTINT	rd	%set_softint, %r9
	.word 0x99a01a62  ! 220: FqTOi	fqtoi	
	.word 0xd137c000  ! 221: STQF_R	-	%f8, [%r0, %r31]
	.word 0x3c700001  ! 222: BPPOS	<illegal instruction>
	.word 0x8790211b  ! 223: WRPR_TT_I	wrpr	%r0, 0x011b, %tt
	.word 0xa3a0016b  ! 224: FABSq	dis not found

splash_cmpr_7_117:
	setx 0x309423f7b946685a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 225: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_118:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 226: CASA_R	casa	[%r31] %asi, %r19, %r13
intveclr_7_119:
	setx 0x147b0dec1682aed8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 227: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_7_120:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe37c7b89	! Random illegal ?
	.word 0xd9110011  ! 1: LDQF_R	-	[%r4, %r17], %f12
	.word 0x9ba44824  ! 228: FADDs	fadds	%f17, %f4, %f13
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 229: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 230: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_7_121:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_121:
	.word 0x8f902000  ! 231: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
memptr_7_122:
	set 0x60340000, %r31
	.word 0x8584f470  ! 232: WRCCR_I	wr	%r19, 0x1470, %ccr
splash_tba_7_123:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 233: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8790214f  ! 234: WRPR_TT_I	wrpr	%r0, 0x014f, %tt
splash_cmpr_7_124:
	setx 0xc6a4485a9806108a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 235: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4cfe020  ! 236: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r10
debug_7_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 237: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91696957  ! 238: SDIVX_I	sdivx	%r5, 0x0957, %r8
	rd %pc, %r19
	add %r19, (ivw_7_127-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_127:
	.word 0x91928007  ! 239: WRPR_PIL_R	wrpr	%r10, %r7, %pil
	.word 0xd88fe010  ! 240: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
splash_cmpr_7_128:
	setx 0xdb114def30114791, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 241: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd88008a0  ! 242: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 243: LDX_R	ldx	[%r31 + %r0], %r12
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 244: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_7_129:
	setx 0xbac7cffbe5a537e0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 245: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_130:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 246: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
DS_7_131:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 247: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa3a309c2  ! 248: FDIVd	fdivd	%f12, %f2, %f48
	.word 0xa3a00167  ! 249: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01960  ! 250: FqTOd	dis not found

mondo_7_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d950003  ! 251: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
	.word 0x87802020  ! 252: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xd81fc000  ! 253: LDD_R	ldd	[%r31 + %r0], %r12
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 254: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2e800001  ! 255: BVS	bvs,a	<label_0x1>
debug_7_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 256: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd82ffda1  ! 257: STB_I	stb	%r12, [%r31 + 0xfffffda1]
DS_7_135:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x93a00540  ! 1: FSQRTd	fsqrt	
	.word 0x99a4c825  ! 258: FADDs	fadds	%f19, %f5, %f12
	.word 0xab810004  ! 259: WR_CLEAR_SOFTINT_R	wr	%r4, %r4, %clear_softint
debug_7_136:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 260: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902002  ! 261: WRPR_GL_I	wrpr	%r0, 0x0002, %-
change_to_randtl_7_137:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_137:
	.word 0x8f902002  ! 262: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_138) + 56, 16, 16)) -> intp(4,0,12)
intvec_7_138:
	.word 0x39400001  ! 263: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_139
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_139:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 264: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0x8d903fd5  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x1fd5, %pstate
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_140
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_140:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 266: RDPC	rd	%pc, %r13
intveclr_7_141:
	setx 0x1812c4ea8f968ef6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 267: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 268: WRASI_I	wr	%r0, 0x0058, %asi
change_to_randtl_7_142:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_142:
	.word 0x8f902000  ! 269: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_7_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_143:
	.word 0x8f902000  ! 270: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd257c000  ! 271: LDSH_R	ldsh	[%r31 + %r0], %r9
mondo_7_144:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d950011  ! 272: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
	.word 0x9194ae4e  ! 273: WRPR_PIL_I	wrpr	%r18, 0x0e4e, %pil
splash_tba_7_145:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 274: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1902001  ! 275: WRPR_GL_I	wrpr	%r0, 0x0001, %-
memptr_7_146:
	set 0x60740000, %r31
	.word 0x85832207  ! 276: WRCCR_I	wr	%r12, 0x0207, %ccr
	.word 0xa3a00167  ! 277: FABSq	dis not found

splash_cmpr_7_147:
	setx 0x66fa741079311861, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_148:
	setx 0x148dd030c5e998fd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 279: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_7_149:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_149-donret_7_149-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_149:
	.word 0xdaffec13  ! 280: SWAPA_I	swapa	%r13, [%r31 + 0x0c13] %asi
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_150:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 281: CASA_R	casa	[%r31] %asi, %r16, %r13
intveclr_7_151:
	setx 0x7b65aedccaa866b8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 282: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_7_152:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 283: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_7_153:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 284: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0xa1a309d4  ! 285: FDIVd	fdivd	%f12, %f20, %f16
	.word 0xda800b00  ! 286: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r13
donret_7_154:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_154-donret_7_154), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_154:
	.word 0xdaffec13  ! 287: SWAPA_I	swapa	%r13, [%r31 + 0x0c13] %asi
	.word 0x8d9028f3  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x08f3, %pstate
	.word 0xdaffc021  ! 289: SWAPA_R	swapa	%r13, [%r31 + %r1] 0x01
splash_htba_7_155:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 290: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xda4fec13  ! 291: LDSB_I	ldsb	[%r31 + 0x0c13], %r13
debug_7_156:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 292: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
debug_7_157:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 293: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa945c000  ! 294: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0xe80fec13  ! 295: LDUB_I	ldub	[%r31 + 0x0c13], %r20
	.word 0xe847ec13  ! 296: LDSW_I	ldsw	[%r31 + 0x0c13], %r20
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_158
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_158:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e001  ! 297: CASA_R	casa	[%r31] %asi, %r1, %r20
	.word 0xa1902001  ! 298: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xe83fc000  ! 299: STD_R	std	%r20, [%r31 + %r0]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 300: LDX_R	ldx	[%r31 + %r0], %r20
splash_hpstate_7_159:
	.word 0x81982e46  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e46, %hpstate
	.word 0xe88008a0  ! 302: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
cwp_7_160:
    set user_data_start, %o7
	.word 0x93902003  ! 303: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
memptr_7_161:
	set 0x60740000, %r31
	.word 0x858326eb  ! 304: WRCCR_I	wr	%r12, 0x06eb, %ccr
	.word 0xe8dfe000  ! 305: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
splash_tba_7_162:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 306: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_decr_7_163:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r11, [%r1] 0x45
	.word 0xa7824011  ! 307: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r17, %-
splash_hpstate_7_164:
	.word 0x819821d7  ! 308: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d7, %hpstate
	setx 0xf0b74e559ce5bedc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_165:
	.word 0x39400001  ! 309: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_7_166:
	setx 0xccafd3335f388889, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 310: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_7_167:
	.word 0x81982ad6  ! 311: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad6, %hpstate
	.word 0x83d020b3  ! 312: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0xe807c000  ! 313: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0x91d02035  ! 314: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_7_168:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 315: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
splash_cmpr_7_169:
	setx 0x4bc6a2fe16edde1e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 316: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91927318  ! 317: WRPR_PIL_I	wrpr	%r9, 0x1318, %pil
splash_cmpr_7_170:
	setx 0x8875ca4e810b2dc3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 318: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_171:
	setx 0x405180c39ef72197, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_172:
	setx 0x9016bb154de99776, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 320: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32800001  ! 321: BNE	bne,a	<label_0x1>
splash_lsu_7_173:
	setx 0xdf1b914227364f6f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 322: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_7_174:
	set user_data_start, %r31
	.word 0x858229a3  ! 323: WRCCR_I	wr	%r8, 0x09a3, %ccr
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_175
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_175:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 324: RDPC	rd	%pc, %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a0196b  ! 325: FqTOd	dis not found

splash_cmpr_7_177:
	setx 0x01e2e83432006459, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_178:
	setx 0x1907d984ab427dbf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 327: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe827eb39  ! 328: STW_I	stw	%r20, [%r31 + 0x0b39]
	.word 0x91500000  ! 329: RDPR_TPC	<illegal instruction>
	.word 0xa3a00171  ! 330: FABSq	dis not found

	.word 0xa7464000  ! 331: RD_STICK_CMPR_REG	rd	%-, %r19
	.word 0xe23fc000  ! 332: STD_R	std	%r17, [%r31 + %r0]
	.word 0xa4684004  ! 333: UDIVX_R	udivx 	%r1, %r4, %r18
	.word 0xa2800000  ! 334: ADDcc_R	addcc 	%r0, %r0, %r17
	.word 0x87902177  ! 335: WRPR_TT_I	wrpr	%r0, 0x0177, %tt
	.word 0x91d020b2  ! 336: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a0196d  ! 337: FqTOd	dis not found

splash_cmpr_7_180:
	setx 0x1bebe6f095eaca20, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 338: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_181:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 339: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
intveclr_7_182:
	setx 0xe3fdd2504f270152, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 340: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9169a6c8  ! 341: SDIVX_I	sdivx	%r6, 0x06c8, %r8
	.word 0x95480000  ! 342: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x91d02035  ! 343: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_7_184:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f24, %f28, %f12
	.word 0xa1b20312  ! 344: ALIGNADDRESS	alignaddr	%r8, %r18, %r16
debug_7_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 345: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_7_186:
	setx 0xb52404d2bd5ee44e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 346: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd51fc000  ! 347: LDDF_R	ldd	[%r31, %r0], %f10
mondo_7_187:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d91c004  ! 348: WRPR_WSTATE_R	wrpr	%r7, %r4, %wstate
splash_decr_7_188:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r6, [%r1] 0x45
	.word 0xa7810005  ! 349: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r5, %-
	.word 0x93a309e0  ! 350: FDIVq	dis not found

debug_7_189:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 351: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
change_to_randtl_7_190:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_190:
	.word 0x8f902000  ! 352: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd28008a0  ! 353: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_hpstate_7_191:
	.word 0x81982ad6  ! 354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad6, %hpstate
	.word 0x9153c000  ! 355: RDPR_FQ	<illegal instruction>
	.word 0xd4ffc028  ! 356: SWAPA_R	swapa	%r10, [%r31 + %r8] 0x01
intveclr_7_192:
	setx 0xbce0786f4f552c2f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 357: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd4800c20  ! 358: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r10
	.word 0xd4c004a0  ! 359: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0xa3a049cb  ! 360: FDIVd	fdivd	%f32, %f42, %f48
	.word 0xe6d7e020  ! 361: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r19
splash_hpstate_7_193:
	.word 0x819828d6  ! 362: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d6, %hpstate
debug_7_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 363: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa2d04010  ! 364: UMULcc_R	umulcc 	%r1, %r16, %r17
tagged_7_195:
	taddcctv %r22, 0x1117, %r24
	.word 0xd407f436  ! 365: LDUW_I	lduw	[%r31 + 0xfffff436], %r10
memptr_7_196:
	set 0x60740000, %r31
	.word 0x8581a478  ! 366: WRCCR_I	wr	%r6, 0x0478, %ccr
	.word 0xd46ff33c  ! 367: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff33c]
cwp_7_197:
    set user_data_start, %o7
	.word 0x93902002  ! 368: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 369: LDX_R	ldx	[%r31 + %r0], %r10
splash_cmpr_7_198:
	setx 0x5e6f7ad9eccd23ae, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 370: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_7_199:
    set user_data_start, %o7
	.word 0x93902007  ! 371: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd45ff33c  ! 372: LDX_I	ldx	[%r31 + 0xfffff33c], %r10
	.word 0x91d020b2  ! 373: Tcc_I	ta	icc_or_xcc, %r0 + 178
tagged_7_200:
	tsubcctv %r13, 0x1b90, %r5
	.word 0xd407f33c  ! 374: LDUW_I	lduw	[%r31 + 0xfffff33c], %r10
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_201:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 375: CASA_R	casa	[%r31] %asi, %r0, %r10
splash_hpstate_7_202:
	.word 0x8198221d  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021d, %hpstate
splash_cmpr_7_203:
	setx 0xdf615007351fe530, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 377: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9145c000  ! 379: RD_TICK_CMPR_REG	rd	%-, %r8
debug_7_204:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 380: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_205:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 381: CASA_R	casa	[%r31] %asi, %r0, %r10
	.word 0x87802058  ! 382: WRASI_I	wr	%r0, 0x0058, %asi
mondo_7_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d934001  ! 383: WRPR_WSTATE_R	wrpr	%r13, %r1, %wstate
	.word 0x99a000cd  ! 384: FNEGd	fnegd	%f44, %f12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 385: LDX_R	ldx	[%r31 + %r0], %r10
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 386: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_7_207:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 387: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0x8d9021f1  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x01f1, %pstate
	.word 0xa4d42b39  ! 389: UMULcc_I	umulcc 	%r16, 0x0b39, %r18
tagged_7_208:
	tsubcctv %r26, 0x1f4c, %r15
	.word 0xd207fca8  ! 390: LDUW_I	lduw	[%r31 + 0xfffffca8], %r9
intveclr_7_209:
	setx 0x90550d152e9d9b79, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 391: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_210:
	setx 0xf39cfcd048b8c6b8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_211:
	setx 0x918e1c53a90586eb, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 393: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd26ffca8  ! 394: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffffca8]
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_212
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_212:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e003  ! 395: CASA_R	casa	[%r31] %asi, %r3, %r9
	.word 0x8780201c  ! 396: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8780204f  ! 397: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01970  ! 398: FqTOd	dis not found

	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
change_to_randtl_6_0:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_0:
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_6_1:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 3: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_6_2:
	.word 0x81982f5e  ! 4: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5e, %hpstate
splash_cmpr_6_3:
	setx 0x47d6bb9180079eb2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 5: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_4
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_4
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_4:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 6: RDPC	rd	%pc, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01965  ! 7: FqTOd	dis not found

memptr_6_6:
	set user_data_start, %r31
	.word 0x858265fe  ! 8: WRCCR_I	wr	%r9, 0x05fe, %ccr
mondo_6_7:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d944014  ! 9: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0xd48fe000  ! 10: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r10
memptr_6_8:
	set 0x60340000, %r31
	.word 0x8580abb3  ! 11: WRCCR_I	wr	%r2, 0x0bb3, %ccr
splash_cmpr_6_9:
	setx 0x4e7a465999994240, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 12: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_6_10:
	.word 0x81982594  ! 13: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0594, %hpstate
splash_hpstate_6_11:
	.word 0x81982ddd  ! 14: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ddd, %hpstate
	.word 0x83d02034  ! 15: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x99902004  ! 16: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
debug_6_12:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 17: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0xd42fe243  ! 18: STB_I	stb	%r10, [%r31 + 0x0243]
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_13
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_13:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00d  ! 19: CASA_R	casa	[%r31] %asi, %r13, %r10
	.word 0x8d902019  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x0019, %pstate
DS_6_14:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 21: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xd4d7e000  ! 22: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
	.word 0xd53fe243  ! 23: STDF_I	std	%f10, [0x0243, %r31]
	.word 0xd44fe243  ! 24: LDSB_I	ldsb	[%r31 + 0x0243], %r10
	.word 0xd4d7e020  ! 25: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r10
	.word 0x83d020b4  ! 26: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0x99a01a67  ! 27: FqTOi	fqtoi	
	.word 0x87802004  ! 28: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe0d7e020  ! 29: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
	.word 0xe127e243  ! 30: STF_I	st	%f16, [0x0243, %r31]
	.word 0x93a00168  ! 31: FABSq	dis not found

splash_tba_6_15:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_6_16:
	.word 0x9ba4c9c2  ! 1: FDIVd	fdivd	%f50, %f2, %f44
	.word 0xd9326cbd  ! 1: STQF_I	-	%f12, [0x0cbd, %r9]
	normalw
	.word 0xa1458000  ! 33: RD_SOFTINT_REG	rd	%softint, %r16
debug_6_17:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 34: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_18
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_18
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_18:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 35: RDPC	rd	%pc, %r13
	.word 0xd09004a0  ! 36: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
cwp_6_19:
    set user_data_start, %o7
	.word 0x93902004  ! 37: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_tba_6_20:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 38: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd06ffd6b  ! 39: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffd6b]
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 40: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x95a4c9b1  ! 41: FDIVs	fdivs	%f19, %f17, %f10
cwp_6_21:
    set user_data_start, %o7
	.word 0x93902006  ! 42: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d802004  ! 43: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196c  ! 44: FqTOd	dis not found

tagged_6_23:
	taddcctv %r16, 0x1fdc, %r1
	.word 0xd407fd6b  ! 45: LDUW_I	lduw	[%r31 + 0xfffffd6b], %r10
	.word 0xd48008a0  ! 46: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_6_24:
	setx 0x5cbd2286d714a58d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 47: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_6_25:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f0, %f6, %f26
	.word 0x93b40313  ! 48: ALIGNADDRESS	alignaddr	%r16, %r19, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r10
splash_cmpr_6_26:
	setx 0x4d0cba877b18bdc3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 51: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_6_27:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 52: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
intveclr_6_28:
	setx 0xf0f23a31c0d72801, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 53: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 54: Tcc_R	ta	icc_or_xcc, %r0 + %r30
donret_6_29:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_29-donret_6_29-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_29:
	.word 0xd4fffd6b  ! 55: SWAPA_I	swapa	%r10, [%r31 + 0xfffffd6b] %asi
DS_6_30:
	.word 0x93a1c9d4  ! 1: FDIVd	fdivd	%f38, %f20, %f40
	.word 0xbfefc000  ! 56: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x926c6812  ! 57: UDIVX_I	udivx 	%r17, 0x0812, %r9
	.word 0xd48008a0  ! 58: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_tba_6_31:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 59: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_6_32:
	setx 0x5ed5f63e36f03163, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 60: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4c7e000  ! 61: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r10
change_to_randtl_6_33:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_33:
	.word 0x8f902001  ! 62: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd4d80e40  ! 63: LDXA_R	ldxa	[%r0, %r0] 0x72, %r10
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 64: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_6_34:
	.word 0x81982a87  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a87, %hpstate
	.word 0x91d02032  ! 66: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91a349d0  ! 67: FDIVd	fdivd	%f44, %f16, %f8
donret_6_35:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_35-donret_6_35-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_35:
	.word 0xd8fffd90  ! 68: SWAPA_I	swapa	%r12, [%r31 + 0xfffffd90] %asi
	.word 0xd8bfc020  ! 69: STDA_R	stda	%r12, [%r31 + %r0] 0x01
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 70: LDX_R	ldx	[%r31 + %r0], %r12
change_to_randtl_6_36:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_36:
	.word 0x8f902000  ! 71: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd877c000  ! 72: STX_R	stx	%r12, [%r31 + %r0]
	.word 0xd89fc020  ! 73: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
cwp_6_37:
    set user_data_start, %o7
	.word 0x93902006  ! 74: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_tba_6_38:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 75: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_6_39:
	taddcctv %r22, 0x1093, %r17
	.word 0xd807fd90  ! 76: LDUW_I	lduw	[%r31 + 0xfffffd90], %r12
mondo_6_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d90c001  ! 77: WRPR_WSTATE_R	wrpr	%r3, %r1, %wstate
mondo_6_41:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d90c012  ! 78: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_42:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e007  ! 79: CASA_R	casa	[%r31] %asi, %r7, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 80: LDX_R	ldx	[%r31 + %r0], %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd857c000  ! 82: LDSH_R	ldsh	[%r31 + %r0], %r12
	.word 0x98dc800b  ! 83: SMULcc_R	smulcc 	%r18, %r11, %r12
	.word 0x8d903f0b  ! 84: WRPR_PSTATE_I	wrpr	%r0, 0x1f0b, %pstate
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_43
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_43:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 85: RDPC	rd	%pc, %r17
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 86: Tcc_R	te	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_6_44-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_44:
	.word 0x91940012  ! 87: WRPR_PIL_R	wrpr	%r16, %r18, %pil
splash_cmpr_6_45:
	setx 0x35f2c6ea479d8f18, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 88: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902e05  ! 89: WRPR_PSTATE_I	wrpr	%r0, 0x0e05, %pstate
	.word 0x93d020b3  ! 90: Tcc_I	tne	icc_or_xcc, %r0 + 179
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 91: LDX_R	ldx	[%r31 + %r0], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_46) + 8, 16, 16)) -> intp(3,0,5)
intvec_6_46:
	.word 0x39400001  ! 92: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x599b4d55801de565, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_47:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 94: Tcc_I	ta	icc_or_xcc, %r0 + 181
change_to_randtl_6_48:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_48:
	.word 0x8f902001  ! 95: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_6_49:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 96: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x83d02034  ! 97: Tcc_I	te	icc_or_xcc, %r0 + 52
splash_hpstate_6_50:
	.word 0x81982a0e  ! 98: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0e, %hpstate
	.word 0x9f802ee6  ! 99: SIR	sir	0x0ee6
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 100: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 101: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe48804a0  ! 102: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
	.word 0x879022e8  ! 103: WRPR_TT_I	wrpr	%r0, 0x02e8, %tt
splash_cmpr_6_51:
	setx 0x49f4359caa017ee7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 104: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_6_52:
	tsubcctv %r9, 0x1835, %r10
	.word 0xe407e86a  ! 105: LDUW_I	lduw	[%r31 + 0x086a], %r18
splash_cmpr_6_53:
	setx 0x212b45fb238a0e36, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97a00160  ! 107: FABSq	dis not found

	.word 0x879021c4  ! 108: WRPR_TT_I	wrpr	%r0, 0x01c4, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916837db  ! 109: SDIVX_I	sdivx	%r0, 0xfffff7db, %r8
	.word 0xe4c7e000  ! 110: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9168f196  ! 111: SDIVX_I	sdivx	%r3, 0xfffff196, %r8
splash_lsu_6_56:
	setx 0x3cd0ab4496c4c17b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 112: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_6_57:
    set user_data_start, %o7
	.word 0x93902001  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x95a34dc1  ! 114: FdMULq	fdmulq	
	.word 0xd517c000  ! 115: LDQF_R	-	[%r31, %r0], %f10
	.word 0xd46fff0b  ! 116: LDSTUB_I	ldstub	%r10, [%r31 + 0xffffff0b]
	.word 0xad82eca8  ! 117: WR_SOFTINT_REG_I	wr	%r11, 0x0ca8, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_58) + 8, 16, 16)) -> intp(2,0,17)
intvec_6_58:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 119: RDPR_TICK	rdpr	%tick, %r0
cwp_6_59:
    set user_data_start, %o7
	.word 0x93902002  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	rd %pc, %r19
	add %r19, (ivw_6_60-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_60:
	.word 0x9190800b  ! 121: WRPR_PIL_R	wrpr	%r2, %r11, %pil
	.word 0xd4c804a0  ! 122: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
splash_lsu_6_61:
	setx 0x15e158005b57b9a7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 123: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_62:
	setx 0x99f7401c4d850477, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 124: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_63:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 125: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 126: LDX_R	ldx	[%r31 + %r0], %r10
tagged_6_64:
	tsubcctv %r1, 0x119f, %r20
	.word 0xd407eaae  ! 127: LDUW_I	lduw	[%r31 + 0x0aae], %r10
	.word 0xd48008a0  ! 128: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
mondo_6_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d928008  ! 129: WRPR_WSTATE_R	wrpr	%r10, %r8, %wstate
	.word 0x91d02032  ! 130: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd46feaae  ! 131: LDSTUB_I	ldstub	%r10, [%r31 + 0x0aae]
splash_hpstate_6_66:
	.word 0x819827b6  ! 132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07b6, %hpstate
	.word 0x99a00569  ! 133: FSQRTq	fsqrt	
	.word 0x87802058  ! 134: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8d802004  ! 135: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81510000  ! 136: RDPR_TICK	rdpr	%tick, %r0
	.word 0x9b500000  ! 137: RDPR_TPC	<illegal instruction>
pmu_6_67:
	nop
	setx 0xfffff7d0fffffc6e, %g1, %g7
	.word 0xa3800007  ! 138: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_hpstate_6_68:
	.word 0x8198258c  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058c, %hpstate
intveclr_6_69:
	setx 0xa876784731b43332, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_70
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_70:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 141: RDPC	rd	%pc, %r8
	.word 0xd2800ba0  ! 142: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01961  ! 143: FqTOd	dis not found

splash_lsu_6_72:
	setx 0x605e7ef85fdf90a3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 144: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_6_73:
    set user_data_start, %o7
	.word 0x93902000  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_cmpr_6_74:
	setx 0x738f9d24d8621644, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 146: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_6_75:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_75:
	.word 0x8f902000  ! 147: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
mondo_6_76:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d918006  ! 148: WRPR_WSTATE_R	wrpr	%r6, %r6, %wstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_77
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_77:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 149: CASA_R	casa	[%r31] %asi, %r17, %r13
intveclr_6_78:
	setx 0xeafacb5afbeee11c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01972  ! 151: FqTOd	dis not found

debug_6_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 152: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6c7c89  ! 153: SDIVX_I	sdivx	%r17, 0xfffffc89, %r13
	.word 0xd4800b80  ! 154: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r10
	.word 0xa1902004  ! 155: WRPR_GL_I	wrpr	%r0, 0x0004, %-
mondo_6_82:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d950011  ! 156: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_83
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_83:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e005  ! 157: CASA_R	casa	[%r31] %asi, %r5, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 158: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4bff810  ! 159: STDA_I	stda	%r10, [%r31 + 0xfffff810] %asi
	.word 0x83d020b5  ! 160: Tcc_I	te	icc_or_xcc, %r0 + 181
splash_lsu_6_84:
	setx 0x3318fd1098cb41d3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 161: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_6_85:
	setx 0x3980ab14a11be203, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xad84bb1c  ! 163: WR_SOFTINT_REG_I	wr	%r18, 0x1b1c, %softint
DS_6_86:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f14, %f16, %f26
	.word 0x9bb0c302  ! 164: ALIGNADDRESS	alignaddr	%r3, %r2, %r13
	.word 0x9f803001  ! 165: SIR	sir	0x1001
	.word 0xd28804a0  ! 166: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_87
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_87:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 167: RDPC	rd	%pc, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd08008a0  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
splash_cmpr_6_88:
	setx 0x9fb421e96685fdf9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 170: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_89)+0, 16, 16)) -> intp(6,1,3)
xir_6_89:
	.word 0xa9817b17  ! 171: WR_SET_SOFTINT_I	wr	%r5, 0x1b17, %set_softint
intveclr_6_90:
	setx 0x04f3cf3f079691da, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902002  ! 173: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x8780208a  ! 174: WRASI_I	wr	%r0, 0x008a, %asi
memptr_6_91:
	set 0x60140000, %r31
	.word 0x85852eca  ! 175: WRCCR_I	wr	%r20, 0x0eca, %ccr
	.word 0xd0d7e010  ! 176: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 177: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_decr_6_92:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa781c002  ! 178: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r2, %-
memptr_6_93:
	set user_data_start, %r31
	.word 0x858223de  ! 179: WRCCR_I	wr	%r8, 0x03de, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_94) + 40, 16, 16)) -> intp(6,0,25)
intvec_6_94:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902002  ! 181: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x87902069  ! 182: WRPR_TT_I	wrpr	%r0, 0x0069, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 183: LDX_R	ldx	[%r31 + %r0], %r8
splash_tba_6_95:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 184: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_6_96:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 185: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
tagged_6_97:
	taddcctv %r14, 0x1a1c, %r4
	.word 0xd007e0a0  ! 186: LDUW_I	lduw	[%r31 + 0x00a0], %r8
splash_cmpr_6_98:
	setx 0x2a8900d50f045fb1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 187: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_6_99:
	nop
	setx 0xfffffc45fffffb85, %g1, %g7
	.word 0xa3800007  ! 188: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_6_100:
    set user_data_start, %o7
	.word 0x93902003  ! 189: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81460000  ! 190: RD_STICK_REG	stbar
change_to_randtl_6_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_101:
	.word 0x8f902003  ! 191: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
debug_6_102:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 192: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 193: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9828011  ! 194: WR_SET_SOFTINT_R	wr	%r10, %r17, %set_softint
	.word 0x8d902f5f  ! 195: WRPR_PSTATE_I	wrpr	%r0, 0x0f5f, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 196: LDX_R	ldx	[%r31 + %r0], %r8
debug_6_103:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 197: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_6_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_104:
	.word 0x8f902002  ! 198: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d9031a1  ! 199: WRPR_PSTATE_I	wrpr	%r0, 0x11a1, %pstate
cwp_6_105:
    set user_data_start, %o7
	.word 0x93902007  ! 200: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
pmu_6_106:
	nop
	setx 0xfffff57dfffffe9d, %g1, %g7
	.word 0xa3800007  ! 201: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02033  ! 202: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902008  ! 203: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xa3454000  ! 204: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_107:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 205: CASA_R	casa	[%r31] %asi, %r16, %r9
tagged_6_108:
	tsubcctv %r2, 0x1d85, %r22
	.word 0xd207e0a0  ! 206: LDUW_I	lduw	[%r31 + 0x00a0], %r9
	setx 0x61984daa222c453f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_109:
	.word 0x39400001  ! 207: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd2d80e40  ! 208: LDXA_R	ldxa	[%r0, %r0] 0x72, %r9
memptr_6_110:
	set 0x60140000, %r31
	.word 0x8580bef6  ! 209: WRCCR_I	wr	%r2, 0x1ef6, %ccr
	.word 0xd327e9cb  ! 210: STF_I	st	%f9, [0x09cb, %r31]
debug_6_111:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 211: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
splash_lsu_6_112:
	setx 0x57f81ca88ffe1bf3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 212: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x95a189e6  ! 213: FDIVq	dis not found

memptr_6_113:
	set 0x60140000, %r31
	.word 0x8582312c  ! 214: WRCCR_I	wr	%r8, 0x112c, %ccr
	.word 0xd8dfe030  ! 215: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
memptr_6_114:
	set user_data_start, %r31
	.word 0x8582e27a  ! 216: WRCCR_I	wr	%r11, 0x027a, %ccr
splash_lsu_6_115:
	setx 0xb28b8a9ba590c935, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_116
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_116:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 218: RDPC	rd	%pc, %r13
	.word 0x91450000  ! 219: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0x9ba01a6c  ! 220: FqTOi	fqtoi	
	.word 0xd137c000  ! 221: STQF_R	-	%f8, [%r0, %r31]
	.word 0x3c700001  ! 222: BPPOS	<illegal instruction>
	.word 0x87902030  ! 223: WRPR_TT_I	wrpr	%r0, 0x0030, %tt
	.word 0x95a00172  ! 224: FABSq	dis not found

splash_cmpr_6_117:
	setx 0x43e2f83bbc231b73, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 225: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_118:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 226: CASA_R	casa	[%r31] %asi, %r19, %r13
intveclr_6_119:
	setx 0x458aeb1705b9e627, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 227: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_6_120:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xf179cf32	! Random illegal ?
	.word 0xd714c003  ! 1: LDQF_R	-	[%r19, %r3], %f11
	.word 0x9ba28829  ! 228: FADDs	fadds	%f10, %f9, %f13
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 229: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 230: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_6_121:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_121:
	.word 0x8f902000  ! 231: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
memptr_6_122:
	set 0x60540000, %r31
	.word 0x8581f5e7  ! 232: WRCCR_I	wr	%r7, 0x15e7, %ccr
splash_tba_6_123:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 233: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87902396  ! 234: WRPR_TT_I	wrpr	%r0, 0x0396, %tt
splash_cmpr_6_124:
	setx 0xedafce7d235bcdf6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 235: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4cfe000  ! 236: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r10
debug_6_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 237: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa768e106  ! 238: SDIVX_I	sdivx	%r3, 0x0106, %r19
	rd %pc, %r19
	add %r19, (ivw_6_127-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_127:
	.word 0x91908008  ! 239: WRPR_PIL_R	wrpr	%r2, %r8, %pil
	.word 0xd88fe000  ! 240: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
splash_cmpr_6_128:
	setx 0x527c214e08dbdb34, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 241: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8800c40  ! 242: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 243: LDX_R	ldx	[%r31 + %r0], %r12
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 244: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_6_129:
	setx 0x3442caa8c7b678e3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 245: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_130:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 246: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
DS_6_131:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 247: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa3a289d2  ! 248: FDIVd	fdivd	%f10, %f18, %f48
	.word 0x93a00168  ! 249: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01972  ! 250: FqTOd	dis not found

mondo_6_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d948000  ! 251: WRPR_WSTATE_R	wrpr	%r18, %r0, %wstate
	.word 0x8780204f  ! 252: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xd81fc000  ! 253: LDD_R	ldd	[%r31 + %r0], %r12
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 254: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2e800001  ! 255: BVS	bvs,a	<label_0x1>
debug_6_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 256: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd82ffda1  ! 257: STB_I	stb	%r12, [%r31 + 0xfffffda1]
DS_6_135:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa9a00547  ! 1: FSQRTd	fsqrt	
	.word 0x93a30833  ! 258: FADDs	fadds	%f12, %f19, %f9
	.word 0xab800009  ! 259: WR_CLEAR_SOFTINT_R	wr	%r0, %r9, %clear_softint
debug_6_136:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 260: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902000  ! 261: WRPR_GL_I	wrpr	%r0, 0x0000, %-
change_to_randtl_6_137:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_137:
	.word 0x8f902002  ! 262: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_138) + 8, 16, 16)) -> intp(0,0,20)
intvec_6_138:
	.word 0x39400001  ! 263: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_139
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_139:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 264: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0x8d903c10  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x1c10, %pstate
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_140
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_140:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 266: RDPC	rd	%pc, %r8
intveclr_6_141:
	setx 0x4065ee911c70d741, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 267: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8780208a  ! 268: WRASI_I	wr	%r0, 0x008a, %asi
change_to_randtl_6_142:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_142:
	.word 0x8f902001  ! 269: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_6_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_143:
	.word 0x8f902000  ! 270: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd257c000  ! 271: LDSH_R	ldsh	[%r31 + %r0], %r9
mondo_6_144:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d94000d  ! 272: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
	.word 0x9194310d  ! 273: WRPR_PIL_I	wrpr	%r16, 0x110d, %pil
splash_tba_6_145:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 274: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1902005  ! 275: WRPR_GL_I	wrpr	%r0, 0x0005, %-
memptr_6_146:
	set 0x60340000, %r31
	.word 0x85852b2a  ! 276: WRCCR_I	wr	%r20, 0x0b2a, %ccr
	.word 0xa3a00174  ! 277: FABSq	dis not found

splash_cmpr_6_147:
	setx 0x47e02b35c5b7567b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_148:
	setx 0x9bad7dc7811f15f8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 279: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_6_149:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_149-donret_6_149-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_149:
	.word 0xdaffec13  ! 280: SWAPA_I	swapa	%r13, [%r31 + 0x0c13] %asi
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_150:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 281: CASA_R	casa	[%r31] %asi, %r16, %r13
intveclr_6_151:
	setx 0x34e977aa70731863, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 282: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_6_152:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 283: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_6_153:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 284: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	.word 0xa9a249d4  ! 285: FDIVd	fdivd	%f40, %f20, %f20
	.word 0xda800c00  ! 286: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r13
donret_6_154:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_154-donret_6_154), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_154:
	.word 0xdaffec13  ! 287: SWAPA_I	swapa	%r13, [%r31 + 0x0c13] %asi
	.word 0x8d9034a4  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x14a4, %pstate
	.word 0xdaffc021  ! 289: SWAPA_R	swapa	%r13, [%r31 + %r1] 0x01
splash_htba_6_155:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 290: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xda4fec13  ! 291: LDSB_I	ldsb	[%r31 + 0x0c13], %r13
debug_6_156:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 292: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
debug_6_157:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 293: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa945c000  ! 294: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0xe80fec13  ! 295: LDUB_I	ldub	[%r31 + 0x0c13], %r20
	.word 0xe847ec13  ! 296: LDSW_I	ldsw	[%r31 + 0x0c13], %r20
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_158
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_158:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e001  ! 297: CASA_R	casa	[%r31] %asi, %r1, %r20
	.word 0xa190200e  ! 298: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xe83fc000  ! 299: STD_R	std	%r20, [%r31 + %r0]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 300: LDX_R	ldx	[%r31 + %r0], %r20
splash_hpstate_6_159:
	.word 0x8198230c  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030c, %hpstate
	.word 0xe88008a0  ! 302: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
cwp_6_160:
    set user_data_start, %o7
	.word 0x93902003  ! 303: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
memptr_6_161:
	set 0x60740000, %r31
	.word 0x85807cf4  ! 304: WRCCR_I	wr	%r1, 0x1cf4, %ccr
	.word 0xe8dfe020  ! 305: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r20
splash_tba_6_162:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 306: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_decr_6_163:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r10, [%r1] 0x45
	.word 0xa7844014  ! 307: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r20, %-
splash_hpstate_6_164:
	.word 0x8198259c  ! 308: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059c, %hpstate
	setx 0x746d005ecd3b2a73, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_165:
	.word 0x39400001  ! 309: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_6_166:
	setx 0xaaf9a2a2dc74c68f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 310: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_6_167:
	.word 0x819827de  ! 311: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07de, %hpstate
	.word 0x91d02034  ! 312: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe807c000  ! 313: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0x91d02032  ! 314: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_6_168:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 315: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
splash_cmpr_6_169:
	setx 0x564c4c3b5aaee203, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 316: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91943912  ! 317: WRPR_PIL_I	wrpr	%r16, 0x1912, %pil
splash_cmpr_6_170:
	setx 0x8e70bfe94068c35f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 318: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_171:
	setx 0xf8c41bb920cae2da, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_172:
	setx 0x492bbc6b7ee51b03, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 320: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32800001  ! 321: BNE	bne,a	<label_0x1>
splash_lsu_6_173:
	setx 0x0a2b08fe4a70dfa1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 322: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_6_174:
	set user_data_start, %r31
	.word 0x8580b9f6  ! 323: WRCCR_I	wr	%r2, 0x19f6, %ccr
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_175
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_175:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 324: RDPC	rd	%pc, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01961  ! 325: FqTOd	dis not found

splash_cmpr_6_177:
	setx 0x37f8393cfa4ff880, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_178:
	setx 0xd45729c9f0697569, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 327: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe827eb39  ! 328: STW_I	stw	%r20, [%r31 + 0x0b39]
	.word 0x97500000  ! 329: RDPR_TPC	<illegal instruction>
	.word 0x93a00160  ! 330: FABSq	dis not found

	.word 0xa3464000  ! 331: RD_STICK_CMPR_REG	rd	%-, %r17
	.word 0xe23fc000  ! 332: STD_R	std	%r17, [%r31 + %r0]
	.word 0x9a698005  ! 333: UDIVX_R	udivx 	%r6, %r5, %r13
	.word 0x96844000  ! 334: ADDcc_R	addcc 	%r17, %r0, %r11
	.word 0x87902122  ! 335: WRPR_TT_I	wrpr	%r0, 0x0122, %tt
	.word 0x91d02035  ! 336: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01965  ! 337: FqTOd	dis not found

splash_cmpr_6_180:
	setx 0x7c83546358af22ea, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 338: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_181:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 339: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
intveclr_6_182:
	setx 0xeb003b71b3d3f31d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 340: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976cb908  ! 341: SDIVX_I	sdivx	%r18, 0xfffff908, %r11
	.word 0x9b480000  ! 342: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0x91d02033  ! 343: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_6_184:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f2, %f10, %f0
	.word 0x95b0030a  ! 344: ALIGNADDRESS	alignaddr	%r0, %r10, %r10
debug_6_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 345: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_6_186:
	setx 0x68c8e8a19bef2ee5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 346: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd51fc000  ! 347: LDDF_R	ldd	[%r31, %r0], %f10
mondo_6_187:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d910012  ! 348: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
splash_decr_6_188:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa784c006  ! 349: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r6, %-
	.word 0x9ba049e5  ! 350: FDIVq	dis not found

debug_6_189:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 351: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
change_to_randtl_6_190:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_190:
	.word 0x8f902002  ! 352: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd2800a80  ! 353: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r9
splash_hpstate_6_191:
	.word 0x81982b4c  ! 354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4c, %hpstate
	.word 0x9753c000  ! 355: RDPR_FQ	<illegal instruction>
	.word 0xd4ffc028  ! 356: SWAPA_R	swapa	%r10, [%r31 + %r8] 0x01
intveclr_6_192:
	setx 0x94dc422e3093eed6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 357: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 358: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd4c004a0  ! 359: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x99a2c9c0  ! 360: FDIVd	fdivd	%f42, %f0, %f12
	.word 0xe6d7e020  ! 361: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r19
splash_hpstate_6_193:
	.word 0x81982bcc  ! 362: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcc, %hpstate
debug_6_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 363: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x98d20011  ! 364: UMULcc_R	umulcc 	%r8, %r17, %r12
tagged_6_195:
	taddcctv %r15, 0x1caf, %r4
	.word 0xd407f436  ! 365: LDUW_I	lduw	[%r31 + 0xfffff436], %r10
memptr_6_196:
	set 0x60540000, %r31
	.word 0x85842422  ! 366: WRCCR_I	wr	%r16, 0x0422, %ccr
	.word 0xd46ff33c  ! 367: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff33c]
cwp_6_197:
    set user_data_start, %o7
	.word 0x93902000  ! 368: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 369: LDX_R	ldx	[%r31 + %r0], %r10
splash_cmpr_6_198:
	setx 0x883b55c2d381702b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 370: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_6_199:
    set user_data_start, %o7
	.word 0x93902000  ! 371: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd45ff33c  ! 372: LDX_I	ldx	[%r31 + 0xfffff33c], %r10
	.word 0x83d02032  ! 373: Tcc_I	te	icc_or_xcc, %r0 + 50
tagged_6_200:
	tsubcctv %r8, 0x1647, %r14
	.word 0xd407f33c  ! 374: LDUW_I	lduw	[%r31 + 0xfffff33c], %r10
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_201:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 375: CASA_R	casa	[%r31] %asi, %r0, %r10
splash_hpstate_6_202:
	.word 0x81982e0c  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0c, %hpstate
splash_cmpr_6_203:
	setx 0x83502da2f741d915, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 377: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9745c000  ! 379: RD_TICK_CMPR_REG	rd	%-, %r11
debug_6_204:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 380: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_205:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 381: CASA_R	casa	[%r31] %asi, %r0, %r10
	.word 0x87802083  ! 382: WRASI_I	wr	%r0, 0x0083, %asi
mondo_6_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d900000  ! 383: WRPR_WSTATE_R	wrpr	%r0, %r0, %wstate
	.word 0xa7a000c0  ! 384: FNEGd	fnegd	%f0, %f50
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 385: LDX_R	ldx	[%r31 + %r0], %r10
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 386: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_6_207:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 387: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0x8d902c2d  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x0c2d, %pstate
	.word 0xa4d1f8e5  ! 389: UMULcc_I	umulcc 	%r7, 0xfffff8e5, %r18
tagged_6_208:
	tsubcctv %r17, 0x102b, %r25
	.word 0xd207fca8  ! 390: LDUW_I	lduw	[%r31 + 0xfffffca8], %r9
intveclr_6_209:
	setx 0x0e0c8eceb9a061ff, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 391: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_210:
	setx 0x3609e3656f13ff73, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_211:
	setx 0x09406c7af8cb468c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 393: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd26ffca8  ! 394: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffffca8]
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_212
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_212:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e003  ! 395: CASA_R	casa	[%r31] %asi, %r3, %r9
	.word 0x8780208b  ! 396: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x87802004  ! 397: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01971  ! 398: FqTOd	dis not found

	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
change_to_randtl_5_0:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_0:
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_5_1:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 3: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_5_2:
	.word 0x8198258e  ! 4: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058e, %hpstate
splash_cmpr_5_3:
	setx 0x9c57faf37b9134ce, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 5: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_4
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_4
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_4:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 6: RDPC	rd	%pc, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01961  ! 7: FqTOd	dis not found

memptr_5_6:
	set user_data_start, %r31
	.word 0x858332fc  ! 8: WRCCR_I	wr	%r12, 0x12fc, %ccr
mondo_5_7:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d918010  ! 9: WRPR_WSTATE_R	wrpr	%r6, %r16, %wstate
	.word 0xd48fe010  ! 10: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
memptr_5_8:
	set 0x60540000, %r31
	.word 0x8581234b  ! 11: WRCCR_I	wr	%r4, 0x034b, %ccr
splash_cmpr_5_9:
	setx 0xfc7de9f69aa7dae1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 12: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_5_10:
	.word 0x81982b54  ! 13: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b54, %hpstate
splash_hpstate_5_11:
	.word 0x81982e84  ! 14: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e84, %hpstate
	.word 0x91d02033  ! 15: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x99902003  ! 16: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
debug_5_12:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 17: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0xd42fe243  ! 18: STB_I	stb	%r10, [%r31 + 0x0243]
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_13
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_13:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00d  ! 19: CASA_R	casa	[%r31] %asi, %r13, %r10
	.word 0x8d9034de  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x14de, %pstate
DS_5_14:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 21: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xd4d7e030  ! 22: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
	.word 0xd53fe243  ! 23: STDF_I	std	%f10, [0x0243, %r31]
	.word 0xd44fe243  ! 24: LDSB_I	ldsb	[%r31 + 0x0243], %r10
	.word 0xd4d7e030  ! 25: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
	.word 0x91d02035  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa7a01a63  ! 27: FqTOi	fqtoi	
	.word 0x8780208b  ! 28: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0xe0d7e030  ! 29: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
	.word 0xe127e243  ! 30: STF_I	st	%f16, [0x0243, %r31]
	.word 0xa5a00164  ! 31: FABSq	dis not found

splash_tba_5_15:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_5_16:
	.word 0xa9a009c5  ! 1: FDIVd	fdivd	%f0, %f36, %f20
	.word 0xd532a7cf  ! 1: STQF_I	-	%f10, [0x07cf, %r10]
	normalw
	.word 0xa5458000  ! 33: RD_SOFTINT_REG	rd	%softint, %r18
debug_5_17:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 34: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_18
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_18
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_18:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 35: RDPC	rd	%pc, %r20
	.word 0xd09004a0  ! 36: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
cwp_5_19:
    set user_data_start, %o7
	.word 0x93902005  ! 37: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_tba_5_20:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 38: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd06ffd6b  ! 39: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffd6b]
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 40: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa3a489b3  ! 41: FDIVs	fdivs	%f18, %f19, %f17
cwp_5_21:
    set user_data_start, %o7
	.word 0x93902006  ! 42: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d802004  ! 43: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01961  ! 44: FqTOd	dis not found

tagged_5_23:
	taddcctv %r12, 0x1d7c, %r3
	.word 0xd407fd6b  ! 45: LDUW_I	lduw	[%r31 + 0xfffffd6b], %r10
	.word 0xd4800a60  ! 46: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r10
splash_lsu_5_24:
	setx 0xc541dda027857983, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 47: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_5_25:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f24, %f2, %f22
	.word 0x93b1c306  ! 48: ALIGNADDRESS	alignaddr	%r7, %r6, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r10
splash_cmpr_5_26:
	setx 0xb406d0bab8672d30, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 51: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_5_27:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 52: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
intveclr_5_28:
	setx 0x0cc0b3f7e4780f34, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 53: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 54: Tcc_R	ta	icc_or_xcc, %r0 + %r30
donret_5_29:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_29-donret_5_29-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_29:
	.word 0xd4fffd6b  ! 55: SWAPA_I	swapa	%r10, [%r31 + 0xfffffd6b] %asi
DS_5_30:
	.word 0x93a1c9d3  ! 1: FDIVd	fdivd	%f38, %f50, %f40
	.word 0xbfefc000  ! 56: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9068fcaa  ! 57: UDIVX_I	udivx 	%r3, 0xfffffcaa, %r8
	.word 0xd48008a0  ! 58: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_tba_5_31:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 59: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_5_32:
	setx 0x1dee8751f5a5054f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 60: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4c7e030  ! 61: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
change_to_randtl_5_33:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_33:
	.word 0x8f902002  ! 62: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd4d804a0  ! 63: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 64: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_5_34:
	.word 0x81982fc4  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc4, %hpstate
	.word 0x93d020b5  ! 66: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x99a249ca  ! 67: FDIVd	fdivd	%f40, %f10, %f12
donret_5_35:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_35-donret_5_35-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_35:
	.word 0xd8fffd90  ! 68: SWAPA_I	swapa	%r12, [%r31 + 0xfffffd90] %asi
	.word 0xd8bfc020  ! 69: STDA_R	stda	%r12, [%r31 + %r0] 0x01
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 70: LDX_R	ldx	[%r31 + %r0], %r12
change_to_randtl_5_36:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_36:
	.word 0x8f902002  ! 71: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd877c000  ! 72: STX_R	stx	%r12, [%r31 + %r0]
	.word 0xd89fc020  ! 73: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
cwp_5_37:
    set user_data_start, %o7
	.word 0x93902003  ! 74: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_tba_5_38:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 75: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_5_39:
	taddcctv %r20, 0x17cf, %r10
	.word 0xd807fd90  ! 76: LDUW_I	lduw	[%r31 + 0xfffffd90], %r12
mondo_5_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d90c011  ! 77: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
mondo_5_41:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d910010  ! 78: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_42:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e007  ! 79: CASA_R	casa	[%r31] %asi, %r7, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 80: LDX_R	ldx	[%r31 + %r0], %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd857c000  ! 82: LDSH_R	ldsh	[%r31 + %r0], %r12
	.word 0x96dd000b  ! 83: SMULcc_R	smulcc 	%r20, %r11, %r11
	.word 0x8d902123  ! 84: WRPR_PSTATE_I	wrpr	%r0, 0x0123, %pstate
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_43
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_43:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 85: RDPC	rd	%pc, %r20
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 86: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_5_44-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_44:
	.word 0x9190c00d  ! 87: WRPR_PIL_R	wrpr	%r3, %r13, %pil
splash_cmpr_5_45:
	setx 0xd48e0525de91a16d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 88: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9027cf  ! 89: WRPR_PSTATE_I	wrpr	%r0, 0x07cf, %pstate
	.word 0x93d02033  ! 90: Tcc_I	tne	icc_or_xcc, %r0 + 51
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 91: LDX_R	ldx	[%r31 + %r0], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_46) + 48, 16, 16)) -> intp(1,0,2)
intvec_5_46:
	.word 0x39400001  ! 92: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x47b1255aa615c23c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_47:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 94: Tcc_I	ta	icc_or_xcc, %r0 + 53
change_to_randtl_5_48:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_48:
	.word 0x8f902001  ! 95: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_5_49:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 96: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d02035  ! 97: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_hpstate_5_50:
	.word 0x819821d6  ! 98: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d6, %hpstate
	.word 0x9f803a16  ! 99: SIR	sir	0x1a16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 100: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4800ba0  ! 101: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r18
	.word 0xe4880e40  ! 102: LDUBA_R	lduba	[%r0, %r0] 0x72, %r18
	.word 0x879021a2  ! 103: WRPR_TT_I	wrpr	%r0, 0x01a2, %tt
splash_cmpr_5_51:
	setx 0x64b1a6c2095e5f3e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 104: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_5_52:
	tsubcctv %r7, 0x154a, %r14
	.word 0xe407e86a  ! 105: LDUW_I	lduw	[%r31 + 0x086a], %r18
splash_cmpr_5_53:
	setx 0x1eca4b19fb250271, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9ba00164  ! 107: FABSq	dis not found

	.word 0x8790205d  ! 108: WRPR_TT_I	wrpr	%r0, 0x005d, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936ca51d  ! 109: SDIVX_I	sdivx	%r18, 0x051d, %r9
	.word 0xe4c7e030  ! 110: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96cf65d  ! 111: SDIVX_I	sdivx	%r19, 0xfffff65d, %r20
splash_lsu_5_56:
	setx 0x497ea552e7fbddf7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 112: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_5_57:
    set user_data_start, %o7
	.word 0x93902001  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa9a34dd3  ! 114: FdMULq	fdmulq	
	.word 0xd517c000  ! 115: LDQF_R	-	[%r31, %r0], %f10
	.word 0xd46fff0b  ! 116: LDSTUB_I	ldstub	%r10, [%r31 + 0xffffff0b]
	.word 0xad833e25  ! 117: WR_SOFTINT_REG_I	wr	%r12, 0x1e25, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_58) + 40, 16, 16)) -> intp(1,0,28)
intvec_5_58:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 119: RDPR_TICK	rdpr	%tick, %r0
cwp_5_59:
    set user_data_start, %o7
	.word 0x93902007  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	rd %pc, %r19
	add %r19, (ivw_5_60-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_60:
	.word 0x91904014  ! 121: WRPR_PIL_R	wrpr	%r1, %r20, %pil
	.word 0xd4c804a0  ! 122: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
splash_lsu_5_61:
	setx 0x9014d23389069db1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 123: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_62:
	setx 0x00167fc632ffefb8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 124: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_63:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 125: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 126: LDX_R	ldx	[%r31 + %r0], %r10
tagged_5_64:
	tsubcctv %r13, 0x1e57, %r13
	.word 0xd407eaae  ! 127: LDUW_I	lduw	[%r31 + 0x0aae], %r10
	.word 0xd48008a0  ! 128: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
mondo_5_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d91c010  ! 129: WRPR_WSTATE_R	wrpr	%r7, %r16, %wstate
	.word 0x91d020b2  ! 130: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xd46feaae  ! 131: LDSTUB_I	ldstub	%r10, [%r31 + 0x0aae]
splash_hpstate_5_66:
	.word 0x81982e3f  ! 132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e3f, %hpstate
	.word 0x95a00569  ! 133: FSQRTq	fsqrt	
	.word 0x87802016  ! 134: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d802000  ! 135: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81510000  ! 136: RDPR_TICK	rdpr	%tick, %r0
	.word 0xa3500000  ! 137: RDPR_TPC	<illegal instruction>
pmu_5_67:
	nop
	setx 0xfffff687fffff3c0, %g1, %g7
	.word 0xa3800007  ! 138: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_hpstate_5_68:
	.word 0x8198231f  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031f, %hpstate
intveclr_5_69:
	setx 0xd1ef0e793c329af7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_70
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_70:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 141: RDPC	rd	%pc, %r16
	.word 0xd28008a0  ! 142: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01974  ! 143: FqTOd	dis not found

splash_lsu_5_72:
	setx 0xb0b7ecd2cd983dd9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 144: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_5_73:
    set user_data_start, %o7
	.word 0x93902004  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_cmpr_5_74:
	setx 0x4dc149d442264555, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 146: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_5_75:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_75:
	.word 0x8f902001  ! 147: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_5_76:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d94c00b  ! 148: WRPR_WSTATE_R	wrpr	%r19, %r11, %wstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_77
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_77:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 149: CASA_R	casa	[%r31] %asi, %r17, %r13
intveclr_5_78:
	setx 0x3c360f17984e123b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01962  ! 151: FqTOd	dis not found

debug_5_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 152: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936b353b  ! 153: SDIVX_I	sdivx	%r12, 0xfffff53b, %r9
	.word 0xd48008a0  ! 154: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa190200e  ! 155: WRPR_GL_I	wrpr	%r0, 0x000e, %-
mondo_5_82:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d92800d  ! 156: WRPR_WSTATE_R	wrpr	%r10, %r13, %wstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_83
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_83:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e005  ! 157: CASA_R	casa	[%r31] %asi, %r5, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 158: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4bff810  ! 159: STDA_I	stda	%r10, [%r31 + 0xfffff810] %asi
	.word 0x93d020b2  ! 160: Tcc_I	tne	icc_or_xcc, %r0 + 178
splash_lsu_5_84:
	setx 0xbd54af8926c20e7b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 161: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_5_85:
	setx 0x857bd2f19ca86fa5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xad84bb7c  ! 163: WR_SOFTINT_REG_I	wr	%r18, 0x1b7c, %softint
DS_5_86:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f22, %f6, %f26
	.word 0x91b4c304  ! 164: ALIGNADDRESS	alignaddr	%r19, %r4, %r8
	.word 0x9f8023e6  ! 165: SIR	sir	0x03e6
	.word 0xd28804a0  ! 166: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_87
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_87:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 167: RDPC	rd	%pc, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd0800b60  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r8
splash_cmpr_5_88:
	setx 0xcf83929cf78694ea, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 170: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_89)+24, 16, 16)) -> intp(5,1,3)
xir_5_89:
	.word 0xa9807374  ! 171: WR_SET_SOFTINT_I	wr	%r1, 0x1374, %set_softint
intveclr_5_90:
	setx 0x9f426062c185ab11, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902001  ! 173: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x87802058  ! 174: WRASI_I	wr	%r0, 0x0058, %asi
memptr_5_91:
	set 0x60340000, %r31
	.word 0x8582bcc4  ! 175: WRCCR_I	wr	%r10, 0x1cc4, %ccr
	.word 0xd0d7e010  ! 176: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 177: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_decr_5_92:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa781c008  ! 178: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r8, %-
memptr_5_93:
	set user_data_start, %r31
	.word 0x85822a07  ! 179: WRCCR_I	wr	%r8, 0x0a07, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_94) + 16, 16, 16)) -> intp(4,0,16)
intvec_5_94:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 181: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8790203e  ! 182: WRPR_TT_I	wrpr	%r0, 0x003e, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 183: LDX_R	ldx	[%r31 + %r0], %r8
splash_tba_5_95:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 184: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_5_96:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 185: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
tagged_5_97:
	taddcctv %r25, 0x1912, %r10
	.word 0xd007e0a0  ! 186: LDUW_I	lduw	[%r31 + 0x00a0], %r8
splash_cmpr_5_98:
	setx 0x045b971894d35911, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 187: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_5_99:
	nop
	setx 0xfffffd11fffff533, %g1, %g7
	.word 0xa3800007  ! 188: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_5_100:
    set user_data_start, %o7
	.word 0x93902007  ! 189: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81460000  ! 190: RD_STICK_REG	stbar
change_to_randtl_5_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_101:
	.word 0x8f902001  ! 191: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_5_102:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 192: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 193: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9820012  ! 194: WR_SET_SOFTINT_R	wr	%r8, %r18, %set_softint
	.word 0x8d903971  ! 195: WRPR_PSTATE_I	wrpr	%r0, 0x1971, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 196: LDX_R	ldx	[%r31 + %r0], %r8
debug_5_103:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 197: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_5_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_104:
	.word 0x8f902001  ! 198: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d9026aa  ! 199: WRPR_PSTATE_I	wrpr	%r0, 0x06aa, %pstate
cwp_5_105:
    set user_data_start, %o7
	.word 0x93902001  ! 200: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
pmu_5_106:
	nop
	setx 0xfffff0f0fffff906, %g1, %g7
	.word 0xa3800007  ! 201: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d020b3  ! 202: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0xa1902006  ! 203: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa9454000  ! 204: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_107:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 205: CASA_R	casa	[%r31] %asi, %r16, %r9
tagged_5_108:
	tsubcctv %r13, 0x1e52, %r19
	.word 0xd207e0a0  ! 206: LDUW_I	lduw	[%r31 + 0x00a0], %r9
	setx 0x8225c8e04be83220, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_109:
	.word 0x39400001  ! 207: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd2d804a0  ! 208: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
memptr_5_110:
	set 0x60340000, %r31
	.word 0x8584a1cc  ! 209: WRCCR_I	wr	%r18, 0x01cc, %ccr
	.word 0xd327e9cb  ! 210: STF_I	st	%f9, [0x09cb, %r31]
debug_5_111:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 211: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
splash_lsu_5_112:
	setx 0xd54090bbabbef431, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 212: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa3a189f3  ! 213: FDIVq	dis not found

memptr_5_113:
	set 0x60340000, %r31
	.word 0x8582e41e  ! 214: WRCCR_I	wr	%r11, 0x041e, %ccr
	.word 0xd8dfe020  ! 215: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
memptr_5_114:
	set user_data_start, %r31
	.word 0x85843287  ! 216: WRCCR_I	wr	%r16, 0x1287, %ccr
splash_lsu_5_115:
	setx 0x4c23adc065404923, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_116
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_116:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 218: RDPC	rd	%pc, %r19
	.word 0x99450000  ! 219: RD_SET_SOFTINT	rd	%set_softint, %r12
	.word 0x99a01a64  ! 220: FqTOi	fqtoi	
	.word 0xd137c000  ! 221: STQF_R	-	%f8, [%r0, %r31]
	.word 0x3c700001  ! 222: BPPOS	<illegal instruction>
	.word 0x8790210e  ! 223: WRPR_TT_I	wrpr	%r0, 0x010e, %tt
	.word 0x93a00165  ! 224: FABSq	dis not found

splash_cmpr_5_117:
	setx 0x0c75867ff2a954c6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 225: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_118:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 226: CASA_R	casa	[%r31] %asi, %r19, %r13
intveclr_5_119:
	setx 0xccd7f137202504be, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 227: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_5_120:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x8d4ffcf7	! Random illegal ?
	.word 0xd3124001  ! 1: LDQF_R	-	[%r9, %r1], %f9
	.word 0x95a3082d  ! 228: FADDs	fadds	%f12, %f13, %f10
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 229: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 230: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_5_121:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_121:
	.word 0x8f902000  ! 231: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
memptr_5_122:
	set 0x60340000, %r31
	.word 0x85813e80  ! 232: WRCCR_I	wr	%r4, 0x1e80, %ccr
splash_tba_5_123:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 233: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x879022e4  ! 234: WRPR_TT_I	wrpr	%r0, 0x02e4, %tt
splash_cmpr_5_124:
	setx 0xf56252d8f2cd147f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 235: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4cfe020  ! 236: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r10
debug_5_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 237: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916ce031  ! 238: SDIVX_I	sdivx	%r19, 0x0031, %r8
	rd %pc, %r19
	add %r19, (ivw_5_127-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_127:
	.word 0x91920006  ! 239: WRPR_PIL_R	wrpr	%r8, %r6, %pil
	.word 0xd88fe020  ! 240: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
splash_cmpr_5_128:
	setx 0x69575a07e96fa992, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 241: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8800a60  ! 242: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 243: LDX_R	ldx	[%r31 + %r0], %r12
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 244: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_5_129:
	setx 0x1a64074f6a603abc, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 245: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_130:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 246: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
DS_5_131:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 247: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x95a209c4  ! 248: FDIVd	fdivd	%f8, %f4, %f10
	.word 0xa1a00173  ! 249: FABSq	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a0196b  ! 250: FqTOd	dis not found

mondo_5_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d94c005  ! 251: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
	.word 0x87802089  ! 252: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd81fc000  ! 253: LDD_R	ldd	[%r31 + %r0], %r12
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 254: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x2e800001  ! 255: BVS	bvs,a	<label_0x1>
debug_5_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 256: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd82ffda1  ! 257: STB_I	stb	%r12, [%r31 + 0xfffffda1]
DS_5_135:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x91a00551  ! 1: FSQRTd	fsqrt	
	.word 0x91a2482a  ! 258: FADDs	fadds	%f9, %f10, %f8
	.word 0xab828014  ! 259: WR_CLEAR_SOFTINT_R	wr	%r10, %r20, %clear_softint
debug_5_136:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 260: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200d  ! 261: WRPR_GL_I	wrpr	%r0, 0x000d, %-
change_to_randtl_5_137:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_137:
	.word 0x8f902002  ! 262: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_138) + 56, 16, 16)) -> intp(3,0,12)
intvec_5_138:
	.word 0x39400001  ! 263: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_139
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_139:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 264: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0x8d902f07  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x0f07, %pstate
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_140
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_140:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 266: RDPC	rd	%pc, %r9
intveclr_5_141:
	setx 0x14f43a259cfb4424, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 267: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8780208b  ! 268: WRASI_I	wr	%r0, 0x008b, %asi
change_to_randtl_5_142:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_142:
	.word 0x8f902001  ! 269: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_5_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_143:
	.word 0x8f902000  ! 270: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd257c000  ! 271: LDSH_R	ldsh	[%r31 + %r0], %r9
mondo_5_144:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d944000  ! 272: WRPR_WSTATE_R	wrpr	%r17, %r0, %wstate
	.word 0x9193663a  ! 273: WRPR_PIL_I	wrpr	%r13, 0x063a, %pil
splash_tba_5_145:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 274: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa190200f  ! 275: WRPR_GL_I	wrpr	%r0, 0x000f, %-
memptr_5_146:
	set 0x60740000, %r31
	.word 0x8580b10e  ! 276: WRCCR_I	wr	%r2, 0x110e, %ccr
	.word 0x99a00171  ! 277: FABSq	dis not found

splash_cmpr_5_147:
	setx 0x8cf9fa135185d39c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_148:
	setx 0x6b83710cde22fbc2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 279: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_5_149:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_149-donret_5_149-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_149:
	.word 0xdaffec13  ! 280: SWAPA_I	swapa	%r13, [%r31 + 0x0c13] %asi
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_150:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 281: CASA_R	casa	[%r31] %asi, %r16, %r13
intveclr_5_151:
	setx 0xd57e70fb1f906766, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 282: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_5_152:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 283: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_5_153:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 284: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	.word 0x99a049c9  ! 285: FDIVd	fdivd	%f32, %f40, %f12
	.word 0xda800b40  ! 286: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r13
donret_5_154:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_154-donret_5_154), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_154:
	.word 0xdaffec13  ! 287: SWAPA_I	swapa	%r13, [%r31 + 0x0c13] %asi
	.word 0x8d902ae3  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x0ae3, %pstate
	.word 0xdaffc021  ! 289: SWAPA_R	swapa	%r13, [%r31 + %r1] 0x01
splash_htba_5_155:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 290: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xda4fec13  ! 291: LDSB_I	ldsb	[%r31 + 0x0c13], %r13
debug_5_156:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 292: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
debug_5_157:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 293: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9345c000  ! 294: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0xe80fec13  ! 295: LDUB_I	ldub	[%r31 + 0x0c13], %r20
	.word 0xe847ec13  ! 296: LDSW_I	ldsw	[%r31 + 0x0c13], %r20
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_158
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_158:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e001  ! 297: CASA_R	casa	[%r31] %asi, %r1, %r20
	.word 0xa1902004  ! 298: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xe83fc000  ! 299: STD_R	std	%r20, [%r31 + %r0]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 300: LDX_R	ldx	[%r31 + %r0], %r20
splash_hpstate_5_159:
	.word 0x819823cd  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03cd, %hpstate
	.word 0xe88008a0  ! 302: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
cwp_5_160:
    set user_data_start, %o7
	.word 0x93902001  ! 303: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
memptr_5_161:
	set 0x60140000, %r31
	.word 0x8581b7f4  ! 304: WRCCR_I	wr	%r6, 0x17f4, %ccr
	.word 0xe8dfe000  ! 305: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
splash_tba_5_162:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 306: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_decr_5_163:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa784c008  ! 307: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r8, %-
splash_hpstate_5_164:
	.word 0x81982a9e  ! 308: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9e, %hpstate
	setx 0xbcd253c583b7eef2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_165:
	.word 0x39400001  ! 309: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_5_166:
	setx 0xc795b1f33ecff6ae, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 310: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_5_167:
	.word 0x8198281c  ! 311: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081c, %hpstate
	.word 0x91d02034  ! 312: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe807c000  ! 313: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0x93d020b4  ! 314: Tcc_I	tne	icc_or_xcc, %r0 + 180
debug_5_168:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 315: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
splash_cmpr_5_169:
	setx 0x1ae94027fdd41689, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 316: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x919160e1  ! 317: WRPR_PIL_I	wrpr	%r5, 0x00e1, %pil
splash_cmpr_5_170:
	setx 0x3b393b21cb36c9db, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 318: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_171:
	setx 0xee7954e336515b66, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_172:
	setx 0xc59e75050adbca63, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 320: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32800001  ! 321: BNE	bne,a	<label_0x1>
splash_lsu_5_173:
	setx 0xe4a39af1f5ca5a13, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 322: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_5_174:
	set user_data_start, %r31
	.word 0x8580f49b  ! 323: WRCCR_I	wr	%r3, 0x149b, %ccr
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_175
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_175:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 324: RDPC	rd	%pc, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01969  ! 325: FqTOd	dis not found

splash_cmpr_5_177:
	setx 0xdb570b4305158fd9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_178:
	setx 0xc46b1a0233e3a5aa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 327: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe827eb39  ! 328: STW_I	stw	%r20, [%r31 + 0x0b39]
	.word 0x9b500000  ! 329: RDPR_TPC	<illegal instruction>
	.word 0x99a0016a  ! 330: FABSq	dis not found

	.word 0xa1464000  ! 331: RD_STICK_CMPR_REG	rd	%-, %r16
	.word 0xe23fc000  ! 332: STD_R	std	%r17, [%r31 + %r0]
	.word 0x986b4003  ! 333: UDIVX_R	udivx 	%r13, %r3, %r12
	.word 0x96810001  ! 334: ADDcc_R	addcc 	%r4, %r1, %r11
	.word 0x8790200c  ! 335: WRPR_TT_I	wrpr	%r0, 0x000c, %tt
	.word 0x83d02033  ! 336: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01961  ! 337: FqTOd	dis not found

splash_cmpr_5_180:
	setx 0xe70d08f147d2b2f9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 338: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_181:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 339: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
intveclr_5_182:
	setx 0x627e7b823dda03fe, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 340: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956d36de  ! 341: SDIVX_I	sdivx	%r20, 0xfffff6de, %r10
	.word 0xa7480000  ! 342: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0x91d02033  ! 343: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_5_184:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f26, %f0, %f10
	.word 0xa9b50302  ! 344: ALIGNADDRESS	alignaddr	%r20, %r2, %r20
debug_5_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 345: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_5_186:
	setx 0xca843ad4b8f9d628, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 346: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd51fc000  ! 347: LDDF_R	ldd	[%r31, %r0], %f10
mondo_5_187:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d94c011  ! 348: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
splash_decr_5_188:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa780c011  ! 349: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r17, %-
	.word 0x9ba209f3  ! 350: FDIVq	dis not found

debug_5_189:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 351: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
change_to_randtl_5_190:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_190:
	.word 0x8f902000  ! 352: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd2800b80  ! 353: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r9
splash_hpstate_5_191:
	.word 0x81982814  ! 354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0814, %hpstate
	.word 0x9153c000  ! 355: RDPR_FQ	<illegal instruction>
	.word 0xd4ffc028  ! 356: SWAPA_R	swapa	%r10, [%r31 + %r8] 0x01
intveclr_5_192:
	setx 0x1c5a8d4023037768, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 357: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd4800b60  ! 358: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r10
	.word 0xd4c00e80  ! 359: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r10
	.word 0x93a4c9d0  ! 360: FDIVd	fdivd	%f50, %f16, %f40
	.word 0xe6d7e010  ! 361: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r19
splash_hpstate_5_193:
	.word 0x81982d8c  ! 362: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8c, %hpstate
debug_5_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 363: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa8d4c012  ! 364: UMULcc_R	umulcc 	%r19, %r18, %r20
tagged_5_195:
	taddcctv %r19, 0x1fce, %r13
	.word 0xd407f436  ! 365: LDUW_I	lduw	[%r31 + 0xfffff436], %r10
memptr_5_196:
	set 0x60340000, %r31
	.word 0x858370b3  ! 366: WRCCR_I	wr	%r13, 0x10b3, %ccr
	.word 0xd46ff33c  ! 367: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff33c]
cwp_5_197:
    set user_data_start, %o7
	.word 0x93902002  ! 368: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 369: LDX_R	ldx	[%r31 + %r0], %r10
splash_cmpr_5_198:
	setx 0x1c83d8167a633f20, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 370: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_5_199:
    set user_data_start, %o7
	.word 0x93902002  ! 371: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd45ff33c  ! 372: LDX_I	ldx	[%r31 + 0xfffff33c], %r10
	.word 0x91d02032  ! 373: Tcc_I	ta	icc_or_xcc, %r0 + 50
tagged_5_200:
	tsubcctv %r16, 0x12fc, %r18
	.word 0xd407f33c  ! 374: LDUW_I	lduw	[%r31 + 0xfffff33c], %r10
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_201:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 375: CASA_R	casa	[%r31] %asi, %r0, %r10
splash_hpstate_5_202:
	.word 0x819821c7  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c7, %hpstate
splash_cmpr_5_203:
	setx 0x1e1fd0e659c1630a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 377: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa945c000  ! 379: RD_TICK_CMPR_REG	rd	%-, %r20
debug_5_204:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 380: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_205:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 381: CASA_R	casa	[%r31] %asi, %r0, %r10
	.word 0x87802083  ! 382: WRASI_I	wr	%r0, 0x0083, %asi
mondo_5_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d934006  ! 383: WRPR_WSTATE_R	wrpr	%r13, %r6, %wstate
	.word 0xa3a000d2  ! 384: FNEGd	fnegd	%f18, %f48
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 385: LDX_R	ldx	[%r31 + %r0], %r10
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 386: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_5_207:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 387: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0x8d90296c  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x096c, %pstate
	.word 0xa2d0a25c  ! 389: UMULcc_I	umulcc 	%r2, 0x025c, %r17
tagged_5_208:
	tsubcctv %r25, 0x16a2, %r2
	.word 0xd207fca8  ! 390: LDUW_I	lduw	[%r31 + 0xfffffca8], %r9
intveclr_5_209:
	setx 0xa8551e6d45cde78d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 391: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_210:
	setx 0x6965dfd70458496d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_211:
	setx 0x5c1ef5c3c321cd2c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 393: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd26ffca8  ! 394: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffffca8]
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_212
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_212:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e003  ! 395: CASA_R	casa	[%r31] %asi, %r3, %r9
	.word 0x8780208a  ! 396: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0x87802058  ! 397: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196c  ! 398: FqTOd	dis not found

	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
change_to_randtl_4_0:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_0:
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 2: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_4_1:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 3: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_4_2:
	.word 0x81982d8f  ! 4: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8f, %hpstate
splash_cmpr_4_3:
	setx 0x8432c6e6527c5515, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 5: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_4
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_4
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_4:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 6: RDPC	rd	%pc, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01968  ! 7: FqTOd	dis not found

memptr_4_6:
	set user_data_start, %r31
	.word 0x858169f1  ! 8: WRCCR_I	wr	%r5, 0x09f1, %ccr
mondo_4_7:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d91c005  ! 9: WRPR_WSTATE_R	wrpr	%r7, %r5, %wstate
	.word 0xd48fe010  ! 10: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
memptr_4_8:
	set 0x60340000, %r31
	.word 0x85817779  ! 11: WRCCR_I	wr	%r5, 0x1779, %ccr
splash_cmpr_4_9:
	setx 0x3b93e5ff79a506c9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 12: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_4_10:
	.word 0x8198224c  ! 13: WRHPR_HPSTATE_I	wrhpr	%r0, 0x024c, %hpstate
splash_hpstate_4_11:
	.word 0x8198240e  ! 14: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040e, %hpstate
	.word 0x91d02034  ! 15: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x99902000  ! 16: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
debug_4_12:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_12:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_12
    nop
debug_wait4_12:
    ld [%r23], %r2
    brnz %r2, debug_wait4_12
    nop
    ba,a debug_startwait4_12
continue_debug_4_12:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_12:
    cmp %r13, %r15
    bne,a wait_for_stat_4_12
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_12:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_12
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00492  ! 17: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0xd42fe243  ! 18: STB_I	stb	%r10, [%r31 + 0x0243]
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_13
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_13:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00d  ! 19: CASA_R	casa	[%r31] %asi, %r13, %r10
	.word 0x8d902671  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x0671, %pstate
DS_4_14:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 21: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xd4d7e010  ! 22: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
	.word 0xd53fe243  ! 23: STDF_I	std	%f10, [0x0243, %r31]
	.word 0xd44fe243  ! 24: LDSB_I	ldsb	[%r31 + 0x0243], %r10
	.word 0xd4d7e020  ! 25: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r10
	.word 0x83d020b2  ! 26: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0x93a01a72  ! 27: FqTOi	fqtoi	
	.word 0x87802014  ! 28: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xe0d7e020  ! 29: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
	.word 0xe127e243  ! 30: STF_I	st	%f16, [0x0243, %r31]
	.word 0x91a00174  ! 31: FABSq	dis not found

splash_tba_4_15:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_4_16:
	.word 0x9ba009c5  ! 1: FDIVd	fdivd	%f0, %f36, %f44
	.word 0xd7302e48  ! 1: STQF_I	-	%f11, [0x0e48, %r0]
	normalw
	.word 0x93458000  ! 33: RD_SOFTINT_REG	rd	%softint, %r9
debug_4_17:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 34: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_18
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_18
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_18:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 35: RDPC	rd	%pc, %r8
	.word 0xd0900e60  ! 36: LDUHA_R	lduha	[%r0, %r0] 0x73, %r8
cwp_4_19:
    set user_data_start, %o7
	.word 0x93902001  ! 37: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_tba_4_20:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 38: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd06ffd6b  ! 39: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffd6b]
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 40: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91a4c9aa  ! 41: FDIVs	fdivs	%f19, %f10, %f8
cwp_4_21:
    set user_data_start, %o7
	.word 0x93902005  ! 42: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d802000  ! 43: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01969  ! 44: FqTOd	dis not found

tagged_4_23:
	taddcctv %r17, 0x14e3, %r5
	.word 0xd407fd6b  ! 45: LDUW_I	lduw	[%r31 + 0xfffffd6b], %r10
	.word 0xd4800c60  ! 46: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r10
splash_lsu_4_24:
	setx 0x0886a63d25c6f2ab, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 47: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_4_25:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f26, %f8, %f24
	.word 0x93b4c307  ! 48: ALIGNADDRESS	alignaddr	%r19, %r7, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r10
splash_cmpr_4_26:
	setx 0x1011f682220f8417, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 51: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_4_27:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_27:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_27
    nop
debug_wait4_27:
    ld [%r23], %r2
    brnz %r2, debug_wait4_27
    nop
    ba,a debug_startwait4_27
continue_debug_4_27:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_27:
    cmp %r13, %r15
    bne,a wait_for_stat_4_27
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_27:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_27
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00492  ! 52: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
intveclr_4_28:
	setx 0x779a24f93f35a2b7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 53: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 54: Tcc_R	ta	icc_or_xcc, %r0 + %r30
donret_4_29:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_29-donret_4_29-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_29:
	.word 0xd4fffd6b  ! 55: SWAPA_I	swapa	%r10, [%r31 + 0xfffffd6b] %asi
DS_4_30:
	.word 0xa3a509cd  ! 1: FDIVd	fdivd	%f20, %f44, %f48
	.word 0xbfefc000  ! 56: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x946aae04  ! 57: UDIVX_I	udivx 	%r10, 0x0e04, %r10
	.word 0xd4800ae0  ! 58: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r10
splash_tba_4_31:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 59: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_4_32:
	setx 0x4485d296357397ab, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 60: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4c7e030  ! 61: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
change_to_randtl_4_33:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_33:
	.word 0x8f902000  ! 62: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd4d80e40  ! 63: LDXA_R	ldxa	[%r0, %r0] 0x72, %r10
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 64: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_hpstate_4_34:
	.word 0x81982896  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0896, %hpstate
	.word 0x91d020b4  ! 66: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x9ba409cc  ! 67: FDIVd	fdivd	%f16, %f12, %f44
donret_4_35:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_35-donret_4_35-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_35:
	.word 0xd8fffd90  ! 68: SWAPA_I	swapa	%r12, [%r31 + 0xfffffd90] %asi
	.word 0xd8bfc020  ! 69: STDA_R	stda	%r12, [%r31 + %r0] 0x01
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 70: LDX_R	ldx	[%r31 + %r0], %r12
change_to_randtl_4_36:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_36:
	.word 0x8f902000  ! 71: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd877c000  ! 72: STX_R	stx	%r12, [%r31 + %r0]
	.word 0xd89fc020  ! 73: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
cwp_4_37:
    set user_data_start, %o7
	.word 0x93902002  ! 74: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_tba_4_38:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 75: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_4_39:
	taddcctv %r4, 0x1adb, %r21
	.word 0xd807fd90  ! 76: LDUW_I	lduw	[%r31 + 0xfffffd90], %r12
mondo_4_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94800c  ! 77: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
mondo_4_41:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d94c006  ! 78: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_42:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e007  ! 79: CASA_R	casa	[%r31] %asi, %r7, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 80: LDX_R	ldx	[%r31 + %r0], %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd857c000  ! 82: LDSH_R	ldsh	[%r31 + %r0], %r12
	.word 0xa8d8000b  ! 83: SMULcc_R	smulcc 	%r0, %r11, %r20
	.word 0x8d90210b  ! 84: WRPR_PSTATE_I	wrpr	%r0, 0x010b, %pstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_43
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_43:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 85: RDPC	rd	%pc, %r9
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 86: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_4_44-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_44:
	.word 0x91934009  ! 87: WRPR_PIL_R	wrpr	%r13, %r9, %pil
splash_cmpr_4_45:
	setx 0x899edebbf4b7bc11, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 88: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902b27  ! 89: WRPR_PSTATE_I	wrpr	%r0, 0x0b27, %pstate
	.word 0x91d02033  ! 90: Tcc_I	ta	icc_or_xcc, %r0 + 51
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 91: LDX_R	ldx	[%r31 + %r0], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_46) + 48, 16, 16)) -> intp(1,0,29)
intvec_4_46:
	.word 0x39400001  ! 92: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x8f1ab76bff7a7fcd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_47:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b2  ! 94: Tcc_I	te	icc_or_xcc, %r0 + 178
change_to_randtl_4_48:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_48:
	.word 0x8f902001  ! 95: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_4_49:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 96: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d020b2  ! 97: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_hpstate_4_50:
	.word 0x81982d46  ! 98: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d46, %hpstate
	.word 0x9f802375  ! 99: SIR	sir	0x0375
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 100: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 101: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe4880e40  ! 102: LDUBA_R	lduba	[%r0, %r0] 0x72, %r18
	.word 0x879023cf  ! 103: WRPR_TT_I	wrpr	%r0, 0x03cf, %tt
splash_cmpr_4_51:
	setx 0x37e6bdcdea0455d4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 104: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_4_52:
	tsubcctv %r15, 0x1ab8, %r26
	.word 0xe407e86a  ! 105: LDUW_I	lduw	[%r31 + 0x086a], %r18
splash_cmpr_4_53:
	setx 0xdff92fbee309f9c9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7a0016b  ! 107: FABSq	dis not found

	.word 0x879023d1  ! 108: WRPR_TT_I	wrpr	%r0, 0x03d1, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916cabcf  ! 109: SDIVX_I	sdivx	%r18, 0x0bcf, %r8
	.word 0xe4c7e000  ! 110: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996d2791  ! 111: SDIVX_I	sdivx	%r20, 0x0791, %r12
splash_lsu_4_56:
	setx 0x831fc33ba0e7f1b1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 112: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_4_57:
    set user_data_start, %o7
	.word 0x93902001  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa1a2cdc0  ! 114: FdMULq	fdmulq	
	.word 0xd517c000  ! 115: LDQF_R	-	[%r31, %r0], %f10
	.word 0xd46fff0b  ! 116: LDSTUB_I	ldstub	%r10, [%r31 + 0xffffff0b]
	.word 0xad81b65a  ! 117: WR_SOFTINT_REG_I	wr	%r6, 0x165a, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_58) + 56, 16, 16)) -> intp(2,0,5)
intvec_4_58:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 119: RDPR_TICK	rdpr	%tick, %r0
cwp_4_59:
    set user_data_start, %o7
	.word 0x93902000  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	rd %pc, %r19
	add %r19, (ivw_4_60-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_60:
	.word 0x91950012  ! 121: WRPR_PIL_R	wrpr	%r20, %r18, %pil
	.word 0xd4c80e40  ! 122: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r10
splash_lsu_4_61:
	setx 0xce6a04cb4c46d1bb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 123: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_62:
	setx 0x85cde05f6f7385ef, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 124: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_63:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_63:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_63
    nop
debug_wait4_63:
    ld [%r23], %r2
    brnz %r2, debug_wait4_63
    nop
    ba,a debug_startwait4_63
continue_debug_4_63:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_63:
    cmp %r13, %r15
    bne,a wait_for_stat_4_63
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_63:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_63
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00492  ! 125: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 126: LDX_R	ldx	[%r31 + %r0], %r10
tagged_4_64:
	tsubcctv %r8, 0x16cc, %r26
	.word 0xd407eaae  ! 127: LDUW_I	lduw	[%r31 + 0x0aae], %r10
	.word 0xd48008a0  ! 128: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
mondo_4_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d91c00a  ! 129: WRPR_WSTATE_R	wrpr	%r7, %r10, %wstate
	.word 0x91d02035  ! 130: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd46feaae  ! 131: LDSTUB_I	ldstub	%r10, [%r31 + 0x0aae]
splash_hpstate_4_66:
	.word 0x81982a94  ! 132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a94, %hpstate
	.word 0xa9a00565  ! 133: FSQRTq	fsqrt	
	.word 0x87802016  ! 134: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d802000  ! 135: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81510000  ! 136: RDPR_TICK	rdpr	%tick, %r0
	.word 0xa9500000  ! 137: RDPR_TPC	<illegal instruction>
pmu_4_67:
	nop
	setx 0xfffffc96fffffc1d, %g1, %g7
	.word 0xa3800007  ! 138: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_hpstate_4_68:
	.word 0x81982657  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0657, %hpstate
intveclr_4_69:
	setx 0xaa29b7388478493a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
	.word 0xa9414000  ! 141: RDPC	rd	%pc, %r20
	.word 0xd28008a0  ! 142: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01966  ! 143: FqTOd	dis not found

splash_lsu_4_72:
	setx 0x5c7a16fb2d7c54b7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 144: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_4_73:
    set user_data_start, %o7
	.word 0x93902002  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_cmpr_4_74:
	setx 0x752680d445066782, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 146: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_4_75:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_75:
	.word 0x8f902002  ! 147: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_4_76:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d944005  ! 148: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_77
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_77:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 149: CASA_R	casa	[%r31] %asi, %r17, %r13
intveclr_4_78:
	setx 0x3b504bb718abeb5b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01970  ! 151: FqTOd	dis not found

debug_4_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 152: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976b3278  ! 153: SDIVX_I	sdivx	%r12, 0xfffff278, %r11
	.word 0xd48008a0  ! 154: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa1902005  ! 155: WRPR_GL_I	wrpr	%r0, 0x0005, %-
mondo_4_82:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d940014  ! 156: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_83
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_83:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e005  ! 157: CASA_R	casa	[%r31] %asi, %r5, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 158: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4bff810  ! 159: STDA_I	stda	%r10, [%r31 + 0xfffff810] %asi
	.word 0x93d020b2  ! 160: Tcc_I	tne	icc_or_xcc, %r0 + 178
splash_lsu_4_84:
	setx 0xfe9f60e9bb397e55, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 161: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_4_85:
	setx 0xa7be151de5658d09, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xad802e49  ! 163: WR_SOFTINT_REG_I	wr	%r0, 0x0e49, %softint
DS_4_86:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f24, %f6, %f30
	.word 0x99b50306  ! 164: ALIGNADDRESS	alignaddr	%r20, %r6, %r12
	.word 0x9f8025e2  ! 165: SIR	sir	0x05e2
	.word 0xd2880e60  ! 166: LDUBA_R	lduba	[%r0, %r0] 0x73, %r9
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_87
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_87:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 167: RDPC	rd	%pc, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd08008a0  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
splash_cmpr_4_88:
	setx 0xd2cace4d35af6bab, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 170: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_89)+40, 16, 16)) -> intp(4,1,3)
xir_4_89:
	.word 0xa9832c86  ! 171: WR_SET_SOFTINT_I	wr	%r12, 0x0c86, %set_softint
intveclr_4_90:
	setx 0xe702b312d5ef9018, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902000  ! 173: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x87802004  ! 174: WRASI_I	wr	%r0, 0x0004, %asi
memptr_4_91:
	set 0x60340000, %r31
	.word 0x8581f6b6  ! 175: WRCCR_I	wr	%r7, 0x16b6, %ccr
	.word 0xd0d7e030  ! 176: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 177: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa782800d  ! 178: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r13, %-
memptr_4_93:
	set user_data_start, %r31
	.word 0x85843740  ! 179: WRCCR_I	wr	%r16, 0x1740, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_94) + 8, 16, 16)) -> intp(4,0,7)
intvec_4_94:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 181: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x87902139  ! 182: WRPR_TT_I	wrpr	%r0, 0x0139, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 183: LDX_R	ldx	[%r31 + %r0], %r8
splash_tba_4_95:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 184: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_4_96:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_96:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_96
    nop
debug_wait4_96:
    ld [%r23], %r2
    brnz %r2, debug_wait4_96
    nop
    ba,a debug_startwait4_96
continue_debug_4_96:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_96:
    cmp %r13, %r15
    bne,a wait_for_stat_4_96
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_96:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_96
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00492  ! 185: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
tagged_4_97:
	taddcctv %r5, 0x10d6, %r14
	.word 0xd007e0a0  ! 186: LDUW_I	lduw	[%r31 + 0x00a0], %r8
splash_cmpr_4_98:
	setx 0x06adf28ba309be57, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 187: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_4_99:
	nop
	setx 0xfffffc2efffffa5c, %g1, %g7
	.word 0xa3800007  ! 188: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_4_100:
    set user_data_start, %o7
	.word 0x93902001  ! 189: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81460000  ! 190: RD_STICK_REG	stbar
change_to_randtl_4_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_101:
	.word 0x8f902003  ! 191: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
debug_4_102:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_102:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_102
    nop
debug_wait4_102:
    ld [%r23], %r2
    brnz %r2, debug_wait4_102
    nop
    ba,a debug_startwait4_102
continue_debug_4_102:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_102:
    cmp %r13, %r15
    bne,a wait_for_stat_4_102
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_102:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_102
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd2f00492  ! 192: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 193: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa984c00b  ! 194: WR_SET_SOFTINT_R	wr	%r19, %r11, %set_softint
	.word 0x8d902a6a  ! 195: WRPR_PSTATE_I	wrpr	%r0, 0x0a6a, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 196: LDX_R	ldx	[%r31 + %r0], %r8
debug_4_103:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 197: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_4_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_104:
	.word 0x8f902000  ! 198: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d903d23  ! 199: WRPR_PSTATE_I	wrpr	%r0, 0x1d23, %pstate
cwp_4_105:
    set user_data_start, %o7
	.word 0x93902002  ! 200: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
pmu_4_106:
	nop
	setx 0xfffffc5efffffd3e, %g1, %g7
	.word 0xa3800007  ! 201: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b2  ! 202: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xa190200d  ! 203: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x97454000  ! 204: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_107:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 205: CASA_R	casa	[%r31] %asi, %r16, %r9
tagged_4_108:
	tsubcctv %r22, 0x1012, %r6
	.word 0xd207e0a0  ! 206: LDUW_I	lduw	[%r31 + 0x00a0], %r9
	setx 0xfa973324b1b7689e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_109:
	.word 0x39400001  ! 207: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd2d804a0  ! 208: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
memptr_4_110:
	set 0x60140000, %r31
	.word 0x85812eef  ! 209: WRCCR_I	wr	%r4, 0x0eef, %ccr
	.word 0xd327e9cb  ! 210: STF_I	st	%f9, [0x09cb, %r31]
debug_4_111:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_111:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_111
    nop
debug_wait4_111:
    ld [%r23], %r2
    brnz %r2, debug_wait4_111
    nop
    ba,a debug_startwait4_111
continue_debug_4_111:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_111:
    cmp %r13, %r15
    bne,a wait_for_stat_4_111
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_111:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_111
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00492  ! 211: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
splash_lsu_4_112:
	setx 0x608c4d3eba5df665, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 212: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa3a409e6  ! 213: FDIVq	dis not found

memptr_4_113:
	set 0x60540000, %r31
	.word 0x8581b2bf  ! 214: WRCCR_I	wr	%r6, 0x12bf, %ccr
	.word 0xd8dfe020  ! 215: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
memptr_4_114:
	set user_data_start, %r31
	.word 0x85837e57  ! 216: WRCCR_I	wr	%r13, 0x1e57, %ccr
splash_lsu_4_115:
	setx 0x99449e66e9c83ff9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_116
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_116:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 218: RDPC	rd	%pc, %r11
	.word 0x97450000  ! 219: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0x9ba01a6a  ! 220: FqTOi	fqtoi	
	.word 0xd137c000  ! 221: STQF_R	-	%f8, [%r0, %r31]
	.word 0x3c700001  ! 222: BPPOS	<illegal instruction>
	.word 0x87902270  ! 223: WRPR_TT_I	wrpr	%r0, 0x0270, %tt
	.word 0xa1a00170  ! 224: FABSq	dis not found

splash_cmpr_4_117:
	setx 0x73a59ec6e6f35ceb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 225: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_118:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 226: CASA_R	casa	[%r31] %asi, %r19, %r13
intveclr_4_119:
	setx 0x9d2201b61547ee28, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 227: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_4_120:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x954182b7	! Random illegal ?
	.word 0xd5118003  ! 1: LDQF_R	-	[%r6, %r3], %f10
	.word 0x9ba44832  ! 228: FADDs	fadds	%f17, %f18, %f13
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 229: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 230: Tcc_R	te	icc_or_xcc, %r0 + %r30
change_to_randtl_4_121:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_121:
	.word 0x8f902002  ! 231: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
memptr_4_122:
	set 0x60540000, %r31
	.word 0x8584fe61  ! 232: WRCCR_I	wr	%r19, 0x1e61, %ccr
splash_tba_4_123:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 233: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8790223a  ! 234: WRPR_TT_I	wrpr	%r0, 0x023a, %tt
splash_cmpr_4_124:
	setx 0xdcb619dd31df57eb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 235: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4cfe000  ! 236: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r10
debug_4_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 237: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996c28f2  ! 238: SDIVX_I	sdivx	%r16, 0x08f2, %r12
	rd %pc, %r19
	add %r19, (ivw_4_127-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_127:
	.word 0x9192c000  ! 239: WRPR_PIL_R	wrpr	%r11, %r0, %pil
	.word 0xd88fe000  ! 240: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
splash_cmpr_4_128:
	setx 0xc7d66bede419bdb9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 241: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd88008a0  ! 242: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 243: LDX_R	ldx	[%r31 + %r0], %r12
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 244: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_4_129:
	setx 0x7b64589ba0b735df, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 245: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_130:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 246: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
DS_4_131:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 247: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x97a009cc  ! 248: FDIVd	fdivd	%f0, %f12, %f42
	.word 0xa5a00167  ! 249: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01964  ! 250: FqTOd	dis not found

mondo_4_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d94400b  ! 251: WRPR_WSTATE_R	wrpr	%r17, %r11, %wstate
	.word 0x87802088  ! 252: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd81fc000  ! 253: LDD_R	ldd	[%r31 + %r0], %r12
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 254: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x2e800001  ! 255: BVS	bvs,a	<label_0x1>
debug_4_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 256: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd82ffda1  ! 257: STB_I	stb	%r12, [%r31 + 0xfffffda1]
DS_4_135:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa3a00549  ! 1: FSQRTd	fsqrt	
	.word 0x97a18822  ! 258: FADDs	fadds	%f6, %f2, %f11
	.word 0xab834012  ! 259: WR_CLEAR_SOFTINT_R	wr	%r13, %r18, %clear_softint
debug_4_136:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 260: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902002  ! 261: WRPR_GL_I	wrpr	%r0, 0x0002, %-
change_to_randtl_4_137:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_137:
	.word 0x8f902002  ! 262: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_138) + 0, 16, 16)) -> intp(4,0,26)
intvec_4_138:
	.word 0x39400001  ! 263: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_139
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_139:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 264: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0x8d90256d  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x056d, %pstate
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
	.word 0xa7414000  ! 266: RDPC	rd	%pc, %r19
intveclr_4_141:
	setx 0x2e4517fdb61bdfa7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 267: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802088  ! 268: WRASI_I	wr	%r0, 0x0088, %asi
change_to_randtl_4_142:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_142:
	.word 0x8f902001  ! 269: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_4_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_143:
	.word 0x8f902000  ! 270: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd257c000  ! 271: LDSH_R	ldsh	[%r31 + %r0], %r9
mondo_4_144:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d950000  ! 272: WRPR_WSTATE_R	wrpr	%r20, %r0, %wstate
	.word 0x9190ea39  ! 273: WRPR_PIL_I	wrpr	%r3, 0x0a39, %pil
splash_tba_4_145:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 274: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa190200b  ! 275: WRPR_GL_I	wrpr	%r0, 0x000b, %-
memptr_4_146:
	set 0x60340000, %r31
	.word 0x85807593  ! 276: WRCCR_I	wr	%r1, 0x1593, %ccr
	.word 0x97a00163  ! 277: FABSq	dis not found

splash_cmpr_4_147:
	setx 0x56e03c40ee8679e6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_148:
	setx 0x9afb745817109585, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 279: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_4_149:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_149-donret_4_149-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_149:
	.word 0xdaffec13  ! 280: SWAPA_I	swapa	%r13, [%r31 + 0x0c13] %asi
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_150:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 281: CASA_R	casa	[%r31] %asi, %r16, %r13
intveclr_4_151:
	setx 0x2898083af6b1cf92, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 282: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_152:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 283: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_4_153:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_153:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_153
    nop
debug_wait4_153:
    ld [%r23], %r2
    brnz %r2, debug_wait4_153
    nop
    ba,a debug_startwait4_153
continue_debug_4_153:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_153:
    cmp %r13, %r15
    bne,a wait_for_stat_4_153
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_153:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_153
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %18, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 284: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0x93a509c8  ! 285: FDIVd	fdivd	%f20, %f8, %f40
	.word 0xda8008a0  ! 286: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
donret_4_154:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_154-donret_4_154), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_154:
	.word 0xdaffec13  ! 287: SWAPA_I	swapa	%r13, [%r31 + 0x0c13] %asi
	.word 0x8d902e82  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x0e82, %pstate
	.word 0xdaffc021  ! 289: SWAPA_R	swapa	%r13, [%r31 + %r1] 0x01
splash_htba_4_155:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 290: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xda4fec13  ! 291: LDSB_I	ldsb	[%r31 + 0x0c13], %r13
debug_4_156:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_156:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_156
    nop
debug_wait4_156:
    ld [%r23], %r2
    brnz %r2, debug_wait4_156
    nop
    ba,a debug_startwait4_156
continue_debug_4_156:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_156:
    cmp %r13, %r15
    bne,a wait_for_stat_4_156
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_156:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_156
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %18, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd8f00492  ! 292: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
debug_4_157:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 293: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9b45c000  ! 294: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xe80fec13  ! 295: LDUB_I	ldub	[%r31 + 0x0c13], %r20
	.word 0xe847ec13  ! 296: LDSW_I	ldsw	[%r31 + 0x0c13], %r20
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_158
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_158:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e001  ! 297: CASA_R	casa	[%r31] %asi, %r1, %r20
	.word 0xa190200c  ! 298: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xe83fc000  ! 299: STD_R	std	%r20, [%r31 + %r0]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 300: LDX_R	ldx	[%r31 + %r0], %r20
splash_hpstate_4_159:
	.word 0x8198259c  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059c, %hpstate
	.word 0xe8800ba0  ! 302: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r20
cwp_4_160:
    set user_data_start, %o7
	.word 0x93902005  ! 303: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
memptr_4_161:
	set 0x60740000, %r31
	.word 0x858476ff  ! 304: WRCCR_I	wr	%r17, 0x16ff, %ccr
	.word 0xe8dfe000  ! 305: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
splash_tba_4_162:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 306: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa783400c  ! 307: WR_GRAPHICS_STATUS_REG_R	wr	%r13, %r12, %-
splash_hpstate_4_164:
	.word 0x819824c6  ! 308: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c6, %hpstate
	setx 0x1531705ea6a12ac8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_165:
	.word 0x39400001  ! 309: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_4_166:
	setx 0xe836065a9a9e15db, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 310: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_167:
	.word 0x8198210e  ! 311: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010e, %hpstate
	.word 0x91d02033  ! 312: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe807c000  ! 313: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0x93d02032  ! 314: Tcc_I	tne	icc_or_xcc, %r0 + 50
debug_4_168:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_168:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_168
    nop
debug_wait4_168:
    ld [%r23], %r2
    brnz %r2, debug_wait4_168
    nop
    ba,a debug_startwait4_168
continue_debug_4_168:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_168:
    cmp %r13, %r15
    bne,a wait_for_stat_4_168
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_168:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_168
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00492  ! 315: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
splash_cmpr_4_169:
	setx 0xe7275443fe1c6be2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 316: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x919367dc  ! 317: WRPR_PIL_I	wrpr	%r13, 0x07dc, %pil
splash_cmpr_4_170:
	setx 0xa0ec75cda705b534, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 318: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_171:
	setx 0x96c08f763a9becf8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_172:
	setx 0x3b48202f603d8dec, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 320: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32800001  ! 321: BNE	bne,a	<label_0x1>
splash_lsu_4_173:
	setx 0x693edb7793686275, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 322: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_4_174:
	set user_data_start, %r31
	.word 0x858179f9  ! 323: WRCCR_I	wr	%r5, 0x19f9, %ccr
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_175
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_175:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 324: RDPC	rd	%pc, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01972  ! 325: FqTOd	dis not found

splash_cmpr_4_177:
	setx 0x93699112e449c42f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_178:
	setx 0x3b7ed4e60ed627f6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 327: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe827eb39  ! 328: STW_I	stw	%r20, [%r31 + 0x0b39]
	.word 0xa1500000  ! 329: RDPR_TPC	<illegal instruction>
	.word 0x99a00171  ! 330: FABSq	dis not found

	.word 0x91464000  ! 331: RD_STICK_CMPR_REG	rd	%-, %r8
	.word 0xe23fc000  ! 332: STD_R	std	%r17, [%r31 + %r0]
	.word 0x9669800b  ! 333: UDIVX_R	udivx 	%r6, %r11, %r11
	.word 0x9a808010  ! 334: ADDcc_R	addcc 	%r2, %r16, %r13
	.word 0x87902379  ! 335: WRPR_TT_I	wrpr	%r0, 0x0379, %tt
	.word 0x91d02033  ! 336: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01964  ! 337: FqTOd	dis not found

splash_cmpr_4_180:
	setx 0x3e37a5512fe16425, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 338: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_181:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 339: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
intveclr_4_182:
	setx 0xc91f9d2aa40c55d6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 340: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6b7b0f  ! 341: SDIVX_I	sdivx	%r13, 0xfffffb0f, %r13
	.word 0x93480000  ! 342: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x91d02033  ! 343: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_4_184:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f8, %f4, %f16
	.word 0x93b08310  ! 344: ALIGNADDRESS	alignaddr	%r2, %r16, %r9
debug_4_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 345: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_4_186:
	setx 0x52985f9dad0e852c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 346: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd51fc000  ! 347: LDDF_R	ldd	[%r31, %r0], %f10
mondo_4_187:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d950001  ! 348: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
	.word 0xa7804004  ! 349: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r4, %-
	.word 0xa5a0c9eb  ! 350: FDIVq	dis not found

debug_4_189:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_189:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_189
    nop
debug_wait4_189:
    ld [%r23], %r2
    brnz %r2, debug_wait4_189
    nop
    ba,a debug_startwait4_189
continue_debug_4_189:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_189:
    cmp %r13, %r15
    bne,a wait_for_stat_4_189
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_189:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_189
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00492  ! 351: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
change_to_randtl_4_190:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_190:
	.word 0x8f902001  ! 352: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd2800b80  ! 353: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r9
splash_hpstate_4_191:
	.word 0x819826ce  ! 354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06ce, %hpstate
	.word 0x9753c000  ! 355: RDPR_FQ	<illegal instruction>
	.word 0xd4ffc028  ! 356: SWAPA_R	swapa	%r10, [%r31 + %r8] 0x01
intveclr_4_192:
	setx 0xc897619044c1a369, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 357: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 358: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd4c00e80  ! 359: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r10
	.word 0x99a489d3  ! 360: FDIVd	fdivd	%f18, %f50, %f12
	.word 0xe6d7e030  ! 361: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r19
splash_hpstate_4_193:
	.word 0x81982dd5  ! 362: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd5, %hpstate
debug_4_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 363: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x90d0c013  ! 364: UMULcc_R	umulcc 	%r3, %r19, %r8
tagged_4_195:
	taddcctv %r21, 0x1d04, %r18
	.word 0xd407f436  ! 365: LDUW_I	lduw	[%r31 + 0xfffff436], %r10
memptr_4_196:
	set 0x60540000, %r31
	.word 0x858435c0  ! 366: WRCCR_I	wr	%r16, 0x15c0, %ccr
	.word 0xd46ff33c  ! 367: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff33c]
cwp_4_197:
    set user_data_start, %o7
	.word 0x93902006  ! 368: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 369: LDX_R	ldx	[%r31 + %r0], %r10
splash_cmpr_4_198:
	setx 0x72a6cbdd264bcf35, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 370: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_4_199:
    set user_data_start, %o7
	.word 0x93902006  ! 371: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd45ff33c  ! 372: LDX_I	ldx	[%r31 + 0xfffff33c], %r10
	.word 0x91d02035  ! 373: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_4_200:
	tsubcctv %r24, 0x173d, %r22
	.word 0xd407f33c  ! 374: LDUW_I	lduw	[%r31 + 0xfffff33c], %r10
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_201:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 375: CASA_R	casa	[%r31] %asi, %r0, %r10
splash_hpstate_4_202:
	.word 0x819828cc  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cc, %hpstate
splash_cmpr_4_203:
	setx 0x1190d88dad67dac1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 377: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 378: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9b45c000  ! 379: RD_TICK_CMPR_REG	rd	%-, %r13
debug_4_204:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_204:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_204
    nop
debug_wait4_204:
    ld [%r23], %r2
    brnz %r2, debug_wait4_204
    nop
    ba,a debug_startwait4_204
continue_debug_4_204:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_204:
    cmp %r13, %r15
    bne,a wait_for_stat_4_204
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_204:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_204
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd2f00492  ! 380: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_205:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 381: CASA_R	casa	[%r31] %asi, %r0, %r10
	.word 0x87802083  ! 382: WRASI_I	wr	%r0, 0x0083, %asi
mondo_4_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d944004  ! 383: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
	.word 0x93a000d4  ! 384: FNEGd	fnegd	%f20, %f40
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 385: LDX_R	ldx	[%r31 + %r0], %r10
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 386: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_4_207:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_207:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_207
    nop
debug_wait4_207:
    ld [%r23], %r2
    brnz %r2, debug_wait4_207
    nop
    ba,a debug_startwait4_207
continue_debug_4_207:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_207:
    cmp %r13, %r15
    bne,a wait_for_stat_4_207
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_207:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_207
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00492  ! 387: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0x8d9028fb  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x08fb, %pstate
	.word 0x92d1eecb  ! 389: UMULcc_I	umulcc 	%r7, 0x0ecb, %r9
tagged_4_208:
	tsubcctv %r11, 0x103b, %r11
	.word 0xd207fca8  ! 390: LDUW_I	lduw	[%r31 + 0xfffffca8], %r9
intveclr_4_209:
	setx 0x47688b25afca0711, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 391: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_210:
	setx 0xba55840692d7a9be, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_211:
	setx 0x46ae324ad161fe3a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 393: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd26ffca8  ! 394: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffffca8]
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_212
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_212:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e003  ! 395: CASA_R	casa	[%r31] %asi, %r3, %r9
	.word 0x8780204f  ! 396: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802083  ! 397: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01972  ! 398: FqTOd	dis not found

	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
change_to_randtl_3_0:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_0:
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_3_1:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 3: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_3_2:
	.word 0x81982356  ! 4: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0356, %hpstate
splash_cmpr_3_3:
	setx 0x5fc514a602010de6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 5: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_4
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_4
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_4:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 6: RDPC	rd	%pc, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01972  ! 7: FqTOd	dis not found

memptr_3_6:
	set user_data_start, %r31
	.word 0x858321b2  ! 8: WRCCR_I	wr	%r12, 0x01b2, %ccr
mondo_3_7:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d940006  ! 9: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
	.word 0xd48fe000  ! 10: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r10
memptr_3_8:
	set 0x60340000, %r31
	.word 0x85853685  ! 11: WRCCR_I	wr	%r20, 0x1685, %ccr
splash_cmpr_3_9:
	setx 0x5fc31287bb0cb981, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 12: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_3_10:
	.word 0x819827cf  ! 13: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07cf, %hpstate
splash_hpstate_3_11:
	.word 0x81982b57  ! 14: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b57, %hpstate
	.word 0x91d02034  ! 15: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x99902001  ! 16: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
debug_3_12:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 17: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0xd42fe243  ! 18: STB_I	stb	%r10, [%r31 + 0x0243]
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_13
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_13:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00d  ! 19: CASA_R	casa	[%r31] %asi, %r13, %r10
	.word 0x8d902b3c  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x0b3c, %pstate
DS_3_14:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 21: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xd4d7e020  ! 22: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r10
	.word 0xd53fe243  ! 23: STDF_I	std	%f10, [0x0243, %r31]
	.word 0xd44fe243  ! 24: LDSB_I	ldsb	[%r31 + 0x0243], %r10
	.word 0xd4d7e010  ! 25: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
	.word 0x91d02034  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x99a01a62  ! 27: FqTOi	fqtoi	
	.word 0x8780201c  ! 28: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xe0d7e010  ! 29: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r16
	.word 0xe127e243  ! 30: STF_I	st	%f16, [0x0243, %r31]
	.word 0xa3a0016d  ! 31: FABSq	dis not found

splash_tba_3_15:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_3_16:
	.word 0x95a449c7  ! 1: FDIVd	fdivd	%f48, %f38, %f10
	.word 0xd934aa5a  ! 1: STQF_I	-	%f12, [0x0a5a, %r18]
	normalw
	.word 0x99458000  ! 33: RD_SOFTINT_REG	rd	%softint, %r12
debug_3_17:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 34: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_18
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_18
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_18:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 35: RDPC	rd	%pc, %r20
	.word 0xd09004a0  ! 36: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
cwp_3_19:
    set user_data_start, %o7
	.word 0x93902002  ! 37: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_tba_3_20:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 38: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd06ffd6b  ! 39: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffd6b]
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 40: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x97a289a1  ! 41: FDIVs	fdivs	%f10, %f1, %f11
cwp_3_21:
    set user_data_start, %o7
	.word 0x93902005  ! 42: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d802000  ! 43: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01972  ! 44: FqTOd	dis not found

tagged_3_23:
	taddcctv %r2, 0x1f17, %r14
	.word 0xd407fd6b  ! 45: LDUW_I	lduw	[%r31 + 0xfffffd6b], %r10
	.word 0xd48008a0  ! 46: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_3_24:
	setx 0xfa340769d53279b9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 47: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_3_25:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f22, %f30, %f0
	.word 0x99b00308  ! 48: ALIGNADDRESS	alignaddr	%r0, %r8, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r10
splash_cmpr_3_26:
	setx 0x8d80aa59c9519652, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 51: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_3_27:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 52: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
intveclr_3_28:
	setx 0x5fc9ff019b7ac01e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 53: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 54: Tcc_R	te	icc_or_xcc, %r0 + %r30
donret_3_29:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_29-donret_3_29-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_29:
	.word 0xd4fffd6b  ! 55: SWAPA_I	swapa	%r10, [%r31 + 0xfffffd6b] %asi
DS_3_30:
	.word 0x99a189c9  ! 1: FDIVd	fdivd	%f6, %f40, %f12
	.word 0xbfefc000  ! 56: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9868afc5  ! 57: UDIVX_I	udivx 	%r2, 0x0fc5, %r12
	.word 0xd4800a60  ! 58: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r10
splash_tba_3_31:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 59: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_3_32:
	setx 0x91680d74e3b75503, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 60: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4c7e030  ! 61: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
change_to_randtl_3_33:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_33:
	.word 0x8f902003  ! 62: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd4d804a0  ! 63: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 64: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_hpstate_3_34:
	.word 0x819821d4  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d4, %hpstate
	.word 0x91d02032  ! 66: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93a189ca  ! 67: FDIVd	fdivd	%f6, %f10, %f40
donret_3_35:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_35-donret_3_35-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_35:
	.word 0xd8fffd90  ! 68: SWAPA_I	swapa	%r12, [%r31 + 0xfffffd90] %asi
	.word 0xd8bfc020  ! 69: STDA_R	stda	%r12, [%r31 + %r0] 0x01
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 70: LDX_R	ldx	[%r31 + %r0], %r12
change_to_randtl_3_36:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_36:
	.word 0x8f902000  ! 71: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd877c000  ! 72: STX_R	stx	%r12, [%r31 + %r0]
	.word 0xd89fc020  ! 73: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
cwp_3_37:
    set user_data_start, %o7
	.word 0x93902001  ! 74: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_tba_3_38:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 75: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_3_39:
	taddcctv %r1, 0x1588, %r19
	.word 0xd807fd90  ! 76: LDUW_I	lduw	[%r31 + 0xfffffd90], %r12
mondo_3_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d940012  ! 77: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
mondo_3_41:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d900011  ! 78: WRPR_WSTATE_R	wrpr	%r0, %r17, %wstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_42:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e007  ! 79: CASA_R	casa	[%r31] %asi, %r7, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 80: LDX_R	ldx	[%r31 + %r0], %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd857c000  ! 82: LDSH_R	ldsh	[%r31 + %r0], %r12
	.word 0xa2d8c00b  ! 83: SMULcc_R	smulcc 	%r3, %r11, %r17
	.word 0x8d902719  ! 84: WRPR_PSTATE_I	wrpr	%r0, 0x0719, %pstate
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_43
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_43:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 85: RDPC	rd	%pc, %r10
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 86: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_3_44-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_44:
	.word 0x9194000b  ! 87: WRPR_PIL_R	wrpr	%r16, %r11, %pil
splash_cmpr_3_45:
	setx 0xde988c32c40d495d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 88: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903aa0  ! 89: WRPR_PSTATE_I	wrpr	%r0, 0x1aa0, %pstate
	.word 0x83d02033  ! 90: Tcc_I	te	icc_or_xcc, %r0 + 51
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 91: LDX_R	ldx	[%r31 + %r0], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_46) + 16, 16, 16)) -> intp(0,0,27)
intvec_3_46:
	.word 0x39400001  ! 92: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x788dbfbc6f964ec6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_47:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 94: Tcc_I	ta	icc_or_xcc, %r0 + 52
change_to_randtl_3_48:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_48:
	.word 0x8f902000  ! 95: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_tba_3_49:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 96: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d02032  ! 97: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_hpstate_3_50:
	.word 0x81982914  ! 98: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0914, %hpstate
	.word 0x9f803fa5  ! 99: SIR	sir	0x1fa5
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 100: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4800be0  ! 101: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r18
	.word 0xe48804a0  ! 102: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
	.word 0x879021d7  ! 103: WRPR_TT_I	wrpr	%r0, 0x01d7, %tt
splash_cmpr_3_51:
	setx 0xac05814dae57c486, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 104: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_3_52:
	tsubcctv %r21, 0x157c, %r11
	.word 0xe407e86a  ! 105: LDUW_I	lduw	[%r31 + 0x086a], %r18
splash_cmpr_3_53:
	setx 0x827bf7acb91237e1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91a00168  ! 107: FABSq	dis not found

	.word 0x87902066  ! 108: WRPR_TT_I	wrpr	%r0, 0x0066, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936d3931  ! 109: SDIVX_I	sdivx	%r20, 0xfffff931, %r9
	.word 0xe4c7e000  ! 110: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936c7dc0  ! 111: SDIVX_I	sdivx	%r17, 0xfffffdc0, %r9
splash_lsu_3_56:
	setx 0x634c14a1745bc197, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 112: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_3_57:
    set user_data_start, %o7
	.word 0x93902005  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa3a4cdd3  ! 114: FdMULq	fdmulq	
	.word 0xd517c000  ! 115: LDQF_R	-	[%r31, %r0], %f10
	.word 0xd46fff0b  ! 116: LDSTUB_I	ldstub	%r10, [%r31 + 0xffffff0b]
	.word 0xad8470c7  ! 117: WR_SOFTINT_REG_I	wr	%r17, 0x10c7, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_58) + 32, 16, 16)) -> intp(3,0,31)
intvec_3_58:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 119: RDPR_TICK	rdpr	%tick, %r0
cwp_3_59:
    set user_data_start, %o7
	.word 0x93902007  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	rd %pc, %r19
	add %r19, (ivw_3_60-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_60:
	.word 0x91950013  ! 121: WRPR_PIL_R	wrpr	%r20, %r19, %pil
	.word 0xd4c804a0  ! 122: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
splash_lsu_3_61:
	setx 0xb0769219d0a66e51, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 123: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_62:
	setx 0xce837d375d43118c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 124: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_63:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 125: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 126: LDX_R	ldx	[%r31 + %r0], %r10
tagged_3_64:
	tsubcctv %r26, 0x162f, %r16
	.word 0xd407eaae  ! 127: LDUW_I	lduw	[%r31 + 0x0aae], %r10
	.word 0xd48008a0  ! 128: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
mondo_3_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d91c014  ! 129: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
	.word 0x91d020b2  ! 130: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xd46feaae  ! 131: LDSTUB_I	ldstub	%r10, [%r31 + 0x0aae]
splash_hpstate_3_66:
	.word 0x81982a77  ! 132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a77, %hpstate
	.word 0x97a00567  ! 133: FSQRTq	fsqrt	
	.word 0x87802010  ! 134: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d802000  ! 135: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81510000  ! 136: RDPR_TICK	rdpr	%tick, %r0
	.word 0x91500000  ! 137: RDPR_TPC	<illegal instruction>
pmu_3_67:
	nop
	setx 0xfffffbd2fffff279, %g1, %g7
	.word 0xa3800007  ! 138: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_hpstate_3_68:
	.word 0x81982fdf  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdf, %hpstate
intveclr_3_69:
	setx 0x216887ae08fdfcae, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_70
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_70:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 141: RDPC	rd	%pc, %r8
	.word 0xd28008a0  ! 142: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01971  ! 143: FqTOd	dis not found

splash_lsu_3_72:
	setx 0x928c306b4b01c853, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 144: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_3_73:
    set user_data_start, %o7
	.word 0x93902000  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_cmpr_3_74:
	setx 0x5fe7254ccc7818b7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 146: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_3_75:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_75:
	.word 0x8f902001  ! 147: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_3_76:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d94c008  ! 148: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_77
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_77:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 149: CASA_R	casa	[%r31] %asi, %r17, %r13
intveclr_3_78:
	setx 0x7f6e18c8f1e1abdc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01973  ! 151: FqTOd	dis not found

debug_3_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 152: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36b2003  ! 153: SDIVX_I	sdivx	%r12, 0x0003, %r17
	.word 0xd48008a0  ! 154: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa190200a  ! 155: WRPR_GL_I	wrpr	%r0, 0x000a, %-
mondo_3_82:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d924004  ! 156: WRPR_WSTATE_R	wrpr	%r9, %r4, %wstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_83
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_83:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e005  ! 157: CASA_R	casa	[%r31] %asi, %r5, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 158: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4bff810  ! 159: STDA_I	stda	%r10, [%r31 + 0xfffff810] %asi
	.word 0x83d02032  ! 160: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_lsu_3_84:
	setx 0x48673b427adb7701, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 161: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_3_85:
	setx 0x0c83cc01a2a956d3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xad822cad  ! 163: WR_SOFTINT_REG_I	wr	%r8, 0x0cad, %softint
DS_3_86:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f4, %f12, %f16
	.word 0x99b10306  ! 164: ALIGNADDRESS	alignaddr	%r4, %r6, %r12
	.word 0x9f802ac5  ! 165: SIR	sir	0x0ac5
	.word 0xd28804a0  ! 166: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_87
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_87:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 167: RDPC	rd	%pc, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd0800c80  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r8
splash_cmpr_3_88:
	setx 0x4b5d9575ae66fe4c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 170: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_89)+0, 16, 16)) -> intp(3,1,3)
xir_3_89:
	.word 0xa984fdc7  ! 171: WR_SET_SOFTINT_I	wr	%r19, 0x1dc7, %set_softint
intveclr_3_90:
	setx 0x40a820ee4b0d59cc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902001  ! 173: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x87802004  ! 174: WRASI_I	wr	%r0, 0x0004, %asi
memptr_3_91:
	set 0x60740000, %r31
	.word 0x8582ffdf  ! 175: WRCCR_I	wr	%r11, 0x1fdf, %ccr
	.word 0xd0d7e000  ! 176: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 177: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_decr_3_92:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa7844012  ! 178: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r18, %-
memptr_3_93:
	set user_data_start, %r31
	.word 0x85803609  ! 179: WRCCR_I	wr	%r0, 0x1609, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_94) + 8, 16, 16)) -> intp(5,0,20)
intvec_3_94:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 181: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x87902051  ! 182: WRPR_TT_I	wrpr	%r0, 0x0051, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 183: LDX_R	ldx	[%r31 + %r0], %r8
splash_tba_3_95:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 184: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_3_96:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 185: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
tagged_3_97:
	taddcctv %r15, 0x131c, %r20
	.word 0xd007e0a0  ! 186: LDUW_I	lduw	[%r31 + 0x00a0], %r8
splash_cmpr_3_98:
	setx 0x8973671a9038f93f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 187: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_3_99:
	nop
	setx 0xfffff217fffffa40, %g1, %g7
	.word 0xa3800007  ! 188: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_3_100:
    set user_data_start, %o7
	.word 0x93902002  ! 189: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81460000  ! 190: RD_STICK_REG	stbar
change_to_randtl_3_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_101:
	.word 0x8f902000  ! 191: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_3_102:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 192: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 193: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa981800b  ! 194: WR_SET_SOFTINT_R	wr	%r6, %r11, %set_softint
	.word 0x8d9039b5  ! 195: WRPR_PSTATE_I	wrpr	%r0, 0x19b5, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 196: LDX_R	ldx	[%r31 + %r0], %r8
debug_3_103:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 197: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_3_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_104:
	.word 0x8f902001  ! 198: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d902d6b  ! 199: WRPR_PSTATE_I	wrpr	%r0, 0x0d6b, %pstate
cwp_3_105:
    set user_data_start, %o7
	.word 0x93902007  ! 200: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
pmu_3_106:
	nop
	setx 0xfffff3f1fffff920, %g1, %g7
	.word 0xa3800007  ! 201: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d020b5  ! 202: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xa1902009  ! 203: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x95454000  ! 204: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_107:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 205: CASA_R	casa	[%r31] %asi, %r16, %r9
tagged_3_108:
	tsubcctv %r4, 0x1500, %r16
	.word 0xd207e0a0  ! 206: LDUW_I	lduw	[%r31 + 0x00a0], %r9
	setx 0xd766fc9ce4adc5eb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_109:
	.word 0x39400001  ! 207: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd2d80e40  ! 208: LDXA_R	ldxa	[%r0, %r0] 0x72, %r9
memptr_3_110:
	set 0x60140000, %r31
	.word 0x8580fd7d  ! 209: WRCCR_I	wr	%r3, 0x1d7d, %ccr
	.word 0xd327e9cb  ! 210: STF_I	st	%f9, [0x09cb, %r31]
debug_3_111:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 211: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
splash_lsu_3_112:
	setx 0xc817587f3bfad283, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 212: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93a309f4  ! 213: FDIVq	dis not found

memptr_3_113:
	set 0x60340000, %r31
	.word 0x8584e968  ! 214: WRCCR_I	wr	%r19, 0x0968, %ccr
	.word 0xd8dfe010  ! 215: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r12
memptr_3_114:
	set user_data_start, %r31
	.word 0x8582bed5  ! 216: WRCCR_I	wr	%r10, 0x1ed5, %ccr
splash_lsu_3_115:
	setx 0x6d925ac45d862e95, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_116
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_116:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 218: RDPC	rd	%pc, %r8
	.word 0xa9450000  ! 219: RD_SET_SOFTINT	rd	%set_softint, %r20
	.word 0x93a01a70  ! 220: FqTOi	fqtoi	
	.word 0xd137c000  ! 221: STQF_R	-	%f8, [%r0, %r31]
	.word 0x3c700001  ! 222: BPPOS	<illegal instruction>
	.word 0x87902240  ! 223: WRPR_TT_I	wrpr	%r0, 0x0240, %tt
	.word 0x93a00172  ! 224: FABSq	dis not found

splash_cmpr_3_117:
	setx 0x2d85968e10b9f559, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 225: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_118:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 226: CASA_R	casa	[%r31] %asi, %r19, %r13
intveclr_3_119:
	setx 0x66c43c4a0c4f8fbe, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 227: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_3_120:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x897f12d2	! Random illegal ?
	.word 0xd1120009  ! 1: LDQF_R	-	[%r8, %r9], %f8
	.word 0x91a24831  ! 228: FADDs	fadds	%f9, %f17, %f8
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 229: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 230: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_3_121:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_121:
	.word 0x8f902003  ! 231: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
memptr_3_122:
	set 0x60540000, %r31
	.word 0x858266ee  ! 232: WRCCR_I	wr	%r9, 0x06ee, %ccr
splash_tba_3_123:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 233: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8790232e  ! 234: WRPR_TT_I	wrpr	%r0, 0x032e, %tt
splash_cmpr_3_124:
	setx 0x96ec7f6925042c31, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 235: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4cfe020  ! 236: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r10
debug_3_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 237: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9769f8d3  ! 238: SDIVX_I	sdivx	%r7, 0xfffff8d3, %r11
	rd %pc, %r19
	add %r19, (ivw_3_127-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_127:
	.word 0x9192800a  ! 239: WRPR_PIL_R	wrpr	%r10, %r10, %pil
	.word 0xd88fe030  ! 240: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r12
splash_cmpr_3_128:
	setx 0x861ec3f554896474, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 241: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd88008a0  ! 242: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 243: LDX_R	ldx	[%r31 + %r0], %r12
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 244: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_3_129:
	setx 0xdd36b38b2440e638, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 245: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_130:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 246: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
DS_3_131:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 247: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1a0c9c2  ! 248: FDIVd	fdivd	%f34, %f2, %f16
	.word 0x97a00164  ! 249: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01967  ! 250: FqTOd	dis not found

mondo_3_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d94c014  ! 251: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0x87802004  ! 252: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd81fc000  ! 253: LDD_R	ldd	[%r31 + %r0], %r12
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 254: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2e800001  ! 255: BVS	bvs,a	<label_0x1>
debug_3_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 256: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd82ffda1  ! 257: STB_I	stb	%r12, [%r31 + 0xfffffda1]
DS_3_135:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa3a0054a  ! 1: FSQRTd	fsqrt	
	.word 0x99a34831  ! 258: FADDs	fadds	%f13, %f17, %f12
	.word 0xab828008  ! 259: WR_CLEAR_SOFTINT_R	wr	%r10, %r8, %clear_softint
debug_3_136:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 260: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200d  ! 261: WRPR_GL_I	wrpr	%r0, 0x000d, %-
change_to_randtl_3_137:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_137:
	.word 0x8f902001  ! 262: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_138) + 40, 16, 16)) -> intp(6,0,20)
intvec_3_138:
	.word 0x39400001  ! 263: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_139
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_139:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 264: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0x8d9029b8  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x09b8, %pstate
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_140
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_140:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 266: RDPC	rd	%pc, %r19
intveclr_3_141:
	setx 0xcd69a360c7009a8c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 267: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 268: WRASI_I	wr	%r0, 0x004f, %asi
change_to_randtl_3_142:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_142:
	.word 0x8f902001  ! 269: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_3_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_143:
	.word 0x8f902001  ! 270: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd257c000  ! 271: LDSH_R	ldsh	[%r31 + %r0], %r9
mondo_3_144:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d93400c  ! 272: WRPR_WSTATE_R	wrpr	%r13, %r12, %wstate
	.word 0x91903c9a  ! 273: WRPR_PIL_I	wrpr	%r0, 0x1c9a, %pil
splash_tba_3_145:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 274: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1902009  ! 275: WRPR_GL_I	wrpr	%r0, 0x0009, %-
memptr_3_146:
	set 0x60340000, %r31
	.word 0x8581b3cb  ! 276: WRCCR_I	wr	%r6, 0x13cb, %ccr
	.word 0xa5a00169  ! 277: FABSq	dis not found

splash_cmpr_3_147:
	setx 0x6f3e33df98c5823f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_148:
	setx 0xd31d72bb0b49a3d7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 279: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_3_149:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_149-donret_3_149-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_149:
	.word 0xdaffec13  ! 280: SWAPA_I	swapa	%r13, [%r31 + 0x0c13] %asi
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_150:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 281: CASA_R	casa	[%r31] %asi, %r16, %r13
intveclr_3_151:
	setx 0x09cf0aaf42eec228, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 282: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_3_152:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 283: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_3_153:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 284: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0x93a289c0  ! 285: FDIVd	fdivd	%f10, %f0, %f40
	.word 0xda8008a0  ! 286: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
donret_3_154:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_154-donret_3_154), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_154:
	.word 0xdaffec13  ! 287: SWAPA_I	swapa	%r13, [%r31 + 0x0c13] %asi
	.word 0x8d902913  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x0913, %pstate
	.word 0xdaffc021  ! 289: SWAPA_R	swapa	%r13, [%r31 + %r1] 0x01
splash_htba_3_155:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 290: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xda4fec13  ! 291: LDSB_I	ldsb	[%r31 + 0x0c13], %r13
debug_3_156:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 292: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
debug_3_157:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 293: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9945c000  ! 294: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0xe80fec13  ! 295: LDUB_I	ldub	[%r31 + 0x0c13], %r20
	.word 0xe847ec13  ! 296: LDSW_I	ldsw	[%r31 + 0x0c13], %r20
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_158
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_158:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e001  ! 297: CASA_R	casa	[%r31] %asi, %r1, %r20
	.word 0xa190200c  ! 298: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xe83fc000  ! 299: STD_R	std	%r20, [%r31 + %r0]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 300: LDX_R	ldx	[%r31 + %r0], %r20
splash_hpstate_3_159:
	.word 0x81982a0c  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0c, %hpstate
	.word 0xe88008a0  ! 302: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
cwp_3_160:
    set user_data_start, %o7
	.word 0x93902002  ! 303: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
memptr_3_161:
	set 0x60740000, %r31
	.word 0x85823ff1  ! 304: WRCCR_I	wr	%r8, 0x1ff1, %ccr
	.word 0xe8dfe030  ! 305: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
splash_tba_3_162:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 306: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_decr_3_163:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa781c00a  ! 307: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r10, %-
splash_hpstate_3_164:
	.word 0x81982f85  ! 308: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f85, %hpstate
	setx 0x874bf3c8d9c398dd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_165:
	.word 0x39400001  ! 309: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_3_166:
	setx 0xbcc17a2dde0e175a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 310: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_3_167:
	.word 0x81982614  ! 311: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0614, %hpstate
	.word 0x91d02033  ! 312: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe807c000  ! 313: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0x93d02035  ! 314: Tcc_I	tne	icc_or_xcc, %r0 + 53
debug_3_168:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 315: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
splash_cmpr_3_169:
	setx 0x7eea61c5ad47df46, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 316: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9194ef8b  ! 317: WRPR_PIL_I	wrpr	%r19, 0x0f8b, %pil
splash_cmpr_3_170:
	setx 0x8a25013125332eca, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 318: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_171:
	setx 0x7f03647bd9ccec12, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_172:
	setx 0x1ada2cf13b489cf5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 320: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32800001  ! 321: BNE	bne,a	<label_0x1>
splash_lsu_3_173:
	setx 0x576fcd7cea3b389d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 322: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_3_174:
	set user_data_start, %r31
	.word 0x8582a54e  ! 323: WRCCR_I	wr	%r10, 0x054e, %ccr
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_175
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_175:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 324: RDPC	rd	%pc, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01970  ! 325: FqTOd	dis not found

splash_cmpr_3_177:
	setx 0xdc4c4020f4548489, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_178:
	setx 0xb64358911d146a35, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 327: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe827eb39  ! 328: STW_I	stw	%r20, [%r31 + 0x0b39]
	.word 0x91500000  ! 329: RDPR_TPC	<illegal instruction>
	.word 0xa3a00162  ! 330: FABSq	dis not found

	.word 0x93464000  ! 331: RD_STICK_CMPR_REG	rd	%-, %r9
	.word 0xe23fc000  ! 332: STD_R	std	%r17, [%r31 + %r0]
	.word 0x9868800d  ! 333: UDIVX_R	udivx 	%r2, %r13, %r12
	.word 0x96848014  ! 334: ADDcc_R	addcc 	%r18, %r20, %r11
	.word 0x8790238b  ! 335: WRPR_TT_I	wrpr	%r0, 0x038b, %tt
	.word 0x91d020b5  ! 336: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01973  ! 337: FqTOd	dis not found

splash_cmpr_3_180:
	setx 0x5ee50484f2a32246, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 338: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_181:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 339: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
intveclr_3_182:
	setx 0xf0a41fa89da4dd82, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 340: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996b741e  ! 341: SDIVX_I	sdivx	%r13, 0xfffff41e, %r12
	.word 0x99480000  ! 342: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x83d020b4  ! 343: Tcc_I	te	icc_or_xcc, %r0 + 180
DS_3_184:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f18, %f6, %f12
	.word 0x97b24304  ! 344: ALIGNADDRESS	alignaddr	%r9, %r4, %r11
debug_3_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 345: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_3_186:
	setx 0x4434fd9387d96cc2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 346: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd51fc000  ! 347: LDDF_R	ldd	[%r31, %r0], %f10
mondo_3_187:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d918004  ! 348: WRPR_WSTATE_R	wrpr	%r6, %r4, %wstate
splash_decr_3_188:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r6, [%r1] 0x45
	.word 0xa7848001  ! 349: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r1, %-
	.word 0x95a4c9f1  ! 350: FDIVq	dis not found

debug_3_189:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 351: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
change_to_randtl_3_190:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_190:
	.word 0x8f902001  ! 352: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd28008a0  ! 353: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_hpstate_3_191:
	.word 0x81982446  ! 354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0446, %hpstate
	.word 0x9753c000  ! 355: RDPR_FQ	<illegal instruction>
	.word 0xd4ffc028  ! 356: SWAPA_R	swapa	%r10, [%r31 + %r8] 0x01
intveclr_3_192:
	setx 0x43f36d4207eddbed, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 357: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 358: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd4c004a0  ! 359: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x9ba189d1  ! 360: FDIVd	fdivd	%f6, %f48, %f44
	.word 0xe6d7e030  ! 361: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r19
splash_hpstate_3_193:
	.word 0x819826d5  ! 362: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d5, %hpstate
debug_3_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 363: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa8d5000d  ! 364: UMULcc_R	umulcc 	%r20, %r13, %r20
tagged_3_195:
	taddcctv %r5, 0x1b1c, %r24
	.word 0xd407f436  ! 365: LDUW_I	lduw	[%r31 + 0xfffff436], %r10
memptr_3_196:
	set 0x60540000, %r31
	.word 0x85847d9e  ! 366: WRCCR_I	wr	%r17, 0x1d9e, %ccr
	.word 0xd46ff33c  ! 367: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff33c]
cwp_3_197:
    set user_data_start, %o7
	.word 0x93902004  ! 368: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 369: LDX_R	ldx	[%r31 + %r0], %r10
splash_cmpr_3_198:
	setx 0xd514b6290ff9cdc9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 370: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_3_199:
    set user_data_start, %o7
	.word 0x93902007  ! 371: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd45ff33c  ! 372: LDX_I	ldx	[%r31 + 0xfffff33c], %r10
	.word 0x91d020b4  ! 373: Tcc_I	ta	icc_or_xcc, %r0 + 180
tagged_3_200:
	tsubcctv %r9, 0x1411, %r19
	.word 0xd407f33c  ! 374: LDUW_I	lduw	[%r31 + 0xfffff33c], %r10
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_201:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 375: CASA_R	casa	[%r31] %asi, %r0, %r10
splash_hpstate_3_202:
	.word 0x81982c1f  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1f, %hpstate
splash_cmpr_3_203:
	setx 0xd69cdcb5a2134d22, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 377: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa345c000  ! 379: RD_TICK_CMPR_REG	rd	%-, %r17
debug_3_204:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 380: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_205:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 381: CASA_R	casa	[%r31] %asi, %r0, %r10
	.word 0x87802010  ! 382: WRASI_I	wr	%r0, 0x0010, %asi
mondo_3_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d904011  ! 383: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
	.word 0x99a000c6  ! 384: FNEGd	fnegd	%f6, %f12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 385: LDX_R	ldx	[%r31 + %r0], %r10
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 386: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_3_207:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 387: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	.word 0x8d9029f1  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x09f1, %pstate
	.word 0x94d0f543  ! 389: UMULcc_I	umulcc 	%r3, 0xfffff543, %r10
tagged_3_208:
	tsubcctv %r4, 0x12bd, %r16
	.word 0xd207fca8  ! 390: LDUW_I	lduw	[%r31 + 0xfffffca8], %r9
intveclr_3_209:
	setx 0x04f8600ce3d36f3e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 391: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_210:
	setx 0x9a4f3a694925bf7e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_211:
	setx 0x5aaca487da9081ed, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 393: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd26ffca8  ! 394: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffffca8]
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_212
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_212:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e003  ! 395: CASA_R	casa	[%r31] %asi, %r3, %r9
	.word 0x8780201c  ! 396: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x87802089  ! 397: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a0196b  ! 398: FqTOd	dis not found

	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
change_to_randtl_2_0:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_0:
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 2: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_2_1:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 3: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_2_2:
	.word 0x81982b15  ! 4: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b15, %hpstate
splash_cmpr_2_3:
	setx 0x18f35538de64abb9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 5: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_4
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_4
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_4:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 6: RDPC	rd	%pc, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01970  ! 7: FqTOd	dis not found

memptr_2_6:
	set user_data_start, %r31
	.word 0x8584be1c  ! 8: WRCCR_I	wr	%r18, 0x1e1c, %ccr
mondo_2_7:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d92c014  ! 9: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
	.word 0xd48fe030  ! 10: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
memptr_2_8:
	set 0x60740000, %r31
	.word 0x858333e8  ! 11: WRCCR_I	wr	%r12, 0x13e8, %ccr
splash_cmpr_2_9:
	setx 0x6c909d2c07986d56, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 12: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_2_10:
	.word 0x81982c1f  ! 13: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1f, %hpstate
splash_hpstate_2_11:
	.word 0x81982cdc  ! 14: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdc, %hpstate
	.word 0x93d02035  ! 15: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x99902001  ! 16: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
debug_2_12:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 17: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0xd42fe243  ! 18: STB_I	stb	%r10, [%r31 + 0x0243]
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_13
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_13:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00d  ! 19: CASA_R	casa	[%r31] %asi, %r13, %r10
	.word 0x8d902927  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x0927, %pstate
DS_2_14:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 21: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xd4d7e010  ! 22: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
	.word 0xd53fe243  ! 23: STDF_I	std	%f10, [0x0243, %r31]
	.word 0xd44fe243  ! 24: LDSB_I	ldsb	[%r31 + 0x0243], %r10
	.word 0xd4d7e000  ! 25: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
	.word 0x93d02034  ! 26: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xa3a01a6b  ! 27: FqTOi	fqtoi	
	.word 0x8780208a  ! 28: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0xe0d7e030  ! 29: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
	.word 0xe127e243  ! 30: STF_I	st	%f16, [0x0243, %r31]
	.word 0xa7a00161  ! 31: FABSq	dis not found

splash_tba_2_15:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_2_16:
	.word 0x99a4c9cb  ! 1: FDIVd	fdivd	%f50, %f42, %f12
	.word 0xe934a7f0  ! 1: STQF_I	-	%f20, [0x07f0, %r18]
	normalw
	.word 0x9b458000  ! 33: RD_SOFTINT_REG	rd	%softint, %r13
debug_2_17:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 34: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_18
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_18
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_18:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 35: RDPC	rd	%pc, %r10
	.word 0xd09004a0  ! 36: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
cwp_2_19:
    set user_data_start, %o7
	.word 0x93902002  ! 37: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_tba_2_20:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 38: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd06ffd6b  ! 39: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffd6b]
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 40: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9ba249a4  ! 41: FDIVs	fdivs	%f9, %f4, %f13
cwp_2_21:
    set user_data_start, %o7
	.word 0x93902003  ! 42: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d802000  ! 43: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a0196c  ! 44: FqTOd	dis not found

tagged_2_23:
	taddcctv %r12, 0x1060, %r14
	.word 0xd407fd6b  ! 45: LDUW_I	lduw	[%r31 + 0xfffffd6b], %r10
	.word 0xd48008a0  ! 46: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_2_24:
	setx 0x80e066c9b6c792fb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 47: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_2_25:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f20, %f26, %f2
	.word 0x95b10300  ! 48: ALIGNADDRESS	alignaddr	%r4, %r0, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r10
splash_cmpr_2_26:
	setx 0x01555f0768518758, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 51: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_2_27:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 52: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
intveclr_2_28:
	setx 0x9a694078143aee06, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 53: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 54: Tcc_R	tne	icc_or_xcc, %r0 + %r30
donret_2_29:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_29-donret_2_29-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_29:
	.word 0xd4fffd6b  ! 55: SWAPA_I	swapa	%r10, [%r31 + 0xfffffd6b] %asi
DS_2_30:
	.word 0x91a209c7  ! 1: FDIVd	fdivd	%f8, %f38, %f8
	.word 0xbfefc000  ! 56: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa26a2002  ! 57: UDIVX_I	udivx 	%r8, 0x0002, %r17
	.word 0xd48008a0  ! 58: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_tba_2_31:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 59: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_2_32:
	setx 0xc3c24639c572e5c6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 60: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4c7e010  ! 61: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
change_to_randtl_2_33:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_33:
	.word 0x8f902001  ! 62: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd4d80e80  ! 63: LDXA_R	ldxa	[%r0, %r0] 0x74, %r10
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 64: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_2_34:
	.word 0x81982b5c  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5c, %hpstate
	.word 0x83d02032  ! 66: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xa9a249ca  ! 67: FDIVd	fdivd	%f40, %f10, %f20
donret_2_35:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_35-donret_2_35-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_35:
	.word 0xd8fffd90  ! 68: SWAPA_I	swapa	%r12, [%r31 + 0xfffffd90] %asi
	.word 0xd8bfc020  ! 69: STDA_R	stda	%r12, [%r31 + %r0] 0x01
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 70: LDX_R	ldx	[%r31 + %r0], %r12
change_to_randtl_2_36:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_36:
	.word 0x8f902002  ! 71: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd877c000  ! 72: STX_R	stx	%r12, [%r31 + %r0]
	.word 0xd89fc020  ! 73: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
cwp_2_37:
    set user_data_start, %o7
	.word 0x93902005  ! 74: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_tba_2_38:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 75: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_2_39:
	taddcctv %r15, 0x118d, %r21
	.word 0xd807fd90  ! 76: LDUW_I	lduw	[%r31 + 0xfffffd90], %r12
mondo_2_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d90c007  ! 77: WRPR_WSTATE_R	wrpr	%r3, %r7, %wstate
mondo_2_41:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d944002  ! 78: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_42:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e007  ! 79: CASA_R	casa	[%r31] %asi, %r7, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 80: LDX_R	ldx	[%r31 + %r0], %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd857c000  ! 82: LDSH_R	ldsh	[%r31 + %r0], %r12
	.word 0xa0da8001  ! 83: SMULcc_R	smulcc 	%r10, %r1, %r16
	.word 0x8d903171  ! 84: WRPR_PSTATE_I	wrpr	%r0, 0x1171, %pstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_43
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_43:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 85: RDPC	rd	%pc, %r12
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 86: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_2_44-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_44:
	.word 0x9191c010  ! 87: WRPR_PIL_R	wrpr	%r7, %r16, %pil
splash_cmpr_2_45:
	setx 0xd975adad51840567, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 88: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9029a5  ! 89: WRPR_PSTATE_I	wrpr	%r0, 0x09a5, %pstate
	.word 0x93d02034  ! 90: Tcc_I	tne	icc_or_xcc, %r0 + 52
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 91: LDX_R	ldx	[%r31 + %r0], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_46) + 8, 16, 16)) -> intp(3,0,20)
intvec_2_46:
	.word 0x39400001  ! 92: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x0fd659bb710ead3a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_47:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 94: Tcc_I	ta	icc_or_xcc, %r0 + 51
change_to_randtl_2_48:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_48:
	.word 0x8f902001  ! 95: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_2_49:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 96: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d02034  ! 97: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_hpstate_2_50:
	.word 0x81982b0d  ! 98: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0d, %hpstate
	.word 0x9f80347d  ! 99: SIR	sir	0x147d
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 100: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 101: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe48804a0  ! 102: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
	.word 0x879021fb  ! 103: WRPR_TT_I	wrpr	%r0, 0x01fb, %tt
splash_cmpr_2_51:
	setx 0xe814b0c6042d82cf, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 104: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_2_52:
	tsubcctv %r17, 0x1c37, %r19
	.word 0xe407e86a  ! 105: LDUW_I	lduw	[%r31 + 0x086a], %r18
splash_cmpr_2_53:
	setx 0xa5f8a9b9c77d5520, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97a00174  ! 107: FABSq	dis not found

	.word 0x87902238  ! 108: WRPR_TT_I	wrpr	%r0, 0x0238, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1683023  ! 109: SDIVX_I	sdivx	%r0, 0xfffff023, %r16
	.word 0xe4c7e020  ! 110: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916b2c9d  ! 111: SDIVX_I	sdivx	%r12, 0x0c9d, %r8
splash_lsu_2_56:
	setx 0x0a3e6d5a43bf73e9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 112: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_2_57:
    set user_data_start, %o7
	.word 0x93902001  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x9ba48dcb  ! 114: FdMULq	fdmulq	
	.word 0xd517c000  ! 115: LDQF_R	-	[%r31, %r0], %f10
	.word 0xd46fff0b  ! 116: LDSTUB_I	ldstub	%r10, [%r31 + 0xffffff0b]
	.word 0xad812fc7  ! 117: WR_SOFTINT_REG_I	wr	%r4, 0x0fc7, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_58) + 8, 16, 16)) -> intp(0,0,23)
intvec_2_58:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 119: RDPR_TICK	rdpr	%tick, %r0
cwp_2_59:
    set user_data_start, %o7
	.word 0x93902006  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	rd %pc, %r19
	add %r19, (ivw_2_60-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_60:
	.word 0x91944005  ! 121: WRPR_PIL_R	wrpr	%r17, %r5, %pil
	.word 0xd4c804a0  ! 122: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
splash_lsu_2_61:
	setx 0xf2a4be77f16a09dd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 123: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_62:
	setx 0xdde3aff64070ce92, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 124: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_63:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 125: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 126: LDX_R	ldx	[%r31 + %r0], %r10
tagged_2_64:
	tsubcctv %r14, 0x1143, %r5
	.word 0xd407eaae  ! 127: LDUW_I	lduw	[%r31 + 0x0aae], %r10
	.word 0xd4800b20  ! 128: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r10
mondo_2_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d91c011  ! 129: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
	.word 0x91d020b5  ! 130: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xd46feaae  ! 131: LDSTUB_I	ldstub	%r10, [%r31 + 0x0aae]
splash_hpstate_2_66:
	.word 0x81982934  ! 132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0934, %hpstate
	.word 0xa3a00564  ! 133: FSQRTq	fsqrt	
	.word 0x87802016  ! 134: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d802004  ! 135: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81510000  ! 136: RDPR_TICK	rdpr	%tick, %r0
	.word 0x99500000  ! 137: RDPR_TPC	<illegal instruction>
pmu_2_67:
	nop
	setx 0xfffff94affffffc0, %g1, %g7
	.word 0xa3800007  ! 138: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_hpstate_2_68:
	.word 0x81982cdd  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdd, %hpstate
intveclr_2_69:
	setx 0x99578b2f78c90123, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
	.word 0x97414000  ! 141: RDPC	rd	%pc, %r11
	.word 0xd28008a0  ! 142: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01961  ! 143: FqTOd	dis not found

splash_lsu_2_72:
	setx 0x9546740d0092ac23, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 144: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_2_73:
    set user_data_start, %o7
	.word 0x93902002  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_cmpr_2_74:
	setx 0x2ef7fb9c68d84c0d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 146: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_2_75:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_75:
	.word 0x8f902002  ! 147: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_2_76:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d92800c  ! 148: WRPR_WSTATE_R	wrpr	%r10, %r12, %wstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_77
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_77:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 149: CASA_R	casa	[%r31] %asi, %r17, %r13
intveclr_2_78:
	setx 0x92d3bdec5385d931, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01964  ! 151: FqTOd	dis not found

debug_2_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 152: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996b2869  ! 153: SDIVX_I	sdivx	%r12, 0x0869, %r12
	.word 0xd48008a0  ! 154: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa1902003  ! 155: WRPR_GL_I	wrpr	%r0, 0x0003, %-
mondo_2_82:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d934014  ! 156: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_83
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_83:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e005  ! 157: CASA_R	casa	[%r31] %asi, %r5, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 158: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4bff810  ! 159: STDA_I	stda	%r10, [%r31 + 0xfffff810] %asi
	.word 0x91d02033  ! 160: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_lsu_2_84:
	setx 0xb330603fd6b4fb67, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 161: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_2_85:
	setx 0x9add20f1ce2ecd79, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xad847cc3  ! 163: WR_SOFTINT_REG_I	wr	%r17, 0x1cc3, %softint
DS_2_86:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f12, %f30, %f16
	.word 0x93b4c300  ! 164: ALIGNADDRESS	alignaddr	%r19, %r0, %r9
	.word 0x9f8021c6  ! 165: SIR	sir	0x01c6
	.word 0xd28804a0  ! 166: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_87
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_87:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 167: RDPC	rd	%pc, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd0800c80  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r8
splash_cmpr_2_88:
	setx 0x354aded45dfaaef1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 170: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_89)+24, 16, 16)) -> intp(2,1,3)
xir_2_89:
	.word 0xa9822f8c  ! 171: WR_SET_SOFTINT_I	wr	%r8, 0x0f8c, %set_softint
intveclr_2_90:
	setx 0xefad87647880d411, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902004  ! 173: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x8780208a  ! 174: WRASI_I	wr	%r0, 0x008a, %asi
memptr_2_91:
	set 0x60540000, %r31
	.word 0x8582a227  ! 175: WRCCR_I	wr	%r10, 0x0227, %ccr
	.word 0xd0d7e000  ! 176: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 177: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_decr_2_92:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa782000c  ! 178: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r12, %-
memptr_2_93:
	set user_data_start, %r31
	.word 0x8581e9b4  ! 179: WRCCR_I	wr	%r7, 0x09b4, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_94) + 32, 16, 16)) -> intp(4,0,17)
intvec_2_94:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200a  ! 181: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x87902060  ! 182: WRPR_TT_I	wrpr	%r0, 0x0060, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 183: LDX_R	ldx	[%r31 + %r0], %r8
splash_tba_2_95:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 184: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_2_96:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 185: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
tagged_2_97:
	taddcctv %r21, 0x1ddc, %r14
	.word 0xd007e0a0  ! 186: LDUW_I	lduw	[%r31 + 0x00a0], %r8
splash_cmpr_2_98:
	setx 0xbbeae554830d66e8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 187: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_2_99:
	nop
	setx 0xfffff198fffffbf2, %g1, %g7
	.word 0xa3800007  ! 188: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_2_100:
    set user_data_start, %o7
	.word 0x93902007  ! 189: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81460000  ! 190: RD_STICK_REG	stbar
change_to_randtl_2_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_101:
	.word 0x8f902000  ! 191: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_2_102:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 192: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 193: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa9818010  ! 194: WR_SET_SOFTINT_R	wr	%r6, %r16, %set_softint
	.word 0x8d902314  ! 195: WRPR_PSTATE_I	wrpr	%r0, 0x0314, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 196: LDX_R	ldx	[%r31 + %r0], %r8
debug_2_103:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 197: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_2_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_104:
	.word 0x8f902000  ! 198: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d90256f  ! 199: WRPR_PSTATE_I	wrpr	%r0, 0x056f, %pstate
cwp_2_105:
    set user_data_start, %o7
	.word 0x93902006  ! 200: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
pmu_2_106:
	nop
	setx 0xfffff007fffff53e, %g1, %g7
	.word 0xa3800007  ! 201: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02034  ! 202: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1902003  ! 203: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x95454000  ! 204: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_107:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 205: CASA_R	casa	[%r31] %asi, %r16, %r9
tagged_2_108:
	tsubcctv %r7, 0x1563, %r22
	.word 0xd207e0a0  ! 206: LDUW_I	lduw	[%r31 + 0x00a0], %r9
	setx 0xc8f93c39e4601696, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_109:
	.word 0x39400001  ! 207: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd2d804a0  ! 208: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
memptr_2_110:
	set 0x60340000, %r31
	.word 0x8584757f  ! 209: WRCCR_I	wr	%r17, 0x157f, %ccr
	.word 0xd327e9cb  ! 210: STF_I	st	%f9, [0x09cb, %r31]
debug_2_111:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 211: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
splash_lsu_2_112:
	setx 0x74282c5f12537c57, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 212: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93a0c9ed  ! 213: FDIVq	dis not found

memptr_2_113:
	set 0x60340000, %r31
	.word 0x85802be0  ! 214: WRCCR_I	wr	%r0, 0x0be0, %ccr
	.word 0xd8dfe000  ! 215: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r12
memptr_2_114:
	set user_data_start, %r31
	.word 0x858077a9  ! 216: WRCCR_I	wr	%r1, 0x17a9, %ccr
splash_lsu_2_115:
	setx 0x9f0e9fa102dba35f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_116
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_116:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 218: RDPC	rd	%pc, %r10
	.word 0xa1450000  ! 219: RD_SET_SOFTINT	rd	%set_softint, %r16
	.word 0x97a01a6d  ! 220: FqTOi	fqtoi	
	.word 0xd137c000  ! 221: STQF_R	-	%f8, [%r0, %r31]
	.word 0x3c700001  ! 222: BPPOS	<illegal instruction>
	.word 0x8790209f  ! 223: WRPR_TT_I	wrpr	%r0, 0x009f, %tt
	.word 0xa9a00174  ! 224: FABSq	dis not found

splash_cmpr_2_117:
	setx 0xee38f59136a531c4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 225: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_118:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 226: CASA_R	casa	[%r31] %asi, %r19, %r13
intveclr_2_119:
	setx 0x447fa0dc3f383a66, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 227: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_2_120:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb4cd323	! Random illegal ?
	.word 0xd712c007  ! 1: LDQF_R	-	[%r11, %r7], %f11
	.word 0xa5a40821  ! 228: FADDs	fadds	%f16, %f1, %f18
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 229: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 230: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_2_121:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_121:
	.word 0x8f902002  ! 231: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
memptr_2_122:
	set 0x60140000, %r31
	.word 0x8581f62a  ! 232: WRCCR_I	wr	%r7, 0x162a, %ccr
splash_tba_2_123:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 233: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8790220a  ! 234: WRPR_TT_I	wrpr	%r0, 0x020a, %tt
splash_cmpr_2_124:
	setx 0x6fdbbae982052c2c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 235: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4cfe020  ! 236: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r10
debug_2_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 237: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936b659f  ! 238: SDIVX_I	sdivx	%r13, 0x059f, %r9
	rd %pc, %r19
	add %r19, (ivw_2_127-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_127:
	.word 0x91944004  ! 239: WRPR_PIL_R	wrpr	%r17, %r4, %pil
	.word 0xd88fe020  ! 240: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
splash_cmpr_2_128:
	setx 0xf83e7d8bbb22ce5e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 241: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd88008a0  ! 242: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 243: LDX_R	ldx	[%r31 + %r0], %r12
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 244: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_2_129:
	setx 0xaef424f629104b9d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 245: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_130:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 246: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
DS_2_131:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 247: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9ba209d4  ! 248: FDIVd	fdivd	%f8, %f20, %f44
	.word 0x91a00172  ! 249: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01967  ! 250: FqTOd	dis not found

mondo_2_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d92c013  ! 251: WRPR_WSTATE_R	wrpr	%r11, %r19, %wstate
	.word 0x87802014  ! 252: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd81fc000  ! 253: LDD_R	ldd	[%r31 + %r0], %r12
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 254: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x2e800001  ! 255: BVS	bvs,a	<label_0x1>
debug_2_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 256: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd82ffda1  ! 257: STB_I	stb	%r12, [%r31 + 0xfffffda1]
DS_2_135:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x93a00540  ! 1: FSQRTd	fsqrt	
	.word 0x91a30832  ! 258: FADDs	fadds	%f12, %f18, %f8
	.word 0xab810011  ! 259: WR_CLEAR_SOFTINT_R	wr	%r4, %r17, %clear_softint
debug_2_136:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 260: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200d  ! 261: WRPR_GL_I	wrpr	%r0, 0x000d, %-
change_to_randtl_2_137:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_137:
	.word 0x8f902001  ! 262: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_138) + 8, 16, 16)) -> intp(0,0,9)
intvec_2_138:
	.word 0x39400001  ! 263: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_139
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_139:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 264: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0x8d9020fc  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x00fc, %pstate
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
	.word 0x93414000  ! 266: RDPC	rd	%pc, %r9
intveclr_2_141:
	setx 0x6c04b3ca04aafd15, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 267: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 268: WRASI_I	wr	%r0, 0x0080, %asi
change_to_randtl_2_142:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_142:
	.word 0x8f902000  ! 269: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_2_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_143:
	.word 0x8f902001  ! 270: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd257c000  ! 271: LDSH_R	ldsh	[%r31 + %r0], %r9
mondo_2_144:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d92c011  ! 272: WRPR_WSTATE_R	wrpr	%r11, %r17, %wstate
	.word 0x91927fe7  ! 273: WRPR_PIL_I	wrpr	%r9, 0x1fe7, %pil
splash_tba_2_145:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 274: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1902001  ! 275: WRPR_GL_I	wrpr	%r0, 0x0001, %-
memptr_2_146:
	set 0x60540000, %r31
	.word 0x8582352b  ! 276: WRCCR_I	wr	%r8, 0x152b, %ccr
	.word 0xa1a00162  ! 277: FABSq	dis not found

splash_cmpr_2_147:
	setx 0xb629154b2ada6c20, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_148:
	setx 0x85c6c360806f7491, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 279: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_2_149:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_149-donret_2_149-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_149:
	.word 0xdaffec13  ! 280: SWAPA_I	swapa	%r13, [%r31 + 0x0c13] %asi
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_150:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 281: CASA_R	casa	[%r31] %asi, %r16, %r13
intveclr_2_151:
	setx 0x667c15459a7e9f70, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 282: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_152:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 283: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_2_153:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 284: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	.word 0x91a049c1  ! 285: FDIVd	fdivd	%f32, %f32, %f8
	.word 0xda8008a0  ! 286: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
donret_2_154:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_154-donret_2_154), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_154:
	.word 0xdaffec13  ! 287: SWAPA_I	swapa	%r13, [%r31 + 0x0c13] %asi
	.word 0x8d9024a9  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x04a9, %pstate
	.word 0xdaffc021  ! 289: SWAPA_R	swapa	%r13, [%r31 + %r1] 0x01
splash_htba_2_155:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 290: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xda4fec13  ! 291: LDSB_I	ldsb	[%r31 + 0x0c13], %r13
debug_2_156:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 292: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
debug_2_157:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 293: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9945c000  ! 294: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0xe80fec13  ! 295: LDUB_I	ldub	[%r31 + 0x0c13], %r20
	.word 0xe847ec13  ! 296: LDSW_I	ldsw	[%r31 + 0x0c13], %r20
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_158
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_158:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e001  ! 297: CASA_R	casa	[%r31] %asi, %r1, %r20
	.word 0xa1902007  ! 298: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xe83fc000  ! 299: STD_R	std	%r20, [%r31 + %r0]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 300: LDX_R	ldx	[%r31 + %r0], %r20
splash_hpstate_2_159:
	.word 0x81982017  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0017, %hpstate
	.word 0xe88008a0  ! 302: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
cwp_2_160:
    set user_data_start, %o7
	.word 0x93902005  ! 303: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
memptr_2_161:
	set 0x60340000, %r31
	.word 0x8580a651  ! 304: WRCCR_I	wr	%r2, 0x0651, %ccr
	.word 0xe8dfe020  ! 305: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r20
splash_tba_2_162:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 306: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_decr_2_163:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa7834012  ! 307: WR_GRAPHICS_STATUS_REG_R	wr	%r13, %r18, %-
splash_hpstate_2_164:
	.word 0x81982d45  ! 308: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d45, %hpstate
	setx 0x80cfa2341b43728d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_165:
	.word 0x39400001  ! 309: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_2_166:
	setx 0x62679627077bd45b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 310: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_167:
	.word 0x81982f17  ! 311: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f17, %hpstate
	.word 0x91d02033  ! 312: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe807c000  ! 313: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0x91d02033  ! 314: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_2_168:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 315: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
splash_cmpr_2_169:
	setx 0x54bc62867ac367c1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 316: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91953da9  ! 317: WRPR_PIL_I	wrpr	%r20, 0x1da9, %pil
splash_cmpr_2_170:
	setx 0x1bc45bf8c139c94b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 318: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_171:
	setx 0x99cba3db54644d2a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_172:
	setx 0xaa1468fe56f2bd4a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 320: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32800001  ! 321: BNE	bne,a	<label_0x1>
splash_lsu_2_173:
	setx 0x677cb7e8db803a8f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 322: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_2_174:
	set user_data_start, %r31
	.word 0x85847ea7  ! 323: WRCCR_I	wr	%r17, 0x1ea7, %ccr
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_175
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_175:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 324: RDPC	rd	%pc, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01970  ! 325: FqTOd	dis not found

splash_cmpr_2_177:
	setx 0x2306b9f873c7f487, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_178:
	setx 0x40df0144170dbbf5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 327: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe827eb39  ! 328: STW_I	stw	%r20, [%r31 + 0x0b39]
	.word 0x99500000  ! 329: RDPR_TPC	<illegal instruction>
	.word 0x99a00160  ! 330: FABSq	dis not found

	.word 0x95464000  ! 331: RD_STICK_CMPR_REG	rd	%-, %r10
	.word 0xe23fc000  ! 332: STD_R	std	%r17, [%r31 + %r0]
	.word 0x90694006  ! 333: UDIVX_R	udivx 	%r5, %r6, %r8
	.word 0x98814007  ! 334: ADDcc_R	addcc 	%r5, %r7, %r12
	.word 0x8790239a  ! 335: WRPR_TT_I	wrpr	%r0, 0x039a, %tt
	.word 0x83d020b5  ! 336: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01970  ! 337: FqTOd	dis not found

splash_cmpr_2_180:
	setx 0x069892e8baed2624, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 338: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_181:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 339: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
intveclr_2_182:
	setx 0xe3bca6d69fcb8617, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 340: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9569f26e  ! 341: SDIVX_I	sdivx	%r7, 0xfffff26e, %r10
	.word 0xa1480000  ! 342: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0x91d020b3  ! 343: Tcc_I	ta	icc_or_xcc, %r0 + 179
DS_2_184:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f14, %f4, %f30
	.word 0xa5b44312  ! 344: ALIGNADDRESS	alignaddr	%r17, %r18, %r18
debug_2_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 345: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_2_186:
	setx 0x6bb21e874648754b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 346: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd51fc000  ! 347: LDDF_R	ldd	[%r31, %r0], %f10
mondo_2_187:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94400d  ! 348: WRPR_WSTATE_R	wrpr	%r17, %r13, %wstate
splash_decr_2_188:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r19, [%r1] 0x45
	.word 0xa7824003  ! 349: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r3, %-
	.word 0x95a049f2  ! 350: FDIVq	dis not found

debug_2_189:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 351: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
change_to_randtl_2_190:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_190:
	.word 0x8f902000  ! 352: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd28008a0  ! 353: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_hpstate_2_191:
	.word 0x81982894  ! 354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0894, %hpstate
	.word 0x9b53c000  ! 355: RDPR_FQ	<illegal instruction>
	.word 0xd4ffc028  ! 356: SWAPA_R	swapa	%r10, [%r31 + %r8] 0x01
intveclr_2_192:
	setx 0xe1a82eac2da1d257, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 357: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 358: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd4c004a0  ! 359: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x99a0c9d3  ! 360: FDIVd	fdivd	%f34, %f50, %f12
	.word 0xe6d7e030  ! 361: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r19
splash_hpstate_2_193:
	.word 0x8198288c  ! 362: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088c, %hpstate
debug_2_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 363: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa2d2c011  ! 364: UMULcc_R	umulcc 	%r11, %r17, %r17
tagged_2_195:
	taddcctv %r6, 0x1f52, %r4
	.word 0xd407f436  ! 365: LDUW_I	lduw	[%r31 + 0xfffff436], %r10
memptr_2_196:
	set 0x60140000, %r31
	.word 0x858361e2  ! 366: WRCCR_I	wr	%r13, 0x01e2, %ccr
	.word 0xd46ff33c  ! 367: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff33c]
cwp_2_197:
    set user_data_start, %o7
	.word 0x93902003  ! 368: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 369: LDX_R	ldx	[%r31 + %r0], %r10
splash_cmpr_2_198:
	setx 0x2454196097dedad7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 370: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_2_199:
    set user_data_start, %o7
	.word 0x93902000  ! 371: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd45ff33c  ! 372: LDX_I	ldx	[%r31 + 0xfffff33c], %r10
	.word 0x91d02035  ! 373: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_2_200:
	tsubcctv %r2, 0x1fc6, %r18
	.word 0xd407f33c  ! 374: LDUW_I	lduw	[%r31 + 0xfffff33c], %r10
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_201:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 375: CASA_R	casa	[%r31] %asi, %r0, %r10
splash_hpstate_2_202:
	.word 0x81982815  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0815, %hpstate
splash_cmpr_2_203:
	setx 0xc37989c7a3744054, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 377: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa945c000  ! 379: RD_TICK_CMPR_REG	rd	%-, %r20
debug_2_204:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 380: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_205:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 381: CASA_R	casa	[%r31] %asi, %r0, %r10
	.word 0x87802016  ! 382: WRASI_I	wr	%r0, 0x0016, %asi
mondo_2_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d950008  ! 383: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
	.word 0xa5a000c6  ! 384: FNEGd	fnegd	%f6, %f18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 385: LDX_R	ldx	[%r31 + %r0], %r10
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 386: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_2_207:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 387: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	.word 0x8d902ce1  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x0ce1, %pstate
	.word 0x94d0397a  ! 389: UMULcc_I	umulcc 	%r0, 0xfffff97a, %r10
tagged_2_208:
	tsubcctv %r4, 0x186b, %r12
	.word 0xd207fca8  ! 390: LDUW_I	lduw	[%r31 + 0xfffffca8], %r9
intveclr_2_209:
	setx 0x4c2f391679b6155b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 391: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_210:
	setx 0xd99232a495fc4587, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_211:
	setx 0xc3c602c7500089f0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 393: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd26ffca8  ! 394: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffffca8]
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_212
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_212:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e003  ! 395: CASA_R	casa	[%r31] %asi, %r3, %r9
	.word 0x87802016  ! 396: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x87802004  ! 397: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a0196c  ! 398: FqTOd	dis not found

	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
change_to_randtl_1_0:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_0:
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_1_1:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 3: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_1_2:
	.word 0x8198234d  ! 4: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034d, %hpstate
splash_cmpr_1_3:
	setx 0x10b0d911b7c61499, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 5: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_4
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_4
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_4:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 6: RDPC	rd	%pc, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01973  ! 7: FqTOd	dis not found

memptr_1_6:
	set user_data_start, %r31
	.word 0x85853b0d  ! 8: WRCCR_I	wr	%r20, 0x1b0d, %ccr
mondo_1_7:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d904002  ! 9: WRPR_WSTATE_R	wrpr	%r1, %r2, %wstate
	.word 0xd48fe020  ! 10: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
memptr_1_8:
	set 0x60740000, %r31
	.word 0x858472f6  ! 11: WRCCR_I	wr	%r17, 0x12f6, %ccr
splash_cmpr_1_9:
	setx 0x3f4613ea97361b73, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 12: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_1_10:
	.word 0x81982a0d  ! 13: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0d, %hpstate
splash_hpstate_1_11:
	.word 0x8198241e  ! 14: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041e, %hpstate
	.word 0x91d02035  ! 15: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x99902004  ! 16: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
debug_1_12:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 17: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0xd42fe243  ! 18: STB_I	stb	%r10, [%r31 + 0x0243]
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_13
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_13:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00d  ! 19: CASA_R	casa	[%r31] %asi, %r13, %r10
	.word 0x8d902d97  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x0d97, %pstate
DS_1_14:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 21: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xd4d7e000  ! 22: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
	.word 0xd53fe243  ! 23: STDF_I	std	%f10, [0x0243, %r31]
	.word 0xd44fe243  ! 24: LDSB_I	ldsb	[%r31 + 0x0243], %r10
	.word 0xd4d7e030  ! 25: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
	.word 0x91d02035  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x95a01a62  ! 27: FqTOi	fqtoi	
	.word 0x87802083  ! 28: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0xe0d7e000  ! 29: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
	.word 0xe127e243  ! 30: STF_I	st	%f16, [0x0243, %r31]
	.word 0xa5a0016d  ! 31: FABSq	dis not found

splash_tba_1_15:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_1_16:
	.word 0x91a149c3  ! 1: FDIVd	fdivd	%f36, %f34, %f8
	.word 0xe734ba4b  ! 1: STQF_I	-	%f19, [0x1a4b, %r18]
	normalw
	.word 0x9b458000  ! 33: RD_SOFTINT_REG	rd	%softint, %r13
debug_1_17:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 34: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_18
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_18
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_18:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 35: RDPC	rd	%pc, %r19
	.word 0xd0900e60  ! 36: LDUHA_R	lduha	[%r0, %r0] 0x73, %r8
cwp_1_19:
    set user_data_start, %o7
	.word 0x93902000  ! 37: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_tba_1_20:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 38: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd06ffd6b  ! 39: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffd6b]
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 40: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1a149ad  ! 41: FDIVs	fdivs	%f5, %f13, %f16
cwp_1_21:
    set user_data_start, %o7
	.word 0x93902001  ! 42: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d802000  ! 43: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a0196b  ! 44: FqTOd	dis not found

tagged_1_23:
	taddcctv %r8, 0x1025, %r18
	.word 0xd407fd6b  ! 45: LDUW_I	lduw	[%r31 + 0xfffffd6b], %r10
	.word 0xd48008a0  ! 46: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_1_24:
	setx 0xfe9bd0537cbb9735, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 47: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_1_25:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f0, %f4, %f20
	.word 0x99b34301  ! 48: ALIGNADDRESS	alignaddr	%r13, %r1, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r10
splash_cmpr_1_26:
	setx 0x6d763f605d782c1c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 51: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_1_27:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 52: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
intveclr_1_28:
	setx 0x874ec58535f30eac, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 53: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 54: Tcc_R	ta	icc_or_xcc, %r0 + %r30
donret_1_29:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_29-donret_1_29-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_29:
	.word 0xd4fffd6b  ! 55: SWAPA_I	swapa	%r10, [%r31 + 0xfffffd6b] %asi
DS_1_30:
	.word 0xa9a189d1  ! 1: FDIVd	fdivd	%f6, %f48, %f20
	.word 0xbfefc000  ! 56: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa86abf3e  ! 57: UDIVX_I	udivx 	%r10, 0xffffff3e, %r20
	.word 0xd48008a0  ! 58: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_tba_1_31:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 59: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_1_32:
	setx 0x78fb28df9f672415, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 60: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4c7e020  ! 61: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r10
change_to_randtl_1_33:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_33:
	.word 0x8f902003  ! 62: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd4d804a0  ! 63: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 64: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_hpstate_1_34:
	.word 0x81982617  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0617, %hpstate
	.word 0x93d02034  ! 66: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xa7a289d0  ! 67: FDIVd	fdivd	%f10, %f16, %f50
donret_1_35:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_35-donret_1_35-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_35:
	.word 0xd8fffd90  ! 68: SWAPA_I	swapa	%r12, [%r31 + 0xfffffd90] %asi
	.word 0xd8bfc020  ! 69: STDA_R	stda	%r12, [%r31 + %r0] 0x01
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 70: LDX_R	ldx	[%r31 + %r0], %r12
change_to_randtl_1_36:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_36:
	.word 0x8f902001  ! 71: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd877c000  ! 72: STX_R	stx	%r12, [%r31 + %r0]
	.word 0xd89fc020  ! 73: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
cwp_1_37:
    set user_data_start, %o7
	.word 0x93902004  ! 74: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_tba_1_38:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 75: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_1_39:
	taddcctv %r17, 0x138e, %r18
	.word 0xd807fd90  ! 76: LDUW_I	lduw	[%r31 + 0xfffffd90], %r12
mondo_1_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d94000c  ! 77: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
mondo_1_41:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d914007  ! 78: WRPR_WSTATE_R	wrpr	%r5, %r7, %wstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_42:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e007  ! 79: CASA_R	casa	[%r31] %asi, %r7, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 80: LDX_R	ldx	[%r31 + %r0], %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd857c000  ! 82: LDSH_R	ldsh	[%r31 + %r0], %r12
	.word 0xa8d94011  ! 83: SMULcc_R	smulcc 	%r5, %r17, %r20
	.word 0x8d902ae3  ! 84: WRPR_PSTATE_I	wrpr	%r0, 0x0ae3, %pstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_43
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_43:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 85: RDPC	rd	%pc, %r10
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 86: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_1_44-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_44:
	.word 0x91944000  ! 87: WRPR_PIL_R	wrpr	%r17, %r0, %pil
splash_cmpr_1_45:
	setx 0x28a289868e624461, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 88: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903f05  ! 89: WRPR_PSTATE_I	wrpr	%r0, 0x1f05, %pstate
	.word 0x83d02034  ! 90: Tcc_I	te	icc_or_xcc, %r0 + 52
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 91: LDX_R	ldx	[%r31 + %r0], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_46) + 0, 16, 16)) -> intp(0,0,22)
intvec_1_46:
	.word 0x39400001  ! 92: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x03d2fc2aa11c3d76, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_47:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 94: Tcc_I	ta	icc_or_xcc, %r0 + 51
change_to_randtl_1_48:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_48:
	.word 0x8f902002  ! 95: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_tba_1_49:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 96: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x83d020b5  ! 97: Tcc_I	te	icc_or_xcc, %r0 + 181
splash_hpstate_1_50:
	.word 0x81982c17  ! 98: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c17, %hpstate
	.word 0x9f802371  ! 99: SIR	sir	0x0371
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 100: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 101: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe48804a0  ! 102: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
	.word 0x87902384  ! 103: WRPR_TT_I	wrpr	%r0, 0x0384, %tt
splash_cmpr_1_51:
	setx 0x0e54843367a7b303, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 104: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_1_52:
	tsubcctv %r10, 0x1d23, %r22
	.word 0xe407e86a  ! 105: LDUW_I	lduw	[%r31 + 0x086a], %r18
splash_cmpr_1_53:
	setx 0x9a7ede4a934c95e7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7a00164  ! 107: FABSq	dis not found

	.word 0x87902218  ! 108: WRPR_TT_I	wrpr	%r0, 0x0218, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36b6f4a  ! 109: SDIVX_I	sdivx	%r13, 0x0f4a, %r17
	.word 0xe4c7e030  ! 110: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56c3079  ! 111: SDIVX_I	sdivx	%r16, 0xfffff079, %r18
splash_lsu_1_56:
	setx 0x4e22f8512a0bf1d9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 112: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_1_57:
    set user_data_start, %o7
	.word 0x93902006  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x99a08dc7  ! 114: FdMULq	fdmulq	
	.word 0xd517c000  ! 115: LDQF_R	-	[%r31, %r0], %f10
	.word 0xd46fff0b  ! 116: LDSTUB_I	ldstub	%r10, [%r31 + 0xffffff0b]
	.word 0xad80a8c6  ! 117: WR_SOFTINT_REG_I	wr	%r2, 0x08c6, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_58) + 56, 16, 16)) -> intp(5,0,10)
intvec_1_58:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 119: RDPR_TICK	rdpr	%tick, %r0
cwp_1_59:
    set user_data_start, %o7
	.word 0x93902006  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	rd %pc, %r19
	add %r19, (ivw_1_60-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_60:
	.word 0x9191c010  ! 121: WRPR_PIL_R	wrpr	%r7, %r16, %pil
	.word 0xd4c804a0  ! 122: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
splash_lsu_1_61:
	setx 0x9823be235b28c735, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 123: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_62:
	setx 0xc3b84e079ca86c00, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 124: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_63:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 125: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 126: LDX_R	ldx	[%r31 + %r0], %r10
tagged_1_64:
	tsubcctv %r19, 0x1b7f, %r19
	.word 0xd407eaae  ! 127: LDUW_I	lduw	[%r31 + 0x0aae], %r10
	.word 0xd4800ae0  ! 128: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r10
mondo_1_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d910011  ! 129: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
	.word 0x91d020b3  ! 130: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xd46feaae  ! 131: LDSTUB_I	ldstub	%r10, [%r31 + 0x0aae]
splash_hpstate_1_66:
	.word 0x819828b6  ! 132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08b6, %hpstate
	.word 0xa7a00574  ! 133: FSQRTq	fsqrt	
	.word 0x87802088  ! 134: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d802000  ! 135: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81510000  ! 136: RDPR_TICK	rdpr	%tick, %r0
	.word 0x91500000  ! 137: RDPR_TPC	<illegal instruction>
pmu_1_67:
	nop
	setx 0xfffffc8bfffff572, %g1, %g7
	.word 0xa3800007  ! 138: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_hpstate_1_68:
	.word 0x81982797  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0797, %hpstate
intveclr_1_69:
	setx 0x63b5d5c2a60385ed, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
	.word 0x97414000  ! 141: RDPC	rd	%pc, %r11
	.word 0xd28008a0  ! 142: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01969  ! 143: FqTOd	dis not found

splash_lsu_1_72:
	setx 0xcb2274e901fcd75f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 144: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_1_73:
    set user_data_start, %o7
	.word 0x93902004  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_cmpr_1_74:
	setx 0x40e247b4f36458c4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 146: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_1_75:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_75:
	.word 0x8f902002  ! 147: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_1_76:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d940011  ! 148: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_77
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_77:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 149: CASA_R	casa	[%r31] %asi, %r17, %r13
intveclr_1_78:
	setx 0x370d50145cddbd53, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a0196c  ! 151: FqTOd	dis not found

debug_1_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 152: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56b353f  ! 153: SDIVX_I	sdivx	%r12, 0xfffff53f, %r18
	.word 0xd48008a0  ! 154: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa1902009  ! 155: WRPR_GL_I	wrpr	%r0, 0x0009, %-
mondo_1_82:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d900001  ! 156: WRPR_WSTATE_R	wrpr	%r0, %r1, %wstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_83
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_83:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e005  ! 157: CASA_R	casa	[%r31] %asi, %r5, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 158: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4bff810  ! 159: STDA_I	stda	%r10, [%r31 + 0xfffff810] %asi
	.word 0x93d02035  ! 160: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_lsu_1_84:
	setx 0x6b47374901ccbd75, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 161: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_1_85:
	setx 0xe365a190398c02e1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xad80275b  ! 163: WR_SOFTINT_REG_I	wr	%r0, 0x075b, %softint
DS_1_86:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f22, %f12, %f20
	.word 0x9bb34313  ! 164: ALIGNADDRESS	alignaddr	%r13, %r19, %r13
	.word 0x9f803eaa  ! 165: SIR	sir	0x1eaa
	.word 0xd28804a0  ! 166: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_87
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_87:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 167: RDPC	rd	%pc, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd08008a0  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
splash_cmpr_1_88:
	setx 0x77c6b446598e7718, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 170: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_89)+8, 16, 16)) -> intp(1,1,3)
xir_1_89:
	.word 0xa982fea0  ! 171: WR_SET_SOFTINT_I	wr	%r11, 0x1ea0, %set_softint
intveclr_1_90:
	setx 0x814cd8970eeec16d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902002  ! 173: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x8780208a  ! 174: WRASI_I	wr	%r0, 0x008a, %asi
memptr_1_91:
	set 0x60740000, %r31
	.word 0x8580f5a5  ! 175: WRCCR_I	wr	%r3, 0x15a5, %ccr
	.word 0xd0d7e000  ! 176: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 177: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_decr_1_92:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa782800a  ! 178: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r10, %-
memptr_1_93:
	set user_data_start, %r31
	.word 0x8584f806  ! 179: WRCCR_I	wr	%r19, 0x1806, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_94) + 0, 16, 16)) -> intp(6,0,7)
intvec_1_94:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902003  ! 181: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x87902281  ! 182: WRPR_TT_I	wrpr	%r0, 0x0281, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 183: LDX_R	ldx	[%r31 + %r0], %r8
splash_tba_1_95:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 184: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_1_96:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 185: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
tagged_1_97:
	taddcctv %r24, 0x1238, %r11
	.word 0xd007e0a0  ! 186: LDUW_I	lduw	[%r31 + 0x00a0], %r8
splash_cmpr_1_98:
	setx 0xbe65c3a8987068d5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 187: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_1_99:
	nop
	setx 0xfffff2d0fffff8ef, %g1, %g7
	.word 0xa3800007  ! 188: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_1_100:
    set user_data_start, %o7
	.word 0x93902007  ! 189: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81460000  ! 190: RD_STICK_REG	stbar
change_to_randtl_1_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_101:
	.word 0x8f902002  ! 191: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_1_102:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 192: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 193: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa9844013  ! 194: WR_SET_SOFTINT_R	wr	%r17, %r19, %set_softint
	.word 0x8d903114  ! 195: WRPR_PSTATE_I	wrpr	%r0, 0x1114, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 196: LDX_R	ldx	[%r31 + %r0], %r8
debug_1_103:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 197: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_1_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_104:
	.word 0x8f902002  ! 198: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d9034c0  ! 199: WRPR_PSTATE_I	wrpr	%r0, 0x14c0, %pstate
cwp_1_105:
    set user_data_start, %o7
	.word 0x93902000  ! 200: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
pmu_1_106:
	nop
	setx 0xfffffb6cfffff955, %g1, %g7
	.word 0xa3800007  ! 201: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93d02034  ! 202: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xa190200f  ! 203: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa5454000  ! 204: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_107:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 205: CASA_R	casa	[%r31] %asi, %r16, %r9
tagged_1_108:
	tsubcctv %r10, 0x16f2, %r11
	.word 0xd207e0a0  ! 206: LDUW_I	lduw	[%r31 + 0x00a0], %r9
	setx 0x6545de10ec0f0322, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_109:
	.word 0x39400001  ! 207: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd2d804a0  ! 208: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
memptr_1_110:
	set 0x60340000, %r31
	.word 0x858161c8  ! 209: WRCCR_I	wr	%r5, 0x01c8, %ccr
	.word 0xd327e9cb  ! 210: STF_I	st	%f9, [0x09cb, %r31]
debug_1_111:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 211: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
splash_lsu_1_112:
	setx 0x47f90e87de0394d9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 212: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93a509e6  ! 213: FDIVq	dis not found

memptr_1_113:
	set 0x60140000, %r31
	.word 0x85822fc4  ! 214: WRCCR_I	wr	%r8, 0x0fc4, %ccr
	.word 0xd8dfe020  ! 215: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
memptr_1_114:
	set user_data_start, %r31
	.word 0x858431d9  ! 216: WRCCR_I	wr	%r16, 0x11d9, %ccr
splash_lsu_1_115:
	setx 0x361108653cff162d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_116
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_116:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 218: RDPC	rd	%pc, %r11
	.word 0x9b450000  ! 219: RD_SET_SOFTINT	rd	%set_softint, %r13
	.word 0xa9a01a62  ! 220: FqTOi	fqtoi	
	.word 0xd137c000  ! 221: STQF_R	-	%f8, [%r0, %r31]
	.word 0x3c700001  ! 222: BPPOS	<illegal instruction>
	.word 0x87902021  ! 223: WRPR_TT_I	wrpr	%r0, 0x0021, %tt
	.word 0xa9a00162  ! 224: FABSq	dis not found

splash_cmpr_1_117:
	setx 0xa33f0f094dcc75e1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 225: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_118:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 226: CASA_R	casa	[%r31] %asi, %r19, %r13
intveclr_1_119:
	setx 0x117fdba38ca98d67, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 227: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_1_120:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xb14b622c	! Random illegal ?
	.word 0xd9144011  ! 1: LDQF_R	-	[%r17, %r17], %f12
	.word 0x97a1c822  ! 228: FADDs	fadds	%f7, %f2, %f11
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 229: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 230: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_1_121:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_121:
	.word 0x8f902000  ! 231: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
memptr_1_122:
	set 0x60540000, %r31
	.word 0x8580e59f  ! 232: WRCCR_I	wr	%r3, 0x059f, %ccr
splash_tba_1_123:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 233: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87902102  ! 234: WRPR_TT_I	wrpr	%r0, 0x0102, %tt
splash_cmpr_1_124:
	setx 0xe82f4c1e873e83b0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 235: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4cfe020  ! 236: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r10
debug_1_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 237: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996a730d  ! 238: SDIVX_I	sdivx	%r9, 0xfffff30d, %r12
	rd %pc, %r19
	add %r19, (ivw_1_127-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_127:
	.word 0x9194c011  ! 239: WRPR_PIL_R	wrpr	%r19, %r17, %pil
	.word 0xd88fe030  ! 240: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r12
splash_cmpr_1_128:
	setx 0xc35625ca89f8cb9b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 241: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8800a60  ! 242: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 243: LDX_R	ldx	[%r31 + %r0], %r12
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 244: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_1_129:
	setx 0x6b7af62eef1ca658, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 245: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_130:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 246: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
DS_1_131:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 247: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x97a109ca  ! 248: FDIVd	fdivd	%f4, %f10, %f42
	.word 0x91a0016b  ! 249: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01973  ! 250: FqTOd	dis not found

mondo_1_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d95000b  ! 251: WRPR_WSTATE_R	wrpr	%r20, %r11, %wstate
	.word 0x87802055  ! 252: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xd81fc000  ! 253: LDD_R	ldd	[%r31 + %r0], %r12
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 254: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2e800001  ! 255: BVS	bvs,a	<label_0x1>
debug_1_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 256: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd82ffda1  ! 257: STB_I	stb	%r12, [%r31 + 0xfffffda1]
DS_1_135:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x91a00543  ! 1: FSQRTd	fsqrt	
	.word 0x99a24823  ! 258: FADDs	fadds	%f9, %f3, %f12
	.word 0xab834008  ! 259: WR_CLEAR_SOFTINT_R	wr	%r13, %r8, %clear_softint
debug_1_136:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 260: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902005  ! 261: WRPR_GL_I	wrpr	%r0, 0x0005, %-
change_to_randtl_1_137:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_137:
	.word 0x8f902001  ! 262: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_138) + 56, 16, 16)) -> intp(7,0,4)
intvec_1_138:
	.word 0x39400001  ! 263: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_139
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_139:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 264: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0x8d903301  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x1301, %pstate
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
	.word 0x9b414000  ! 266: RDPC	rd	%pc, %r13
intveclr_1_141:
	setx 0xac60adeaab254164, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 267: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 268: WRASI_I	wr	%r0, 0x0080, %asi
change_to_randtl_1_142:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_142:
	.word 0x8f902000  ! 269: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_1_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_143:
	.word 0x8f902000  ! 270: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd257c000  ! 271: LDSH_R	ldsh	[%r31 + %r0], %r9
mondo_1_144:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d94800b  ! 272: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
	.word 0x919225cd  ! 273: WRPR_PIL_I	wrpr	%r8, 0x05cd, %pil
splash_tba_1_145:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 274: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1902000  ! 275: WRPR_GL_I	wrpr	%r0, 0x0000, %-
memptr_1_146:
	set 0x60740000, %r31
	.word 0x8580fd31  ! 276: WRCCR_I	wr	%r3, 0x1d31, %ccr
	.word 0x9ba00166  ! 277: FABSq	dis not found

splash_cmpr_1_147:
	setx 0xac85ad1923e8a7d3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_148:
	setx 0x8f59163a58d81f0a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 279: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_1_149:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_149-donret_1_149-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_149:
	.word 0xdaffec13  ! 280: SWAPA_I	swapa	%r13, [%r31 + 0x0c13] %asi
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_150:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 281: CASA_R	casa	[%r31] %asi, %r16, %r13
intveclr_1_151:
	setx 0x08cc397f0c85e98d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 282: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_152:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 283: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_1_153:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 284: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	.word 0x95a409d2  ! 285: FDIVd	fdivd	%f16, %f18, %f10
	.word 0xda8008a0  ! 286: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
donret_1_154:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_154-donret_1_154), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_154:
	.word 0xdaffec13  ! 287: SWAPA_I	swapa	%r13, [%r31 + 0x0c13] %asi
	.word 0x8d90313b  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x113b, %pstate
	.word 0xdaffc021  ! 289: SWAPA_R	swapa	%r13, [%r31 + %r1] 0x01
splash_htba_1_155:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 290: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xda4fec13  ! 291: LDSB_I	ldsb	[%r31 + 0x0c13], %r13
debug_1_156:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 292: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
debug_1_157:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 293: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9745c000  ! 294: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0xe80fec13  ! 295: LDUB_I	ldub	[%r31 + 0x0c13], %r20
	.word 0xe847ec13  ! 296: LDSW_I	ldsw	[%r31 + 0x0c13], %r20
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_158
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_158:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e001  ! 297: CASA_R	casa	[%r31] %asi, %r1, %r20
	.word 0xa1902009  ! 298: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xe83fc000  ! 299: STD_R	std	%r20, [%r31 + %r0]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 300: LDX_R	ldx	[%r31 + %r0], %r20
splash_hpstate_1_159:
	.word 0x81982785  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0785, %hpstate
	.word 0xe8800ba0  ! 302: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r20
cwp_1_160:
    set user_data_start, %o7
	.word 0x93902004  ! 303: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
memptr_1_161:
	set 0x60140000, %r31
	.word 0x85843f2e  ! 304: WRCCR_I	wr	%r16, 0x1f2e, %ccr
	.word 0xe8dfe030  ! 305: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
splash_tba_1_162:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 306: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_decr_1_163:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa780c00c  ! 307: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r12, %-
splash_hpstate_1_164:
	.word 0x81982d04  ! 308: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d04, %hpstate
	setx 0xacd3b507da47c1d4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_165:
	.word 0x39400001  ! 309: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_1_166:
	setx 0xc59b2d9f86fb74cd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 310: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_167:
	.word 0x81982f94  ! 311: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f94, %hpstate
	.word 0x91d02032  ! 312: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe807c000  ! 313: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0x83d02034  ! 314: Tcc_I	te	icc_or_xcc, %r0 + 52
debug_1_168:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 315: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
splash_cmpr_1_169:
	setx 0xef7055b40a90fbe4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 316: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91947126  ! 317: WRPR_PIL_I	wrpr	%r17, 0x1126, %pil
splash_cmpr_1_170:
	setx 0x40f047d968b7166a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 318: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_171:
	setx 0x757a17186364c729, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_172:
	setx 0xb86d53ae648f1dd4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 320: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32800001  ! 321: BNE	bne,a	<label_0x1>
splash_lsu_1_173:
	setx 0xd52a2abe8306cdfd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 322: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_1_174:
	set user_data_start, %r31
	.word 0x8581b0ee  ! 323: WRCCR_I	wr	%r6, 0x10ee, %ccr
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_175
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_175:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 324: RDPC	rd	%pc, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01971  ! 325: FqTOd	dis not found

splash_cmpr_1_177:
	setx 0xc475f99cea4926df, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_178:
	setx 0x662e377fbcbd47ad, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 327: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe827eb39  ! 328: STW_I	stw	%r20, [%r31 + 0x0b39]
	.word 0x95500000  ! 329: RDPR_TPC	<illegal instruction>
	.word 0xa3a0016c  ! 330: FABSq	dis not found

	.word 0x9b464000  ! 331: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0xe23fc000  ! 332: STD_R	std	%r17, [%r31 + %r0]
	.word 0xa26cc004  ! 333: UDIVX_R	udivx 	%r19, %r4, %r17
	.word 0x92840004  ! 334: ADDcc_R	addcc 	%r16, %r4, %r9
	.word 0x87902191  ! 335: WRPR_TT_I	wrpr	%r0, 0x0191, %tt
	.word 0x91d02034  ! 336: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196d  ! 337: FqTOd	dis not found

splash_cmpr_1_180:
	setx 0x39f52212b6474448, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 338: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_181:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 339: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
intveclr_1_182:
	setx 0xc10e93a9fc50eefc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 340: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b69abb6  ! 341: SDIVX_I	sdivx	%r6, 0x0bb6, %r13
	.word 0x93480000  ! 342: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x91d020b4  ! 343: Tcc_I	ta	icc_or_xcc, %r0 + 180
DS_1_184:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f14, %f10, %f16
	.word 0xa5b48305  ! 344: ALIGNADDRESS	alignaddr	%r18, %r5, %r18
debug_1_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 345: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_1_186:
	setx 0xb90743ac08bd3981, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 346: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd51fc000  ! 347: LDDF_R	ldd	[%r31, %r0], %f10
mondo_1_187:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d94800a  ! 348: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
splash_decr_1_188:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa7828014  ! 349: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r20, %-
	.word 0x9ba409e0  ! 350: FDIVq	dis not found

debug_1_189:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 351: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
change_to_randtl_1_190:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_190:
	.word 0x8f902000  ! 352: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd2800a60  ! 353: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r9
splash_hpstate_1_191:
	.word 0x81982155  ! 354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0155, %hpstate
	.word 0xa753c000  ! 355: RDPR_FQ	<illegal instruction>
	.word 0xd4ffc028  ! 356: SWAPA_R	swapa	%r10, [%r31 + %r8] 0x01
intveclr_1_192:
	setx 0xb89957db5712b4a1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 357: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 358: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd4c004a0  ! 359: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x9ba0c9c6  ! 360: FDIVd	fdivd	%f34, %f6, %f44
	.word 0xe6d7e020  ! 361: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r19
splash_hpstate_1_193:
	.word 0x81982414  ! 362: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0414, %hpstate
debug_1_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 363: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa8d44007  ! 364: UMULcc_R	umulcc 	%r17, %r7, %r20
tagged_1_195:
	taddcctv %r11, 0x1799, %r4
	.word 0xd407f436  ! 365: LDUW_I	lduw	[%r31 + 0xfffff436], %r10
memptr_1_196:
	set 0x60140000, %r31
	.word 0x85817a86  ! 366: WRCCR_I	wr	%r5, 0x1a86, %ccr
	.word 0xd46ff33c  ! 367: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff33c]
cwp_1_197:
    set user_data_start, %o7
	.word 0x93902006  ! 368: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 369: LDX_R	ldx	[%r31 + %r0], %r10
splash_cmpr_1_198:
	setx 0xbd77b18ba247faf5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 370: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_1_199:
    set user_data_start, %o7
	.word 0x93902007  ! 371: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd45ff33c  ! 372: LDX_I	ldx	[%r31 + 0xfffff33c], %r10
	.word 0x83d020b2  ! 373: Tcc_I	te	icc_or_xcc, %r0 + 178
tagged_1_200:
	tsubcctv %r8, 0x1aa9, %r11
	.word 0xd407f33c  ! 374: LDUW_I	lduw	[%r31 + 0xfffff33c], %r10
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_201:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 375: CASA_R	casa	[%r31] %asi, %r0, %r10
splash_hpstate_1_202:
	.word 0x81982bcf  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcf, %hpstate
splash_cmpr_1_203:
	setx 0xd3a16fe10a608c0a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 377: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9745c000  ! 379: RD_TICK_CMPR_REG	rd	%-, %r11
debug_1_204:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 380: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_205:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 381: CASA_R	casa	[%r31] %asi, %r0, %r10
	.word 0x87802004  ! 382: WRASI_I	wr	%r0, 0x0004, %asi
mondo_1_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d940012  ! 383: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
	.word 0x95a000d2  ! 384: FNEGd	fnegd	%f18, %f10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 385: LDX_R	ldx	[%r31 + %r0], %r10
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 386: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_1_207:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 387: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0x8d90219a  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x019a, %pstate
	.word 0x90d2fa5a  ! 389: UMULcc_I	umulcc 	%r11, 0xfffffa5a, %r8
tagged_1_208:
	tsubcctv %r12, 0x1fe0, %r25
	.word 0xd207fca8  ! 390: LDUW_I	lduw	[%r31 + 0xfffffca8], %r9
intveclr_1_209:
	setx 0x3047833f5e8b27df, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 391: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_210:
	setx 0xcdb0d0db6062c1b5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_211:
	setx 0x9a78edda54211446, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 393: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd26ffca8  ! 394: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffffca8]
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_212
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_212:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e003  ! 395: CASA_R	casa	[%r31] %asi, %r3, %r9
	.word 0x87802058  ! 396: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x87802004  ! 397: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01968  ! 398: FqTOd	dis not found

	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
change_to_randtl_0_0:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_0:
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 2: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_0_1:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 3: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_0_2:
	.word 0x8198235d  ! 4: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035d, %hpstate
splash_cmpr_0_3:
	setx 0x8ebb706578e3b1ae, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 5: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_4
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_4
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_4:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 6: RDPC	rd	%pc, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a0196b  ! 7: FqTOd	dis not found

memptr_0_6:
	set user_data_start, %r31
	.word 0x8584f306  ! 8: WRCCR_I	wr	%r19, 0x1306, %ccr
mondo_0_7:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d95000d  ! 9: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
	.word 0xd48fe030  ! 10: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
memptr_0_8:
	set 0x60740000, %r31
	.word 0x85812243  ! 11: WRCCR_I	wr	%r4, 0x0243, %ccr
splash_cmpr_0_9:
	setx 0x96da47d7b12c9464, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 12: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_0_10:
	.word 0x81982ec6  ! 13: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec6, %hpstate
splash_hpstate_0_11:
	.word 0x8198265c  ! 14: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065c, %hpstate
	.word 0x83d02035  ! 15: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x99902005  ! 16: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
debug_0_12:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_12:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_12
    nop
debug_wait0_12:
    ld [%r23], %r2
    brnz %r2, debug_wait0_12
    nop
    ba,a debug_startwait0_12
continue_debug_0_12:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_12:
    cmp %r13, %r15
    bne,a wait_for_stat_0_12
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_12:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_12
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00492  ! 17: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0xd42fe243  ! 18: STB_I	stb	%r10, [%r31 + 0x0243]
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_13
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_13:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00d  ! 19: CASA_R	casa	[%r31] %asi, %r13, %r10
	.word 0x8d902269  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x0269, %pstate
DS_0_14:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 21: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xd4d7e010  ! 22: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
	.word 0xd53fe243  ! 23: STDF_I	std	%f10, [0x0243, %r31]
	.word 0xd44fe243  ! 24: LDSB_I	ldsb	[%r31 + 0x0243], %r10
	.word 0xd4d7e020  ! 25: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r10
	.word 0x83d02034  ! 26: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xa1a01a66  ! 27: FqTOi	fqtoi	
	.word 0x8780201c  ! 28: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xe0d7e010  ! 29: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r16
	.word 0xe127e243  ! 30: STF_I	st	%f16, [0x0243, %r31]
	.word 0x93a00162  ! 31: FABSq	dis not found

splash_tba_0_15:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_0_16:
	.word 0x9ba289c0  ! 1: FDIVd	fdivd	%f10, %f0, %f44
	.word 0xd9307d6b  ! 1: STQF_I	-	%f12, [0x1d6b, %r1]
	normalw
	.word 0x95458000  ! 33: RD_SOFTINT_REG	rd	%softint, %r10
debug_0_17:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 34: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_18
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_18
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_18:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 35: RDPC	rd	%pc, %r8
	.word 0xd0900e40  ! 36: LDUHA_R	lduha	[%r0, %r0] 0x72, %r8
cwp_0_19:
    set user_data_start, %o7
	.word 0x93902005  ! 37: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_tba_0_20:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 38: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd06ffd6b  ! 39: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffd6b]
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 40: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x97a309a1  ! 41: FDIVs	fdivs	%f12, %f1, %f11
cwp_0_21:
    set user_data_start, %o7
	.word 0x93902005  ! 42: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d802004  ! 43: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01971  ! 44: FqTOd	dis not found

tagged_0_23:
	taddcctv %r26, 0x1f38, %r19
	.word 0xd407fd6b  ! 45: LDUW_I	lduw	[%r31 + 0xfffffd6b], %r10
	.word 0xd48008a0  ! 46: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_0_24:
	setx 0x3c49a1ea01e19e69, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 47: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_25:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f28, %f8, %f10
	.word 0x95b20308  ! 48: ALIGNADDRESS	alignaddr	%r8, %r8, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r10
splash_cmpr_0_26:
	setx 0xc7a23d43c7b273d7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 51: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_27:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_27:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_27
    nop
debug_wait0_27:
    ld [%r23], %r2
    brnz %r2, debug_wait0_27
    nop
    ba,a debug_startwait0_27
continue_debug_0_27:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_27:
    cmp %r13, %r15
    bne,a wait_for_stat_0_27
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_27:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_27
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00492  ! 52: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
intveclr_0_28:
	setx 0x191f322921af6ded, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 53: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 54: Tcc_R	ta	icc_or_xcc, %r0 + %r30
donret_0_29:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_29-donret_0_29-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_29:
	.word 0xd4fffd6b  ! 55: SWAPA_I	swapa	%r10, [%r31 + 0xfffffd6b] %asi
DS_0_30:
	.word 0xa9a209c2  ! 1: FDIVd	fdivd	%f8, %f2, %f20
	.word 0xbfefc000  ! 56: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9469bd90  ! 57: UDIVX_I	udivx 	%r6, 0xfffffd90, %r10
	.word 0xd48008a0  ! 58: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_tba_0_31:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 59: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_0_32:
	setx 0x7c3412d26b4677c5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 60: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4c7e010  ! 61: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
change_to_randtl_0_33:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_33:
	.word 0x8f902002  ! 62: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd4d804a0  ! 63: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 64: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_0_34:
	.word 0x819825cd  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cd, %hpstate
	.word 0x91d02032  ! 66: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x99a509d2  ! 67: FDIVd	fdivd	%f20, %f18, %f12
donret_0_35:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_35-donret_0_35-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_35:
	.word 0xd8fffd90  ! 68: SWAPA_I	swapa	%r12, [%r31 + 0xfffffd90] %asi
	.word 0xd8bfc020  ! 69: STDA_R	stda	%r12, [%r31 + %r0] 0x01
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 70: LDX_R	ldx	[%r31 + %r0], %r12
change_to_randtl_0_36:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_36:
	.word 0x8f902002  ! 71: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd877c000  ! 72: STX_R	stx	%r12, [%r31 + %r0]
	.word 0xd89fc020  ! 73: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
cwp_0_37:
    set user_data_start, %o7
	.word 0x93902002  ! 74: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_tba_0_38:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 75: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_0_39:
	taddcctv %r25, 0x1e09, %r14
	.word 0xd807fd90  ! 76: LDUW_I	lduw	[%r31 + 0xfffffd90], %r12
mondo_0_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d930007  ! 77: WRPR_WSTATE_R	wrpr	%r12, %r7, %wstate
mondo_0_41:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d910007  ! 78: WRPR_WSTATE_R	wrpr	%r4, %r7, %wstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_42:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e007  ! 79: CASA_R	casa	[%r31] %asi, %r7, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 80: LDX_R	ldx	[%r31 + %r0], %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd857c000  ! 82: LDSH_R	ldsh	[%r31 + %r0], %r12
	.word 0x96d84005  ! 83: SMULcc_R	smulcc 	%r1, %r5, %r11
	.word 0x8d90246a  ! 84: WRPR_PSTATE_I	wrpr	%r0, 0x046a, %pstate
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_43
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_43:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 85: RDPC	rd	%pc, %r18
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 86: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cmp_0_44:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_44:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_44
    nop
cmp_wait0_44:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_44
    nop
    ba,a cmp_startwait0_44
continue_cmp_0_44:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xea, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91950000  ! 87: WRPR_PIL_R	wrpr	%r20, %r0, %pil
splash_cmpr_0_45:
	setx 0xbf029e2e32166dc3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 88: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903934  ! 89: WRPR_PSTATE_I	wrpr	%r0, 0x1934, %pstate
	.word 0x91d02035  ! 90: Tcc_I	ta	icc_or_xcc, %r0 + 53
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 91: LDX_R	ldx	[%r31 + %r0], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_46) + 48, 16, 16)) -> intp(2,0,14)
intvec_0_46:
	.word 0x39400001  ! 92: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0xe2d5ecdaf3bd96d3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_47:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 94: Tcc_I	ta	icc_or_xcc, %r0 + 53
change_to_randtl_0_48:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_48:
	.word 0x8f902001  ! 95: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_0_49:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 96: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x83d02032  ! 97: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_hpstate_0_50:
	.word 0x81982e16  ! 98: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e16, %hpstate
	.word 0x9f80286a  ! 99: SIR	sir	0x086a
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 100: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4800ba0  ! 101: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r18
	.word 0xe4880e60  ! 102: LDUBA_R	lduba	[%r0, %r0] 0x73, %r18
	.word 0x87902148  ! 103: WRPR_TT_I	wrpr	%r0, 0x0148, %tt
splash_cmpr_0_51:
	setx 0xdbfdb6c3c127a6c0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 104: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_52:
	tsubcctv %r5, 0x10dd, %r19
	.word 0xe407e86a  ! 105: LDUW_I	lduw	[%r31 + 0x086a], %r18
splash_cmpr_0_53:
	setx 0x2d52906b2c2494cd, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a00170  ! 107: FABSq	dis not found

	.word 0x8790223b  ! 108: WRPR_TT_I	wrpr	%r0, 0x023b, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56c3e75  ! 109: SDIVX_I	sdivx	%r16, 0xfffffe75, %r18
	.word 0xe4c7e010  ! 110: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916a3f0b  ! 111: SDIVX_I	sdivx	%r8, 0xffffff0b, %r8
splash_lsu_0_56:
	setx 0x7b21052bfcff34a7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 112: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_0_57:
    set user_data_start, %o7
	.word 0x93902002  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x95a00dd0  ! 114: FdMULq	fdmulq	
	.word 0xd517c000  ! 115: LDQF_R	-	[%r31, %r0], %f10
	.word 0xd46fff0b  ! 116: LDSTUB_I	ldstub	%r10, [%r31 + 0xffffff0b]
	.word 0xad852aae  ! 117: WR_SOFTINT_REG_I	wr	%r20, 0x0aae, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_58) + 8, 16, 16)) -> intp(2,0,1)
intvec_0_58:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 119: RDPR_TICK	rdpr	%tick, %r0
cwp_0_59:
    set user_data_start, %o7
	.word 0x93902004  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
cmp_0_60:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_60:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_60
    nop
cmp_wait0_60:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_60
    nop
    ba,a cmp_startwait0_60
continue_cmp_0_60:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xe0, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194000b  ! 121: WRPR_PIL_R	wrpr	%r16, %r11, %pil
	.word 0xd4c80e40  ! 122: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r10
splash_lsu_0_61:
	setx 0x67a3b48da35354a7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 123: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_62:
	setx 0x1fe9461c0a75647c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 124: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_63:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_63:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_63
    nop
debug_wait0_63:
    ld [%r23], %r2
    brnz %r2, debug_wait0_63
    nop
    ba,a debug_startwait0_63
continue_debug_0_63:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_63:
    cmp %r13, %r15
    bne,a wait_for_stat_0_63
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_63:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_63
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00492  ! 125: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 126: LDX_R	ldx	[%r31 + %r0], %r10
tagged_0_64:
	tsubcctv %r25, 0x192d, %r16
	.word 0xd407eaae  ! 127: LDUW_I	lduw	[%r31 + 0x0aae], %r10
	.word 0xd48008a0  ! 128: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
mondo_0_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d900012  ! 129: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
	.word 0x91d02032  ! 130: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd46feaae  ! 131: LDSTUB_I	ldstub	%r10, [%r31 + 0x0aae]
splash_hpstate_0_66:
	.word 0x81982487  ! 132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0487, %hpstate
	.word 0xa7a00572  ! 133: FSQRTq	fsqrt	
	.word 0x8780208a  ! 134: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0x8d802004  ! 135: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81510000  ! 136: RDPR_TICK	rdpr	%tick, %r0
	.word 0xa9500000  ! 137: RDPR_TPC	<illegal instruction>
pmu_0_67:
	nop
	setx 0xfffff4acfffffa26, %g1, %g7
	.word 0xa3800007  ! 138: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_hpstate_0_68:
	.word 0x81982f56  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f56, %hpstate
intveclr_0_69:
	setx 0x973154fd3377a19d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_70
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_70:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 141: RDPC	rd	%pc, %r9
	.word 0xd2800bc0  ! 142: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01966  ! 143: FqTOd	dis not found

splash_lsu_0_72:
	setx 0x77a788db62ff580d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 144: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_0_73:
    set user_data_start, %o7
	.word 0x93902001  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_cmpr_0_74:
	setx 0xda9d2bcf14b5e613, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 146: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_0_75:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_75:
	.word 0x8f902001  ! 147: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_0_76:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d918011  ! 148: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_77
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_77:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 149: CASA_R	casa	[%r31] %asi, %r17, %r13
intveclr_0_78:
	setx 0x7d5e721613dbbdfd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01963  ! 151: FqTOd	dis not found

debug_0_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 152: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956c7810  ! 153: SDIVX_I	sdivx	%r17, 0xfffff810, %r10
	.word 0xd4800b80  ! 154: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r10
	.word 0xa190200e  ! 155: WRPR_GL_I	wrpr	%r0, 0x000e, %-
mondo_0_82:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d904005  ! 156: WRPR_WSTATE_R	wrpr	%r1, %r5, %wstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_83
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_83:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e005  ! 157: CASA_R	casa	[%r31] %asi, %r5, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 158: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4bff810  ! 159: STDA_I	stda	%r10, [%r31 + 0xfffff810] %asi
	.word 0x91d02032  ! 160: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_lsu_0_84:
	setx 0xf3138a71958d90c9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 161: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_85:
	setx 0x96010123812f1011, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xad822c3e  ! 163: WR_SOFTINT_REG_I	wr	%r8, 0x0c3e, %softint
DS_0_86:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f8, %f28, %f10
	.word 0x93b20303  ! 164: ALIGNADDRESS	alignaddr	%r8, %r3, %r9
	.word 0x9f803291  ! 165: SIR	sir	0x1291
	.word 0xd2880e80  ! 166: LDUBA_R	lduba	[%r0, %r0] 0x74, %r9
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_87
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_87:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 167: RDPC	rd	%pc, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd08008a0  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
splash_cmpr_0_88:
	setx 0x3c8ae8106cd72ad2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 170: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_89)+24, 16, 16)) -> intp(0,1,3)
xir_0_89:
	.word 0xa980719d  ! 171: WR_SET_SOFTINT_I	wr	%r1, 0x119d, %set_softint
intveclr_0_90:
	setx 0xfc64f927478f1deb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902000  ! 173: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x87802088  ! 174: WRASI_I	wr	%r0, 0x0088, %asi
memptr_0_91:
	set 0x60340000, %r31
	.word 0x85833e11  ! 175: WRCCR_I	wr	%r12, 0x1e11, %ccr
	.word 0xd0d7e000  ! 176: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 177: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa781c00d  ! 178: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r13, %-
memptr_0_93:
	set user_data_start, %r31
	.word 0x858360a0  ! 179: WRCCR_I	wr	%r13, 0x00a0, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_94) + 56, 16, 16)) -> intp(7,0,29)
intvec_0_94:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200b  ! 181: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8790202e  ! 182: WRPR_TT_I	wrpr	%r0, 0x002e, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 183: LDX_R	ldx	[%r31 + %r0], %r8
splash_tba_0_95:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 184: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_0_96:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_96:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_96
    nop
debug_wait0_96:
    ld [%r23], %r2
    brnz %r2, debug_wait0_96
    nop
    ba,a debug_startwait0_96
continue_debug_0_96:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_96:
    cmp %r13, %r15
    bne,a wait_for_stat_0_96
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_96:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_96
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe0f00492  ! 185: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
tagged_0_97:
	taddcctv %r12, 0x1931, %r12
	.word 0xd007e0a0  ! 186: LDUW_I	lduw	[%r31 + 0x00a0], %r8
splash_cmpr_0_98:
	setx 0x747535831e8cad40, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 187: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_0_99:
	nop
	setx 0xfffff976fffffae8, %g1, %g7
	.word 0xa3800007  ! 188: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_0_100:
    set user_data_start, %o7
	.word 0x93902007  ! 189: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81460000  ! 190: RD_STICK_REG	stbar
change_to_randtl_0_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_101:
	.word 0x8f902000  ! 191: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_0_102:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_102:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_102
    nop
debug_wait0_102:
    ld [%r23], %r2
    brnz %r2, debug_wait0_102
    nop
    ba,a debug_startwait0_102
continue_debug_0_102:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_102:
    cmp %r13, %r15
    bne,a wait_for_stat_0_102
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_102:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_102
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00492  ! 192: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 193: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9824010  ! 194: WR_SET_SOFTINT_R	wr	%r9, %r16, %set_softint
	.word 0x8d9024b6  ! 195: WRPR_PSTATE_I	wrpr	%r0, 0x04b6, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 196: LDX_R	ldx	[%r31 + %r0], %r8
debug_0_103:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 197: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_0_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_104:
	.word 0x8f902001  ! 198: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d903efe  ! 199: WRPR_PSTATE_I	wrpr	%r0, 0x1efe, %pstate
cwp_0_105:
    set user_data_start, %o7
	.word 0x93902001  ! 200: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
pmu_0_106:
	nop
	setx 0xfffff539fffffd6f, %g1, %g7
	.word 0xa3800007  ! 201: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02032  ! 202: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa190200c  ! 203: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93454000  ! 204: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_107:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 205: CASA_R	casa	[%r31] %asi, %r16, %r9
tagged_0_108:
	tsubcctv %r24, 0x15b1, %r21
	.word 0xd207e0a0  ! 206: LDUW_I	lduw	[%r31 + 0x00a0], %r9
	setx 0x531055e5d90778fd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_109:
	.word 0x39400001  ! 207: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd2d804a0  ! 208: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
memptr_0_110:
	set 0x60740000, %r31
	.word 0x858469cb  ! 209: WRCCR_I	wr	%r17, 0x09cb, %ccr
	.word 0xd327e9cb  ! 210: STF_I	st	%f9, [0x09cb, %r31]
debug_0_111:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_111:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_111
    nop
debug_wait0_111:
    ld [%r23], %r2
    brnz %r2, debug_wait0_111
    nop
    ba,a debug_startwait0_111
continue_debug_0_111:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_111:
    cmp %r13, %r15
    bne,a wait_for_stat_0_111
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_111:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_111
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00492  ! 211: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
splash_lsu_0_112:
	setx 0x6fa1b399edae496b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 212: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99a149e6  ! 213: FDIVq	dis not found

memptr_0_113:
	set 0x60740000, %r31
	.word 0x858421b8  ! 214: WRCCR_I	wr	%r16, 0x01b8, %ccr
	.word 0xd8dfe000  ! 215: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r12
memptr_0_114:
	set user_data_start, %r31
	.word 0x8582a000  ! 216: WRCCR_I	wr	%r10, 0x0000, %ccr
splash_lsu_0_115:
	setx 0x9b8f686652b4190f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_116
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_116:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 218: RDPC	rd	%pc, %r17
	.word 0xa7450000  ! 219: RD_SET_SOFTINT	rd	%set_softint, %r19
	.word 0x91a01a71  ! 220: FqTOi	fqtoi	
	.word 0xd137c000  ! 221: STQF_R	-	%f8, [%r0, %r31]
	.word 0x3c700001  ! 222: BPPOS	<illegal instruction>
	.word 0x87902191  ! 223: WRPR_TT_I	wrpr	%r0, 0x0191, %tt
	.word 0x9ba00173  ! 224: FABSq	dis not found

splash_cmpr_0_117:
	setx 0xeb46c526ff22c592, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 225: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_118:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 226: CASA_R	casa	[%r31] %asi, %r19, %r13
intveclr_0_119:
	setx 0x9f3a12aa94146303, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 227: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_120:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x8366db87	! Random illegal ?
	.word 0xe1118012  ! 1: LDQF_R	-	[%r6, %r18], %f16
	.word 0x95a4c823  ! 228: FADDs	fadds	%f19, %f3, %f10
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 229: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 230: Tcc_R	te	icc_or_xcc, %r0 + %r30
change_to_randtl_0_121:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_121:
	.word 0x8f902003  ! 231: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
memptr_0_122:
	set 0x60140000, %r31
	.word 0x858035cf  ! 232: WRCCR_I	wr	%r0, 0x15cf, %ccr
splash_tba_0_123:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 233: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x879022d9  ! 234: WRPR_TT_I	wrpr	%r0, 0x02d9, %tt
splash_cmpr_0_124:
	setx 0x451cc2b764821027, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 235: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4cfe010  ! 236: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r10
debug_0_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 237: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99687da1  ! 238: SDIVX_I	sdivx	%r1, 0xfffffda1, %r12
cmp_0_127:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_127:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_127
    nop
cmp_wait0_127:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_127
    nop
    ba,a cmp_startwait0_127
continue_cmp_0_127:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x86, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91950012  ! 239: WRPR_PIL_R	wrpr	%r20, %r18, %pil
	.word 0xd88fe000  ! 240: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
splash_cmpr_0_128:
	setx 0x46efcda4ead97510, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 241: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8800c40  ! 242: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 243: LDX_R	ldx	[%r31 + %r0], %r12
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 244: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_0_129:
	setx 0xd1c5c13d04489c1c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 245: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_130:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 246: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
DS_0_131:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 247: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93a509c8  ! 248: FDIVd	fdivd	%f20, %f8, %f40
	.word 0xa7a00163  ! 249: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01973  ! 250: FqTOd	dis not found

mondo_0_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d918011  ! 251: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
	.word 0x87802004  ! 252: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd81fc000  ! 253: LDD_R	ldd	[%r31 + %r0], %r12
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 254: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x2e800001  ! 255: BVS	bvs,a	<label_0x1>
debug_0_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 256: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd82ffda1  ! 257: STB_I	stb	%r12, [%r31 + 0xfffffda1]
DS_0_135:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x97a00554  ! 1: FSQRTd	fsqrt	
	.word 0x93a0c820  ! 258: FADDs	fadds	%f3, %f0, %f9
	.word 0xab844014  ! 259: WR_CLEAR_SOFTINT_R	wr	%r17, %r20, %clear_softint
debug_0_136:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 260: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902001  ! 261: WRPR_GL_I	wrpr	%r0, 0x0001, %-
change_to_randtl_0_137:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_137:
	.word 0x8f902001  ! 262: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_138) + 56, 16, 16)) -> intp(4,0,16)
intvec_0_138:
	.word 0x39400001  ! 263: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_139
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_139:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 264: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0x8d90396f  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x196f, %pstate
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_140
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_140
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_140:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 266: RDPC	rd	%pc, %r9
intveclr_0_141:
	setx 0xb67f08adb29ce053, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 267: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 268: WRASI_I	wr	%r0, 0x0080, %asi
change_to_randtl_0_142:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_142:
	.word 0x8f902002  ! 269: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
change_to_randtl_0_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_143:
	.word 0x8f902001  ! 270: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd257c000  ! 271: LDSH_R	ldsh	[%r31 + %r0], %r9
mondo_0_144:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d91c008  ! 272: WRPR_WSTATE_R	wrpr	%r7, %r8, %wstate
	.word 0x9192700e  ! 273: WRPR_PIL_I	wrpr	%r9, 0x100e, %pil
splash_tba_0_145:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 274: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa190200f  ! 275: WRPR_GL_I	wrpr	%r0, 0x000f, %-
memptr_0_146:
	set 0x60740000, %r31
	.word 0x85802c13  ! 276: WRCCR_I	wr	%r0, 0x0c13, %ccr
	.word 0x9ba00170  ! 277: FABSq	dis not found

splash_cmpr_0_147:
	setx 0x82c7cd6b163cc7d8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 278: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_148:
	setx 0x4376115d6855e53c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 279: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_0_149:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_149-donret_0_149-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_149:
	.word 0xdaffec13  ! 280: SWAPA_I	swapa	%r13, [%r31 + 0x0c13] %asi
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_150:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 281: CASA_R	casa	[%r31] %asi, %r16, %r13
intveclr_0_151:
	setx 0xd9188bf22ce8237f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 282: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_152:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 283: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_153:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_153:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_153
    nop
debug_wait0_153:
    ld [%r23], %r2
    brnz %r2, debug_wait0_153
    nop
    ba,a debug_startwait0_153
continue_debug_0_153:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_153:
    cmp %r13, %r15
    bne,a wait_for_stat_0_153
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_153:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_153
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00492  ! 284: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0x9ba289c1  ! 285: FDIVd	fdivd	%f10, %f32, %f44
	.word 0xda8008a0  ! 286: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
donret_0_154:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_154-donret_0_154), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_154:
	.word 0xdaffec13  ! 287: SWAPA_I	swapa	%r13, [%r31 + 0x0c13] %asi
	.word 0x8d9030c3  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x10c3, %pstate
	.word 0xdaffc021  ! 289: SWAPA_R	swapa	%r13, [%r31 + %r1] 0x01
splash_htba_0_155:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 290: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xda4fec13  ! 291: LDSB_I	ldsb	[%r31 + 0x0c13], %r13
debug_0_156:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_156:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_156
    nop
debug_wait0_156:
    ld [%r23], %r2
    brnz %r2, debug_wait0_156
    nop
    ba,a debug_startwait0_156
continue_debug_0_156:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_156:
    cmp %r13, %r15
    bne,a wait_for_stat_0_156
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_156:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_156
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00492  ! 292: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
debug_0_157:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 293: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa945c000  ! 294: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0xe80fec13  ! 295: LDUB_I	ldub	[%r31 + 0x0c13], %r20
	.word 0xe847ec13  ! 296: LDSW_I	ldsw	[%r31 + 0x0c13], %r20
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_158
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_158:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e001  ! 297: CASA_R	casa	[%r31] %asi, %r1, %r20
	.word 0xa190200a  ! 298: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xe83fc000  ! 299: STD_R	std	%r20, [%r31 + %r0]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 300: LDX_R	ldx	[%r31 + %r0], %r20
splash_hpstate_0_159:
	.word 0x81982a36  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a36, %hpstate
	.word 0xe8800b20  ! 302: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r20
cwp_0_160:
    set user_data_start, %o7
	.word 0x93902007  ! 303: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
memptr_0_161:
	set 0x60140000, %r31
	.word 0x8581e72b  ! 304: WRCCR_I	wr	%r7, 0x072b, %ccr
	.word 0xe8dfe020  ! 305: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r20
splash_tba_0_162:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 306: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa7808005  ! 307: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r5, %-
splash_hpstate_0_164:
	.word 0x81982b4d  ! 308: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4d, %hpstate
	setx 0xad322c29f03b87e8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_165:
	.word 0x39400001  ! 309: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_166:
	setx 0x79fc79d2e66f65b6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 310: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_0_167:
	.word 0x81982c4c  ! 311: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4c, %hpstate
	.word 0x83d020b5  ! 312: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xe807c000  ! 313: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0x83d020b5  ! 314: Tcc_I	te	icc_or_xcc, %r0 + 181
debug_0_168:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_168:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_168
    nop
debug_wait0_168:
    ld [%r23], %r2
    brnz %r2, debug_wait0_168
    nop
    ba,a debug_startwait0_168
continue_debug_0_168:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_168:
    cmp %r13, %r15
    bne,a wait_for_stat_0_168
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_168:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_168
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd8f00492  ! 315: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
splash_cmpr_0_169:
	setx 0x37248770bb7dae9a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 316: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91903989  ! 317: WRPR_PIL_I	wrpr	%r0, 0x1989, %pil
splash_cmpr_0_170:
	setx 0x6fb5a07d2f5bfe38, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 318: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_171:
	setx 0x83341546d65e1f0f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_172:
	setx 0xc2d6d7151ba9da9f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 320: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32800001  ! 321: BNE	bne,a	<label_0x1>
splash_lsu_0_173:
	setx 0x9dd2170e7763d7cf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 322: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_0_174:
	set user_data_start, %r31
	.word 0x85816b39  ! 323: WRCCR_I	wr	%r5, 0x0b39, %ccr
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_175
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_175:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 324: RDPC	rd	%pc, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a0196d  ! 325: FqTOd	dis not found

splash_cmpr_0_177:
	setx 0xf77137aa612a0c13, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_178:
	setx 0xcfcbb28351f2dba0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 327: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe827eb39  ! 328: STW_I	stw	%r20, [%r31 + 0x0b39]
	.word 0x91500000  ! 329: RDPR_TPC	<illegal instruction>
	.word 0x91a0016a  ! 330: FABSq	dis not found

	.word 0xa3464000  ! 331: RD_STICK_CMPR_REG	rd	%-, %r17
	.word 0xe23fc000  ! 332: STD_R	std	%r17, [%r31 + %r0]
	.word 0x946a4005  ! 333: UDIVX_R	udivx 	%r9, %r5, %r10
	.word 0x92844012  ! 334: ADDcc_R	addcc 	%r17, %r18, %r9
	.word 0x879022ad  ! 335: WRPR_TT_I	wrpr	%r0, 0x02ad, %tt
	.word 0x93d02034  ! 336: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01973  ! 337: FqTOd	dis not found

splash_cmpr_0_180:
	setx 0x4fe3394f6fd10726, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 338: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_181:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 339: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
intveclr_0_182:
	setx 0x82c60540bf3a03a7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 340: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9969b436  ! 341: SDIVX_I	sdivx	%r6, 0xfffff436, %r12
	.word 0xa9480000  ! 342: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0x83d02033  ! 343: Tcc_I	te	icc_or_xcc, %r0 + 51
DS_0_184:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f12, %f10, %f16
	.word 0x95b40305  ! 344: ALIGNADDRESS	alignaddr	%r16, %r5, %r10
debug_0_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 345: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_0_186:
	setx 0x35505c4be034b21c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 346: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd51fc000  ! 347: LDDF_R	ldd	[%r31, %r0], %f10
mondo_0_187:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d92000b  ! 348: WRPR_WSTATE_R	wrpr	%r8, %r11, %wstate
	.word 0xa7814012  ! 349: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r18, %-
	.word 0x93a509e8  ! 350: FDIVq	dis not found

debug_0_189:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_189:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_189
    nop
debug_wait0_189:
    ld [%r23], %r2
    brnz %r2, debug_wait0_189
    nop
    ba,a debug_startwait0_189
continue_debug_0_189:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_189:
    cmp %r13, %r15
    bne,a wait_for_stat_0_189
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_189:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_189
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00492  ! 351: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
change_to_randtl_0_190:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_190:
	.word 0x8f902000  ! 352: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd2800c60  ! 353: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r9
splash_hpstate_0_191:
	.word 0x81982ad4  ! 354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad4, %hpstate
	.word 0x9553c000  ! 355: RDPR_FQ	<illegal instruction>
	.word 0xd4ffc028  ! 356: SWAPA_R	swapa	%r10, [%r31 + %r8] 0x01
intveclr_0_192:
	setx 0x9b31a1b680085834, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 357: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 358: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd4c004a0  ! 359: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0xa7a509d1  ! 360: FDIVd	fdivd	%f20, %f48, %f50
	.word 0xe6d7e030  ! 361: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r19
splash_hpstate_0_193:
	.word 0x81982f95  ! 362: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f95, %hpstate
debug_0_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 363: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x94d00000  ! 364: UMULcc_R	umulcc 	%r0, %r0, %r10
tagged_0_195:
	taddcctv %r7, 0x1df6, %r10
	.word 0xd407f436  ! 365: LDUW_I	lduw	[%r31 + 0xfffff436], %r10
memptr_0_196:
	set 0x60340000, %r31
	.word 0x8582733c  ! 366: WRCCR_I	wr	%r9, 0x133c, %ccr
	.word 0xd46ff33c  ! 367: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff33c]
cwp_0_197:
    set user_data_start, %o7
	.word 0x93902002  ! 368: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 369: LDX_R	ldx	[%r31 + %r0], %r10
splash_cmpr_0_198:
	setx 0x8046e0a58ef5717d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 370: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_0_199:
    set user_data_start, %o7
	.word 0x93902005  ! 371: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd45ff33c  ! 372: LDX_I	ldx	[%r31 + 0xfffff33c], %r10
	.word 0x91d020b5  ! 373: Tcc_I	ta	icc_or_xcc, %r0 + 181
tagged_0_200:
	tsubcctv %r12, 0x1464, %r13
	.word 0xd407f33c  ! 374: LDUW_I	lduw	[%r31 + 0xfffff33c], %r10
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_201:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 375: CASA_R	casa	[%r31] %asi, %r0, %r10
splash_hpstate_0_202:
	.word 0x819826cf  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06cf, %hpstate
splash_cmpr_0_203:
	setx 0x1a5442318f9264b3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 377: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 378: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9545c000  ! 379: RD_TICK_CMPR_REG	rd	%-, %r10
debug_0_204:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_204:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_204
    nop
debug_wait0_204:
    ld [%r23], %r2
    brnz %r2, debug_wait0_204
    nop
    ba,a debug_startwait0_204
continue_debug_0_204:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_204:
    cmp %r13, %r15
    bne,a wait_for_stat_0_204
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_204:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_204
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd2f00492  ! 380: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_205:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 381: CASA_R	casa	[%r31] %asi, %r0, %r10
	.word 0x87802004  ! 382: WRASI_I	wr	%r0, 0x0004, %asi
mondo_0_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d940005  ! 383: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
	.word 0x95a000c3  ! 384: FNEGd	fnegd	%f34, %f10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 385: LDX_R	ldx	[%r31 + %r0], %r10
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 386: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_0_207:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_207:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_207
    nop
debug_wait0_207:
    ld [%r23], %r2
    brnz %r2, debug_wait0_207
    nop
    ba,a debug_startwait0_207
continue_debug_0_207:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_207:
    cmp %r13, %r15
    bne,a wait_for_stat_0_207
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_207:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_207
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00492  ! 387: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	.word 0x8d9031d8  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x11d8, %pstate
	.word 0x92d27ca8  ! 389: UMULcc_I	umulcc 	%r9, 0xfffffca8, %r9
tagged_0_208:
	tsubcctv %r14, 0x148e, %r24
	.word 0xd207fca8  ! 390: LDUW_I	lduw	[%r31 + 0xfffffca8], %r9
intveclr_0_209:
	setx 0x092105492256bd26, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 391: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_210:
	setx 0x17637e2f3577ccb7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_211:
	setx 0x5f740b0090956f36, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 393: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd26ffca8  ! 394: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffffca8]
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_212
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_212:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e003  ! 395: CASA_R	casa	[%r31] %asi, %r3, %r9
	.word 0x8780208b  ! 396: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x87802020  ! 397: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01974  ! 398: FqTOd	dis not found

cmpenall_0_214:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmpenall_startwait0_214:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_0_214
    nop
cmpenall_wait0_214:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait0_214
    nop
    ba,a cmpenall_startwait0_214
continue_cmpenall_0_214:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_0_214:
    cmp %r13, %r15
    bne,a wait_for_cmpstat_0_214
    ldxa [0x58]%asi, %r15       !Running_status
    mov 0xff, %r14              !All threads running
    stxa %r14, [0x50]%asi 
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_cmpstat2_0_214:
    cmp %r14, %r15
    bne,a wait_for_cmpstat2_0_214
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

	.xword	0x97415c133d19fa90
	.xword	0x0f956c8577366ef6
	.xword	0xdd27f59047c20537
	.xword	0xa4afed2bc60ce098
	.xword	0x76845e759da5f48f
	.xword	0x41222782883f5914
	.xword	0xdb19b4f844086a1c
	.xword	0x94c0d2df2e87870b
	.xword	0x6d609effaa074123
	.xword	0x3c58d9905b59d43d
	.xword	0x2d320c007ed4fb72
	.xword	0x3745a871cf13fbeb
	.xword	0xc3108781830e2b56
	.xword	0xca2a5ecd71f1c730
	.xword	0x21b1ccd1e6d70db8
	.xword	0x0fd6bb2df01e50fd
	.xword	0xb986f5b47704a1dc
	.xword	0x1405c6df51c73d71
	.xword	0x343e8e43d81a21a2
	.xword	0x3fcd158c79ac1d90
	.xword	0xc507bc26e863b6ed
	.xword	0x8c1d7e94604bfc56
	.xword	0x265409275674d23c
	.xword	0x974b820ab7f43009
	.xword	0xf77eed958cfc2cf7
	.xword	0x4b25837c01827870
	.xword	0xebd58cb37f06f48b
	.xword	0x352518baae2f95e8
	.xword	0x37498b3ad133cd72
	.xword	0xd6e9b2e3d763ed71
	.xword	0xc3842007377ab36e
	.xword	0xcf06df3b1a25d65c
	.xword	0x62aa6609831b9116
	.xword	0x2eb558b4f0e8bc84
	.xword	0xb3808d3a0f77024a
	.xword	0x672bbd6094f7830d
	.xword	0x34d7c25980b61f22
	.xword	0xc77ccf8293f83be7
	.xword	0x34b427a1e01d936c
	.xword	0x565b767112c867b5
	.xword	0xec270ffaf6e8950c
	.xword	0x5439841ebb096bc5
	.xword	0xa48277a89441fc60
	.xword	0xcf0dc54d8d4a3c0a
	.xword	0x50fcdcd9e78d0070
	.xword	0x5b5f2564dc5b1be7
	.xword	0xfe4eb5fb3265aa93
	.xword	0x30d7298667e09b15
	.xword	0x23424de1473492dc
	.xword	0xb4d5dfecfefaf5ef
	.xword	0x037aefc9c2ab6496
	.xword	0x7b273581f71b3b74
	.xword	0x71d4bdf0eb6532da
	.xword	0x3000917d0938cbb5
	.xword	0xbb52fefe31b19119
	.xword	0x6e507483df816e77
	.xword	0x88c61ea8590cba65
	.xword	0x05400cb8dbf16927
	.xword	0x00e57fbbb696d17d
	.xword	0x5d02914a613e337a
	.xword	0x9cb03209a5b99556
	.xword	0x9c40d249c334e4fd
	.xword	0x27e31ea14fa02090
	.xword	0x3b3334ea154bc09a
	.xword	0x0b437b6d89c69351
	.xword	0x7faef39266eda815
	.xword	0xdffdfb99b87e76a8
	.xword	0x976a5ca68ef46446
	.xword	0x4aad2dedfbb04d5b
	.xword	0x2b0cdabf48f4bb06
	.xword	0x3b66ff7acc74d14b
	.xword	0x0527f1a968749054
	.xword	0x64b77dd5e46b1515
	.xword	0xa78fe29759f36882
	.xword	0xfb618a9e843c9145
	.xword	0x90ae55a89ba6b355
	.xword	0x4315538760053f63
	.xword	0x191c92a001f3db2e
	.xword	0xd551d8f3303f40e9
	.xword	0xb68e67d2c0f56ab1
	.xword	0xf837e7eb1ea75653
	.xword	0x7a8dd3b0c6629b87
	.xword	0xf6be7321a34cc09d
	.xword	0x2d35c124ab492a89
	.xword	0x894ae95387f39c30
	.xword	0x8e205d52ccca0108
	.xword	0x9b9d405e75af2867
	.xword	0xa19df6edaf339e26
	.xword	0xf08074ba41f8e8a3
	.xword	0x07e4df08e22565e0
	.xword	0x53cb66f910a0da7b
	.xword	0xea0246d569843503
	.xword	0x6a0e6cb3762a9e64
	.xword	0x96fa6c35ad62dc78
	.xword	0x725649689c9b663f
	.xword	0x4d35b7813fdc1cd5
	.xword	0x6da5909b6e398709
	.xword	0x2882324abf3967e3
	.xword	0x4f8796dbea76bd09
	.xword	0xc9c3800512fc9887
	.xword	0x183c7cb55533d0e9
	.xword	0x753ffb0b5cd8abfb
	.xword	0x4ead454b5fb2923f
	.xword	0xd2335387130c7bcf
	.xword	0xf8cbd3cc0b78eebc
	.xword	0xbfa736502b309d25
	.xword	0x152db1917a29ec12
	.xword	0x1c9933d824ab41a1
	.xword	0xb5aade24f75f0802
	.xword	0x5c68192cdaa0abcb
	.xword	0x4f0fb1110fdc8f07
	.xword	0xa682ee955f2bd6ca
	.xword	0x24d314ad896dff2c
	.xword	0x6031204b8c0ea4bd
	.xword	0x6a930069d7d3d884
	.xword	0xe7860693cba0827f
	.xword	0xfd67ec467908b0de
	.xword	0xf125a5bedccc6692
	.xword	0xeddc6bd39cf1abc1
	.xword	0xc0b29113aae0b926
	.xword	0x1c7385a027f06ecc
	.xword	0x723370adf59666f6
	.xword	0xc8d1c3d8d5b05623
	.xword	0xe6ea510983dc8de5
	.xword	0x656736e053672ea7
	.xword	0x5dd80c273d9485ae
	.xword	0x875a0a313d6369c3
	.xword	0xb303f7de48b13bed
	.xword	0x7baa87c191d6d05c
	.xword	0x617f5b600eaafb32
	.xword	0x3fdc7790b4b483b9
	.xword	0x3b98e06b733d5b6e
	.xword	0xc391502799c82c90
	.xword	0xfd06fa7fe881c447
	.xword	0x475274199951599d
	.xword	0xcd07523899310127
	.xword	0x3e9f88e7fe9f7d10
	.xword	0xaedafab834e5ca68
	.xword	0x6f5fa88f06553764
	.xword	0xe16a0a89676f707e
	.xword	0x5d08b9c563758476
	.xword	0xa3ba5ff0e6982ca6
	.xword	0x82c2b635a02fbb65
	.xword	0x2531e73be28571d5
	.xword	0x9b61cb91f59942d4
	.xword	0x2f7ddf621faa4e0a
	.xword	0x62696fd1f35516f4
	.xword	0x87bdde790b767d07
	.xword	0xa0cccb7ce38d0421
	.xword	0xa0d9967975aba5f0
	.xword	0xdf361e08e7d1dbeb
	.xword	0xc0a5cbef83e78b65
	.xword	0xc3dfade55ea4a014
	.xword	0x549327a274a3382e
	.xword	0xcd8728a8c754e5f6
	.xword	0x013bf8bbfd7a2771
	.xword	0xe4eb3696d6b0a723
	.xword	0x489a8185c0cb841e
	.xword	0xad159205ce7f5c7e
	.xword	0x2f549e35f2948046
	.xword	0xca169305149972ac
	.xword	0xa47b6ac89554c1af
	.xword	0x4714f117fcbc874d
	.xword	0x58ac3066ac25d8dd
	.xword	0x62b44351705be72e
	.xword	0x8a954dc58694d3f4
	.xword	0xfe8b700fc919b5e8
	.xword	0xabd840a1fc01ab20
	.xword	0x2653b9b3f085de85
	.xword	0x4e06a0fb0cf539db
	.xword	0x37753395454594f1
	.xword	0x115f2e7c76c13244
	.xword	0x584d458ebeb7ee8d
	.xword	0xe432926ee85fce50
	.xword	0x8a12f63031b67d83
	.xword	0x85f2347f616ebf0c
	.xword	0x2abd89b7b92e731b
	.xword	0x2f7ee1a81f4ebe56
	.xword	0x06f8ca193a55c2a5
	.xword	0xb964391b605b6d84
	.xword	0x41c57f2b9a16b8c6
	.xword	0xafdc9f330e84b1fb
	.xword	0xd7b046d6517480f3
	.xword	0x20808500c4974ab3
	.xword	0xe818412cf6cc8ce7
	.xword	0xbb3859fb74d91ea2
	.xword	0x8221fe1b1ff61414
	.xword	0xbb9f7b066f8481db
	.xword	0x14931f5d52329f5f
	.xword	0x96c19a455cea194b
	.xword	0x435be092f45fe7a9
	.xword	0x230a90254b56acd3
	.xword	0x4bc10e4d9c8788b2
	.xword	0xaca715f174945d20
	.xword	0x9d1a3230a05bc6c7
	.xword	0x6b7158cf559a8c56
	.xword	0x14287f2dfb8bd7cd
	.xword	0x15a8c69f6fbfe0a4
	.xword	0x08ef5122cab4ec81
	.xword	0x44cbd278379b0b23
	.xword	0x9e084b688dbebf76
	.xword	0x472762929ff8476b
	.xword	0x7a9567cd9814bdc6
	.xword	0x7965f135953958e1
	.xword	0x692b80a6ad93ce5f
	.xword	0xed752a7d176a3793
	.xword	0xe08ff4b2405bc5d4
	.xword	0x6a253dcf31866931
	.xword	0xba8cbdb84ea6f484
	.xword	0x223bb46a1c0a0f17
	.xword	0x61a87d33ade4ee4b
	.xword	0xd298849b1aebe866
	.xword	0x8e14972231229112
	.xword	0x717b7605d85f27c3
	.xword	0x31e0293322bd7e8f
	.xword	0x4f1a88df4ce01b41
	.xword	0x0f9a7e8a5a620229
	.xword	0x58bec20e2c067a2d
	.xword	0x178d4038626dc6d5
	.xword	0x7ee53551e86069b3
	.xword	0xc5d939321fec48f4
	.xword	0x00546ba7765b1a90
	.xword	0x54367c6b24001bda
	.xword	0xb8c2789e1e4931b3
	.xword	0x5d8f1092a06049a8
	.xword	0x6b0eefe78970bcc5
	.xword	0xd5377f88e0b0f550
	.xword	0x81214cfcb8e00dc4
	.xword	0x22abf69a5e6b188e
	.xword	0xb1fcef9a854b9058
	.xword	0x23b8b4d26b73dcd7
	.xword	0x4b749cec489a0815
	.xword	0x04718d37ba0af306
	.xword	0x95d96e78c6cc5e32
	.xword	0x55d9af0145fa3334
	.xword	0xf63abad0b68becea
	.xword	0xc6fb75d3707230a7
	.xword	0x9555d5d8a8f84fca
	.xword	0xaeccdc13ab5cbed0
	.xword	0x1dfb23f70b4b1558
	.xword	0x1cb0e6b7db46ea82
	.xword	0x2b413106d75edc88
	.xword	0x5ff70450cfc6f8bc
	.xword	0xc05b66425f067d56
	.xword	0xb903751aa41e2577
	.xword	0x3e7a750e9f00919d
	.xword	0x39fd1dbfaafbc116
	.xword	0xf9b8dd2668c8140b
	.xword	0x854f2ff7811fa08a
	.xword	0x20228f8c48d6d4ae
	.xword	0xf097c88d78231618
	.xword	0x502ab422e8adcdc3
	.xword	0x47001ab5fb98f650
	.xword	0xfbfe7dd991ce6bf6
	.xword	0x373e7a943036de5e
	.xword	0x085362ba25620842

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
    rdpr %tnpc, %r4
    and %r4, %r3, %r4
    or %r2, %r4, %r4
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
    rdhpr %htstate, %l2
    and %l2, 0x4, %l2    ! If previously in hpriv mode, go to hpriv 
    brnz,a %l2, wdog_2_goto_handler_1
    rdhpr %htba, %l2
    srlx %l1, 7, %l2     ! Send priv sw traps to priv mode ..
    cmp %l2, 0x2         ! 0x2 = priv sw trap, 0x3=hpriv sw trap ..
    be,a wdog_2_goto_handler_1
    rdpr %tba, %l2
    rdhpr %htba, %l2
wdog_2_goto_handler_1:
    sllx %l1, 5, %l1
    add %l1, %l2, %l2
    jmp %l2
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
	TTE_CP	 = 0,
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
	TTE_E	 = 1,
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
	TTE_IE	 = 1,
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


attr_data {
	Name	 = .MyDATA_0,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_0,
	hypervisor
}

.data
	.xword	0x053e1a2d34b53113
	.xword	0xe6875b8a5c577bb8
	.xword	0xb3a0c35c2342269e
	.xword	0xda91b01fd7ffeb32
	.xword	0xfdc189ceb3404d76
	.xword	0x7f6192d3c9d3d110
	.xword	0x540f0f112476d232
	.xword	0x938534d07ec30ab3
	.xword	0x31d55550b78b26a9
	.xword	0xef495f5880107eb3
	.xword	0x26ea58a0ddcfd8ea
	.xword	0xc6b77297c107fd5a
	.xword	0xc7ca96b7a5258246
	.xword	0xceabb0072b3858b2
	.xword	0xc8793289516bb288
	.xword	0x1b236a5c27195740
	.xword	0x72fa222c6d56147a
	.xword	0x66e8b0c1f74c3288
	.xword	0x23e64e3b13942923
	.xword	0x8846f2dca44f1fac
	.xword	0x130709f6b7262aab
	.xword	0xb3f4c22c9404b142
	.xword	0xbe8f91afb2d95409
	.xword	0x5ec4302d8e53ad23
	.xword	0x8fe847246627e58e
	.xword	0xef688ea487d0ee49
	.xword	0x9b6a64a21e5a138a
	.xword	0xf346decee561af17
	.xword	0xbcf295ea011e424f
	.xword	0x348b0d9146196b1a
	.xword	0x1d37a235881414bf
	.xword	0xbe6f6471608a69f5



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
	Name	 = .MyDATA_1,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_1,
	hypervisor
}

.data
	.xword	0xc2f754f46758a634
	.xword	0xfd9d3529a3f2c67e
	.xword	0xfc29dde7d4c7296a
	.xword	0x2f49c03a6f1ef9e2
	.xword	0x2c49fe86b1f4ec1f
	.xword	0xa97e572180c169a7
	.xword	0x4df586ef6cfa8786
	.xword	0xe977683f2e273afa
	.xword	0x756c2e4ed97495d3
	.xword	0x409d7d5f3e47c27e
	.xword	0xa19cbe73be07d518
	.xword	0x324c609b1ec81f47
	.xword	0x575b69b92584b8a8
	.xword	0x197f279f796bad5d
	.xword	0x88327c8adc3a8fb6
	.xword	0x05c9ff99dfaa499f
	.xword	0x17a0c25cf2027b43
	.xword	0xb541afb0fe08ae50
	.xword	0x578c7b4e718ae7bf
	.xword	0x9750690af31b307c
	.xword	0xeb81ad1b99956099
	.xword	0xa927b7b4f86bd378
	.xword	0xe6b78051ff0fa93f
	.xword	0x0d4bea02f118f4f4
	.xword	0xf8531b7085995156
	.xword	0xc0f2902527b590dd
	.xword	0x763d77715cebb3ac
	.xword	0xd712d329ad687f21
	.xword	0x6e4d3bfb4b91c716
	.xword	0x730d9e98850651ab
	.xword	0x83afd05b6eb683e6
	.xword	0x55b1bf079b4dc025



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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
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
	.xword	0x9de471d2220b8a37
	.xword	0x380a1ccfe68ce650
	.xword	0x0bcf51a2e9abb3af
	.xword	0x28b0dca972990c8b
	.xword	0x80675c1b9bf82279
	.xword	0xf50123279c5fcc24
	.xword	0x6b2010790c194064
	.xword	0x5ed349708f75c8b6
	.xword	0xb8f87eb214ced5b8
	.xword	0x4fb4ce5e038590de
	.xword	0x63b68f91f73efed4
	.xword	0xd60ff5bcef475b42
	.xword	0x0f97d17108a8ba2d
	.xword	0xae2eb180de03c1de
	.xword	0x6244d8d95bd2c6d2
	.xword	0xba0480a83dfaf5cb
	.xword	0xae306d98533598a1
	.xword	0xe3689918410686a3
	.xword	0xf10df6fef5395e96
	.xword	0xcd9d550faec2e3a3
	.xword	0x318f1f55d7094aa0
	.xword	0xeb40a12278229c85
	.xword	0xa6e674ae9698e6b7
	.xword	0x82335f8c37522918
	.xword	0x9265afc02f3c26f5
	.xword	0x31d6ef3425e549b2
	.xword	0xaf8fbff9a7cade68
	.xword	0x537add3314579dd3
	.xword	0x7b3d121a3c2ce6ef
	.xword	0xadbdb08d2d2b0792
	.xword	0xabe7efdac8c440dc
	.xword	0x8f093df6e1b4c9af



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
	TTE_E	 = 1,
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
	.xword	0x4a82e8c0c8e80dda
	.xword	0xeff0625dd95550a1
	.xword	0xfd44673e5ade414a
	.xword	0x980b13a6622e7c0f
	.xword	0x8b895c07b460066a
	.xword	0x56b333f332f913bd
	.xword	0x79da6e357816e7a3
	.xword	0x160718c4ded3b295
	.xword	0xa11411399970b504
	.xword	0xf094a7502e8fed2d
	.xword	0x45bd98f43b8f230c
	.xword	0x35de716d43dfb6ef
	.xword	0x43dc54bf5fbb5a49
	.xword	0x4fbf1da41f85c809
	.xword	0x8657534d748036bb
	.xword	0x3b6ee8ef16dfa553
	.xword	0x17ed0f724289cebf
	.xword	0x12e41f979e01ea32
	.xword	0xc9bba24e5d229ce0
	.xword	0xa63fdfbddc65282a
	.xword	0x5d6e843e1793431d
	.xword	0xc5b61f60959decf7
	.xword	0x58e0eaa609d3806f
	.xword	0x17ab6e3580995b33
	.xword	0x02103fe2c7ffb418
	.xword	0xc15ca6aee44f0051
	.xword	0x7f199967e733ab92
	.xword	0x87d702c17be493f1
	.xword	0x2fa4ee5fee505e75
	.xword	0xd50a5531c18f1203
	.xword	0x73c825a73263fd7d
	.xword	0x0447e228fe6c5528



#if 0
#endif

