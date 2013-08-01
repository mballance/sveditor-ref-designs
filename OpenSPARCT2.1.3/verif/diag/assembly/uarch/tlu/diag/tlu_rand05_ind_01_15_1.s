/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_01_15_1.s
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
	mov 0x33, %r14
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
	mov 0xb0, %r14
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
splash_decr_7_0:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r11, [%r1] 0x45
tagged_7_1:
	taddcctv %r23, 0x14f9, %r8
	.word 0xd007f228  ! 1: LDUW_I	lduw	[%r31 + 0xfffff228], %r8
splash_cmpr_7_2:
	setx 0x44e7b9309e7f846f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 2: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd0ffc028  ! 3: SWAPA_R	swapa	%r8, [%r31 + %r8] 0x01
DS_7_3:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa3a0054b  ! 1: FSQRTd	fsqrt	
	.word 0xa1a34828  ! 4: FADDs	fadds	%f13, %f8, %f16
	.word 0xd68804a0  ! 5: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_4) + 0, 16, 16)) -> intp(2,0,31)
intvec_7_4:
	.word 0x39400001  ! 6: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_7_5:
	setx 0xea3bf34ace0637c9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 7: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd6880e40  ! 8: LDUBA_R	lduba	[%r0, %r0] 0x72, %r11
intveclr_7_6:
	setx 0x5a8597051f9f5c5d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 9: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_7_7:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f4, %f18, %f20
	.word 0xa3b0830b  ! 10: ALIGNADDRESS	alignaddr	%r2, %r11, %r17
	.word 0xa1902004  ! 11: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01965  ! 12: FqTOd	dis not found

	setx 0xdf7e75d019263139, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_9:
	.word 0x39400001  ! 13: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 14: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 15: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6c804a0  ! 16: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 17: LDX_R	ldx	[%r31 + %r0], %r11
splash_hpstate_7_10:
	.word 0x8198251c  ! 18: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051c, %hpstate
	.word 0xa3480000  ! 19: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
intveclr_7_11:
	setx 0x99ed554c09f02782, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_7_12:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 21: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_7_13:
	setx 0xd1dab1311186c4b3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 22: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3a800001  ! 23: BCC	bcc,a	<label_0x1>
DS_7_14:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f30, %f30, %f26
	.word 0x95b44314  ! 24: ALIGNADDRESS	alignaddr	%r17, %r20, %r10
	.word 0x87802010  ! 25: WRASI_I	wr	%r0, 0x0010, %asi
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_15:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 26: CASA_R	casa	[%r31] %asi, %r3, %r11
splash_cmpr_7_16:
	setx 0x2b9e3a6c97e3e2b8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 27: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 28: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	setx 0x2c59a885e5c5d125, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_17:
	.word 0x39400001  ! 29: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_7_18:
	set user_data_start, %r31
	.word 0x85802f04  ! 30: WRCCR_I	wr	%r0, 0x0f04, %ccr
DS_7_19:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 31: SAVE_R	save	%r31, %r0, %r31
mondo_7_20:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d904012  ! 32: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
	.word 0xab81a6dd  ! 33: WR_CLEAR_SOFTINT_I	wr	%r6, 0x06dd, %clear_softint
	.word 0xd6800c60  ! 34: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r11
DS_7_21:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x95a089c7  ! 1: FDIVd	fdivd	%f2, %f38, %f10
	.word 0x9ba00543  ! 1: FSQRTd	fsqrt	
	.word 0x91a1c834  ! 35: FADDs	fadds	%f7, %f20, %f8
splash_cmpr_7_22:
	setx 0x6510ce736e4fa360, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 36: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_23:
	setx 0xf7fba97670d367ff, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 37: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_7_24:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 38: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xab844012  ! 39: WR_CLEAR_SOFTINT_R	wr	%r17, %r18, %clear_softint
	.word 0x95a509d3  ! 40: FDIVd	fdivd	%f20, %f50, %f10
	.word 0xa1902005  ! 41: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6d3f84  ! 42: SDIVX_I	sdivx	%r20, 0xffffff84, %r13
	.word 0x8d90368a  ! 43: WRPR_PSTATE_I	wrpr	%r0, 0x168a, %pstate
intveclr_7_26:
	setx 0x0c0a48ee4dbd126c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 44: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_27:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e000  ! 45: CASA_R	casa	[%r31] %asi, %r0, %r12
	.word 0xd93ffa99  ! 46: STDF_I	std	%f12, [0x1a99, %r31]
splash_tba_7_28:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 47: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_7_29:
	setx 0x46eacabad7a2e06f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 48: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_30
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_30:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 49: RDPC	rd	%pc, %r10
	.word 0x87802004  ! 50: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9f8028ae  ! 51: SIR	sir	0x08ae
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6c2dcd  ! 52: SDIVX_I	sdivx	%r16, 0x0dcd, %r13
debug_7_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 53: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa368b7c7  ! 54: SDIVX_I	sdivx	%r2, 0xfffff7c7, %r17
	rd %pc, %r19
	add %r19, (ivw_7_34-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_34:
	.word 0x91908001  ! 55: WRPR_PIL_R	wrpr	%r2, %r1, %pil
mondo_7_35:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d91c013  ! 56: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_36) + 40, 16, 16)) -> intp(5,0,7)
intvec_7_36:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_7_37:
	.word 0x819821dd  ! 58: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01dd, %hpstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_38:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 59: CASA_R	casa	[%r31] %asi, %r17, %r12
intveclr_7_39:
	setx 0x3097f486654e8974, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 60: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9a6a4003  ! 61: UDIVX_R	udivx 	%r9, %r3, %r13
	.word 0x91d02034  ! 62: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xab827027  ! 63: WR_CLEAR_SOFTINT_I	wr	%r9, 0x1027, %clear_softint
mondo_7_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d910003  ! 64: WRPR_WSTATE_R	wrpr	%r4, %r3, %wstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_41:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 65: CASA_R	casa	[%r31] %asi, %r11, %r9
debug_7_42:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 66: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0xa984c010  ! 67: WR_SET_SOFTINT_R	wr	%r19, %r16, %set_softint
	.word 0x8790230b  ! 68: WRPR_TT_I	wrpr	%r0, 0x030b, %tt
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
	.word 0x95414000  ! 69: RDPC	rd	%pc, %r10
	.word 0xe06ff27b  ! 70: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffff27b]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 71: LDX_R	ldx	[%r31 + %r0], %r16
debug_7_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 72: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_7_45:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 73: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0xe08fe010  ! 74: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r16
	.word 0x91520000  ! 75: RDPR_PIL	rdpr	%pil, %r8
tagged_7_46:
	tsubcctv %r22, 0x1145, %r9
	.word 0xe407f27b  ! 76: LDUW_I	lduw	[%r31 + 0xfffff27b], %r18
intveclr_7_47:
	setx 0xd8f30e17a792a8c2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 78: Tcc_I	ta	icc_or_xcc, %r0 + 52
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_48
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_48:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 79: RDPC	rd	%pc, %r13
	.word 0xe31ff27b  ! 80: LDDF_I	ldd	[%r31, 0x127b], %f17
	.word 0xe2800bc0  ! 81: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r17
	.word 0xe28fe010  ! 82: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r17
	.word 0xe28008a0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x91d02034  ! 84: Tcc_I	ta	icc_or_xcc, %r0 + 52
pmu_7_49:
	nop
	setx 0xfffff5f0fffff51b, %g1, %g7
	.word 0xa3800007  ! 85: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe2c804a0  ! 86: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_50
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_50
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_50:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 87: RDPC	rd	%pc, %r12
	rd %pc, %r19
	add %r19, (ivw_7_51-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_51:
	.word 0x91930013  ! 88: WRPR_PIL_R	wrpr	%r12, %r19, %pil
	.word 0x87802088  ! 89: WRASI_I	wr	%r0, 0x0088, %asi
DS_7_52:
	.word 0x99a209d1  ! 1: FDIVd	fdivd	%f8, %f48, %f12
	pdist %f6, %f20, %f28
	.word 0xa9b30306  ! 90: ALIGNADDRESS	alignaddr	%r12, %r6, %r20
change_to_randtl_7_53:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_53:
	.word 0x8f902000  ! 91: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_7_54:
	tsubcctv %r12, 0x1eaf, %r12
	.word 0xd407f27b  ! 92: LDUW_I	lduw	[%r31 + 0xfffff27b], %r10
	setx 0xa4b53f851b2247b6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_55:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_7_56:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d930008  ! 94: WRPR_WSTATE_R	wrpr	%r12, %r8, %wstate
	.word 0xa1902004  ! 95: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_hpstate_7_57:
	.word 0x81982117  ! 96: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0117, %hpstate
	.word 0x8d90237d  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x037d, %pstate
	.word 0x8780208a  ! 98: WRASI_I	wr	%r0, 0x008a, %asi
splash_lsu_7_58:
	setx 0x41e294ac103b85f3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 99: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_7_59:
	nop
	setx 0xfffffe73fffff9b6, %g1, %g7
	.word 0xa3800007  ! 100: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd497e000  ! 101: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_60:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 102: CASA_R	casa	[%r31] %asi, %r2, %r10
	.word 0xa7822314  ! 103: WR_GRAPHICS_STATUS_REG_I	wr	%r8, 0x0314, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 104: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 105: LDX_R	ldx	[%r31 + %r0], %r10
memptr_7_61:
	set 0x60140000, %r31
	.word 0x8581f793  ! 106: WRCCR_I	wr	%r7, 0x1793, %ccr
	.word 0x87902242  ! 107: WRPR_TT_I	wrpr	%r0, 0x0242, %tt
change_to_randtl_7_62:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_62:
	.word 0x8f902001  ! 108: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	setx 0xed04bc12a12e652a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_63:
	.word 0x39400001  ! 109: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879022ce  ! 110: WRPR_TT_I	wrpr	%r0, 0x02ce, %tt
debug_7_64:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 111: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x97a00174  ! 112: FABSq	dis not found

debug_7_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 113: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_66
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_66:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 114: RDPC	rd	%pc, %r8
splash_lsu_7_67:
	setx 0x4f1d7494c10527fb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 115: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_7_68:
	setx 0xaa2bbe867fa2c28d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 116: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879022cf  ! 117: WRPR_TT_I	wrpr	%r0, 0x02cf, %tt
	.word 0x81460000  ! 118: RD_STICK_REG	stbar
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 119: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_7_69:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d918003  ! 120: WRPR_WSTATE_R	wrpr	%r6, %r3, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_70) + 48, 16, 16)) -> intp(4,0,21)
intvec_7_70:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_7_71:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 122: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
intveclr_7_72:
	setx 0xa60b5882b220a733, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 123: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd0d7e000  ! 124: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	setx 0x67d71c2e53c90595, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_73:
	.word 0x39400001  ! 125: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_74)+16, 16, 16)) -> intp(7,1,3)
xir_7_74:
	.word 0xa980e995  ! 126: WR_SET_SOFTINT_I	wr	%r3, 0x0995, %set_softint
	.word 0xd0d804a0  ! 127: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_75)+32, 16, 16)) -> intp(7,1,3)
xir_7_75:
	.word 0xa9816512  ! 128: WR_SET_SOFTINT_I	wr	%r5, 0x0512, %set_softint
splash_lsu_7_76:
	setx 0x2c2563673a252769, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 129: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 130: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_lsu_7_77:
	setx 0x2b397835780155e7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 131: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_7_78:
	set user_data_start, %r31
	.word 0x8580f2ac  ! 132: WRCCR_I	wr	%r3, 0x12ac, %ccr
change_to_randtl_7_79:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_79:
	.word 0x8f902000  ! 133: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x87902020  ! 134: WRPR_TT_I	wrpr	%r0, 0x0020, %tt
	.word 0x8d802000  ! 135: WRFPRS_I	wr	%r0, 0x0000, %fprs
	rd %pc, %r19
	add %r19, (ivw_7_80-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_80:
	.word 0x91918013  ! 136: WRPR_PIL_R	wrpr	%r6, %r19, %pil
cwp_7_81:
    set user_data_start, %o7
	.word 0x93902000  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d9025da  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x05da, %pstate
	.word 0xa5454000  ! 139: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0xe6d80e60  ! 140: LDXA_R	ldxa	[%r0, %r0] 0x73, %r19
	.word 0xa4aac006  ! 141: ANDNcc_R	andncc 	%r11, %r6, %r18
debug_7_82:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 142: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200b  ! 143: WRPR_GL_I	wrpr	%r0, 0x000b, %-
memptr_7_83:
	set 0x60740000, %r31
	.word 0x85827edc  ! 144: WRCCR_I	wr	%r9, 0x1edc, %ccr
	.word 0xa6f9facd  ! 145: SDIVcc_I	sdivcc 	%r7, 0xfffffacd, %r19
	.word 0xa1520000  ! 146: RDPR_PIL	rdpr	%pil, %r16
DS_7_84:
	.word 0x97a349d0  ! 1: FDIVd	fdivd	%f44, %f16, %f42
	.word 0xe530c007  ! 1: STQF_R	-	%f18, [%r7, %r3]
	normalw
	.word 0xa3458000  ! 147: RD_SOFTINT_REG	rd	%softint, %r17
splash_cmpr_7_85:
	setx 0xde2efc4432c8566d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 148: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_7_86:
	setx 0xbf703a6120eb7ae5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 149: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd89fe4db  ! 150: LDDA_I	ldda	[%r31, + 0x04db] %asi, %r12
debug_7_87:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 151: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b68f5fd  ! 152: SDIVX_I	sdivx	%r3, 0xfffff5fd, %r13
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_89:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 153: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x3a800001  ! 154: BCC	bcc,a	<label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 155: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97500000  ! 156: RDPR_TPC	rdpr	%tpc, %r11
intveclr_7_90:
	setx 0x672daeb3fada0b67, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 157: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6800ac0  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r11
memptr_7_91:
	set 0x60540000, %r31
	.word 0x8580b8bf  ! 159: WRCCR_I	wr	%r2, 0x18bf, %ccr
	rd %pc, %r19
	add %r19, (ivw_7_92-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_92:
	.word 0x91934001  ! 160: WRPR_PIL_R	wrpr	%r13, %r1, %pil
	.word 0x87802014  ! 161: WRASI_I	wr	%r0, 0x0014, %asi
debug_7_93:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 162: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	.word 0x91d020b5  ! 163: Tcc_I	ta	icc_or_xcc, %r0 + 181
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 164: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200e  ! 165: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xab80b2b0  ! 166: WR_CLEAR_SOFTINT_I	wr	%r2, 0x12b0, %clear_softint
	.word 0xd61fc000  ! 167: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x8d802004  ! 168: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_cmpr_7_94:
	setx 0x3d9b127b16aa86f7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 169: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_7_95:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_95-donret_7_95-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_95:
	.word 0xd6ffe189  ! 170: SWAPA_I	swapa	%r11, [%r31 + 0x0189] %asi
DS_7_96:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc15b54df	! Random illegal ?
	.word 0x99a409d1  ! 1: FDIVd	fdivd	%f16, %f48, %f12
	.word 0x97a08827  ! 171: FADDs	fadds	%f2, %f7, %f11
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 172: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 173: BNE	bne,a	<label_0x1>
	.word 0x879020de  ! 174: WRPR_TT_I	wrpr	%r0, 0x00de, %tt
	.word 0x87902395  ! 175: WRPR_TT_I	wrpr	%r0, 0x0395, %tt
DS_7_97:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd5324007  ! 1: STQF_R	-	%f10, [%r7, %r9]
	normalw
	.word 0x95458000  ! 176: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xd68008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
debug_7_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 178: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x99500000  ! 179: RDPR_TPC	rdpr	%tpc, %r12
intveclr_7_99:
	setx 0xa8fbb52472bc9174, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9a846093  ! 181: ADDcc_I	addcc 	%r17, 0x0093, %r13
pmu_7_100:
	nop
	setx 0xfffff513fffff428, %g1, %g7
	.word 0xa3800007  ! 182: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_7_101:
	setx 0xa31f49405637cb24, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xdb37e256  ! 184: STQF_I	-	%f13, [0x0256, %r31]
	.word 0xa1902003  ! 185: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_cmpr_7_102:
	setx 0xf82f6d9edf684789, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 186: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76b2c49  ! 187: SDIVX_I	sdivx	%r12, 0x0c49, %r19
change_to_randtl_7_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_104:
	.word 0x8f902001  ! 188: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	setx 0x7657e43fc46612ba, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_105:
	.word 0x39400001  ! 189: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xdbe7e00d  ! 190: CASA_R	casa	[%r31] %asi, %r13, %r13
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_107
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_107:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 191: RDPC	rd	%pc, %r8
	.word 0x99902002  ! 192: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_108
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_108:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 193: RDPC	rd	%pc, %r12
	.word 0x91d020b2  ! 194: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xa5500000  ! 195: RDPR_TPC	rdpr	%tpc, %r18
splash_decr_7_109:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r18, [%r1] 0x45
	.word 0xa7824014  ! 196: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r20, %-
	.word 0xa1a509e1  ! 197: FDIVq	dis not found

splash_htba_7_110:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 198: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d903265  ! 199: WRPR_PSTATE_I	wrpr	%r0, 0x1265, %pstate
DS_7_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x95b18307  ! 200: ALIGNADDRESS	alignaddr	%r6, %r7, %r10
	.word 0xe737f018  ! 201: STQF_I	-	%f19, [0x1018, %r31]
memptr_7_112:
	set 0x60340000, %r31
	.word 0x8581eebc  ! 202: WRCCR_I	wr	%r7, 0x0ebc, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 203: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x99464000  ! 204: RD_STICK_CMPR_REG	rd	%-, %r12
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_113
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_113:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 205: RDPC	rd	%pc, %r20
	.word 0xd6800c40  ! 206: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r11
	rd %pc, %r19
	add %r19, (ivw_7_114-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_114:
	.word 0x9191c007  ! 207: WRPR_PIL_R	wrpr	%r7, %r7, %pil
debug_7_115:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 208: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d802000  ! 209: WRFPRS_I	wr	%r0, 0x0000, %fprs
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
	.word 0x93414000  ! 210: RDPC	rd	%pc, %r9
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_117
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_117
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_117:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 211: RDPC	rd	%pc, %r10
tagged_7_118:
	tsubcctv %r26, 0x1415, %r1
	.word 0xe807f954  ! 212: LDUW_I	lduw	[%r31 + 0xfffff954], %r20
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_119
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_119
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_119:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 213: RDPC	rd	%pc, %r8
	.word 0x87802004  ! 214: WRASI_I	wr	%r0, 0x0004, %asi
mondo_7_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d924011  ! 215: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
	.word 0x9b464000  ! 216: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0x91d02035  ! 217: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_hpstate_7_121:
	.word 0x8198274e  ! 218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x074e, %hpstate
splash_hpstate_7_122:
	.word 0x81982f86  ! 219: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f86, %hpstate
DS_7_123:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe734f553  ! 1: STQF_I	-	%f19, [0x1553, %r19]
	normalw
	.word 0x93458000  ! 220: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x87802016  ! 221: WRASI_I	wr	%r0, 0x0016, %asi
change_to_randtl_7_124:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_124:
	.word 0x8f902002  ! 222: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_7_125:
	setx 0x17a166ec94aa977e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9824010  ! 224: WR_SET_SOFTINT_R	wr	%r9, %r16, %set_softint
cwp_7_126:
    set user_data_start, %o7
	.word 0x93902000  ! 225: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
memptr_7_127:
	set 0x60340000, %r31
	.word 0x85837bb2  ! 226: WRCCR_I	wr	%r13, 0x1bb2, %ccr
	.word 0x93d02035  ! 227: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x36800001  ! 228: BGE	bge,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_128) + 32, 16, 16)) -> intp(4,0,12)
intvec_7_128:
	.word 0x39400001  ! 229: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_7_129:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa3a109d2  ! 1: FDIVd	fdivd	%f4, %f18, %f48
	normalw
	.word 0xa9458000  ! 230: RD_SOFTINT_REG	rd	%softint, %r20
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
	.word 0xd1e7e00d  ! 231: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0xd08008a0  ! 232: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd04fc000  ! 233: LDSB_R	ldsb	[%r31 + %r0], %r8
	.word 0xab8436c1  ! 234: WR_CLEAR_SOFTINT_I	wr	%r16, 0x16c1, %clear_softint
	.word 0x81460000  ! 235: RD_STICK_REG	stbar
	.word 0xd0d004a0  ! 236: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 237: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x99902005  ! 238: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x8d90362f  ! 239: WRPR_PSTATE_I	wrpr	%r0, 0x162f, %pstate
	.word 0x95540000  ! 240: RDPR_GL	rdpr	%-, %r10
splash_lsu_7_132:
	setx 0x8444029eaf82fe85, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 241: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903d3c  ! 242: WRPR_PSTATE_I	wrpr	%r0, 0x1d3c, %pstate
	.word 0xd08fe000  ! 243: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r8
	.word 0xd04ff3f2  ! 244: LDSB_I	ldsb	[%r31 + 0xfffff3f2], %r8
mondo_7_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d90c010  ! 245: WRPR_WSTATE_R	wrpr	%r3, %r16, %wstate
	.word 0x8d802000  ! 246: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_7_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 247: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_7_135:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 248: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0x2e700001  ! 249: BPVS	<illegal instruction>
	.word 0x95a00164  ! 250: FABSq	dis not found

splash_tba_7_136:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 251: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x93d020b5  ! 252: Tcc_I	tne	icc_or_xcc, %r0 + 181
splash_cmpr_7_137:
	setx 0x5f3e2032ca287e5c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_138:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 254: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0xda7ff3f2  ! 255: SWAP_I	swap	%r13, [%r31 + 0xfffff3f2]
tagged_7_139:
	taddcctv %r18, 0x11fb, %r3
	.word 0xda07f3f2  ! 256: LDUW_I	lduw	[%r31 + 0xfffff3f2], %r13
	.word 0x3a800001  ! 257: BCC	bcc,a	<label_0x1>
tagged_7_140:
	tsubcctv %r16, 0x1ebf, %r11
	.word 0xda07f3f2  ! 258: LDUW_I	lduw	[%r31 + 0xfffff3f2], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 259: LDX_R	ldx	[%r31 + %r0], %r13
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_141
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_141:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 260: CASA_R	casa	[%r31] %asi, %r8, %r13
	.word 0xda3ff3f2  ! 261: STD_I	std	%r13, [%r31 + 0xfffff3f2]
	.word 0xdac004a0  ! 262: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0x91d02033  ! 263: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_7_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d914006  ! 264: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
	.word 0xdabff3f2  ! 265: STDA_I	stda	%r13, [%r31 + 0xfffff3f2] %asi
	.word 0xda8804a0  ! 266: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
mondo_7_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d94c002  ! 267: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
	.word 0xda3ff3f2  ! 268: STD_I	std	%r13, [%r31 + 0xfffff3f2]
	.word 0xa984c007  ! 269: WR_SET_SOFTINT_R	wr	%r19, %r7, %set_softint
	.word 0x8d903bf7  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x1bf7, %pstate
	.word 0x8d903263  ! 271: WRPR_PSTATE_I	wrpr	%r0, 0x1263, %pstate
	.word 0x20700001  ! 272: BPN	<illegal instruction>
	.word 0xda9004a0  ! 273: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
debug_7_144:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 274: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_145)+40, 16, 16)) -> intp(7,1,3)
xir_7_145:
	.word 0xa984fcdf  ! 275: WR_SET_SOFTINT_I	wr	%r19, 0x1cdf, %set_softint
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_146
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_146:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00b  ! 276: CASA_R	casa	[%r31] %asi, %r11, %r13
	.word 0x83d02035  ! 277: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xa1902002  ! 278: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xda37ef7c  ! 279: STH_I	sth	%r13, [%r31 + 0x0f7c]
	.word 0xda77c000  ! 280: STX_R	stx	%r13, [%r31 + %r0]
pmu_7_147:
	nop
	setx 0xfffffcdbfffff189, %g1, %g7
	.word 0xa3800007  ! 281: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02034  ! 282: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x3e800001  ! 283: BVC	bvc,a	<label_0x1>
	.word 0x2c700001  ! 284: BPNEG	<illegal instruction>
	.word 0xdadfe020  ! 285: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r13
	.word 0x8d902d54  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x0d54, %pstate
splash_tba_7_148:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 287: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_7_149:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 288: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 289: LDX_R	ldx	[%r31 + %r0], %r13
debug_7_150:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 290: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	.word 0xda8804a0  ! 291: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x8d902b06  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x0b06, %pstate
	.word 0x83d02034  ! 293: Tcc_I	te	icc_or_xcc, %r0 + 52
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 294: LDX_R	ldx	[%r31 + %r0], %r13
tagged_7_151:
	taddcctv %r5, 0x16ad, %r22
	.word 0xda07ef7c  ! 295: LDUW_I	lduw	[%r31 + 0x0f7c], %r13
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 296: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xdb3fc000  ! 297: STDF_R	std	%f13, [%r0, %r31]
	.word 0xdac7e030  ! 298: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r13
DS_7_152:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x99a189cd  ! 1: FDIVd	fdivd	%f6, %f44, %f12
	normalw
	.word 0xa9458000  ! 299: RD_SOFTINT_REG	rd	%softint, %r20
splash_decr_7_153:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r11, [%r1] 0x45
	.word 0xa785000b  ! 300: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r11, %-
mondo_7_154:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d92400b  ! 301: WRPR_WSTATE_R	wrpr	%r9, %r11, %wstate
	.word 0xd8d7e000  ! 302: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_155
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_155:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 303: RDPC	rd	%pc, %r8
	.word 0x87802089  ! 304: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81510000  ! 305: RDPR_TICK	rdpr	%tick, %r0
	.word 0xa1902001  ! 306: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 307: Tcc_R	te	icc_or_xcc, %r0 + %r30
change_to_randtl_7_156:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_156:
	.word 0x8f902001  ! 308: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
memptr_7_157:
	set 0x60340000, %r31
	.word 0x8583653b  ! 309: WRCCR_I	wr	%r13, 0x053b, %ccr
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 310: Tcc_R	tne	icc_or_xcc, %r0 + %r30
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
	.word 0xd1e7e010  ! 311: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916af482  ! 312: SDIVX_I	sdivx	%r11, 0xfffff482, %r8
splash_lsu_7_160:
	setx 0xdc0a0cc2309e94d3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 313: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802973  ! 314: SIR	sir	0x0973
cwp_7_161:
    set user_data_start, %o7
	.word 0x93902002  ! 315: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd897e010  ! 316: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
debug_7_162:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 317: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 318: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_hpstate_7_163:
	.word 0x81982297  ! 319: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0297, %hpstate
splash_cmpr_7_164:
	setx 0x5cc21b6d4f32e483, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 320: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8c00e80  ! 321: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r12
tagged_7_165:
	taddcctv %r17, 0x1f1b, %r21
	.word 0xd807ee27  ! 322: LDUW_I	lduw	[%r31 + 0x0e27], %r12
debug_7_166:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 323: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd897e000  ! 324: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
splash_cmpr_7_167:
	setx 0xebe0f4d8a1e394fa, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 325: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_168:
	setx 0x1ef27a6f4f2f3681, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f8026a3  ! 327: SIR	sir	0x06a3
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_169
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_169:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 328: CASA_R	casa	[%r31] %asi, %r16, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_170) + 40, 16, 16)) -> intp(7,0,25)
intvec_7_170:
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_7_171:
	.word 0x8198255f  ! 330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055f, %hpstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_172
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_172:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 331: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x8780208a  ! 332: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0x87802089  ! 333: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xa1a00174  ! 334: FABSq	dis not found

debug_7_173:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 335: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x3e700001  ! 336: BPVC	<illegal instruction>
	.word 0xa190200a  ! 337: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8d90351b  ! 338: WRPR_PSTATE_I	wrpr	%r0, 0x151b, %pstate
debug_7_174:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 339: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
DS_7_175:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 340: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_7_176-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_176:
	.word 0x91900001  ! 341: WRPR_PIL_R	wrpr	%r0, %r1, %pil
	.word 0xd28fe000  ! 342: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r9
splash_hpstate_7_177:
	.word 0x819829a6  ! 343: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09a6, %hpstate
	.word 0x879023ca  ! 344: WRPR_TT_I	wrpr	%r0, 0x03ca, %tt
DS_7_178:
	.word 0xa5a109c4  ! 1: FDIVd	fdivd	%f4, %f4, %f18
	pdist %f12, %f28, %f14
	.word 0xa3b28314  ! 345: ALIGNADDRESS	alignaddr	%r10, %r20, %r17
cwp_7_179:
    set user_data_start, %o7
	.word 0x93902003  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_180) + 0, 16, 16)) -> intp(3,0,21)
intvec_7_180:
	.word 0x39400001  ! 347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_7_181:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 348: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02033  ! 349: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01962  ! 350: FqTOd	dis not found

	.word 0xd2d804a0  ! 351: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
splash_lsu_7_183:
	setx 0x14c58f6583add045, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 352: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd2c004a0  ! 353: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 354: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 355: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_cmpr_7_184:
	setx 0x73eb3a8884c1c708, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 356: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_7_185:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_185:
	.word 0x8f902001  ! 357: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cwp_7_186:
    set user_data_start, %o7
	.word 0x93902006  ! 358: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_7_187:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 359: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802055  ! 360: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x91d02033  ! 361: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd297e010  ! 362: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r9
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_188
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_188
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_188:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 363: RDPC	rd	%pc, %r8
DS_7_189:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd3330002  ! 1: STQF_R	-	%f9, [%r2, %r12]
	normalw
	.word 0x93458000  ! 364: RD_SOFTINT_REG	rd	%softint, %r9
memptr_7_190:
	set 0x60740000, %r31
	.word 0x85843073  ! 365: WRCCR_I	wr	%r16, 0x1073, %ccr
	.word 0x2c800001  ! 366: BNEG	bneg,a	<label_0x1>
	.word 0xa984800a  ! 367: WR_SET_SOFTINT_R	wr	%r18, %r10, %set_softint
	.word 0xa9a009ca  ! 368: FDIVd	fdivd	%f0, %f10, %f20
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_191
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_191:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 369: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x87802014  ! 370: WRASI_I	wr	%r0, 0x0014, %asi
tagged_7_192:
	tsubcctv %r11, 0x17f5, %r4
	.word 0xe407e3c5  ! 371: LDUW_I	lduw	[%r31 + 0x03c5], %r18
	.word 0xe5e7c033  ! 372: CASA_I	casa	[%r31] 0x 1, %r19, %r18
splash_cmpr_7_193:
	setx 0x428052a44e54ec25, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 373: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_7_194:
	tsubcctv %r9, 0x1ed1, %r25
	.word 0xe407e3c5  ! 374: LDUW_I	lduw	[%r31 + 0x03c5], %r18
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_195
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_195
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_195:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 375: RDPC	rd	%pc, %r13
DS_7_196:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xb552658a	! Random illegal ?
	.word 0x95a1c9d4  ! 1: FDIVd	fdivd	%f38, %f20, %f10
	.word 0x97a1882b  ! 376: FADDs	fadds	%f6, %f11, %f11
	.word 0x8d902e77  ! 377: WRPR_PSTATE_I	wrpr	%r0, 0x0e77, %pstate
mondo_7_197:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d924006  ! 378: WRPR_WSTATE_R	wrpr	%r9, %r6, %wstate
	.word 0xab81aced  ! 379: WR_CLEAR_SOFTINT_I	wr	%r6, 0x0ced, %clear_softint
	.word 0x879022d6  ! 380: WRPR_TT_I	wrpr	%r0, 0x02d6, %tt
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_198:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 381: RDPC	rd	%pc, %r20
	.word 0x28800001  ! 382: BLEU	bleu,a	<label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956ab1ff  ! 383: SDIVX_I	sdivx	%r10, 0xfffff1ff, %r10
	.word 0x87902018  ! 384: WRPR_TT_I	wrpr	%r0, 0x0018, %tt
donret_7_200:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_200-donret_7_200), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_200:
	.word 0xe8fff393  ! 385: SWAPA_I	swapa	%r20, [%r31 + 0xfffff393] %asi
debug_7_201:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 386: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 387: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_7_202:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 388: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe937f393  ! 389: STQF_I	-	%f20, [0x1393, %r31]
	.word 0x87802010  ! 390: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xe8800c40  ! 391: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r20
tagged_7_203:
	taddcctv %r18, 0x1a8f, %r7
	.word 0xe807f393  ! 392: LDUW_I	lduw	[%r31 + 0xfffff393], %r20
debug_7_204:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 393: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
memptr_7_205:
	set 0x60340000, %r31
	.word 0x8582bd75  ! 394: WRCCR_I	wr	%r10, 0x1d75, %ccr
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 395: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xab82ba12  ! 396: WR_CLEAR_SOFTINT_I	wr	%r10, 0x1a12, %clear_softint
	.word 0xe8cfe020  ! 397: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r20
	.word 0xe8d004a0  ! 398: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
	.word 0x9f803b18  ! 399: SIR	sir	0x1b18
tagged_7_206:
	tsubcctv %r2, 0x1d26, %r22
	.word 0xe807f1a5  ! 400: LDUW_I	lduw	[%r31 + 0xfffff1a5], %r20
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
splash_decr_6_0:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
tagged_6_1:
	taddcctv %r8, 0x1714, %r19
	.word 0xd007f228  ! 1: LDUW_I	lduw	[%r31 + 0xfffff228], %r8
splash_cmpr_6_2:
	setx 0x5226ce2fe47970d4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 2: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd0ffc028  ! 3: SWAPA_R	swapa	%r8, [%r31 + %r8] 0x01
DS_6_3:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x91a00554  ! 1: FSQRTd	fsqrt	
	.word 0x95a00828  ! 4: FADDs	fadds	%f0, %f8, %f10
	.word 0xd6880e40  ! 5: LDUBA_R	lduba	[%r0, %r0] 0x72, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_4) + 48, 16, 16)) -> intp(6,0,2)
intvec_6_4:
	.word 0x39400001  ! 6: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_6_5:
	setx 0xfae72c3b4060eb29, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 7: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd68804a0  ! 8: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
intveclr_6_6:
	setx 0x211faa34c8d2d84d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 9: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_6_7:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f26, %f2, %f24
	.word 0xa7b40304  ! 10: ALIGNADDRESS	alignaddr	%r16, %r4, %r19
	.word 0xa1902000  ! 11: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01961  ! 12: FqTOd	dis not found

	setx 0xc9ed14dc26c13e6c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_9:
	.word 0x39400001  ! 13: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 14: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 15: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6c804a0  ! 16: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 17: LDX_R	ldx	[%r31 + %r0], %r11
splash_hpstate_6_10:
	.word 0x819829de  ! 18: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09de, %hpstate
	.word 0x97480000  ! 19: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
intveclr_6_11:
	setx 0xdd78b12b15f36296, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_6_12:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 21: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_6_13:
	setx 0x377d5bc79726ca15, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 22: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3a800001  ! 23: BCC	bcc,a	<label_0x1>
DS_6_14:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f16, %f16, %f0
	.word 0x97b04302  ! 24: ALIGNADDRESS	alignaddr	%r1, %r2, %r11
	.word 0x87802058  ! 25: WRASI_I	wr	%r0, 0x0058, %asi
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_15:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 26: CASA_R	casa	[%r31] %asi, %r3, %r11
splash_cmpr_6_16:
	setx 0xaa821a225c608d93, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 27: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 28: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	setx 0xc8d78fcc8b96cc55, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_17:
	.word 0x39400001  ! 29: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_6_18:
	set user_data_start, %r31
	.word 0x85803f4c  ! 30: WRCCR_I	wr	%r0, 0x1f4c, %ccr
DS_6_19:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 31: SAVE_R	save	%r31, %r0, %r31
mondo_6_20:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d934007  ! 32: WRPR_WSTATE_R	wrpr	%r13, %r7, %wstate
	.word 0xab80f760  ! 33: WR_CLEAR_SOFTINT_I	wr	%r3, 0x1760, %clear_softint
	.word 0xd68008a0  ! 34: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_6_21:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x99a149cb  ! 1: FDIVd	fdivd	%f36, %f42, %f12
	.word 0xa9a00544  ! 1: FSQRTd	fsqrt	
	.word 0x97a4882b  ! 35: FADDs	fadds	%f18, %f11, %f11
splash_cmpr_6_22:
	setx 0xe2ccfc42aff23cc5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 36: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_23:
	setx 0x810cba8289928a04, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 37: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_6_24:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 38: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xab810007  ! 39: WR_CLEAR_SOFTINT_R	wr	%r4, %r7, %clear_softint
	.word 0xa3a049d4  ! 40: FDIVd	fdivd	%f32, %f20, %f48
	.word 0xa1902000  ! 41: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96d3726  ! 42: SDIVX_I	sdivx	%r20, 0xfffff726, %r20
	.word 0x8d903328  ! 43: WRPR_PSTATE_I	wrpr	%r0, 0x1328, %pstate
intveclr_6_26:
	setx 0xbd361de2931cadbf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 44: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_27:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e000  ! 45: CASA_R	casa	[%r31] %asi, %r0, %r12
	.word 0xd93ffa99  ! 46: STDF_I	std	%f12, [0x1a99, %r31]
splash_tba_6_28:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 47: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_6_29:
	setx 0x6721da845c4c868a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 48: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_30
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_30:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 49: RDPC	rd	%pc, %r16
	.word 0x8780208b  ! 50: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x9f802273  ! 51: SIR	sir	0x0273
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36d20e1  ! 52: SDIVX_I	sdivx	%r20, 0x00e1, %r17
debug_6_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 53: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16cbb98  ! 54: SDIVX_I	sdivx	%r18, 0xfffffb98, %r16
	rd %pc, %r19
	add %r19, (ivw_6_34-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_34:
	.word 0x91924014  ! 55: WRPR_PIL_R	wrpr	%r9, %r20, %pil
mondo_6_35:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d90c00d  ! 56: WRPR_WSTATE_R	wrpr	%r3, %r13, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_36) + 24, 16, 16)) -> intp(7,0,30)
intvec_6_36:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_6_37:
	.word 0x81982c07  ! 58: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c07, %hpstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_38:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 59: CASA_R	casa	[%r31] %asi, %r17, %r12
intveclr_6_39:
	setx 0x8edf0ab629872359, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 60: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x92690009  ! 61: UDIVX_R	udivx 	%r4, %r9, %r9
	.word 0x91d02034  ! 62: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xab80ff32  ! 63: WR_CLEAR_SOFTINT_I	wr	%r3, 0x1f32, %clear_softint
mondo_6_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d924009  ! 64: WRPR_WSTATE_R	wrpr	%r9, %r9, %wstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_41:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 65: CASA_R	casa	[%r31] %asi, %r11, %r9
debug_6_42:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 66: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0xa9800006  ! 67: WR_SET_SOFTINT_R	wr	%r0, %r6, %set_softint
	.word 0x879020dd  ! 68: WRPR_TT_I	wrpr	%r0, 0x00dd, %tt
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
	.word 0x91414000  ! 69: RDPC	rd	%pc, %r8
	.word 0xe06ff27b  ! 70: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffff27b]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 71: LDX_R	ldx	[%r31 + %r0], %r16
debug_6_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 72: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_6_45:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 73: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xe08fe010  ! 74: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r16
	.word 0xa9520000  ! 75: RDPR_PIL	rdpr	%pil, %r20
tagged_6_46:
	tsubcctv %r25, 0x12b8, %r25
	.word 0xe407f27b  ! 76: LDUW_I	lduw	[%r31 + 0xfffff27b], %r18
intveclr_6_47:
	setx 0xc6955b21436c3ff8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 78: Tcc_I	ta	icc_or_xcc, %r0 + 51
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_48
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_48:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 79: RDPC	rd	%pc, %r20
	.word 0xe31ff27b  ! 80: LDDF_I	ldd	[%r31, 0x127b], %f17
	.word 0xe28008a0  ! 81: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe28fe000  ! 82: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r17
	.word 0xe28008a0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x91d02033  ! 84: Tcc_I	ta	icc_or_xcc, %r0 + 51
pmu_6_49:
	nop
	setx 0xfffff5a9fffffe4d, %g1, %g7
	.word 0xa3800007  ! 85: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe2c804a0  ! 86: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_50
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_50
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_50:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 87: RDPC	rd	%pc, %r20
	rd %pc, %r19
	add %r19, (ivw_6_51-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_51:
	.word 0x9192c013  ! 88: WRPR_PIL_R	wrpr	%r11, %r19, %pil
	.word 0x87802055  ! 89: WRASI_I	wr	%r0, 0x0055, %asi
DS_6_52:
	.word 0x93a489d3  ! 1: FDIVd	fdivd	%f18, %f50, %f40
	pdist %f14, %f2, %f14
	.word 0xa7b14302  ! 90: ALIGNADDRESS	alignaddr	%r5, %r2, %r19
change_to_randtl_6_53:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_53:
	.word 0x8f902001  ! 91: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_6_54:
	tsubcctv %r4, 0x1d31, %r10
	.word 0xd407f27b  ! 92: LDUW_I	lduw	[%r31 + 0xfffff27b], %r10
	setx 0x1cbfb740e1e1dc90, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_55:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_6_56:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d944005  ! 94: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
	.word 0xa1902008  ! 95: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_hpstate_6_57:
	.word 0x81982766  ! 96: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0766, %hpstate
	.word 0x8d90342e  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x142e, %pstate
	.word 0x8780201c  ! 98: WRASI_I	wr	%r0, 0x001c, %asi
splash_lsu_6_58:
	setx 0x2a3b8266abc8db9f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 99: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_6_59:
	nop
	setx 0xfffff206fffff73e, %g1, %g7
	.word 0xa3800007  ! 100: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd497e010  ! 101: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r10
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_60:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 102: CASA_R	casa	[%r31] %asi, %r2, %r10
	.word 0xa782e537  ! 103: WR_GRAPHICS_STATUS_REG_I	wr	%r11, 0x0537, %-
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 104: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 105: LDX_R	ldx	[%r31 + %r0], %r10
memptr_6_61:
	set 0x60340000, %r31
	.word 0x85807861  ! 106: WRCCR_I	wr	%r1, 0x1861, %ccr
	.word 0x87902163  ! 107: WRPR_TT_I	wrpr	%r0, 0x0163, %tt
change_to_randtl_6_62:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_62:
	.word 0x8f902001  ! 108: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	setx 0x455e84e99c0acbee, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_63:
	.word 0x39400001  ! 109: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879022eb  ! 110: WRPR_TT_I	wrpr	%r0, 0x02eb, %tt
debug_6_64:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 111: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93a00167  ! 112: FABSq	dis not found

debug_6_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 113: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_66
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_66:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 114: RDPC	rd	%pc, %r9
splash_lsu_6_67:
	setx 0xfddd758546e84521, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 115: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_6_68:
	setx 0x54ac764a6821ea6f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 116: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879022c3  ! 117: WRPR_TT_I	wrpr	%r0, 0x02c3, %tt
	.word 0x81460000  ! 118: RD_STICK_REG	stbar
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 119: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_6_69:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d950004  ! 120: WRPR_WSTATE_R	wrpr	%r20, %r4, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_70) + 40, 16, 16)) -> intp(3,0,16)
intvec_6_70:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_6_71:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 122: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
intveclr_6_72:
	setx 0x7a791592fb27fb57, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 123: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd0d7e030  ! 124: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	setx 0xf72b481361150c05, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_73:
	.word 0x39400001  ! 125: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_74)+16, 16, 16)) -> intp(6,1,3)
xir_6_74:
	.word 0xa984e228  ! 126: WR_SET_SOFTINT_I	wr	%r19, 0x0228, %set_softint
	.word 0xd0d804a0  ! 127: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_75)+8, 16, 16)) -> intp(6,1,3)
xir_6_75:
	.word 0xa9802de7  ! 128: WR_SET_SOFTINT_I	wr	%r0, 0x0de7, %set_softint
splash_lsu_6_76:
	setx 0x0487c7cd7240bf1d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 129: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 130: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_lsu_6_77:
	setx 0x0dbcad044ce8677b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 131: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_6_78:
	set user_data_start, %r31
	.word 0x8582e056  ! 132: WRCCR_I	wr	%r11, 0x0056, %ccr
change_to_randtl_6_79:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_79:
	.word 0x8f902002  ! 133: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x87902391  ! 134: WRPR_TT_I	wrpr	%r0, 0x0391, %tt
	.word 0x8d802000  ! 135: WRFPRS_I	wr	%r0, 0x0000, %fprs
	rd %pc, %r19
	add %r19, (ivw_6_80-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_80:
	.word 0x9192c012  ! 136: WRPR_PIL_R	wrpr	%r11, %r18, %pil
cwp_6_81:
    set user_data_start, %o7
	.word 0x93902000  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d9020b3  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x00b3, %pstate
	.word 0x9b454000  ! 139: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	.word 0xe6d804a0  ! 140: LDXA_R	ldxa	[%r0, %r0] 0x25, %r19
	.word 0x94acc009  ! 141: ANDNcc_R	andncc 	%r19, %r9, %r10
debug_6_82:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 142: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902004  ! 143: WRPR_GL_I	wrpr	%r0, 0x0004, %-
memptr_6_83:
	set 0x60740000, %r31
	.word 0x85843e94  ! 144: WRCCR_I	wr	%r16, 0x1e94, %ccr
	.word 0x96f9b47d  ! 145: SDIVcc_I	sdivcc 	%r6, 0xfffff47d, %r11
	.word 0xa3520000  ! 146: RDPR_PIL	rdpr	%pil, %r17
DS_6_84:
	.word 0x97a349c6  ! 1: FDIVd	fdivd	%f44, %f6, %f42
	.word 0xe933000a  ! 1: STQF_R	-	%f20, [%r10, %r12]
	normalw
	.word 0xa5458000  ! 147: RD_SOFTINT_REG	rd	%softint, %r18
splash_cmpr_6_85:
	setx 0xc894ac33b8257af7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 148: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_6_86:
	setx 0xb54a740f4d23debf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 149: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd89fe4db  ! 150: LDDA_I	ldda	[%r31, + 0x04db] %asi, %r12
debug_6_87:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 151: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa368339a  ! 152: SDIVX_I	sdivx	%r0, 0xfffff39a, %r17
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_89:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 153: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x3a800001  ! 154: BCC	bcc,a	<label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 155: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa5500000  ! 156: RDPR_TPC	rdpr	%tpc, %r18
intveclr_6_90:
	setx 0xa3a4b350090dc97f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 157: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6800b80  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r11
memptr_6_91:
	set 0x60740000, %r31
	.word 0x85847d10  ! 159: WRCCR_I	wr	%r17, 0x1d10, %ccr
	rd %pc, %r19
	add %r19, (ivw_6_92-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_92:
	.word 0x91940013  ! 160: WRPR_PIL_R	wrpr	%r16, %r19, %pil
	.word 0x87802010  ! 161: WRASI_I	wr	%r0, 0x0010, %asi
debug_6_93:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 162: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0x91d020b5  ! 163: Tcc_I	ta	icc_or_xcc, %r0 + 181
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 164: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa190200e  ! 165: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xab816aa8  ! 166: WR_CLEAR_SOFTINT_I	wr	%r5, 0x0aa8, %clear_softint
	.word 0xd61fc000  ! 167: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x8d802000  ! 168: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_6_94:
	setx 0x073ece13f1364fa1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 169: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_6_95:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_95-donret_6_95-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_95:
	.word 0xd6ffe189  ! 170: SWAPA_I	swapa	%r11, [%r31 + 0x0189] %asi
DS_6_96:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd15d0423	! Random illegal ?
	.word 0x93a409d4  ! 1: FDIVd	fdivd	%f16, %f20, %f40
	.word 0x93a08825  ! 171: FADDs	fadds	%f2, %f5, %f9
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 172: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 173: BNE	bne,a	<label_0x1>
	.word 0x879023cb  ! 174: WRPR_TT_I	wrpr	%r0, 0x03cb, %tt
	.word 0x87902193  ! 175: WRPR_TT_I	wrpr	%r0, 0x0193, %tt
DS_6_97:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe931c013  ! 1: STQF_R	-	%f20, [%r19, %r7]
	normalw
	.word 0x9b458000  ! 176: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xd68008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
debug_6_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 178: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9b500000  ! 179: RDPR_TPC	rdpr	%tpc, %r13
intveclr_6_99:
	setx 0x71b273ad63cdfdd5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa88371f2  ! 181: ADDcc_I	addcc 	%r13, 0xfffff1f2, %r20
pmu_6_100:
	nop
	setx 0xffffff57fffffaf5, %g1, %g7
	.word 0xa3800007  ! 182: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_6_101:
	setx 0xc493b0b61b9b5b57, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xdb37e256  ! 184: STQF_I	-	%f13, [0x0256, %r31]
	.word 0xa190200a  ! 185: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_cmpr_6_102:
	setx 0xae3b72464a95ecda, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 186: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa369eab9  ! 187: SDIVX_I	sdivx	%r7, 0x0ab9, %r17
change_to_randtl_6_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_104:
	.word 0x8f902002  ! 188: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	setx 0x4a5d6a5fc9db6294, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_105:
	.word 0x39400001  ! 189: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xdbe7e00d  ! 190: CASA_R	casa	[%r31] %asi, %r13, %r13
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_107
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_107:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 191: RDPC	rd	%pc, %r10
	.word 0x99902001  ! 192: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_108
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_108:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 193: RDPC	rd	%pc, %r13
	.word 0x91d020b3  ! 194: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x91500000  ! 195: RDPR_TPC	<illegal instruction>
splash_decr_6_109:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa7834010  ! 196: WR_GRAPHICS_STATUS_REG_R	wr	%r13, %r16, %-
	.word 0x93a289e4  ! 197: FDIVq	dis not found

splash_htba_6_110:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 198: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d903b4e  ! 199: WRPR_PSTATE_I	wrpr	%r0, 0x1b4e, %pstate
DS_6_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x97b0c311  ! 200: ALIGNADDRESS	alignaddr	%r3, %r17, %r11
	.word 0xe737f018  ! 201: STQF_I	-	%f19, [0x1018, %r31]
memptr_6_112:
	set 0x60540000, %r31
	.word 0x8582f3dd  ! 202: WRCCR_I	wr	%r11, 0x13dd, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 203: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xa5464000  ! 204: RD_STICK_CMPR_REG	rd	%-, %r18
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_113
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_113:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 205: RDPC	rd	%pc, %r11
	.word 0xd68008a0  ! 206: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	rd %pc, %r19
	add %r19, (ivw_6_114-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_114:
	.word 0x91914012  ! 207: WRPR_PIL_R	wrpr	%r5, %r18, %pil
debug_6_115:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 208: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d802000  ! 209: WRFPRS_I	wr	%r0, 0x0000, %fprs
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
	.word 0xa1414000  ! 210: RDPC	rd	%pc, %r16
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_117
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_117
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_117:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 211: RDPC	rd	%pc, %r19
tagged_6_118:
	tsubcctv %r3, 0x1dff, %r3
	.word 0xe807f954  ! 212: LDUW_I	lduw	[%r31 + 0xfffff954], %r20
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_119
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_119
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_119:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 213: RDPC	rd	%pc, %r13
	.word 0x8780204f  ! 214: WRASI_I	wr	%r0, 0x004f, %asi
mondo_6_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d900013  ! 215: WRPR_WSTATE_R	wrpr	%r0, %r19, %wstate
	.word 0xa7464000  ! 216: RD_STICK_CMPR_REG	rd	%-, %r19
	.word 0x91d02033  ! 217: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_hpstate_6_121:
	.word 0x8198290c  ! 218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090c, %hpstate
splash_hpstate_6_122:
	.word 0x819828dd  ! 219: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08dd, %hpstate
DS_6_123:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd332be61  ! 1: STQF_I	-	%f9, [0x1e61, %r10]
	normalw
	.word 0x99458000  ! 220: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x87802014  ! 221: WRASI_I	wr	%r0, 0x0014, %asi
change_to_randtl_6_124:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_124:
	.word 0x8f902001  ! 222: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_6_125:
	setx 0x4bb234a654c3db50, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9850012  ! 224: WR_SET_SOFTINT_R	wr	%r20, %r18, %set_softint
cwp_6_126:
    set user_data_start, %o7
	.word 0x93902000  ! 225: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
memptr_6_127:
	set 0x60340000, %r31
	.word 0x8582e4f5  ! 226: WRCCR_I	wr	%r11, 0x04f5, %ccr
	.word 0x91d02033  ! 227: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x36800001  ! 228: BGE	bge,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_128) + 40, 16, 16)) -> intp(2,0,15)
intvec_6_128:
	.word 0x39400001  ! 229: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_6_129:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x93a109d3  ! 1: FDIVd	fdivd	%f4, %f50, %f40
	normalw
	.word 0xa5458000  ! 230: RD_SOFTINT_REG	rd	%softint, %r18
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
	.word 0xd1e7e00d  ! 231: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0xd08008a0  ! 232: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd04fc000  ! 233: LDSB_R	ldsb	[%r31 + %r0], %r8
	.word 0xab83702f  ! 234: WR_CLEAR_SOFTINT_I	wr	%r13, 0x102f, %clear_softint
	.word 0x81460000  ! 235: RD_STICK_REG	stbar
	.word 0xd0d00e60  ! 236: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r8
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 237: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x99902005  ! 238: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x8d90270f  ! 239: WRPR_PSTATE_I	wrpr	%r0, 0x070f, %pstate
	.word 0x93540000  ! 240: RDPR_GL	rdpr	%-, %r9
splash_lsu_6_132:
	setx 0x8a7f9ad09f61183f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 241: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903d1b  ! 242: WRPR_PSTATE_I	wrpr	%r0, 0x1d1b, %pstate
	.word 0xd08fe020  ! 243: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r8
	.word 0xd04ff3f2  ! 244: LDSB_I	ldsb	[%r31 + 0xfffff3f2], %r8
mondo_6_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d908008  ! 245: WRPR_WSTATE_R	wrpr	%r2, %r8, %wstate
	.word 0x8d802000  ! 246: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_6_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 247: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_6_135:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 248: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0x2e700001  ! 249: BPVS	<illegal instruction>
	.word 0xa9a00170  ! 250: FABSq	dis not found

splash_tba_6_136:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 251: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d020b2  ! 252: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_cmpr_6_137:
	setx 0x240ae094839c09cc, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_138:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 254: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xda7ff3f2  ! 255: SWAP_I	swap	%r13, [%r31 + 0xfffff3f2]
tagged_6_139:
	taddcctv %r12, 0x1cf4, %r17
	.word 0xda07f3f2  ! 256: LDUW_I	lduw	[%r31 + 0xfffff3f2], %r13
	.word 0x3a800001  ! 257: BCC	bcc,a	<label_0x1>
tagged_6_140:
	tsubcctv %r9, 0x1a3b, %r19
	.word 0xda07f3f2  ! 258: LDUW_I	lduw	[%r31 + 0xfffff3f2], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 259: LDX_R	ldx	[%r31 + %r0], %r13
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_141
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_141:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 260: CASA_R	casa	[%r31] %asi, %r8, %r13
	.word 0xda3ff3f2  ! 261: STD_I	std	%r13, [%r31 + 0xfffff3f2]
	.word 0xdac004a0  ! 262: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0x91d02034  ! 263: Tcc_I	ta	icc_or_xcc, %r0 + 52
mondo_6_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d92400c  ! 264: WRPR_WSTATE_R	wrpr	%r9, %r12, %wstate
	.word 0xdabff3f2  ! 265: STDA_I	stda	%r13, [%r31 + 0xfffff3f2] %asi
	.word 0xda8804a0  ! 266: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
mondo_6_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d908010  ! 267: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
	.word 0xda3ff3f2  ! 268: STD_I	std	%r13, [%r31 + 0xfffff3f2]
	.word 0xa9834004  ! 269: WR_SET_SOFTINT_R	wr	%r13, %r4, %set_softint
	.word 0x8d902243  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x0243, %pstate
	.word 0x8d902bef  ! 271: WRPR_PSTATE_I	wrpr	%r0, 0x0bef, %pstate
	.word 0x20700001  ! 272: BPN	<illegal instruction>
	.word 0xda9004a0  ! 273: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
debug_6_144:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 274: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_145)+48, 16, 16)) -> intp(6,1,3)
xir_6_145:
	.word 0xa984e528  ! 275: WR_SET_SOFTINT_I	wr	%r19, 0x0528, %set_softint
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_146
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_146:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00b  ! 276: CASA_R	casa	[%r31] %asi, %r11, %r13
	.word 0x91d02033  ! 277: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa190200d  ! 278: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xda37ef7c  ! 279: STH_I	sth	%r13, [%r31 + 0x0f7c]
	.word 0xda77c000  ! 280: STX_R	stx	%r13, [%r31 + %r0]
pmu_6_147:
	nop
	setx 0xfffffdeffffffc93, %g1, %g7
	.word 0xa3800007  ! 281: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02032  ! 282: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x3e800001  ! 283: BVC	bvc,a	<label_0x1>
	.word 0x2c700001  ! 284: BPNEG	<illegal instruction>
	.word 0xdadfe000  ! 285: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	.word 0x8d9027fb  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x07fb, %pstate
splash_tba_6_148:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 287: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_6_149:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 288: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 289: LDX_R	ldx	[%r31 + %r0], %r13
debug_6_150:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 290: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0xda880e60  ! 291: LDUBA_R	lduba	[%r0, %r0] 0x73, %r13
	.word 0x8d902a69  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x0a69, %pstate
	.word 0x91d020b3  ! 293: Tcc_I	ta	icc_or_xcc, %r0 + 179
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 294: LDX_R	ldx	[%r31 + %r0], %r13
tagged_6_151:
	taddcctv %r11, 0x15a5, %r26
	.word 0xda07ef7c  ! 295: LDUW_I	lduw	[%r31 + 0x0f7c], %r13
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 296: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xdb3fc000  ! 297: STDF_R	std	%f13, [%r0, %r31]
	.word 0xdac7e010  ! 298: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r13
DS_6_152:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x91a509d0  ! 1: FDIVd	fdivd	%f20, %f16, %f8
	normalw
	.word 0x93458000  ! 299: RD_SOFTINT_REG	rd	%softint, %r9
splash_decr_6_153:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r7, [%r1] 0x45
	.word 0xa7810012  ! 300: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r18, %-
mondo_6_154:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d910012  ! 301: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
	.word 0xd8d7e000  ! 302: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_155
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_155:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 303: RDPC	rd	%pc, %r10
	.word 0x8780208a  ! 304: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0x81510000  ! 305: RDPR_TICK	rdpr	%tick, %r0
	.word 0xa190200f  ! 306: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 307: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_6_156:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_156:
	.word 0x8f902000  ! 308: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
memptr_6_157:
	set 0x60140000, %r31
	.word 0x8580bf18  ! 309: WRCCR_I	wr	%r2, 0x1f18, %ccr
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 310: Tcc_R	ta	icc_or_xcc, %r0 + %r30
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
	.word 0xd1e7e010  ! 311: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6cec0b  ! 312: SDIVX_I	sdivx	%r19, 0x0c0b, %r13
splash_lsu_6_160:
	setx 0x3d0c9e674a502ab9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 313: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f803908  ! 314: SIR	sir	0x1908
cwp_6_161:
    set user_data_start, %o7
	.word 0x93902005  ! 315: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd897e000  ! 316: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
debug_6_162:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 317: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 318: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_hpstate_6_163:
	.word 0x81982e4c  ! 319: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4c, %hpstate
splash_cmpr_6_164:
	setx 0x76c2da68c4c4c9e6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 320: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8c004a0  ! 321: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
tagged_6_165:
	taddcctv %r16, 0x102e, %r26
	.word 0xd807ee27  ! 322: LDUW_I	lduw	[%r31 + 0x0e27], %r12
debug_6_166:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 323: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd897e000  ! 324: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
splash_cmpr_6_167:
	setx 0x40b3fa70ba328d4f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 325: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_168:
	setx 0xf6404edc83a3d105, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802da9  ! 327: SIR	sir	0x0da9
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_169
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_169:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 328: CASA_R	casa	[%r31] %asi, %r16, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_170) + 56, 16, 16)) -> intp(6,0,14)
intvec_6_170:
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_6_171:
	.word 0x81982707  ! 330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0707, %hpstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_172
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_172:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 331: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x87802004  ! 332: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8780204f  ! 333: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xa9a00163  ! 334: FABSq	dis not found

debug_6_173:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 335: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x3e700001  ! 336: BPVC	<illegal instruction>
	.word 0xa1902003  ! 337: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8d902de7  ! 338: WRPR_PSTATE_I	wrpr	%r0, 0x0de7, %pstate
debug_6_174:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 339: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
DS_6_175:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 340: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_6_176-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_176:
	.word 0x91948003  ! 341: WRPR_PIL_R	wrpr	%r18, %r3, %pil
	.word 0xd28fe030  ! 342: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r9
splash_hpstate_6_177:
	.word 0x81982a56  ! 343: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a56, %hpstate
	.word 0x87902216  ! 344: WRPR_TT_I	wrpr	%r0, 0x0216, %tt
DS_6_178:
	.word 0xa1a509cc  ! 1: FDIVd	fdivd	%f20, %f12, %f16
	pdist %f14, %f4, %f28
	.word 0x9bb44307  ! 345: ALIGNADDRESS	alignaddr	%r17, %r7, %r13
cwp_6_179:
    set user_data_start, %o7
	.word 0x93902007  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_180) + 40, 16, 16)) -> intp(6,0,23)
intvec_6_180:
	.word 0x39400001  ! 347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_6_181:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 348: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d020b2  ! 349: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196b  ! 350: FqTOd	dis not found

	.word 0xd2d804a0  ! 351: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
splash_lsu_6_183:
	setx 0x5c067116b419e767, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 352: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd2c004a0  ! 353: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 354: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200c  ! 355: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_cmpr_6_184:
	setx 0xb8484280e7677252, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 356: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_6_185:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_185:
	.word 0x8f902001  ! 357: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cwp_6_186:
    set user_data_start, %o7
	.word 0x93902005  ! 358: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_6_187:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 359: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802089  ! 360: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x93d020b3  ! 361: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0xd297e020  ! 362: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_188
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_188
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_188:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 363: RDPC	rd	%pc, %r12
DS_6_189:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd735000c  ! 1: STQF_R	-	%f11, [%r12, %r20]
	normalw
	.word 0x97458000  ! 364: RD_SOFTINT_REG	rd	%softint, %r11
memptr_6_190:
	set 0x60740000, %r31
	.word 0x8584a6dd  ! 365: WRCCR_I	wr	%r18, 0x06dd, %ccr
	.word 0x2c800001  ! 366: BNEG	bneg,a	<label_0x1>
	.word 0xa984400d  ! 367: WR_SET_SOFTINT_R	wr	%r17, %r13, %set_softint
	.word 0xa3a449cc  ! 368: FDIVd	fdivd	%f48, %f12, %f48
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_191
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_191:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 369: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x87802004  ! 370: WRASI_I	wr	%r0, 0x0004, %asi
tagged_6_192:
	tsubcctv %r11, 0x132f, %r5
	.word 0xe407e3c5  ! 371: LDUW_I	lduw	[%r31 + 0x03c5], %r18
	.word 0xe5e7c033  ! 372: CASA_I	casa	[%r31] 0x 1, %r19, %r18
splash_cmpr_6_193:
	setx 0x921be69939c97c88, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 373: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_6_194:
	tsubcctv %r14, 0x1814, %r11
	.word 0xe407e3c5  ! 374: LDUW_I	lduw	[%r31 + 0x03c5], %r18
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_195
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_195
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_195:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 375: RDPC	rd	%pc, %r19
DS_6_196:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9349de00	! Random illegal ?
	.word 0x93a309c7  ! 1: FDIVd	fdivd	%f12, %f38, %f40
	.word 0x95a20822  ! 376: FADDs	fadds	%f8, %f2, %f10
	.word 0x8d9035ab  ! 377: WRPR_PSTATE_I	wrpr	%r0, 0x15ab, %pstate
mondo_6_197:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d944009  ! 378: WRPR_WSTATE_R	wrpr	%r17, %r9, %wstate
	.word 0xab837009  ! 379: WR_CLEAR_SOFTINT_I	wr	%r13, 0x1009, %clear_softint
	.word 0x87902033  ! 380: WRPR_TT_I	wrpr	%r0, 0x0033, %tt
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_198:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 381: RDPC	rd	%pc, %r9
	.word 0x28800001  ! 382: BLEU	bleu,a	<label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976aa147  ! 383: SDIVX_I	sdivx	%r10, 0x0147, %r11
	.word 0x8790201d  ! 384: WRPR_TT_I	wrpr	%r0, 0x001d, %tt
donret_6_200:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_200-donret_6_200), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_200:
	.word 0xe8fff393  ! 385: SWAPA_I	swapa	%r20, [%r31 + 0xfffff393] %asi
debug_6_201:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 386: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 387: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_6_202:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 388: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe937f393  ! 389: STQF_I	-	%f20, [0x1393, %r31]
	.word 0x87802020  ! 390: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe88008a0  ! 391: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
tagged_6_203:
	taddcctv %r10, 0x1bb4, %r20
	.word 0xe807f393  ! 392: LDUW_I	lduw	[%r31 + 0xfffff393], %r20
debug_6_204:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 393: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
memptr_6_205:
	set 0x60140000, %r31
	.word 0x858077e7  ! 394: WRCCR_I	wr	%r1, 0x17e7, %ccr
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 395: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xab852a10  ! 396: WR_CLEAR_SOFTINT_I	wr	%r20, 0x0a10, %clear_softint
	.word 0xe8cfe030  ! 397: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r20
	.word 0xe8d004a0  ! 398: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
	.word 0x9f803604  ! 399: SIR	sir	0x1604
tagged_6_206:
	tsubcctv %r4, 0x1ffa, %r25
	.word 0xe807f1a5  ! 400: LDUW_I	lduw	[%r31 + 0xfffff1a5], %r20
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
splash_decr_5_0:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
tagged_5_1:
	taddcctv %r19, 0x10e2, %r14
	.word 0xd007f228  ! 1: LDUW_I	lduw	[%r31 + 0xfffff228], %r8
splash_cmpr_5_2:
	setx 0x27436f6e9a287539, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 2: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd0ffc028  ! 3: SWAPA_R	swapa	%r8, [%r31 + %r8] 0x01
DS_5_3:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa9a00554  ! 1: FSQRTd	fsqrt	
	.word 0x95a00834  ! 4: FADDs	fadds	%f0, %f20, %f10
	.word 0xd6880e80  ! 5: LDUBA_R	lduba	[%r0, %r0] 0x74, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_4) + 24, 16, 16)) -> intp(1,0,17)
intvec_5_4:
	.word 0x39400001  ! 6: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_5_5:
	setx 0x9a11f59207ece973, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 7: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd68804a0  ! 8: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
intveclr_5_6:
	setx 0x7e2f8c8485338ff9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 9: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_5_7:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f18, %f0, %f8
	.word 0x97b4c313  ! 10: ALIGNADDRESS	alignaddr	%r19, %r19, %r11
	.word 0xa190200c  ! 11: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01962  ! 12: FqTOd	dis not found

	setx 0x4131b564d9b1ed4f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_9:
	.word 0x39400001  ! 13: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 14: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 15: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6c80e40  ! 16: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 17: LDX_R	ldx	[%r31 + %r0], %r11
splash_hpstate_5_10:
	.word 0x81982a8c  ! 18: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8c, %hpstate
	.word 0x97480000  ! 19: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
intveclr_5_11:
	setx 0x704199b4fc2003ff, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_5_12:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 21: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_5_13:
	setx 0xdf2842f411b6ef8d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 22: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3a800001  ! 23: BCC	bcc,a	<label_0x1>
DS_5_14:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f0, %f20, %f12
	.word 0x99b4c30c  ! 24: ALIGNADDRESS	alignaddr	%r19, %r12, %r12
	.word 0x87802055  ! 25: WRASI_I	wr	%r0, 0x0055, %asi
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_15:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 26: CASA_R	casa	[%r31] %asi, %r3, %r11
splash_cmpr_5_16:
	setx 0x1a867baef88f915e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 27: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 28: Tcc_R	te	icc_or_xcc, %r0 + %r30
	setx 0x052d996834379048, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_17:
	.word 0x39400001  ! 29: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_5_18:
	set user_data_start, %r31
	.word 0x85802c41  ! 30: WRCCR_I	wr	%r0, 0x0c41, %ccr
DS_5_19:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 31: SAVE_R	save	%r31, %r0, %r31
mondo_5_20:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d93400d  ! 32: WRPR_WSTATE_R	wrpr	%r13, %r13, %wstate
	.word 0xab8274f7  ! 33: WR_CLEAR_SOFTINT_I	wr	%r9, 0x14f7, %clear_softint
	.word 0xd6800c60  ! 34: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r11
DS_5_21:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x95a489d4  ! 1: FDIVd	fdivd	%f18, %f20, %f10
	.word 0x91a0054a  ! 1: FSQRTd	fsqrt	
	.word 0x91a28831  ! 35: FADDs	fadds	%f10, %f17, %f8
splash_cmpr_5_22:
	setx 0x47137f9b96d67a18, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 36: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_23:
	setx 0x89e6c1d966101c31, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 37: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_5_24:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 38: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xab84c002  ! 39: WR_CLEAR_SOFTINT_R	wr	%r19, %r2, %clear_softint
	.word 0x9ba4c9c4  ! 40: FDIVd	fdivd	%f50, %f4, %f44
	.word 0xa1902007  ! 41: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936d31f2  ! 42: SDIVX_I	sdivx	%r20, 0xfffff1f2, %r9
	.word 0x8d903f8e  ! 43: WRPR_PSTATE_I	wrpr	%r0, 0x1f8e, %pstate
intveclr_5_26:
	setx 0x48ecfe2a9d13feed, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 44: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_27:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e000  ! 45: CASA_R	casa	[%r31] %asi, %r0, %r12
	.word 0xd93ffa99  ! 46: STDF_I	std	%f12, [0x1a99, %r31]
splash_tba_5_28:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 47: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_5_29:
	setx 0xe02eae7ed8271ea9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 48: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_30
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_30:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 49: RDPC	rd	%pc, %r11
	.word 0x87802080  ! 50: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x9f802330  ! 51: SIR	sir	0x0330
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6b609d  ! 52: SDIVX_I	sdivx	%r13, 0x009d, %r13
debug_5_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 53: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1692c8d  ! 54: SDIVX_I	sdivx	%r4, 0x0c8d, %r16
	rd %pc, %r19
	add %r19, (ivw_5_34-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_34:
	.word 0x9192c009  ! 55: WRPR_PIL_R	wrpr	%r11, %r9, %pil
mondo_5_35:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d948010  ! 56: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_36) + 32, 16, 16)) -> intp(1,0,1)
intvec_5_36:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_5_37:
	.word 0x81982fcf  ! 58: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcf, %hpstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_38:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 59: CASA_R	casa	[%r31] %asi, %r17, %r12
intveclr_5_39:
	setx 0x35be9680bc2a74fb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 60: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa46c8008  ! 61: UDIVX_R	udivx 	%r18, %r8, %r18
	.word 0x91d02033  ! 62: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xab82a31a  ! 63: WR_CLEAR_SOFTINT_I	wr	%r10, 0x031a, %clear_softint
mondo_5_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d94c010  ! 64: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_41:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 65: CASA_R	casa	[%r31] %asi, %r11, %r9
debug_5_42:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 66: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0xa9818003  ! 67: WR_SET_SOFTINT_R	wr	%r6, %r3, %set_softint
	.word 0x879022d1  ! 68: WRPR_TT_I	wrpr	%r0, 0x02d1, %tt
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
	.word 0x9b414000  ! 69: RDPC	rd	%pc, %r13
	.word 0xe06ff27b  ! 70: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffff27b]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 71: LDX_R	ldx	[%r31 + %r0], %r16
debug_5_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 72: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_5_45:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 73: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0xe08fe020  ! 74: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r16
	.word 0x91520000  ! 75: RDPR_PIL	<illegal instruction>
tagged_5_46:
	tsubcctv %r3, 0x1660, %r17
	.word 0xe407f27b  ! 76: LDUW_I	lduw	[%r31 + 0xfffff27b], %r18
intveclr_5_47:
	setx 0xa4a7ba501997df4a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 78: Tcc_I	ta	icc_or_xcc, %r0 + 178
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_48
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_48:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 79: RDPC	rd	%pc, %r19
	.word 0xe31ff27b  ! 80: LDDF_I	ldd	[%r31, 0x127b], %f17
	.word 0xe28008a0  ! 81: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe28fe000  ! 82: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r17
	.word 0xe28008a0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x91d02033  ! 84: Tcc_I	ta	icc_or_xcc, %r0 + 51
pmu_5_49:
	nop
	setx 0xfffff14cfffff0fe, %g1, %g7
	.word 0xa3800007  ! 85: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe2c804a0  ! 86: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_50
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_50
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_50:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 87: RDPC	rd	%pc, %r13
	rd %pc, %r19
	add %r19, (ivw_5_51-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_51:
	.word 0x9194400a  ! 88: WRPR_PIL_R	wrpr	%r17, %r10, %pil
	.word 0x8780208a  ! 89: WRASI_I	wr	%r0, 0x008a, %asi
DS_5_52:
	.word 0x91a209cc  ! 1: FDIVd	fdivd	%f8, %f12, %f8
	pdist %f14, %f28, %f12
	.word 0x9bb24307  ! 90: ALIGNADDRESS	alignaddr	%r9, %r7, %r13
change_to_randtl_5_53:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_53:
	.word 0x8f902002  ! 91: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_5_54:
	tsubcctv %r23, 0x170c, %r24
	.word 0xd407f27b  ! 92: LDUW_I	lduw	[%r31 + 0xfffff27b], %r10
	setx 0x45ddffe71c0b0ebf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_55:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_5_56:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d90400a  ! 94: WRPR_WSTATE_R	wrpr	%r1, %r10, %wstate
	.word 0xa190200f  ! 95: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_hpstate_5_57:
	.word 0x819820b7  ! 96: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00b7, %hpstate
	.word 0x8d903270  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x1270, %pstate
	.word 0x87802010  ! 98: WRASI_I	wr	%r0, 0x0010, %asi
splash_lsu_5_58:
	setx 0x2e3fe332a9eeb933, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 99: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_5_59:
	nop
	setx 0xfffff33ffffff35a, %g1, %g7
	.word 0xa3800007  ! 100: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd497e000  ! 101: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_60:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 102: CASA_R	casa	[%r31] %asi, %r2, %r10
	.word 0xa784ad99  ! 103: WR_GRAPHICS_STATUS_REG_I	wr	%r18, 0x0d99, %-
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 104: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 105: LDX_R	ldx	[%r31 + %r0], %r10
memptr_5_61:
	set 0x60340000, %r31
	.word 0x8582775f  ! 106: WRCCR_I	wr	%r9, 0x175f, %ccr
	.word 0x87902299  ! 107: WRPR_TT_I	wrpr	%r0, 0x0299, %tt
change_to_randtl_5_62:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_62:
	.word 0x8f902002  ! 108: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	setx 0x4bd79eee3dbb026e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_63:
	.word 0x39400001  ! 109: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790235a  ! 110: WRPR_TT_I	wrpr	%r0, 0x035a, %tt
debug_5_64:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 111: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa3a00163  ! 112: FABSq	dis not found

debug_5_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 113: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_66
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_66:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 114: RDPC	rd	%pc, %r13
splash_lsu_5_67:
	setx 0xeda5f26105ce56bf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 115: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_5_68:
	setx 0x6795927fde3f09a1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 116: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902199  ! 117: WRPR_TT_I	wrpr	%r0, 0x0199, %tt
	.word 0x81460000  ! 118: RD_STICK_REG	stbar
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 119: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_5_69:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d91000a  ! 120: WRPR_WSTATE_R	wrpr	%r4, %r10, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_70) + 40, 16, 16)) -> intp(2,0,1)
intvec_5_70:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_5_71:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 122: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
intveclr_5_72:
	setx 0xaf5f96ca2357157e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 123: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd0d7e030  ! 124: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	setx 0x50d14ddf913def94, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_73:
	.word 0x39400001  ! 125: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_74)+56, 16, 16)) -> intp(5,1,3)
xir_5_74:
	.word 0xa9827bf5  ! 126: WR_SET_SOFTINT_I	wr	%r9, 0x1bf5, %set_softint
	.word 0xd0d804a0  ! 127: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_75)+16, 16, 16)) -> intp(5,1,3)
xir_5_75:
	.word 0xa98228a7  ! 128: WR_SET_SOFTINT_I	wr	%r8, 0x08a7, %set_softint
splash_lsu_5_76:
	setx 0x6f30c27b9a917bb7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 129: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 130: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_lsu_5_77:
	setx 0x162c7686d04b4bd1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 131: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_5_78:
	set user_data_start, %r31
	.word 0x85842ca1  ! 132: WRCCR_I	wr	%r16, 0x0ca1, %ccr
change_to_randtl_5_79:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_79:
	.word 0x8f902001  ! 133: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x879022af  ! 134: WRPR_TT_I	wrpr	%r0, 0x02af, %tt
	.word 0x8d802000  ! 135: WRFPRS_I	wr	%r0, 0x0000, %fprs
	rd %pc, %r19
	add %r19, (ivw_5_80-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_80:
	.word 0x91950003  ! 136: WRPR_PIL_R	wrpr	%r20, %r3, %pil
cwp_5_81:
    set user_data_start, %o7
	.word 0x93902005  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902754  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x0754, %pstate
	.word 0xa5454000  ! 139: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0xe6d804a0  ! 140: LDXA_R	ldxa	[%r0, %r0] 0x25, %r19
	.word 0x96a90013  ! 141: ANDNcc_R	andncc 	%r4, %r19, %r11
debug_5_82:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 142: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200f  ! 143: WRPR_GL_I	wrpr	%r0, 0x000f, %-
memptr_5_83:
	set 0x60540000, %r31
	.word 0x85816053  ! 144: WRCCR_I	wr	%r5, 0x0053, %ccr
	.word 0xa2f82f08  ! 145: SDIVcc_I	sdivcc 	%r0, 0x0f08, %r17
	.word 0x93520000  ! 146: RDPR_PIL	<illegal instruction>
DS_5_84:
	.word 0x9ba509c3  ! 1: FDIVd	fdivd	%f20, %f34, %f44
	.word 0xd1350011  ! 1: STQF_R	-	%f8, [%r17, %r20]
	normalw
	.word 0x97458000  ! 147: RD_SOFTINT_REG	rd	%softint, %r11
splash_cmpr_5_85:
	setx 0x256386b475476ad5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 148: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_5_86:
	setx 0xd486f8a27db476f9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 149: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd89fe4db  ! 150: LDDA_I	ldda	[%r31, + 0x04db] %asi, %r12
debug_5_87:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 151: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97683599  ! 152: SDIVX_I	sdivx	%r0, 0xfffff599, %r11
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_89:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 153: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x3a800001  ! 154: BCC	bcc,a	<label_0x1>
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 155: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99500000  ! 156: RDPR_TPC	<illegal instruction>
intveclr_5_90:
	setx 0x359b926b1d06a437, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 157: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6800b60  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r11
memptr_5_91:
	set 0x60140000, %r31
	.word 0x8582787d  ! 159: WRCCR_I	wr	%r9, 0x187d, %ccr
	rd %pc, %r19
	add %r19, (ivw_5_92-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_92:
	.word 0x91924013  ! 160: WRPR_PIL_R	wrpr	%r9, %r19, %pil
	.word 0x87802004  ! 161: WRASI_I	wr	%r0, 0x0004, %asi
debug_5_93:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 162: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0x83d02033  ! 163: Tcc_I	te	icc_or_xcc, %r0 + 51
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 164: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902000  ! 165: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xab81bceb  ! 166: WR_CLEAR_SOFTINT_I	wr	%r6, 0x1ceb, %clear_softint
	.word 0xd61fc000  ! 167: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x8d802000  ! 168: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_5_94:
	setx 0x0c9dd82d9cf13c58, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 169: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_5_95:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_95-donret_5_95-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_95:
	.word 0xd6ffe189  ! 170: SWAPA_I	swapa	%r11, [%r31 + 0x0189] %asi
DS_5_96:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xcb620a1c	! Random illegal ?
	.word 0x9ba009c9  ! 1: FDIVd	fdivd	%f0, %f40, %f44
	.word 0xa9a2882a  ! 171: FADDs	fadds	%f10, %f10, %f20
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 172: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 173: BNE	bne,a	<label_0x1>
	.word 0x87902146  ! 174: WRPR_TT_I	wrpr	%r0, 0x0146, %tt
	.word 0x879021db  ! 175: WRPR_TT_I	wrpr	%r0, 0x01db, %tt
DS_5_97:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd9308014  ! 1: STQF_R	-	%f12, [%r20, %r2]
	normalw
	.word 0xa1458000  ! 176: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0xd68008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
debug_5_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 178: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9b500000  ! 179: RDPR_TPC	rdpr	%tpc, %r13
intveclr_5_99:
	setx 0x1db29a73eb8d613a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x94842228  ! 181: ADDcc_I	addcc 	%r16, 0x0228, %r10
pmu_5_100:
	nop
	setx 0xfffff5c6fffffb31, %g1, %g7
	.word 0xa3800007  ! 182: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_5_101:
	setx 0x1969abb1574779b4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xdb37e256  ! 184: STQF_I	-	%f13, [0x0256, %r31]
	.word 0xa190200e  ! 185: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_cmpr_5_102:
	setx 0x383c41bb1648c569, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 186: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76cb6b5  ! 187: SDIVX_I	sdivx	%r18, 0xfffff6b5, %r19
change_to_randtl_5_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_104:
	.word 0x8f902000  ! 188: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	setx 0x9b2b15b661ff4fff, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_105:
	.word 0x39400001  ! 189: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xdbe7e00d  ! 190: CASA_R	casa	[%r31] %asi, %r13, %r13
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_107
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_107:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 191: RDPC	rd	%pc, %r12
	.word 0x99902004  ! 192: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_108
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_108:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 193: RDPC	rd	%pc, %r18
	.word 0x91d02033  ! 194: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa7500000  ! 195: RDPR_TPC	<illegal instruction>
splash_decr_5_109:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r6, [%r1] 0x45
	.word 0xa7820005  ! 196: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r5, %-
	.word 0x91a2c9eb  ! 197: FDIVq	dis not found

splash_htba_5_110:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 198: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d902d10  ! 199: WRPR_PSTATE_I	wrpr	%r0, 0x0d10, %pstate
DS_5_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x99b0c30b  ! 200: ALIGNADDRESS	alignaddr	%r3, %r11, %r12
	.word 0xe737f018  ! 201: STQF_I	-	%f19, [0x1018, %r31]
memptr_5_112:
	set 0x60340000, %r31
	.word 0x858236af  ! 202: WRCCR_I	wr	%r8, 0x16af, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 203: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x93464000  ! 204: RD_STICK_CMPR_REG	rd	%-, %r9
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_113
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_113:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 205: RDPC	rd	%pc, %r8
	.word 0xd6800bc0  ! 206: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r11
	rd %pc, %r19
	add %r19, (ivw_5_114-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_114:
	.word 0x91948006  ! 207: WRPR_PIL_R	wrpr	%r18, %r6, %pil
debug_5_115:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 208: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d802000  ! 209: WRFPRS_I	wr	%r0, 0x0000, %fprs
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
	.word 0x99414000  ! 210: RDPC	rd	%pc, %r12
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_117
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_117
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_117:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 211: RDPC	rd	%pc, %r11
tagged_5_118:
	tsubcctv %r22, 0x1c3c, %r14
	.word 0xe807f954  ! 212: LDUW_I	lduw	[%r31 + 0xfffff954], %r20
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_119
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_119
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_119:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 213: RDPC	rd	%pc, %r13
	.word 0x8780208a  ! 214: WRASI_I	wr	%r0, 0x008a, %asi
mondo_5_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d910008  ! 215: WRPR_WSTATE_R	wrpr	%r4, %r8, %wstate
	.word 0xa7464000  ! 216: RD_STICK_CMPR_REG	rd	%-, %r19
	.word 0x83d02032  ! 217: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_hpstate_5_121:
	.word 0x81982d47  ! 218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d47, %hpstate
splash_hpstate_5_122:
	.word 0x8198265e  ! 219: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065e, %hpstate
DS_5_123:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd7312d31  ! 1: STQF_I	-	%f11, [0x0d31, %r4]
	normalw
	.word 0xa3458000  ! 220: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x87802004  ! 221: WRASI_I	wr	%r0, 0x0004, %asi
change_to_randtl_5_124:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_124:
	.word 0x8f902001  ! 222: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_5_125:
	setx 0x3f5047bed9596709, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa983400d  ! 224: WR_SET_SOFTINT_R	wr	%r13, %r13, %set_softint
cwp_5_126:
    set user_data_start, %o7
	.word 0x93902001  ! 225: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
memptr_5_127:
	set 0x60340000, %r31
	.word 0x858070e9  ! 226: WRCCR_I	wr	%r1, 0x10e9, %ccr
	.word 0x91d02033  ! 227: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x36800001  ! 228: BGE	bge,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_128) + 48, 16, 16)) -> intp(1,0,8)
intvec_5_128:
	.word 0x39400001  ! 229: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_5_129:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa1a209d1  ! 1: FDIVd	fdivd	%f8, %f48, %f16
	normalw
	.word 0x99458000  ! 230: RD_SOFTINT_REG	rd	%softint, %r12
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
	.word 0xd1e7e00d  ! 231: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0xd08008a0  ! 232: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd04fc000  ! 233: LDSB_R	ldsb	[%r31 + %r0], %r8
	.word 0xab817908  ! 234: WR_CLEAR_SOFTINT_I	wr	%r5, 0x1908, %clear_softint
	.word 0x81460000  ! 235: RD_STICK_REG	stbar
	.word 0xd0d00e60  ! 236: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r8
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 237: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x99902001  ! 238: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x8d903766  ! 239: WRPR_PSTATE_I	wrpr	%r0, 0x1766, %pstate
	.word 0xa9540000  ! 240: RDPR_GL	rdpr	%-, %r20
splash_lsu_5_132:
	setx 0x81af34a58d02d8b3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 241: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903dc6  ! 242: WRPR_PSTATE_I	wrpr	%r0, 0x1dc6, %pstate
	.word 0xd08fe010  ! 243: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r8
	.word 0xd04ff3f2  ! 244: LDSB_I	ldsb	[%r31 + 0xfffff3f2], %r8
mondo_5_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d94c006  ! 245: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
	.word 0x8d802000  ! 246: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_5_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 247: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_5_135:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 248: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0x2e700001  ! 249: BPVS	<illegal instruction>
	.word 0xa7a00160  ! 250: FABSq	dis not found

splash_tba_5_136:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 251: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d020b2  ! 252: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_cmpr_5_137:
	setx 0xb71860481dea5e62, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_138:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 254: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0xda7ff3f2  ! 255: SWAP_I	swap	%r13, [%r31 + 0xfffff3f2]
tagged_5_139:
	taddcctv %r12, 0x1b2f, %r26
	.word 0xda07f3f2  ! 256: LDUW_I	lduw	[%r31 + 0xfffff3f2], %r13
	.word 0x3a800001  ! 257: BCC	bcc,a	<label_0x1>
tagged_5_140:
	tsubcctv %r17, 0x140e, %r6
	.word 0xda07f3f2  ! 258: LDUW_I	lduw	[%r31 + 0xfffff3f2], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 259: LDX_R	ldx	[%r31 + %r0], %r13
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_141
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_141:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 260: CASA_R	casa	[%r31] %asi, %r8, %r13
	.word 0xda3ff3f2  ! 261: STD_I	std	%r13, [%r31 + 0xfffff3f2]
	.word 0xdac00e80  ! 262: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r13
	.word 0x91d02033  ! 263: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_5_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d950005  ! 264: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	.word 0xdabff3f2  ! 265: STDA_I	stda	%r13, [%r31 + 0xfffff3f2] %asi
	.word 0xda8804a0  ! 266: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
mondo_5_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d924009  ! 267: WRPR_WSTATE_R	wrpr	%r9, %r9, %wstate
	.word 0xda3ff3f2  ! 268: STD_I	std	%r13, [%r31 + 0xfffff3f2]
	.word 0xa9828011  ! 269: WR_SET_SOFTINT_R	wr	%r10, %r17, %set_softint
	.word 0x8d902c09  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x0c09, %pstate
	.word 0x8d90210a  ! 271: WRPR_PSTATE_I	wrpr	%r0, 0x010a, %pstate
	.word 0x20700001  ! 272: BPN	<illegal instruction>
	.word 0xda9004a0  ! 273: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
debug_5_144:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 274: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_145)+32, 16, 16)) -> intp(5,1,3)
xir_5_145:
	.word 0xa980f902  ! 275: WR_SET_SOFTINT_I	wr	%r3, 0x1902, %set_softint
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_146
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_146:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00b  ! 276: CASA_R	casa	[%r31] %asi, %r11, %r13
	.word 0x91d02032  ! 277: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa1902008  ! 278: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xda37ef7c  ! 279: STH_I	sth	%r13, [%r31 + 0x0f7c]
	.word 0xda77c000  ! 280: STX_R	stx	%r13, [%r31 + %r0]
pmu_5_147:
	nop
	setx 0xfffffe8efffffb81, %g1, %g7
	.word 0xa3800007  ! 281: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d02033  ! 282: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x3e800001  ! 283: BVC	bvc,a	<label_0x1>
	.word 0x2c700001  ! 284: BPNEG	<illegal instruction>
	.word 0xdadfe030  ! 285: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
	.word 0x8d902c7c  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x0c7c, %pstate
splash_tba_5_148:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 287: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_5_149:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 288: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 289: LDX_R	ldx	[%r31 + %r0], %r13
debug_5_150:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 290: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	.word 0xda8804a0  ! 291: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x8d903410  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x1410, %pstate
	.word 0x91d02032  ! 293: Tcc_I	ta	icc_or_xcc, %r0 + 50
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 294: LDX_R	ldx	[%r31 + %r0], %r13
tagged_5_151:
	taddcctv %r20, 0x148b, %r2
	.word 0xda07ef7c  ! 295: LDUW_I	lduw	[%r31 + 0x0f7c], %r13
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 296: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdb3fc000  ! 297: STDF_R	std	%f13, [%r0, %r31]
	.word 0xdac7e020  ! 298: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r13
DS_5_152:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x99a409cc  ! 1: FDIVd	fdivd	%f16, %f12, %f12
	normalw
	.word 0x97458000  ! 299: RD_SOFTINT_REG	rd	%softint, %r11
splash_decr_5_153:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa7840002  ! 300: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r2, %-
mondo_5_154:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d904008  ! 301: WRPR_WSTATE_R	wrpr	%r1, %r8, %wstate
	.word 0xd8d7e020  ! 302: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_155
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_155:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 303: RDPC	rd	%pc, %r8
	.word 0x87802089  ! 304: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81510000  ! 305: RDPR_TICK	rdpr	%tick, %r0
	.word 0xa1902005  ! 306: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 307: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_5_156:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_156:
	.word 0x8f902001  ! 308: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
memptr_5_157:
	set 0x60740000, %r31
	.word 0x8584715c  ! 309: WRCCR_I	wr	%r17, 0x115c, %ccr
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 310: Tcc_R	tne	icc_or_xcc, %r0 + %r30
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
	.word 0xd1e7e010  ! 311: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93687173  ! 312: SDIVX_I	sdivx	%r1, 0xfffff173, %r9
splash_lsu_5_160:
	setx 0x27dad081f0119af1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 313: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802415  ! 314: SIR	sir	0x0415
cwp_5_161:
    set user_data_start, %o7
	.word 0x93902002  ! 315: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd897e010  ! 316: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
debug_5_162:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 317: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 318: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_hpstate_5_163:
	.word 0x819821c5  ! 319: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c5, %hpstate
splash_cmpr_5_164:
	setx 0x29ecfc32d7640370, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 320: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8c00e60  ! 321: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r12
tagged_5_165:
	taddcctv %r5, 0x19c3, %r16
	.word 0xd807ee27  ! 322: LDUW_I	lduw	[%r31 + 0x0e27], %r12
debug_5_166:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 323: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd897e010  ! 324: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
splash_cmpr_5_167:
	setx 0x13606cead49afd6b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 325: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_168:
	setx 0x1cdf383f3ed43ad4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f803773  ! 327: SIR	sir	0x1773
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_169
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_169:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 328: CASA_R	casa	[%r31] %asi, %r16, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_170) + 24, 16, 16)) -> intp(2,0,15)
intvec_5_170:
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_5_171:
	.word 0x81982f4c  ! 330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4c, %hpstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_172
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_172:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 331: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x87802080  ! 332: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x87802016  ! 333: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xa7a00171  ! 334: FABSq	dis not found

debug_5_173:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 335: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x3e700001  ! 336: BPVC	<illegal instruction>
	.word 0xa190200e  ! 337: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d9030ad  ! 338: WRPR_PSTATE_I	wrpr	%r0, 0x10ad, %pstate
debug_5_174:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 339: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
DS_5_175:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 340: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_5_176-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_176:
	.word 0x9194400b  ! 341: WRPR_PIL_R	wrpr	%r17, %r11, %pil
	.word 0xd28fe000  ! 342: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r9
splash_hpstate_5_177:
	.word 0x81982676  ! 343: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0676, %hpstate
	.word 0x8790222b  ! 344: WRPR_TT_I	wrpr	%r0, 0x022b, %tt
DS_5_178:
	.word 0x99a489cb  ! 1: FDIVd	fdivd	%f18, %f42, %f12
	pdist %f8, %f6, %f26
	.word 0x99b00301  ! 345: ALIGNADDRESS	alignaddr	%r0, %r1, %r12
cwp_5_179:
    set user_data_start, %o7
	.word 0x93902006  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_180) + 24, 16, 16)) -> intp(3,0,22)
intvec_5_180:
	.word 0x39400001  ! 347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_5_181:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 348: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02034  ! 349: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01973  ! 350: FqTOd	dis not found

	.word 0xd2d804a0  ! 351: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
splash_lsu_5_183:
	setx 0xce04a85dd7d2d035, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 352: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd2c00e60  ! 353: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r9
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 354: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902007  ! 355: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_cmpr_5_184:
	setx 0x56f0ddef662819d9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 356: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_5_185:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_185:
	.word 0x8f902001  ! 357: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cwp_5_186:
    set user_data_start, %o7
	.word 0x93902004  ! 358: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_5_187:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 359: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802020  ! 360: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x93d02033  ! 361: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xd297e010  ! 362: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r9
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_188
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_188
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_188:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 363: RDPC	rd	%pc, %r12
DS_5_189:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb320012  ! 1: STQF_R	-	%f13, [%r18, %r8]
	normalw
	.word 0x97458000  ! 364: RD_SOFTINT_REG	rd	%softint, %r11
memptr_5_190:
	set 0x60740000, %r31
	.word 0x8581e44e  ! 365: WRCCR_I	wr	%r7, 0x044e, %ccr
	.word 0x2c800001  ! 366: BNEG	bneg,a	<label_0x1>
	.word 0xa980c011  ! 367: WR_SET_SOFTINT_R	wr	%r3, %r17, %set_softint
	.word 0xa9a2c9d3  ! 368: FDIVd	fdivd	%f42, %f50, %f20
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_191
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_191:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 369: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x87802016  ! 370: WRASI_I	wr	%r0, 0x0016, %asi
tagged_5_192:
	tsubcctv %r26, 0x102d, %r5
	.word 0xe407e3c5  ! 371: LDUW_I	lduw	[%r31 + 0x03c5], %r18
	.word 0xe5e7c033  ! 372: CASA_I	casa	[%r31] 0x 1, %r19, %r18
splash_cmpr_5_193:
	setx 0xa1c00df720b1e24c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 373: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_5_194:
	tsubcctv %r6, 0x152e, %r10
	.word 0xe407e3c5  ! 374: LDUW_I	lduw	[%r31 + 0x03c5], %r18
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_195
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_195
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_195:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 375: RDPC	rd	%pc, %r17
DS_5_196:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xab472df1	! Random illegal ?
	.word 0x97a009c4  ! 1: FDIVd	fdivd	%f0, %f4, %f42
	.word 0xa7a1c824  ! 376: FADDs	fadds	%f7, %f4, %f19
	.word 0x8d9036af  ! 377: WRPR_PSTATE_I	wrpr	%r0, 0x16af, %pstate
mondo_5_197:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d91800b  ! 378: WRPR_WSTATE_R	wrpr	%r6, %r11, %wstate
	.word 0xab81fbfd  ! 379: WR_CLEAR_SOFTINT_I	wr	%r7, 0x1bfd, %clear_softint
	.word 0x8790219f  ! 380: WRPR_TT_I	wrpr	%r0, 0x019f, %tt
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_198:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 381: RDPC	rd	%pc, %r20
	.word 0x28800001  ! 382: BLEU	bleu,a	<label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16afd6f  ! 383: SDIVX_I	sdivx	%r11, 0xfffffd6f, %r16
	.word 0x87902344  ! 384: WRPR_TT_I	wrpr	%r0, 0x0344, %tt
donret_5_200:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_200-donret_5_200), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_200:
	.word 0xe8fff393  ! 385: SWAPA_I	swapa	%r20, [%r31 + 0xfffff393] %asi
debug_5_201:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 386: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 387: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_5_202:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 388: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe937f393  ! 389: STQF_I	-	%f20, [0x1393, %r31]
	.word 0x87802088  ! 390: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xe88008a0  ! 391: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
tagged_5_203:
	taddcctv %r22, 0x1ace, %r13
	.word 0xe807f393  ! 392: LDUW_I	lduw	[%r31 + 0xfffff393], %r20
debug_5_204:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 393: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
memptr_5_205:
	set 0x60140000, %r31
	.word 0x8584b6ac  ! 394: WRCCR_I	wr	%r18, 0x16ac, %ccr
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 395: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xab81e8aa  ! 396: WR_CLEAR_SOFTINT_I	wr	%r7, 0x08aa, %clear_softint
	.word 0xe8cfe000  ! 397: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r20
	.word 0xe8d004a0  ! 398: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
	.word 0x9f8038ec  ! 399: SIR	sir	0x18ec
tagged_5_206:
	tsubcctv %r3, 0x1b00, %r7
	.word 0xe807f1a5  ! 400: LDUW_I	lduw	[%r31 + 0xfffff1a5], %r20
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
tagged_4_1:
	taddcctv %r12, 0x15e2, %r24
	.word 0xd007f228  ! 1: LDUW_I	lduw	[%r31 + 0xfffff228], %r8
splash_cmpr_4_2:
	setx 0x9da6770cd24f071b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 2: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd0ffc028  ! 3: SWAPA_R	swapa	%r8, [%r31 + %r8] 0x01
DS_4_3:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa7a00553  ! 1: FSQRTd	fsqrt	
	.word 0x99a50829  ! 4: FADDs	fadds	%f20, %f9, %f12
	.word 0xd68804a0  ! 5: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_4) + 0, 16, 16)) -> intp(0,0,11)
intvec_4_4:
	.word 0x39400001  ! 6: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_4_5:
	setx 0x2165f0dcdf72acff, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 7: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd68804a0  ! 8: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
intveclr_4_6:
	setx 0xcb8fdce74f05fdd1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 9: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_4_7:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f2, %f4, %f20
	.word 0xa1b1c30d  ! 10: ALIGNADDRESS	alignaddr	%r7, %r13, %r16
	.word 0xa190200a  ! 11: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01973  ! 12: FqTOd	dis not found

	setx 0x8a7232dd0e9c68b3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_9:
	.word 0x39400001  ! 13: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 14: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 15: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6c804a0  ! 16: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 17: LDX_R	ldx	[%r31 + %r0], %r11
splash_hpstate_4_10:
	.word 0x81982415  ! 18: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0415, %hpstate
	.word 0xa9480000  ! 19: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
intveclr_4_11:
	setx 0x9b2e10af04d5a2e7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_4_12:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 21: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_4_13:
	setx 0xdda37a815759b229, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 22: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3a800001  ! 23: BCC	bcc,a	<label_0x1>
DS_4_14:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f16, %f4, %f26
	.word 0xa1b2c30c  ! 24: ALIGNADDRESS	alignaddr	%r11, %r12, %r16
	.word 0x87802020  ! 25: WRASI_I	wr	%r0, 0x0020, %asi
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_15:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 26: CASA_R	casa	[%r31] %asi, %r3, %r11
splash_cmpr_4_16:
	setx 0x77dcd305ce9c015c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 27: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 28: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x833e76cdbd1f5cf9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_17:
	.word 0x39400001  ! 29: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_4_18:
	set user_data_start, %r31
	.word 0x85813015  ! 30: WRCCR_I	wr	%r4, 0x1015, %ccr
DS_4_19:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 31: SAVE_R	save	%r31, %r0, %r31
mondo_4_20:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d944001  ! 32: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
	.word 0xab8336cb  ! 33: WR_CLEAR_SOFTINT_I	wr	%r12, 0x16cb, %clear_softint
	.word 0xd6800aa0  ! 34: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r11
DS_4_21:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x93a209d2  ! 1: FDIVd	fdivd	%f8, %f18, %f40
	.word 0xa9a00550  ! 1: FSQRTd	fsqrt	
	.word 0xa5a4c827  ! 35: FADDs	fadds	%f19, %f7, %f18
splash_cmpr_4_22:
	setx 0x87e200034c9b0fa7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 36: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_23:
	setx 0x484911d379c37cd3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 37: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_4_24:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 38: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xab828014  ! 39: WR_CLEAR_SOFTINT_R	wr	%r10, %r20, %clear_softint
	.word 0xa9a0c9c3  ! 40: FDIVd	fdivd	%f34, %f34, %f20
	.word 0xa1902003  ! 41: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6b3c00  ! 42: SDIVX_I	sdivx	%r12, 0xfffffc00, %r13
	.word 0x8d903edb  ! 43: WRPR_PSTATE_I	wrpr	%r0, 0x1edb, %pstate
intveclr_4_26:
	setx 0x190569425cecb6fc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 44: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_27:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e000  ! 45: CASA_R	casa	[%r31] %asi, %r0, %r12
	.word 0xd93ffa99  ! 46: STDF_I	std	%f12, [0x1a99, %r31]
splash_tba_4_28:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 47: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_4_29:
	setx 0x004c017e60a7815c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 48: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_30
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_30:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 49: RDPC	rd	%pc, %r9
	.word 0x8780204f  ! 50: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x9f803a57  ! 51: SIR	sir	0x1a57
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36a3432  ! 52: SDIVX_I	sdivx	%r8, 0xfffff432, %r17
debug_4_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 53: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916c7d85  ! 54: SDIVX_I	sdivx	%r17, 0xfffffd85, %r8
	rd %pc, %r19
	add %r19, (ivw_4_34-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_34:
	.word 0x9194800b  ! 55: WRPR_PIL_R	wrpr	%r18, %r11, %pil
mondo_4_35:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d940004  ! 56: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_36) + 8, 16, 16)) -> intp(1,0,19)
intvec_4_36:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_37:
	.word 0x819822df  ! 58: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02df, %hpstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_38:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 59: CASA_R	casa	[%r31] %asi, %r17, %r12
intveclr_4_39:
	setx 0x84401a13c3603abf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 60: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9269c00d  ! 61: UDIVX_R	udivx 	%r7, %r13, %r9
	.word 0x83d02035  ! 62: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xab81ade0  ! 63: WR_CLEAR_SOFTINT_I	wr	%r6, 0x0de0, %clear_softint
mondo_4_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d92c006  ! 64: WRPR_WSTATE_R	wrpr	%r11, %r6, %wstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_41:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 65: CASA_R	casa	[%r31] %asi, %r11, %r9
debug_4_42:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_42:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_42
    nop
debug_wait4_42:
    ld [%r23], %r16
    brnz %r16, debug_wait4_42
    nop
    ba,a debug_startwait4_42
continue_debug_4_42:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_42:
    cmp %r13, %r15
    bne,a wait_for_stat_4_42
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_42:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_42
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 66: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xa980c010  ! 67: WR_SET_SOFTINT_R	wr	%r3, %r16, %set_softint
	.word 0x879020a2  ! 68: WRPR_TT_I	wrpr	%r0, 0x00a2, %tt
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
	.word 0xa1414000  ! 69: RDPC	rd	%pc, %r16
	.word 0xe06ff27b  ! 70: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffff27b]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 71: LDX_R	ldx	[%r31 + %r0], %r16
debug_4_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 72: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_4_45:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_45:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_45
    nop
debug_wait4_45:
    ld [%r23], %r16
    brnz %r16, debug_wait4_45
    nop
    ba,a debug_startwait4_45
continue_debug_4_45:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_45:
    cmp %r13, %r15
    bne,a wait_for_stat_4_45
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_45:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_45
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 73: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xe08fe020  ! 74: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r16
	.word 0xa9520000  ! 75: RDPR_PIL	<illegal instruction>
tagged_4_46:
	tsubcctv %r24, 0x18f0, %r15
	.word 0xe407f27b  ! 76: LDUW_I	lduw	[%r31 + 0xfffff27b], %r18
intveclr_4_47:
	setx 0x7ebd974de0b0a0b0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 78: Tcc_I	ta	icc_or_xcc, %r0 + 50
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_48
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_48:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 79: RDPC	rd	%pc, %r16
	.word 0xe31ff27b  ! 80: LDDF_I	ldd	[%r31, 0x127b], %f17
	.word 0xe28008a0  ! 81: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe28fe000  ! 82: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r17
	.word 0xe28008a0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x91d02032  ! 84: Tcc_I	ta	icc_or_xcc, %r0 + 50
pmu_4_49:
	nop
	setx 0xfffff63efffff15b, %g1, %g7
	.word 0xa3800007  ! 85: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe2c804a0  ! 86: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_50
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_50
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_50:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 87: RDPC	rd	%pc, %r9
	rd %pc, %r19
	add %r19, (ivw_4_51-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_51:
	.word 0x91930002  ! 88: WRPR_PIL_R	wrpr	%r12, %r2, %pil
	.word 0x87802058  ! 89: WRASI_I	wr	%r0, 0x0058, %asi
DS_4_52:
	.word 0xa1a089d0  ! 1: FDIVd	fdivd	%f2, %f16, %f16
	pdist %f6, %f14, %f28
	.word 0x9bb44300  ! 90: ALIGNADDRESS	alignaddr	%r17, %r0, %r13
change_to_randtl_4_53:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_53:
	.word 0x8f902002  ! 91: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_4_54:
	tsubcctv %r3, 0x103b, %r24
	.word 0xd407f27b  ! 92: LDUW_I	lduw	[%r31 + 0xfffff27b], %r10
	setx 0x60b04f0fa011ec02, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_55:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_56:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d924001  ! 94: WRPR_WSTATE_R	wrpr	%r9, %r1, %wstate
	.word 0xa1902001  ! 95: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_hpstate_4_57:
	.word 0x81982b64  ! 96: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b64, %hpstate
	.word 0x8d902883  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x0883, %pstate
	.word 0x8780208b  ! 98: WRASI_I	wr	%r0, 0x008b, %asi
splash_lsu_4_58:
	setx 0x49f74531b306f219, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 99: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_4_59:
	nop
	setx 0xfffff303fffffbc4, %g1, %g7
	.word 0xa3800007  ! 100: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd497e000  ! 101: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_60:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 102: CASA_R	casa	[%r31] %asi, %r2, %r10
	.word 0xa7822a6d  ! 103: WR_GRAPHICS_STATUS_REG_I	wr	%r8, 0x0a6d, %-
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 104: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 105: LDX_R	ldx	[%r31 + %r0], %r10
memptr_4_61:
	set 0x60340000, %r31
	.word 0x8582334b  ! 106: WRCCR_I	wr	%r8, 0x134b, %ccr
	.word 0x87902271  ! 107: WRPR_TT_I	wrpr	%r0, 0x0271, %tt
change_to_randtl_4_62:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_62:
	.word 0x8f902002  ! 108: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	setx 0x5f11af055410b376, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_63:
	.word 0x39400001  ! 109: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879020f8  ! 110: WRPR_TT_I	wrpr	%r0, 0x00f8, %tt
debug_4_64:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 111: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99a00164  ! 112: FABSq	dis not found

debug_4_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 113: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
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
	.word 0x93414000  ! 114: RDPC	rd	%pc, %r9
splash_lsu_4_67:
	setx 0x1143047e535e8a3f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 115: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_4_68:
	setx 0xac918e822c471993, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 116: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879023fb  ! 117: WRPR_TT_I	wrpr	%r0, 0x03fb, %tt
	.word 0x81460000  ! 118: RD_STICK_REG	stbar
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 119: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_4_69:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d90000b  ! 120: WRPR_WSTATE_R	wrpr	%r0, %r11, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_70) + 0, 16, 16)) -> intp(6,0,31)
intvec_4_70:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_71:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 122: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
intveclr_4_72:
	setx 0x48ab39416da25a12, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 123: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd0d7e030  ! 124: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	setx 0x07709ec51b39f1a6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_73:
	.word 0x39400001  ! 125: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_74)+0, 16, 16)) -> intp(4,1,3)
xir_4_74:
	.word 0xa9847a6d  ! 126: WR_SET_SOFTINT_I	wr	%r17, 0x1a6d, %set_softint
	.word 0xd0d804a0  ! 127: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_75)+48, 16, 16)) -> intp(4,1,3)
xir_4_75:
	.word 0xa982295f  ! 128: WR_SET_SOFTINT_I	wr	%r8, 0x095f, %set_softint
splash_lsu_4_76:
	setx 0xe7be6f51b0098609, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 129: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 130: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_lsu_4_77:
	setx 0x9b94b12a7701cde7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 131: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_4_78:
	set user_data_start, %r31
	.word 0x858463cc  ! 132: WRCCR_I	wr	%r17, 0x03cc, %ccr
change_to_randtl_4_79:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_79:
	.word 0x8f902000  ! 133: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x87902096  ! 134: WRPR_TT_I	wrpr	%r0, 0x0096, %tt
	.word 0x8d802000  ! 135: WRFPRS_I	wr	%r0, 0x0000, %fprs
	rd %pc, %r19
	add %r19, (ivw_4_80-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_80:
	.word 0x9191000c  ! 136: WRPR_PIL_R	wrpr	%r4, %r12, %pil
cwp_4_81:
    set user_data_start, %o7
	.word 0x93902001  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d903c5b  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x1c5b, %pstate
	.word 0xa5454000  ! 139: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0xe6d80e40  ! 140: LDXA_R	ldxa	[%r0, %r0] 0x72, %r19
	.word 0xa8ac400c  ! 141: ANDNcc_R	andncc 	%r17, %r12, %r20
debug_4_82:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 142: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902001  ! 143: WRPR_GL_I	wrpr	%r0, 0x0001, %-
memptr_4_83:
	set 0x60140000, %r31
	.word 0x8580318b  ! 144: WRCCR_I	wr	%r0, 0x118b, %ccr
	.word 0x90fc2062  ! 145: SDIVcc_I	sdivcc 	%r16, 0x0062, %r8
	.word 0x91520000  ! 146: RDPR_PIL	<illegal instruction>
DS_4_84:
	.word 0xa1a0c9d4  ! 1: FDIVd	fdivd	%f34, %f20, %f16
	.word 0xe9340013  ! 1: STQF_R	-	%f20, [%r19, %r16]
	normalw
	.word 0x93458000  ! 147: RD_SOFTINT_REG	rd	%softint, %r9
splash_cmpr_4_85:
	setx 0x6aee4bb2dca03c02, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 148: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_4_86:
	setx 0xdde03ff2a70a73ff, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 149: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd89fe4db  ! 150: LDDA_I	ldda	[%r31, + 0x04db] %asi, %r12
debug_4_87:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_87:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_87
    nop
debug_wait4_87:
    ld [%r23], %r16
    brnz %r16, debug_wait4_87
    nop
    ba,a debug_startwait4_87
continue_debug_4_87:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_87:
    cmp %r13, %r15
    bne,a wait_for_stat_4_87
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_87:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_87
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00492  ! 151: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b68a26c  ! 152: SDIVX_I	sdivx	%r2, 0x026c, %r13
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_89:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 153: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x3a800001  ! 154: BCC	bcc,a	<label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 155: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97500000  ! 156: RDPR_TPC	<illegal instruction>
intveclr_4_90:
	setx 0xf542549ed3f5344e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 157: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
memptr_4_91:
	set 0x60340000, %r31
	.word 0x85832f41  ! 159: WRCCR_I	wr	%r12, 0x0f41, %ccr
	rd %pc, %r19
	add %r19, (ivw_4_92-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_92:
	.word 0x9195000b  ! 160: WRPR_PIL_R	wrpr	%r20, %r11, %pil
	.word 0x87802004  ! 161: WRASI_I	wr	%r0, 0x0004, %asi
debug_4_93:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_93:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_93
    nop
debug_wait4_93:
    ld [%r23], %r16
    brnz %r16, debug_wait4_93
    nop
    ba,a debug_startwait4_93
continue_debug_4_93:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_93:
    cmp %r13, %r15
    bne,a wait_for_stat_4_93
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_93:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_93
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00492  ! 162: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0x83d020b5  ! 163: Tcc_I	te	icc_or_xcc, %r0 + 181
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 164: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200a  ! 165: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xab802c19  ! 166: WR_CLEAR_SOFTINT_I	wr	%r0, 0x0c19, %clear_softint
	.word 0xd61fc000  ! 167: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x8d802000  ! 168: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_4_94:
	setx 0x9c8013db0a510559, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 169: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_4_95:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_95-donret_4_95-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_95:
	.word 0xd6ffe189  ! 170: SWAPA_I	swapa	%r11, [%r31 + 0x0189] %asi
DS_4_96:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa35c6b68	! Random illegal ?
	.word 0x91a489cc  ! 1: FDIVd	fdivd	%f18, %f12, %f8
	.word 0x99a14823  ! 171: FADDs	fadds	%f5, %f3, %f12
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 172: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 173: BNE	bne,a	<label_0x1>
	.word 0x879021a8  ! 174: WRPR_TT_I	wrpr	%r0, 0x01a8, %tt
	.word 0x879021be  ! 175: WRPR_TT_I	wrpr	%r0, 0x01be, %tt
DS_4_97:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd1340007  ! 1: STQF_R	-	%f8, [%r7, %r16]
	normalw
	.word 0xa9458000  ! 176: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0xd6800b60  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r11
debug_4_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 178: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x95500000  ! 179: RDPR_TPC	rdpr	%tpc, %r10
intveclr_4_99:
	setx 0xadd8257da54a595b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x968073c5  ! 181: ADDcc_I	addcc 	%r1, 0xfffff3c5, %r11
pmu_4_100:
	nop
	setx 0xfffff7ccfffff42b, %g1, %g7
	.word 0xa3800007  ! 182: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_4_101:
	setx 0x1476629b85db53fc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xdb37e256  ! 184: STQF_I	-	%f13, [0x0256, %r31]
	.word 0xa1902004  ! 185: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_cmpr_4_102:
	setx 0xfbbd819785ed1467, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 186: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa368aff2  ! 187: SDIVX_I	sdivx	%r2, 0x0ff2, %r17
change_to_randtl_4_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_104:
	.word 0x8f902001  ! 188: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	setx 0x800820ea77f2a5e8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_105:
	.word 0x39400001  ! 189: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xdbe7e00d  ! 190: CASA_R	casa	[%r31] %asi, %r13, %r13
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_107
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_107:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 191: RDPC	rd	%pc, %r9
	.word 0x99902001  ! 192: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_108
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_108:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 193: RDPC	rd	%pc, %r11
	.word 0x91d02032  ! 194: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa9500000  ! 195: RDPR_TPC	<illegal instruction>
	.word 0xa7820003  ! 196: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r3, %-
	.word 0x9ba349f3  ! 197: FDIVq	dis not found

splash_htba_4_110:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 198: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d90274e  ! 199: WRPR_PSTATE_I	wrpr	%r0, 0x074e, %pstate
DS_4_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x99b2c304  ! 200: ALIGNADDRESS	alignaddr	%r11, %r4, %r12
	.word 0xe737f018  ! 201: STQF_I	-	%f19, [0x1018, %r31]
memptr_4_112:
	set 0x60140000, %r31
	.word 0x85816831  ! 202: WRCCR_I	wr	%r5, 0x0831, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 203: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x93464000  ! 204: RD_STICK_CMPR_REG	rd	%-, %r9
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_113
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_113:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 205: RDPC	rd	%pc, %r9
	.word 0xd6800a80  ! 206: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r11
	rd %pc, %r19
	add %r19, (ivw_4_114-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_114:
	.word 0x91950008  ! 207: WRPR_PIL_R	wrpr	%r20, %r8, %pil
debug_4_115:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 208: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d802000  ! 209: WRFPRS_I	wr	%r0, 0x0000, %fprs
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
	.word 0x97414000  ! 210: RDPC	rd	%pc, %r11
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_117
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_117
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_117:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 211: RDPC	rd	%pc, %r13
tagged_4_118:
	tsubcctv %r6, 0x1b06, %r8
	.word 0xe807f954  ! 212: LDUW_I	lduw	[%r31 + 0xfffff954], %r20
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_119
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_119
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_119:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 213: RDPC	rd	%pc, %r12
	.word 0x87802010  ! 214: WRASI_I	wr	%r0, 0x0010, %asi
mondo_4_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d94800a  ! 215: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
	.word 0xa7464000  ! 216: RD_STICK_CMPR_REG	rd	%-, %r19
	.word 0x91d02035  ! 217: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_hpstate_4_121:
	.word 0x81982007  ! 218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0007, %hpstate
splash_hpstate_4_122:
	.word 0x81982445  ! 219: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0445, %hpstate
DS_4_123:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe734f230  ! 1: STQF_I	-	%f19, [0x1230, %r19]
	normalw
	.word 0x97458000  ! 220: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x8780204f  ! 221: WRASI_I	wr	%r0, 0x004f, %asi
change_to_randtl_4_124:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_124:
	.word 0x8f902000  ! 222: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_4_125:
	setx 0xbe8af9b8503e8bad, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa984c001  ! 224: WR_SET_SOFTINT_R	wr	%r19, %r1, %set_softint
cwp_4_126:
    set user_data_start, %o7
	.word 0x93902001  ! 225: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
memptr_4_127:
	set 0x60540000, %r31
	.word 0x858375a1  ! 226: WRCCR_I	wr	%r13, 0x15a1, %ccr
	.word 0x83d020b3  ! 227: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0x36800001  ! 228: BGE	bge,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_128) + 32, 16, 16)) -> intp(4,0,1)
intvec_4_128:
	.word 0x39400001  ! 229: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_129:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x9ba489d1  ! 1: FDIVd	fdivd	%f18, %f48, %f44
	normalw
	.word 0xa3458000  ! 230: RD_SOFTINT_REG	rd	%softint, %r17
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
	.word 0xd1e7e00d  ! 231: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0xd08008a0  ! 232: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd04fc000  ! 233: LDSB_R	ldsb	[%r31 + %r0], %r8
	.word 0xab847a16  ! 234: WR_CLEAR_SOFTINT_I	wr	%r17, 0x1a16, %clear_softint
	.word 0x81460000  ! 235: RD_STICK_REG	stbar
	.word 0xd0d004a0  ! 236: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 237: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x99902000  ! 238: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x8d9029bb  ! 239: WRPR_PSTATE_I	wrpr	%r0, 0x09bb, %pstate
	.word 0x9b540000  ! 240: RDPR_GL	<illegal instruction>
splash_lsu_4_132:
	setx 0x8139c9b60851dba5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 241: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903a1d  ! 242: WRPR_PSTATE_I	wrpr	%r0, 0x1a1d, %pstate
	.word 0xd08fe030  ! 243: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r8
	.word 0xd04ff3f2  ! 244: LDSB_I	ldsb	[%r31 + 0xfffff3f2], %r8
mondo_4_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d900011  ! 245: WRPR_WSTATE_R	wrpr	%r0, %r17, %wstate
	.word 0x8d802000  ! 246: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_4_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 247: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_4_135:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_135:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_135
    nop
debug_wait4_135:
    ld [%r23], %r16
    brnz %r16, debug_wait4_135
    nop
    ba,a debug_startwait4_135
continue_debug_4_135:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_135:
    cmp %r13, %r15
    bne,a wait_for_stat_4_135
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_135:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_135
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd8f00492  ! 248: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0x2e700001  ! 249: BPVS	<illegal instruction>
	.word 0x93a00171  ! 250: FABSq	dis not found

splash_tba_4_136:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 251: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x93d02033  ! 252: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_cmpr_4_137:
	setx 0xbb6bcf07e9881b6a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
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
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00492  ! 254: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	.word 0xda7ff3f2  ! 255: SWAP_I	swap	%r13, [%r31 + 0xfffff3f2]
tagged_4_139:
	taddcctv %r12, 0x1dc1, %r14
	.word 0xda07f3f2  ! 256: LDUW_I	lduw	[%r31 + 0xfffff3f2], %r13
	.word 0x3a800001  ! 257: BCC	bcc,a	<label_0x1>
tagged_4_140:
	tsubcctv %r24, 0x1e44, %r20
	.word 0xda07f3f2  ! 258: LDUW_I	lduw	[%r31 + 0xfffff3f2], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 259: LDX_R	ldx	[%r31 + %r0], %r13
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_141
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_141:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 260: CASA_R	casa	[%r31] %asi, %r8, %r13
	.word 0xda3ff3f2  ! 261: STD_I	std	%r13, [%r31 + 0xfffff3f2]
	.word 0xdac004a0  ! 262: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0x91d020b2  ! 263: Tcc_I	ta	icc_or_xcc, %r0 + 178
mondo_4_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d92400a  ! 264: WRPR_WSTATE_R	wrpr	%r9, %r10, %wstate
	.word 0xdabff3f2  ! 265: STDA_I	stda	%r13, [%r31 + 0xfffff3f2] %asi
	.word 0xda8804a0  ! 266: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
mondo_4_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d950009  ! 267: WRPR_WSTATE_R	wrpr	%r20, %r9, %wstate
	.word 0xda3ff3f2  ! 268: STD_I	std	%r13, [%r31 + 0xfffff3f2]
	.word 0xa985000b  ! 269: WR_SET_SOFTINT_R	wr	%r20, %r11, %set_softint
	.word 0x8d9028a8  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x08a8, %pstate
	.word 0x8d9036ec  ! 271: WRPR_PSTATE_I	wrpr	%r0, 0x16ec, %pstate
	.word 0x20700001  ! 272: BPN	<illegal instruction>
	.word 0xda900e60  ! 273: LDUHA_R	lduha	[%r0, %r0] 0x73, %r13
debug_4_144:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_144:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_144
    nop
debug_wait4_144:
    ld [%r23], %r16
    brnz %r16, debug_wait4_144
    nop
    ba,a debug_startwait4_144
continue_debug_4_144:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_144:
    cmp %r13, %r15
    bne,a wait_for_stat_4_144
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_144:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_144
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00492  ! 274: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_145)+32, 16, 16)) -> intp(4,1,3)
xir_4_145:
	.word 0xa980e759  ! 275: WR_SET_SOFTINT_I	wr	%r3, 0x0759, %set_softint
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_146
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_146:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00b  ! 276: CASA_R	casa	[%r31] %asi, %r11, %r13
	.word 0x91d020b5  ! 277: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xa190200f  ! 278: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xda37ef7c  ! 279: STH_I	sth	%r13, [%r31 + 0x0f7c]
	.word 0xda77c000  ! 280: STX_R	stx	%r13, [%r31 + %r0]
pmu_4_147:
	nop
	setx 0xfffffb9dfffff44e, %g1, %g7
	.word 0xa3800007  ! 281: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b2  ! 282: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x3e800001  ! 283: BVC	bvc,a	<label_0x1>
	.word 0x2c700001  ! 284: BPNEG	<illegal instruction>
	.word 0xdadfe020  ! 285: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r13
	.word 0x8d903041  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x1041, %pstate
splash_tba_4_148:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 287: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_4_149:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 288: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 289: LDX_R	ldx	[%r31 + %r0], %r13
debug_4_150:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_150:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_150
    nop
debug_wait4_150:
    ld [%r23], %r16
    brnz %r16, debug_wait4_150
    nop
    ba,a debug_startwait4_150
continue_debug_4_150:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_150:
    cmp %r13, %r15
    bne,a wait_for_stat_4_150
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_150:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_150
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00492  ! 290: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0xda8804a0  ! 291: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x8d903552  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x1552, %pstate
	.word 0x91d02033  ! 293: Tcc_I	ta	icc_or_xcc, %r0 + 51
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 294: LDX_R	ldx	[%r31 + %r0], %r13
tagged_4_151:
	taddcctv %r15, 0x1f17, %r10
	.word 0xda07ef7c  ! 295: LDUW_I	lduw	[%r31 + 0x0f7c], %r13
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 296: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xdb3fc000  ! 297: STDF_R	std	%f13, [%r0, %r31]
	.word 0xdac7e010  ! 298: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r13
DS_4_152:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa9a209c2  ! 1: FDIVd	fdivd	%f8, %f2, %f20
	normalw
	.word 0x97458000  ! 299: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xa782c012  ! 300: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r18, %-
mondo_4_154:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94c007  ! 301: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
	.word 0xd8d7e020  ! 302: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_155
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_155:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 303: RDPC	rd	%pc, %r11
	.word 0x87802020  ! 304: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x81510000  ! 305: RDPR_TICK	rdpr	%tick, %r0
	.word 0xa1902009  ! 306: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 307: Tcc_R	te	icc_or_xcc, %r0 + %r30
change_to_randtl_4_156:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_156:
	.word 0x8f902002  ! 308: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
memptr_4_157:
	set 0x60140000, %r31
	.word 0x858335a8  ! 309: WRCCR_I	wr	%r12, 0x15a8, %ccr
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 310: Tcc_R	te	icc_or_xcc, %r0 + %r30
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
	.word 0xd1e7e010  ! 311: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976cae76  ! 312: SDIVX_I	sdivx	%r18, 0x0e76, %r11
splash_lsu_4_160:
	setx 0xda6a875aaff95cb9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 313: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f803d9f  ! 314: SIR	sir	0x1d9f
cwp_4_161:
    set user_data_start, %o7
	.word 0x93902000  ! 315: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd897e010  ! 316: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
debug_4_162:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_162:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_162
    nop
debug_wait4_162:
    ld [%r23], %r16
    brnz %r16, debug_wait4_162
    nop
    ba,a debug_startwait4_162
continue_debug_4_162:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_162:
    cmp %r13, %r15
    bne,a wait_for_stat_4_162
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_162:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_162
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 317: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_4_163:
	.word 0x81982b0e  ! 319: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0e, %hpstate
splash_cmpr_4_164:
	setx 0x1c7e618958bb9b06, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 320: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8c004a0  ! 321: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
tagged_4_165:
	taddcctv %r2, 0x179b, %r26
	.word 0xd807ee27  ! 322: LDUW_I	lduw	[%r31 + 0x0e27], %r12
debug_4_166:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 323: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd897e000  ! 324: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
splash_cmpr_4_167:
	setx 0xf1632157e5050a99, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 325: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_168:
	setx 0x49b14e036d0cd9cc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802f8e  ! 327: SIR	sir	0x0f8e
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_169
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_169:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 328: CASA_R	casa	[%r31] %asi, %r16, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_170) + 32, 16, 16)) -> intp(3,0,5)
intvec_4_170:
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_171:
	.word 0x8198281c  ! 330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081c, %hpstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_172
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_172:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 331: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x8780201c  ! 332: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8780204f  ! 333: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x97a0016c  ! 334: FABSq	dis not found

debug_4_173:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 335: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x3e700001  ! 336: BPVC	<illegal instruction>
	.word 0xa1902009  ! 337: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d90283d  ! 338: WRPR_PSTATE_I	wrpr	%r0, 0x083d, %pstate
debug_4_174:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_174:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_174
    nop
debug_wait4_174:
    ld [%r23], %r16
    brnz %r16, debug_wait4_174
    nop
    ba,a debug_startwait4_174
continue_debug_4_174:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_174:
    cmp %r13, %r15
    bne,a wait_for_stat_4_174
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_174:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_174
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd8f00492  ! 339: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
DS_4_175:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 340: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_4_176-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_176:
	.word 0x91920007  ! 341: WRPR_PIL_R	wrpr	%r8, %r7, %pil
	.word 0xd28fe010  ! 342: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r9
splash_hpstate_4_177:
	.word 0x81982205  ! 343: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0205, %hpstate
	.word 0x879023f0  ! 344: WRPR_TT_I	wrpr	%r0, 0x03f0, %tt
DS_4_178:
	.word 0xa7a2c9c4  ! 1: FDIVd	fdivd	%f42, %f4, %f50
	pdist %f0, %f24, %f26
	.word 0x91b18300  ! 345: ALIGNADDRESS	alignaddr	%r6, %r0, %r8
cwp_4_179:
    set user_data_start, %o7
	.word 0x93902006  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_180) + 56, 16, 16)) -> intp(6,0,23)
intvec_4_180:
	.word 0x39400001  ! 347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_4_181:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 348: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93d02035  ! 349: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01971  ! 350: FqTOd	dis not found

	.word 0xd2d804a0  ! 351: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
splash_lsu_4_183:
	setx 0x6d268447ff05b091, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 352: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd2c004a0  ! 353: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 354: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902003  ! 355: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_cmpr_4_184:
	setx 0x060997e2af058017, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 356: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_4_185:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_185:
	.word 0x8f902002  ! 357: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
cwp_4_186:
    set user_data_start, %o7
	.word 0x93902004  ! 358: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_4_187:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 359: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802089  ! 360: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x91d02035  ! 361: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd297e030  ! 362: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r9
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_188
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_188
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_188:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 363: RDPC	rd	%pc, %r16
DS_4_189:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd734c012  ! 1: STQF_R	-	%f11, [%r18, %r19]
	normalw
	.word 0x95458000  ! 364: RD_SOFTINT_REG	rd	%softint, %r10
memptr_4_190:
	set 0x60340000, %r31
	.word 0x8581f55d  ! 365: WRCCR_I	wr	%r7, 0x155d, %ccr
	.word 0x2c800001  ! 366: BNEG	bneg,a	<label_0x1>
	.word 0xa982400c  ! 367: WR_SET_SOFTINT_R	wr	%r9, %r12, %set_softint
	.word 0x95a2c9d4  ! 368: FDIVd	fdivd	%f42, %f20, %f10
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_191
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_191:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 369: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x87802058  ! 370: WRASI_I	wr	%r0, 0x0058, %asi
tagged_4_192:
	tsubcctv %r24, 0x18af, %r2
	.word 0xe407e3c5  ! 371: LDUW_I	lduw	[%r31 + 0x03c5], %r18
	.word 0xe5e7c033  ! 372: CASA_I	casa	[%r31] 0x 1, %r19, %r18
splash_cmpr_4_193:
	setx 0xc124373c79e4f880, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 373: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_4_194:
	tsubcctv %r12, 0x1f85, %r14
	.word 0xe407e3c5  ! 374: LDUW_I	lduw	[%r31 + 0x03c5], %r18
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_195
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_195
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_195:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 375: RDPC	rd	%pc, %r12
DS_4_196:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xfd676b4c	! Random illegal ?
	.word 0xa7a489d1  ! 1: FDIVd	fdivd	%f18, %f48, %f50
	.word 0x99a5082d  ! 376: FADDs	fadds	%f20, %f13, %f12
	.word 0x8d9023ee  ! 377: WRPR_PSTATE_I	wrpr	%r0, 0x03ee, %pstate
mondo_4_197:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d90800a  ! 378: WRPR_WSTATE_R	wrpr	%r2, %r10, %wstate
	.word 0xab822f42  ! 379: WR_CLEAR_SOFTINT_I	wr	%r8, 0x0f42, %clear_softint
	.word 0x879020af  ! 380: WRPR_TT_I	wrpr	%r0, 0x00af, %tt
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
	.word 0x9b414000  ! 381: RDPC	rd	%pc, %r13
	.word 0x28800001  ! 382: BLEU	bleu,a	<label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7687583  ! 383: SDIVX_I	sdivx	%r1, 0xfffff583, %r19
	.word 0x87902004  ! 384: WRPR_TT_I	wrpr	%r0, 0x0004, %tt
donret_4_200:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_200-donret_4_200), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_200:
	.word 0xe8fff393  ! 385: SWAPA_I	swapa	%r20, [%r31 + 0xfffff393] %asi
debug_4_201:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_201:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_201
    nop
debug_wait4_201:
    ld [%r23], %r16
    brnz %r16, debug_wait4_201
    nop
    ba,a debug_startwait4_201
continue_debug_4_201:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_201:
    cmp %r13, %r15
    bne,a wait_for_stat_4_201
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_201:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_201
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd8f00492  ! 386: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 387: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_tba_4_202:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 388: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe937f393  ! 389: STQF_I	-	%f20, [0x1393, %r31]
	.word 0x87802016  ! 390: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xe88008a0  ! 391: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
tagged_4_203:
	taddcctv %r8, 0x1ca7, %r6
	.word 0xe807f393  ! 392: LDUW_I	lduw	[%r31 + 0xfffff393], %r20
debug_4_204:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_204:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_204
    nop
debug_wait4_204:
    ld [%r23], %r16
    brnz %r16, debug_wait4_204
    nop
    ba,a debug_startwait4_204
continue_debug_4_204:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_204:
    cmp %r13, %r15
    bne,a wait_for_stat_4_204
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_204:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_204
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00492  ! 393: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
memptr_4_205:
	set 0x60340000, %r31
	.word 0x858139a6  ! 394: WRCCR_I	wr	%r4, 0x19a6, %ccr
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 395: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xab843858  ! 396: WR_CLEAR_SOFTINT_I	wr	%r16, 0x1858, %clear_softint
	.word 0xe8cfe030  ! 397: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r20
	.word 0xe8d004a0  ! 398: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
	.word 0x9f803f1b  ! 399: SIR	sir	0x1f1b
tagged_4_206:
	tsubcctv %r23, 0x1f3a, %r5
	.word 0xe807f1a5  ! 400: LDUW_I	lduw	[%r31 + 0xfffff1a5], %r20
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
tagged_3_1:
	taddcctv %r26, 0x1ab6, %r13
	.word 0xd007f228  ! 1: LDUW_I	lduw	[%r31 + 0xfffff228], %r8
splash_cmpr_3_2:
	setx 0x7f4430e3d1df0fb1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 2: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd0ffc028  ! 3: SWAPA_R	swapa	%r8, [%r31 + %r8] 0x01
DS_3_3:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa3a00545  ! 1: FSQRTd	fsqrt	
	.word 0x93a28822  ! 4: FADDs	fadds	%f10, %f2, %f9
	.word 0xd68804a0  ! 5: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_4) + 16, 16, 16)) -> intp(1,0,4)
intvec_3_4:
	.word 0x39400001  ! 6: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_3_5:
	setx 0x6afc9207ea096deb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 7: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd68804a0  ! 8: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
intveclr_3_6:
	setx 0x86510228240f5233, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 9: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_3_7:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f12, %f26, %f28
	.word 0x91b24313  ! 10: ALIGNADDRESS	alignaddr	%r9, %r19, %r8
	.word 0xa1902008  ! 11: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01972  ! 12: FqTOd	dis not found

	setx 0xf19b16f77cbc1a14, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_9:
	.word 0x39400001  ! 13: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 14: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 15: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6c80e60  ! 16: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 17: LDX_R	ldx	[%r31 + %r0], %r11
splash_hpstate_3_10:
	.word 0x81982384  ! 18: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0384, %hpstate
	.word 0xa9480000  ! 19: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
intveclr_3_11:
	setx 0x87006a22ba94af14, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_3_12:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 21: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_3_13:
	setx 0x050efa3a58d14057, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 22: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3a800001  ! 23: BCC	bcc,a	<label_0x1>
DS_3_14:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f26, %f26, %f12
	.word 0x95b1c305  ! 24: ALIGNADDRESS	alignaddr	%r7, %r5, %r10
	.word 0x87802080  ! 25: WRASI_I	wr	%r0, 0x0080, %asi
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_15:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 26: CASA_R	casa	[%r31] %asi, %r3, %r11
splash_cmpr_3_16:
	setx 0x66db63121bd1d25e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 27: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 28: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x899256ae8afce5d4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_17:
	.word 0x39400001  ! 29: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_3_18:
	set user_data_start, %r31
	.word 0x85852c45  ! 30: WRCCR_I	wr	%r20, 0x0c45, %ccr
DS_3_19:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 31: SAVE_R	save	%r31, %r0, %r31
mondo_3_20:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d944001  ! 32: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
	.word 0xab833cc7  ! 33: WR_CLEAR_SOFTINT_I	wr	%r12, 0x1cc7, %clear_softint
	.word 0xd68008a0  ! 34: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_3_21:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa7a489d3  ! 1: FDIVd	fdivd	%f18, %f50, %f50
	.word 0xa7a00543  ! 1: FSQRTd	fsqrt	
	.word 0xa9a40832  ! 35: FADDs	fadds	%f16, %f18, %f20
splash_cmpr_3_22:
	setx 0xf19767c3d62939ef, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 36: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_23:
	setx 0x173fda952488d67a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 37: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_3_24:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 38: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xab818001  ! 39: WR_CLEAR_SOFTINT_R	wr	%r6, %r1, %clear_softint
	.word 0x99a409c3  ! 40: FDIVd	fdivd	%f16, %f34, %f12
	.word 0xa190200a  ! 41: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9169f568  ! 42: SDIVX_I	sdivx	%r7, 0xfffff568, %r8
	.word 0x8d902341  ! 43: WRPR_PSTATE_I	wrpr	%r0, 0x0341, %pstate
intveclr_3_26:
	setx 0xba39e837fef8eb42, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 44: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_27:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e000  ! 45: CASA_R	casa	[%r31] %asi, %r0, %r12
	.word 0xd93ffa99  ! 46: STDF_I	std	%f12, [0x1a99, %r31]
splash_tba_3_28:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 47: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_3_29:
	setx 0x9018e79b00d1f715, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 48: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_30
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_30:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 49: RDPC	rd	%pc, %r11
	.word 0x87802016  ! 50: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x9f802f55  ! 51: SIR	sir	0x0f55
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9569752b  ! 52: SDIVX_I	sdivx	%r5, 0xfffff52b, %r10
debug_3_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 53: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa169a6bb  ! 54: SDIVX_I	sdivx	%r6, 0x06bb, %r16
	rd %pc, %r19
	add %r19, (ivw_3_34-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_34:
	.word 0x9192800d  ! 55: WRPR_PIL_R	wrpr	%r10, %r13, %pil
mondo_3_35:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d91800d  ! 56: WRPR_WSTATE_R	wrpr	%r6, %r13, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_36) + 8, 16, 16)) -> intp(7,0,6)
intvec_3_36:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_3_37:
	.word 0x81982e8e  ! 58: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8e, %hpstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_38:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 59: CASA_R	casa	[%r31] %asi, %r17, %r12
intveclr_3_39:
	setx 0x5c77fc0e239e3092, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 60: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x906c8012  ! 61: UDIVX_R	udivx 	%r18, %r18, %r8
	.word 0x93d020b3  ! 62: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0xab8424e7  ! 63: WR_CLEAR_SOFTINT_I	wr	%r16, 0x04e7, %clear_softint
mondo_3_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d94400c  ! 64: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_41:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 65: CASA_R	casa	[%r31] %asi, %r11, %r9
debug_3_42:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 66: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0xa9834014  ! 67: WR_SET_SOFTINT_R	wr	%r13, %r20, %set_softint
	.word 0x8790226d  ! 68: WRPR_TT_I	wrpr	%r0, 0x026d, %tt
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
	.word 0x95414000  ! 69: RDPC	rd	%pc, %r10
	.word 0xe06ff27b  ! 70: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffff27b]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 71: LDX_R	ldx	[%r31 + %r0], %r16
debug_3_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 72: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_3_45:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 73: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0xe08fe030  ! 74: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r16
	.word 0x9b520000  ! 75: RDPR_PIL	<illegal instruction>
tagged_3_46:
	tsubcctv %r15, 0x1975, %r23
	.word 0xe407f27b  ! 76: LDUW_I	lduw	[%r31 + 0xfffff27b], %r18
intveclr_3_47:
	setx 0xadc3b6e20cdb4fcd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93d02035  ! 78: Tcc_I	tne	icc_or_xcc, %r0 + 53
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_48
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_48:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 79: RDPC	rd	%pc, %r13
	.word 0xe31ff27b  ! 80: LDDF_I	ldd	[%r31, 0x127b], %f17
	.word 0xe28008a0  ! 81: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe28fe000  ! 82: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r17
	.word 0xe28008a0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x83d02035  ! 84: Tcc_I	te	icc_or_xcc, %r0 + 53
pmu_3_49:
	nop
	setx 0xfffffe0afffffab7, %g1, %g7
	.word 0xa3800007  ! 85: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe2c804a0  ! 86: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_50
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_50
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_50:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 87: RDPC	rd	%pc, %r8
	rd %pc, %r19
	add %r19, (ivw_3_51-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_51:
	.word 0x91924004  ! 88: WRPR_PIL_R	wrpr	%r9, %r4, %pil
	.word 0x8780201c  ! 89: WRASI_I	wr	%r0, 0x001c, %asi
DS_3_52:
	.word 0x99a349d3  ! 1: FDIVd	fdivd	%f44, %f50, %f12
	pdist %f24, %f18, %f28
	.word 0x99b40306  ! 90: ALIGNADDRESS	alignaddr	%r16, %r6, %r12
change_to_randtl_3_53:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_53:
	.word 0x8f902002  ! 91: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_3_54:
	tsubcctv %r22, 0x1680, %r12
	.word 0xd407f27b  ! 92: LDUW_I	lduw	[%r31 + 0xfffff27b], %r10
	setx 0x03f9f327e215a8eb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_55:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_3_56:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d94800d  ! 94: WRPR_WSTATE_R	wrpr	%r18, %r13, %wstate
	.word 0xa1902005  ! 95: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_hpstate_3_57:
	.word 0x81982d5d  ! 96: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5d, %hpstate
	.word 0x8d902905  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x0905, %pstate
	.word 0x87802055  ! 98: WRASI_I	wr	%r0, 0x0055, %asi
splash_lsu_3_58:
	setx 0xfc52bad3dc547f65, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 99: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_3_59:
	nop
	setx 0xfffffdbafffffc03, %g1, %g7
	.word 0xa3800007  ! 100: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd497e020  ! 101: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_60:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 102: CASA_R	casa	[%r31] %asi, %r2, %r10
	.word 0xa7803aeb  ! 103: WR_GRAPHICS_STATUS_REG_I	wr	%r0, 0x1aeb, %-
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 104: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 105: LDX_R	ldx	[%r31 + %r0], %r10
memptr_3_61:
	set 0x60340000, %r31
	.word 0x8583632e  ! 106: WRCCR_I	wr	%r13, 0x032e, %ccr
	.word 0x87902275  ! 107: WRPR_TT_I	wrpr	%r0, 0x0275, %tt
change_to_randtl_3_62:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_62:
	.word 0x8f902000  ! 108: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	setx 0x28d130d0f80400e9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_63:
	.word 0x39400001  ! 109: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790231d  ! 110: WRPR_TT_I	wrpr	%r0, 0x031d, %tt
debug_3_64:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 111: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x97a00174  ! 112: FABSq	dis not found

debug_3_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 113: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_66
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_66:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 114: RDPC	rd	%pc, %r8
splash_lsu_3_67:
	setx 0xeba1d19a9b91ead5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 115: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_3_68:
	setx 0x202fdcb1e9191491, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 116: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902334  ! 117: WRPR_TT_I	wrpr	%r0, 0x0334, %tt
	.word 0x81460000  ! 118: RD_STICK_REG	stbar
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 119: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_3_69:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d950010  ! 120: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_70) + 24, 16, 16)) -> intp(3,0,0)
intvec_3_70:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_3_71:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 122: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
intveclr_3_72:
	setx 0x7dc3741826f3897b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 123: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd0d7e030  ! 124: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	setx 0xc2613ddb4fa93db1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_73:
	.word 0x39400001  ! 125: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_74)+32, 16, 16)) -> intp(3,1,3)
xir_3_74:
	.word 0xa98162a3  ! 126: WR_SET_SOFTINT_I	wr	%r5, 0x02a3, %set_softint
	.word 0xd0d80e60  ! 127: LDXA_R	ldxa	[%r0, %r0] 0x73, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_75)+32, 16, 16)) -> intp(3,1,3)
xir_3_75:
	.word 0xa984b0dc  ! 128: WR_SET_SOFTINT_I	wr	%r18, 0x10dc, %set_softint
splash_lsu_3_76:
	setx 0x0061180550138621, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 129: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 130: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_lsu_3_77:
	setx 0x809acafc2c765e13, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 131: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_3_78:
	set user_data_start, %r31
	.word 0x85842d4a  ! 132: WRCCR_I	wr	%r16, 0x0d4a, %ccr
change_to_randtl_3_79:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_79:
	.word 0x8f902001  ! 133: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x879020c9  ! 134: WRPR_TT_I	wrpr	%r0, 0x00c9, %tt
	.word 0x8d802000  ! 135: WRFPRS_I	wr	%r0, 0x0000, %fprs
	rd %pc, %r19
	add %r19, (ivw_3_80-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_80:
	.word 0x9190400d  ! 136: WRPR_PIL_R	wrpr	%r1, %r13, %pil
cwp_3_81:
    set user_data_start, %o7
	.word 0x93902002  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902818  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x0818, %pstate
	.word 0x97454000  ! 139: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0xe6d80e40  ! 140: LDXA_R	ldxa	[%r0, %r0] 0x72, %r19
	.word 0x94aa8004  ! 141: ANDNcc_R	andncc 	%r10, %r4, %r10
debug_3_82:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 142: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902005  ! 143: WRPR_GL_I	wrpr	%r0, 0x0005, %-
memptr_3_83:
	set 0x60140000, %r31
	.word 0x8582f5c7  ! 144: WRCCR_I	wr	%r11, 0x15c7, %ccr
	.word 0x94fc7c56  ! 145: SDIVcc_I	sdivcc 	%r17, 0xfffffc56, %r10
	.word 0x9b520000  ! 146: RDPR_PIL	<illegal instruction>
DS_3_84:
	.word 0x97a489c3  ! 1: FDIVd	fdivd	%f18, %f34, %f42
	.word 0xd930c000  ! 1: STQF_R	-	%f12, [%r0, %r3]
	normalw
	.word 0x97458000  ! 147: RD_SOFTINT_REG	rd	%softint, %r11
splash_cmpr_3_85:
	setx 0x3cdf062cde6a31d3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 148: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_3_86:
	setx 0x6cb283bdb63c5303, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 149: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd89fe4db  ! 150: LDDA_I	ldda	[%r31, + 0x04db] %asi, %r12
debug_3_87:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 151: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa169676c  ! 152: SDIVX_I	sdivx	%r5, 0x076c, %r16
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_89:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 153: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x3a800001  ! 154: BCC	bcc,a	<label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 155: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9b500000  ! 156: RDPR_TPC	<illegal instruction>
intveclr_3_90:
	setx 0x4b608762779b6e31, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 157: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
memptr_3_91:
	set 0x60140000, %r31
	.word 0x8582b2d3  ! 159: WRCCR_I	wr	%r10, 0x12d3, %ccr
	rd %pc, %r19
	add %r19, (ivw_3_92-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_92:
	.word 0x9192c001  ! 160: WRPR_PIL_R	wrpr	%r11, %r1, %pil
	.word 0x87802004  ! 161: WRASI_I	wr	%r0, 0x0004, %asi
debug_3_93:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 162: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0x93d020b2  ! 163: Tcc_I	tne	icc_or_xcc, %r0 + 178
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 164: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902004  ! 165: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xab81a69d  ! 166: WR_CLEAR_SOFTINT_I	wr	%r6, 0x069d, %clear_softint
	.word 0xd61fc000  ! 167: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x8d802000  ! 168: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_3_94:
	setx 0x89abc906aaf06db9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 169: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_3_95:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_95-donret_3_95-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_95:
	.word 0xd6ffe189  ! 170: SWAPA_I	swapa	%r11, [%r31 + 0x0189] %asi
DS_3_96:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbb767081	! Random illegal ?
	.word 0x97a409c1  ! 1: FDIVd	fdivd	%f16, %f32, %f42
	.word 0x95a4c832  ! 171: FADDs	fadds	%f19, %f18, %f10
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 172: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 173: BNE	bne,a	<label_0x1>
	.word 0x8790219c  ! 174: WRPR_TT_I	wrpr	%r0, 0x019c, %tt
	.word 0x87902202  ! 175: WRPR_TT_I	wrpr	%r0, 0x0202, %tt
DS_3_97:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd534c009  ! 1: STQF_R	-	%f10, [%r9, %r19]
	normalw
	.word 0xa7458000  ! 176: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0xd68008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
debug_3_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 178: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93500000  ! 179: RDPR_TPC	rdpr	%tpc, %r9
intveclr_3_99:
	setx 0xa89834d96fb2605e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x988435d2  ! 181: ADDcc_I	addcc 	%r16, 0xfffff5d2, %r12
pmu_3_100:
	nop
	setx 0xfffffc62fffff1d2, %g1, %g7
	.word 0xa3800007  ! 182: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_3_101:
	setx 0xa9c465d47a570135, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xdb37e256  ! 184: STQF_I	-	%f13, [0x0256, %r31]
	.word 0xa1902006  ! 185: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_cmpr_3_102:
	setx 0x136ee9def9cb1754, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 186: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6b775f  ! 187: SDIVX_I	sdivx	%r13, 0xfffff75f, %r13
change_to_randtl_3_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_104:
	.word 0x8f902000  ! 188: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	setx 0x9ceaa2a6e1e8a229, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_105:
	.word 0x39400001  ! 189: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xdbe7e00d  ! 190: CASA_R	casa	[%r31] %asi, %r13, %r13
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_107
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_107:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 191: RDPC	rd	%pc, %r9
	.word 0x99902005  ! 192: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_108
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_108:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 193: RDPC	rd	%pc, %r16
	.word 0x91d02035  ! 194: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa5500000  ! 195: RDPR_TPC	<illegal instruction>
	.word 0xa7814012  ! 196: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r18, %-
	.word 0x9ba149f4  ! 197: FDIVq	dis not found

splash_htba_3_110:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 198: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d902374  ! 199: WRPR_PSTATE_I	wrpr	%r0, 0x0374, %pstate
DS_3_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa7b44308  ! 200: ALIGNADDRESS	alignaddr	%r17, %r8, %r19
	.word 0xe737f018  ! 201: STQF_I	-	%f19, [0x1018, %r31]
memptr_3_112:
	set 0x60540000, %r31
	.word 0x8580a3cd  ! 202: WRCCR_I	wr	%r2, 0x03cd, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 203: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xa5464000  ! 204: RD_STICK_CMPR_REG	rd	%-, %r18
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_113
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_113:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 205: RDPC	rd	%pc, %r13
	.word 0xd68008a0  ! 206: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	rd %pc, %r19
	add %r19, (ivw_3_114-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_114:
	.word 0x91930000  ! 207: WRPR_PIL_R	wrpr	%r12, %r0, %pil
debug_3_115:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 208: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d802004  ! 209: WRFPRS_I	wr	%r0, 0x0004, %fprs
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
	.word 0x91414000  ! 210: RDPC	rd	%pc, %r8
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_117
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_117
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_117:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 211: RDPC	rd	%pc, %r17
tagged_3_118:
	tsubcctv %r17, 0x1d1f, %r12
	.word 0xe807f954  ! 212: LDUW_I	lduw	[%r31 + 0xfffff954], %r20
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_119
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_119
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_119:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 213: RDPC	rd	%pc, %r9
	.word 0x87802058  ! 214: WRASI_I	wr	%r0, 0x0058, %asi
mondo_3_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d904005  ! 215: WRPR_WSTATE_R	wrpr	%r1, %r5, %wstate
	.word 0xa7464000  ! 216: RD_STICK_CMPR_REG	rd	%-, %r19
	.word 0x91d02034  ! 217: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_hpstate_3_121:
	.word 0x8198201e  ! 218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001e, %hpstate
splash_hpstate_3_122:
	.word 0x819823d5  ! 219: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d5, %hpstate
DS_3_123:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd9322b5a  ! 1: STQF_I	-	%f12, [0x0b5a, %r8]
	normalw
	.word 0xa9458000  ! 220: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0x8780208b  ! 221: WRASI_I	wr	%r0, 0x008b, %asi
change_to_randtl_3_124:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_124:
	.word 0x8f902000  ! 222: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_3_125:
	setx 0xd459fffd544951d2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9810014  ! 224: WR_SET_SOFTINT_R	wr	%r4, %r20, %set_softint
cwp_3_126:
    set user_data_start, %o7
	.word 0x93902007  ! 225: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
memptr_3_127:
	set 0x60540000, %r31
	.word 0x8584396d  ! 226: WRCCR_I	wr	%r16, 0x196d, %ccr
	.word 0x91d02035  ! 227: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x36800001  ! 228: BGE	bge,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_128) + 0, 16, 16)) -> intp(7,0,4)
intvec_3_128:
	.word 0x39400001  ! 229: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_3_129:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x9ba409c2  ! 1: FDIVd	fdivd	%f16, %f2, %f44
	normalw
	.word 0xa9458000  ! 230: RD_SOFTINT_REG	rd	%softint, %r20
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
	.word 0xd1e7e00d  ! 231: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0xd08008a0  ! 232: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd04fc000  ! 233: LDSB_R	ldsb	[%r31 + %r0], %r8
	.word 0xab81b65c  ! 234: WR_CLEAR_SOFTINT_I	wr	%r6, 0x165c, %clear_softint
	.word 0x81460000  ! 235: RD_STICK_REG	stbar
	.word 0xd0d004a0  ! 236: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 237: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x99902005  ! 238: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x8d902e2c  ! 239: WRPR_PSTATE_I	wrpr	%r0, 0x0e2c, %pstate
	.word 0x99540000  ! 240: RDPR_GL	<illegal instruction>
splash_lsu_3_132:
	setx 0xced4cb60b420f405, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 241: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9039a3  ! 242: WRPR_PSTATE_I	wrpr	%r0, 0x19a3, %pstate
	.word 0xd08fe030  ! 243: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r8
	.word 0xd04ff3f2  ! 244: LDSB_I	ldsb	[%r31 + 0xfffff3f2], %r8
mondo_3_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d908010  ! 245: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
	.word 0x8d802000  ! 246: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_3_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 247: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_3_135:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 248: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0x2e700001  ! 249: BPVS	<illegal instruction>
	.word 0x93a00164  ! 250: FABSq	dis not found

splash_tba_3_136:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 251: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x93d02034  ! 252: Tcc_I	tne	icc_or_xcc, %r0 + 52
splash_cmpr_3_137:
	setx 0x0e646b0e34407e11, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_138:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 254: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0xda7ff3f2  ! 255: SWAP_I	swap	%r13, [%r31 + 0xfffff3f2]
tagged_3_139:
	taddcctv %r24, 0x17fe, %r26
	.word 0xda07f3f2  ! 256: LDUW_I	lduw	[%r31 + 0xfffff3f2], %r13
	.word 0x3a800001  ! 257: BCC	bcc,a	<label_0x1>
tagged_3_140:
	tsubcctv %r9, 0x10f8, %r19
	.word 0xda07f3f2  ! 258: LDUW_I	lduw	[%r31 + 0xfffff3f2], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 259: LDX_R	ldx	[%r31 + %r0], %r13
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_141
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_141:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 260: CASA_R	casa	[%r31] %asi, %r8, %r13
	.word 0xda3ff3f2  ! 261: STD_I	std	%r13, [%r31 + 0xfffff3f2]
	.word 0xdac004a0  ! 262: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0x91d02033  ! 263: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_3_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d948013  ! 264: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
	.word 0xdabff3f2  ! 265: STDA_I	stda	%r13, [%r31 + 0xfffff3f2] %asi
	.word 0xda880e60  ! 266: LDUBA_R	lduba	[%r0, %r0] 0x73, %r13
mondo_3_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d92c00d  ! 267: WRPR_WSTATE_R	wrpr	%r11, %r13, %wstate
	.word 0xda3ff3f2  ! 268: STD_I	std	%r13, [%r31 + 0xfffff3f2]
	.word 0xa981400d  ! 269: WR_SET_SOFTINT_R	wr	%r5, %r13, %set_softint
	.word 0x8d903832  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x1832, %pstate
	.word 0x8d902766  ! 271: WRPR_PSTATE_I	wrpr	%r0, 0x0766, %pstate
	.word 0x20700001  ! 272: BPN	<illegal instruction>
	.word 0xda9004a0  ! 273: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
debug_3_144:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 274: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_145)+8, 16, 16)) -> intp(3,1,3)
xir_3_145:
	.word 0xa980a863  ! 275: WR_SET_SOFTINT_I	wr	%r2, 0x0863, %set_softint
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_146
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_146:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00b  ! 276: CASA_R	casa	[%r31] %asi, %r11, %r13
	.word 0x91d02032  ! 277: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa190200c  ! 278: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xda37ef7c  ! 279: STH_I	sth	%r13, [%r31 + 0x0f7c]
	.word 0xda77c000  ! 280: STX_R	stx	%r13, [%r31 + %r0]
pmu_3_147:
	nop
	setx 0xfffff993fffff8fe, %g1, %g7
	.word 0xa3800007  ! 281: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d02032  ! 282: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x3e800001  ! 283: BVC	bvc,a	<label_0x1>
	.word 0x2c700001  ! 284: BPNEG	<illegal instruction>
	.word 0xdadfe000  ! 285: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	.word 0x8d903746  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x1746, %pstate
splash_tba_3_148:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 287: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_3_149:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 288: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 289: LDX_R	ldx	[%r31 + %r0], %r13
debug_3_150:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 290: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0xda8804a0  ! 291: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x8d903dea  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x1dea, %pstate
	.word 0x91d02034  ! 293: Tcc_I	ta	icc_or_xcc, %r0 + 52
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 294: LDX_R	ldx	[%r31 + %r0], %r13
tagged_3_151:
	taddcctv %r9, 0x1e66, %r6
	.word 0xda07ef7c  ! 295: LDUW_I	lduw	[%r31 + 0x0f7c], %r13
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 296: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdb3fc000  ! 297: STDF_R	std	%f13, [%r0, %r31]
	.word 0xdac7e020  ! 298: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r13
DS_3_152:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x93a409d4  ! 1: FDIVd	fdivd	%f16, %f20, %f40
	normalw
	.word 0x9b458000  ! 299: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xa781c012  ! 300: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r18, %-
mondo_3_154:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d944009  ! 301: WRPR_WSTATE_R	wrpr	%r17, %r9, %wstate
	.word 0xd8d7e020  ! 302: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_155
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_155:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 303: RDPC	rd	%pc, %r11
	.word 0x87802080  ! 304: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x81510000  ! 305: RDPR_TICK	rdpr	%tick, %r0
	.word 0xa1902008  ! 306: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 307: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_3_156:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_156:
	.word 0x8f902000  ! 308: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
memptr_3_157:
	set 0x60740000, %r31
	.word 0x8584f5f7  ! 309: WRCCR_I	wr	%r19, 0x15f7, %ccr
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 310: Tcc_R	te	icc_or_xcc, %r0 + %r30
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
	.word 0xd1e7e010  ! 311: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9168bfa0  ! 312: SDIVX_I	sdivx	%r2, 0xffffffa0, %r8
splash_lsu_3_160:
	setx 0x9aff515ff5e3389d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 313: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802a2b  ! 314: SIR	sir	0x0a2b
cwp_3_161:
    set user_data_start, %o7
	.word 0x93902001  ! 315: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd897e030  ! 316: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
debug_3_162:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 317: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_3_163:
	.word 0x81982656  ! 319: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0656, %hpstate
splash_cmpr_3_164:
	setx 0x8cec4c3026df04a0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 320: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8c004a0  ! 321: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
tagged_3_165:
	taddcctv %r26, 0x1056, %r7
	.word 0xd807ee27  ! 322: LDUW_I	lduw	[%r31 + 0x0e27], %r12
debug_3_166:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 323: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd897e010  ! 324: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
splash_cmpr_3_167:
	setx 0x954d6aef44460cd1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 325: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_168:
	setx 0xb4131b4a68ff2a3a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802931  ! 327: SIR	sir	0x0931
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_169
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_169:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 328: CASA_R	casa	[%r31] %asi, %r16, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_170) + 24, 16, 16)) -> intp(6,0,0)
intvec_3_170:
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_3_171:
	.word 0x8198292f  ! 330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x092f, %hpstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_172
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_172:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 331: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x87802014  ! 332: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87802055  ! 333: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x95a00165  ! 334: FABSq	dis not found

debug_3_173:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 335: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x3e700001  ! 336: BPVC	<illegal instruction>
	.word 0xa190200b  ! 337: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d902ac7  ! 338: WRPR_PSTATE_I	wrpr	%r0, 0x0ac7, %pstate
debug_3_174:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 339: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
DS_3_175:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 340: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_3_176-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_176:
	.word 0x91944009  ! 341: WRPR_PIL_R	wrpr	%r17, %r9, %pil
	.word 0xd28fe020  ! 342: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r9
splash_hpstate_3_177:
	.word 0x819823a4  ! 343: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03a4, %hpstate
	.word 0x879023ae  ! 344: WRPR_TT_I	wrpr	%r0, 0x03ae, %tt
DS_3_178:
	.word 0x9ba049d4  ! 1: FDIVd	fdivd	%f32, %f20, %f44
	pdist %f0, %f8, %f20
	.word 0x99b1c311  ! 345: ALIGNADDRESS	alignaddr	%r7, %r17, %r12
cwp_3_179:
    set user_data_start, %o7
	.word 0x93902005  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_180) + 32, 16, 16)) -> intp(2,0,14)
intvec_3_180:
	.word 0x39400001  ! 347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_3_181:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 348: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x83d02035  ! 349: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01964  ! 350: FqTOd	dis not found

	.word 0xd2d804a0  ! 351: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
splash_lsu_3_183:
	setx 0xc0be1a1735605337, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 352: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd2c00e40  ! 353: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r9
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 354: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902007  ! 355: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_cmpr_3_184:
	setx 0x1402c0d31ff2c051, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 356: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_3_185:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_185:
	.word 0x8f902000  ! 357: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
cwp_3_186:
    set user_data_start, %o7
	.word 0x93902006  ! 358: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_3_187:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 359: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8780204f  ! 360: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x91d02033  ! 361: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd297e020  ! 362: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_188
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_188
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_188:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 363: RDPC	rd	%pc, %r16
DS_3_189:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd7344009  ! 1: STQF_R	-	%f11, [%r9, %r17]
	normalw
	.word 0xa5458000  ! 364: RD_SOFTINT_REG	rd	%softint, %r18
memptr_3_190:
	set 0x60740000, %r31
	.word 0x8581ac0f  ! 365: WRCCR_I	wr	%r6, 0x0c0f, %ccr
	.word 0x2c800001  ! 366: BNEG	bneg,a	<label_0x1>
	.word 0xa982c00a  ! 367: WR_SET_SOFTINT_R	wr	%r11, %r10, %set_softint
	.word 0x91a109d2  ! 368: FDIVd	fdivd	%f4, %f18, %f8
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_191
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_191:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 369: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x8780201c  ! 370: WRASI_I	wr	%r0, 0x001c, %asi
tagged_3_192:
	tsubcctv %r26, 0x1583, %r9
	.word 0xe407e3c5  ! 371: LDUW_I	lduw	[%r31 + 0x03c5], %r18
	.word 0xe5e7c033  ! 372: CASA_I	casa	[%r31] 0x 1, %r19, %r18
splash_cmpr_3_193:
	setx 0x02c2a851ef8fa4fc, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 373: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_3_194:
	tsubcctv %r25, 0x12d3, %r16
	.word 0xe407e3c5  ! 374: LDUW_I	lduw	[%r31 + 0x03c5], %r18
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_195
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_195
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_195:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 375: RDPC	rd	%pc, %r10
DS_3_196:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd77b9187	! Random illegal ?
	.word 0x97a309c3  ! 1: FDIVd	fdivd	%f12, %f34, %f42
	.word 0xa7a40831  ! 376: FADDs	fadds	%f16, %f17, %f19
	.word 0x8d903d63  ! 377: WRPR_PSTATE_I	wrpr	%r0, 0x1d63, %pstate
mondo_3_197:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d90c009  ! 378: WRPR_WSTATE_R	wrpr	%r3, %r9, %wstate
	.word 0xab82e759  ! 379: WR_CLEAR_SOFTINT_I	wr	%r11, 0x0759, %clear_softint
	.word 0x8790213a  ! 380: WRPR_TT_I	wrpr	%r0, 0x013a, %tt
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_198:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 381: RDPC	rd	%pc, %r10
	.word 0x28800001  ! 382: BLEU	bleu,a	<label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976a2976  ! 383: SDIVX_I	sdivx	%r8, 0x0976, %r11
	.word 0x8790239d  ! 384: WRPR_TT_I	wrpr	%r0, 0x039d, %tt
donret_3_200:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_200-donret_3_200), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_200:
	.word 0xe8fff393  ! 385: SWAPA_I	swapa	%r20, [%r31 + 0xfffff393] %asi
debug_3_201:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 386: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 387: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_tba_3_202:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 388: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe937f393  ! 389: STQF_I	-	%f20, [0x1393, %r31]
	.word 0x87802058  ! 390: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xe8800c80  ! 391: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r20
tagged_3_203:
	taddcctv %r11, 0x1041, %r18
	.word 0xe807f393  ! 392: LDUW_I	lduw	[%r31 + 0xfffff393], %r20
debug_3_204:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 393: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
memptr_3_205:
	set 0x60140000, %r31
	.word 0x8584ea94  ! 394: WRCCR_I	wr	%r19, 0x0a94, %ccr
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 395: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xab84f5a7  ! 396: WR_CLEAR_SOFTINT_I	wr	%r19, 0x15a7, %clear_softint
	.word 0xe8cfe000  ! 397: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r20
	.word 0xe8d004a0  ! 398: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
	.word 0x9f8031b1  ! 399: SIR	sir	0x11b1
tagged_3_206:
	tsubcctv %r15, 0x11de, %r16
	.word 0xe807f1a5  ! 400: LDUW_I	lduw	[%r31 + 0xfffff1a5], %r20
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
splash_decr_2_0:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
tagged_2_1:
	taddcctv %r23, 0x129a, %r25
	.word 0xd007f228  ! 1: LDUW_I	lduw	[%r31 + 0xfffff228], %r8
splash_cmpr_2_2:
	setx 0x44b7e79cd73f5190, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 2: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd0ffc028  ! 3: SWAPA_R	swapa	%r8, [%r31 + %r8] 0x01
DS_2_3:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x9ba00552  ! 1: FSQRTd	fsqrt	
	.word 0xa1a2c826  ! 4: FADDs	fadds	%f11, %f6, %f16
	.word 0xd68804a0  ! 5: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_4) + 8, 16, 16)) -> intp(4,0,16)
intvec_2_4:
	.word 0x39400001  ! 6: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_2_5:
	setx 0x4eecac3d54ed03f1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 7: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd6880e40  ! 8: LDUBA_R	lduba	[%r0, %r0] 0x72, %r11
intveclr_2_6:
	setx 0x1eb28923bd876905, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 9: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_2_7:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f30, %f2, %f30
	.word 0xa3b4030a  ! 10: ALIGNADDRESS	alignaddr	%r16, %r10, %r17
	.word 0xa190200e  ! 11: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01968  ! 12: FqTOd	dis not found

	setx 0x0ded13a0a8cd88bc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_9:
	.word 0x39400001  ! 13: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 14: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 15: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6c804a0  ! 16: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 17: LDX_R	ldx	[%r31 + %r0], %r11
splash_hpstate_2_10:
	.word 0x81982345  ! 18: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0345, %hpstate
	.word 0x97480000  ! 19: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
intveclr_2_11:
	setx 0x14ebef2f30fa6932, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_2_12:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 21: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_2_13:
	setx 0x7f14f2d280f6aa4d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 22: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3a800001  ! 23: BCC	bcc,a	<label_0x1>
DS_2_14:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f0, %f6, %f18
	.word 0xa3b18307  ! 24: ALIGNADDRESS	alignaddr	%r6, %r7, %r17
	.word 0x87802010  ! 25: WRASI_I	wr	%r0, 0x0010, %asi
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_15:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 26: CASA_R	casa	[%r31] %asi, %r3, %r11
splash_cmpr_2_16:
	setx 0xec46a1496025f8c2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 27: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 28: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x48f1a6a124a85123, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_17:
	.word 0x39400001  ! 29: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_2_18:
	set user_data_start, %r31
	.word 0x85827e85  ! 30: WRCCR_I	wr	%r9, 0x1e85, %ccr
DS_2_19:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 31: SAVE_R	save	%r31, %r0, %r31
mondo_2_20:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d920005  ! 32: WRPR_WSTATE_R	wrpr	%r8, %r5, %wstate
	.word 0xab8531b3  ! 33: WR_CLEAR_SOFTINT_I	wr	%r20, 0x11b3, %clear_softint
	.word 0xd68008a0  ! 34: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_2_21:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa7a509cb  ! 1: FDIVd	fdivd	%f20, %f42, %f50
	.word 0xa7a00552  ! 1: FSQRTd	fsqrt	
	.word 0x97a34823  ! 35: FADDs	fadds	%f13, %f3, %f11
splash_cmpr_2_22:
	setx 0x2d3831efb4a25649, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 36: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_23:
	setx 0xc9894af86f196ba3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 37: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_2_24:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 38: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xab824004  ! 39: WR_CLEAR_SOFTINT_R	wr	%r9, %r4, %clear_softint
	.word 0xa7a409c2  ! 40: FDIVd	fdivd	%f16, %f2, %f50
	.word 0xa190200e  ! 41: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b68e93c  ! 42: SDIVX_I	sdivx	%r3, 0x093c, %r13
	.word 0x8d902421  ! 43: WRPR_PSTATE_I	wrpr	%r0, 0x0421, %pstate
intveclr_2_26:
	setx 0xeb04c1256a730d6a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 44: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_27:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e000  ! 45: CASA_R	casa	[%r31] %asi, %r0, %r12
	.word 0xd93ffa99  ! 46: STDF_I	std	%f12, [0x1a99, %r31]
splash_tba_2_28:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 47: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_2_29:
	setx 0xabd4b733825a2e44, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 48: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_30
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_30:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 49: RDPC	rd	%pc, %r20
	.word 0x87802004  ! 50: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9f8037f3  ! 51: SIR	sir	0x17f3
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996c26c3  ! 52: SDIVX_I	sdivx	%r16, 0x06c3, %r12
debug_2_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 53: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956a7668  ! 54: SDIVX_I	sdivx	%r9, 0xfffff668, %r10
	rd %pc, %r19
	add %r19, (ivw_2_34-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_34:
	.word 0x9190400a  ! 55: WRPR_PIL_R	wrpr	%r1, %r10, %pil
mondo_2_35:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d914010  ! 56: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_36) + 8, 16, 16)) -> intp(3,0,22)
intvec_2_36:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_37:
	.word 0x8198258f  ! 58: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058f, %hpstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_38:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 59: CASA_R	casa	[%r31] %asi, %r17, %r12
intveclr_2_39:
	setx 0xbc6ca1e887126b73, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 60: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa269c010  ! 61: UDIVX_R	udivx 	%r7, %r16, %r17
	.word 0x91d02033  ! 62: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xab80e848  ! 63: WR_CLEAR_SOFTINT_I	wr	%r3, 0x0848, %clear_softint
mondo_2_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d91c012  ! 64: WRPR_WSTATE_R	wrpr	%r7, %r18, %wstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_41:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 65: CASA_R	casa	[%r31] %asi, %r11, %r9
debug_2_42:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 66: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	.word 0xa985000c  ! 67: WR_SET_SOFTINT_R	wr	%r20, %r12, %set_softint
	.word 0x879021aa  ! 68: WRPR_TT_I	wrpr	%r0, 0x01aa, %tt
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
	.word 0x93414000  ! 69: RDPC	rd	%pc, %r9
	.word 0xe06ff27b  ! 70: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffff27b]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 71: LDX_R	ldx	[%r31 + %r0], %r16
debug_2_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 72: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_2_45:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 73: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xe08fe030  ! 74: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r16
	.word 0xa7520000  ! 75: RDPR_PIL	<illegal instruction>
tagged_2_46:
	tsubcctv %r19, 0x10b7, %r11
	.word 0xe407f27b  ! 76: LDUW_I	lduw	[%r31 + 0xfffff27b], %r18
intveclr_2_47:
	setx 0x9c271cc39875ac63, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 78: Tcc_I	ta	icc_or_xcc, %r0 + 53
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_48
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_48:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 79: RDPC	rd	%pc, %r19
	.word 0xe31ff27b  ! 80: LDDF_I	ldd	[%r31, 0x127b], %f17
	.word 0xe28008a0  ! 81: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe28fe010  ! 82: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r17
	.word 0xe2800b20  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r17
	.word 0x93d02033  ! 84: Tcc_I	tne	icc_or_xcc, %r0 + 51
pmu_2_49:
	nop
	setx 0xfffff749fffffc84, %g1, %g7
	.word 0xa3800007  ! 85: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe2c804a0  ! 86: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_50
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_50
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_50:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 87: RDPC	rd	%pc, %r10
	rd %pc, %r19
	add %r19, (ivw_2_51-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_51:
	.word 0x91934012  ! 88: WRPR_PIL_R	wrpr	%r13, %r18, %pil
	.word 0x87802014  ! 89: WRASI_I	wr	%r0, 0x0014, %asi
DS_2_52:
	.word 0xa1a089c0  ! 1: FDIVd	fdivd	%f2, %f0, %f16
	pdist %f24, %f4, %f14
	.word 0x93b0c30c  ! 90: ALIGNADDRESS	alignaddr	%r3, %r12, %r9
change_to_randtl_2_53:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_53:
	.word 0x8f902001  ! 91: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_2_54:
	tsubcctv %r5, 0x1ae1, %r23
	.word 0xd407f27b  ! 92: LDUW_I	lduw	[%r31 + 0xfffff27b], %r10
	setx 0x3c8cf02c9a082c99, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_55:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_56:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d94800a  ! 94: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
	.word 0xa1902008  ! 95: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_hpstate_2_57:
	.word 0x819827ef  ! 96: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07ef, %hpstate
	.word 0x8d902d2f  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x0d2f, %pstate
	.word 0x87802089  ! 98: WRASI_I	wr	%r0, 0x0089, %asi
splash_lsu_2_58:
	setx 0x9d444857cb1dc9d3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 99: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_2_59:
	nop
	setx 0xfffffc3bfffff47a, %g1, %g7
	.word 0xa3800007  ! 100: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd497e010  ! 101: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r10
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_60:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 102: CASA_R	casa	[%r31] %asi, %r2, %r10
	.word 0xa781bd6e  ! 103: WR_GRAPHICS_STATUS_REG_I	wr	%r6, 0x1d6e, %-
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 104: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 105: LDX_R	ldx	[%r31 + %r0], %r10
memptr_2_61:
	set 0x60740000, %r31
	.word 0x85846d65  ! 106: WRCCR_I	wr	%r17, 0x0d65, %ccr
	.word 0x87902265  ! 107: WRPR_TT_I	wrpr	%r0, 0x0265, %tt
change_to_randtl_2_62:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_62:
	.word 0x8f902000  ! 108: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	setx 0xf6357bf35a54e373, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_63:
	.word 0x39400001  ! 109: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879020fa  ! 110: WRPR_TT_I	wrpr	%r0, 0x00fa, %tt
debug_2_64:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 111: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x97a0016c  ! 112: FABSq	dis not found

debug_2_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 113: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
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
	.word 0x95414000  ! 114: RDPC	rd	%pc, %r10
splash_lsu_2_67:
	setx 0x271b79709bd2b255, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 115: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_2_68:
	setx 0x483a64f3a3104155, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 116: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790231d  ! 117: WRPR_TT_I	wrpr	%r0, 0x031d, %tt
	.word 0x81460000  ! 118: RD_STICK_REG	stbar
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 119: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_2_69:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d948001  ! 120: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_70) + 0, 16, 16)) -> intp(1,0,14)
intvec_2_70:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_71:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 122: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
intveclr_2_72:
	setx 0x7ab2fe904519040a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 123: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd0d7e030  ! 124: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	setx 0x1bd6c1a2bad2aed2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_73:
	.word 0x39400001  ! 125: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_74)+40, 16, 16)) -> intp(2,1,3)
xir_2_74:
	.word 0xa98277d0  ! 126: WR_SET_SOFTINT_I	wr	%r9, 0x17d0, %set_softint
	.word 0xd0d80e40  ! 127: LDXA_R	ldxa	[%r0, %r0] 0x72, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_75)+32, 16, 16)) -> intp(2,1,3)
xir_2_75:
	.word 0xa984f7dd  ! 128: WR_SET_SOFTINT_I	wr	%r19, 0x17dd, %set_softint
splash_lsu_2_76:
	setx 0xbb82fc6a57e8d70d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 129: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 130: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_lsu_2_77:
	setx 0xdbd076015370ed57, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 131: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_2_78:
	set user_data_start, %r31
	.word 0x8582e8fc  ! 132: WRCCR_I	wr	%r11, 0x08fc, %ccr
change_to_randtl_2_79:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_79:
	.word 0x8f902000  ! 133: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x87902282  ! 134: WRPR_TT_I	wrpr	%r0, 0x0282, %tt
	.word 0x8d802004  ! 135: WRFPRS_I	wr	%r0, 0x0004, %fprs
	rd %pc, %r19
	add %r19, (ivw_2_80-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_80:
	.word 0x91910003  ! 136: WRPR_PIL_R	wrpr	%r4, %r3, %pil
cwp_2_81:
    set user_data_start, %o7
	.word 0x93902001  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d902232  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x0232, %pstate
	.word 0x93454000  ! 139: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0xe6d804a0  ! 140: LDXA_R	ldxa	[%r0, %r0] 0x25, %r19
	.word 0xa4a8400d  ! 141: ANDNcc_R	andncc 	%r1, %r13, %r18
debug_2_82:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 142: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902000  ! 143: WRPR_GL_I	wrpr	%r0, 0x0000, %-
memptr_2_83:
	set 0x60740000, %r31
	.word 0x8584add8  ! 144: WRCCR_I	wr	%r18, 0x0dd8, %ccr
	.word 0xa2fa63f9  ! 145: SDIVcc_I	sdivcc 	%r9, 0x03f9, %r17
	.word 0x9b520000  ! 146: RDPR_PIL	<illegal instruction>
DS_2_84:
	.word 0x9ba2c9d0  ! 1: FDIVd	fdivd	%f42, %f16, %f44
	.word 0xd7350011  ! 1: STQF_R	-	%f11, [%r17, %r20]
	normalw
	.word 0xa1458000  ! 147: RD_SOFTINT_REG	rd	%softint, %r16
splash_cmpr_2_85:
	setx 0x1be489306c148480, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 148: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_2_86:
	setx 0x924ea84f574f452b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 149: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd89fe4db  ! 150: LDDA_I	ldda	[%r31, + 0x04db] %asi, %r12
debug_2_87:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 151: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9369a566  ! 152: SDIVX_I	sdivx	%r6, 0x0566, %r9
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_89:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 153: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x3a800001  ! 154: BCC	bcc,a	<label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 155: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91500000  ! 156: RDPR_TPC	<illegal instruction>
intveclr_2_90:
	setx 0xbd863a42a867438f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 157: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
memptr_2_91:
	set 0x60540000, %r31
	.word 0x85837a36  ! 159: WRCCR_I	wr	%r13, 0x1a36, %ccr
	rd %pc, %r19
	add %r19, (ivw_2_92-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_92:
	.word 0x91918014  ! 160: WRPR_PIL_R	wrpr	%r6, %r20, %pil
	.word 0x87802004  ! 161: WRASI_I	wr	%r0, 0x0004, %asi
debug_2_93:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 162: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0x83d02034  ! 163: Tcc_I	te	icc_or_xcc, %r0 + 52
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 164: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902003  ! 165: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xab80f04b  ! 166: WR_CLEAR_SOFTINT_I	wr	%r3, 0x104b, %clear_softint
	.word 0xd61fc000  ! 167: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x8d802004  ! 168: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_cmpr_2_94:
	setx 0x97af4050659f6dbf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 169: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_2_95:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_95-donret_2_95-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_95:
	.word 0xd6ffe189  ! 170: SWAPA_I	swapa	%r11, [%r31 + 0x0189] %asi
DS_2_96:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xb76e4b0b	! Random illegal ?
	.word 0xa3a089c7  ! 1: FDIVd	fdivd	%f2, %f38, %f48
	.word 0x97a18824  ! 171: FADDs	fadds	%f6, %f4, %f11
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 172: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 173: BNE	bne,a	<label_0x1>
	.word 0x8790211c  ! 174: WRPR_TT_I	wrpr	%r0, 0x011c, %tt
	.word 0x8790202f  ! 175: WRPR_TT_I	wrpr	%r0, 0x002f, %tt
DS_2_97:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd1344003  ! 1: STQF_R	-	%f8, [%r3, %r17]
	normalw
	.word 0x93458000  ! 176: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xd68008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
debug_2_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 178: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93500000  ! 179: RDPR_TPC	rdpr	%tpc, %r9
intveclr_2_99:
	setx 0x9031a933e28275ae, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9281ecf9  ! 181: ADDcc_I	addcc 	%r7, 0x0cf9, %r9
pmu_2_100:
	nop
	setx 0xfffffc2ffffff04f, %g1, %g7
	.word 0xa3800007  ! 182: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_2_101:
	setx 0xe08f829cb875b3b7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xdb37e256  ! 184: STQF_I	-	%f13, [0x0256, %r31]
	.word 0xa1902003  ! 185: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_cmpr_2_102:
	setx 0x38b40e9ed985332e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 186: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16b7360  ! 187: SDIVX_I	sdivx	%r13, 0xfffff360, %r16
change_to_randtl_2_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_104:
	.word 0x8f902000  ! 188: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	setx 0x0a82f014ce5b2942, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_105:
	.word 0x39400001  ! 189: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xdbe7e00d  ! 190: CASA_R	casa	[%r31] %asi, %r13, %r13
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_107
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_107:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 191: RDPC	rd	%pc, %r12
	.word 0x99902003  ! 192: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_108
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_108:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 193: RDPC	rd	%pc, %r12
	.word 0x91d020b2  ! 194: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x95500000  ! 195: RDPR_TPC	<illegal instruction>
splash_decr_2_109:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa784000c  ! 196: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r12, %-
	.word 0x95a189e9  ! 197: FDIVq	dis not found

splash_htba_2_110:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 198: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d903391  ! 199: WRPR_PSTATE_I	wrpr	%r0, 0x1391, %pstate
DS_2_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x97b34311  ! 200: ALIGNADDRESS	alignaddr	%r13, %r17, %r11
	.word 0xe737f018  ! 201: STQF_I	-	%f19, [0x1018, %r31]
memptr_2_112:
	set 0x60140000, %r31
	.word 0x8581eb63  ! 202: WRCCR_I	wr	%r7, 0x0b63, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 203: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xa3464000  ! 204: RD_STICK_CMPR_REG	rd	%-, %r17
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_113
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_113:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 205: RDPC	rd	%pc, %r9
	.word 0xd6800a60  ! 206: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r11
	rd %pc, %r19
	add %r19, (ivw_2_114-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_114:
	.word 0x91910000  ! 207: WRPR_PIL_R	wrpr	%r4, %r0, %pil
debug_2_115:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 208: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d802004  ! 209: WRFPRS_I	wr	%r0, 0x0004, %fprs
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
	.word 0x97414000  ! 210: RDPC	rd	%pc, %r11
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_117
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_117
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_117:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 211: RDPC	rd	%pc, %r17
tagged_2_118:
	tsubcctv %r9, 0x1647, %r6
	.word 0xe807f954  ! 212: LDUW_I	lduw	[%r31 + 0xfffff954], %r20
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_119
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_119
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_119:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 213: RDPC	rd	%pc, %r8
	.word 0x87802014  ! 214: WRASI_I	wr	%r0, 0x0014, %asi
mondo_2_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d94800b  ! 215: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
	.word 0x99464000  ! 216: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0x91d02034  ! 217: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_hpstate_2_121:
	.word 0x81982785  ! 218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0785, %hpstate
splash_hpstate_2_122:
	.word 0x8198269c  ! 219: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069c, %hpstate
DS_2_123:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd53278af  ! 1: STQF_I	-	%f10, [0x18af, %r9]
	normalw
	.word 0x95458000  ! 220: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x87802058  ! 221: WRASI_I	wr	%r0, 0x0058, %asi
change_to_randtl_2_124:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_124:
	.word 0x8f902001  ! 222: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_2_125:
	setx 0xfc15fc64cf99c748, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9844013  ! 224: WR_SET_SOFTINT_R	wr	%r17, %r19, %set_softint
cwp_2_126:
    set user_data_start, %o7
	.word 0x93902006  ! 225: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
memptr_2_127:
	set 0x60340000, %r31
	.word 0x8581fd17  ! 226: WRCCR_I	wr	%r7, 0x1d17, %ccr
	.word 0x83d02034  ! 227: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x36800001  ! 228: BGE	bge,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_128) + 0, 16, 16)) -> intp(4,0,5)
intvec_2_128:
	.word 0x39400001  ! 229: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_129:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x9ba449d0  ! 1: FDIVd	fdivd	%f48, %f16, %f44
	normalw
	.word 0x95458000  ! 230: RD_SOFTINT_REG	rd	%softint, %r10
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
	.word 0xd1e7e00d  ! 231: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0xd08008a0  ! 232: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd04fc000  ! 233: LDSB_R	ldsb	[%r31 + %r0], %r8
	.word 0xab842d9a  ! 234: WR_CLEAR_SOFTINT_I	wr	%r16, 0x0d9a, %clear_softint
	.word 0x81460000  ! 235: RD_STICK_REG	stbar
	.word 0xd0d004a0  ! 236: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 237: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x99902000  ! 238: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x8d903901  ! 239: WRPR_PSTATE_I	wrpr	%r0, 0x1901, %pstate
	.word 0x91540000  ! 240: RDPR_GL	<illegal instruction>
splash_lsu_2_132:
	setx 0x8044fe3dace4e7eb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 241: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902ecc  ! 242: WRPR_PSTATE_I	wrpr	%r0, 0x0ecc, %pstate
	.word 0xd08fe000  ! 243: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r8
	.word 0xd04ff3f2  ! 244: LDSB_I	ldsb	[%r31 + 0xfffff3f2], %r8
mondo_2_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d91400c  ! 245: WRPR_WSTATE_R	wrpr	%r5, %r12, %wstate
	.word 0x8d802000  ! 246: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_2_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 247: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_2_135:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 248: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0x2e700001  ! 249: BPVS	<illegal instruction>
	.word 0x9ba0016b  ! 250: FABSq	dis not found

splash_tba_2_136:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 251: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x83d02032  ! 252: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_cmpr_2_137:
	setx 0xa1c9c7723f98310d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_138:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 254: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0xda7ff3f2  ! 255: SWAP_I	swap	%r13, [%r31 + 0xfffff3f2]
tagged_2_139:
	taddcctv %r26, 0x179b, %r19
	.word 0xda07f3f2  ! 256: LDUW_I	lduw	[%r31 + 0xfffff3f2], %r13
	.word 0x3a800001  ! 257: BCC	bcc,a	<label_0x1>
tagged_2_140:
	tsubcctv %r22, 0x1047, %r25
	.word 0xda07f3f2  ! 258: LDUW_I	lduw	[%r31 + 0xfffff3f2], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 259: LDX_R	ldx	[%r31 + %r0], %r13
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_141
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_141:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 260: CASA_R	casa	[%r31] %asi, %r8, %r13
	.word 0xda3ff3f2  ! 261: STD_I	std	%r13, [%r31 + 0xfffff3f2]
	.word 0xdac004a0  ! 262: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0x91d020b3  ! 263: Tcc_I	ta	icc_or_xcc, %r0 + 179
mondo_2_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d93400b  ! 264: WRPR_WSTATE_R	wrpr	%r13, %r11, %wstate
	.word 0xdabff3f2  ! 265: STDA_I	stda	%r13, [%r31 + 0xfffff3f2] %asi
	.word 0xda8804a0  ! 266: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
mondo_2_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d928012  ! 267: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
	.word 0xda3ff3f2  ! 268: STD_I	std	%r13, [%r31 + 0xfffff3f2]
	.word 0xa981c010  ! 269: WR_SET_SOFTINT_R	wr	%r7, %r16, %set_softint
	.word 0x8d903094  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x1094, %pstate
	.word 0x8d9035b9  ! 271: WRPR_PSTATE_I	wrpr	%r0, 0x15b9, %pstate
	.word 0x20700001  ! 272: BPN	<illegal instruction>
	.word 0xda9004a0  ! 273: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
debug_2_144:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 274: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_145)+8, 16, 16)) -> intp(2,1,3)
xir_2_145:
	.word 0xa9826daf  ! 275: WR_SET_SOFTINT_I	wr	%r9, 0x0daf, %set_softint
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_146
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_146:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00b  ! 276: CASA_R	casa	[%r31] %asi, %r11, %r13
	.word 0x93d020b4  ! 277: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0xa1902004  ! 278: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xda37ef7c  ! 279: STH_I	sth	%r13, [%r31 + 0x0f7c]
	.word 0xda77c000  ! 280: STX_R	stx	%r13, [%r31 + %r0]
pmu_2_147:
	nop
	setx 0xfffffb4cfffffe4a, %g1, %g7
	.word 0xa3800007  ! 281: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02033  ! 282: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x3e800001  ! 283: BVC	bvc,a	<label_0x1>
	.word 0x2c700001  ! 284: BPNEG	<illegal instruction>
	.word 0xdadfe030  ! 285: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
	.word 0x8d9030e2  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x10e2, %pstate
splash_tba_2_148:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 287: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_2_149:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 288: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 289: LDX_R	ldx	[%r31 + %r0], %r13
debug_2_150:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 290: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	.word 0xda8804a0  ! 291: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x8d90243b  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x043b, %pstate
	.word 0x91d02034  ! 293: Tcc_I	ta	icc_or_xcc, %r0 + 52
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 294: LDX_R	ldx	[%r31 + %r0], %r13
tagged_2_151:
	taddcctv %r8, 0x177f, %r17
	.word 0xda07ef7c  ! 295: LDUW_I	lduw	[%r31 + 0x0f7c], %r13
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 296: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xdb3fc000  ! 297: STDF_R	std	%f13, [%r0, %r31]
	.word 0xdac7e010  ! 298: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r13
DS_2_152:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x91a209ca  ! 1: FDIVd	fdivd	%f8, %f10, %f8
	normalw
	.word 0x91458000  ! 299: RD_SOFTINT_REG	rd	%softint, %r8
splash_decr_2_153:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa7810012  ! 300: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r18, %-
mondo_2_154:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d92c004  ! 301: WRPR_WSTATE_R	wrpr	%r11, %r4, %wstate
	.word 0xd8d7e020  ! 302: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_155
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_155:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 303: RDPC	rd	%pc, %r11
	.word 0x87802016  ! 304: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x81510000  ! 305: RDPR_TICK	rdpr	%tick, %r0
	.word 0xa1902007  ! 306: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 307: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_2_156:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_156:
	.word 0x8f902001  ! 308: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
memptr_2_157:
	set 0x60740000, %r31
	.word 0x8580e95a  ! 309: WRCCR_I	wr	%r3, 0x095a, %ccr
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 310: Tcc_R	ta	icc_or_xcc, %r0 + %r30
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
	.word 0xd1e7e010  ! 311: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976aa81c  ! 312: SDIVX_I	sdivx	%r10, 0x081c, %r11
splash_lsu_2_160:
	setx 0xc9c9759608288101, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 313: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802add  ! 314: SIR	sir	0x0add
cwp_2_161:
    set user_data_start, %o7
	.word 0x93902000  ! 315: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd897e010  ! 316: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
debug_2_162:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 317: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_2_163:
	.word 0x8198221c  ! 319: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021c, %hpstate
splash_cmpr_2_164:
	setx 0xcd5a474b705b903a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 320: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8c00e80  ! 321: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r12
tagged_2_165:
	taddcctv %r17, 0x15e5, %r6
	.word 0xd807ee27  ! 322: LDUW_I	lduw	[%r31 + 0x0e27], %r12
debug_2_166:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 323: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd897e030  ! 324: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
splash_cmpr_2_167:
	setx 0xd5808ee060d0f1bf, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 325: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_168:
	setx 0xc3d233d4928748f9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f803a90  ! 327: SIR	sir	0x1a90
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_169
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_169:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 328: CASA_R	casa	[%r31] %asi, %r16, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_170) + 48, 16, 16)) -> intp(1,0,18)
intvec_2_170:
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_171:
	.word 0x81982f0f  ! 330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0f, %hpstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_172
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_172:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 331: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x87802058  ! 332: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x87802058  ! 333: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x9ba0016d  ! 334: FABSq	dis not found

debug_2_173:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 335: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x3e700001  ! 336: BPVC	<illegal instruction>
	.word 0xa190200a  ! 337: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8d9038ff  ! 338: WRPR_PSTATE_I	wrpr	%r0, 0x18ff, %pstate
debug_2_174:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 339: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
DS_2_175:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 340: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_2_176-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_176:
	.word 0x9191c006  ! 341: WRPR_PIL_R	wrpr	%r7, %r6, %pil
	.word 0xd28fe000  ! 342: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r9
splash_hpstate_2_177:
	.word 0x819823ff  ! 343: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03ff, %hpstate
	.word 0x87902027  ! 344: WRPR_TT_I	wrpr	%r0, 0x0027, %tt
DS_2_178:
	.word 0x9ba149c0  ! 1: FDIVd	fdivd	%f36, %f0, %f44
	pdist %f24, %f10, %f10
	.word 0xa3b4c312  ! 345: ALIGNADDRESS	alignaddr	%r19, %r18, %r17
cwp_2_179:
    set user_data_start, %o7
	.word 0x93902002  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_180) + 56, 16, 16)) -> intp(1,0,13)
intvec_2_180:
	.word 0x39400001  ! 347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_2_181:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 348: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02034  ! 349: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a0196b  ! 350: FqTOd	dis not found

	.word 0xd2d804a0  ! 351: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
splash_lsu_2_183:
	setx 0x81bfc356865c7863, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 352: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd2c004a0  ! 353: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 354: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 355: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_cmpr_2_184:
	setx 0x709cee46b90131fc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 356: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_2_185:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_185:
	.word 0x8f902000  ! 357: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
cwp_2_186:
    set user_data_start, %o7
	.word 0x93902002  ! 358: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
debug_2_187:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 359: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802058  ! 360: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x91d020b5  ! 361: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xd297e020  ! 362: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_188
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_188
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_188:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 363: RDPC	rd	%pc, %r19
DS_2_189:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe1350014  ! 1: STQF_R	-	%f16, [%r20, %r20]
	normalw
	.word 0x91458000  ! 364: RD_SOFTINT_REG	rd	%softint, %r8
memptr_2_190:
	set 0x60140000, %r31
	.word 0x8585334a  ! 365: WRCCR_I	wr	%r20, 0x134a, %ccr
	.word 0x2c800001  ! 366: BNEG	bneg,a	<label_0x1>
	.word 0xa9848006  ! 367: WR_SET_SOFTINT_R	wr	%r18, %r6, %set_softint
	.word 0x97a509d4  ! 368: FDIVd	fdivd	%f20, %f20, %f42
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_191
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_191:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 369: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x87802088  ! 370: WRASI_I	wr	%r0, 0x0088, %asi
tagged_2_192:
	tsubcctv %r10, 0x13a6, %r11
	.word 0xe407e3c5  ! 371: LDUW_I	lduw	[%r31 + 0x03c5], %r18
	.word 0xe5e7c033  ! 372: CASA_I	casa	[%r31] 0x 1, %r19, %r18
splash_cmpr_2_193:
	setx 0xc19e2f2a93eddd09, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 373: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_2_194:
	tsubcctv %r6, 0x1987, %r4
	.word 0xe407e3c5  ! 374: LDUW_I	lduw	[%r31 + 0x03c5], %r18
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_195
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_195
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_195:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 375: RDPC	rd	%pc, %r13
DS_2_196:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbb47c558	! Random illegal ?
	.word 0x91a209cb  ! 1: FDIVd	fdivd	%f8, %f42, %f8
	.word 0x99a00833  ! 376: FADDs	fadds	%f0, %f19, %f12
	.word 0x8d903414  ! 377: WRPR_PSTATE_I	wrpr	%r0, 0x1414, %pstate
mondo_2_197:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d904005  ! 378: WRPR_WSTATE_R	wrpr	%r1, %r5, %wstate
	.word 0xab82e8ca  ! 379: WR_CLEAR_SOFTINT_I	wr	%r11, 0x08ca, %clear_softint
	.word 0x879022fe  ! 380: WRPR_TT_I	wrpr	%r0, 0x02fe, %tt
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
	.word 0x95414000  ! 381: RDPC	rd	%pc, %r10
	.word 0x28800001  ! 382: BLEU	bleu,a	<label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16b68b0  ! 383: SDIVX_I	sdivx	%r13, 0x08b0, %r16
	.word 0x8790202c  ! 384: WRPR_TT_I	wrpr	%r0, 0x002c, %tt
donret_2_200:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_200-donret_2_200), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_200:
	.word 0xe8fff393  ! 385: SWAPA_I	swapa	%r20, [%r31 + 0xfffff393] %asi
debug_2_201:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 386: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 387: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_2_202:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 388: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe937f393  ! 389: STQF_I	-	%f20, [0x1393, %r31]
	.word 0x87802055  ! 390: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xe8800ae0  ! 391: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r20
tagged_2_203:
	taddcctv %r3, 0x1ebe, %r9
	.word 0xe807f393  ! 392: LDUW_I	lduw	[%r31 + 0xfffff393], %r20
debug_2_204:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 393: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
memptr_2_205:
	set 0x60540000, %r31
	.word 0x8581b3f5  ! 394: WRCCR_I	wr	%r6, 0x13f5, %ccr
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 395: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xab833435  ! 396: WR_CLEAR_SOFTINT_I	wr	%r12, 0x1435, %clear_softint
	.word 0xe8cfe030  ! 397: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r20
	.word 0xe8d00e80  ! 398: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r20
	.word 0x9f802a5e  ! 399: SIR	sir	0x0a5e
tagged_2_206:
	tsubcctv %r16, 0x1242, %r2
	.word 0xe807f1a5  ! 400: LDUW_I	lduw	[%r31 + 0xfffff1a5], %r20
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
tagged_1_1:
	taddcctv %r5, 0x169d, %r16
	.word 0xd007f228  ! 1: LDUW_I	lduw	[%r31 + 0xfffff228], %r8
splash_cmpr_1_2:
	setx 0x5f3b69435ccb0720, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 2: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd0ffc028  ! 3: SWAPA_R	swapa	%r8, [%r31 + %r8] 0x01
DS_1_3:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa3a00552  ! 1: FSQRTd	fsqrt	
	.word 0x91a50826  ! 4: FADDs	fadds	%f20, %f6, %f8
	.word 0xd68804a0  ! 5: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_4) + 8, 16, 16)) -> intp(5,0,30)
intvec_1_4:
	.word 0x39400001  ! 6: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_1_5:
	setx 0xe97561115810bb85, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 7: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd6880e80  ! 8: LDUBA_R	lduba	[%r0, %r0] 0x74, %r11
intveclr_1_6:
	setx 0x81ee71dc882879b6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 9: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_1_7:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f4, %f0, %f16
	.word 0xa7b4430a  ! 10: ALIGNADDRESS	alignaddr	%r17, %r10, %r19
	.word 0xa1902009  ! 11: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01967  ! 12: FqTOd	dis not found

	setx 0xb2cf3733fbf994bd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_9:
	.word 0x39400001  ! 13: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 14: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 15: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6c804a0  ! 16: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 17: LDX_R	ldx	[%r31 + %r0], %r11
splash_hpstate_1_10:
	.word 0x8198285e  ! 18: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085e, %hpstate
	.word 0x9b480000  ! 19: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
intveclr_1_11:
	setx 0x481dff34eb3f10b6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_1_12:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 21: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_1_13:
	setx 0x29dd457a776caae3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 22: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3a800001  ! 23: BCC	bcc,a	<label_0x1>
DS_1_14:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f10, %f8, %f26
	.word 0xa7b18300  ! 24: ALIGNADDRESS	alignaddr	%r6, %r0, %r19
	.word 0x8780208b  ! 25: WRASI_I	wr	%r0, 0x008b, %asi
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_15:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 26: CASA_R	casa	[%r31] %asi, %r3, %r11
splash_cmpr_1_16:
	setx 0x9398877aa004c6d4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 27: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 28: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0xc5660e1c4db4e80b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_17:
	.word 0x39400001  ! 29: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_1_18:
	set user_data_start, %r31
	.word 0x8581a6e5  ! 30: WRCCR_I	wr	%r6, 0x06e5, %ccr
DS_1_19:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 31: SAVE_R	save	%r31, %r0, %r31
mondo_1_20:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d91c008  ! 32: WRPR_WSTATE_R	wrpr	%r7, %r8, %wstate
	.word 0xab84ff07  ! 33: WR_CLEAR_SOFTINT_I	wr	%r19, 0x1f07, %clear_softint
	.word 0xd6800ba0  ! 34: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r11
DS_1_21:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x97a0c9cc  ! 1: FDIVd	fdivd	%f34, %f12, %f42
	.word 0x99a0054d  ! 1: FSQRTd	fsqrt	
	.word 0xa9a08825  ! 35: FADDs	fadds	%f2, %f5, %f20
splash_cmpr_1_22:
	setx 0xbc9f24c61ec811c5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 36: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_23:
	setx 0x9778e10ca75f6d28, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 37: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_1_24:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 38: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xab84c011  ! 39: WR_CLEAR_SOFTINT_R	wr	%r19, %r17, %clear_softint
	.word 0x97a489d1  ! 40: FDIVd	fdivd	%f18, %f48, %f42
	.word 0xa1902008  ! 41: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56b34ac  ! 42: SDIVX_I	sdivx	%r12, 0xfffff4ac, %r18
	.word 0x8d903c85  ! 43: WRPR_PSTATE_I	wrpr	%r0, 0x1c85, %pstate
intveclr_1_26:
	setx 0xec7c6fe9ba54ed6e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 44: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_27:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e000  ! 45: CASA_R	casa	[%r31] %asi, %r0, %r12
	.word 0xd93ffa99  ! 46: STDF_I	std	%f12, [0x1a99, %r31]
splash_tba_1_28:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 47: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_1_29:
	setx 0x557635e7d7c3a040, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 48: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_30
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_30:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 49: RDPC	rd	%pc, %r11
	.word 0x87802080  ! 50: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x9f802abe  ! 51: SIR	sir	0x0abe
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956ab560  ! 52: SDIVX_I	sdivx	%r10, 0xfffff560, %r10
debug_1_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 53: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976a2b6e  ! 54: SDIVX_I	sdivx	%r8, 0x0b6e, %r11
	rd %pc, %r19
	add %r19, (ivw_1_34-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_34:
	.word 0x91950010  ! 55: WRPR_PIL_R	wrpr	%r20, %r16, %pil
mondo_1_35:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d934012  ! 56: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_36) + 8, 16, 16)) -> intp(6,0,30)
intvec_1_36:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_37:
	.word 0x8198255c  ! 58: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055c, %hpstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_38:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 59: CASA_R	casa	[%r31] %asi, %r17, %r12
intveclr_1_39:
	setx 0xba59d8f3f7b0d1e6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 60: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa0688011  ! 61: UDIVX_R	udivx 	%r2, %r17, %r16
	.word 0x83d020b2  ! 62: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0xab8436c5  ! 63: WR_CLEAR_SOFTINT_I	wr	%r16, 0x16c5, %clear_softint
mondo_1_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d930011  ! 64: WRPR_WSTATE_R	wrpr	%r12, %r17, %wstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_41:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 65: CASA_R	casa	[%r31] %asi, %r11, %r9
debug_1_42:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 66: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0xa9828004  ! 67: WR_SET_SOFTINT_R	wr	%r10, %r4, %set_softint
	.word 0x879021e3  ! 68: WRPR_TT_I	wrpr	%r0, 0x01e3, %tt
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
	.word 0xa3414000  ! 69: RDPC	rd	%pc, %r17
	.word 0xe06ff27b  ! 70: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffff27b]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 71: LDX_R	ldx	[%r31 + %r0], %r16
debug_1_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 72: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_1_45:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 73: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0xe08fe000  ! 74: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r16
	.word 0x99520000  ! 75: RDPR_PIL	<illegal instruction>
tagged_1_46:
	tsubcctv %r21, 0x1248, %r7
	.word 0xe407f27b  ! 76: LDUW_I	lduw	[%r31 + 0xfffff27b], %r18
intveclr_1_47:
	setx 0xbf837fe0793d5c52, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 78: Tcc_I	ta	icc_or_xcc, %r0 + 180
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_48
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_48:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 79: RDPC	rd	%pc, %r13
	.word 0xe31ff27b  ! 80: LDDF_I	ldd	[%r31, 0x127b], %f17
	.word 0xe28008a0  ! 81: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe28fe020  ! 82: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r17
	.word 0xe28008a0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x91d02034  ! 84: Tcc_I	ta	icc_or_xcc, %r0 + 52
pmu_1_49:
	nop
	setx 0xfffff50affffffdc, %g1, %g7
	.word 0xa3800007  ! 85: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe2c804a0  ! 86: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_50
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_50
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_50:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 87: RDPC	rd	%pc, %r13
	rd %pc, %r19
	add %r19, (ivw_1_51-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_51:
	.word 0x91900005  ! 88: WRPR_PIL_R	wrpr	%r0, %r5, %pil
	.word 0x8780208b  ! 89: WRASI_I	wr	%r0, 0x008b, %asi
DS_1_52:
	.word 0x95a509cc  ! 1: FDIVd	fdivd	%f20, %f12, %f10
	pdist %f10, %f20, %f2
	.word 0x91b08302  ! 90: ALIGNADDRESS	alignaddr	%r2, %r2, %r8
change_to_randtl_1_53:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_53:
	.word 0x8f902002  ! 91: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_1_54:
	tsubcctv %r1, 0x163f, %r7
	.word 0xd407f27b  ! 92: LDUW_I	lduw	[%r31 + 0xfffff27b], %r10
	setx 0x655acea1f1ef2a7c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_55:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_56:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d90400d  ! 94: WRPR_WSTATE_R	wrpr	%r1, %r13, %wstate
	.word 0xa1902002  ! 95: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_hpstate_1_57:
	.word 0x81982b76  ! 96: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b76, %hpstate
	.word 0x8d9033c0  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x13c0, %pstate
	.word 0x8780208a  ! 98: WRASI_I	wr	%r0, 0x008a, %asi
splash_lsu_1_58:
	setx 0x76e31e50edd6a11f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 99: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_1_59:
	nop
	setx 0xfffff8b5fffff4a0, %g1, %g7
	.word 0xa3800007  ! 100: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd497e030  ! 101: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_60:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 102: CASA_R	casa	[%r31] %asi, %r2, %r10
	.word 0xa78535cc  ! 103: WR_GRAPHICS_STATUS_REG_I	wr	%r20, 0x15cc, %-
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 104: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 105: LDX_R	ldx	[%r31 + %r0], %r10
memptr_1_61:
	set 0x60740000, %r31
	.word 0x858371cd  ! 106: WRCCR_I	wr	%r13, 0x11cd, %ccr
	.word 0x87902274  ! 107: WRPR_TT_I	wrpr	%r0, 0x0274, %tt
change_to_randtl_1_62:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_62:
	.word 0x8f902001  ! 108: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	setx 0x2673359babed0dcc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_63:
	.word 0x39400001  ! 109: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879023f6  ! 110: WRPR_TT_I	wrpr	%r0, 0x03f6, %tt
debug_1_64:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 111: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91a00169  ! 112: FABSq	dis not found

debug_1_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 113: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
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
	.word 0xa9414000  ! 114: RDPC	rd	%pc, %r20
splash_lsu_1_67:
	setx 0x981b53c9e6e24fe9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 115: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_1_68:
	setx 0x77fbd13cdadd9581, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 116: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902076  ! 117: WRPR_TT_I	wrpr	%r0, 0x0076, %tt
	.word 0x81460000  ! 118: RD_STICK_REG	stbar
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 119: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_1_69:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d940001  ! 120: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_70) + 24, 16, 16)) -> intp(7,0,1)
intvec_1_70:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_71:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 122: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
intveclr_1_72:
	setx 0x129587cde438ff59, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 123: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd0d7e000  ! 124: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	setx 0x721c46ab4908f7f1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_73:
	.word 0x39400001  ! 125: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_74)+32, 16, 16)) -> intp(1,1,3)
xir_1_74:
	.word 0xa9846082  ! 126: WR_SET_SOFTINT_I	wr	%r17, 0x0082, %set_softint
	.word 0xd0d804a0  ! 127: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_75)+8, 16, 16)) -> intp(1,1,3)
xir_1_75:
	.word 0xa9853ede  ! 128: WR_SET_SOFTINT_I	wr	%r20, 0x1ede, %set_softint
splash_lsu_1_76:
	setx 0x7994082a305119e5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 129: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 130: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_lsu_1_77:
	setx 0x80f7b4955271751b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 131: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_1_78:
	set user_data_start, %r31
	.word 0x8582afc5  ! 132: WRCCR_I	wr	%r10, 0x0fc5, %ccr
change_to_randtl_1_79:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_79:
	.word 0x8f902001  ! 133: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x87902013  ! 134: WRPR_TT_I	wrpr	%r0, 0x0013, %tt
	.word 0x8d802000  ! 135: WRFPRS_I	wr	%r0, 0x0000, %fprs
	rd %pc, %r19
	add %r19, (ivw_1_80-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_80:
	.word 0x91950011  ! 136: WRPR_PIL_R	wrpr	%r20, %r17, %pil
cwp_1_81:
    set user_data_start, %o7
	.word 0x93902003  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d903af6  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x1af6, %pstate
	.word 0xa5454000  ! 139: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0xe6d80e80  ! 140: LDXA_R	ldxa	[%r0, %r0] 0x74, %r19
	.word 0xa6a9000a  ! 141: ANDNcc_R	andncc 	%r4, %r10, %r19
debug_1_82:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 142: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902005  ! 143: WRPR_GL_I	wrpr	%r0, 0x0005, %-
memptr_1_83:
	set 0x60740000, %r31
	.word 0x85832865  ! 144: WRCCR_I	wr	%r12, 0x0865, %ccr
	.word 0xa4fc7a90  ! 145: SDIVcc_I	sdivcc 	%r17, 0xfffffa90, %r18
	.word 0x97520000  ! 146: RDPR_PIL	<illegal instruction>
DS_1_84:
	.word 0x97a189c8  ! 1: FDIVd	fdivd	%f6, %f8, %f42
	.word 0xd9324002  ! 1: STQF_R	-	%f12, [%r2, %r9]
	normalw
	.word 0x93458000  ! 147: RD_SOFTINT_REG	rd	%softint, %r9
splash_cmpr_1_85:
	setx 0x34f1a20b4ca35c83, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 148: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_1_86:
	setx 0x5c4dc294edefbac3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 149: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd89fe4db  ! 150: LDDA_I	ldda	[%r31, + 0x04db] %asi, %r12
debug_1_87:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 151: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96a758c  ! 152: SDIVX_I	sdivx	%r9, 0xfffff58c, %r20
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_89:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 153: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x3a800001  ! 154: BCC	bcc,a	<label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 155: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9500000  ! 156: RDPR_TPC	<illegal instruction>
intveclr_1_90:
	setx 0xce7f06f62b6864d3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 157: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
memptr_1_91:
	set 0x60540000, %r31
	.word 0x8583719b  ! 159: WRCCR_I	wr	%r13, 0x119b, %ccr
	rd %pc, %r19
	add %r19, (ivw_1_92-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_92:
	.word 0x91924003  ! 160: WRPR_PIL_R	wrpr	%r9, %r3, %pil
	.word 0x87802014  ! 161: WRASI_I	wr	%r0, 0x0014, %asi
debug_1_93:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 162: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0x83d020b5  ! 163: Tcc_I	te	icc_or_xcc, %r0 + 181
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 164: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902000  ! 165: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xab84a31e  ! 166: WR_CLEAR_SOFTINT_I	wr	%r18, 0x031e, %clear_softint
	.word 0xd61fc000  ! 167: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x8d802004  ! 168: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_cmpr_1_94:
	setx 0x0d9a78bb91b2a486, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 169: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_1_95:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_95-donret_1_95-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_95:
	.word 0xd6ffe189  ! 170: SWAPA_I	swapa	%r11, [%r31 + 0x0189] %asi
DS_1_96:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe16a42f1	! Random illegal ?
	.word 0x93a4c9c1  ! 1: FDIVd	fdivd	%f50, %f32, %f40
	.word 0x95a2c831  ! 171: FADDs	fadds	%f11, %f17, %f10
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 172: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 173: BNE	bne,a	<label_0x1>
	.word 0x879022b2  ! 174: WRPR_TT_I	wrpr	%r0, 0x02b2, %tt
	.word 0x87902053  ! 175: WRPR_TT_I	wrpr	%r0, 0x0053, %tt
DS_1_97:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe7320012  ! 1: STQF_R	-	%f19, [%r18, %r8]
	normalw
	.word 0x91458000  ! 176: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd68008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
debug_1_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 178: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x97500000  ! 179: RDPR_TPC	rdpr	%tpc, %r11
intveclr_1_99:
	setx 0xbf001888b95f5387, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa480b0c7  ! 181: ADDcc_I	addcc 	%r2, 0xfffff0c7, %r18
pmu_1_100:
	nop
	setx 0xffffff7cfffffe37, %g1, %g7
	.word 0xa3800007  ! 182: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_1_101:
	setx 0x512c5bc7891b33fe, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xdb37e256  ! 184: STQF_I	-	%f13, [0x0256, %r31]
	.word 0xa1902005  ! 185: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_cmpr_1_102:
	setx 0x8b9c13500584b0ad, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 186: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9169e015  ! 187: SDIVX_I	sdivx	%r7, 0x0015, %r8
change_to_randtl_1_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_104:
	.word 0x8f902002  ! 188: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	setx 0x50f7724ec01e70fb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_105:
	.word 0x39400001  ! 189: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xdbe7e00d  ! 190: CASA_R	casa	[%r31] %asi, %r13, %r13
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_107
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_107:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 191: RDPC	rd	%pc, %r16
	.word 0x99902000  ! 192: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_108
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_108:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 193: RDPC	rd	%pc, %r19
	.word 0x93d02035  ! 194: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x99500000  ! 195: RDPR_TPC	<illegal instruction>
	.word 0xa7820009  ! 196: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r9, %-
	.word 0x95a0c9e5  ! 197: FDIVq	dis not found

splash_htba_1_110:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 198: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d903209  ! 199: WRPR_PSTATE_I	wrpr	%r0, 0x1209, %pstate
DS_1_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x91b28312  ! 200: ALIGNADDRESS	alignaddr	%r10, %r18, %r8
	.word 0xe737f018  ! 201: STQF_I	-	%f19, [0x1018, %r31]
memptr_1_112:
	set 0x60540000, %r31
	.word 0x858320fe  ! 202: WRCCR_I	wr	%r12, 0x00fe, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 203: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x99464000  ! 204: RD_STICK_CMPR_REG	rd	%-, %r12
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_113
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_113:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 205: RDPC	rd	%pc, %r8
	.word 0xd6800ba0  ! 206: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r11
	rd %pc, %r19
	add %r19, (ivw_1_114-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_114:
	.word 0x91944010  ! 207: WRPR_PIL_R	wrpr	%r17, %r16, %pil
debug_1_115:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 208: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d802004  ! 209: WRFPRS_I	wr	%r0, 0x0004, %fprs
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
	.word 0x95414000  ! 210: RDPC	rd	%pc, %r10
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_117
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_117
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_117:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 211: RDPC	rd	%pc, %r10
tagged_1_118:
	tsubcctv %r16, 0x1137, %r21
	.word 0xe807f954  ! 212: LDUW_I	lduw	[%r31 + 0xfffff954], %r20
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_119
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_119
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_119:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 213: RDPC	rd	%pc, %r11
	.word 0x87802055  ! 214: WRASI_I	wr	%r0, 0x0055, %asi
mondo_1_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d944002  ! 215: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
	.word 0x93464000  ! 216: RD_STICK_CMPR_REG	rd	%-, %r9
	.word 0x91d02033  ! 217: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_hpstate_1_121:
	.word 0x8198294f  ! 218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094f, %hpstate
splash_hpstate_1_122:
	.word 0x81982f5f  ! 219: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5f, %hpstate
DS_1_123:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe1316755  ! 1: STQF_I	-	%f16, [0x0755, %r5]
	normalw
	.word 0x93458000  ! 220: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x87802058  ! 221: WRASI_I	wr	%r0, 0x0058, %asi
change_to_randtl_1_124:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_124:
	.word 0x8f902000  ! 222: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_1_125:
	setx 0x7fb4e15624f28339, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9848001  ! 224: WR_SET_SOFTINT_R	wr	%r18, %r1, %set_softint
cwp_1_126:
    set user_data_start, %o7
	.word 0x93902004  ! 225: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
memptr_1_127:
	set 0x60340000, %r31
	.word 0x85812209  ! 226: WRCCR_I	wr	%r4, 0x0209, %ccr
	.word 0x91d02035  ! 227: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x36800001  ! 228: BGE	bge,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_128) + 56, 16, 16)) -> intp(3,0,3)
intvec_1_128:
	.word 0x39400001  ! 229: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_129:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa7a009d0  ! 1: FDIVd	fdivd	%f0, %f16, %f50
	normalw
	.word 0xa9458000  ! 230: RD_SOFTINT_REG	rd	%softint, %r20
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
	.word 0xd1e7e00d  ! 231: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0xd08008a0  ! 232: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd04fc000  ! 233: LDSB_R	ldsb	[%r31 + %r0], %r8
	.word 0xab842f35  ! 234: WR_CLEAR_SOFTINT_I	wr	%r16, 0x0f35, %clear_softint
	.word 0x81460000  ! 235: RD_STICK_REG	stbar
	.word 0xd0d004a0  ! 236: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 237: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x99902001  ! 238: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x8d902241  ! 239: WRPR_PSTATE_I	wrpr	%r0, 0x0241, %pstate
	.word 0xa1540000  ! 240: RDPR_GL	<illegal instruction>
splash_lsu_1_132:
	setx 0x5bb061deab092355, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 241: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9020fc  ! 242: WRPR_PSTATE_I	wrpr	%r0, 0x00fc, %pstate
	.word 0xd08fe030  ! 243: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r8
	.word 0xd04ff3f2  ! 244: LDSB_I	ldsb	[%r31 + 0xfffff3f2], %r8
mondo_1_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d918009  ! 245: WRPR_WSTATE_R	wrpr	%r6, %r9, %wstate
	.word 0x8d802000  ! 246: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_1_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 247: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_1_135:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 248: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0x2e700001  ! 249: BPVS	<illegal instruction>
	.word 0x91a00174  ! 250: FABSq	dis not found

splash_tba_1_136:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 251: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d02032  ! 252: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_cmpr_1_137:
	setx 0xb6e25e2d320f6ada, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_138:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 254: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0xda7ff3f2  ! 255: SWAP_I	swap	%r13, [%r31 + 0xfffff3f2]
tagged_1_139:
	taddcctv %r4, 0x1f16, %r25
	.word 0xda07f3f2  ! 256: LDUW_I	lduw	[%r31 + 0xfffff3f2], %r13
	.word 0x3a800001  ! 257: BCC	bcc,a	<label_0x1>
tagged_1_140:
	tsubcctv %r1, 0x1d7a, %r5
	.word 0xda07f3f2  ! 258: LDUW_I	lduw	[%r31 + 0xfffff3f2], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 259: LDX_R	ldx	[%r31 + %r0], %r13
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_141
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_141:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 260: CASA_R	casa	[%r31] %asi, %r8, %r13
	.word 0xda3ff3f2  ! 261: STD_I	std	%r13, [%r31 + 0xfffff3f2]
	.word 0xdac004a0  ! 262: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0x91d02032  ! 263: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_1_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d900012  ! 264: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
	.word 0xdabff3f2  ! 265: STDA_I	stda	%r13, [%r31 + 0xfffff3f2] %asi
	.word 0xda8804a0  ! 266: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
mondo_1_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d910012  ! 267: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
	.word 0xda3ff3f2  ! 268: STD_I	std	%r13, [%r31 + 0xfffff3f2]
	.word 0xa9848003  ! 269: WR_SET_SOFTINT_R	wr	%r18, %r3, %set_softint
	.word 0x8d902f62  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x0f62, %pstate
	.word 0x8d903c83  ! 271: WRPR_PSTATE_I	wrpr	%r0, 0x1c83, %pstate
	.word 0x20700001  ! 272: BPN	<illegal instruction>
	.word 0xda9004a0  ! 273: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
debug_1_144:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 274: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_145)+48, 16, 16)) -> intp(1,1,3)
xir_1_145:
	.word 0xa980b042  ! 275: WR_SET_SOFTINT_I	wr	%r2, 0x1042, %set_softint
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_146
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_146:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00b  ! 276: CASA_R	casa	[%r31] %asi, %r11, %r13
	.word 0x93d02033  ! 277: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xa1902007  ! 278: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xda37ef7c  ! 279: STH_I	sth	%r13, [%r31 + 0x0f7c]
	.word 0xda77c000  ! 280: STX_R	stx	%r13, [%r31 + %r0]
pmu_1_147:
	nop
	setx 0xfffff771fffffc05, %g1, %g7
	.word 0xa3800007  ! 281: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b4  ! 282: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x3e800001  ! 283: BVC	bvc,a	<label_0x1>
	.word 0x2c700001  ! 284: BPNEG	<illegal instruction>
	.word 0xdadfe030  ! 285: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
	.word 0x8d903716  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x1716, %pstate
splash_tba_1_148:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 287: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_1_149:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 288: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 289: LDX_R	ldx	[%r31 + %r0], %r13
debug_1_150:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 290: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0xda8804a0  ! 291: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x8d9027ca  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x07ca, %pstate
	.word 0x93d020b5  ! 293: Tcc_I	tne	icc_or_xcc, %r0 + 181
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 294: LDX_R	ldx	[%r31 + %r0], %r13
tagged_1_151:
	taddcctv %r8, 0x16d3, %r24
	.word 0xda07ef7c  ! 295: LDUW_I	lduw	[%r31 + 0x0f7c], %r13
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 296: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xdb3fc000  ! 297: STDF_R	std	%f13, [%r0, %r31]
	.word 0xdac7e020  ! 298: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r13
DS_1_152:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x95a489d1  ! 1: FDIVd	fdivd	%f18, %f48, %f10
	normalw
	.word 0x91458000  ! 299: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xa781c008  ! 300: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r8, %-
mondo_1_154:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d95000a  ! 301: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
	.word 0xd8d7e020  ! 302: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_155
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_155:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 303: RDPC	rd	%pc, %r13
	.word 0x8780208b  ! 304: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x81510000  ! 305: RDPR_TICK	rdpr	%tick, %r0
	.word 0xa1902009  ! 306: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 307: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_1_156:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_156:
	.word 0x8f902002  ! 308: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
memptr_1_157:
	set 0x60540000, %r31
	.word 0x85806b7d  ! 309: WRCCR_I	wr	%r1, 0x0b7d, %ccr
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 310: Tcc_R	ta	icc_or_xcc, %r0 + %r30
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
	.word 0xd1e7e010  ! 311: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996862a5  ! 312: SDIVX_I	sdivx	%r1, 0x02a5, %r12
splash_lsu_1_160:
	setx 0x9bf68157d9a545af, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 313: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f803f63  ! 314: SIR	sir	0x1f63
cwp_1_161:
    set user_data_start, %o7
	.word 0x93902002  ! 315: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd897e030  ! 316: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
debug_1_162:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 317: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 318: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_hpstate_1_163:
	.word 0x81982e54  ! 319: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e54, %hpstate
splash_cmpr_1_164:
	setx 0x39f551d33d008d6e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 320: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8c004a0  ! 321: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
tagged_1_165:
	taddcctv %r10, 0x151d, %r8
	.word 0xd807ee27  ! 322: LDUW_I	lduw	[%r31 + 0x0e27], %r12
debug_1_166:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 323: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd897e000  ! 324: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
splash_cmpr_1_167:
	setx 0xfbb4d0621b5ad657, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 325: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_168:
	setx 0x82887ef5dba9e81f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f80309c  ! 327: SIR	sir	0x109c
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_169
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_169:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 328: CASA_R	casa	[%r31] %asi, %r16, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_170) + 0, 16, 16)) -> intp(6,0,30)
intvec_1_170:
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_171:
	.word 0x81982b04  ! 330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b04, %hpstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_172
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_172:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 331: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x87802004  ! 332: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802004  ! 333: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa3a0016c  ! 334: FABSq	dis not found

debug_1_173:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 335: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x3e700001  ! 336: BPVC	<illegal instruction>
	.word 0xa190200e  ! 337: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d9030c7  ! 338: WRPR_PSTATE_I	wrpr	%r0, 0x10c7, %pstate
debug_1_174:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 339: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
DS_1_175:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 340: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_1_176-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_176:
	.word 0x91924006  ! 341: WRPR_PIL_R	wrpr	%r9, %r6, %pil
	.word 0xd28fe020  ! 342: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r9
splash_hpstate_1_177:
	.word 0x8198212c  ! 343: WRHPR_HPSTATE_I	wrhpr	%r0, 0x012c, %hpstate
	.word 0x87902377  ! 344: WRPR_TT_I	wrpr	%r0, 0x0377, %tt
DS_1_178:
	.word 0x95a449c3  ! 1: FDIVd	fdivd	%f48, %f34, %f10
	pdist %f12, %f16, %f2
	.word 0x95b3430c  ! 345: ALIGNADDRESS	alignaddr	%r13, %r12, %r10
cwp_1_179:
    set user_data_start, %o7
	.word 0x93902006  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_180) + 56, 16, 16)) -> intp(7,0,15)
intvec_1_180:
	.word 0x39400001  ! 347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_1_181:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 348: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02033  ! 349: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01966  ! 350: FqTOd	dis not found

	.word 0xd2d804a0  ! 351: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
splash_lsu_1_183:
	setx 0x35f5d7ede10c8063, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 352: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd2c00e60  ! 353: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r9
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 354: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 355: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_cmpr_1_184:
	setx 0x42d1e489f388e3e6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 356: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_1_185:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_185:
	.word 0x8f902001  ! 357: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cwp_1_186:
    set user_data_start, %o7
	.word 0x93902005  ! 358: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_1_187:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 359: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802014  ! 360: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x83d02034  ! 361: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xd297e020  ! 362: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_188
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_188
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_188:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 363: RDPC	rd	%pc, %r18
DS_1_189:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd731c00b  ! 1: STQF_R	-	%f11, [%r11, %r7]
	normalw
	.word 0x93458000  ! 364: RD_SOFTINT_REG	rd	%softint, %r9
memptr_1_190:
	set 0x60140000, %r31
	.word 0x85853583  ! 365: WRCCR_I	wr	%r20, 0x1583, %ccr
	.word 0x2c800001  ! 366: BNEG	bneg,a	<label_0x1>
	.word 0xa9840000  ! 367: WR_SET_SOFTINT_R	wr	%r16, %r0, %set_softint
	.word 0xa9a249d3  ! 368: FDIVd	fdivd	%f40, %f50, %f20
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_191
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_191:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 369: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x87802004  ! 370: WRASI_I	wr	%r0, 0x0004, %asi
tagged_1_192:
	tsubcctv %r19, 0x1816, %r7
	.word 0xe407e3c5  ! 371: LDUW_I	lduw	[%r31 + 0x03c5], %r18
	.word 0xe5e7c033  ! 372: CASA_I	casa	[%r31] 0x 1, %r19, %r18
splash_cmpr_1_193:
	setx 0x43e8e86e62ffd896, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 373: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_1_194:
	tsubcctv %r20, 0x17c3, %r14
	.word 0xe407e3c5  ! 374: LDUW_I	lduw	[%r31 + 0x03c5], %r18
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_195
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_195
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_195:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 375: RDPC	rd	%pc, %r20
DS_1_196:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbd4ca497	! Random illegal ?
	.word 0x97a409c8  ! 1: FDIVd	fdivd	%f16, %f8, %f42
	.word 0x9ba14834  ! 376: FADDs	fadds	%f5, %f20, %f13
	.word 0x8d902e89  ! 377: WRPR_PSTATE_I	wrpr	%r0, 0x0e89, %pstate
mondo_1_197:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d94c00a  ! 378: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
	.word 0xab842d63  ! 379: WR_CLEAR_SOFTINT_I	wr	%r16, 0x0d63, %clear_softint
	.word 0x87902195  ! 380: WRPR_TT_I	wrpr	%r0, 0x0195, %tt
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
	.word 0xa1414000  ! 381: RDPC	rd	%pc, %r16
	.word 0x28800001  ! 382: BLEU	bleu,a	<label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936abaaa  ! 383: SDIVX_I	sdivx	%r10, 0xfffffaaa, %r9
	.word 0x87902029  ! 384: WRPR_TT_I	wrpr	%r0, 0x0029, %tt
donret_1_200:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_200-donret_1_200), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_200:
	.word 0xe8fff393  ! 385: SWAPA_I	swapa	%r20, [%r31 + 0xfffff393] %asi
debug_1_201:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 386: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 387: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_1_202:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 388: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe937f393  ! 389: STQF_I	-	%f20, [0x1393, %r31]
	.word 0x87802089  ! 390: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xe88008a0  ! 391: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
tagged_1_203:
	taddcctv %r8, 0x1c56, %r14
	.word 0xe807f393  ! 392: LDUW_I	lduw	[%r31 + 0xfffff393], %r20
debug_1_204:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 393: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
memptr_1_205:
	set 0x60540000, %r31
	.word 0x85852c9f  ! 394: WRCCR_I	wr	%r20, 0x0c9f, %ccr
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 395: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xab832f26  ! 396: WR_CLEAR_SOFTINT_I	wr	%r12, 0x0f26, %clear_softint
	.word 0xe8cfe010  ! 397: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r20
	.word 0xe8d004a0  ! 398: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
	.word 0x9f80340a  ! 399: SIR	sir	0x140a
tagged_1_206:
	tsubcctv %r7, 0x11d6, %r15
	.word 0xe807f1a5  ! 400: LDUW_I	lduw	[%r31 + 0xfffff1a5], %r20
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
splash_decr_0_0:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
tagged_0_1:
	taddcctv %r13, 0x1cf5, %r13
	.word 0xd007f228  ! 1: LDUW_I	lduw	[%r31 + 0xfffff228], %r8
splash_cmpr_0_2:
	setx 0xedccb6823fb803e5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 2: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd0ffc028  ! 3: SWAPA_R	swapa	%r8, [%r31 + %r8] 0x01
DS_0_3:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x97a00542  ! 1: FSQRTd	fsqrt	
	.word 0x97a20823  ! 4: FADDs	fadds	%f8, %f3, %f11
	.word 0xd68804a0  ! 5: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_4) + 8, 16, 16)) -> intp(6,0,21)
intvec_0_4:
	.word 0x39400001  ! 6: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_5:
	setx 0xe018d59f76cec8c7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 7: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd68804a0  ! 8: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
intveclr_0_6:
	setx 0x72bcb62a4e12c5cd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 9: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_7:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f24, %f6, %f26
	.word 0xa5b4c309  ! 10: ALIGNADDRESS	alignaddr	%r19, %r9, %r18
	.word 0xa1902000  ! 11: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01965  ! 12: FqTOd	dis not found

	setx 0x1254de7d2359d32e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_9:
	.word 0x39400001  ! 13: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 14: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 15: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6c804a0  ! 16: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 17: LDX_R	ldx	[%r31 + %r0], %r11
splash_hpstate_0_10:
	.word 0x8198275f  ! 18: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075f, %hpstate
	.word 0xa5480000  ! 19: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
intveclr_0_11:
	setx 0xaed6b23175941b8a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_0_12:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 21: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_0_13:
	setx 0x36535de90131b7f3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 22: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3a800001  ! 23: BCC	bcc,a	<label_0x1>
DS_0_14:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f14, %f12, %f16
	.word 0x97b0c303  ! 24: ALIGNADDRESS	alignaddr	%r3, %r3, %r11
	.word 0x87802058  ! 25: WRASI_I	wr	%r0, 0x0058, %asi
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_15:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 26: CASA_R	casa	[%r31] %asi, %r3, %r11
splash_cmpr_0_16:
	setx 0xbc25816cea3fe6d2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 27: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 28: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x5c849031c28fe9ab, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_17:
	.word 0x39400001  ! 29: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_0_18:
	set user_data_start, %r31
	.word 0x85837257  ! 30: WRCCR_I	wr	%r13, 0x1257, %ccr
DS_0_19:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 31: SAVE_R	save	%r31, %r0, %r31
mondo_0_20:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d914013  ! 32: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
	.word 0xab80640c  ! 33: WR_CLEAR_SOFTINT_I	wr	%r1, 0x040c, %clear_softint
	.word 0xd6800c80  ! 34: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r11
DS_0_21:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa5a049cd  ! 1: FDIVd	fdivd	%f32, %f44, %f18
	.word 0x95a00545  ! 1: FSQRTd	fsqrt	
	.word 0x93a4c821  ! 35: FADDs	fadds	%f19, %f1, %f9
splash_cmpr_0_22:
	setx 0x0cce41685328412c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 36: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_23:
	setx 0xf72cbf6bef0c19e1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 37: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_0_24:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 38: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xab828012  ! 39: WR_CLEAR_SOFTINT_R	wr	%r10, %r18, %clear_softint
	.word 0x95a009c0  ! 40: FDIVd	fdivd	%f0, %f0, %f10
	.word 0xa1902002  ! 41: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996c7a99  ! 42: SDIVX_I	sdivx	%r17, 0xfffffa99, %r12
	.word 0x8d902e8f  ! 43: WRPR_PSTATE_I	wrpr	%r0, 0x0e8f, %pstate
intveclr_0_26:
	setx 0x2f1cdc08ebc27046, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 44: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_27:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e000  ! 45: CASA_R	casa	[%r31] %asi, %r0, %r12
	.word 0xd93ffa99  ! 46: STDF_I	std	%f12, [0x1a99, %r31]
splash_tba_0_28:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 47: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_0_29:
	setx 0x9cdc78ae3f97dde7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 48: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_30
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_30:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 49: RDPC	rd	%pc, %r16
	.word 0x87802083  ! 50: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0x9f8029f0  ! 51: SIR	sir	0x09f0
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916ce2cf  ! 52: SDIVX_I	sdivx	%r19, 0x02cf, %r8
debug_0_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 53: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996c7347  ! 54: SDIVX_I	sdivx	%r17, 0xfffff347, %r12
cmp_0_34:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_34:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_34
    nop
cmp_wait0_34:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_34
    nop
    ba,a cmp_startwait0_34
continue_cmp_0_34:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xb2, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91904003  ! 55: WRPR_PIL_R	wrpr	%r1, %r3, %pil
mondo_0_35:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d950011  ! 56: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_36) + 8, 16, 16)) -> intp(7,0,3)
intvec_0_36:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_0_37:
	.word 0x81982ddf  ! 58: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ddf, %hpstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_38:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 59: CASA_R	casa	[%r31] %asi, %r17, %r12
intveclr_0_39:
	setx 0xecaf4284b458c454, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 60: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9268400b  ! 61: UDIVX_R	udivx 	%r1, %r11, %r9
	.word 0x93d020b5  ! 62: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0xab80727b  ! 63: WR_CLEAR_SOFTINT_I	wr	%r1, 0x127b, %clear_softint
mondo_0_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d91c00b  ! 64: WRPR_WSTATE_R	wrpr	%r7, %r11, %wstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_41:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 65: CASA_R	casa	[%r31] %asi, %r11, %r9
debug_0_42:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_42:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_42
    nop
debug_wait0_42:
    ld [%r23], %r16
    brnz %r16, debug_wait0_42
    nop
    ba,a debug_startwait0_42
continue_debug_0_42:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_42:
    cmp %r13, %r15
    bne,a wait_for_stat_0_42
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_42:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_42
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00492  ! 66: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	.word 0xa981c005  ! 67: WR_SET_SOFTINT_R	wr	%r7, %r5, %set_softint
	.word 0x879021b6  ! 68: WRPR_TT_I	wrpr	%r0, 0x01b6, %tt
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
	.word 0xa1414000  ! 69: RDPC	rd	%pc, %r16
	.word 0xe06ff27b  ! 70: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffff27b]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 71: LDX_R	ldx	[%r31 + %r0], %r16
debug_0_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 72: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_45:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_45:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_45
    nop
debug_wait0_45:
    ld [%r23], %r16
    brnz %r16, debug_wait0_45
    nop
    ba,a debug_startwait0_45
continue_debug_0_45:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_45:
    cmp %r13, %r15
    bne,a wait_for_stat_0_45
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_45:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_45
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd2f00492  ! 73: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0xe08fe000  ! 74: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r16
	.word 0xa5520000  ! 75: RDPR_PIL	<illegal instruction>
tagged_0_46:
	tsubcctv %r16, 0x1ee2, %r10
	.word 0xe407f27b  ! 76: LDUW_I	lduw	[%r31 + 0xfffff27b], %r18
intveclr_0_47:
	setx 0xc2e3863d16f8efc8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 78: Tcc_I	ta	icc_or_xcc, %r0 + 52
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_48
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_48:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 79: RDPC	rd	%pc, %r17
	.word 0xe31ff27b  ! 80: LDDF_I	ldd	[%r31, 0x127b], %f17
	.word 0xe28008a0  ! 81: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe28fe020  ! 82: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r17
	.word 0xe2800b80  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r17
	.word 0x91d02032  ! 84: Tcc_I	ta	icc_or_xcc, %r0 + 50
pmu_0_49:
	nop
	setx 0xfffffd4efffff140, %g1, %g7
	.word 0xa3800007  ! 85: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe2c80e40  ! 86: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r17
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_50
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_50
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_50:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 87: RDPC	rd	%pc, %r17
cmp_0_51:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_51:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_51
    nop
cmp_wait0_51:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_51
    nop
    ba,a cmp_startwait0_51
continue_cmp_0_51:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x6a, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9192c005  ! 88: WRPR_PIL_R	wrpr	%r11, %r5, %pil
	.word 0x87802080  ! 89: WRASI_I	wr	%r0, 0x0080, %asi
DS_0_52:
	.word 0x93a4c9c4  ! 1: FDIVd	fdivd	%f50, %f4, %f40
	pdist %f18, %f4, %f22
	.word 0x95b28311  ! 90: ALIGNADDRESS	alignaddr	%r10, %r17, %r10
change_to_randtl_0_53:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_53:
	.word 0x8f902000  ! 91: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_0_54:
	tsubcctv %r11, 0x17de, %r6
	.word 0xd407f27b  ! 92: LDUW_I	lduw	[%r31 + 0xfffff27b], %r10
	setx 0x3b122e4f45c0bb30, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_55:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_56:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d94c002  ! 94: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
	.word 0xa1902004  ! 95: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_hpstate_0_57:
	.word 0x81982b5f  ! 96: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5f, %hpstate
	.word 0x8d902c3c  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x0c3c, %pstate
	.word 0x87802088  ! 98: WRASI_I	wr	%r0, 0x0088, %asi
splash_lsu_0_58:
	setx 0x8805a5ccc036c6b1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 99: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_0_59:
	nop
	setx 0xfffffcecfffffaa0, %g1, %g7
	.word 0xa3800007  ! 100: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd497e020  ! 101: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_60:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 102: CASA_R	casa	[%r31] %asi, %r2, %r10
	.word 0xa7846f43  ! 103: WR_GRAPHICS_STATUS_REG_I	wr	%r17, 0x0f43, %-
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 104: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 105: LDX_R	ldx	[%r31 + %r0], %r10
memptr_0_61:
	set 0x60140000, %r31
	.word 0x85852017  ! 106: WRCCR_I	wr	%r20, 0x0017, %ccr
	.word 0x87902349  ! 107: WRPR_TT_I	wrpr	%r0, 0x0349, %tt
change_to_randtl_0_62:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_62:
	.word 0x8f902000  ! 108: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	setx 0x4fd4d073feaee8ba, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_63:
	.word 0x39400001  ! 109: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790239b  ! 110: WRPR_TT_I	wrpr	%r0, 0x039b, %tt
debug_0_64:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 111: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1a00167  ! 112: FABSq	dis not found

debug_0_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 113: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_66
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_66:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 114: RDPC	rd	%pc, %r8
splash_lsu_0_67:
	setx 0x52d7a02c9a0d6bb7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 115: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_68:
	setx 0xebeeedadb593fc47, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 116: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879021ff  ! 117: WRPR_TT_I	wrpr	%r0, 0x01ff, %tt
	.word 0x81460000  ! 118: RD_STICK_REG	stbar
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 119: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_0_69:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d940003  ! 120: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_70) + 40, 16, 16)) -> intp(0,0,21)
intvec_0_70:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_71:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 122: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
intveclr_0_72:
	setx 0x71b10f473ae394f0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 123: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd0d7e020  ! 124: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
	setx 0xa8a80987fea551b2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_73:
	.word 0x39400001  ! 125: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_74)+32, 16, 16)) -> intp(0,1,3)
xir_0_74:
	.word 0xa983231a  ! 126: WR_SET_SOFTINT_I	wr	%r12, 0x031a, %set_softint
	.word 0xd0d804a0  ! 127: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_75)+16, 16, 16)) -> intp(0,1,3)
xir_0_75:
	.word 0xa981b518  ! 128: WR_SET_SOFTINT_I	wr	%r6, 0x1518, %set_softint
splash_lsu_0_76:
	setx 0x90256a1aa84a84f1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 129: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 130: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_lsu_0_77:
	setx 0xf6423a9f283ac877, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 131: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_0_78:
	set user_data_start, %r31
	.word 0x85827c89  ! 132: WRCCR_I	wr	%r9, 0x1c89, %ccr
change_to_randtl_0_79:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_79:
	.word 0x8f902002  ! 133: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x87902183  ! 134: WRPR_TT_I	wrpr	%r0, 0x0183, %tt
	.word 0x8d802000  ! 135: WRFPRS_I	wr	%r0, 0x0000, %fprs
cmp_0_80:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_80:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_80
    nop
cmp_wait0_80:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_80
    nop
    ba,a cmp_startwait0_80
continue_cmp_0_80:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xa0, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91924011  ! 136: WRPR_PIL_R	wrpr	%r9, %r17, %pil
cwp_0_81:
    set user_data_start, %o7
	.word 0x93902001  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d903599  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x1599, %pstate
	.word 0xa7454000  ! 139: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	.word 0xe6d80e60  ! 140: LDXA_R	ldxa	[%r0, %r0] 0x73, %r19
	.word 0x9aa88014  ! 141: ANDNcc_R	andncc 	%r2, %r20, %r13
debug_0_82:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 142: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200a  ! 143: WRPR_GL_I	wrpr	%r0, 0x000a, %-
memptr_0_83:
	set 0x60340000, %r31
	.word 0x85837749  ! 144: WRCCR_I	wr	%r13, 0x1749, %ccr
	.word 0xa2fa64db  ! 145: SDIVcc_I	sdivcc 	%r9, 0x04db, %r17
	.word 0xa3520000  ! 146: RDPR_PIL	<illegal instruction>
DS_0_84:
	.word 0x99a409c9  ! 1: FDIVd	fdivd	%f16, %f40, %f12
	.word 0xd932000d  ! 1: STQF_R	-	%f12, [%r13, %r8]
	normalw
	.word 0x99458000  ! 147: RD_SOFTINT_REG	rd	%softint, %r12
splash_cmpr_0_85:
	setx 0xf9b439a93a78f10e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 148: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_86:
	setx 0xcda9aae47ebdab8d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 149: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd89fe4db  ! 150: LDDA_I	ldda	[%r31, + 0x04db] %asi, %r12
debug_0_87:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_87:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_87
    nop
debug_wait0_87:
    ld [%r23], %r16
    brnz %r16, debug_wait0_87
    nop
    ba,a debug_startwait0_87
continue_debug_0_87:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_87:
    cmp %r13, %r15
    bne,a wait_for_stat_0_87
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_87:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_87
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00492  ! 151: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9168e71e  ! 152: SDIVX_I	sdivx	%r3, 0x071e, %r8
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_89:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 153: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x3a800001  ! 154: BCC	bcc,a	<label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 155: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x97500000  ! 156: RDPR_TPC	<illegal instruction>
intveclr_0_90:
	setx 0x31396cb9b135493c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 157: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
memptr_0_91:
	set 0x60340000, %r31
	.word 0x8582ed80  ! 159: WRCCR_I	wr	%r11, 0x0d80, %ccr
cmp_0_92:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_92:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_92
    nop
cmp_wait0_92:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_92
    nop
    ba,a cmp_startwait0_92
continue_cmp_0_92:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xbe, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9190c00b  ! 160: WRPR_PIL_R	wrpr	%r3, %r11, %pil
	.word 0x87802080  ! 161: WRASI_I	wr	%r0, 0x0080, %asi
debug_0_93:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_93:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_93
    nop
debug_wait0_93:
    ld [%r23], %r16
    brnz %r16, debug_wait0_93
    nop
    ba,a debug_startwait0_93
continue_debug_0_93:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_93:
    cmp %r13, %r15
    bne,a wait_for_stat_0_93
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_93:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_93
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %19, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00492  ! 162: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0x91d02034  ! 163: Tcc_I	ta	icc_or_xcc, %r0 + 52
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 164: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200e  ! 165: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xab826189  ! 166: WR_CLEAR_SOFTINT_I	wr	%r9, 0x0189, %clear_softint
	.word 0xd61fc000  ! 167: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x8d802004  ! 168: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_cmpr_0_94:
	setx 0xf3baf2893b4f8fa3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 169: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_0_95:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_95-donret_0_95-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_95:
	.word 0xd6ffe189  ! 170: SWAPA_I	swapa	%r11, [%r31 + 0x0189] %asi
DS_0_96:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xdf4e4788	! Random illegal ?
	.word 0x9ba0c9c2  ! 1: FDIVd	fdivd	%f34, %f2, %f44
	.word 0xa9a3082b  ! 171: FADDs	fadds	%f12, %f11, %f20
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 172: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 173: BNE	bne,a	<label_0x1>
	.word 0x879020ce  ! 174: WRPR_TT_I	wrpr	%r0, 0x00ce, %tt
	.word 0x87902345  ! 175: WRPR_TT_I	wrpr	%r0, 0x0345, %tt
DS_0_97:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd132400d  ! 1: STQF_R	-	%f8, [%r13, %r9]
	normalw
	.word 0x97458000  ! 176: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xd68008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
debug_0_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 178: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93500000  ! 179: RDPR_TPC	rdpr	%tpc, %r9
intveclr_0_99:
	setx 0x3d73b86bfdc268bf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9a82a256  ! 181: ADDcc_I	addcc 	%r10, 0x0256, %r13
pmu_0_100:
	nop
	setx 0xfffff790fffffdf2, %g1, %g7
	.word 0xa3800007  ! 182: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_0_101:
	setx 0x41379ee7305ceefd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xdb37e256  ! 184: STQF_I	-	%f13, [0x0256, %r31]
	.word 0xa1902000  ! 185: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_cmpr_0_102:
	setx 0x2a82fa4e4173e4e3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 186: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b69b018  ! 187: SDIVX_I	sdivx	%r6, 0xfffff018, %r13
change_to_randtl_0_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_104:
	.word 0x8f902002  ! 188: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	setx 0xe1b9d168326495f7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_105:
	.word 0x39400001  ! 189: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xdbe7e00d  ! 190: CASA_R	casa	[%r31] %asi, %r13, %r13
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_107
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_107:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 191: RDPC	rd	%pc, %r12
	.word 0x99902004  ! 192: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_108
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_108:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 193: RDPC	rd	%pc, %r11
	.word 0x91d02032  ! 194: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91500000  ! 195: RDPR_TPC	<illegal instruction>
splash_decr_0_109:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa780c010  ! 196: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r16, %-
	.word 0xa9a489f1  ! 197: FDIVq	dis not found

splash_htba_0_110:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 198: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d9032f7  ! 199: WRPR_PSTATE_I	wrpr	%r0, 0x12f7, %pstate
DS_0_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa7b24308  ! 200: ALIGNADDRESS	alignaddr	%r9, %r8, %r19
	.word 0xe737f018  ! 201: STQF_I	-	%f19, [0x1018, %r31]
memptr_0_112:
	set 0x60740000, %r31
	.word 0x8581b954  ! 202: WRCCR_I	wr	%r6, 0x1954, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 203: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xa9464000  ! 204: RD_STICK_CMPR_REG	rd	%-, %r20
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_113
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_113:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 205: RDPC	rd	%pc, %r11
	.word 0xd68008a0  ! 206: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
cmp_0_114:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_114:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_114
    nop
cmp_wait0_114:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_114
    nop
    ba,a cmp_startwait0_114
continue_cmp_0_114:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 20, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91940003  ! 207: WRPR_PIL_R	wrpr	%r16, %r3, %pil
debug_0_115:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 208: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d802004  ! 209: WRFPRS_I	wr	%r0, 0x0004, %fprs
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
	.word 0x93414000  ! 210: RDPC	rd	%pc, %r9
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_117
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_117
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_117:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 211: RDPC	rd	%pc, %r20
tagged_0_118:
	tsubcctv %r20, 0x15da, %r25
	.word 0xe807f954  ! 212: LDUW_I	lduw	[%r31 + 0xfffff954], %r20
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_119
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_119
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_119:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 213: RDPC	rd	%pc, %r12
	.word 0x87802055  ! 214: WRASI_I	wr	%r0, 0x0055, %asi
mondo_0_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d92c000  ! 215: WRPR_WSTATE_R	wrpr	%r11, %r0, %wstate
	.word 0x97464000  ! 216: RD_STICK_CMPR_REG	rd	%-, %r11
	.word 0x93d02035  ! 217: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_hpstate_0_121:
	.word 0x81982f9f  ! 218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9f, %hpstate
splash_hpstate_0_122:
	.word 0x8198200f  ! 219: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000f, %hpstate
DS_0_123:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe1316e18  ! 1: STQF_I	-	%f16, [0x0e18, %r5]
	normalw
	.word 0x91458000  ! 220: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8780208b  ! 221: WRASI_I	wr	%r0, 0x008b, %asi
change_to_randtl_0_124:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_124:
	.word 0x8f902002  ! 222: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_0_125:
	setx 0x5264cc1efdae5c6c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9820014  ! 224: WR_SET_SOFTINT_R	wr	%r8, %r20, %set_softint
cwp_0_126:
    set user_data_start, %o7
	.word 0x93902002  ! 225: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
memptr_0_127:
	set 0x60740000, %r31
	.word 0x8581e8e8  ! 226: WRCCR_I	wr	%r7, 0x08e8, %ccr
	.word 0x93d02035  ! 227: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x36800001  ! 228: BGE	bge,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_128) + 0, 16, 16)) -> intp(1,0,22)
intvec_0_128:
	.word 0x39400001  ! 229: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_129:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x93a4c9cd  ! 1: FDIVd	fdivd	%f50, %f44, %f40
	normalw
	.word 0x91458000  ! 230: RD_SOFTINT_REG	rd	%softint, %r8
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
	.word 0xd1e7e00d  ! 231: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0xd08008a0  ! 232: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd04fc000  ! 233: LDSB_R	ldsb	[%r31 + %r0], %r8
	.word 0xab82f3f2  ! 234: WR_CLEAR_SOFTINT_I	wr	%r11, 0x13f2, %clear_softint
	.word 0x81460000  ! 235: RD_STICK_REG	stbar
	.word 0xd0d004a0  ! 236: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 237: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x99902000  ! 238: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x8d902659  ! 239: WRPR_PSTATE_I	wrpr	%r0, 0x0659, %pstate
	.word 0x91540000  ! 240: RDPR_GL	<illegal instruction>
splash_lsu_0_132:
	setx 0x1879ec9722c52bcf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 241: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d90221e  ! 242: WRPR_PSTATE_I	wrpr	%r0, 0x021e, %pstate
	.word 0xd08fe010  ! 243: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r8
	.word 0xd04ff3f2  ! 244: LDSB_I	ldsb	[%r31 + 0xfffff3f2], %r8
mondo_0_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d914013  ! 245: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
	.word 0x8d802000  ! 246: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_0_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 247: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_135:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_135:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_135
    nop
debug_wait0_135:
    ld [%r23], %r16
    brnz %r16, debug_wait0_135
    nop
    ba,a debug_startwait0_135
continue_debug_0_135:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_135:
    cmp %r13, %r15
    bne,a wait_for_stat_0_135
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_135:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_135
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00492  ! 248: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0x2e700001  ! 249: BPVS	<illegal instruction>
	.word 0x9ba00168  ! 250: FABSq	dis not found

splash_tba_0_136:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 251: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x93d02035  ! 252: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_cmpr_0_137:
	setx 0x3cc2422dfc6cbfec, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
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
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00492  ! 254: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0xda7ff3f2  ! 255: SWAP_I	swap	%r13, [%r31 + 0xfffff3f2]
tagged_0_139:
	taddcctv %r9, 0x19ca, %r11
	.word 0xda07f3f2  ! 256: LDUW_I	lduw	[%r31 + 0xfffff3f2], %r13
	.word 0x3a800001  ! 257: BCC	bcc,a	<label_0x1>
tagged_0_140:
	tsubcctv %r22, 0x132c, %r13
	.word 0xda07f3f2  ! 258: LDUW_I	lduw	[%r31 + 0xfffff3f2], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 259: LDX_R	ldx	[%r31 + %r0], %r13
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_141
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_141:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 260: CASA_R	casa	[%r31] %asi, %r8, %r13
	.word 0xda3ff3f2  ! 261: STD_I	std	%r13, [%r31 + 0xfffff3f2]
	.word 0xdac004a0  ! 262: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0x91d020b3  ! 263: Tcc_I	ta	icc_or_xcc, %r0 + 179
mondo_0_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d910011  ! 264: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
	.word 0xdabff3f2  ! 265: STDA_I	stda	%r13, [%r31 + 0xfffff3f2] %asi
	.word 0xda8804a0  ! 266: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
mondo_0_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d95000b  ! 267: WRPR_WSTATE_R	wrpr	%r20, %r11, %wstate
	.word 0xda3ff3f2  ! 268: STD_I	std	%r13, [%r31 + 0xfffff3f2]
	.word 0xa980800b  ! 269: WR_SET_SOFTINT_R	wr	%r2, %r11, %set_softint
	.word 0x8d902fd7  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x0fd7, %pstate
	.word 0x8d9025d3  ! 271: WRPR_PSTATE_I	wrpr	%r0, 0x05d3, %pstate
	.word 0x20700001  ! 272: BPN	<illegal instruction>
	.word 0xda900e40  ! 273: LDUHA_R	lduha	[%r0, %r0] 0x72, %r13
debug_0_144:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_144:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_144
    nop
debug_wait0_144:
    ld [%r23], %r16
    brnz %r16, debug_wait0_144
    nop
    ba,a debug_startwait0_144
continue_debug_0_144:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_144:
    cmp %r13, %r15
    bne,a wait_for_stat_0_144
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_144:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_144
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00492  ! 274: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_145)+56, 16, 16)) -> intp(0,1,3)
xir_0_145:
	.word 0xa982af7c  ! 275: WR_SET_SOFTINT_I	wr	%r10, 0x0f7c, %set_softint
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_146
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_146:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00b  ! 276: CASA_R	casa	[%r31] %asi, %r11, %r13
	.word 0x91d02033  ! 277: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902009  ! 278: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xda37ef7c  ! 279: STH_I	sth	%r13, [%r31 + 0x0f7c]
	.word 0xda77c000  ! 280: STX_R	stx	%r13, [%r31 + %r0]
pmu_0_147:
	nop
	setx 0xfffffa90fffff7d5, %g1, %g7
	.word 0xa3800007  ! 281: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b4  ! 282: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x3e800001  ! 283: BVC	bvc,a	<label_0x1>
	.word 0x2c700001  ! 284: BPNEG	<illegal instruction>
	.word 0xdadfe000  ! 285: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	.word 0x8d90265a  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x065a, %pstate
splash_tba_0_148:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 287: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_0_149:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 288: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 289: LDX_R	ldx	[%r31 + %r0], %r13
debug_0_150:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_150:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_150
    nop
debug_wait0_150:
    ld [%r23], %r16
    brnz %r16, debug_wait0_150
    nop
    ba,a debug_startwait0_150
continue_debug_0_150:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_150:
    cmp %r13, %r15
    bne,a wait_for_stat_0_150
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_150:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_150
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %18, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 290: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xda8804a0  ! 291: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x8d903f5a  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x1f5a, %pstate
	.word 0x91d02035  ! 293: Tcc_I	ta	icc_or_xcc, %r0 + 53
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 294: LDX_R	ldx	[%r31 + %r0], %r13
tagged_0_151:
	taddcctv %r3, 0x1b71, %r14
	.word 0xda07ef7c  ! 295: LDUW_I	lduw	[%r31 + 0x0f7c], %r13
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 296: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdb3fc000  ! 297: STDF_R	std	%f13, [%r0, %r31]
	.word 0xdac7e020  ! 298: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r13
DS_0_152:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x91a189c7  ! 1: FDIVd	fdivd	%f6, %f38, %f8
	normalw
	.word 0x99458000  ! 299: RD_SOFTINT_REG	rd	%softint, %r12
splash_decr_0_153:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r18, [%r1] 0x45
	.word 0xa7850010  ! 300: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r16, %-
mondo_0_154:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d944010  ! 301: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0xd8d7e020  ! 302: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_155
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_155:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 303: RDPC	rd	%pc, %r8
	.word 0x8780204f  ! 304: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x81510000  ! 305: RDPR_TICK	rdpr	%tick, %r0
	.word 0xa190200c  ! 306: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 307: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_0_156:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_156:
	.word 0x8f902001  ! 308: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
memptr_0_157:
	set 0x60340000, %r31
	.word 0x8581f3f1  ! 309: WRCCR_I	wr	%r7, 0x13f1, %ccr
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 310: Tcc_R	ta	icc_or_xcc, %r0 + %r30
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
	.word 0xd1e7e010  ! 311: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9968f5df  ! 312: SDIVX_I	sdivx	%r3, 0xfffff5df, %r12
splash_lsu_0_160:
	setx 0xe5af10fbed251635, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 313: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802e27  ! 314: SIR	sir	0x0e27
cwp_0_161:
    set user_data_start, %o7
	.word 0x93902002  ! 315: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd897e000  ! 316: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
debug_0_162:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_162:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_162
    nop
debug_wait0_162:
    ld [%r23], %r16
    brnz %r16, debug_wait0_162
    nop
    ba,a debug_startwait0_162
continue_debug_0_162:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_162:
    cmp %r13, %r15
    bne,a wait_for_stat_0_162
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_162:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_162
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00492  ! 317: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_0_163:
	.word 0x8198220c  ! 319: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020c, %hpstate
splash_cmpr_0_164:
	setx 0xfcbda2025c5fa294, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 320: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8c00e60  ! 321: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r12
tagged_0_165:
	taddcctv %r19, 0x14ea, %r23
	.word 0xd807ee27  ! 322: LDUW_I	lduw	[%r31 + 0x0e27], %r12
debug_0_166:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 323: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd897e010  ! 324: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
splash_cmpr_0_167:
	setx 0x1a3d7e3bae13c018, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 325: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_168:
	setx 0x58c3f1e67d6833dd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f8023e4  ! 327: SIR	sir	0x03e4
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_169
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_169:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 328: CASA_R	casa	[%r31] %asi, %r16, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_170) + 56, 16, 16)) -> intp(0,0,18)
intvec_0_170:
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_0_171:
	.word 0x8198212e  ! 330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x012e, %hpstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_172
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_172:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 331: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x87802083  ! 332: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0x8780208a  ! 333: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0x93a00172  ! 334: FABSq	dis not found

debug_0_173:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 335: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x3e700001  ! 336: BPVC	<illegal instruction>
	.word 0xa1902002  ! 337: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d903b12  ! 338: WRPR_PSTATE_I	wrpr	%r0, 0x1b12, %pstate
debug_0_174:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_174:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_174
    nop
debug_wait0_174:
    ld [%r23], %r16
    brnz %r16, debug_wait0_174
    nop
    ba,a debug_startwait0_174
continue_debug_0_174:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_174:
    cmp %r13, %r15
    bne,a wait_for_stat_0_174
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_174:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_174
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00492  ! 339: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
DS_0_175:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 340: RESTORE_R	restore	%r31, %r0, %r31
cmp_0_176:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_176:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_176
    nop
cmp_wait0_176:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_176
    nop
    ba,a cmp_startwait0_176
continue_cmp_0_176:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 4, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9192c011  ! 341: WRPR_PIL_R	wrpr	%r11, %r17, %pil
	.word 0xd28fe000  ! 342: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r9
splash_hpstate_0_177:
	.word 0x81982fee  ! 343: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fee, %hpstate
	.word 0x879022c6  ! 344: WRPR_TT_I	wrpr	%r0, 0x02c6, %tt
DS_0_178:
	.word 0xa9a0c9c3  ! 1: FDIVd	fdivd	%f34, %f34, %f20
	pdist %f28, %f18, %f6
	.word 0x95b4c303  ! 345: ALIGNADDRESS	alignaddr	%r19, %r3, %r10
cwp_0_179:
    set user_data_start, %o7
	.word 0x93902002  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_180) + 48, 16, 16)) -> intp(7,0,13)
intvec_0_180:
	.word 0x39400001  ! 347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_181:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 348: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d020b2  ! 349: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01972  ! 350: FqTOd	dis not found

	.word 0xd2d804a0  ! 351: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
splash_lsu_0_183:
	setx 0x8f484787fc279951, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 352: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd2c00e60  ! 353: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r9
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 354: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902004  ! 355: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_cmpr_0_184:
	setx 0xe614c9c5ddb71645, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 356: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_0_185:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_185:
	.word 0x8f902003  ! 357: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
cwp_0_186:
    set user_data_start, %o7
	.word 0x93902004  ! 358: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_0_187:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 359: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802020  ! 360: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x91d02035  ! 361: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd297e020  ! 362: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_188
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_188
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_188:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 363: RDPC	rd	%pc, %r8
DS_0_189:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd531c002  ! 1: STQF_R	-	%f10, [%r2, %r7]
	normalw
	.word 0x95458000  ! 364: RD_SOFTINT_REG	rd	%softint, %r10
memptr_0_190:
	set 0x60540000, %r31
	.word 0x8582a3c5  ! 365: WRCCR_I	wr	%r10, 0x03c5, %ccr
	.word 0x2c800001  ! 366: BNEG	bneg,a	<label_0x1>
	.word 0xa9800001  ! 367: WR_SET_SOFTINT_R	wr	%r0, %r1, %set_softint
	.word 0xa5a449d3  ! 368: FDIVd	fdivd	%f48, %f50, %f18
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_191
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_191:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 369: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x87802014  ! 370: WRASI_I	wr	%r0, 0x0014, %asi
tagged_0_192:
	tsubcctv %r16, 0x1da2, %r24
	.word 0xe407e3c5  ! 371: LDUW_I	lduw	[%r31 + 0x03c5], %r18
	.word 0xe5e7c033  ! 372: CASA_I	casa	[%r31] 0x 1, %r19, %r18
splash_cmpr_0_193:
	setx 0xfad253bbe51ff93e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 373: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_194:
	tsubcctv %r12, 0x1aed, %r2
	.word 0xe407e3c5  ! 374: LDUW_I	lduw	[%r31 + 0x03c5], %r18
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_195
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_195
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_195:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 375: RDPC	rd	%pc, %r13
DS_0_196:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x857de56a	! Random illegal ?
	.word 0xa1a309d1  ! 1: FDIVd	fdivd	%f12, %f48, %f16
	.word 0x97a1c827  ! 376: FADDs	fadds	%f7, %f7, %f11
	.word 0x8d903ca1  ! 377: WRPR_PSTATE_I	wrpr	%r0, 0x1ca1, %pstate
mondo_0_197:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d950000  ! 378: WRPR_WSTATE_R	wrpr	%r20, %r0, %wstate
	.word 0xab8423e1  ! 379: WR_CLEAR_SOFTINT_I	wr	%r16, 0x03e1, %clear_softint
	.word 0x87902156  ! 380: WRPR_TT_I	wrpr	%r0, 0x0156, %tt
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_198:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 381: RDPC	rd	%pc, %r13
	.word 0x28800001  ! 382: BLEU	bleu,a	<label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96cf393  ! 383: SDIVX_I	sdivx	%r19, 0xfffff393, %r20
	.word 0x8790202a  ! 384: WRPR_TT_I	wrpr	%r0, 0x002a, %tt
donret_0_200:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_200-donret_0_200), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_200:
	.word 0xe8fff393  ! 385: SWAPA_I	swapa	%r20, [%r31 + 0xfffff393] %asi
debug_0_201:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_201:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_201
    nop
debug_wait0_201:
    ld [%r23], %r16
    brnz %r16, debug_wait0_201
    nop
    ba,a debug_startwait0_201
continue_debug_0_201:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_201:
    cmp %r13, %r15
    bne,a wait_for_stat_0_201
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_201:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_201
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe0f00492  ! 386: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 387: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_0_202:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 388: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe937f393  ! 389: STQF_I	-	%f20, [0x1393, %r31]
	.word 0x87802083  ! 390: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0xe88008a0  ! 391: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
tagged_0_203:
	taddcctv %r1, 0x17a7, %r19
	.word 0xe807f393  ! 392: LDUW_I	lduw	[%r31 + 0xfffff393], %r20
debug_0_204:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_204:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_204
    nop
debug_wait0_204:
    ld [%r23], %r16
    brnz %r16, debug_wait0_204
    nop
    ba,a debug_startwait0_204
continue_debug_0_204:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_204:
    cmp %r13, %r15
    bne,a wait_for_stat_0_204
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_204:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_204
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 393: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
memptr_0_205:
	set 0x60740000, %r31
	.word 0x8582a132  ! 394: WRCCR_I	wr	%r10, 0x0132, %ccr
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 395: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xab827e71  ! 396: WR_CLEAR_SOFTINT_I	wr	%r9, 0x1e71, %clear_softint
	.word 0xe8cfe010  ! 397: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r20
	.word 0xe8d00e80  ! 398: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r20
	.word 0x9f8031a5  ! 399: SIR	sir	0x11a5
tagged_0_206:
	tsubcctv %r24, 0x10b8, %r14
	.word 0xe807f1a5  ! 400: LDUW_I	lduw	[%r31 + 0xfffff1a5], %r20
cmpenall_0_207:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmpenall_startwait0_207:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_0_207
    nop
cmpenall_wait0_207:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait0_207
    nop
    ba,a cmpenall_startwait0_207
continue_cmpenall_0_207:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_0_207:
    cmp %r13, %r15
    bne,a wait_for_cmpstat_0_207
    ldxa [0x58]%asi, %r15       !Running_status
    mov 0xff, %r14              !All threads running
    stxa %r14, [0x50]%asi 
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_cmpstat2_0_207:
    cmp %r14, %r15
    bne,a wait_for_cmpstat2_0_207
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

	.xword	0xa160c8d23fdf216a
	.xword	0x9e9a6b79faf87c7f
	.xword	0x756ed790069b0e7d
	.xword	0x054e58012f495f21
	.xword	0x17b8ad4e7034f474
	.xword	0x6bea044c6d5e5235
	.xword	0xba7f8b74898d1991
	.xword	0x4c519ce74d691165
	.xword	0x05ebfcd6c0308c54
	.xword	0x068ffbf7184b63d9
	.xword	0xad224c4c6ca6e0c9
	.xword	0xa7f87733e797f5fb
	.xword	0xa55747687966af4d
	.xword	0x0585a0a07b53821d
	.xword	0xf8d5b1458d968cc6
	.xword	0xb8ded6a2d3be4971
	.xword	0xc21931d113f5d7b4
	.xword	0xf12cca5002480768
	.xword	0xd061399a051a8824
	.xword	0xbea03891c09ca54d
	.xword	0xcb25f4bd1f1bc7df
	.xword	0x5d55c8e7850bd2b2
	.xword	0x83de861d8ebe3c2c
	.xword	0x83f0dbe989c42189
	.xword	0x5fcc272ac95c04d3
	.xword	0x0d649a0fc9e716f1
	.xword	0xb4ccc9050fbde8fc
	.xword	0xe741857a18415ea1
	.xword	0x95222d8905b30bec
	.xword	0x8b09090568d46fd1
	.xword	0x74320cb9102466d4
	.xword	0xc9a0d439ec837779
	.xword	0xf270a8fb29f48329
	.xword	0x5ca7c2d79c1610bb
	.xword	0x99f6fe59213855da
	.xword	0x423711ae972b4a90
	.xword	0xf2d781b68e96f9a6
	.xword	0x59ec35baf5b619fa
	.xword	0x1c3cd791f58c768f
	.xword	0x0ed364d1229f35a7
	.xword	0x544bde81d84c8dae
	.xword	0x4c59f4995896a24e
	.xword	0x1948405ad34ecddd
	.xword	0x67b02525821c97d8
	.xword	0x2b4c3bf53e54ecaa
	.xword	0x7f4789a28a4b859a
	.xword	0x48555b4385aa38f4
	.xword	0x0165ce51f3ef5380
	.xword	0xd20a15d52aacd3ee
	.xword	0xdbc353bafd9611a6
	.xword	0x6575f797c96e73a8
	.xword	0xd93c17057e92b297
	.xword	0xe5fdb0cf3e176128
	.xword	0xd3ad945d84c8dbe4
	.xword	0x99b47de5e30d7a64
	.xword	0x4b75fdea4d6aced6
	.xword	0x31d45e86afadd58f
	.xword	0x90a6a257d736aecf
	.xword	0xc9bb02cb0e897b64
	.xword	0x32eb3661c8aaaf63
	.xword	0x14e7ed19c15896bc
	.xword	0x9b7ff17822087f26
	.xword	0xf69aa38e68d5f3a8
	.xword	0x4e2afd0471d60344
	.xword	0xbf720897e588c23a
	.xword	0x8dcd2ed6cbc9a2c7
	.xword	0xdbdef5c1177abd0a
	.xword	0xfbb71a3e2cf4b464
	.xword	0x0d8cb8be9679a0c2
	.xword	0x701fdb4f9f6c2bbb
	.xword	0x1a6cbd6d2bcfc5f9
	.xword	0xd1d525b25a32dfb9
	.xword	0x1e56e9ef04284f6e
	.xword	0xec7204a992582b90
	.xword	0xe3f835a922113a5f
	.xword	0x1e58a7726584992f
	.xword	0x83b99a502d385a7b
	.xword	0x50f8430ed22b14b5
	.xword	0x014d10c172e87068
	.xword	0x33b883964cf87c1d
	.xword	0x767d3b1ab1811ef4
	.xword	0xc32d44e68abecf63
	.xword	0xda7fb7434979b9ab
	.xword	0x0b7243d7455a1285
	.xword	0x842f682272b0d4e8
	.xword	0xe8eed142e2231a60
	.xword	0xcd364020bc8c3b72
	.xword	0x8b3a2ddb4af94705
	.xword	0xc9eebe5afe344b4f
	.xword	0xfbcb6251e3cfce33
	.xword	0xc582db6d8430df82
	.xword	0x94f327466f254404
	.xword	0x09cdf6fd1d570234
	.xword	0x51f915e3143b0f7f
	.xword	0xa12fa4b0c602ac72
	.xword	0xbc728e41c54a582a
	.xword	0xf513b653eaf777a1
	.xword	0x2f461242bc811f9a
	.xword	0x6811333d15b20af5
	.xword	0x653842335e6174d9
	.xword	0x56322ca3676b596e
	.xword	0x00398d2bab0339c1
	.xword	0xa5797ed416706ef9
	.xword	0xc53520b1f7d68f26
	.xword	0x7d4a135c7b833f1b
	.xword	0x34ebbdcac12e78d9
	.xword	0x7e7d78bd7ee5b581
	.xword	0x968e86d52ce1c12e
	.xword	0xaa2e6f4d5869ba08
	.xword	0xd608b5932890844a
	.xword	0x090138d917cfbb70
	.xword	0x5ec12d9e79f9e040
	.xword	0xdf25606e8ca26f0a
	.xword	0xfdd13ee1a1825c86
	.xword	0x927b9750e9d82f8b
	.xword	0x5d21820ea733ec73
	.xword	0x39e1ced9ac9a6483
	.xword	0xea9a324c1b8e7a32
	.xword	0xf4f44f56a6bb94e2
	.xword	0x281e632e0c2494f9
	.xword	0xd74b6404926069ea
	.xword	0x124388abff1ae597
	.xword	0xcb98cffe238cd2f2
	.xword	0x925f9c0571c1d3c5
	.xword	0xed7cca0b7b85ad9b
	.xword	0xa2598cc10f67b3e7
	.xword	0xc468a62582a84a27
	.xword	0x2367b3122b72cbbf
	.xword	0xdbfeb18fcd12a0b7
	.xword	0x7ab2d08cbe53197c
	.xword	0xd32ec7411fa38907
	.xword	0xc89d175b736af62f
	.xword	0x6cb5ba973962f40f
	.xword	0xb84e1b07270df494
	.xword	0x4efd0519c6fdd678
	.xword	0xc9462b4cf3b7c363
	.xword	0x2dea30819ff9c9cb
	.xword	0x220b17707930b573
	.xword	0x34d2970e3b10bf04
	.xword	0x295e0a23a7cdb628
	.xword	0x14ee1250ebd8c568
	.xword	0xdc72e3304bd59b16
	.xword	0xc8199fc1da1e67da
	.xword	0x05414af8f6632029
	.xword	0x337502240fe3dde5
	.xword	0xdb98a44b0b2799e1
	.xword	0x22845d5e302d42d1
	.xword	0x6e37eab9e7d20ba3
	.xword	0x1b97cafad712c234
	.xword	0x79b259af69a3093b
	.xword	0x83761d796d4e553c
	.xword	0x6498c84badd69635
	.xword	0xe7d7fd2e10e82fc5
	.xword	0x9db41a660c003e66
	.xword	0x66841910491cab9b
	.xword	0xf90774868085ce08
	.xword	0xf191bce4e2421336
	.xword	0xacf3fedefced58c4
	.xword	0x955953beabf516ff
	.xword	0xa74f845362d8df3b
	.xword	0x0e39171394139d58
	.xword	0x7d351c5b58000a5f
	.xword	0x47d5aca1393391c7
	.xword	0x363ad8e2f6292a56
	.xword	0xdbe4a937a5110c3f
	.xword	0x525694870a9091c5
	.xword	0x2e08a486e518077b
	.xword	0x5508bc5a28b3cbe6
	.xword	0xb882122db9876126
	.xword	0xa935c52f923a0701
	.xword	0x5c8f44bd7bdada10
	.xword	0xb28fb260a6733683
	.xword	0x45b2b2cdefad8764
	.xword	0x0c511f33fef7ec16
	.xword	0x8a2f285b2f162934
	.xword	0x4011942b8d5182a4
	.xword	0xb5260237074042a0
	.xword	0x1ced4085cdd1f917
	.xword	0x270472ce972072a8
	.xword	0xcabcf9bd7a6f33de
	.xword	0x56ed2472598e395e
	.xword	0x449b5afd1b5ee5c0
	.xword	0x5cfe681bba1abb67
	.xword	0x681b7f9320cb2e65
	.xword	0x4e014070e5c6f535
	.xword	0x24762486fc39d2c4
	.xword	0xc0142b0bc4adcc9e
	.xword	0x404ceee1c61bf119
	.xword	0xa2a4ad8576597ebc
	.xword	0x002689927e4285c3
	.xword	0xd221993606ec364c
	.xword	0x1ef50dd0a65dfbc0
	.xword	0xc496e5cfbdafc666
	.xword	0x853c4985142e23b1
	.xword	0xc1718e122e35a8e7
	.xword	0x5c696fdc81411ec0
	.xword	0x1ca8cf0f0c9dc052
	.xword	0x047f8c757f411f47
	.xword	0x1bfe1bc55d282923
	.xword	0x382a392a3bbfbf3e
	.xword	0x9b4924eaf35f33b0
	.xword	0x87dca6e574e34240
	.xword	0xb93d3cdbc60c6e6c
	.xword	0x274be93500bf845f
	.xword	0x474439e8a0fb3ced
	.xword	0xc430ec1a53cdd504
	.xword	0x44ad19924cb5e136
	.xword	0x30d260f985d13afc
	.xword	0xe8f37ea12b459aa4
	.xword	0xb8a5d265a844b9d8
	.xword	0xd80c8bdd681d0034
	.xword	0x336e265672839284
	.xword	0x1a07c44416a5cb93
	.xword	0x76bdca5e802a2508
	.xword	0xa89145d3f222568b
	.xword	0xc3f659add09f5ecc
	.xword	0x8bf6dcd34a222acf
	.xword	0xaad0f72501861ee2
	.xword	0x8fd286a40389513a
	.xword	0x98851c6aac8d98b9
	.xword	0xfe89cf553c48db10
	.xword	0x8432e7568ea6aa2d
	.xword	0x65c5c0e17285531e
	.xword	0x87b2d0c0f2809a42
	.xword	0x0acf4111bdf310fb
	.xword	0x87fb0459137c471b
	.xword	0x711ba65dec2c507e
	.xword	0x7ddd39be396d2fc7
	.xword	0xc9d159c5e3a6722a
	.xword	0x09f075446b2d1884
	.xword	0xe5395133a0a91c2a
	.xword	0x26a578714221b58e
	.xword	0x0df4896fd80c9b33
	.xword	0x7e28fa5d5506a0e0
	.xword	0x75c807911ea499b3
	.xword	0x20a9f9da8127fce8
	.xword	0x73175d46511c75d7
	.xword	0x041bcc35bdc8eed7
	.xword	0xf60deb8287bb20e2
	.xword	0x61f0c7833c5c86e4
	.xword	0x24e29f488225622c
	.xword	0xb247e0c9c4a59925
	.xword	0x00cec921df74218f
	.xword	0x1e99e0e3b89b4042
	.xword	0x06f4ba476df1fd41
	.xword	0x692c65f28d0182c6
	.xword	0x0a7f16de0c98b5f7
	.xword	0x8160e0fe972d86ed
	.xword	0x033cfdf78908ddfe
	.xword	0xa4326caa25911da9
	.xword	0x23b12bc1ab7a5f7e
	.xword	0x215ab3830ffdea94
	.xword	0x9e179102caf7d075
	.xword	0x2c6400bc3903442b
	.xword	0x4d20d4ac3b2816b6
	.xword	0xd09d45fdf2f9a8b1

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
	TTE_CP	 = 0,
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
	TTE_P	 = 0,
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
	.xword	0x355fb391c72f1cc8
	.xword	0x5fb64b3a6f30c3c2
	.xword	0xe703c76e8dee609b
	.xword	0xe7b74f77e1236ce7
	.xword	0x7d52e589d005da45
	.xword	0xc6966480eb8648e7
	.xword	0xdcb73657ac4bd7b4
	.xword	0x007893fd640e4f9e
	.xword	0xaee4cb75838e3a24
	.xword	0xe97c252a171dee8f
	.xword	0x3bfc41c4564a4dd0
	.xword	0x6f395900124fe5d7
	.xword	0x7fcaa6f8228632f5
	.xword	0xe003e5fa7c30665e
	.xword	0x14ab38ea667b94f3
	.xword	0xd4731de8b1d5a866
	.xword	0xabadf38eff28f404
	.xword	0x629ccf8cc2ba670a
	.xword	0xbc25de701cb65b26
	.xword	0x30718f8a2a47d37b
	.xword	0x004c1ac1865b8fde
	.xword	0x0c52bb39c760696d
	.xword	0xa06713cecff322fe
	.xword	0x99bc9d4623ff10c1
	.xword	0xde56faa750866706
	.xword	0xfecac48eea8b160f
	.xword	0xb7f9226a15ebe24e
	.xword	0xf3315a08502e98d4
	.xword	0xf7c30079146eee0a
	.xword	0x31b45c89caceb656
	.xword	0x36a16aa5b2ae90c7
	.xword	0x8b7700f4ab7e4dc4



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
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
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
	.xword	0xb3ec1ab58eab8943
	.xword	0x03cab840d5ecea57
	.xword	0xa03cdc3535962930
	.xword	0xd97a27a9c4998905
	.xword	0xa7bc18ea9580942b
	.xword	0x95d5aecac32ea092
	.xword	0x72fd766f8ab1a6a8
	.xword	0x27cc6efea3224116
	.xword	0xdcf8710ba8d14631
	.xword	0x9d1e547cbce4229e
	.xword	0xa64c90ca18f7fb69
	.xword	0x8ffeb0845265fa9e
	.xword	0xce14fc309e58fd3d
	.xword	0x156296ff7edb9883
	.xword	0x7fd1caee50e1470e
	.xword	0x15d39ecd36530759
	.xword	0x2f6cf5f24761c0ba
	.xword	0x0e15da9b9b940535
	.xword	0x48cdc754ce696ac8
	.xword	0x55d56ca237b0c673
	.xword	0x00f15def33cc55f3
	.xword	0x39bab5dab3bcd54a
	.xword	0x5e4222dd29dc5bff
	.xword	0xde50c214f1f28d10
	.xword	0x20e45cbc1bfe8db0
	.xword	0xaa16c88e809de363
	.xword	0x7e6d995699cac612
	.xword	0xc7900e7d2ed705ae
	.xword	0x58fc4a44752997da
	.xword	0x0dd7ba4e268df6db
	.xword	0x99a22122e7d7915e
	.xword	0x9af35eaf778234eb



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
	.xword	0x9c81160d0a492239
	.xword	0xffd66a26aad1f7ad
	.xword	0x2acc33b2a703ea8b
	.xword	0x679e13d2a1b03c63
	.xword	0x76bcc22f38efda05
	.xword	0x8f4d0d57f4bae3cb
	.xword	0xd9dc1b1a2c569b4a
	.xword	0x54b72e055f567b74
	.xword	0x200cfb88b8b5cafb
	.xword	0x186c1abd6eb076ce
	.xword	0xefd1682b16ad7992
	.xword	0x07d5e69f53fe6f50
	.xword	0x9b37c239ec5b4ce7
	.xword	0x39091b9394fad75c
	.xword	0xf9349203d12be4e3
	.xword	0xea8bc4ec3683a216
	.xword	0xe62c882506a6c3fb
	.xword	0x8836e6d0f6a1ca7e
	.xword	0x8add0fb91670d801
	.xword	0xa053345d0d36fb41
	.xword	0x75f24719c25a053d
	.xword	0xea48eaf3ba9bcc61
	.xword	0x8f47fc3873bb6a2f
	.xword	0x468b8c9aca3e8d94
	.xword	0x5da95e75a84bbd9c
	.xword	0xff5f678091a1c918
	.xword	0x35c0f9356f35ec32
	.xword	0x7c391aabde2dcaad
	.xword	0x94f98ef27a7ac771
	.xword	0x7efac1d51c1dce76
	.xword	0x20a31a6e91bc2714
	.xword	0xc0967a396a635d3d



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
	.xword	0x2ff189d355d005bd
	.xword	0xe29f710b09e9756c
	.xword	0x3e52c669636805b0
	.xword	0xbc4ff66034dd3347
	.xword	0xc1cc5ccb0631cfaf
	.xword	0x3e053bf9febede25
	.xword	0x6feb3b25baf742cd
	.xword	0xb654f6958b9f2fba
	.xword	0x35617b297f298b8d
	.xword	0xc79722f9116303b5
	.xword	0xaa6b4bf53babb041
	.xword	0x496efb1225a1e8ed
	.xword	0x976d2a999d800605
	.xword	0xab223aa01e328c75
	.xword	0xa6b07852a2fe0a28
	.xword	0x6088511913a43d0f
	.xword	0xcc7f76ac57800221
	.xword	0x3c143e0fbf088860
	.xword	0xe2264cba0cbed028
	.xword	0xade1b429237732d6
	.xword	0x0e1f2b0151f17403
	.xword	0xce02de16264feeeb
	.xword	0xec5fb3854cb51b0d
	.xword	0x5e87c37cc199db8f
	.xword	0xe841c6ff59225951
	.xword	0xd1d812bf49585d5d
	.xword	0xf69bbed8bc948093
	.xword	0x1e746e13f7d31e89
	.xword	0x5929aafea3836501
	.xword	0x1b86cfccfcaf060b
	.xword	0xa10bd0883ae46092
	.xword	0xb5ae0f5f4475cc11



#if 0
#endif

