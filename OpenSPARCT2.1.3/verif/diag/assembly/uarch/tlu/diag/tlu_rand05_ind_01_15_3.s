/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_01_15_3.s
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
	mov 0xb5, %r14
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
	mov 0x32, %r14
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
	mov 0xb0, %r14
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
	mov 0xb3, %r14
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
	.word 0xd8d7e000  ! 1: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
splash_cmpr_7_1:
	setx 0x6b6348b8e6ee2755, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 2: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 3: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802004  ! 4: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x879021a7  ! 5: WRPR_TT_I	wrpr	%r0, 0x01a7, %tt
debug_7_3:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 6: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
cwp_7_4:
    set user_data_start, %o7
	.word 0x93902000  ! 7: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d9029c7  ! 8: WRPR_PSTATE_I	wrpr	%r0, 0x09c7, %pstate
splash_cmpr_7_5:
	setx 0x0271a7abff6c591c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 9: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_7_6:
    set user_data_start, %o7
	.word 0x93902002  ! 10: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_lsu_7_7:
	setx 0xa5b19c96074061df, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 11: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_7_8:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 12: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x38800001  ! 13: BGU	bgu,a	<label_0x1>
	.word 0xd86fe5b9  ! 14: LDSTUB_I	ldstub	%r12, [%r31 + 0x05b9]
	.word 0x91d02034  ! 15: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902fff  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x0fff, %pstate
	.word 0x30800001  ! 17: BA	ba,a	<label_0x1>
	.word 0xa1902000  ! 18: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 19: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd897e000  ! 20: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
	.word 0x8d902249  ! 21: WRPR_PSTATE_I	wrpr	%r0, 0x0249, %pstate
	.word 0x93520000  ! 22: RDPR_PIL	rdpr	%pil, %r9
DS_7_9:
	.word 0x93a349c0  ! 1: FDIVd	fdivd	%f44, %f0, %f40
	.word 0xd1350013  ! 1: STQF_R	-	%f8, [%r19, %r20]
	normalw
	.word 0xa9458000  ! 23: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0x87902206  ! 24: WRPR_TT_I	wrpr	%r0, 0x0206, %tt
donret_7_10:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_10-donret_7_10), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_10:
	.word 0xd4ffe5b9  ! 25: SWAPA_I	swapa	%r10, [%r31 + 0x05b9] %asi
	.word 0x83d020b4  ! 26: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xd46fe5b9  ! 27: LDSTUB_I	ldstub	%r10, [%r31 + 0x05b9]
	.word 0x99480000  ! 28: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
splash_htba_7_11:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 29: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d903448  ! 30: WRPR_PSTATE_I	wrpr	%r0, 0x1448, %pstate
splash_cmpr_7_12:
	setx 0xe1867dce68436fa6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 31: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 32: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56a326a  ! 33: SDIVX_I	sdivx	%r8, 0xfffff26a, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 34: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4c7e010  ! 35: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 36: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_7_14:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 37: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd48804a0  ! 38: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x83d02035  ! 39: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xd45feeec  ! 40: LDX_I	ldx	[%r31 + 0x0eec], %r10
	.word 0x91d02035  ! 41: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_7_15:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x93b48303  ! 42: ALIGNADDRESS	alignaddr	%r18, %r3, %r9
debug_7_16:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 43: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_17
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_17:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 44: RDPC	rd	%pc, %r12
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 45: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1500000  ! 46: RDPR_TPC	<illegal instruction>
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 47: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d903ccf  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x1ccf, %pstate
	.word 0xe6d7e020  ! 49: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r19
splash_cmpr_7_18:
	setx 0xcecd68d126fe3657, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_7_19:
    set user_data_start, %o7
	.word 0x93902001  ! 51: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_20) + 16, 16, 16)) -> intp(3,0,22)
intvec_7_20:
	.word 0x39400001  ! 52: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe637eeec  ! 53: STH_I	sth	%r19, [%r31 + 0x0eec]
memptr_7_21:
	set user_data_start, %r31
	.word 0x8580304a  ! 54: WRCCR_I	wr	%r0, 0x104a, %ccr
splash_hpstate_7_22:
	.word 0x81982b0d  ! 55: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0d, %hpstate
	.word 0x90d98014  ! 56: SMULcc_R	smulcc 	%r6, %r20, %r8
	.word 0xa1a249c4  ! 57: FDIVd	fdivd	%f40, %f4, %f16
memptr_7_23:
	set 0x60740000, %r31
	.word 0x8581f9af  ! 58: WRCCR_I	wr	%r7, 0x19af, %ccr
	.word 0xd4d00e40  ! 59: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r10
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 60: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_7_24:
	.word 0x81982be5  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0be5, %hpstate
change_to_randtl_7_25:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_25:
	.word 0x8f902001  ! 62: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x87802014  ! 63: WRASI_I	wr	%r0, 0x0014, %asi
tagged_7_26:
	tsubcctv %r8, 0x1b6f, %r23
	.word 0xd407ee0f  ! 64: LDUW_I	lduw	[%r31 + 0x0e0f], %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa569ab10  ! 65: SDIVX_I	sdivx	%r6, 0x0b10, %r18
	.word 0x8780201c  ! 66: WRASI_I	wr	%r0, 0x001c, %asi
memptr_7_28:
	set 0x60140000, %r31
	.word 0x8584e458  ! 67: WRCCR_I	wr	%r19, 0x0458, %ccr
	setx 0xe9ba0ed4353b968f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_29:
	.word 0x39400001  ! 68: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_30:
	setx 0x553ba146dacf5627, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 69: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_7_31:
	setx 0x86b160c2200ae6c0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 70: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_32) + 48, 16, 16)) -> intp(4,0,1)
intvec_7_32:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda6ffb07  ! 72: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffffb07]
	.word 0xdadfe000  ! 73: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	.word 0xda27fb07  ! 74: STW_I	stw	%r13, [%r31 + 0xfffffb07]
donret_7_33:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_33-donret_7_33-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_33:
	.word 0xdafffb07  ! 75: SWAPA_I	swapa	%r13, [%r31 + 0xfffffb07] %asi
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_34
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_34
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_34:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 76: RDPC	rd	%pc, %r11
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 77: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95540000  ! 78: RDPR_GL	rdpr	%-, %r10
	setx 0x692a217ebe5963fd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_35:
	.word 0x39400001  ! 79: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4dfe020  ! 80: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
DS_7_36:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 81: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 82: LDX_R	ldx	[%r31 + %r0], %r10
splash_lsu_7_37:
	setx 0x3009c22214252d49, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 83: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x97500000  ! 84: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x9b450000  ! 85: RD_SET_SOFTINT	rd	%set_softint, %r13
debug_7_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 86: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 87: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xa6faf4a8  ! 88: SDIVcc_I	sdivcc 	%r11, 0xfffff4a8, %r19
	.word 0xab812484  ! 89: WR_CLEAR_SOFTINT_I	wr	%r4, 0x0484, %clear_softint
	.word 0xd0880e60  ! 90: LDUBA_R	lduba	[%r0, %r0] 0x73, %r8
debug_7_39:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 91: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_40:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00b  ! 92: CASA_R	casa	[%r31] %asi, %r11, %r8
cwp_7_41:
    set user_data_start, %o7
	.word 0x93902004  ! 93: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd13fc000  ! 94: STDF_R	std	%f8, [%r0, %r31]
	.word 0x87902074  ! 95: WRPR_TT_I	wrpr	%r0, 0x0074, %tt
DS_7_42:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 96: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_7_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_43:
	.word 0x8f902000  ! 97: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9f8036fb  ! 98: SIR	sir	0x16fb
debug_7_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 99: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_7_45:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 100: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0x20800001  ! 101: BN	bn,a	<label_0x1>
change_to_randtl_7_46:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_46:
	.word 0x8f902001  ! 102: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa150c000  ! 103: RDPR_TT	rdpr	%tt, %r16
	.word 0x36800001  ! 104: BGE	bge,a	<label_0x1>
	.word 0x87902328  ! 105: WRPR_TT_I	wrpr	%r0, 0x0328, %tt
	.word 0x8d90313c  ! 106: WRPR_PSTATE_I	wrpr	%r0, 0x113c, %pstate
splash_hpstate_7_47:
	.word 0x8198215e  ! 107: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015e, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 108: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd0d004a0  ! 109: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
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
	.word 0x97414000  ! 110: RDPC	rd	%pc, %r11
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01963  ! 111: FqTOd	dis not found

	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 112: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 113: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28804a0  ! 114: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x8d902924  ! 115: WRPR_PSTATE_I	wrpr	%r0, 0x0924, %pstate
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
	.word 0x93414000  ! 116: RDPC	rd	%pc, %r9
DS_7_51:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe5350010  ! 1: STQF_R	-	%f18, [%r16, %r20]
	normalw
	.word 0x95458000  ! 117: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x3a700001  ! 118: BPCC	<illegal instruction>
splash_hpstate_7_52:
	.word 0x81982b04  ! 119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b04, %hpstate
	.word 0xe6d004a0  ! 120: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996b7d78  ! 121: SDIVX_I	sdivx	%r13, 0xfffffd78, %r12
	.word 0x95540000  ! 122: RDPR_GL	rdpr	%-, %r10
DS_7_54:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 123: RESTORE_R	restore	%r31, %r0, %r31
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_55
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_55:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e007  ! 124: CASA_R	casa	[%r31] %asi, %r7, %r20
change_to_randtl_7_56:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_56:
	.word 0x8f902002  ! 125: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe8800ba0  ! 126: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r20
	.word 0xa8d33fc5  ! 127: UMULcc_I	umulcc 	%r12, 0xffffffc5, %r20
splash_lsu_7_57:
	setx 0x7e623331314c2727, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 128: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_7_58:
	tsubcctv %r25, 0x16bf, %r17
	.word 0xd207ec1f  ! 129: LDUW_I	lduw	[%r31 + 0x0c1f], %r9
	.word 0xd297e000  ! 130: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r9
	.word 0x91943d40  ! 131: WRPR_PIL_I	wrpr	%r16, 0x1d40, %pil
	setx 0x187270f4f1697d00, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_59:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 133: WRASI_I	wr	%r0, 0x001c, %asi
DS_7_60:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 134: SAVE_R	save	%r31, %r0, %r31
	.word 0xd28008a0  ! 135: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
memptr_7_61:
	set 0x60340000, %r31
	.word 0x858360f3  ! 136: WRCCR_I	wr	%r13, 0x00f3, %ccr
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 137: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_62
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_62:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e007  ! 138: CASA_R	casa	[%r31] %asi, %r7, %r9
	.word 0x87802055  ! 139: WRASI_I	wr	%r0, 0x0055, %asi
change_to_randtl_7_63:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_63:
	.word 0x8f902000  ! 140: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 141: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd26feb9a  ! 142: LDSTUB_I	ldstub	%r9, [%r31 + 0x0b9a]
	.word 0xa753c000  ! 143: RDPR_FQ	<illegal instruction>
	.word 0xd6cfe010  ! 144: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01974  ! 145: FqTOd	dis not found

debug_7_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 146: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_66:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 147: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x91927658  ! 148: WRPR_PIL_I	wrpr	%r9, 0x1658, %pil
DS_7_67:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe5118013  ! 1: LDQF_R	-	[%r6, %r19], %f18
	.word 0x95a28834  ! 149: FADDs	fadds	%f10, %f20, %f10
pmu_7_68:
	nop
	setx 0xfffff1c7fffffdf2, %g1, %g7
	.word 0xa3800007  ! 150: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38800001  ! 151: BGU	bgu,a	<label_0x1>
	.word 0xe33fc000  ! 152: STDF_R	std	%f17, [%r0, %r31]
splash_cmpr_7_69:
	setx 0x3adacd2a6bf28ea6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 153: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9b450000  ! 154: RD_SET_SOFTINT	rd	%set_softint, %r13
donret_7_70:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_70-donret_7_70), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_70:
	.word 0xe4fff6c3  ! 155: SWAPA_I	swapa	%r18, [%r31 + 0xfffff6c3] %asi
pmu_7_71:
	nop
	setx 0xffffffb9fffffede, %g1, %g7
	.word 0xa3800007  ! 156: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_7_72:
	setx 0x2ac0c99bf761b795, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 157: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d90337e  ! 158: WRPR_PSTATE_I	wrpr	%r0, 0x137e, %pstate
	.word 0xe48fe020  ! 159: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r18
change_to_randtl_7_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_73:
	.word 0x8f902002  ! 160: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x93d020b3  ! 161: Tcc_I	tne	icc_or_xcc, %r0 + 179
splash_tba_7_74:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 162: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_75
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_75:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 163: RDPC	rd	%pc, %r10
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 164: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_7_76:
	setx 0x22ea28d44dcdb6ef, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 165: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
cwp_7_77:
    set user_data_start, %o7
	.word 0x93902001  ! 166: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd68008a0  ! 167: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_78
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_78
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_78:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 168: RDPC	rd	%pc, %r10
	.word 0xa0fb4010  ! 169: SDIVcc_R	sdivcc 	%r13, %r16, %r16
splash_cmpr_7_79:
	setx 0x3b6e932532af97ae, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 170: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95a00170  ! 171: FABSq	dis not found

	.word 0xe097e000  ! 172: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r16
mondo_7_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d94800c  ! 173: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
	.word 0x87802058  ! 174: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x91d02034  ! 175: Tcc_I	ta	icc_or_xcc, %r0 + 52
memptr_7_81:
	set user_data_start, %r31
	.word 0x8580ee45  ! 176: WRCCR_I	wr	%r3, 0x0e45, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 177: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe0c804a0  ! 178: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96a29ac  ! 179: SDIVX_I	sdivx	%r8, 0x09ac, %r20
	.word 0x99480000  ! 180: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
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
	.word 0xd7e7e012  ! 181: CASA_R	casa	[%r31] %asi, %r18, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_84) + 0, 16, 16)) -> intp(1,0,2)
intvec_7_84:
	.word 0x39400001  ! 182: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd727c000  ! 183: STF_R	st	%f11, [%r0, %r31]
mondo_7_85:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d948007  ! 184: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
splash_lsu_7_86:
	setx 0x60fd7d7ebf26746b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe000  ! 186: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
debug_7_87:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 187: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0xd67ff8cc  ! 188: SWAP_I	swap	%r11, [%r31 + 0xfffff8cc]
	.word 0x87802004  ! 189: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91a049d4  ! 190: FDIVd	fdivd	%f32, %f20, %f8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_88) + 24, 16, 16)) -> intp(0,0,2)
intvec_7_88:
	.word 0x39400001  ! 191: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 192: WRASI_I	wr	%r0, 0x0014, %asi
	setx 0x1f2515c15368990b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_89:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_7_90:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 194: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
splash_lsu_7_91:
	setx 0x964ccc4cf9575deb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 195: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_7_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 196: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_7_93:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 197: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
debug_7_94:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 198: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_95
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_95:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 199: RDPC	rd	%pc, %r20
	.word 0xe07ff8cc  ! 200: SWAP_I	swap	%r16, [%r31 + 0xfffff8cc]
	.word 0x8d902f81  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x0f81, %pstate
tagged_7_96:
	tsubcctv %r16, 0x145b, %r22
	.word 0xe007f8cc  ! 202: LDUW_I	lduw	[%r31 + 0xfffff8cc], %r16
mondo_7_97:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d90c002  ! 203: WRPR_WSTATE_R	wrpr	%r3, %r2, %wstate
	.word 0x99a409d0  ! 204: FDIVd	fdivd	%f16, %f16, %f12
	.word 0x8d902949  ! 205: WRPR_PSTATE_I	wrpr	%r0, 0x0949, %pstate
splash_lsu_7_98:
	setx 0x112922887b2e5ab3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 206: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa8d4f3d7  ! 207: UMULcc_I	umulcc 	%r19, 0xfffff3d7, %r20
	.word 0xad81eed6  ! 208: WR_SOFTINT_REG_I	wr	%r7, 0x0ed6, %softint
	.word 0x93a489c3  ! 209: FDIVd	fdivd	%f18, %f34, %f40
	.word 0x97a00166  ! 210: FABSq	dis not found

	.word 0x87802083  ! 211: WRASI_I	wr	%r0, 0x0083, %asi
debug_7_99:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 212: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_100
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_100:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00b  ! 213: CASA_R	casa	[%r31] %asi, %r11, %r18
splash_tba_7_101:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 214: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_7_102:
	setx 0x4e72cf17dc36e921, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x81460000  ! 217: RD_STICK_REG	stbar
	.word 0xe49004a0  ! 218: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01971  ! 219: FqTOd	dis not found

tagged_7_104:
	tsubcctv %r17, 0x15e3, %r26
	.word 0xe807e50d  ! 220: LDUW_I	lduw	[%r31 + 0x050d], %r20
	.word 0x9190e3fb  ! 221: WRPR_PIL_I	wrpr	%r3, 0x03fb, %pil
pmu_7_105:
	nop
	setx 0xfffff15efffff589, %g1, %g7
	.word 0xa3800007  ! 222: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_7_106:
	setx 0xa8fbd295435ef6a9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 224: LDX_R	ldx	[%r31 + %r0], %r20
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 225: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe83fe48b  ! 226: STD_I	std	%r20, [%r31 + 0x048b]
	.word 0x8d802000  ! 227: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x97703dd8  ! 228: POPC_I	popc	0x1dd8, %r11
splash_hpstate_7_107:
	.word 0x81982395  ! 229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0395, %hpstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e003  ! 230: CASA_R	casa	[%r31] %asi, %r3, %r8
	.word 0x99480000  ! 231: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
splash_htba_7_109:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 232: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d903fec  ! 233: WRPR_PSTATE_I	wrpr	%r0, 0x1fec, %pstate
debug_7_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 234: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_7_111:
	taddcctv %r16, 0x1837, %r13
	.word 0xd607f25b  ! 235: LDUW_I	lduw	[%r31 + 0xfffff25b], %r11
cwp_7_112:
    set user_data_start, %o7
	.word 0x93902005  ! 236: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_cmpr_7_113:
	setx 0x9347017a235a2a67, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 237: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd677c000  ! 238: STX_R	stx	%r11, [%r31 + %r0]
	.word 0xa984000d  ! 239: WR_SET_SOFTINT_R	wr	%r16, %r13, %set_softint
memptr_7_114:
	set user_data_start, %r31
	.word 0x8581e87a  ! 240: WRCCR_I	wr	%r7, 0x087a, %ccr
debug_7_115:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 241: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 242: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_7_116:
	setx 0xb0c0f5aad6a295ef, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 243: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f8024eb  ! 244: SIR	sir	0x04eb
	.word 0xab814009  ! 245: WR_CLEAR_SOFTINT_R	wr	%r5, %r9, %clear_softint
tagged_7_117:
	taddcctv %r15, 0x13c5, %r2
	.word 0xd607fea4  ! 246: LDUW_I	lduw	[%r31 + 0xfffffea4], %r11
debug_7_118:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 247: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_7_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d91c004  ! 248: WRPR_WSTATE_R	wrpr	%r7, %r4, %wstate
	.word 0x9b500000  ! 249: RDPR_TPC	rdpr	%tpc, %r13
tagged_7_120:
	tsubcctv %r7, 0x13f7, %r12
	.word 0xd807fea4  ! 250: LDUW_I	lduw	[%r31 + 0xfffffea4], %r12
	.word 0x97a00174  ! 251: FABSq	dis not found

	.word 0xd6c004a0  ! 252: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
splash_lsu_7_121:
	setx 0xfe879724ccbef801, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 253: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_7_122:
	set 0x60140000, %r31
	.word 0x85822e65  ! 254: WRCCR_I	wr	%r8, 0x0e65, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 255: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6d7e010  ! 256: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r11
splash_cmpr_7_123:
	setx 0x9333485301844be0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 257: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91500000  ! 259: RDPR_TPC	<illegal instruction>
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_124:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 260: CASA_R	casa	[%r31] %asi, %r5, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01968  ! 262: FqTOd	dis not found

	.word 0x8d902d8c  ! 263: WRPR_PSTATE_I	wrpr	%r0, 0x0d8c, %pstate
DS_7_126:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xfb5edb1b	! Random illegal ?
	.word 0xa7a00545  ! 1: FSQRTd	fsqrt	
	.word 0x99a10827  ! 264: FADDs	fadds	%f4, %f7, %f12
	.word 0xd68008a0  ! 265: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
intveclr_7_127:
	setx 0xfbac6a15b04aa3d0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 266: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91520000  ! 267: RDPR_PIL	rdpr	%pil, %r8
	.word 0xab830001  ! 268: WR_CLEAR_SOFTINT_R	wr	%r12, %r1, %clear_softint
splash_cmpr_7_128:
	setx 0x052c471d29035257, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 269: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196d  ! 270: FqTOd	dis not found

splash_cmpr_7_130:
	setx 0xa9972041d541fcd6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 271: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_131
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_131:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 272: RDPC	rd	%pc, %r13
splash_cmpr_7_132:
	setx 0x308a63df1b94714b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 273: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_7_133:
	taddcctv %r15, 0x135b, %r22
	.word 0xda07edb6  ! 274: LDUW_I	lduw	[%r31 + 0x0db6], %r13
mondo_7_134:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d948014  ! 275: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	rd %pc, %r19
	add %r19, (ivw_7_135-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_135:
	.word 0x91918003  ! 276: WRPR_PIL_R	wrpr	%r6, %r3, %pil
cwp_7_136:
    set user_data_start, %o7
	.word 0x93902005  ! 277: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
tagged_7_137:
	taddcctv %r19, 0x1fd4, %r24
	.word 0xda07edb6  ! 278: LDUW_I	lduw	[%r31 + 0x0db6], %r13
cwp_7_138:
    set user_data_start, %o7
	.word 0x93902007  ! 279: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 280: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_7_139:
	setx 0x62270e1cb65689ec, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 281: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99450000  ! 282: RD_SET_SOFTINT	rd	%set_softint, %r12
splash_tba_7_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 283: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_7_141:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 284: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
debug_7_142:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 285: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200a  ! 286: WRPR_GL_I	wrpr	%r0, 0x000a, %-
cwp_7_143:
    set user_data_start, %o7
	.word 0x93902004  ! 287: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87902013  ! 288: WRPR_TT_I	wrpr	%r0, 0x0013, %tt
	.word 0x9570359d  ! 289: POPC_I	popc	0x159d, %r10
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_144
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_144:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 290: RDPC	rd	%pc, %r8
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_145
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_145
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_145:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 291: RDPC	rd	%pc, %r20
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 292: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x95a00174  ! 293: FABSq	dis not found

splash_hpstate_7_146:
	.word 0x81982e47  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e47, %hpstate
mondo_7_147:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d944004  ! 295: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
	.word 0x81460000  ! 296: RD_STICK_REG	stbar
	.word 0x87902165  ! 297: WRPR_TT_I	wrpr	%r0, 0x0165, %tt
tagged_7_148:
	tsubcctv %r24, 0x1947, %r14
	.word 0xda07e368  ! 298: LDUW_I	lduw	[%r31 + 0x0368], %r13
splash_tba_7_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 299: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xda6fe368  ! 300: LDSTUB_I	ldstub	%r13, [%r31 + 0x0368]
splash_cmpr_7_150:
	setx 0x39236eceb14c88ef, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 301: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdabfe368  ! 302: STDA_I	stda	%r13, [%r31 + 0x0368] %asi
splash_tba_7_151:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91a00172  ! 304: FABSq	dis not found

	.word 0xda47e368  ! 305: LDSW_I	ldsw	[%r31 + 0x0368], %r13
	.word 0x8d90353d  ! 306: WRPR_PSTATE_I	wrpr	%r0, 0x153d, %pstate
	rd %pc, %r19
	add %r19, (ivw_7_152-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_152:
	.word 0x9194c004  ! 307: WRPR_PIL_R	wrpr	%r19, %r4, %pil
DS_7_153:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa9a4c9c0  ! 1: FDIVd	fdivd	%f50, %f0, %f20
	normalw
	.word 0x93458000  ! 308: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xd33fe368  ! 309: STDF_I	std	%f9, [0x0368, %r31]
	.word 0x91d020b2  ! 310: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x9b50c000  ! 311: RDPR_TT	rdpr	%tt, %r13
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00d  ! 312: CASA_R	casa	[%r31] %asi, %r13, %r9
tagged_7_155:
	taddcctv %r11, 0x1751, %r17
	.word 0xd207e368  ! 313: LDUW_I	lduw	[%r31 + 0x0368], %r9
DS_7_156:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 314: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16d3c7b  ! 315: SDIVX_I	sdivx	%r20, 0xfffffc7b, %r16
	.word 0xe8dfe030  ! 316: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r20
debug_7_158:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 318: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_7_159:
	set 0x00390000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00390000, %r12
	.word 0x8b98000c  ! 319: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_160
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_160:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 320: RDPC	rd	%pc, %r9
	.word 0xe537c000  ! 321: STQF_R	-	%f18, [%r0, %r31]
	.word 0x9b464000  ! 322: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0x91d020b3  ! 323: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xab84c012  ! 324: WR_CLEAR_SOFTINT_R	wr	%r19, %r18, %clear_softint
	.word 0xd28804a0  ! 325: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
splash_cmpr_7_161:
	setx 0xe2154ce19e302aa2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902001  ! 327: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
DS_7_162:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd55a1663	! Random illegal ?
	.word 0xa5a449d0  ! 1: FDIVd	fdivd	%f48, %f16, %f18
	.word 0x95a4c830  ! 328: FADDs	fadds	%f19, %f16, %f10
	.word 0x8d903d98  ! 329: WRPR_PSTATE_I	wrpr	%r0, 0x1d98, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 330: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd08fe030  ! 331: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r8
mondo_7_163:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d900008  ! 332: WRPR_WSTATE_R	wrpr	%r0, %r8, %wstate
	.word 0xa8812b32  ! 333: ADDcc_I	addcc 	%r4, 0x0b32, %r20
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 334: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_hpstate_7_164:
	.word 0x819829c4  ! 335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c4, %hpstate
tagged_7_165:
	taddcctv %r21, 0x1ed1, %r12
	.word 0xda07fbd4  ! 336: LDUW_I	lduw	[%r31 + 0xfffffbd4], %r13
	.word 0xa1902002  ! 337: WRPR_GL_I	wrpr	%r0, 0x0002, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_166) + 32, 16, 16)) -> intp(3,0,31)
intvec_7_166:
	.word 0x39400001  ! 338: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_decr_7_167:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r9, [%r1] 0x45
	.word 0xa7814010  ! 339: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r16, %-
splash_hpstate_7_168:
	.word 0x819820c7  ! 340: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c7, %hpstate
DS_7_169:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 341: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d902c54  ! 342: WRPR_PSTATE_I	wrpr	%r0, 0x0c54, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_170) + 0, 16, 16)) -> intp(5,0,15)
intvec_7_170:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 344: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xa1902009  ! 345: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_lsu_7_171:
	setx 0x831f595a85d0193f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 346: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_7_172:
    set user_data_start, %o7
	.word 0x93902004  ! 347: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_cmpr_7_173:
	setx 0xcc6c72b0c827ff13, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 348: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdac804a0  ! 349: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0xa3520000  ! 350: RDPR_PIL	<illegal instruction>
	.word 0xd4c00e60  ! 351: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r10
donret_7_174:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_174-donret_7_174), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_174:
	.word 0xd4fffbd4  ! 352: SWAPA_I	swapa	%r10, [%r31 + 0xfffffbd4] %asi
intveclr_7_175:
	setx 0xaa932ccf2b0a51f4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 353: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_7_176:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 354: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
cwp_7_177:
    set user_data_start, %o7
	.word 0x93902007  ! 355: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
change_to_randtl_7_178:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_178:
	.word 0x8f902001  ! 356: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd51fc000  ! 357: LDDF_R	ldd	[%r31, %r0], %f10
	.word 0x87802055  ! 358: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xd4c80e60  ! 359: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r10
	.word 0x91d02032  ! 360: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xad81758a  ! 361: WR_SOFTINT_REG_I	wr	%r5, 0x158a, %softint
splash_htba_7_179:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 362: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4c80e80  ! 363: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 364: LDX_R	ldx	[%r31 + %r0], %r10
memptr_7_180:
	set user_data_start, %r31
	.word 0x8584692d  ! 365: WRCCR_I	wr	%r17, 0x092d, %ccr
debug_7_181:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 366: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_7_182:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 367: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_7_183:
	set 0x00390000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00390000, %r12
	.word 0x8b98000c  ! 368: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4d804a0  ! 369: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
debug_7_184:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 370: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd4c004a0  ! 371: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0xd4d004a0  ! 372: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
splash_lsu_7_185:
	setx 0x523d7b4edab7672d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 373: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 374: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 375: LDX_R	ldx	[%r31 + %r0], %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_186) + 16, 16, 16)) -> intp(6,0,13)
intvec_7_186:
	.word 0x39400001  ! 376: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f802a6f  ! 377: SIR	sir	0x0a6f
	setx 0xb9aaad45797fa49d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_187:
	.word 0x39400001  ! 378: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 379: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_7_188:
	.word 0x81982917  ! 380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0917, %hpstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_189:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e008  ! 381: CASA_R	casa	[%r31] %asi, %r8, %r10
debug_7_190:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 382: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_191
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_191
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_191:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 383: RDPC	rd	%pc, %r13
	.word 0xd6c7e030  ! 384: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
cwp_7_192:
    set user_data_start, %o7
	.word 0x93902006  ! 385: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd68008a0  ! 386: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd6ffc028  ! 387: SWAPA_R	swapa	%r11, [%r31 + %r8] 0x01
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_193:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 388: CASA_R	casa	[%r31] %asi, %r8, %r11
debug_7_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01973  ! 390: FqTOd	dis not found

splash_hpstate_7_196:
	.word 0x8198250f  ! 391: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050f, %hpstate
	.word 0x879020ba  ! 392: WRPR_TT_I	wrpr	%r0, 0x00ba, %tt
	setx 0x453748b608a41715, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_197:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_7_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d92c007  ! 394: WRPR_WSTATE_R	wrpr	%r11, %r7, %wstate
	.word 0x9ad47e08  ! 395: UMULcc_I	umulcc 	%r17, 0xfffffe08, %r13
	.word 0xda8804a0  ! 396: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x95a509cb  ! 397: FDIVd	fdivd	%f20, %f42, %f10
splash_cmpr_7_199:
	setx 0xb6ff97c12f49e5fe, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97a00544  ! 399: FSQRTd	fsqrt	
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 400: LDX_R	ldx	[%r31 + %r0], %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
change_to_randtl_6_0:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_0:
	.word 0xd8d7e000  ! 1: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
splash_cmpr_6_1:
	setx 0xa5333d630970cd70, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 2: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 3: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8780208b  ! 4: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x87902271  ! 5: WRPR_TT_I	wrpr	%r0, 0x0271, %tt
debug_6_3:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 6: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
cwp_6_4:
    set user_data_start, %o7
	.word 0x93902006  ! 7: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d902e62  ! 8: WRPR_PSTATE_I	wrpr	%r0, 0x0e62, %pstate
splash_cmpr_6_5:
	setx 0x905a6e25fecfd57b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 9: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_6_6:
    set user_data_start, %o7
	.word 0x93902003  ! 10: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_6_7:
	setx 0x555629d7ec33db8d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 11: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_6_8:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 12: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x38800001  ! 13: BGU	bgu,a	<label_0x1>
	.word 0xd86fe5b9  ! 14: LDSTUB_I	ldstub	%r12, [%r31 + 0x05b9]
	.word 0x93d02032  ! 15: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8d903bce  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x1bce, %pstate
	.word 0x30800001  ! 17: BA	ba,a	<label_0x1>
	.word 0xa1902001  ! 18: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 19: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd897e020  ! 20: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r12
	.word 0x8d903aef  ! 21: WRPR_PSTATE_I	wrpr	%r0, 0x1aef, %pstate
	.word 0x99520000  ! 22: RDPR_PIL	rdpr	%pil, %r12
DS_6_9:
	.word 0x93a4c9cb  ! 1: FDIVd	fdivd	%f50, %f42, %f40
	.word 0xd734c011  ! 1: STQF_R	-	%f11, [%r17, %r19]
	normalw
	.word 0x99458000  ! 23: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x879022ca  ! 24: WRPR_TT_I	wrpr	%r0, 0x02ca, %tt
donret_6_10:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_10-donret_6_10), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_10:
	.word 0xd4ffe5b9  ! 25: SWAPA_I	swapa	%r10, [%r31 + 0x05b9] %asi
	.word 0x91d020b4  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xd46fe5b9  ! 27: LDSTUB_I	ldstub	%r10, [%r31 + 0x05b9]
	.word 0x93480000  ! 28: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
splash_htba_6_11:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 29: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d902840  ! 30: WRPR_PSTATE_I	wrpr	%r0, 0x0840, %pstate
splash_cmpr_6_12:
	setx 0x7abe8dc9e840b71d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 31: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 32: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa169e9d4  ! 33: SDIVX_I	sdivx	%r7, 0x09d4, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 34: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4c7e020  ! 35: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r10
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 36: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_6_14:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 37: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd48804a0  ! 38: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x93d02034  ! 39: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xd45feeec  ! 40: LDX_I	ldx	[%r31 + 0x0eec], %r10
	.word 0x91d02034  ! 41: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_6_15:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x99b00309  ! 42: ALIGNADDRESS	alignaddr	%r0, %r9, %r12
debug_6_16:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 43: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_17
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_17:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 44: RDPC	rd	%pc, %r10
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 45: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa9500000  ! 46: RDPR_TPC	<illegal instruction>
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 47: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d903471  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x1471, %pstate
	.word 0xe6d7e020  ! 49: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r19
splash_cmpr_6_18:
	setx 0xaf20a2b23892d710, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_6_19:
    set user_data_start, %o7
	.word 0x93902005  ! 51: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_20) + 0, 16, 16)) -> intp(7,0,31)
intvec_6_20:
	.word 0x39400001  ! 52: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe637eeec  ! 53: STH_I	sth	%r19, [%r31 + 0x0eec]
memptr_6_21:
	set user_data_start, %r31
	.word 0x85806ee5  ! 54: WRCCR_I	wr	%r1, 0x0ee5, %ccr
splash_hpstate_6_22:
	.word 0x81982207  ! 55: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0207, %hpstate
	.word 0x94dc0005  ! 56: SMULcc_R	smulcc 	%r16, %r5, %r10
	.word 0xa9a449c5  ! 57: FDIVd	fdivd	%f48, %f36, %f20
memptr_6_23:
	set 0x60340000, %r31
	.word 0x85802d3a  ! 58: WRCCR_I	wr	%r0, 0x0d3a, %ccr
	.word 0xd4d004a0  ! 59: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 60: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_6_24:
	.word 0x81982697  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0697, %hpstate
change_to_randtl_6_25:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_25:
	.word 0x8f902000  ! 62: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x87802014  ! 63: WRASI_I	wr	%r0, 0x0014, %asi
tagged_6_26:
	tsubcctv %r17, 0x16e0, %r21
	.word 0xd407ee0f  ! 64: LDUW_I	lduw	[%r31 + 0x0e0f], %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996d357c  ! 65: SDIVX_I	sdivx	%r20, 0xfffff57c, %r12
	.word 0x8780201c  ! 66: WRASI_I	wr	%r0, 0x001c, %asi
memptr_6_28:
	set 0x60340000, %r31
	.word 0x85843523  ! 67: WRCCR_I	wr	%r16, 0x1523, %ccr
	setx 0x0177d81596a66f42, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_29:
	.word 0x39400001  ! 68: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_30:
	setx 0x0d25709ead66adde, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 69: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_6_31:
	setx 0x5c9a797ea9d65167, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 70: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_32) + 56, 16, 16)) -> intp(5,0,28)
intvec_6_32:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda6ffb07  ! 72: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffffb07]
	.word 0xdadfe030  ! 73: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
	.word 0xda27fb07  ! 74: STW_I	stw	%r13, [%r31 + 0xfffffb07]
donret_6_33:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_33-donret_6_33-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_33:
	.word 0xdafffb07  ! 75: SWAPA_I	swapa	%r13, [%r31 + 0xfffffb07] %asi
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_34
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_34
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_34:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 76: RDPC	rd	%pc, %r8
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 77: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99540000  ! 78: RDPR_GL	rdpr	%-, %r12
	setx 0xedff9c35941a6dd5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_35:
	.word 0x39400001  ! 79: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4dfe010  ! 80: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r10
DS_6_36:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 81: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 82: LDX_R	ldx	[%r31 + %r0], %r10
splash_lsu_6_37:
	setx 0x146a76281956038d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 83: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99500000  ! 84: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x91450000  ! 85: RD_SET_SOFTINT	rd	%set_softint, %r8
debug_6_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 86: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 87: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xa4fa7c5c  ! 88: SDIVcc_I	sdivcc 	%r9, 0xfffffc5c, %r18
	.word 0xab82b985  ! 89: WR_CLEAR_SOFTINT_I	wr	%r10, 0x1985, %clear_softint
	.word 0xd0880e40  ! 90: LDUBA_R	lduba	[%r0, %r0] 0x72, %r8
debug_6_39:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 91: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_40:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00b  ! 92: CASA_R	casa	[%r31] %asi, %r11, %r8
cwp_6_41:
    set user_data_start, %o7
	.word 0x93902001  ! 93: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd13fc000  ! 94: STDF_R	std	%f8, [%r0, %r31]
	.word 0x87902085  ! 95: WRPR_TT_I	wrpr	%r0, 0x0085, %tt
DS_6_42:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 96: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_6_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_43:
	.word 0x8f902002  ! 97: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x9f803929  ! 98: SIR	sir	0x1929
debug_6_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 99: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_6_45:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 100: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0x20800001  ! 101: BN	bn,a	<label_0x1>
change_to_randtl_6_46:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_46:
	.word 0x8f902000  ! 102: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9b50c000  ! 103: RDPR_TT	rdpr	%tt, %r13
	.word 0x36800001  ! 104: BGE	bge,a	<label_0x1>
	.word 0x87902037  ! 105: WRPR_TT_I	wrpr	%r0, 0x0037, %tt
	.word 0x8d903f81  ! 106: WRPR_PSTATE_I	wrpr	%r0, 0x1f81, %pstate
splash_hpstate_6_47:
	.word 0x8198234e  ! 107: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034e, %hpstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 108: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd0d004a0  ! 109: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
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
	.word 0x9b414000  ! 110: RDPC	rd	%pc, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a0196a  ! 111: FqTOd	dis not found

	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 112: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 113: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28804a0  ! 114: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x8d903093  ! 115: WRPR_PSTATE_I	wrpr	%r0, 0x1093, %pstate
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
	.word 0xa9414000  ! 116: RDPC	rd	%pc, %r20
DS_6_51:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd5310002  ! 1: STQF_R	-	%f10, [%r2, %r4]
	normalw
	.word 0xa5458000  ! 117: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0x3a700001  ! 118: BPCC	<illegal instruction>
splash_hpstate_6_52:
	.word 0x8198231e  ! 119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031e, %hpstate
	.word 0xe6d004a0  ! 120: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6971be  ! 121: SDIVX_I	sdivx	%r5, 0xfffff1be, %r13
	.word 0x97540000  ! 122: RDPR_GL	rdpr	%-, %r11
DS_6_54:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 123: RESTORE_R	restore	%r31, %r0, %r31
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_55
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_55:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e007  ! 124: CASA_R	casa	[%r31] %asi, %r7, %r20
change_to_randtl_6_56:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_56:
	.word 0x8f902000  ! 125: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe88008a0  ! 126: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x98d0f25d  ! 127: UMULcc_I	umulcc 	%r3, 0xfffff25d, %r12
splash_lsu_6_57:
	setx 0x4d39feac835aa019, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 128: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_6_58:
	tsubcctv %r16, 0x1e1f, %r8
	.word 0xd207ec1f  ! 129: LDUW_I	lduw	[%r31 + 0x0c1f], %r9
	.word 0xd297e010  ! 130: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r9
	.word 0x9192aa06  ! 131: WRPR_PIL_I	wrpr	%r10, 0x0a06, %pil
	setx 0x83761594839f096a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_59:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 133: WRASI_I	wr	%r0, 0x0010, %asi
DS_6_60:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 134: SAVE_R	save	%r31, %r0, %r31
	.word 0xd2800bc0  ! 135: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r9
memptr_6_61:
	set 0x60740000, %r31
	.word 0x8581eca1  ! 136: WRCCR_I	wr	%r7, 0x0ca1, %ccr
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 137: Tcc_R	te	icc_or_xcc, %r0 + %r30
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_62
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_62:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e007  ! 138: CASA_R	casa	[%r31] %asi, %r7, %r9
	.word 0x87802080  ! 139: WRASI_I	wr	%r0, 0x0080, %asi
change_to_randtl_6_63:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_63:
	.word 0x8f902001  ! 140: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 141: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd26feb9a  ! 142: LDSTUB_I	ldstub	%r9, [%r31 + 0x0b9a]
	.word 0xa753c000  ! 143: RDPR_FQ	<illegal instruction>
	.word 0xd6cfe000  ! 144: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01967  ! 145: FqTOd	dis not found

debug_6_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 146: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_66:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 147: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x9191ae1d  ! 148: WRPR_PIL_I	wrpr	%r6, 0x0e1d, %pil
DS_6_67:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe914c011  ! 1: LDQF_R	-	[%r19, %r17], %f20
	.word 0xa3a2c826  ! 149: FADDs	fadds	%f11, %f6, %f17
pmu_6_68:
	nop
	setx 0xfffff42efffff476, %g1, %g7
	.word 0xa3800007  ! 150: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38800001  ! 151: BGU	bgu,a	<label_0x1>
	.word 0xe33fc000  ! 152: STDF_R	std	%f17, [%r0, %r31]
splash_cmpr_6_69:
	setx 0x1efe0c1009fb53e6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 153: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95450000  ! 154: RD_SET_SOFTINT	rd	%set_softint, %r10
donret_6_70:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_70-donret_6_70), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_70:
	.word 0xe4fff6c3  ! 155: SWAPA_I	swapa	%r18, [%r31 + 0xfffff6c3] %asi
pmu_6_71:
	nop
	setx 0xfffff7e9fffff4f7, %g1, %g7
	.word 0xa3800007  ! 156: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_6_72:
	setx 0x582aaf782ef07dbc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 157: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d90225e  ! 158: WRPR_PSTATE_I	wrpr	%r0, 0x025e, %pstate
	.word 0xe48fe010  ! 159: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r18
change_to_randtl_6_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_73:
	.word 0x8f902003  ! 160: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x91d02035  ! 161: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_tba_6_74:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 162: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_75
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_75:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 163: RDPC	rd	%pc, %r19
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 164: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_6_76:
	setx 0xeec4f6dc2113da5e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 165: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
cwp_6_77:
    set user_data_start, %o7
	.word 0x93902005  ! 166: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd6800ae0  ! 167: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r11
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_78
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_78
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_78:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 168: RDPC	rd	%pc, %r13
	.word 0x96fc8004  ! 169: SDIVcc_R	sdivcc 	%r18, %r4, %r11
splash_cmpr_6_79:
	setx 0xadd5708428f5839f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 170: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95a00165  ! 171: FABSq	dis not found

	.word 0xe097e020  ! 172: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r16
mondo_6_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d950001  ! 173: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
	.word 0x8780208b  ! 174: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x93d02033  ! 175: Tcc_I	tne	icc_or_xcc, %r0 + 51
memptr_6_81:
	set user_data_start, %r31
	.word 0x8582e341  ! 176: WRCCR_I	wr	%r11, 0x0341, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 177: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe0c804a0  ! 178: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916862d7  ! 179: SDIVX_I	sdivx	%r1, 0x02d7, %r8
	.word 0xa9480000  ! 180: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
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
	.word 0xd7e7e012  ! 181: CASA_R	casa	[%r31] %asi, %r18, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_84) + 40, 16, 16)) -> intp(0,0,27)
intvec_6_84:
	.word 0x39400001  ! 182: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd727c000  ! 183: STF_R	st	%f11, [%r0, %r31]
mondo_6_85:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d904003  ! 184: WRPR_WSTATE_R	wrpr	%r1, %r3, %wstate
splash_lsu_6_86:
	setx 0xdf326603ae8a3bfd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe020  ! 186: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
debug_6_87:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 187: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0xd67ff8cc  ! 188: SWAP_I	swap	%r11, [%r31 + 0xfffff8cc]
	.word 0x8780208a  ! 189: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0x95a009d2  ! 190: FDIVd	fdivd	%f0, %f18, %f10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_88) + 24, 16, 16)) -> intp(3,0,21)
intvec_6_88:
	.word 0x39400001  ! 191: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 192: WRASI_I	wr	%r0, 0x0020, %asi
	setx 0x334a4c71ce6ed3b5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_89:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_6_90:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 194: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
splash_lsu_6_91:
	setx 0x80f62b2d86a59881, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 195: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_6_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 196: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_6_93:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 197: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
debug_6_94:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 198: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_95
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_95:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 199: RDPC	rd	%pc, %r18
	.word 0xe07ff8cc  ! 200: SWAP_I	swap	%r16, [%r31 + 0xfffff8cc]
	.word 0x8d902ad6  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x0ad6, %pstate
tagged_6_96:
	tsubcctv %r3, 0x1c4f, %r16
	.word 0xe007f8cc  ! 202: LDUW_I	lduw	[%r31 + 0xfffff8cc], %r16
mondo_6_97:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d92c003  ! 203: WRPR_WSTATE_R	wrpr	%r11, %r3, %wstate
	.word 0x9ba309d0  ! 204: FDIVd	fdivd	%f12, %f16, %f44
	.word 0x8d902b75  ! 205: WRPR_PSTATE_I	wrpr	%r0, 0x0b75, %pstate
splash_lsu_6_98:
	setx 0x3e6b0a2bc2c668e9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 206: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa0d2364c  ! 207: UMULcc_I	umulcc 	%r8, 0xfffff64c, %r16
	.word 0xad846bc0  ! 208: WR_SOFTINT_REG_I	wr	%r17, 0x0bc0, %softint
	.word 0xa5a409cc  ! 209: FDIVd	fdivd	%f16, %f12, %f18
	.word 0x93a0016d  ! 210: FABSq	dis not found

	.word 0x87802004  ! 211: WRASI_I	wr	%r0, 0x0004, %asi
debug_6_99:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 212: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_100
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_100:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00b  ! 213: CASA_R	casa	[%r31] %asi, %r11, %r18
splash_tba_6_101:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 214: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_6_102:
	setx 0x1218fb080915ae0b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x81460000  ! 217: RD_STICK_REG	stbar
	.word 0xe49004a0  ! 218: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01971  ! 219: FqTOd	dis not found

tagged_6_104:
	tsubcctv %r25, 0x1434, %r22
	.word 0xe807e50d  ! 220: LDUW_I	lduw	[%r31 + 0x050d], %r20
	.word 0x91906305  ! 221: WRPR_PIL_I	wrpr	%r1, 0x0305, %pil
pmu_6_105:
	nop
	setx 0xfffffee7fffffcab, %g1, %g7
	.word 0xa3800007  ! 222: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_6_106:
	setx 0x69f73a10f1ba90b9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 224: LDX_R	ldx	[%r31 + %r0], %r20
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 225: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe83fe48b  ! 226: STD_I	std	%r20, [%r31 + 0x048b]
	.word 0x8d802000  ! 227: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa77023f6  ! 228: POPC_I	popc	0x03f6, %r19
splash_hpstate_6_107:
	.word 0x81982dc6  ! 229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc6, %hpstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e003  ! 230: CASA_R	casa	[%r31] %asi, %r3, %r8
	.word 0x99480000  ! 231: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
splash_htba_6_109:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 232: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d902c4a  ! 233: WRPR_PSTATE_I	wrpr	%r0, 0x0c4a, %pstate
debug_6_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 234: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_6_111:
	taddcctv %r17, 0x126d, %r20
	.word 0xd607f25b  ! 235: LDUW_I	lduw	[%r31 + 0xfffff25b], %r11
cwp_6_112:
    set user_data_start, %o7
	.word 0x93902000  ! 236: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_cmpr_6_113:
	setx 0xa5299b4e041f51e1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 237: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd677c000  ! 238: STX_R	stx	%r11, [%r31 + %r0]
	.word 0xa980000c  ! 239: WR_SET_SOFTINT_R	wr	%r0, %r12, %set_softint
memptr_6_114:
	set user_data_start, %r31
	.word 0x85853f8f  ! 240: WRCCR_I	wr	%r20, 0x1f8f, %ccr
debug_6_115:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 241: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 242: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_6_116:
	setx 0xa8dc237d21e45864, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 243: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f8021be  ! 244: SIR	sir	0x01be
	.word 0xab820010  ! 245: WR_CLEAR_SOFTINT_R	wr	%r8, %r16, %clear_softint
tagged_6_117:
	taddcctv %r5, 0x11e1, %r3
	.word 0xd607fea4  ! 246: LDUW_I	lduw	[%r31 + 0xfffffea4], %r11
debug_6_118:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 247: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_6_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d940004  ! 248: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
	.word 0x99500000  ! 249: RDPR_TPC	rdpr	%tpc, %r12
tagged_6_120:
	tsubcctv %r26, 0x1f2e, %r15
	.word 0xd807fea4  ! 250: LDUW_I	lduw	[%r31 + 0xfffffea4], %r12
	.word 0x97a00173  ! 251: FABSq	dis not found

	.word 0xd6c00e60  ! 252: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r11
splash_lsu_6_121:
	setx 0xa3338da6ac6e6953, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 253: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_6_122:
	set 0x60140000, %r31
	.word 0x858376dd  ! 254: WRCCR_I	wr	%r13, 0x16dd, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 255: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6d7e020  ! 256: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r11
splash_cmpr_6_123:
	setx 0x688978c1f801849e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 257: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97500000  ! 259: RDPR_TPC	<illegal instruction>
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_124:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 260: CASA_R	casa	[%r31] %asi, %r5, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01967  ! 262: FqTOd	dis not found

	.word 0x8d903a65  ! 263: WRPR_PSTATE_I	wrpr	%r0, 0x1a65, %pstate
DS_6_126:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbb4baf2b	! Random illegal ?
	.word 0xa3a00548  ! 1: FSQRTd	fsqrt	
	.word 0x93a24834  ! 264: FADDs	fadds	%f9, %f20, %f9
	.word 0xd68008a0  ! 265: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
intveclr_6_127:
	setx 0x074e2b35ab0ed1f9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 266: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1520000  ! 267: RDPR_PIL	rdpr	%pil, %r16
	.word 0xab848014  ! 268: WR_CLEAR_SOFTINT_R	wr	%r18, %r20, %clear_softint
splash_cmpr_6_128:
	setx 0x54929f13a5f4b329, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 269: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01964  ! 270: FqTOd	dis not found

splash_cmpr_6_130:
	setx 0x8c52120c806aa09e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 271: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_131
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_131:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 272: RDPC	rd	%pc, %r8
splash_cmpr_6_132:
	setx 0x8e6420828cb613e6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 273: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_6_133:
	taddcctv %r25, 0x1566, %r14
	.word 0xda07edb6  ! 274: LDUW_I	lduw	[%r31 + 0x0db6], %r13
mondo_6_134:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d91000b  ! 275: WRPR_WSTATE_R	wrpr	%r4, %r11, %wstate
	rd %pc, %r19
	add %r19, (ivw_6_135-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_135:
	.word 0x9190800c  ! 276: WRPR_PIL_R	wrpr	%r2, %r12, %pil
cwp_6_136:
    set user_data_start, %o7
	.word 0x93902004  ! 277: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
tagged_6_137:
	taddcctv %r23, 0x17cd, %r23
	.word 0xda07edb6  ! 278: LDUW_I	lduw	[%r31 + 0x0db6], %r13
cwp_6_138:
    set user_data_start, %o7
	.word 0x93902007  ! 279: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 280: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_6_139:
	setx 0x772dc6d661f92480, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 281: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3450000  ! 282: RD_SET_SOFTINT	rd	%set_softint, %r17
splash_tba_6_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 283: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_6_141:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 284: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
debug_6_142:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 285: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902005  ! 286: WRPR_GL_I	wrpr	%r0, 0x0005, %-
cwp_6_143:
    set user_data_start, %o7
	.word 0x93902001  ! 287: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x879021e7  ! 288: WRPR_TT_I	wrpr	%r0, 0x01e7, %tt
	.word 0xa17039a3  ! 289: POPC_I	popc	0x19a3, %r16
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_144
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_144:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 290: RDPC	rd	%pc, %r13
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_145
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_145
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_145:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 291: RDPC	rd	%pc, %r13
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 292: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9a00168  ! 293: FABSq	dis not found

splash_hpstate_6_146:
	.word 0x8198295d  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095d, %hpstate
mondo_6_147:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d944008  ! 295: WRPR_WSTATE_R	wrpr	%r17, %r8, %wstate
	.word 0x81460000  ! 296: RD_STICK_REG	stbar
	.word 0x879021b3  ! 297: WRPR_TT_I	wrpr	%r0, 0x01b3, %tt
tagged_6_148:
	tsubcctv %r13, 0x1e9b, %r16
	.word 0xda07e368  ! 298: LDUW_I	lduw	[%r31 + 0x0368], %r13
splash_tba_6_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 299: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xda6fe368  ! 300: LDSTUB_I	ldstub	%r13, [%r31 + 0x0368]
splash_cmpr_6_150:
	setx 0xe3623b9627a09a96, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 301: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdabfe368  ! 302: STDA_I	stda	%r13, [%r31 + 0x0368] %asi
splash_tba_6_151:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa9a00170  ! 304: FABSq	dis not found

	.word 0xda47e368  ! 305: LDSW_I	ldsw	[%r31 + 0x0368], %r13
	.word 0x8d903ff0  ! 306: WRPR_PSTATE_I	wrpr	%r0, 0x1ff0, %pstate
	rd %pc, %r19
	add %r19, (ivw_6_152-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_152:
	.word 0x9194000a  ! 307: WRPR_PIL_R	wrpr	%r16, %r10, %pil
DS_6_153:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x9ba049cd  ! 1: FDIVd	fdivd	%f32, %f44, %f44
	normalw
	.word 0x95458000  ! 308: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xd33fe368  ! 309: STDF_I	std	%f9, [0x0368, %r31]
	.word 0x91d02034  ! 310: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9b50c000  ! 311: RDPR_TT	rdpr	%tt, %r13
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00d  ! 312: CASA_R	casa	[%r31] %asi, %r13, %r9
tagged_6_155:
	taddcctv %r11, 0x1e3c, %r7
	.word 0xd207e368  ! 313: LDUW_I	lduw	[%r31 + 0x0368], %r9
DS_6_156:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 314: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7697723  ! 315: SDIVX_I	sdivx	%r5, 0xfffff723, %r19
	.word 0xe8dfe010  ! 316: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r20
debug_6_158:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 318: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_6_159:
	set 0x003a0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r12
	.word 0x8b98000c  ! 319: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_160
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_160:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 320: RDPC	rd	%pc, %r12
	.word 0xe537c000  ! 321: STQF_R	-	%f18, [%r0, %r31]
	.word 0x99464000  ! 322: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0x93d02034  ! 323: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xab848012  ! 324: WR_CLEAR_SOFTINT_R	wr	%r18, %r18, %clear_softint
	.word 0xd28804a0  ! 325: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
splash_cmpr_6_161:
	setx 0xfc13e30332fe9ea4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902003  ! 327: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
DS_6_162:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xcd43af28	! Random illegal ?
	.word 0x93a109c9  ! 1: FDIVd	fdivd	%f4, %f40, %f40
	.word 0xa9a20831  ! 328: FADDs	fadds	%f8, %f17, %f20
	.word 0x8d90290d  ! 329: WRPR_PSTATE_I	wrpr	%r0, 0x090d, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 330: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd08fe000  ! 331: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r8
mondo_6_163:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d914006  ! 332: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
	.word 0xa2852683  ! 333: ADDcc_I	addcc 	%r20, 0x0683, %r17
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 334: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_6_164:
	.word 0x81982b0d  ! 335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0d, %hpstate
tagged_6_165:
	taddcctv %r13, 0x1945, %r4
	.word 0xda07fbd4  ! 336: LDUW_I	lduw	[%r31 + 0xfffffbd4], %r13
	.word 0xa1902003  ! 337: WRPR_GL_I	wrpr	%r0, 0x0003, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_166) + 24, 16, 16)) -> intp(1,0,8)
intvec_6_166:
	.word 0x39400001  ! 338: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_decr_6_167:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa7818000  ! 339: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r0, %-
splash_hpstate_6_168:
	.word 0x8198284f  ! 340: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084f, %hpstate
DS_6_169:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 341: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d902dc2  ! 342: WRPR_PSTATE_I	wrpr	%r0, 0x0dc2, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_170) + 40, 16, 16)) -> intp(3,0,3)
intvec_6_170:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 344: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xa1902005  ! 345: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_lsu_6_171:
	setx 0x01058fd7a95cf82f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 346: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_6_172:
    set user_data_start, %o7
	.word 0x93902005  ! 347: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_cmpr_6_173:
	setx 0x8b7876790a6fc799, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 348: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdac804a0  ! 349: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0x97520000  ! 350: RDPR_PIL	<illegal instruction>
	.word 0xd4c004a0  ! 351: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
donret_6_174:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_174-donret_6_174), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_174:
	.word 0xd4fffbd4  ! 352: SWAPA_I	swapa	%r10, [%r31 + 0xfffffbd4] %asi
intveclr_6_175:
	setx 0x1ffabc922c1601bf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 353: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_6_176:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 354: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
cwp_6_177:
    set user_data_start, %o7
	.word 0x93902007  ! 355: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
change_to_randtl_6_178:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_178:
	.word 0x8f902000  ! 356: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd51fc000  ! 357: LDDF_R	ldd	[%r31, %r0], %f10
	.word 0x8780201c  ! 358: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd4c80e60  ! 359: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r10
	.word 0x93d02033  ! 360: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xad802270  ! 361: WR_SOFTINT_REG_I	wr	%r0, 0x0270, %softint
splash_htba_6_179:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 362: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4c804a0  ! 363: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 364: LDX_R	ldx	[%r31 + %r0], %r10
memptr_6_180:
	set user_data_start, %r31
	.word 0x8582b29c  ! 365: WRCCR_I	wr	%r10, 0x129c, %ccr
debug_6_181:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 366: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_6_182:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 367: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_6_183:
	set 0x003a0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r12
	.word 0x8b98000c  ! 368: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4d80e40  ! 369: LDXA_R	ldxa	[%r0, %r0] 0x72, %r10
debug_6_184:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 370: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd4c004a0  ! 371: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0xd4d00e60  ! 372: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r10
splash_lsu_6_185:
	setx 0xcbfb994eef08fd55, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 373: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902006  ! 374: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 375: LDX_R	ldx	[%r31 + %r0], %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_186) + 56, 16, 16)) -> intp(6,0,14)
intvec_6_186:
	.word 0x39400001  ! 376: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f80233b  ! 377: SIR	sir	0x033b
	setx 0xd35605bc0945090a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_187:
	.word 0x39400001  ! 378: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 379: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_hpstate_6_188:
	.word 0x81982b9f  ! 380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9f, %hpstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_189:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e008  ! 381: CASA_R	casa	[%r31] %asi, %r8, %r10
debug_6_190:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 382: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_191
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_191
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_191:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 383: RDPC	rd	%pc, %r16
	.word 0xd6c7e020  ! 384: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
cwp_6_192:
    set user_data_start, %o7
	.word 0x93902005  ! 385: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd68008a0  ! 386: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd6ffc028  ! 387: SWAPA_R	swapa	%r11, [%r31 + %r8] 0x01
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_193:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 388: CASA_R	casa	[%r31] %asi, %r8, %r11
debug_6_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01971  ! 390: FqTOd	dis not found

splash_hpstate_6_196:
	.word 0x81982cc5  ! 391: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc5, %hpstate
	.word 0x879023c1  ! 392: WRPR_TT_I	wrpr	%r0, 0x03c1, %tt
	setx 0x34181950bc6e11e1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_197:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_6_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d948001  ! 394: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
	.word 0x92d13f21  ! 395: UMULcc_I	umulcc 	%r4, 0xffffff21, %r9
	.word 0xda8804a0  ! 396: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x9ba1c9c6  ! 397: FDIVd	fdivd	%f38, %f6, %f44
splash_cmpr_6_199:
	setx 0x4cdc9d5364dc4007, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a00553  ! 399: FSQRTd	fsqrt	
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 400: LDX_R	ldx	[%r31 + %r0], %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
change_to_randtl_5_0:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_0:
	.word 0xd8d7e000  ! 1: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
splash_cmpr_5_1:
	setx 0x409ba533be621fe9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 2: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 3: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8780201c  ! 4: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x879021f1  ! 5: WRPR_TT_I	wrpr	%r0, 0x01f1, %tt
debug_5_3:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 6: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
cwp_5_4:
    set user_data_start, %o7
	.word 0x93902007  ! 7: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d903d41  ! 8: WRPR_PSTATE_I	wrpr	%r0, 0x1d41, %pstate
splash_cmpr_5_5:
	setx 0x5120d335fb58166d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 9: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_5_6:
    set user_data_start, %o7
	.word 0x93902000  ! 10: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_5_7:
	setx 0xa9bb0dee2bb424db, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 11: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_5_8:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 12: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x38800001  ! 13: BGU	bgu,a	<label_0x1>
	.word 0xd86fe5b9  ! 14: LDSTUB_I	ldstub	%r12, [%r31 + 0x05b9]
	.word 0x91d02033  ! 15: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902f9e  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x0f9e, %pstate
	.word 0x30800001  ! 17: BA	ba,a	<label_0x1>
	.word 0xa190200b  ! 18: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 19: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd897e030  ! 20: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
	.word 0x8d902898  ! 21: WRPR_PSTATE_I	wrpr	%r0, 0x0898, %pstate
	.word 0xa7520000  ! 22: RDPR_PIL	rdpr	%pil, %r19
DS_5_9:
	.word 0x9ba449d2  ! 1: FDIVd	fdivd	%f48, %f18, %f44
	.word 0xe7328007  ! 1: STQF_R	-	%f19, [%r7, %r10]
	normalw
	.word 0xa5458000  ! 23: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0x8790234d  ! 24: WRPR_TT_I	wrpr	%r0, 0x034d, %tt
donret_5_10:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_10-donret_5_10), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_10:
	.word 0xd4ffe5b9  ! 25: SWAPA_I	swapa	%r10, [%r31 + 0x05b9] %asi
	.word 0x93d02032  ! 26: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xd46fe5b9  ! 27: LDSTUB_I	ldstub	%r10, [%r31 + 0x05b9]
	.word 0xa3480000  ! 28: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
splash_htba_5_11:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 29: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d9024d4  ! 30: WRPR_PSTATE_I	wrpr	%r0, 0x04d4, %pstate
splash_cmpr_5_12:
	setx 0x1df849ded481e2fd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 31: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 32: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956c651b  ! 33: SDIVX_I	sdivx	%r17, 0x051b, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 34: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4c7e030  ! 35: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 36: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_5_14:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 37: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd48804a0  ! 38: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x91d020b5  ! 39: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xd45feeec  ! 40: LDX_I	ldx	[%r31 + 0x0eec], %r10
	.word 0x83d02034  ! 41: Tcc_I	te	icc_or_xcc, %r0 + 52
DS_5_15:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x93b4430d  ! 42: ALIGNADDRESS	alignaddr	%r17, %r13, %r9
debug_5_16:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 43: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_17
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_17:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 44: RDPC	rd	%pc, %r20
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 45: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95500000  ! 46: RDPR_TPC	<illegal instruction>
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 47: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902428  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x0428, %pstate
	.word 0xe6d7e000  ! 49: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r19
splash_cmpr_5_18:
	setx 0xcde53e59a6f0b5a8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_5_19:
    set user_data_start, %o7
	.word 0x93902005  ! 51: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_20) + 56, 16, 16)) -> intp(6,0,22)
intvec_5_20:
	.word 0x39400001  ! 52: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe637eeec  ! 53: STH_I	sth	%r19, [%r31 + 0x0eec]
memptr_5_21:
	set user_data_start, %r31
	.word 0x8581ad5f  ! 54: WRCCR_I	wr	%r6, 0x0d5f, %ccr
splash_hpstate_5_22:
	.word 0x819823cd  ! 55: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03cd, %hpstate
	.word 0x98dcc005  ! 56: SMULcc_R	smulcc 	%r19, %r5, %r12
	.word 0x9ba109c4  ! 57: FDIVd	fdivd	%f4, %f4, %f44
memptr_5_23:
	set 0x60540000, %r31
	.word 0x85807df0  ! 58: WRCCR_I	wr	%r1, 0x1df0, %ccr
	.word 0xd4d004a0  ! 59: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 60: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_5_24:
	.word 0x8198262d  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x062d, %hpstate
change_to_randtl_5_25:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_25:
	.word 0x8f902002  ! 62: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x87802083  ! 63: WRASI_I	wr	%r0, 0x0083, %asi
tagged_5_26:
	tsubcctv %r21, 0x1668, %r11
	.word 0xd407ee0f  ! 64: LDUW_I	lduw	[%r31 + 0x0e0f], %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936c2ff4  ! 65: SDIVX_I	sdivx	%r16, 0x0ff4, %r9
	.word 0x87802088  ! 66: WRASI_I	wr	%r0, 0x0088, %asi
memptr_5_28:
	set 0x60740000, %r31
	.word 0x8580a669  ! 67: WRCCR_I	wr	%r2, 0x0669, %ccr
	setx 0x390a9ed648adf255, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_29:
	.word 0x39400001  ! 68: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_30:
	setx 0x01bae7f9df3a7137, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 69: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_5_31:
	setx 0x3ef00475b70b7907, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 70: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_32) + 8, 16, 16)) -> intp(3,0,11)
intvec_5_32:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda6ffb07  ! 72: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffffb07]
	.word 0xdadfe010  ! 73: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0xda27fb07  ! 74: STW_I	stw	%r13, [%r31 + 0xfffffb07]
donret_5_33:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_33-donret_5_33-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_33:
	.word 0xdafffb07  ! 75: SWAPA_I	swapa	%r13, [%r31 + 0xfffffb07] %asi
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_34
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_34
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_34:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 76: RDPC	rd	%pc, %r11
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 77: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91540000  ! 78: RDPR_GL	rdpr	%-, %r8
	setx 0x503b9b24eda5caca, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_35:
	.word 0x39400001  ! 79: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4dfe020  ! 80: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
DS_5_36:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 81: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 82: LDX_R	ldx	[%r31 + %r0], %r10
splash_lsu_5_37:
	setx 0xcfbb125674321b55, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 83: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9b500000  ! 84: RDPR_TPC	rdpr	%tpc, %r13
	.word 0x93450000  ! 85: RD_SET_SOFTINT	rd	%set_softint, %r9
debug_5_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 86: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 87: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xa6f8ebff  ! 88: SDIVcc_I	sdivcc 	%r3, 0x0bff, %r19
	.word 0xab84765b  ! 89: WR_CLEAR_SOFTINT_I	wr	%r17, 0x165b, %clear_softint
	.word 0xd08804a0  ! 90: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
debug_5_39:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 91: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_40:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00b  ! 92: CASA_R	casa	[%r31] %asi, %r11, %r8
cwp_5_41:
    set user_data_start, %o7
	.word 0x93902002  ! 93: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd13fc000  ! 94: STDF_R	std	%f8, [%r0, %r31]
	.word 0x8790217b  ! 95: WRPR_TT_I	wrpr	%r0, 0x017b, %tt
DS_5_42:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 96: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_5_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_43:
	.word 0x8f902000  ! 97: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9f802226  ! 98: SIR	sir	0x0226
debug_5_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 99: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_5_45:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 100: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0x20800001  ! 101: BN	bn,a	<label_0x1>
change_to_randtl_5_46:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_46:
	.word 0x8f902001  ! 102: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x9350c000  ! 103: RDPR_TT	rdpr	%tt, %r9
	.word 0x36800001  ! 104: BGE	bge,a	<label_0x1>
	.word 0x87902231  ! 105: WRPR_TT_I	wrpr	%r0, 0x0231, %tt
	.word 0x8d90332d  ! 106: WRPR_PSTATE_I	wrpr	%r0, 0x132d, %pstate
splash_hpstate_5_47:
	.word 0x81982a4c  ! 107: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4c, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 108: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd0d004a0  ! 109: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
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
	.word 0xa3414000  ! 110: RDPC	rd	%pc, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01971  ! 111: FqTOd	dis not found

	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 112: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 113: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28804a0  ! 114: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x8d9027c0  ! 115: WRPR_PSTATE_I	wrpr	%r0, 0x07c0, %pstate
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
	.word 0x93414000  ! 116: RDPC	rd	%pc, %r9
DS_5_51:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb34c003  ! 1: STQF_R	-	%f13, [%r3, %r19]
	normalw
	.word 0xa3458000  ! 117: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x3a700001  ! 118: BPCC	<illegal instruction>
splash_hpstate_5_52:
	.word 0x8198230f  ! 119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030f, %hpstate
	.word 0xe6d004a0  ! 120: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9768e976  ! 121: SDIVX_I	sdivx	%r3, 0x0976, %r11
	.word 0x9b540000  ! 122: RDPR_GL	rdpr	%-, %r13
DS_5_54:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 123: RESTORE_R	restore	%r31, %r0, %r31
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_55
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_55:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e007  ! 124: CASA_R	casa	[%r31] %asi, %r7, %r20
change_to_randtl_5_56:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_56:
	.word 0x8f902000  ! 125: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe88008a0  ! 126: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x96d4a398  ! 127: UMULcc_I	umulcc 	%r18, 0x0398, %r11
splash_lsu_5_57:
	setx 0xecd96188d5624995, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 128: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_5_58:
	tsubcctv %r21, 0x1e5c, %r7
	.word 0xd207ec1f  ! 129: LDUW_I	lduw	[%r31 + 0x0c1f], %r9
	.word 0xd297e030  ! 130: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r9
	.word 0x91927b04  ! 131: WRPR_PIL_I	wrpr	%r9, 0x1b04, %pil
	setx 0xb2a38899928dc9e1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_59:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 133: WRASI_I	wr	%r0, 0x0020, %asi
DS_5_60:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 134: SAVE_R	save	%r31, %r0, %r31
	.word 0xd2800b60  ! 135: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r9
memptr_5_61:
	set 0x60340000, %r31
	.word 0x85823b3a  ! 136: WRCCR_I	wr	%r8, 0x1b3a, %ccr
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 137: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_62
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_62:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e007  ! 138: CASA_R	casa	[%r31] %asi, %r7, %r9
	.word 0x8780208a  ! 139: WRASI_I	wr	%r0, 0x008a, %asi
change_to_randtl_5_63:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_63:
	.word 0x8f902000  ! 140: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 141: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd26feb9a  ! 142: LDSTUB_I	ldstub	%r9, [%r31 + 0x0b9a]
	.word 0x9153c000  ! 143: RDPR_FQ	<illegal instruction>
	.word 0xd6cfe020  ! 144: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01971  ! 145: FqTOd	dis not found

debug_5_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 146: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_66:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 147: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x91937867  ! 148: WRPR_PIL_I	wrpr	%r13, 0x1867, %pil
DS_5_67:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe1108014  ! 1: LDQF_R	-	[%r2, %r20], %f16
	.word 0x97a4c832  ! 149: FADDs	fadds	%f19, %f18, %f11
pmu_5_68:
	nop
	setx 0xfffff990fffff9d5, %g1, %g7
	.word 0xa3800007  ! 150: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38800001  ! 151: BGU	bgu,a	<label_0x1>
	.word 0xe33fc000  ! 152: STDF_R	std	%f17, [%r0, %r31]
splash_cmpr_5_69:
	setx 0x30075572a9b6bead, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 153: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99450000  ! 154: RD_SET_SOFTINT	rd	%set_softint, %r12
donret_5_70:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_70-donret_5_70), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_70:
	.word 0xe4fff6c3  ! 155: SWAPA_I	swapa	%r18, [%r31 + 0xfffff6c3] %asi
pmu_5_71:
	nop
	setx 0xfffffb71fffff19a, %g1, %g7
	.word 0xa3800007  ! 156: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_5_72:
	setx 0x9ec8bd0e6d54310b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 157: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902a1d  ! 158: WRPR_PSTATE_I	wrpr	%r0, 0x0a1d, %pstate
	.word 0xe48fe000  ! 159: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
change_to_randtl_5_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_73:
	.word 0x8f902000  ! 160: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x91d02034  ! 161: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_tba_5_74:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 162: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_75
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_75:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 163: RDPC	rd	%pc, %r8
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 164: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_5_76:
	setx 0x45b563d176b21e5e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 165: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
cwp_5_77:
    set user_data_start, %o7
	.word 0x93902004  ! 166: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd68008a0  ! 167: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_78
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_78
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_78:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 168: RDPC	rd	%pc, %r20
	.word 0x96f9400c  ! 169: SDIVcc_R	sdivcc 	%r5, %r12, %r11
splash_cmpr_5_79:
	setx 0x9580fbdef9185e3d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 170: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a00171  ! 171: FABSq	dis not found

	.word 0xe097e020  ! 172: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r16
mondo_5_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d950000  ! 173: WRPR_WSTATE_R	wrpr	%r20, %r0, %wstate
	.word 0x8780208a  ! 174: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0x93d02033  ! 175: Tcc_I	tne	icc_or_xcc, %r0 + 51
memptr_5_81:
	set user_data_start, %r31
	.word 0x85837bfb  ! 176: WRCCR_I	wr	%r13, 0x1bfb, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 177: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe0c80e60  ! 178: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956af206  ! 179: SDIVX_I	sdivx	%r11, 0xfffff206, %r10
	.word 0x9b480000  ! 180: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
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
	.word 0xd7e7e012  ! 181: CASA_R	casa	[%r31] %asi, %r18, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_84) + 40, 16, 16)) -> intp(7,0,17)
intvec_5_84:
	.word 0x39400001  ! 182: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd727c000  ! 183: STF_R	st	%f11, [%r0, %r31]
mondo_5_85:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d940009  ! 184: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
splash_lsu_5_86:
	setx 0xb56e0d70cca6072b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe020  ! 186: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
debug_5_87:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 187: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0xd67ff8cc  ! 188: SWAP_I	swap	%r11, [%r31 + 0xfffff8cc]
	.word 0x87802004  ! 189: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9ba209c6  ! 190: FDIVd	fdivd	%f8, %f6, %f44
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_88) + 8, 16, 16)) -> intp(7,0,8)
intvec_5_88:
	.word 0x39400001  ! 191: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 192: WRASI_I	wr	%r0, 0x0058, %asi
	setx 0x9c52823646d58165, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_89:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_5_90:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 194: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
splash_lsu_5_91:
	setx 0xd992848f92b40a8d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 195: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_5_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 196: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_5_93:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 197: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
debug_5_94:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 198: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_95
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_95:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 199: RDPC	rd	%pc, %r16
	.word 0xe07ff8cc  ! 200: SWAP_I	swap	%r16, [%r31 + 0xfffff8cc]
	.word 0x8d903c9a  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x1c9a, %pstate
tagged_5_96:
	tsubcctv %r24, 0x1f2a, %r12
	.word 0xe007f8cc  ! 202: LDUW_I	lduw	[%r31 + 0xfffff8cc], %r16
mondo_5_97:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d950007  ! 203: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
	.word 0x95a249c2  ! 204: FDIVd	fdivd	%f40, %f2, %f10
	.word 0x8d903fce  ! 205: WRPR_PSTATE_I	wrpr	%r0, 0x1fce, %pstate
splash_lsu_5_98:
	setx 0x60b2a32512e0ad95, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 206: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x92d46c7f  ! 207: UMULcc_I	umulcc 	%r17, 0x0c7f, %r9
	.word 0xad81f0ef  ! 208: WR_SOFTINT_REG_I	wr	%r7, 0x10ef, %softint
	.word 0xa7a289c6  ! 209: FDIVd	fdivd	%f10, %f6, %f50
	.word 0x91a00169  ! 210: FABSq	dis not found

	.word 0x87802088  ! 211: WRASI_I	wr	%r0, 0x0088, %asi
debug_5_99:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 212: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_100
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_100:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00b  ! 213: CASA_R	casa	[%r31] %asi, %r11, %r18
splash_tba_5_101:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 214: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_5_102:
	setx 0x86711e5f5cb1f2e8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x81460000  ! 217: RD_STICK_REG	stbar
	.word 0xe4900e40  ! 218: LDUHA_R	lduha	[%r0, %r0] 0x72, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01962  ! 219: FqTOd	dis not found

tagged_5_104:
	tsubcctv %r18, 0x13c9, %r8
	.word 0xe807e50d  ! 220: LDUW_I	lduw	[%r31 + 0x050d], %r20
	.word 0x919429aa  ! 221: WRPR_PIL_I	wrpr	%r16, 0x09aa, %pil
pmu_5_105:
	nop
	setx 0xfffffc04fffff6a2, %g1, %g7
	.word 0xa3800007  ! 222: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_5_106:
	setx 0x1f529f641630fb2e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 224: LDX_R	ldx	[%r31 + %r0], %r20
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 225: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe83fe48b  ! 226: STD_I	std	%r20, [%r31 + 0x048b]
	.word 0x8d802000  ! 227: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99703e8b  ! 228: POPC_I	popc	0x1e8b, %r12
splash_hpstate_5_107:
	.word 0x81982904  ! 229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0904, %hpstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e003  ! 230: CASA_R	casa	[%r31] %asi, %r3, %r8
	.word 0x97480000  ! 231: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
splash_htba_5_109:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 232: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d9026ea  ! 233: WRPR_PSTATE_I	wrpr	%r0, 0x06ea, %pstate
debug_5_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 234: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_5_111:
	taddcctv %r21, 0x17f6, %r12
	.word 0xd607f25b  ! 235: LDUW_I	lduw	[%r31 + 0xfffff25b], %r11
cwp_5_112:
    set user_data_start, %o7
	.word 0x93902001  ! 236: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_cmpr_5_113:
	setx 0x980fae57b3998973, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 237: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd677c000  ! 238: STX_R	stx	%r11, [%r31 + %r0]
	.word 0xa9840003  ! 239: WR_SET_SOFTINT_R	wr	%r16, %r3, %set_softint
memptr_5_114:
	set user_data_start, %r31
	.word 0x85823074  ! 240: WRCCR_I	wr	%r8, 0x1074, %ccr
debug_5_115:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 241: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 242: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_5_116:
	setx 0x1c9c00c46794bd48, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 243: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802138  ! 244: SIR	sir	0x0138
	.word 0xab848006  ! 245: WR_CLEAR_SOFTINT_R	wr	%r18, %r6, %clear_softint
tagged_5_117:
	taddcctv %r14, 0x16e3, %r15
	.word 0xd607fea4  ! 246: LDUW_I	lduw	[%r31 + 0xfffffea4], %r11
debug_5_118:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 247: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_5_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d924011  ! 248: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
	.word 0xa7500000  ! 249: RDPR_TPC	rdpr	%tpc, %r19
tagged_5_120:
	tsubcctv %r4, 0x1d0b, %r25
	.word 0xd807fea4  ! 250: LDUW_I	lduw	[%r31 + 0xfffffea4], %r12
	.word 0x95a0016d  ! 251: FABSq	dis not found

	.word 0xd6c004a0  ! 252: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
splash_lsu_5_121:
	setx 0xec3fe3129d8d22a9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 253: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_5_122:
	set 0x60140000, %r31
	.word 0x8584a97a  ! 254: WRCCR_I	wr	%r18, 0x097a, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 255: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6d7e030  ! 256: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
splash_cmpr_5_123:
	setx 0xc821ac096af9c555, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 257: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91500000  ! 259: RDPR_TPC	<illegal instruction>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_124:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 260: CASA_R	casa	[%r31] %asi, %r5, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01969  ! 262: FqTOd	dis not found

	.word 0x8d903150  ! 263: WRPR_PSTATE_I	wrpr	%r0, 0x1150, %pstate
DS_5_126:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xb17747f3	! Random illegal ?
	.word 0x91a00547  ! 1: FSQRTd	fsqrt	
	.word 0x95a14826  ! 264: FADDs	fadds	%f5, %f6, %f10
	.word 0xd68008a0  ! 265: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
intveclr_5_127:
	setx 0x8c08cc799337db92, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 266: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99520000  ! 267: RDPR_PIL	rdpr	%pil, %r12
	.word 0xab83000a  ! 268: WR_CLEAR_SOFTINT_R	wr	%r12, %r10, %clear_softint
splash_cmpr_5_128:
	setx 0x3a738854439a9241, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 269: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01973  ! 270: FqTOd	dis not found

splash_cmpr_5_130:
	setx 0xa7cb7b628dcfb7d7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 271: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_131
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_131:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 272: RDPC	rd	%pc, %r12
splash_cmpr_5_132:
	setx 0x00cb308422a7cacb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 273: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_5_133:
	taddcctv %r14, 0x1723, %r1
	.word 0xda07edb6  ! 274: LDUW_I	lduw	[%r31 + 0x0db6], %r13
mondo_5_134:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d948005  ! 275: WRPR_WSTATE_R	wrpr	%r18, %r5, %wstate
	rd %pc, %r19
	add %r19, (ivw_5_135-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_135:
	.word 0x91900006  ! 276: WRPR_PIL_R	wrpr	%r0, %r6, %pil
cwp_5_136:
    set user_data_start, %o7
	.word 0x93902003  ! 277: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
tagged_5_137:
	taddcctv %r1, 0x1c70, %r25
	.word 0xda07edb6  ! 278: LDUW_I	lduw	[%r31 + 0x0db6], %r13
cwp_5_138:
    set user_data_start, %o7
	.word 0x93902004  ! 279: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 280: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_5_139:
	setx 0xfdd5a1124a26b774, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 281: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93450000  ! 282: RD_SET_SOFTINT	rd	%set_softint, %r9
splash_tba_5_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 283: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_5_141:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 284: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
debug_5_142:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 285: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902008  ! 286: WRPR_GL_I	wrpr	%r0, 0x0008, %-
cwp_5_143:
    set user_data_start, %o7
	.word 0x93902000  ! 287: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8790225e  ! 288: WRPR_TT_I	wrpr	%r0, 0x025e, %tt
	.word 0x997034c3  ! 289: POPC_I	popc	0x14c3, %r12
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_144
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_144:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 290: RDPC	rd	%pc, %r18
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_145
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_145
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_145:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 291: RDPC	rd	%pc, %r12
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 292: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7a00166  ! 293: FABSq	dis not found

splash_hpstate_5_146:
	.word 0x819821d5  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d5, %hpstate
mondo_5_147:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94c004  ! 295: WRPR_WSTATE_R	wrpr	%r19, %r4, %wstate
	.word 0x81460000  ! 296: RD_STICK_REG	stbar
	.word 0x8790210a  ! 297: WRPR_TT_I	wrpr	%r0, 0x010a, %tt
tagged_5_148:
	tsubcctv %r2, 0x1f2b, %r7
	.word 0xda07e368  ! 298: LDUW_I	lduw	[%r31 + 0x0368], %r13
splash_tba_5_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 299: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xda6fe368  ! 300: LDSTUB_I	ldstub	%r13, [%r31 + 0x0368]
splash_cmpr_5_150:
	setx 0x96f81b07547a3ad1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 301: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdabfe368  ! 302: STDA_I	stda	%r13, [%r31 + 0x0368] %asi
splash_tba_5_151:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x95a00171  ! 304: FABSq	dis not found

	.word 0xda47e368  ! 305: LDSW_I	ldsw	[%r31 + 0x0368], %r13
	.word 0x8d902000  ! 306: WRPR_PSTATE_I	wrpr	%r0, 0x0000, %pstate
	rd %pc, %r19
	add %r19, (ivw_5_152-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_152:
	.word 0x9190800b  ! 307: WRPR_PIL_R	wrpr	%r2, %r11, %pil
DS_5_153:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x9ba089d2  ! 1: FDIVd	fdivd	%f2, %f18, %f44
	normalw
	.word 0xa3458000  ! 308: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0xd33fe368  ! 309: STDF_I	std	%f9, [0x0368, %r31]
	.word 0x91d02032  ! 310: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa750c000  ! 311: RDPR_TT	rdpr	%tt, %r19
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00d  ! 312: CASA_R	casa	[%r31] %asi, %r13, %r9
tagged_5_155:
	taddcctv %r16, 0x1a01, %r7
	.word 0xd207e368  ! 313: LDUW_I	lduw	[%r31 + 0x0368], %r9
DS_5_156:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 314: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6d310a  ! 315: SDIVX_I	sdivx	%r20, 0xfffff10a, %r13
	.word 0xe8dfe010  ! 316: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r20
debug_5_158:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 318: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_5_159:
	set 0x003b0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r12
	.word 0x8b98000c  ! 319: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_160
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_160:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 320: RDPC	rd	%pc, %r9
	.word 0xe537c000  ! 321: STQF_R	-	%f18, [%r0, %r31]
	.word 0x9b464000  ! 322: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0x93d020b4  ! 323: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0xab80c000  ! 324: WR_CLEAR_SOFTINT_R	wr	%r3, %r0, %clear_softint
	.word 0xd28804a0  ! 325: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
splash_cmpr_5_161:
	setx 0xc353a6583e537fd8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902001  ! 327: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
DS_5_162:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc14bc367	! Random illegal ?
	.word 0x95a209c3  ! 1: FDIVd	fdivd	%f8, %f34, %f10
	.word 0xa1a00830  ! 328: FADDs	fadds	%f0, %f16, %f16
	.word 0x8d902358  ! 329: WRPR_PSTATE_I	wrpr	%r0, 0x0358, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 330: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd08fe020  ! 331: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r8
mondo_5_163:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d940009  ! 332: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
	.word 0xa684ef3b  ! 333: ADDcc_I	addcc 	%r19, 0x0f3b, %r19
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 334: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_5_164:
	.word 0x8198201e  ! 335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001e, %hpstate
tagged_5_165:
	taddcctv %r1, 0x1850, %r5
	.word 0xda07fbd4  ! 336: LDUW_I	lduw	[%r31 + 0xfffffbd4], %r13
	.word 0xa1902002  ! 337: WRPR_GL_I	wrpr	%r0, 0x0002, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_166) + 16, 16, 16)) -> intp(5,0,2)
intvec_5_166:
	.word 0x39400001  ! 338: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa784c014  ! 339: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r20, %-
splash_hpstate_5_168:
	.word 0x81982b9f  ! 340: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9f, %hpstate
DS_5_169:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 341: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d903a2d  ! 342: WRPR_PSTATE_I	wrpr	%r0, 0x1a2d, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_170) + 0, 16, 16)) -> intp(1,0,1)
intvec_5_170:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 344: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xa1902001  ! 345: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_lsu_5_171:
	setx 0xb76a2377deb05c65, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 346: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_5_172:
    set user_data_start, %o7
	.word 0x93902003  ! 347: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_cmpr_5_173:
	setx 0x6f146532edc3daa2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 348: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdac804a0  ! 349: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0x91520000  ! 350: RDPR_PIL	<illegal instruction>
	.word 0xd4c004a0  ! 351: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
donret_5_174:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_174-donret_5_174), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_174:
	.word 0xd4fffbd4  ! 352: SWAPA_I	swapa	%r10, [%r31 + 0xfffffbd4] %asi
intveclr_5_175:
	setx 0xca3840603b14aa59, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 353: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_5_176:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 354: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
cwp_5_177:
    set user_data_start, %o7
	.word 0x93902004  ! 355: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
change_to_randtl_5_178:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_178:
	.word 0x8f902001  ! 356: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd51fc000  ! 357: LDDF_R	ldd	[%r31, %r0], %f10
	.word 0x87802004  ! 358: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd4c804a0  ! 359: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x91d02034  ! 360: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xad84f7dc  ! 361: WR_SOFTINT_REG_I	wr	%r19, 0x17dc, %softint
splash_htba_5_179:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 362: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4c804a0  ! 363: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 364: LDX_R	ldx	[%r31 + %r0], %r10
memptr_5_180:
	set user_data_start, %r31
	.word 0x8580fdef  ! 365: WRCCR_I	wr	%r3, 0x1def, %ccr
debug_5_181:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 366: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_5_182:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 367: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_5_183:
	set 0x003b0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r12
	.word 0x8b98000c  ! 368: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4d80e40  ! 369: LDXA_R	ldxa	[%r0, %r0] 0x72, %r10
debug_5_184:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 370: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd4c004a0  ! 371: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0xd4d004a0  ! 372: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
splash_lsu_5_185:
	setx 0xa382cc25b0688da5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 373: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200c  ! 374: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 375: LDX_R	ldx	[%r31 + %r0], %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_186) + 32, 16, 16)) -> intp(7,0,7)
intvec_5_186:
	.word 0x39400001  ! 376: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f802a55  ! 377: SIR	sir	0x0a55
	setx 0x61763d43d0eda829, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_187:
	.word 0x39400001  ! 378: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 379: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_hpstate_5_188:
	.word 0x819820dc  ! 380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00dc, %hpstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_189:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e008  ! 381: CASA_R	casa	[%r31] %asi, %r8, %r10
debug_5_190:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 382: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_191
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_191
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_191:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 383: RDPC	rd	%pc, %r19
	.word 0xd6c7e000  ! 384: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r11
cwp_5_192:
    set user_data_start, %o7
	.word 0x93902004  ! 385: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd6800b40  ! 386: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r11
	.word 0xd6ffc028  ! 387: SWAPA_R	swapa	%r11, [%r31 + %r8] 0x01
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_193:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 388: CASA_R	casa	[%r31] %asi, %r8, %r11
debug_5_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01967  ! 390: FqTOd	dis not found

splash_hpstate_5_196:
	.word 0x819825d5  ! 391: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d5, %hpstate
	.word 0x87902265  ! 392: WRPR_TT_I	wrpr	%r0, 0x0265, %tt
	setx 0x3228fc56c3b56015, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_197:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_5_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d930007  ! 394: WRPR_WSTATE_R	wrpr	%r12, %r7, %wstate
	.word 0x9ad16ae5  ! 395: UMULcc_I	umulcc 	%r5, 0x0ae5, %r13
	.word 0xda8804a0  ! 396: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x9ba2c9cd  ! 397: FDIVd	fdivd	%f42, %f44, %f44
splash_cmpr_5_199:
	setx 0x7770c83c62b573e8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9ba00553  ! 399: FSQRTd	fsqrt	
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 400: LDX_R	ldx	[%r31 + %r0], %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
change_to_randtl_4_0:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_0:
	.word 0xd8d7e020  ! 1: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
splash_cmpr_4_1:
	setx 0xea38e50f757c5635, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 2: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 3: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802016  ! 4: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8790220e  ! 5: WRPR_TT_I	wrpr	%r0, 0x020e, %tt
debug_4_3:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_3:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_3
    nop
debug_wait4_3:
    ld [%r23], %r16
    brnz %r16, debug_wait4_3
    nop
    ba,a debug_startwait4_3
continue_debug_4_3:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_3:
    cmp %r13, %r15
    bne,a wait_for_stat_4_3
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_3:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_3
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00492  ! 6: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
cwp_4_4:
    set user_data_start, %o7
	.word 0x93902000  ! 7: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d90368a  ! 8: WRPR_PSTATE_I	wrpr	%r0, 0x168a, %pstate
splash_cmpr_4_5:
	setx 0xc666c374a5bd86dc, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 9: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_4_6:
    set user_data_start, %o7
	.word 0x93902007  ! 10: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_lsu_4_7:
	setx 0xf33af197bbed4f39, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 11: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_4_8:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 12: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x38800001  ! 13: BGU	bgu,a	<label_0x1>
	.word 0xd86fe5b9  ! 14: LDSTUB_I	ldstub	%r12, [%r31 + 0x05b9]
	.word 0x91d020b5  ! 15: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8d902641  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x0641, %pstate
	.word 0x30800001  ! 17: BA	ba,a	<label_0x1>
	.word 0xa1902004  ! 18: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 19: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd897e030  ! 20: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
	.word 0x8d903de8  ! 21: WRPR_PSTATE_I	wrpr	%r0, 0x1de8, %pstate
	.word 0xa3520000  ! 22: RDPR_PIL	<illegal instruction>
DS_4_9:
	.word 0x99a509d2  ! 1: FDIVd	fdivd	%f20, %f18, %f12
	.word 0xd330c000  ! 1: STQF_R	-	%f9, [%r0, %r3]
	normalw
	.word 0xa3458000  ! 23: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x87902036  ! 24: WRPR_TT_I	wrpr	%r0, 0x0036, %tt
donret_4_10:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_10-donret_4_10), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_10:
	.word 0xd4ffe5b9  ! 25: SWAPA_I	swapa	%r10, [%r31 + 0x05b9] %asi
	.word 0x91d02035  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd46fe5b9  ! 27: LDSTUB_I	ldstub	%r10, [%r31 + 0x05b9]
	.word 0x91480000  ! 28: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
splash_htba_4_11:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 29: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d902492  ! 30: WRPR_PSTATE_I	wrpr	%r0, 0x0492, %pstate
splash_cmpr_4_12:
	setx 0xce9b206cb5581480, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 31: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 32: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b68a42c  ! 33: SDIVX_I	sdivx	%r2, 0x042c, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 34: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4c7e030  ! 35: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 36: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_4_14:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 37: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd48804a0  ! 38: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x91d020b5  ! 39: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xd45feeec  ! 40: LDX_I	ldx	[%r31 + 0x0eec], %r10
	.word 0x91d02035  ! 41: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_4_15:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x9bb4c312  ! 42: ALIGNADDRESS	alignaddr	%r19, %r18, %r13
debug_4_16:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 43: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_17
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_17:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 44: RDPC	rd	%pc, %r19
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 45: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa3500000  ! 46: RDPR_TPC	<illegal instruction>
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 47: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d903f64  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x1f64, %pstate
	.word 0xe6d7e030  ! 49: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r19
splash_cmpr_4_18:
	setx 0x8976e70e78b085b2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_4_19:
    set user_data_start, %o7
	.word 0x93902001  ! 51: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_20) + 40, 16, 16)) -> intp(4,0,30)
intvec_4_20:
	.word 0x39400001  ! 52: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe637eeec  ! 53: STH_I	sth	%r19, [%r31 + 0x0eec]
memptr_4_21:
	set user_data_start, %r31
	.word 0x8580bb56  ! 54: WRCCR_I	wr	%r2, 0x1b56, %ccr
splash_hpstate_4_22:
	.word 0x8198220d  ! 55: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020d, %hpstate
	.word 0x96dcc013  ! 56: SMULcc_R	smulcc 	%r19, %r19, %r11
	.word 0x91a209c3  ! 57: FDIVd	fdivd	%f8, %f34, %f8
memptr_4_23:
	set 0x60540000, %r31
	.word 0x8583379d  ! 58: WRCCR_I	wr	%r12, 0x179d, %ccr
	.word 0xd4d004a0  ! 59: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 60: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_hpstate_4_24:
	.word 0x81982b9f  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9f, %hpstate
change_to_randtl_4_25:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_25:
	.word 0x8f902000  ! 62: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x87802080  ! 63: WRASI_I	wr	%r0, 0x0080, %asi
tagged_4_26:
	tsubcctv %r8, 0x12ab, %r17
	.word 0xd407ee0f  ! 64: LDUW_I	lduw	[%r31 + 0x0e0f], %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956c7527  ! 65: SDIVX_I	sdivx	%r17, 0xfffff527, %r10
	.word 0x87802016  ! 66: WRASI_I	wr	%r0, 0x0016, %asi
memptr_4_28:
	set 0x60740000, %r31
	.word 0x858465b0  ! 67: WRCCR_I	wr	%r17, 0x05b0, %ccr
	setx 0x644d3a852f78e8da, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_29:
	.word 0x39400001  ! 68: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_30:
	setx 0x7819f9f47b9468b9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 69: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_31:
	setx 0x63748d07f6a9aef9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 70: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_32) + 24, 16, 16)) -> intp(7,0,25)
intvec_4_32:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda6ffb07  ! 72: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffffb07]
	.word 0xdadfe000  ! 73: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	.word 0xda27fb07  ! 74: STW_I	stw	%r13, [%r31 + 0xfffffb07]
donret_4_33:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_33-donret_4_33-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_33:
	.word 0xdafffb07  ! 75: SWAPA_I	swapa	%r13, [%r31 + 0xfffffb07] %asi
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_34
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_34
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_34:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 76: RDPC	rd	%pc, %r9
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 77: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x99540000  ! 78: RDPR_GL	rdpr	%-, %r12
	setx 0xe8ebfc027da4b38f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_35:
	.word 0x39400001  ! 79: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4dfe020  ! 80: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
DS_4_36:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 81: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 82: LDX_R	ldx	[%r31 + %r0], %r10
splash_lsu_4_37:
	setx 0x157bd6c121a909a7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 83: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa3500000  ! 84: RDPR_TPC	rdpr	%tpc, %r17
	.word 0xa3450000  ! 85: RD_SET_SOFTINT	rd	%set_softint, %r17
debug_4_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 86: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 87: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x98fa7618  ! 88: SDIVcc_I	sdivcc 	%r9, 0xfffff618, %r12
	.word 0xab85339a  ! 89: WR_CLEAR_SOFTINT_I	wr	%r20, 0x139a, %clear_softint
	.word 0xd0880e80  ! 90: LDUBA_R	lduba	[%r0, %r0] 0x74, %r8
debug_4_39:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_39:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_39
    nop
debug_wait4_39:
    ld [%r23], %r16
    brnz %r16, debug_wait4_39
    nop
    ba,a debug_startwait4_39
continue_debug_4_39:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_39:
    cmp %r13, %r15
    bne,a wait_for_stat_4_39
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_39:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_39
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe0f00492  ! 91: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_40:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00b  ! 92: CASA_R	casa	[%r31] %asi, %r11, %r8
cwp_4_41:
    set user_data_start, %o7
	.word 0x93902003  ! 93: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd13fc000  ! 94: STDF_R	std	%f8, [%r0, %r31]
	.word 0x879022a5  ! 95: WRPR_TT_I	wrpr	%r0, 0x02a5, %tt
DS_4_42:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 96: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_4_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_43:
	.word 0x8f902002  ! 97: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x9f803eb3  ! 98: SIR	sir	0x1eb3
debug_4_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 99: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
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
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00492  ! 100: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	.word 0x20800001  ! 101: BN	bn,a	<label_0x1>
change_to_randtl_4_46:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_46:
	.word 0x8f902002  ! 102: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa950c000  ! 103: RDPR_TT	rdpr	%tt, %r20
	.word 0x36800001  ! 104: BGE	bge,a	<label_0x1>
	.word 0x879020ad  ! 105: WRPR_TT_I	wrpr	%r0, 0x00ad, %tt
	.word 0x8d9025d2  ! 106: WRPR_PSTATE_I	wrpr	%r0, 0x05d2, %pstate
splash_hpstate_4_47:
	.word 0x8198200d  ! 107: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000d, %hpstate
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 108: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd0d004a0  ! 109: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
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
	.word 0x91414000  ! 110: RDPC	rd	%pc, %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01974  ! 111: FqTOd	dis not found

	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 112: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 113: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28804a0  ! 114: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x8d903a27  ! 115: WRPR_PSTATE_I	wrpr	%r0, 0x1a27, %pstate
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
	.word 0x99414000  ! 116: RDPC	rd	%pc, %r12
DS_4_51:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd331c013  ! 1: STQF_R	-	%f9, [%r19, %r7]
	normalw
	.word 0xa1458000  ! 117: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x3a700001  ! 118: BPCC	<illegal instruction>
splash_hpstate_4_52:
	.word 0x81982406  ! 119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0406, %hpstate
	.word 0xe6d004a0  ! 120: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956b3ed8  ! 121: SDIVX_I	sdivx	%r12, 0xfffffed8, %r10
	.word 0xa9540000  ! 122: RDPR_GL	rdpr	%-, %r20
DS_4_54:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 123: RESTORE_R	restore	%r31, %r0, %r31
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_55
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_55:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e007  ! 124: CASA_R	casa	[%r31] %asi, %r7, %r20
change_to_randtl_4_56:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_56:
	.word 0x8f902001  ! 125: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe8800b00  ! 126: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r20
	.word 0x94d36571  ! 127: UMULcc_I	umulcc 	%r13, 0x0571, %r10
splash_lsu_4_57:
	setx 0x1f329f0b823c3921, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 128: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_4_58:
	tsubcctv %r8, 0x1303, %r18
	.word 0xd207ec1f  ! 129: LDUW_I	lduw	[%r31 + 0x0c1f], %r9
	.word 0xd297e030  ! 130: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r9
	.word 0x9191ef63  ! 131: WRPR_PIL_I	wrpr	%r7, 0x0f63, %pil
	setx 0xf41f91219a8bc9d6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_59:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 133: WRASI_I	wr	%r0, 0x0014, %asi
DS_4_60:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 134: SAVE_R	save	%r31, %r0, %r31
	.word 0xd28008a0  ! 135: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
memptr_4_61:
	set 0x60740000, %r31
	.word 0x8584eceb  ! 136: WRCCR_I	wr	%r19, 0x0ceb, %ccr
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 137: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_62
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_62:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e007  ! 138: CASA_R	casa	[%r31] %asi, %r7, %r9
	.word 0x8780208b  ! 139: WRASI_I	wr	%r0, 0x008b, %asi
change_to_randtl_4_63:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_63:
	.word 0x8f902001  ! 140: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 141: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd26feb9a  ! 142: LDSTUB_I	ldstub	%r9, [%r31 + 0x0b9a]
	.word 0x9153c000  ! 143: RDPR_FQ	<illegal instruction>
	.word 0xd6cfe020  ! 144: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01972  ! 145: FqTOd	dis not found

debug_4_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 146: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_66:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 147: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x919134bd  ! 148: WRPR_PIL_I	wrpr	%r4, 0x14bd, %pil
DS_4_67:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd9100010  ! 1: LDQF_R	-	[%r0, %r16], %f12
	.word 0xa3a4882a  ! 149: FADDs	fadds	%f18, %f10, %f17
pmu_4_68:
	nop
	setx 0xfffffde9fffff172, %g1, %g7
	.word 0xa3800007  ! 150: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38800001  ! 151: BGU	bgu,a	<label_0x1>
	.word 0xe33fc000  ! 152: STDF_R	std	%f17, [%r0, %r31]
splash_cmpr_4_69:
	setx 0xba96d46760921418, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 153: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5450000  ! 154: RD_SET_SOFTINT	rd	%set_softint, %r18
donret_4_70:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_70-donret_4_70), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_70:
	.word 0xe4fff6c3  ! 155: SWAPA_I	swapa	%r18, [%r31 + 0xfffff6c3] %asi
pmu_4_71:
	nop
	setx 0xfffff108ffffff38, %g1, %g7
	.word 0xa3800007  ! 156: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_4_72:
	setx 0x87ce5d96c33f255c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 157: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903048  ! 158: WRPR_PSTATE_I	wrpr	%r0, 0x1048, %pstate
	.word 0xe48fe010  ! 159: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r18
change_to_randtl_4_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_73:
	.word 0x8f902000  ! 160: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x91d02032  ! 161: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_tba_4_74:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 162: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_75
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_75:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 163: RDPC	rd	%pc, %r16
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 164: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_4_76:
	setx 0xec8bef6988d9fa5d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 165: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
cwp_4_77:
    set user_data_start, %o7
	.word 0x93902003  ! 166: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd6800ba0  ! 167: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r11
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_78
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_78
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_78:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 168: RDPC	rd	%pc, %r17
	.word 0x96fcc00b  ! 169: SDIVcc_R	sdivcc 	%r19, %r11, %r11
splash_cmpr_4_79:
	setx 0xfa5f99d54acf394f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 170: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9ba00164  ! 171: FABSq	dis not found

	.word 0xe097e010  ! 172: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r16
mondo_4_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d914001  ! 173: WRPR_WSTATE_R	wrpr	%r5, %r1, %wstate
	.word 0x87802055  ! 174: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x93d02034  ! 175: Tcc_I	tne	icc_or_xcc, %r0 + 52
memptr_4_81:
	set user_data_start, %r31
	.word 0x858220ac  ! 176: WRCCR_I	wr	%r8, 0x00ac, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 177: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe0c804a0  ! 178: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa769794b  ! 179: SDIVX_I	sdivx	%r5, 0xfffff94b, %r19
	.word 0x95480000  ! 180: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
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
	.word 0xd7e7e012  ! 181: CASA_R	casa	[%r31] %asi, %r18, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_84) + 8, 16, 16)) -> intp(2,0,24)
intvec_4_84:
	.word 0x39400001  ! 182: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd727c000  ! 183: STF_R	st	%f11, [%r0, %r31]
mondo_4_85:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d910003  ! 184: WRPR_WSTATE_R	wrpr	%r4, %r3, %wstate
splash_lsu_4_86:
	setx 0x8b08a270d62bbeb1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe010  ! 186: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
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
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd8f00492  ! 187: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0xd67ff8cc  ! 188: SWAP_I	swap	%r11, [%r31 + 0xfffff8cc]
	.word 0x87802055  ! 189: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x97a449cb  ! 190: FDIVd	fdivd	%f48, %f42, %f42
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_88) + 0, 16, 16)) -> intp(5,0,25)
intvec_4_88:
	.word 0x39400001  ! 191: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 192: WRASI_I	wr	%r0, 0x0020, %asi
	setx 0xa9185399d5275d56, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_89:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_4_90:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_90:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_90
    nop
debug_wait4_90:
    ld [%r23], %r16
    brnz %r16, debug_wait4_90
    nop
    ba,a debug_startwait4_90
continue_debug_4_90:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_90:
    cmp %r13, %r15
    bne,a wait_for_stat_4_90
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_90:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_90
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00492  ! 194: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
splash_lsu_4_91:
	setx 0x40e015b75dc71121, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 195: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_4_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 196: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
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
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00492  ! 197: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
debug_4_94:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 198: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
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
	.word 0x91414000  ! 199: RDPC	rd	%pc, %r8
	.word 0xe07ff8cc  ! 200: SWAP_I	swap	%r16, [%r31 + 0xfffff8cc]
	.word 0x8d902e95  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x0e95, %pstate
tagged_4_96:
	tsubcctv %r18, 0x12a4, %r3
	.word 0xe007f8cc  ! 202: LDUW_I	lduw	[%r31 + 0xfffff8cc], %r16
mondo_4_97:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d908007  ! 203: WRPR_WSTATE_R	wrpr	%r2, %r7, %wstate
	.word 0x95a449c5  ! 204: FDIVd	fdivd	%f48, %f36, %f10
	.word 0x8d903774  ! 205: WRPR_PSTATE_I	wrpr	%r0, 0x1774, %pstate
splash_lsu_4_98:
	setx 0x090167ca37f03045, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 206: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9ad1bfdb  ! 207: UMULcc_I	umulcc 	%r6, 0xffffffdb, %r13
	.word 0xad8420a4  ! 208: WR_SOFTINT_REG_I	wr	%r16, 0x00a4, %softint
	.word 0x95a189d3  ! 209: FDIVd	fdivd	%f6, %f50, %f10
	.word 0x99a00173  ! 210: FABSq	dis not found

	.word 0x87802058  ! 211: WRASI_I	wr	%r0, 0x0058, %asi
debug_4_99:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_99:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_99
    nop
debug_wait4_99:
    ld [%r23], %r16
    brnz %r16, debug_wait4_99
    nop
    ba,a debug_startwait4_99
continue_debug_4_99:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_99:
    cmp %r13, %r15
    bne,a wait_for_stat_4_99
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_99:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_99
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %19, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00492  ! 212: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_100
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_100:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00b  ! 213: CASA_R	casa	[%r31] %asi, %r11, %r18
splash_tba_4_101:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 214: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_4_102:
	setx 0x0b3444736c8774e7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x81460000  ! 217: RD_STICK_REG	stbar
	.word 0xe49004a0  ! 218: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01969  ! 219: FqTOd	dis not found

tagged_4_104:
	tsubcctv %r6, 0x13df, %r14
	.word 0xe807e50d  ! 220: LDUW_I	lduw	[%r31 + 0x050d], %r20
	.word 0x9194bb25  ! 221: WRPR_PIL_I	wrpr	%r18, 0x1b25, %pil
pmu_4_105:
	nop
	setx 0xfffffb01fffffc7f, %g1, %g7
	.word 0xa3800007  ! 222: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_4_106:
	setx 0x8dd705d2df903027, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 224: LDX_R	ldx	[%r31 + %r0], %r20
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 225: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe83fe48b  ! 226: STD_I	std	%r20, [%r31 + 0x048b]
	.word 0x8d802000  ! 227: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa3702c92  ! 228: POPC_I	popc	0x0c92, %r17
splash_hpstate_4_107:
	.word 0x81982f96  ! 229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f96, %hpstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e003  ! 230: CASA_R	casa	[%r31] %asi, %r3, %r8
	.word 0x99480000  ! 231: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
splash_htba_4_109:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 232: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d9036e7  ! 233: WRPR_PSTATE_I	wrpr	%r0, 0x16e7, %pstate
debug_4_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 234: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_4_111:
	taddcctv %r1, 0x10d7, %r24
	.word 0xd607f25b  ! 235: LDUW_I	lduw	[%r31 + 0xfffff25b], %r11
cwp_4_112:
    set user_data_start, %o7
	.word 0x93902003  ! 236: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_cmpr_4_113:
	setx 0xb429b9f436b7882d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 237: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd677c000  ! 238: STX_R	stx	%r11, [%r31 + %r0]
	.word 0xa9850014  ! 239: WR_SET_SOFTINT_R	wr	%r20, %r20, %set_softint
memptr_4_114:
	set user_data_start, %r31
	.word 0x858537d7  ! 240: WRCCR_I	wr	%r20, 0x17d7, %ccr
debug_4_115:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 241: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 242: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_4_116:
	setx 0x58571a9571fb8457, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 243: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802038  ! 244: SIR	sir	0x0038
	.word 0xab840014  ! 245: WR_CLEAR_SOFTINT_R	wr	%r16, %r20, %clear_softint
tagged_4_117:
	taddcctv %r12, 0x144e, %r3
	.word 0xd607fea4  ! 246: LDUW_I	lduw	[%r31 + 0xfffffea4], %r11
debug_4_118:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 247: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_4_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d908010  ! 248: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
	.word 0x9b500000  ! 249: RDPR_TPC	<illegal instruction>
tagged_4_120:
	tsubcctv %r8, 0x1030, %r20
	.word 0xd807fea4  ! 250: LDUW_I	lduw	[%r31 + 0xfffffea4], %r12
	.word 0x91a00172  ! 251: FABSq	dis not found

	.word 0xd6c004a0  ! 252: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
splash_lsu_4_121:
	setx 0xd93e5f526bcd9111, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 253: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_4_122:
	set 0x60740000, %r31
	.word 0x8582f779  ! 254: WRCCR_I	wr	%r11, 0x1779, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 255: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6d7e010  ! 256: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r11
splash_cmpr_4_123:
	setx 0xf44608fd3617807f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 257: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95500000  ! 259: RDPR_TPC	<illegal instruction>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_124:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 260: CASA_R	casa	[%r31] %asi, %r5, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196c  ! 262: FqTOd	dis not found

	.word 0x8d9030ae  ! 263: WRPR_PSTATE_I	wrpr	%r0, 0x10ae, %pstate
DS_4_126:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc95b4462	! Random illegal ?
	.word 0x91a00554  ! 1: FSQRTd	fsqrt	
	.word 0x95a4c82c  ! 264: FADDs	fadds	%f19, %f12, %f10
	.word 0xd6800a60  ! 265: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r11
intveclr_4_127:
	setx 0x25b46d0465a7d10c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 266: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9b520000  ! 267: RDPR_PIL	rdpr	%pil, %r13
	.word 0xab84c014  ! 268: WR_CLEAR_SOFTINT_R	wr	%r19, %r20, %clear_softint
splash_cmpr_4_128:
	setx 0x88f4b2adff7c0a59, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 269: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01966  ! 270: FqTOd	dis not found

splash_cmpr_4_130:
	setx 0xda76a8c45ed490a4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 271: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_131
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_131:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 272: RDPC	rd	%pc, %r10
splash_cmpr_4_132:
	setx 0x6b86c79dfe81a627, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 273: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_4_133:
	taddcctv %r10, 0x15b9, %r21
	.word 0xda07edb6  ! 274: LDUW_I	lduw	[%r31 + 0x0db6], %r13
mondo_4_134:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d90c00b  ! 275: WRPR_WSTATE_R	wrpr	%r3, %r11, %wstate
	rd %pc, %r19
	add %r19, (ivw_4_135-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_135:
	.word 0x91944002  ! 276: WRPR_PIL_R	wrpr	%r17, %r2, %pil
cwp_4_136:
    set user_data_start, %o7
	.word 0x93902006  ! 277: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
tagged_4_137:
	taddcctv %r19, 0x116d, %r7
	.word 0xda07edb6  ! 278: LDUW_I	lduw	[%r31 + 0x0db6], %r13
cwp_4_138:
    set user_data_start, %o7
	.word 0x93902002  ! 279: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 280: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_4_139:
	setx 0x09754e67138b7a8a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 281: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93450000  ! 282: RD_SET_SOFTINT	rd	%set_softint, %r9
splash_tba_4_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 283: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_4_141:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_141:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_141
    nop
debug_wait4_141:
    ld [%r23], %r16
    brnz %r16, debug_wait4_141
    nop
    ba,a debug_startwait4_141
continue_debug_4_141:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_141:
    cmp %r13, %r15
    bne,a wait_for_stat_4_141
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_141:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_141
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %18, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe0f00492  ! 284: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
debug_4_142:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 285: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902001  ! 286: WRPR_GL_I	wrpr	%r0, 0x0001, %-
cwp_4_143:
    set user_data_start, %o7
	.word 0x93902003  ! 287: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87902352  ! 288: WRPR_TT_I	wrpr	%r0, 0x0352, %tt
	.word 0x91702b63  ! 289: POPC_I	popc	0x0b63, %r8
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_144:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 290: RDPC	rd	%pc, %r18
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_145
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_145
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_145:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 291: RDPC	rd	%pc, %r12
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 292: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93a0016a  ! 293: FABSq	dis not found

splash_hpstate_4_146:
	.word 0x81982d04  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d04, %hpstate
mondo_4_147:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d940005  ! 295: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
	.word 0x81460000  ! 296: RD_STICK_REG	stbar
	.word 0x87902003  ! 297: WRPR_TT_I	wrpr	%r0, 0x0003, %tt
tagged_4_148:
	tsubcctv %r4, 0x1fc6, %r8
	.word 0xda07e368  ! 298: LDUW_I	lduw	[%r31 + 0x0368], %r13
splash_tba_4_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 299: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xda6fe368  ! 300: LDSTUB_I	ldstub	%r13, [%r31 + 0x0368]
splash_cmpr_4_150:
	setx 0xf5582fe5e118e232, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 301: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdabfe368  ! 302: STDA_I	stda	%r13, [%r31 + 0x0368] %asi
splash_tba_4_151:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1a00162  ! 304: FABSq	dis not found

	.word 0xda47e368  ! 305: LDSW_I	ldsw	[%r31 + 0x0368], %r13
	.word 0x8d903a00  ! 306: WRPR_PSTATE_I	wrpr	%r0, 0x1a00, %pstate
	rd %pc, %r19
	add %r19, (ivw_4_152-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_152:
	.word 0x91920001  ! 307: WRPR_PIL_R	wrpr	%r8, %r1, %pil
DS_4_153:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x93a449c5  ! 1: FDIVd	fdivd	%f48, %f36, %f40
	normalw
	.word 0x99458000  ! 308: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xd33fe368  ! 309: STDF_I	std	%f9, [0x0368, %r31]
	.word 0x91d02034  ! 310: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa750c000  ! 311: RDPR_TT	<illegal instruction>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00d  ! 312: CASA_R	casa	[%r31] %asi, %r13, %r9
tagged_4_155:
	taddcctv %r2, 0x1517, %r7
	.word 0xd207e368  ! 313: LDUW_I	lduw	[%r31 + 0x0368], %r9
DS_4_156:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 314: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976ae86a  ! 315: SDIVX_I	sdivx	%r11, 0x086a, %r11
	.word 0xe8dfe010  ! 316: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r20
debug_4_158:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 318: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_4_159:
	set 0x00380000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r12
	.word 0x8b98000c  ! 319: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_160
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_160:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 320: RDPC	rd	%pc, %r8
	.word 0xe537c000  ! 321: STQF_R	-	%f18, [%r0, %r31]
	.word 0x99464000  ! 322: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0x91d02033  ! 323: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xab850002  ! 324: WR_CLEAR_SOFTINT_R	wr	%r20, %r2, %clear_softint
	.word 0xd28804a0  ! 325: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
splash_cmpr_4_161:
	setx 0x69f73f6955f2d44d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902001  ! 327: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
DS_4_162:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x975617b9	! Random illegal ?
	.word 0x9ba209c2  ! 1: FDIVd	fdivd	%f8, %f2, %f44
	.word 0x99a1c833  ! 328: FADDs	fadds	%f7, %f19, %f12
	.word 0x8d9033da  ! 329: WRPR_PSTATE_I	wrpr	%r0, 0x13da, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 330: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd08fe000  ! 331: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r8
mondo_4_163:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d91800b  ! 332: WRPR_WSTATE_R	wrpr	%r6, %r11, %wstate
	.word 0x98837ae4  ! 333: ADDcc_I	addcc 	%r13, 0xfffffae4, %r12
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 334: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_hpstate_4_164:
	.word 0x81982d5e  ! 335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5e, %hpstate
tagged_4_165:
	taddcctv %r16, 0x1342, %r7
	.word 0xda07fbd4  ! 336: LDUW_I	lduw	[%r31 + 0xfffffbd4], %r13
	.word 0xa1902005  ! 337: WRPR_GL_I	wrpr	%r0, 0x0005, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_166) + 32, 16, 16)) -> intp(7,0,26)
intvec_4_166:
	.word 0x39400001  ! 338: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa783400a  ! 339: WR_GRAPHICS_STATUS_REG_R	wr	%r13, %r10, %-
splash_hpstate_4_168:
	.word 0x819821f4  ! 340: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01f4, %hpstate
DS_4_169:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 341: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d903ea2  ! 342: WRPR_PSTATE_I	wrpr	%r0, 0x1ea2, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_170) + 24, 16, 16)) -> intp(4,0,12)
intvec_4_170:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780208b  ! 344: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0xa1902001  ! 345: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_lsu_4_171:
	setx 0x12f14dd3b3c9bb23, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 346: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_4_172:
    set user_data_start, %o7
	.word 0x93902004  ! 347: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_cmpr_4_173:
	setx 0x0c74122870e9f238, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 348: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdac804a0  ! 349: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0x99520000  ! 350: RDPR_PIL	<illegal instruction>
	.word 0xd4c004a0  ! 351: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
donret_4_174:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_174-donret_4_174), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_174:
	.word 0xd4fffbd4  ! 352: SWAPA_I	swapa	%r10, [%r31 + 0xfffffbd4] %asi
intveclr_4_175:
	setx 0xc4fe28cb4a1a7198, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 353: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_4_176:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 354: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
cwp_4_177:
    set user_data_start, %o7
	.word 0x93902001  ! 355: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_randtl_4_178:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_178:
	.word 0x8f902000  ! 356: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd51fc000  ! 357: LDDF_R	ldd	[%r31, %r0], %f10
	.word 0x87802014  ! 358: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd4c804a0  ! 359: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x91d02034  ! 360: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xad82ae27  ! 361: WR_SOFTINT_REG_I	wr	%r10, 0x0e27, %softint
splash_htba_4_179:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 362: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4c804a0  ! 363: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 364: LDX_R	ldx	[%r31 + %r0], %r10
memptr_4_180:
	set user_data_start, %r31
	.word 0x8581f151  ! 365: WRCCR_I	wr	%r7, 0x1151, %ccr
debug_4_181:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 366: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_4_182:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 367: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_4_183:
	set 0x00380000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r12
	.word 0x8b98000c  ! 368: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4d804a0  ! 369: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
debug_4_184:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 370: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd4c004a0  ! 371: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0xd4d00e60  ! 372: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r10
splash_lsu_4_185:
	setx 0x3f6ab1d34917cd57, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 373: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200d  ! 374: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 375: LDX_R	ldx	[%r31 + %r0], %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_186) + 56, 16, 16)) -> intp(6,0,20)
intvec_4_186:
	.word 0x39400001  ! 376: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f803d64  ! 377: SIR	sir	0x1d64
	setx 0x0f1cc19668b0abd9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_187:
	.word 0x39400001  ! 378: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 379: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_hpstate_4_188:
	.word 0x8198215c  ! 380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015c, %hpstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_189:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e008  ! 381: CASA_R	casa	[%r31] %asi, %r8, %r10
debug_4_190:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 382: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_191
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_191
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_191:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 383: RDPC	rd	%pc, %r8
	.word 0xd6c7e030  ! 384: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
cwp_4_192:
    set user_data_start, %o7
	.word 0x93902000  ! 385: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd6800b40  ! 386: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r11
	.word 0xd6ffc028  ! 387: SWAPA_R	swapa	%r11, [%r31 + %r8] 0x01
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_193:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 388: CASA_R	casa	[%r31] %asi, %r8, %r11
debug_4_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01974  ! 390: FqTOd	dis not found

splash_hpstate_4_196:
	.word 0x819825cf  ! 391: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cf, %hpstate
	.word 0x8790233c  ! 392: WRPR_TT_I	wrpr	%r0, 0x033c, %tt
	setx 0x43baf33d6ccd5888, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_197:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d948013  ! 394: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
	.word 0x9ad2a489  ! 395: UMULcc_I	umulcc 	%r10, 0x0489, %r13
	.word 0xda880e80  ! 396: LDUBA_R	lduba	[%r0, %r0] 0x74, %r13
	.word 0xa1a009ca  ! 397: FDIVd	fdivd	%f0, %f10, %f16
splash_cmpr_4_199:
	setx 0x08ebacc40b40d039, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9a00543  ! 399: FSQRTd	fsqrt	
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 400: LDX_R	ldx	[%r31 + %r0], %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
change_to_randtl_3_0:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_0:
	.word 0xd8d7e020  ! 1: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
splash_cmpr_3_1:
	setx 0x36177baa5286bc0c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 2: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 3: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802020  ! 4: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87902392  ! 5: WRPR_TT_I	wrpr	%r0, 0x0392, %tt
debug_3_3:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 6: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
cwp_3_4:
    set user_data_start, %o7
	.word 0x93902007  ! 7: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902418  ! 8: WRPR_PSTATE_I	wrpr	%r0, 0x0418, %pstate
splash_cmpr_3_5:
	setx 0xd2780ab3c7db9470, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 9: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_3_6:
    set user_data_start, %o7
	.word 0x93902005  ! 10: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_3_7:
	setx 0xe4e1ecf416ea9aef, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 11: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_3_8:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 12: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x38800001  ! 13: BGU	bgu,a	<label_0x1>
	.word 0xd86fe5b9  ! 14: LDSTUB_I	ldstub	%r12, [%r31 + 0x05b9]
	.word 0x83d02034  ! 15: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8d9036a2  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x16a2, %pstate
	.word 0x30800001  ! 17: BA	ba,a	<label_0x1>
	.word 0xa1902003  ! 18: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 19: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd897e000  ! 20: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
	.word 0x8d903a1a  ! 21: WRPR_PSTATE_I	wrpr	%r0, 0x1a1a, %pstate
	.word 0x9b520000  ! 22: RDPR_PIL	<illegal instruction>
DS_3_9:
	.word 0x93a049c7  ! 1: FDIVd	fdivd	%f32, %f38, %f40
	.word 0xe930800a  ! 1: STQF_R	-	%f20, [%r10, %r2]
	normalw
	.word 0x93458000  ! 23: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x879023ca  ! 24: WRPR_TT_I	wrpr	%r0, 0x03ca, %tt
donret_3_10:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_10-donret_3_10), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_10:
	.word 0xd4ffe5b9  ! 25: SWAPA_I	swapa	%r10, [%r31 + 0x05b9] %asi
	.word 0x91d02035  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd46fe5b9  ! 27: LDSTUB_I	ldstub	%r10, [%r31 + 0x05b9]
	.word 0x99480000  ! 28: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
splash_htba_3_11:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 29: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d9027b1  ! 30: WRPR_PSTATE_I	wrpr	%r0, 0x07b1, %pstate
splash_cmpr_3_12:
	setx 0x329cf229dd77c048, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 31: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 32: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76aeeba  ! 33: SDIVX_I	sdivx	%r11, 0x0eba, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 34: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4c7e010  ! 35: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 36: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_3_14:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 37: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd48804a0  ! 38: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x91d02035  ! 39: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd45feeec  ! 40: LDX_I	ldx	[%r31 + 0x0eec], %r10
	.word 0x83d020b3  ! 41: Tcc_I	te	icc_or_xcc, %r0 + 179
DS_3_15:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x97b10305  ! 42: ALIGNADDRESS	alignaddr	%r4, %r5, %r11
debug_3_16:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 43: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_17
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_17:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 44: RDPC	rd	%pc, %r18
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 45: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa9500000  ! 46: RDPR_TPC	<illegal instruction>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 47: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902b40  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x0b40, %pstate
	.word 0xe6d7e030  ! 49: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r19
splash_cmpr_3_18:
	setx 0x9c723cb9569ed475, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_3_19:
    set user_data_start, %o7
	.word 0x93902001  ! 51: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_20) + 0, 16, 16)) -> intp(4,0,30)
intvec_3_20:
	.word 0x39400001  ! 52: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe637eeec  ! 53: STH_I	sth	%r19, [%r31 + 0x0eec]
memptr_3_21:
	set user_data_start, %r31
	.word 0x8580adda  ! 54: WRCCR_I	wr	%r2, 0x0dda, %ccr
splash_hpstate_3_22:
	.word 0x81982c46  ! 55: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c46, %hpstate
	.word 0xa0d9c00b  ! 56: SMULcc_R	smulcc 	%r7, %r11, %r16
	.word 0x97a049cb  ! 57: FDIVd	fdivd	%f32, %f42, %f42
memptr_3_23:
	set 0x60740000, %r31
	.word 0x85816d18  ! 58: WRCCR_I	wr	%r5, 0x0d18, %ccr
	.word 0xd4d004a0  ! 59: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 60: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_3_24:
	.word 0x81982067  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0067, %hpstate
change_to_randtl_3_25:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_25:
	.word 0x8f902001  ! 62: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x87802080  ! 63: WRASI_I	wr	%r0, 0x0080, %asi
tagged_3_26:
	tsubcctv %r21, 0x1b43, %r2
	.word 0xd407ee0f  ! 64: LDUW_I	lduw	[%r31 + 0x0e0f], %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa969bcf4  ! 65: SDIVX_I	sdivx	%r6, 0xfffffcf4, %r20
	.word 0x87802058  ! 66: WRASI_I	wr	%r0, 0x0058, %asi
memptr_3_28:
	set 0x60540000, %r31
	.word 0x85826765  ! 67: WRCCR_I	wr	%r9, 0x0765, %ccr
	setx 0x189312c8d236650f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_29:
	.word 0x39400001  ! 68: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_30:
	setx 0xa7de39dbef451dd6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 69: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_3_31:
	setx 0xa7975a267f3a72ec, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 70: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_32) + 32, 16, 16)) -> intp(3,0,14)
intvec_3_32:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda6ffb07  ! 72: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffffb07]
	.word 0xdadfe010  ! 73: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0xda27fb07  ! 74: STW_I	stw	%r13, [%r31 + 0xfffffb07]
donret_3_33:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_33-donret_3_33-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_33:
	.word 0xdafffb07  ! 75: SWAPA_I	swapa	%r13, [%r31 + 0xfffffb07] %asi
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_34
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_34
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_34:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 76: RDPC	rd	%pc, %r17
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 77: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93540000  ! 78: RDPR_GL	rdpr	%-, %r9
	setx 0xfb490cb3f033504a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_35:
	.word 0x39400001  ! 79: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4dfe020  ! 80: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
DS_3_36:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 81: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 82: LDX_R	ldx	[%r31 + %r0], %r10
splash_lsu_3_37:
	setx 0x425afbbde53bffef, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 83: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x97500000  ! 84: RDPR_TPC	<illegal instruction>
	.word 0xa3450000  ! 85: RD_SET_SOFTINT	rd	%set_softint, %r17
debug_3_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 86: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 87: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xa0faaf26  ! 88: SDIVcc_I	sdivcc 	%r10, 0x0f26, %r16
	.word 0xab84ba4b  ! 89: WR_CLEAR_SOFTINT_I	wr	%r18, 0x1a4b, %clear_softint
	.word 0xd08804a0  ! 90: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
debug_3_39:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 91: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_40:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00b  ! 92: CASA_R	casa	[%r31] %asi, %r11, %r8
cwp_3_41:
    set user_data_start, %o7
	.word 0x93902005  ! 93: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd13fc000  ! 94: STDF_R	std	%f8, [%r0, %r31]
	.word 0x87902233  ! 95: WRPR_TT_I	wrpr	%r0, 0x0233, %tt
DS_3_42:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 96: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_3_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_43:
	.word 0x8f902003  ! 97: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x9f80263f  ! 98: SIR	sir	0x063f
debug_3_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 99: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_3_45:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 100: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	.word 0x20800001  ! 101: BN	bn,a	<label_0x1>
change_to_randtl_3_46:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_46:
	.word 0x8f902000  ! 102: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9350c000  ! 103: RDPR_TT	<illegal instruction>
	.word 0x36800001  ! 104: BGE	bge,a	<label_0x1>
	.word 0x879020b4  ! 105: WRPR_TT_I	wrpr	%r0, 0x00b4, %tt
	.word 0x8d903881  ! 106: WRPR_PSTATE_I	wrpr	%r0, 0x1881, %pstate
splash_hpstate_3_47:
	.word 0x819826c6  ! 107: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c6, %hpstate
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 108: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd0d004a0  ! 109: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
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
	.word 0x91414000  ! 110: RDPC	rd	%pc, %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01973  ! 111: FqTOd	dis not found

	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 112: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 113: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe2880e40  ! 114: LDUBA_R	lduba	[%r0, %r0] 0x72, %r17
	.word 0x8d9034ea  ! 115: WRPR_PSTATE_I	wrpr	%r0, 0x14ea, %pstate
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
	.word 0x95414000  ! 116: RDPC	rd	%pc, %r10
DS_3_51:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd7308002  ! 1: STQF_R	-	%f11, [%r2, %r2]
	normalw
	.word 0x95458000  ! 117: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x3a700001  ! 118: BPCC	<illegal instruction>
splash_hpstate_3_52:
	.word 0x81982d04  ! 119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d04, %hpstate
	.word 0xe6d00e80  ! 120: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96ce2f7  ! 121: SDIVX_I	sdivx	%r19, 0x02f7, %r20
	.word 0x93540000  ! 122: RDPR_GL	<illegal instruction>
DS_3_54:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 123: RESTORE_R	restore	%r31, %r0, %r31
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_55
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_55:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e007  ! 124: CASA_R	casa	[%r31] %asi, %r7, %r20
change_to_randtl_3_56:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_56:
	.word 0x8f902000  ! 125: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe88008a0  ! 126: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xa6d4fa2d  ! 127: UMULcc_I	umulcc 	%r19, 0xfffffa2d, %r19
splash_lsu_3_57:
	setx 0x141e50f2a38b1267, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 128: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_3_58:
	tsubcctv %r11, 0x1e5b, %r4
	.word 0xd207ec1f  ! 129: LDUW_I	lduw	[%r31 + 0x0c1f], %r9
	.word 0xd297e030  ! 130: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r9
	.word 0x9190f31e  ! 131: WRPR_PIL_I	wrpr	%r3, 0x131e, %pil
	setx 0x07f5dc271cad6290, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_59:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 133: WRASI_I	wr	%r0, 0x0058, %asi
DS_3_60:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 134: SAVE_R	save	%r31, %r0, %r31
	.word 0xd2800aa0  ! 135: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r9
memptr_3_61:
	set 0x60740000, %r31
	.word 0x8582abfe  ! 136: WRCCR_I	wr	%r10, 0x0bfe, %ccr
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 137: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_62
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_62:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e007  ! 138: CASA_R	casa	[%r31] %asi, %r7, %r9
	.word 0x87802089  ! 139: WRASI_I	wr	%r0, 0x0089, %asi
change_to_randtl_3_63:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_63:
	.word 0x8f902000  ! 140: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 141: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd26feb9a  ! 142: LDSTUB_I	ldstub	%r9, [%r31 + 0x0b9a]
	.word 0x9553c000  ! 143: RDPR_FQ	<illegal instruction>
	.word 0xd6cfe000  ! 144: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01970  ! 145: FqTOd	dis not found

debug_3_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 146: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_66:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 147: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x9190b528  ! 148: WRPR_PIL_I	wrpr	%r2, 0x1528, %pil
DS_3_67:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd9148014  ! 1: LDQF_R	-	[%r18, %r20], %f12
	.word 0x93a18827  ! 149: FADDs	fadds	%f6, %f7, %f9
pmu_3_68:
	nop
	setx 0xfffff5b0fffff8d1, %g1, %g7
	.word 0xa3800007  ! 150: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38800001  ! 151: BGU	bgu,a	<label_0x1>
	.word 0xe33fc000  ! 152: STDF_R	std	%f17, [%r0, %r31]
splash_cmpr_3_69:
	setx 0x298f78e9a87900ed, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 153: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3450000  ! 154: RD_SET_SOFTINT	rd	%set_softint, %r17
donret_3_70:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_70-donret_3_70), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_70:
	.word 0xe4fff6c3  ! 155: SWAPA_I	swapa	%r18, [%r31 + 0xfffff6c3] %asi
pmu_3_71:
	nop
	setx 0xfffffe64fffffb11, %g1, %g7
	.word 0xa3800007  ! 156: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_3_72:
	setx 0xc4cd43e2d8d72ded, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 157: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903508  ! 158: WRPR_PSTATE_I	wrpr	%r0, 0x1508, %pstate
	.word 0xe48fe030  ! 159: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r18
change_to_randtl_3_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_73:
	.word 0x8f902001  ! 160: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x91d02035  ! 161: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_tba_3_74:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 162: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_75
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_75:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 163: RDPC	rd	%pc, %r12
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 164: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_3_76:
	setx 0x06da3ddbc6db99c2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 165: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
cwp_3_77:
    set user_data_start, %o7
	.word 0x93902000  ! 166: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd68008a0  ! 167: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_78
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_78
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_78:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 168: RDPC	rd	%pc, %r9
	.word 0xa6fc0011  ! 169: SDIVcc_R	sdivcc 	%r16, %r17, %r19
splash_cmpr_3_79:
	setx 0xeebf250b708a4b00, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 170: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91a00161  ! 171: FABSq	dis not found

	.word 0xe097e000  ! 172: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r16
mondo_3_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d94000d  ! 173: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
	.word 0x87802014  ! 174: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93d020b3  ! 175: Tcc_I	tne	icc_or_xcc, %r0 + 179
memptr_3_81:
	set user_data_start, %r31
	.word 0x858422c9  ! 176: WRCCR_I	wr	%r16, 0x02c9, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 177: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe0c804a0  ! 178: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r16
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36935da  ! 179: SDIVX_I	sdivx	%r4, 0xfffff5da, %r17
	.word 0x97480000  ! 180: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
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
	.word 0xd7e7e012  ! 181: CASA_R	casa	[%r31] %asi, %r18, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_84) + 48, 16, 16)) -> intp(5,0,13)
intvec_3_84:
	.word 0x39400001  ! 182: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd727c000  ! 183: STF_R	st	%f11, [%r0, %r31]
mondo_3_85:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d90400a  ! 184: WRPR_WSTATE_R	wrpr	%r1, %r10, %wstate
splash_lsu_3_86:
	setx 0x49505733aef2d27f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe000  ! 186: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
debug_3_87:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 187: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xd67ff8cc  ! 188: SWAP_I	swap	%r11, [%r31 + 0xfffff8cc]
	.word 0x8780201c  ! 189: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x99a1c9c8  ! 190: FDIVd	fdivd	%f38, %f8, %f12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_88) + 16, 16, 16)) -> intp(6,0,6)
intvec_3_88:
	.word 0x39400001  ! 191: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 192: WRASI_I	wr	%r0, 0x0004, %asi
	setx 0x4b2edd9059950867, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_89:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_3_90:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 194: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
splash_lsu_3_91:
	setx 0xcdd97fa451e55fc5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 195: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_3_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 196: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_3_93:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 197: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
debug_3_94:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 198: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_95
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_95:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 199: RDPC	rd	%pc, %r18
	.word 0xe07ff8cc  ! 200: SWAP_I	swap	%r16, [%r31 + 0xfffff8cc]
	.word 0x8d903622  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x1622, %pstate
tagged_3_96:
	tsubcctv %r8, 0x1757, %r6
	.word 0xe007f8cc  ! 202: LDUW_I	lduw	[%r31 + 0xfffff8cc], %r16
mondo_3_97:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d94000a  ! 203: WRPR_WSTATE_R	wrpr	%r16, %r10, %wstate
	.word 0x91a489d2  ! 204: FDIVd	fdivd	%f18, %f18, %f8
	.word 0x8d903715  ! 205: WRPR_PSTATE_I	wrpr	%r0, 0x1715, %pstate
splash_lsu_3_98:
	setx 0x26622a2c297c14b1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 206: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x98d4791e  ! 207: UMULcc_I	umulcc 	%r17, 0xfffff91e, %r12
	.word 0xad812afb  ! 208: WR_SOFTINT_REG_I	wr	%r4, 0x0afb, %softint
	.word 0x93a509cd  ! 209: FDIVd	fdivd	%f20, %f44, %f40
	.word 0x97a00170  ! 210: FABSq	dis not found

	.word 0x87802083  ! 211: WRASI_I	wr	%r0, 0x0083, %asi
debug_3_99:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 212: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_100
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_100:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00b  ! 213: CASA_R	casa	[%r31] %asi, %r11, %r18
splash_tba_3_101:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 214: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_3_102:
	setx 0x799963d57c6325de, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x81460000  ! 217: RD_STICK_REG	stbar
	.word 0xe4900e40  ! 218: LDUHA_R	lduha	[%r0, %r0] 0x72, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01970  ! 219: FqTOd	dis not found

tagged_3_104:
	tsubcctv %r2, 0x1eff, %r12
	.word 0xe807e50d  ! 220: LDUW_I	lduw	[%r31 + 0x050d], %r20
	.word 0x919263cd  ! 221: WRPR_PIL_I	wrpr	%r9, 0x03cd, %pil
pmu_3_105:
	nop
	setx 0xffffff17fffff80c, %g1, %g7
	.word 0xa3800007  ! 222: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_3_106:
	setx 0xef7b41d0bf4741f2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 224: LDX_R	ldx	[%r31 + %r0], %r20
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 225: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe83fe48b  ! 226: STD_I	std	%r20, [%r31 + 0x048b]
	.word 0x8d802004  ! 227: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x95702015  ! 228: POPC_I	popc	0x0015, %r10
splash_hpstate_3_107:
	.word 0x81982ecc  ! 229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecc, %hpstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e003  ! 230: CASA_R	casa	[%r31] %asi, %r3, %r8
	.word 0x91480000  ! 231: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
splash_htba_3_109:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 232: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d903f62  ! 233: WRPR_PSTATE_I	wrpr	%r0, 0x1f62, %pstate
debug_3_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 234: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_3_111:
	taddcctv %r7, 0x10d8, %r6
	.word 0xd607f25b  ! 235: LDUW_I	lduw	[%r31 + 0xfffff25b], %r11
cwp_3_112:
    set user_data_start, %o7
	.word 0x93902003  ! 236: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_cmpr_3_113:
	setx 0x1785eb60ffa80f27, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 237: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd677c000  ! 238: STX_R	stx	%r11, [%r31 + %r0]
	.word 0xa9800008  ! 239: WR_SET_SOFTINT_R	wr	%r0, %r8, %set_softint
memptr_3_114:
	set user_data_start, %r31
	.word 0x8581e8cd  ! 240: WRCCR_I	wr	%r7, 0x08cd, %ccr
debug_3_115:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 241: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 242: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_3_116:
	setx 0x11c221b49a2bc217, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 243: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802f39  ! 244: SIR	sir	0x0f39
	.word 0xab848005  ! 245: WR_CLEAR_SOFTINT_R	wr	%r18, %r5, %clear_softint
tagged_3_117:
	taddcctv %r5, 0x11b2, %r13
	.word 0xd607fea4  ! 246: LDUW_I	lduw	[%r31 + 0xfffffea4], %r11
debug_3_118:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 247: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_3_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d94c013  ! 248: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	.word 0x9b500000  ! 249: RDPR_TPC	<illegal instruction>
tagged_3_120:
	tsubcctv %r8, 0x167d, %r14
	.word 0xd807fea4  ! 250: LDUW_I	lduw	[%r31 + 0xfffffea4], %r12
	.word 0x9ba00165  ! 251: FABSq	dis not found

	.word 0xd6c00e80  ! 252: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r11
splash_lsu_3_121:
	setx 0x5d7386de519b793f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 253: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_3_122:
	set 0x60740000, %r31
	.word 0x8581e69f  ! 254: WRCCR_I	wr	%r7, 0x069f, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 255: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6d7e000  ! 256: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r11
splash_cmpr_3_123:
	setx 0xf1e5c6d291eef8b5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 257: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 258: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9b500000  ! 259: RDPR_TPC	<illegal instruction>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_124:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 260: CASA_R	casa	[%r31] %asi, %r5, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01964  ! 262: FqTOd	dis not found

	.word 0x8d903dd3  ! 263: WRPR_PSTATE_I	wrpr	%r0, 0x1dd3, %pstate
DS_3_126:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x87560074	! Random illegal ?
	.word 0xa7a0054b  ! 1: FSQRTd	fsqrt	
	.word 0x9ba2c833  ! 264: FADDs	fadds	%f11, %f19, %f13
	.word 0xd6800b60  ! 265: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r11
intveclr_3_127:
	setx 0x55a671b2748fa7cc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 266: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97520000  ! 267: RDPR_PIL	rdpr	%pil, %r11
	.word 0xab82c006  ! 268: WR_CLEAR_SOFTINT_R	wr	%r11, %r6, %clear_softint
splash_cmpr_3_128:
	setx 0xd19a4b2686a24e3e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 269: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01962  ! 270: FqTOd	dis not found

splash_cmpr_3_130:
	setx 0x6f198b9416f9006f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 271: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_131
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_131:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 272: RDPC	rd	%pc, %r12
splash_cmpr_3_132:
	setx 0x1ce1579e11022652, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 273: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_3_133:
	taddcctv %r23, 0x1af8, %r4
	.word 0xda07edb6  ! 274: LDUW_I	lduw	[%r31 + 0x0db6], %r13
mondo_3_134:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d918007  ! 275: WRPR_WSTATE_R	wrpr	%r6, %r7, %wstate
	rd %pc, %r19
	add %r19, (ivw_3_135-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_135:
	.word 0x9190c009  ! 276: WRPR_PIL_R	wrpr	%r3, %r9, %pil
cwp_3_136:
    set user_data_start, %o7
	.word 0x93902004  ! 277: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
tagged_3_137:
	taddcctv %r18, 0x19c4, %r2
	.word 0xda07edb6  ! 278: LDUW_I	lduw	[%r31 + 0x0db6], %r13
cwp_3_138:
    set user_data_start, %o7
	.word 0x93902005  ! 279: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 280: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_3_139:
	setx 0xbe891bad45139b93, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 281: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9b450000  ! 282: RD_SET_SOFTINT	rd	%set_softint, %r13
splash_tba_3_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 283: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_3_141:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 284: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
debug_3_142:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 285: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902005  ! 286: WRPR_GL_I	wrpr	%r0, 0x0005, %-
cwp_3_143:
    set user_data_start, %o7
	.word 0x93902003  ! 287: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x879023ba  ! 288: WRPR_TT_I	wrpr	%r0, 0x03ba, %tt
	.word 0xa7702905  ! 289: POPC_I	popc	0x0905, %r19
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_144
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_144:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 290: RDPC	rd	%pc, %r8
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_145
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_145
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_145:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 291: RDPC	rd	%pc, %r13
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 292: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99a00173  ! 293: FABSq	dis not found

splash_hpstate_3_146:
	.word 0x819823c4  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c4, %hpstate
mondo_3_147:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d94800d  ! 295: WRPR_WSTATE_R	wrpr	%r18, %r13, %wstate
	.word 0x81460000  ! 296: RD_STICK_REG	stbar
	.word 0x879022d0  ! 297: WRPR_TT_I	wrpr	%r0, 0x02d0, %tt
tagged_3_148:
	tsubcctv %r10, 0x167d, %r15
	.word 0xda07e368  ! 298: LDUW_I	lduw	[%r31 + 0x0368], %r13
splash_tba_3_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 299: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xda6fe368  ! 300: LDSTUB_I	ldstub	%r13, [%r31 + 0x0368]
splash_cmpr_3_150:
	setx 0x486a7197e00283bc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 301: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdabfe368  ! 302: STDA_I	stda	%r13, [%r31 + 0x0368] %asi
splash_tba_3_151:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa5a00165  ! 304: FABSq	dis not found

	.word 0xda47e368  ! 305: LDSW_I	ldsw	[%r31 + 0x0368], %r13
	.word 0x8d903355  ! 306: WRPR_PSTATE_I	wrpr	%r0, 0x1355, %pstate
	rd %pc, %r19
	add %r19, (ivw_3_152-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_152:
	.word 0x9190c009  ! 307: WRPR_PIL_R	wrpr	%r3, %r9, %pil
DS_3_153:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa9a289c1  ! 1: FDIVd	fdivd	%f10, %f32, %f20
	normalw
	.word 0xa3458000  ! 308: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0xd33fe368  ! 309: STDF_I	std	%f9, [0x0368, %r31]
	.word 0x83d02034  ! 310: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xa950c000  ! 311: RDPR_TT	<illegal instruction>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00d  ! 312: CASA_R	casa	[%r31] %asi, %r13, %r9
tagged_3_155:
	taddcctv %r6, 0x1be3, %r18
	.word 0xd207e368  ! 313: LDUW_I	lduw	[%r31 + 0x0368], %r9
DS_3_156:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 314: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996a72b6  ! 315: SDIVX_I	sdivx	%r9, 0xfffff2b6, %r12
	.word 0xe8dfe010  ! 316: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r20
debug_3_158:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 318: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_3_159:
	set 0x00390000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00390000, %r12
	.word 0x8b98000c  ! 319: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_160
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_160:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 320: RDPC	rd	%pc, %r19
	.word 0xe537c000  ! 321: STQF_R	-	%f18, [%r0, %r31]
	.word 0xa3464000  ! 322: RD_STICK_CMPR_REG	rd	%-, %r17
	.word 0x91d020b5  ! 323: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xab814002  ! 324: WR_CLEAR_SOFTINT_R	wr	%r5, %r2, %clear_softint
	.word 0xd28804a0  ! 325: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
splash_cmpr_3_161:
	setx 0xa13e8a58bceb04bd, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902004  ! 327: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
DS_3_162:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe74bb989	! Random illegal ?
	.word 0xa7a409d0  ! 1: FDIVd	fdivd	%f16, %f16, %f50
	.word 0x95a24832  ! 328: FADDs	fadds	%f9, %f18, %f10
	.word 0x8d902792  ! 329: WRPR_PSTATE_I	wrpr	%r0, 0x0792, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 330: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd08fe030  ! 331: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r8
mondo_3_163:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d90c012  ! 332: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
	.word 0x9080a889  ! 333: ADDcc_I	addcc 	%r2, 0x0889, %r8
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 334: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_hpstate_3_164:
	.word 0x81982146  ! 335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0146, %hpstate
tagged_3_165:
	taddcctv %r26, 0x1a36, %r24
	.word 0xda07fbd4  ! 336: LDUW_I	lduw	[%r31 + 0xfffffbd4], %r13
	.word 0xa190200f  ! 337: WRPR_GL_I	wrpr	%r0, 0x000f, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_166) + 40, 16, 16)) -> intp(0,0,11)
intvec_3_166:
	.word 0x39400001  ! 338: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_decr_3_167:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r18, [%r1] 0x45
	.word 0xa7808007  ! 339: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r7, %-
splash_hpstate_3_168:
	.word 0x8198295c  ! 340: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095c, %hpstate
DS_3_169:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 341: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d9020a2  ! 342: WRPR_PSTATE_I	wrpr	%r0, 0x00a2, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_170) + 48, 16, 16)) -> intp(7,0,13)
intvec_3_170:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 344: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xa1902006  ! 345: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_lsu_3_171:
	setx 0x3bbd53f3f498d579, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 346: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_3_172:
    set user_data_start, %o7
	.word 0x93902001  ! 347: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_cmpr_3_173:
	setx 0x89203d1b92a25c98, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 348: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdac804a0  ! 349: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0x91520000  ! 350: RDPR_PIL	<illegal instruction>
	.word 0xd4c004a0  ! 351: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
donret_3_174:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_174-donret_3_174), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_174:
	.word 0xd4fffbd4  ! 352: SWAPA_I	swapa	%r10, [%r31 + 0xfffffbd4] %asi
intveclr_3_175:
	setx 0x4f5ee3875282b559, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 353: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_3_176:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 354: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
cwp_3_177:
    set user_data_start, %o7
	.word 0x93902005  ! 355: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
change_to_randtl_3_178:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_178:
	.word 0x8f902000  ! 356: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd51fc000  ! 357: LDDF_R	ldd	[%r31, %r0], %f10
	.word 0x8780204f  ! 358: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xd4c804a0  ! 359: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x83d02035  ! 360: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xad853be3  ! 361: WR_SOFTINT_REG_I	wr	%r20, 0x1be3, %softint
splash_htba_3_179:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 362: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4c804a0  ! 363: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 364: LDX_R	ldx	[%r31 + %r0], %r10
memptr_3_180:
	set user_data_start, %r31
	.word 0x8582a559  ! 365: WRCCR_I	wr	%r10, 0x0559, %ccr
debug_3_181:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 366: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_3_182:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 367: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_3_183:
	set 0x00390000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00390000, %r12
	.word 0x8b98000c  ! 368: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4d804a0  ! 369: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
debug_3_184:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 370: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd4c00e40  ! 371: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r10
	.word 0xd4d004a0  ! 372: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
splash_lsu_3_185:
	setx 0x1fa2002f873c390d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 373: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 374: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 375: LDX_R	ldx	[%r31 + %r0], %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_186) + 32, 16, 16)) -> intp(4,0,18)
intvec_3_186:
	.word 0x39400001  ! 376: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f803285  ! 377: SIR	sir	0x1285
	setx 0x74a726605241bea8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_187:
	.word 0x39400001  ! 378: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 379: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_3_188:
	.word 0x8198254d  ! 380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054d, %hpstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_189:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e008  ! 381: CASA_R	casa	[%r31] %asi, %r8, %r10
debug_3_190:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 382: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_191
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_191
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_191:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 383: RDPC	rd	%pc, %r13
	.word 0xd6c7e020  ! 384: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
cwp_3_192:
    set user_data_start, %o7
	.word 0x93902007  ! 385: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd6800ae0  ! 386: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r11
	.word 0xd6ffc028  ! 387: SWAPA_R	swapa	%r11, [%r31 + %r8] 0x01
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_193:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 388: CASA_R	casa	[%r31] %asi, %r8, %r11
debug_3_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01964  ! 390: FqTOd	dis not found

splash_hpstate_3_196:
	.word 0x81982c44  ! 391: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c44, %hpstate
	.word 0x879021d7  ! 392: WRPR_TT_I	wrpr	%r0, 0x01d7, %tt
	setx 0xcf8654957fcfbbb8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_197:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_3_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d900005  ! 394: WRPR_WSTATE_R	wrpr	%r0, %r5, %wstate
	.word 0x96d53f2f  ! 395: UMULcc_I	umulcc 	%r20, 0xffffff2f, %r11
	.word 0xda8804a0  ! 396: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x97a0c9cd  ! 397: FDIVd	fdivd	%f34, %f44, %f42
splash_cmpr_3_199:
	setx 0xb018ffb9586313ad, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9ba00545  ! 399: FSQRTd	fsqrt	
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 400: LDX_R	ldx	[%r31 + %r0], %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
change_to_randtl_2_0:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_0:
	.word 0xd8d7e000  ! 1: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
splash_cmpr_2_1:
	setx 0x6ebcfc0fcc4129d6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 2: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 3: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802089  ! 4: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87902100  ! 5: WRPR_TT_I	wrpr	%r0, 0x0100, %tt
debug_2_3:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 6: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
cwp_2_4:
    set user_data_start, %o7
	.word 0x93902006  ! 7: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d902f0f  ! 8: WRPR_PSTATE_I	wrpr	%r0, 0x0f0f, %pstate
splash_cmpr_2_5:
	setx 0x54cb004fda375fa8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 9: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_2_6:
    set user_data_start, %o7
	.word 0x93902000  ! 10: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_2_7:
	setx 0x1e2ee03fb5c95eef, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 11: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_2_8:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 12: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x38800001  ! 13: BGU	bgu,a	<label_0x1>
	.word 0xd86fe5b9  ! 14: LDSTUB_I	ldstub	%r12, [%r31 + 0x05b9]
	.word 0x83d020b4  ! 15: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0x8d903741  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x1741, %pstate
	.word 0x30800001  ! 17: BA	ba,a	<label_0x1>
	.word 0xa1902007  ! 18: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 19: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd897e030  ! 20: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
	.word 0x8d90307e  ! 21: WRPR_PSTATE_I	wrpr	%r0, 0x107e, %pstate
	.word 0x9b520000  ! 22: RDPR_PIL	<illegal instruction>
DS_2_9:
	.word 0xa9a0c9d4  ! 1: FDIVd	fdivd	%f34, %f20, %f20
	.word 0xdb344014  ! 1: STQF_R	-	%f13, [%r20, %r17]
	normalw
	.word 0x91458000  ! 23: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x87902176  ! 24: WRPR_TT_I	wrpr	%r0, 0x0176, %tt
donret_2_10:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_10-donret_2_10), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_10:
	.word 0xd4ffe5b9  ! 25: SWAPA_I	swapa	%r10, [%r31 + 0x05b9] %asi
	.word 0x91d02035  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd46fe5b9  ! 27: LDSTUB_I	ldstub	%r10, [%r31 + 0x05b9]
	.word 0x9b480000  ! 28: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
splash_htba_2_11:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 29: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d903117  ! 30: WRPR_PSTATE_I	wrpr	%r0, 0x1117, %pstate
splash_cmpr_2_12:
	setx 0x4bef31879fe29ad5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 31: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 32: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9697eea  ! 33: SDIVX_I	sdivx	%r5, 0xfffffeea, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 34: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4c7e030  ! 35: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 36: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_2_14:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 37: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4880e80  ! 38: LDUBA_R	lduba	[%r0, %r0] 0x74, %r10
	.word 0x93d02033  ! 39: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xd45feeec  ! 40: LDX_I	ldx	[%r31 + 0x0eec], %r10
	.word 0x93d02034  ! 41: Tcc_I	tne	icc_or_xcc, %r0 + 52
DS_2_15:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x91b44305  ! 42: ALIGNADDRESS	alignaddr	%r17, %r5, %r8
debug_2_16:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 43: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_17
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_17:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 44: RDPC	rd	%pc, %r9
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 45: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93500000  ! 46: RDPR_TPC	<illegal instruction>
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 47: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9039ba  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x19ba, %pstate
	.word 0xe6d7e020  ! 49: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r19
splash_cmpr_2_18:
	setx 0x29e6f3f391a7e468, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_2_19:
    set user_data_start, %o7
	.word 0x93902004  ! 51: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_20) + 0, 16, 16)) -> intp(4,0,28)
intvec_2_20:
	.word 0x39400001  ! 52: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe637eeec  ! 53: STH_I	sth	%r19, [%r31 + 0x0eec]
memptr_2_21:
	set user_data_start, %r31
	.word 0x85846f4c  ! 54: WRCCR_I	wr	%r17, 0x0f4c, %ccr
splash_hpstate_2_22:
	.word 0x8198240d  ! 55: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040d, %hpstate
	.word 0x90dd0007  ! 56: SMULcc_R	smulcc 	%r20, %r7, %r8
	.word 0xa9a309d1  ! 57: FDIVd	fdivd	%f12, %f48, %f20
memptr_2_23:
	set 0x60740000, %r31
	.word 0x8580f50a  ! 58: WRCCR_I	wr	%r3, 0x150a, %ccr
	.word 0xd4d004a0  ! 59: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 60: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_hpstate_2_24:
	.word 0x81982a8c  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8c, %hpstate
change_to_randtl_2_25:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_25:
	.word 0x8f902002  ! 62: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x87802058  ! 63: WRASI_I	wr	%r0, 0x0058, %asi
tagged_2_26:
	tsubcctv %r3, 0x115b, %r5
	.word 0xd407ee0f  ! 64: LDUW_I	lduw	[%r31 + 0x0e0f], %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93693e33  ! 65: SDIVX_I	sdivx	%r4, 0xfffffe33, %r9
	.word 0x8780208b  ! 66: WRASI_I	wr	%r0, 0x008b, %asi
memptr_2_28:
	set 0x60740000, %r31
	.word 0x85846ad2  ! 67: WRCCR_I	wr	%r17, 0x0ad2, %ccr
	setx 0x28902266c4bbd0f4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_29:
	.word 0x39400001  ! 68: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_30:
	setx 0xc443fda2ddf74fbc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 69: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_31:
	setx 0x4f11f275d5281df3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 70: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_32) + 16, 16, 16)) -> intp(0,0,14)
intvec_2_32:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda6ffb07  ! 72: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffffb07]
	.word 0xdadfe010  ! 73: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0xda27fb07  ! 74: STW_I	stw	%r13, [%r31 + 0xfffffb07]
donret_2_33:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_33-donret_2_33-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_33:
	.word 0xdafffb07  ! 75: SWAPA_I	swapa	%r13, [%r31 + 0xfffffb07] %asi
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_34
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_34
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_34:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 76: RDPC	rd	%pc, %r11
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 77: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93540000  ! 78: RDPR_GL	rdpr	%-, %r9
	setx 0x9db8eb17b2719eb7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_35:
	.word 0x39400001  ! 79: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4dfe030  ! 80: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
DS_2_36:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 81: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 82: LDX_R	ldx	[%r31 + %r0], %r10
splash_lsu_2_37:
	setx 0x946276dd2f21946b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 83: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x97500000  ! 84: RDPR_TPC	<illegal instruction>
	.word 0x97450000  ! 85: RD_SET_SOFTINT	rd	%set_softint, %r11
debug_2_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 86: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 87: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x92f8668d  ! 88: SDIVcc_I	sdivcc 	%r1, 0x068d, %r9
	.word 0xab80a8c9  ! 89: WR_CLEAR_SOFTINT_I	wr	%r2, 0x08c9, %clear_softint
	.word 0xd08804a0  ! 90: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
debug_2_39:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 91: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_40:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00b  ! 92: CASA_R	casa	[%r31] %asi, %r11, %r8
cwp_2_41:
    set user_data_start, %o7
	.word 0x93902002  ! 93: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd13fc000  ! 94: STDF_R	std	%f8, [%r0, %r31]
	.word 0x8790222d  ! 95: WRPR_TT_I	wrpr	%r0, 0x022d, %tt
DS_2_42:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 96: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_2_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_43:
	.word 0x8f902001  ! 97: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x9f802493  ! 98: SIR	sir	0x0493
debug_2_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 99: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_2_45:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 100: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0x20800001  ! 101: BN	bn,a	<label_0x1>
change_to_randtl_2_46:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_46:
	.word 0x8f902001  ! 102: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa150c000  ! 103: RDPR_TT	<illegal instruction>
	.word 0x36800001  ! 104: BGE	bge,a	<label_0x1>
	.word 0x8790235a  ! 105: WRPR_TT_I	wrpr	%r0, 0x035a, %tt
	.word 0x8d9037c2  ! 106: WRPR_PSTATE_I	wrpr	%r0, 0x17c2, %pstate
splash_hpstate_2_47:
	.word 0x81982655  ! 107: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0655, %hpstate
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 108: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd0d00e40  ! 109: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r8
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
	.word 0x95414000  ! 110: RDPC	rd	%pc, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01967  ! 111: FqTOd	dis not found

	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 112: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 113: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe2880e80  ! 114: LDUBA_R	lduba	[%r0, %r0] 0x74, %r17
	.word 0x8d902a9c  ! 115: WRPR_PSTATE_I	wrpr	%r0, 0x0a9c, %pstate
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
	.word 0xa5414000  ! 116: RDPC	rd	%pc, %r18
DS_2_51:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe5318014  ! 1: STQF_R	-	%f18, [%r20, %r6]
	normalw
	.word 0xa3458000  ! 117: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x3a700001  ! 118: BPCC	<illegal instruction>
splash_hpstate_2_52:
	.word 0x81982e97  ! 119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e97, %hpstate
	.word 0xe6d004a0  ! 120: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976aff9f  ! 121: SDIVX_I	sdivx	%r11, 0xffffff9f, %r11
	.word 0x9b540000  ! 122: RDPR_GL	<illegal instruction>
DS_2_54:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 123: RESTORE_R	restore	%r31, %r0, %r31
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_55
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_55:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e007  ! 124: CASA_R	casa	[%r31] %asi, %r7, %r20
change_to_randtl_2_56:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_56:
	.word 0x8f902001  ! 125: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe8800b40  ! 126: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r20
	.word 0x94d2ee51  ! 127: UMULcc_I	umulcc 	%r11, 0x0e51, %r10
splash_lsu_2_57:
	setx 0xcc8fb81c3018df27, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 128: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_2_58:
	tsubcctv %r20, 0x1f0b, %r15
	.word 0xd207ec1f  ! 129: LDUW_I	lduw	[%r31 + 0x0c1f], %r9
	.word 0xd297e020  ! 130: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
	.word 0x91907053  ! 131: WRPR_PIL_I	wrpr	%r1, 0x1053, %pil
	setx 0x01df6f19a345ce75, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_59:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 133: WRASI_I	wr	%r0, 0x001c, %asi
DS_2_60:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 134: SAVE_R	save	%r31, %r0, %r31
	.word 0xd2800a60  ! 135: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r9
memptr_2_61:
	set 0x60540000, %r31
	.word 0x85847f0d  ! 136: WRCCR_I	wr	%r17, 0x1f0d, %ccr
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 137: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_62
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_62:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e007  ! 138: CASA_R	casa	[%r31] %asi, %r7, %r9
	.word 0x8780204f  ! 139: WRASI_I	wr	%r0, 0x004f, %asi
change_to_randtl_2_63:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_63:
	.word 0x8f902002  ! 140: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 141: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd26feb9a  ! 142: LDSTUB_I	ldstub	%r9, [%r31 + 0x0b9a]
	.word 0x9953c000  ! 143: RDPR_FQ	<illegal instruction>
	.word 0xd6cfe030  ! 144: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01973  ! 145: FqTOd	dis not found

debug_2_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 146: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_66:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 147: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x9191a8c7  ! 148: WRPR_PIL_I	wrpr	%r6, 0x08c7, %pil
DS_2_67:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe1118014  ! 1: LDQF_R	-	[%r6, %r20], %f16
	.word 0x97a4882c  ! 149: FADDs	fadds	%f18, %f12, %f11
pmu_2_68:
	nop
	setx 0xfffff0f1fffffe4f, %g1, %g7
	.word 0xa3800007  ! 150: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38800001  ! 151: BGU	bgu,a	<label_0x1>
	.word 0xe33fc000  ! 152: STDF_R	std	%f17, [%r0, %r31]
splash_cmpr_2_69:
	setx 0x79f2315a9e0f2208, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 153: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95450000  ! 154: RD_SET_SOFTINT	rd	%set_softint, %r10
donret_2_70:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_70-donret_2_70), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_70:
	.word 0xe4fff6c3  ! 155: SWAPA_I	swapa	%r18, [%r31 + 0xfffff6c3] %asi
pmu_2_71:
	nop
	setx 0xfffffe94fffff9f1, %g1, %g7
	.word 0xa3800007  ! 156: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_2_72:
	setx 0x00c4369561412e99, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 157: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903e6a  ! 158: WRPR_PSTATE_I	wrpr	%r0, 0x1e6a, %pstate
	.word 0xe48fe030  ! 159: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r18
change_to_randtl_2_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_73:
	.word 0x8f902003  ! 160: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x91d020b3  ! 161: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_tba_2_74:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 162: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_75
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_75:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 163: RDPC	rd	%pc, %r8
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 164: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_2_76:
	setx 0xbf729ecc32fe500a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 165: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
cwp_2_77:
    set user_data_start, %o7
	.word 0x93902007  ! 166: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd68008a0  ! 167: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_78
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_78
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_78:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 168: RDPC	rd	%pc, %r18
	.word 0xa6fd0014  ! 169: SDIVcc_R	sdivcc 	%r20, %r20, %r19
splash_cmpr_2_79:
	setx 0x1e5e8309d6ac8ed7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 170: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93a00165  ! 171: FABSq	dis not found

	.word 0xe097e000  ! 172: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r16
mondo_2_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d918005  ! 173: WRPR_WSTATE_R	wrpr	%r6, %r5, %wstate
	.word 0x87802004  ! 174: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93d02033  ! 175: Tcc_I	tne	icc_or_xcc, %r0 + 51
memptr_2_81:
	set user_data_start, %r31
	.word 0x8580f56a  ! 176: WRCCR_I	wr	%r3, 0x156a, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 177: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe0c80e40  ! 178: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996d2fd6  ! 179: SDIVX_I	sdivx	%r20, 0x0fd6, %r12
	.word 0x93480000  ! 180: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
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
	.word 0xd7e7e012  ! 181: CASA_R	casa	[%r31] %asi, %r18, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_84) + 24, 16, 16)) -> intp(4,0,2)
intvec_2_84:
	.word 0x39400001  ! 182: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd727c000  ! 183: STF_R	st	%f11, [%r0, %r31]
mondo_2_85:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d940014  ! 184: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
splash_lsu_2_86:
	setx 0x1a065f9a391d6721, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe030  ! 186: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
debug_2_87:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 187: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	.word 0xd67ff8cc  ! 188: SWAP_I	swap	%r11, [%r31 + 0xfffff8cc]
	.word 0x87802055  ! 189: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xa7a4c9c1  ! 190: FDIVd	fdivd	%f50, %f32, %f50
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_88) + 8, 16, 16)) -> intp(1,0,14)
intvec_2_88:
	.word 0x39400001  ! 191: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 192: WRASI_I	wr	%r0, 0x0089, %asi
	setx 0xb066f63760fb3dc7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_89:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_2_90:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 194: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
splash_lsu_2_91:
	setx 0x661e95fdcca15b5f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 195: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_2_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 196: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_2_93:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 197: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
debug_2_94:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 198: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
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
	.word 0xa5414000  ! 199: RDPC	rd	%pc, %r18
	.word 0xe07ff8cc  ! 200: SWAP_I	swap	%r16, [%r31 + 0xfffff8cc]
	.word 0x8d90314f  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x114f, %pstate
tagged_2_96:
	tsubcctv %r7, 0x1220, %r11
	.word 0xe007f8cc  ! 202: LDUW_I	lduw	[%r31 + 0xfffff8cc], %r16
mondo_2_97:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d900012  ! 203: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
	.word 0x97a049c8  ! 204: FDIVd	fdivd	%f32, %f8, %f42
	.word 0x8d90353c  ! 205: WRPR_PSTATE_I	wrpr	%r0, 0x153c, %pstate
splash_lsu_2_98:
	setx 0x926bf9fb1fa66e3f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 206: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x94d22002  ! 207: UMULcc_I	umulcc 	%r8, 0x0002, %r10
	.word 0xad81e507  ! 208: WR_SOFTINT_REG_I	wr	%r7, 0x0507, %softint
	.word 0x95a149c4  ! 209: FDIVd	fdivd	%f36, %f4, %f10
	.word 0x97a00165  ! 210: FABSq	dis not found

	.word 0x8780208b  ! 211: WRASI_I	wr	%r0, 0x008b, %asi
debug_2_99:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 212: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_100
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_100:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00b  ! 213: CASA_R	casa	[%r31] %asi, %r11, %r18
splash_tba_2_101:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 214: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_2_102:
	setx 0x4872dc8db6f30050, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x81460000  ! 217: RD_STICK_REG	stbar
	.word 0xe49004a0  ! 218: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01962  ! 219: FqTOd	dis not found

tagged_2_104:
	tsubcctv %r3, 0x1c9b, %r5
	.word 0xe807e50d  ! 220: LDUW_I	lduw	[%r31 + 0x050d], %r20
	.word 0x91943706  ! 221: WRPR_PIL_I	wrpr	%r16, 0x1706, %pil
pmu_2_105:
	nop
	setx 0xfffff39afffff817, %g1, %g7
	.word 0xa3800007  ! 222: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_2_106:
	setx 0x9c64f04a71685ea7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 224: LDX_R	ldx	[%r31 + %r0], %r20
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 225: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe83fe48b  ! 226: STD_I	std	%r20, [%r31 + 0x048b]
	.word 0x8d802000  ! 227: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99702107  ! 228: POPC_I	popc	0x0107, %r12
splash_hpstate_2_107:
	.word 0x81982c44  ! 229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c44, %hpstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e003  ! 230: CASA_R	casa	[%r31] %asi, %r3, %r8
	.word 0xa5480000  ! 231: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
splash_htba_2_109:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 232: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d902953  ! 233: WRPR_PSTATE_I	wrpr	%r0, 0x0953, %pstate
debug_2_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 234: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_2_111:
	taddcctv %r23, 0x1bf5, %r15
	.word 0xd607f25b  ! 235: LDUW_I	lduw	[%r31 + 0xfffff25b], %r11
cwp_2_112:
    set user_data_start, %o7
	.word 0x93902006  ! 236: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_cmpr_2_113:
	setx 0x8fe46221198e62e9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 237: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd677c000  ! 238: STX_R	stx	%r11, [%r31 + %r0]
	.word 0xa9848013  ! 239: WR_SET_SOFTINT_R	wr	%r18, %r19, %set_softint
memptr_2_114:
	set user_data_start, %r31
	.word 0x8581e04b  ! 240: WRCCR_I	wr	%r7, 0x004b, %ccr
debug_2_115:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 241: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 242: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_2_116:
	setx 0x4a7e4f4566bf94eb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 243: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803658  ! 244: SIR	sir	0x1658
	.word 0xab824012  ! 245: WR_CLEAR_SOFTINT_R	wr	%r9, %r18, %clear_softint
tagged_2_117:
	taddcctv %r6, 0x1126, %r21
	.word 0xd607fea4  ! 246: LDUW_I	lduw	[%r31 + 0xfffffea4], %r11
debug_2_118:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 247: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_2_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d908007  ! 248: WRPR_WSTATE_R	wrpr	%r2, %r7, %wstate
	.word 0x95500000  ! 249: RDPR_TPC	<illegal instruction>
tagged_2_120:
	tsubcctv %r8, 0x1c5d, %r2
	.word 0xd807fea4  ! 250: LDUW_I	lduw	[%r31 + 0xfffffea4], %r12
	.word 0xa5a00168  ! 251: FABSq	dis not found

	.word 0xd6c004a0  ! 252: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
splash_lsu_2_121:
	setx 0x263a37fa89b4347d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 253: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_2_122:
	set 0x60740000, %r31
	.word 0x8580a131  ! 254: WRCCR_I	wr	%r2, 0x0131, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 255: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6d7e000  ! 256: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r11
splash_cmpr_2_123:
	setx 0x727f54903e787712, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 257: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 258: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x95500000  ! 259: RDPR_TPC	<illegal instruction>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_124:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 260: CASA_R	casa	[%r31] %asi, %r5, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01971  ! 262: FqTOd	dis not found

	.word 0x8d903391  ! 263: WRPR_PSTATE_I	wrpr	%r0, 0x1391, %pstate
DS_2_126:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbf4ab549	! Random illegal ?
	.word 0x99a00554  ! 1: FSQRTd	fsqrt	
	.word 0x91a2482a  ! 264: FADDs	fadds	%f9, %f10, %f8
	.word 0xd68008a0  ! 265: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
intveclr_2_127:
	setx 0xc93f6cab90b11548, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 266: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9b520000  ! 267: RDPR_PIL	rdpr	%pil, %r13
	.word 0xab818003  ! 268: WR_CLEAR_SOFTINT_R	wr	%r6, %r3, %clear_softint
splash_cmpr_2_128:
	setx 0x3b9b576a2d2f2e19, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 269: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01965  ! 270: FqTOd	dis not found

splash_cmpr_2_130:
	setx 0x7c82ddb32146e370, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 271: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_131
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_131:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 272: RDPC	rd	%pc, %r20
splash_cmpr_2_132:
	setx 0x42c4d3a209bc76a9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 273: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_2_133:
	taddcctv %r6, 0x188a, %r8
	.word 0xda07edb6  ! 274: LDUW_I	lduw	[%r31 + 0x0db6], %r13
mondo_2_134:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d91c013  ! 275: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
	rd %pc, %r19
	add %r19, (ivw_2_135-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_135:
	.word 0x91910000  ! 276: WRPR_PIL_R	wrpr	%r4, %r0, %pil
cwp_2_136:
    set user_data_start, %o7
	.word 0x93902001  ! 277: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
tagged_2_137:
	taddcctv %r12, 0x1952, %r7
	.word 0xda07edb6  ! 278: LDUW_I	lduw	[%r31 + 0x0db6], %r13
cwp_2_138:
    set user_data_start, %o7
	.word 0x93902005  ! 279: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 280: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_2_139:
	setx 0x09a02addc3f78fa0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 281: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1450000  ! 282: RD_SET_SOFTINT	rd	%set_softint, %r16
splash_tba_2_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 283: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_2_141:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 284: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
debug_2_142:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 285: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902009  ! 286: WRPR_GL_I	wrpr	%r0, 0x0009, %-
cwp_2_143:
    set user_data_start, %o7
	.word 0x93902005  ! 287: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x879020c7  ! 288: WRPR_TT_I	wrpr	%r0, 0x00c7, %tt
	.word 0x9970203b  ! 289: POPC_I	popc	0x003b, %r12
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_144:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 290: RDPC	rd	%pc, %r8
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_145
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_145
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_145:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 291: RDPC	rd	%pc, %r10
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 292: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa5a0016b  ! 293: FABSq	dis not found

splash_hpstate_2_146:
	.word 0x8198290e  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090e, %hpstate
mondo_2_147:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d948009  ! 295: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
	.word 0x81460000  ! 296: RD_STICK_REG	stbar
	.word 0x87902349  ! 297: WRPR_TT_I	wrpr	%r0, 0x0349, %tt
tagged_2_148:
	tsubcctv %r3, 0x1dba, %r25
	.word 0xda07e368  ! 298: LDUW_I	lduw	[%r31 + 0x0368], %r13
splash_tba_2_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 299: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xda6fe368  ! 300: LDSTUB_I	ldstub	%r13, [%r31 + 0x0368]
splash_cmpr_2_150:
	setx 0xc2c6e63896aa48d6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 301: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdabfe368  ! 302: STDA_I	stda	%r13, [%r31 + 0x0368] %asi
splash_tba_2_151:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x97a00163  ! 304: FABSq	dis not found

	.word 0xda47e368  ! 305: LDSW_I	ldsw	[%r31 + 0x0368], %r13
	.word 0x8d902c9c  ! 306: WRPR_PSTATE_I	wrpr	%r0, 0x0c9c, %pstate
	rd %pc, %r19
	add %r19, (ivw_2_152-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_152:
	.word 0x9194c011  ! 307: WRPR_PIL_R	wrpr	%r19, %r17, %pil
DS_2_153:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa7a009c0  ! 1: FDIVd	fdivd	%f0, %f0, %f50
	normalw
	.word 0xa9458000  ! 308: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0xd33fe368  ! 309: STDF_I	std	%f9, [0x0368, %r31]
	.word 0x91d02033  ! 310: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa350c000  ! 311: RDPR_TT	<illegal instruction>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00d  ! 312: CASA_R	casa	[%r31] %asi, %r13, %r9
tagged_2_155:
	taddcctv %r23, 0x1cad, %r21
	.word 0xd207e368  ! 313: LDUW_I	lduw	[%r31 + 0x0368], %r9
DS_2_156:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 314: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936a650d  ! 315: SDIVX_I	sdivx	%r9, 0x050d, %r9
	.word 0xe8dfe020  ! 316: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r20
debug_2_158:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 318: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_2_159:
	set 0x003a0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r12
	.word 0x8b98000c  ! 319: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_160
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_160:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 320: RDPC	rd	%pc, %r11
	.word 0xe537c000  ! 321: STQF_R	-	%f18, [%r0, %r31]
	.word 0xa1464000  ! 322: RD_STICK_CMPR_REG	rd	%-, %r16
	.word 0x91d02035  ! 323: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xab834013  ! 324: WR_CLEAR_SOFTINT_R	wr	%r13, %r19, %clear_softint
	.word 0xd28804a0  ! 325: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
splash_cmpr_2_161:
	setx 0x7d27c2d4c44c2b28, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902004  ! 327: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
DS_2_162:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xad730195	! Random illegal ?
	.word 0x99a289c9  ! 1: FDIVd	fdivd	%f10, %f40, %f12
	.word 0x97a30832  ! 328: FADDs	fadds	%f12, %f18, %f11
	.word 0x8d903ac5  ! 329: WRPR_PSTATE_I	wrpr	%r0, 0x1ac5, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 330: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd08fe030  ! 331: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r8
mondo_2_163:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d920013  ! 332: WRPR_WSTATE_R	wrpr	%r8, %r19, %wstate
	.word 0xa28528a5  ! 333: ADDcc_I	addcc 	%r20, 0x08a5, %r17
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 334: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_hpstate_2_164:
	.word 0x81982fdf  ! 335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdf, %hpstate
tagged_2_165:
	taddcctv %r14, 0x15e5, %r14
	.word 0xda07fbd4  ! 336: LDUW_I	lduw	[%r31 + 0xfffffbd4], %r13
	.word 0xa1902003  ! 337: WRPR_GL_I	wrpr	%r0, 0x0003, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_166) + 0, 16, 16)) -> intp(0,0,18)
intvec_2_166:
	.word 0x39400001  ! 338: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_decr_2_167:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r7, [%r1] 0x45
	.word 0xa7820012  ! 339: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r18, %-
splash_hpstate_2_168:
	.word 0x81982d47  ! 340: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d47, %hpstate
DS_2_169:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 341: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d902910  ! 342: WRPR_PSTATE_I	wrpr	%r0, 0x0910, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_170) + 32, 16, 16)) -> intp(1,0,9)
intvec_2_170:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802088  ! 344: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xa190200e  ! 345: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_lsu_2_171:
	setx 0xe84ef2b52cf593b5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 346: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_2_172:
    set user_data_start, %o7
	.word 0x93902004  ! 347: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_cmpr_2_173:
	setx 0xc9ea929fc90675aa, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 348: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdac804a0  ! 349: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0x93520000  ! 350: RDPR_PIL	<illegal instruction>
	.word 0xd4c00e60  ! 351: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r10
donret_2_174:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_174-donret_2_174), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_174:
	.word 0xd4fffbd4  ! 352: SWAPA_I	swapa	%r10, [%r31 + 0xfffffbd4] %asi
intveclr_2_175:
	setx 0x7cdc0e02ac03d8f0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 353: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_2_176:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 354: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
cwp_2_177:
    set user_data_start, %o7
	.word 0x93902006  ! 355: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
change_to_randtl_2_178:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_178:
	.word 0x8f902001  ! 356: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd51fc000  ! 357: LDDF_R	ldd	[%r31, %r0], %f10
	.word 0x87802004  ! 358: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd4c80e60  ! 359: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r10
	.word 0x91d020b4  ! 360: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xad847ca8  ! 361: WR_SOFTINT_REG_I	wr	%r17, 0x1ca8, %softint
splash_htba_2_179:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 362: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4c804a0  ! 363: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 364: LDX_R	ldx	[%r31 + %r0], %r10
memptr_2_180:
	set user_data_start, %r31
	.word 0x85846882  ! 365: WRCCR_I	wr	%r17, 0x0882, %ccr
debug_2_181:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 366: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_2_182:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 367: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_2_183:
	set 0x003a0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r12
	.word 0x8b98000c  ! 368: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4d804a0  ! 369: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
debug_2_184:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 370: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd4c004a0  ! 371: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0xd4d004a0  ! 372: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
splash_lsu_2_185:
	setx 0x05cb77ebaca00c15, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 373: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 374: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 375: LDX_R	ldx	[%r31 + %r0], %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_186) + 8, 16, 16)) -> intp(6,0,26)
intvec_2_186:
	.word 0x39400001  ! 376: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f803786  ! 377: SIR	sir	0x1786
	setx 0xe47bb6f16ba0a042, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_187:
	.word 0x39400001  ! 378: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 379: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_2_188:
	.word 0x819828de  ! 380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08de, %hpstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_189:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e008  ! 381: CASA_R	casa	[%r31] %asi, %r8, %r10
debug_2_190:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 382: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_191
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_191
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_191:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 383: RDPC	rd	%pc, %r16
	.word 0xd6c7e000  ! 384: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r11
cwp_2_192:
    set user_data_start, %o7
	.word 0x93902005  ! 385: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd68008a0  ! 386: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd6ffc028  ! 387: SWAPA_R	swapa	%r11, [%r31 + %r8] 0x01
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_193:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 388: CASA_R	casa	[%r31] %asi, %r8, %r11
debug_2_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01972  ! 390: FqTOd	dis not found

splash_hpstate_2_196:
	.word 0x8198298f  ! 391: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098f, %hpstate
	.word 0x879022c9  ! 392: WRPR_TT_I	wrpr	%r0, 0x02c9, %tt
	setx 0x7550f09a0d2ea2ce, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_197:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d900003  ! 394: WRPR_WSTATE_R	wrpr	%r0, %r3, %wstate
	.word 0xa8d42e54  ! 395: UMULcc_I	umulcc 	%r16, 0x0e54, %r20
	.word 0xda8804a0  ! 396: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x97a449cc  ! 397: FDIVd	fdivd	%f48, %f12, %f42
splash_cmpr_2_199:
	setx 0x31b3d3e7caec0483, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a00552  ! 399: FSQRTd	fsqrt	
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 400: LDX_R	ldx	[%r31 + %r0], %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
change_to_randtl_1_0:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_0:
	.word 0xd8d7e010  ! 1: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r12
splash_cmpr_1_1:
	setx 0x00199ce48dedab5b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 2: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 3: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802080  ! 4: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x879021c3  ! 5: WRPR_TT_I	wrpr	%r0, 0x01c3, %tt
debug_1_3:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 6: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
cwp_1_4:
    set user_data_start, %o7
	.word 0x93902004  ! 7: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d903f5b  ! 8: WRPR_PSTATE_I	wrpr	%r0, 0x1f5b, %pstate
splash_cmpr_1_5:
	setx 0xa9b5dc4c10b02eb7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 9: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_1_6:
    set user_data_start, %o7
	.word 0x93902005  ! 10: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_1_7:
	setx 0x523571f8cad63095, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 11: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_1_8:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 12: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x38800001  ! 13: BGU	bgu,a	<label_0x1>
	.word 0xd86fe5b9  ! 14: LDSTUB_I	ldstub	%r12, [%r31 + 0x05b9]
	.word 0x91d020b4  ! 15: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x8d903f0c  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x1f0c, %pstate
	.word 0x30800001  ! 17: BA	ba,a	<label_0x1>
	.word 0xa1902009  ! 18: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 19: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd897e020  ! 20: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r12
	.word 0x8d903935  ! 21: WRPR_PSTATE_I	wrpr	%r0, 0x1935, %pstate
	.word 0x93520000  ! 22: RDPR_PIL	<illegal instruction>
DS_1_9:
	.word 0x97a149d3  ! 1: FDIVd	fdivd	%f36, %f50, %f42
	.word 0xe7334008  ! 1: STQF_R	-	%f19, [%r8, %r13]
	normalw
	.word 0x95458000  ! 23: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x879023b0  ! 24: WRPR_TT_I	wrpr	%r0, 0x03b0, %tt
donret_1_10:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_10-donret_1_10), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_10:
	.word 0xd4ffe5b9  ! 25: SWAPA_I	swapa	%r10, [%r31 + 0x05b9] %asi
	.word 0x91d02035  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd46fe5b9  ! 27: LDSTUB_I	ldstub	%r10, [%r31 + 0x05b9]
	.word 0x91480000  ! 28: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
splash_htba_1_11:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 29: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d9020f2  ! 30: WRPR_PSTATE_I	wrpr	%r0, 0x00f2, %pstate
splash_cmpr_1_12:
	setx 0xa18e3f82fd607403, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 31: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 32: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36d3672  ! 33: SDIVX_I	sdivx	%r20, 0xfffff672, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 34: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4c7e010  ! 35: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 36: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_1_14:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 37: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4880e60  ! 38: LDUBA_R	lduba	[%r0, %r0] 0x73, %r10
	.word 0x91d020b4  ! 39: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xd45feeec  ! 40: LDX_I	ldx	[%r31 + 0x0eec], %r10
	.word 0x93d020b2  ! 41: Tcc_I	tne	icc_or_xcc, %r0 + 178
DS_1_15:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x97b14303  ! 42: ALIGNADDRESS	alignaddr	%r5, %r3, %r11
debug_1_16:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 43: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_17
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_17:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 44: RDPC	rd	%pc, %r19
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 45: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95500000  ! 46: RDPR_TPC	<illegal instruction>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 47: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9032b8  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x12b8, %pstate
	.word 0xe6d7e030  ! 49: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r19
splash_cmpr_1_18:
	setx 0xd6fe2000e9706764, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_1_19:
    set user_data_start, %o7
	.word 0x93902001  ! 51: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_20) + 24, 16, 16)) -> intp(3,0,23)
intvec_1_20:
	.word 0x39400001  ! 52: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe637eeec  ! 53: STH_I	sth	%r19, [%r31 + 0x0eec]
memptr_1_21:
	set user_data_start, %r31
	.word 0x8584359a  ! 54: WRCCR_I	wr	%r16, 0x159a, %ccr
splash_hpstate_1_22:
	.word 0x819821c6  ! 55: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c6, %hpstate
	.word 0xa2db0013  ! 56: SMULcc_R	smulcc 	%r12, %r19, %r17
	.word 0x95a4c9ca  ! 57: FDIVd	fdivd	%f50, %f10, %f10
memptr_1_23:
	set 0x60540000, %r31
	.word 0x8581225b  ! 58: WRCCR_I	wr	%r4, 0x025b, %ccr
	.word 0xd4d00e80  ! 59: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r10
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 60: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_1_24:
	.word 0x819821e4  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01e4, %hpstate
change_to_randtl_1_25:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_25:
	.word 0x8f902002  ! 62: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8780208b  ! 63: WRASI_I	wr	%r0, 0x008b, %asi
tagged_1_26:
	tsubcctv %r18, 0x1325, %r17
	.word 0xd407ee0f  ! 64: LDUW_I	lduw	[%r31 + 0x0e0f], %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6ab0f2  ! 65: SDIVX_I	sdivx	%r10, 0xfffff0f2, %r13
	.word 0x8780204f  ! 66: WRASI_I	wr	%r0, 0x004f, %asi
memptr_1_28:
	set 0x60540000, %r31
	.word 0x8580e1ec  ! 67: WRCCR_I	wr	%r3, 0x01ec, %ccr
	setx 0x5f42decfd05afe3a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_29:
	.word 0x39400001  ! 68: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_30:
	setx 0x02fb0833a4b08072, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 69: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_31:
	setx 0x17c45a6c86f2d3bc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 70: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_32) + 24, 16, 16)) -> intp(2,0,20)
intvec_1_32:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda6ffb07  ! 72: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffffb07]
	.word 0xdadfe030  ! 73: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
	.word 0xda27fb07  ! 74: STW_I	stw	%r13, [%r31 + 0xfffffb07]
donret_1_33:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_33-donret_1_33-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_33:
	.word 0xdafffb07  ! 75: SWAPA_I	swapa	%r13, [%r31 + 0xfffffb07] %asi
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_34
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_34
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_34:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 76: RDPC	rd	%pc, %r13
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 77: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91540000  ! 78: RDPR_GL	rdpr	%-, %r8
	setx 0x20006a1eec80315e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_35:
	.word 0x39400001  ! 79: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4dfe030  ! 80: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
DS_1_36:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 81: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 82: LDX_R	ldx	[%r31 + %r0], %r10
splash_lsu_1_37:
	setx 0xfdde4fbd6ae0679b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 83: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9b500000  ! 84: RDPR_TPC	<illegal instruction>
	.word 0xa3450000  ! 85: RD_SET_SOFTINT	rd	%set_softint, %r17
debug_1_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 86: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 87: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x92fca133  ! 88: SDIVcc_I	sdivcc 	%r18, 0x0133, %r9
	.word 0xab85373e  ! 89: WR_CLEAR_SOFTINT_I	wr	%r20, 0x173e, %clear_softint
	.word 0xd0880e40  ! 90: LDUBA_R	lduba	[%r0, %r0] 0x72, %r8
debug_1_39:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 91: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_40:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00b  ! 92: CASA_R	casa	[%r31] %asi, %r11, %r8
cwp_1_41:
    set user_data_start, %o7
	.word 0x93902006  ! 93: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd13fc000  ! 94: STDF_R	std	%f8, [%r0, %r31]
	.word 0x8790234c  ! 95: WRPR_TT_I	wrpr	%r0, 0x034c, %tt
DS_1_42:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 96: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_1_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_43:
	.word 0x8f902000  ! 97: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9f802ef0  ! 98: SIR	sir	0x0ef0
debug_1_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 99: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_1_45:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 100: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0x20800001  ! 101: BN	bn,a	<label_0x1>
change_to_randtl_1_46:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_46:
	.word 0x8f902002  ! 102: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa750c000  ! 103: RDPR_TT	<illegal instruction>
	.word 0x36800001  ! 104: BGE	bge,a	<label_0x1>
	.word 0x87902142  ! 105: WRPR_TT_I	wrpr	%r0, 0x0142, %tt
	.word 0x8d90365f  ! 106: WRPR_PSTATE_I	wrpr	%r0, 0x165f, %pstate
splash_hpstate_1_47:
	.word 0x8198261f  ! 107: WRHPR_HPSTATE_I	wrhpr	%r0, 0x061f, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 108: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd0d00e60  ! 109: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r8
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
	.word 0x93414000  ! 110: RDPC	rd	%pc, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01963  ! 111: FqTOd	dis not found

	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 112: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 113: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28804a0  ! 114: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x8d9022ee  ! 115: WRPR_PSTATE_I	wrpr	%r0, 0x02ee, %pstate
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
	.word 0x99414000  ! 116: RDPC	rd	%pc, %r12
DS_1_51:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd3308003  ! 1: STQF_R	-	%f9, [%r3, %r2]
	normalw
	.word 0x97458000  ! 117: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x3a700001  ! 118: BPCC	<illegal instruction>
splash_hpstate_1_52:
	.word 0x8198201d  ! 119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001d, %hpstate
	.word 0xe6d004a0  ! 120: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36a73c3  ! 121: SDIVX_I	sdivx	%r9, 0xfffff3c3, %r17
	.word 0xa3540000  ! 122: RDPR_GL	<illegal instruction>
DS_1_54:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 123: RESTORE_R	restore	%r31, %r0, %r31
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_55
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_55:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e007  ! 124: CASA_R	casa	[%r31] %asi, %r7, %r20
change_to_randtl_1_56:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_56:
	.word 0x8f902001  ! 125: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe88008a0  ! 126: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x98d4e863  ! 127: UMULcc_I	umulcc 	%r19, 0x0863, %r12
splash_lsu_1_57:
	setx 0x4b74924a285f3e29, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 128: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_1_58:
	tsubcctv %r6, 0x19be, %r21
	.word 0xd207ec1f  ! 129: LDUW_I	lduw	[%r31 + 0x0c1f], %r9
	.word 0xd297e030  ! 130: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r9
	.word 0x919175f0  ! 131: WRPR_PIL_I	wrpr	%r5, 0x15f0, %pil
	setx 0xe84fc2e1dba216b6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_59:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 133: WRASI_I	wr	%r0, 0x0010, %asi
DS_1_60:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 134: SAVE_R	save	%r31, %r0, %r31
	.word 0xd28008a0  ! 135: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
memptr_1_61:
	set 0x60740000, %r31
	.word 0x858075c6  ! 136: WRCCR_I	wr	%r1, 0x15c6, %ccr
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 137: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_62
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_62:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e007  ! 138: CASA_R	casa	[%r31] %asi, %r7, %r9
	.word 0x87802016  ! 139: WRASI_I	wr	%r0, 0x0016, %asi
change_to_randtl_1_63:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_63:
	.word 0x8f902003  ! 140: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 141: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd26feb9a  ! 142: LDSTUB_I	ldstub	%r9, [%r31 + 0x0b9a]
	.word 0x9b53c000  ! 143: RDPR_FQ	<illegal instruction>
	.word 0xd6cfe000  ! 144: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01973  ! 145: FqTOd	dis not found

debug_1_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 146: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_66:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 147: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x9194eca9  ! 148: WRPR_PIL_I	wrpr	%r19, 0x0ca9, %pil
DS_1_67:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd514c011  ! 1: LDQF_R	-	[%r19, %r17], %f10
	.word 0x9ba40834  ! 149: FADDs	fadds	%f16, %f20, %f13
pmu_1_68:
	nop
	setx 0xfffff3cafffff31f, %g1, %g7
	.word 0xa3800007  ! 150: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38800001  ! 151: BGU	bgu,a	<label_0x1>
	.word 0xe33fc000  ! 152: STDF_R	std	%f17, [%r0, %r31]
splash_cmpr_1_69:
	setx 0x50819da9a5dc6841, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 153: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97450000  ! 154: RD_SET_SOFTINT	rd	%set_softint, %r11
donret_1_70:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_70-donret_1_70), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_70:
	.word 0xe4fff6c3  ! 155: SWAPA_I	swapa	%r18, [%r31 + 0xfffff6c3] %asi
pmu_1_71:
	nop
	setx 0xfffff7f8fffffc16, %g1, %g7
	.word 0xa3800007  ! 156: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_1_72:
	setx 0x1e0da71dcfb0294e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 157: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9034e3  ! 158: WRPR_PSTATE_I	wrpr	%r0, 0x14e3, %pstate
	.word 0xe48fe000  ! 159: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
change_to_randtl_1_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_73:
	.word 0x8f902001  ! 160: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x91d02032  ! 161: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_tba_1_74:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 162: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_75
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_75:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 163: RDPC	rd	%pc, %r8
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 164: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_1_76:
	setx 0x9fcac18f5bd88f42, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 165: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
cwp_1_77:
    set user_data_start, %o7
	.word 0x93902007  ! 166: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd68008a0  ! 167: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_78
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_78
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_78:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 168: RDPC	rd	%pc, %r17
	.word 0x9afd000a  ! 169: SDIVcc_R	sdivcc 	%r20, %r10, %r13
splash_cmpr_1_79:
	setx 0xcf48ad06a350efb1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 170: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93a00171  ! 171: FABSq	dis not found

	.word 0xe097e020  ! 172: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r16
mondo_1_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d950008  ! 173: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
	.word 0x8780208a  ! 174: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0x91d020b4  ! 175: Tcc_I	ta	icc_or_xcc, %r0 + 180
memptr_1_81:
	set user_data_start, %r31
	.word 0x8584b17a  ! 176: WRCCR_I	wr	%r18, 0x117a, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 177: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe0c80e60  ! 178: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956abf29  ! 179: SDIVX_I	sdivx	%r10, 0xffffff29, %r10
	.word 0x91480000  ! 180: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
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
	.word 0xd7e7e012  ! 181: CASA_R	casa	[%r31] %asi, %r18, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_84) + 16, 16, 16)) -> intp(0,0,25)
intvec_1_84:
	.word 0x39400001  ! 182: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd727c000  ! 183: STF_R	st	%f11, [%r0, %r31]
mondo_1_85:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d940014  ! 184: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
splash_lsu_1_86:
	setx 0xce88a404c848b467, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe000  ! 186: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
debug_1_87:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 187: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0xd67ff8cc  ! 188: SWAP_I	swap	%r11, [%r31 + 0xfffff8cc]
	.word 0x8780208a  ! 189: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0x9ba409d1  ! 190: FDIVd	fdivd	%f16, %f48, %f44
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_88) + 40, 16, 16)) -> intp(0,0,30)
intvec_1_88:
	.word 0x39400001  ! 191: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 192: WRASI_I	wr	%r0, 0x0014, %asi
	setx 0x9754181701f83bf1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_89:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_1_90:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 194: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
splash_lsu_1_91:
	setx 0x1264675e4896562f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 195: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_1_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 196: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_1_93:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 197: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
debug_1_94:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 198: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
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
	.word 0x9b414000  ! 199: RDPC	rd	%pc, %r13
	.word 0xe07ff8cc  ! 200: SWAP_I	swap	%r16, [%r31 + 0xfffff8cc]
	.word 0x8d903c64  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x1c64, %pstate
tagged_1_96:
	tsubcctv %r9, 0x1dce, %r7
	.word 0xe007f8cc  ! 202: LDUW_I	lduw	[%r31 + 0xfffff8cc], %r16
mondo_1_97:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d940011  ! 203: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0x97a509c5  ! 204: FDIVd	fdivd	%f20, %f36, %f42
	.word 0x8d90276a  ! 205: WRPR_PSTATE_I	wrpr	%r0, 0x076a, %pstate
splash_lsu_1_98:
	setx 0xc3beea590c9b948d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 206: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa2d17796  ! 207: UMULcc_I	umulcc 	%r5, 0xfffff796, %r17
	.word 0xad82e498  ! 208: WR_SOFTINT_REG_I	wr	%r11, 0x0498, %softint
	.word 0xa5a089d1  ! 209: FDIVd	fdivd	%f2, %f48, %f18
	.word 0x95a00172  ! 210: FABSq	dis not found

	.word 0x8780208a  ! 211: WRASI_I	wr	%r0, 0x008a, %asi
debug_1_99:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 212: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_100
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_100:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00b  ! 213: CASA_R	casa	[%r31] %asi, %r11, %r18
splash_tba_1_101:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 214: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_1_102:
	setx 0x58d26ea95bb732d9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x81460000  ! 217: RD_STICK_REG	stbar
	.word 0xe49004a0  ! 218: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01963  ! 219: FqTOd	dis not found

tagged_1_104:
	tsubcctv %r10, 0x152e, %r17
	.word 0xe807e50d  ! 220: LDUW_I	lduw	[%r31 + 0x050d], %r20
	.word 0x9194eb9b  ! 221: WRPR_PIL_I	wrpr	%r19, 0x0b9b, %pil
pmu_1_105:
	nop
	setx 0xfffff8e1fffff5d1, %g1, %g7
	.word 0xa3800007  ! 222: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_1_106:
	setx 0x2cea4ee6de1641cb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 224: LDX_R	ldx	[%r31 + %r0], %r20
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 225: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe83fe48b  ! 226: STD_I	std	%r20, [%r31 + 0x048b]
	.word 0x8d802000  ! 227: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1703146  ! 228: POPC_I	popc	0x1146, %r16
splash_hpstate_1_107:
	.word 0x81982bcf  ! 229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcf, %hpstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e003  ! 230: CASA_R	casa	[%r31] %asi, %r3, %r8
	.word 0x9b480000  ! 231: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
splash_htba_1_109:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 232: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d902d30  ! 233: WRPR_PSTATE_I	wrpr	%r0, 0x0d30, %pstate
debug_1_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 234: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_1_111:
	taddcctv %r7, 0x1212, %r4
	.word 0xd607f25b  ! 235: LDUW_I	lduw	[%r31 + 0xfffff25b], %r11
cwp_1_112:
    set user_data_start, %o7
	.word 0x93902003  ! 236: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_cmpr_1_113:
	setx 0xade04a711914599d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 237: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd677c000  ! 238: STX_R	stx	%r11, [%r31 + %r0]
	.word 0xa982000d  ! 239: WR_SET_SOFTINT_R	wr	%r8, %r13, %set_softint
memptr_1_114:
	set user_data_start, %r31
	.word 0x8582763c  ! 240: WRCCR_I	wr	%r9, 0x163c, %ccr
debug_1_115:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 241: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 242: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_1_116:
	setx 0x373ef300f8d2a4cb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 243: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803e35  ! 244: SIR	sir	0x1e35
	.word 0xab824005  ! 245: WR_CLEAR_SOFTINT_R	wr	%r9, %r5, %clear_softint
tagged_1_117:
	taddcctv %r8, 0x1771, %r25
	.word 0xd607fea4  ! 246: LDUW_I	lduw	[%r31 + 0xfffffea4], %r11
debug_1_118:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 247: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_1_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d92c013  ! 248: WRPR_WSTATE_R	wrpr	%r11, %r19, %wstate
	.word 0x93500000  ! 249: RDPR_TPC	<illegal instruction>
tagged_1_120:
	tsubcctv %r13, 0x1ad3, %r2
	.word 0xd807fea4  ! 250: LDUW_I	lduw	[%r31 + 0xfffffea4], %r12
	.word 0x95a0016c  ! 251: FABSq	dis not found

	.word 0xd6c004a0  ! 252: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
splash_lsu_1_121:
	setx 0x9c64a218e471fdc3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 253: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_1_122:
	set 0x60340000, %r31
	.word 0x85832920  ! 254: WRCCR_I	wr	%r12, 0x0920, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 255: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6d7e000  ! 256: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r11
splash_cmpr_1_123:
	setx 0x925fab36f60948f0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 257: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95500000  ! 259: RDPR_TPC	<illegal instruction>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_124:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 260: CASA_R	casa	[%r31] %asi, %r5, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a0196c  ! 262: FqTOd	dis not found

	.word 0x8d902785  ! 263: WRPR_PSTATE_I	wrpr	%r0, 0x0785, %pstate
DS_1_126:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xfb6e0e95	! Random illegal ?
	.word 0x9ba00541  ! 1: FSQRTd	fsqrt	
	.word 0x95a0882b  ! 264: FADDs	fadds	%f2, %f11, %f10
	.word 0xd68008a0  ! 265: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
intveclr_1_127:
	setx 0xb5004955b1909d6b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 266: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97520000  ! 267: RDPR_PIL	rdpr	%pil, %r11
	.word 0xab844012  ! 268: WR_CLEAR_SOFTINT_R	wr	%r17, %r18, %clear_softint
splash_cmpr_1_128:
	setx 0x0aa9e0d9b1c7af69, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 269: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01974  ! 270: FqTOd	dis not found

splash_cmpr_1_130:
	setx 0xf2eb8f4c47f98614, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 271: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_131
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_131:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 272: RDPC	rd	%pc, %r12
splash_cmpr_1_132:
	setx 0x5aeb35d1c1884131, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 273: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_1_133:
	taddcctv %r17, 0x1f04, %r1
	.word 0xda07edb6  ! 274: LDUW_I	lduw	[%r31 + 0x0db6], %r13
mondo_1_134:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d94c005  ! 275: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
	rd %pc, %r19
	add %r19, (ivw_1_135-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_135:
	.word 0x91934013  ! 276: WRPR_PIL_R	wrpr	%r13, %r19, %pil
cwp_1_136:
    set user_data_start, %o7
	.word 0x93902007  ! 277: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
tagged_1_137:
	taddcctv %r19, 0x15d0, %r22
	.word 0xda07edb6  ! 278: LDUW_I	lduw	[%r31 + 0x0db6], %r13
cwp_1_138:
    set user_data_start, %o7
	.word 0x93902004  ! 279: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 280: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_1_139:
	setx 0x7d02ce8f05019908, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 281: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93450000  ! 282: RD_SET_SOFTINT	rd	%set_softint, %r9
splash_tba_1_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 283: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_1_141:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 284: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
debug_1_142:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 285: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200f  ! 286: WRPR_GL_I	wrpr	%r0, 0x000f, %-
cwp_1_143:
    set user_data_start, %o7
	.word 0x93902006  ! 287: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x879021f8  ! 288: WRPR_TT_I	wrpr	%r0, 0x01f8, %tt
	.word 0x97702eef  ! 289: POPC_I	popc	0x0eef, %r11
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
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_144:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 290: RDPC	rd	%pc, %r20
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_145
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_145
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_145:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 291: RDPC	rd	%pc, %r11
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 292: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x95a0016c  ! 293: FABSq	dis not found

splash_hpstate_1_146:
	.word 0x819821cd  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01cd, %hpstate
mondo_1_147:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d90800d  ! 295: WRPR_WSTATE_R	wrpr	%r2, %r13, %wstate
	.word 0x81460000  ! 296: RD_STICK_REG	stbar
	.word 0x879021e6  ! 297: WRPR_TT_I	wrpr	%r0, 0x01e6, %tt
tagged_1_148:
	tsubcctv %r2, 0x1522, %r19
	.word 0xda07e368  ! 298: LDUW_I	lduw	[%r31 + 0x0368], %r13
splash_tba_1_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 299: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xda6fe368  ! 300: LDSTUB_I	ldstub	%r13, [%r31 + 0x0368]
splash_cmpr_1_150:
	setx 0x9d6145d148de65d5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 301: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdabfe368  ! 302: STDA_I	stda	%r13, [%r31 + 0x0368] %asi
splash_tba_1_151:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9ba00166  ! 304: FABSq	dis not found

	.word 0xda47e368  ! 305: LDSW_I	ldsw	[%r31 + 0x0368], %r13
	.word 0x8d9025b0  ! 306: WRPR_PSTATE_I	wrpr	%r0, 0x05b0, %pstate
	rd %pc, %r19
	add %r19, (ivw_1_152-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_152:
	.word 0x91924013  ! 307: WRPR_PIL_R	wrpr	%r9, %r19, %pil
DS_1_153:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x99a189cd  ! 1: FDIVd	fdivd	%f6, %f44, %f12
	normalw
	.word 0xa9458000  ! 308: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0xd33fe368  ! 309: STDF_I	std	%f9, [0x0368, %r31]
	.word 0x91d02032  ! 310: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x9950c000  ! 311: RDPR_TT	<illegal instruction>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00d  ! 312: CASA_R	casa	[%r31] %asi, %r13, %r9
tagged_1_155:
	taddcctv %r7, 0x19c6, %r19
	.word 0xd207e368  ! 313: LDUW_I	lduw	[%r31 + 0x0368], %r9
DS_1_156:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 314: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa768a439  ! 315: SDIVX_I	sdivx	%r2, 0x0439, %r19
	.word 0xe8dfe030  ! 316: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r20
debug_1_158:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 318: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_1_159:
	set 0x003b0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r12
	.word 0x8b98000c  ! 319: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_160
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_160:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 320: RDPC	rd	%pc, %r10
	.word 0xe537c000  ! 321: STQF_R	-	%f18, [%r0, %r31]
	.word 0xa7464000  ! 322: RD_STICK_CMPR_REG	rd	%-, %r19
	.word 0x91d020b2  ! 323: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xab850003  ! 324: WR_CLEAR_SOFTINT_R	wr	%r20, %r3, %clear_softint
	.word 0xd28804a0  ! 325: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
splash_cmpr_1_161:
	setx 0x87ab028c05cebf70, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902003  ! 327: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
DS_1_162:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x9f5f7019	! Random illegal ?
	.word 0xa7a509c4  ! 1: FDIVd	fdivd	%f20, %f4, %f50
	.word 0x97a14823  ! 328: FADDs	fadds	%f5, %f3, %f11
	.word 0x8d90280e  ! 329: WRPR_PSTATE_I	wrpr	%r0, 0x080e, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 330: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd08fe000  ! 331: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r8
mondo_1_163:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d918008  ! 332: WRPR_WSTATE_R	wrpr	%r6, %r8, %wstate
	.word 0xa8817146  ! 333: ADDcc_I	addcc 	%r5, 0xfffff146, %r20
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 334: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_1_164:
	.word 0x81982adc  ! 335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adc, %hpstate
tagged_1_165:
	taddcctv %r21, 0x15f1, %r3
	.word 0xda07fbd4  ! 336: LDUW_I	lduw	[%r31 + 0xfffffbd4], %r13
	.word 0xa190200d  ! 337: WRPR_GL_I	wrpr	%r0, 0x000d, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_166) + 24, 16, 16)) -> intp(6,0,22)
intvec_1_166:
	.word 0x39400001  ! 338: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_decr_1_167:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r9, [%r1] 0x45
	.word 0xa7828000  ! 339: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r0, %-
splash_hpstate_1_168:
	.word 0x81982735  ! 340: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0735, %hpstate
DS_1_169:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 341: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d9021f5  ! 342: WRPR_PSTATE_I	wrpr	%r0, 0x01f5, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_170) + 16, 16, 16)) -> intp(6,0,7)
intvec_1_170:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 344: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xa1902004  ! 345: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_lsu_1_171:
	setx 0xfc22cc5bfe5412d1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 346: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_1_172:
    set user_data_start, %o7
	.word 0x93902003  ! 347: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_cmpr_1_173:
	setx 0xc62f730c47c6e99e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 348: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdac80e40  ! 349: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r13
	.word 0xa1520000  ! 350: RDPR_PIL	<illegal instruction>
	.word 0xd4c00e80  ! 351: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r10
donret_1_174:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_174-donret_1_174), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_174:
	.word 0xd4fffbd4  ! 352: SWAPA_I	swapa	%r10, [%r31 + 0xfffffbd4] %asi
intveclr_1_175:
	setx 0x74fa7ab8d7f98f7e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 353: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_1_176:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 354: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
cwp_1_177:
    set user_data_start, %o7
	.word 0x93902002  ! 355: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
change_to_randtl_1_178:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_178:
	.word 0x8f902001  ! 356: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd51fc000  ! 357: LDDF_R	ldd	[%r31, %r0], %f10
	.word 0x87802016  ! 358: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xd4c804a0  ! 359: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x93d020b5  ! 360: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0xad84e97a  ! 361: WR_SOFTINT_REG_I	wr	%r19, 0x097a, %softint
splash_htba_1_179:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 362: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4c804a0  ! 363: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 364: LDX_R	ldx	[%r31 + %r0], %r10
memptr_1_180:
	set user_data_start, %r31
	.word 0x8582337d  ! 365: WRCCR_I	wr	%r8, 0x137d, %ccr
debug_1_181:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 366: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_1_182:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 367: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_1_183:
	set 0x003b0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r12
	.word 0x8b98000c  ! 368: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4d80e80  ! 369: LDXA_R	ldxa	[%r0, %r0] 0x74, %r10
debug_1_184:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 370: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd4c004a0  ! 371: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0xd4d00e80  ! 372: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r10
splash_lsu_1_185:
	setx 0x4908905b9f1ca72f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 373: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200d  ! 374: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 375: LDX_R	ldx	[%r31 + %r0], %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_186) + 40, 16, 16)) -> intp(6,0,26)
intvec_1_186:
	.word 0x39400001  ! 376: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f803b14  ! 377: SIR	sir	0x1b14
	setx 0x83650d3cefcf9d44, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_187:
	.word 0x39400001  ! 378: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 379: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_1_188:
	.word 0x81982e8e  ! 380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8e, %hpstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_189:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e008  ! 381: CASA_R	casa	[%r31] %asi, %r8, %r10
debug_1_190:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 382: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_191
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_191
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_191:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 383: RDPC	rd	%pc, %r17
	.word 0xd6c7e010  ! 384: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r11
cwp_1_192:
    set user_data_start, %o7
	.word 0x93902004  ! 385: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd6800c20  ! 386: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r11
	.word 0xd6ffc028  ! 387: SWAPA_R	swapa	%r11, [%r31 + %r8] 0x01
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_193:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 388: CASA_R	casa	[%r31] %asi, %r8, %r11
debug_1_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01964  ! 390: FqTOd	dis not found

splash_hpstate_1_196:
	.word 0x8198208c  ! 391: WRHPR_HPSTATE_I	wrhpr	%r0, 0x008c, %hpstate
	.word 0x87902207  ! 392: WRPR_TT_I	wrpr	%r0, 0x0207, %tt
	setx 0x9cd25203ace36c18, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_197:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d940013  ! 394: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
	.word 0xa6d1a9d8  ! 395: UMULcc_I	umulcc 	%r6, 0x09d8, %r19
	.word 0xda8804a0  ! 396: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x95a009c0  ! 397: FDIVd	fdivd	%f0, %f0, %f10
splash_cmpr_1_199:
	setx 0x00c3f2c9a52af37d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1a00551  ! 399: FSQRTd	fsqrt	
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 400: LDX_R	ldx	[%r31 + %r0], %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
change_to_randtl_0_0:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_0:
	.word 0xd8d7e000  ! 1: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
splash_cmpr_0_1:
	setx 0x13417b999f73f07e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 2: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 3: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802014  ! 4: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87902175  ! 5: WRPR_TT_I	wrpr	%r0, 0x0175, %tt
debug_0_3:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_3:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_3
    nop
debug_wait0_3:
    ld [%r23], %r16
    brnz %r16, debug_wait0_3
    nop
    ba,a debug_startwait0_3
continue_debug_0_3:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_3:
    cmp %r13, %r15
    bne,a wait_for_stat_0_3
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_3:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_3
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %19, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00492  ! 6: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
cwp_0_4:
    set user_data_start, %o7
	.word 0x93902007  ! 7: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d9032eb  ! 8: WRPR_PSTATE_I	wrpr	%r0, 0x12eb, %pstate
splash_cmpr_0_5:
	setx 0xd46ee94174a2cdad, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 9: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_0_6:
    set user_data_start, %o7
	.word 0x93902006  ! 10: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_0_7:
	setx 0x4298fde00c027d55, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 11: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_8:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 12: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x38800001  ! 13: BGU	bgu,a	<label_0x1>
	.word 0xd86fe5b9  ! 14: LDSTUB_I	ldstub	%r12, [%r31 + 0x05b9]
	.word 0x91d02034  ! 15: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d9020dd  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x00dd, %pstate
	.word 0x30800001  ! 17: BA	ba,a	<label_0x1>
	.word 0xa1902004  ! 18: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 19: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd897e020  ! 20: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r12
	.word 0x8d903e41  ! 21: WRPR_PSTATE_I	wrpr	%r0, 0x1e41, %pstate
	.word 0xa3520000  ! 22: RDPR_PIL	<illegal instruction>
DS_0_9:
	.word 0x99a049cd  ! 1: FDIVd	fdivd	%f32, %f44, %f12
	.word 0xd1300008  ! 1: STQF_R	-	%f8, [%r8, %r0]
	normalw
	.word 0x95458000  ! 23: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x8790236f  ! 24: WRPR_TT_I	wrpr	%r0, 0x036f, %tt
donret_0_10:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_10-donret_0_10), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_10:
	.word 0xd4ffe5b9  ! 25: SWAPA_I	swapa	%r10, [%r31 + 0x05b9] %asi
	.word 0x91d02032  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd46fe5b9  ! 27: LDSTUB_I	ldstub	%r10, [%r31 + 0x05b9]
	.word 0xa9480000  ! 28: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
splash_htba_0_11:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 29: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d902507  ! 30: WRPR_PSTATE_I	wrpr	%r0, 0x0507, %pstate
splash_cmpr_0_12:
	setx 0xd756522984b32daa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 31: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 32: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9568eeec  ! 33: SDIVX_I	sdivx	%r3, 0x0eec, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 34: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4c7e020  ! 35: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r10
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 36: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_14:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 37: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4880e80  ! 38: LDUBA_R	lduba	[%r0, %r0] 0x74, %r10
	.word 0x91d02034  ! 39: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd45feeec  ! 40: LDX_I	ldx	[%r31 + 0x0eec], %r10
	.word 0x91d020b4  ! 41: Tcc_I	ta	icc_or_xcc, %r0 + 180
DS_0_15:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x93b1030b  ! 42: ALIGNADDRESS	alignaddr	%r4, %r11, %r9
debug_0_16:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 43: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_17
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_17
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_17:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 44: RDPC	rd	%pc, %r20
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 45: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7500000  ! 46: RDPR_TPC	<illegal instruction>
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 47: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9035cc  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x15cc, %pstate
	.word 0xe6d7e020  ! 49: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r19
splash_cmpr_0_18:
	setx 0x040c6e979cc937d2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_0_19:
    set user_data_start, %o7
	.word 0x93902001  ! 51: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_20) + 32, 16, 16)) -> intp(0,0,7)
intvec_0_20:
	.word 0x39400001  ! 52: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe637eeec  ! 53: STH_I	sth	%r19, [%r31 + 0x0eec]
memptr_0_21:
	set user_data_start, %r31
	.word 0x8580b065  ! 54: WRCCR_I	wr	%r2, 0x1065, %ccr
splash_hpstate_0_22:
	.word 0x81982bcc  ! 55: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcc, %hpstate
	.word 0x92dcc010  ! 56: SMULcc_R	smulcc 	%r19, %r16, %r9
	.word 0x95a309cb  ! 57: FDIVd	fdivd	%f12, %f42, %f10
memptr_0_23:
	set 0x60740000, %r31
	.word 0x8584ee0f  ! 58: WRCCR_I	wr	%r19, 0x0e0f, %ccr
	.word 0xd4d00e60  ! 59: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r10
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 60: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_0_24:
	.word 0x8198258c  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058c, %hpstate
change_to_randtl_0_25:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_25:
	.word 0x8f902000  ! 62: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x87802014  ! 63: WRASI_I	wr	%r0, 0x0014, %asi
tagged_0_26:
	tsubcctv %r16, 0x1305, %r3
	.word 0xd407ee0f  ! 64: LDUW_I	lduw	[%r31 + 0x0e0f], %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b69f7ee  ! 65: SDIVX_I	sdivx	%r7, 0xfffff7ee, %r13
	.word 0x87802020  ! 66: WRASI_I	wr	%r0, 0x0020, %asi
memptr_0_28:
	set 0x60340000, %r31
	.word 0x85847b07  ! 67: WRCCR_I	wr	%r17, 0x1b07, %ccr
	setx 0x191c6d2cdcd1aa4f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_29:
	.word 0x39400001  ! 68: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_30:
	setx 0x90c9d7a850530e46, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 69: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_31:
	setx 0x8542e16b63b484a3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 70: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_32) + 0, 16, 16)) -> intp(4,0,7)
intvec_0_32:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda6ffb07  ! 72: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffffb07]
	.word 0xdadfe020  ! 73: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r13
	.word 0xda27fb07  ! 74: STW_I	stw	%r13, [%r31 + 0xfffffb07]
donret_0_33:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_33-donret_0_33-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_33:
	.word 0xdafffb07  ! 75: SWAPA_I	swapa	%r13, [%r31 + 0xfffffb07] %asi
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_34
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_34
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_34:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 76: RDPC	rd	%pc, %r20
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 77: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95540000  ! 78: RDPR_GL	rdpr	%-, %r10
	setx 0x562c6f0f33782ebd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_35:
	.word 0x39400001  ! 79: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4dfe010  ! 80: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r10
DS_0_36:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 81: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 82: LDX_R	ldx	[%r31 + %r0], %r10
splash_lsu_0_37:
	setx 0x4fb245e2a608bbff, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 83: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x97500000  ! 84: RDPR_TPC	<illegal instruction>
	.word 0xa3450000  ! 85: RD_SET_SOFTINT	rd	%set_softint, %r17
debug_0_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 86: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 87: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x90f9f707  ! 88: SDIVcc_I	sdivcc 	%r7, 0xfffff707, %r8
	.word 0xab8228aa  ! 89: WR_CLEAR_SOFTINT_I	wr	%r8, 0x08aa, %clear_softint
	.word 0xd0880e40  ! 90: LDUBA_R	lduba	[%r0, %r0] 0x72, %r8
debug_0_39:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_39:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_39
    nop
debug_wait0_39:
    ld [%r23], %r16
    brnz %r16, debug_wait0_39
    nop
    ba,a debug_startwait0_39
continue_debug_0_39:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_39:
    cmp %r13, %r15
    bne,a wait_for_stat_0_39
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_39:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_39
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00492  ! 91: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_40:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00b  ! 92: CASA_R	casa	[%r31] %asi, %r11, %r8
cwp_0_41:
    set user_data_start, %o7
	.word 0x93902004  ! 93: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd13fc000  ! 94: STDF_R	std	%f8, [%r0, %r31]
	.word 0x8790237b  ! 95: WRPR_TT_I	wrpr	%r0, 0x037b, %tt
DS_0_42:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 96: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_0_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_43:
	.word 0x8f902002  ! 97: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x9f803b8f  ! 98: SIR	sir	0x1b8f
debug_0_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 99: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
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
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 100: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0x20800001  ! 101: BN	bn,a	<label_0x1>
change_to_randtl_0_46:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_46:
	.word 0x8f902000  ! 102: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9150c000  ! 103: RDPR_TT	<illegal instruction>
	.word 0x36800001  ! 104: BGE	bge,a	<label_0x1>
	.word 0x87902083  ! 105: WRPR_TT_I	wrpr	%r0, 0x0083, %tt
	.word 0x8d9038d3  ! 106: WRPR_PSTATE_I	wrpr	%r0, 0x18d3, %pstate
splash_hpstate_0_47:
	.word 0x81982816  ! 107: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0816, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 108: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd0d004a0  ! 109: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
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
	.word 0xa1414000  ! 110: RDPC	rd	%pc, %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01963  ! 111: FqTOd	dis not found

	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 112: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 113: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28804a0  ! 114: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x8d9037ae  ! 115: WRPR_PSTATE_I	wrpr	%r0, 0x17ae, %pstate
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
	.word 0xa3414000  ! 116: RDPC	rd	%pc, %r17
DS_0_51:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd7330007  ! 1: STQF_R	-	%f11, [%r7, %r12]
	normalw
	.word 0xa7458000  ! 117: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0x3a700001  ! 118: BPCC	<illegal instruction>
splash_hpstate_0_52:
	.word 0x81982bd4  ! 119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd4, %hpstate
	.word 0xe6d004a0  ! 120: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976c71f6  ! 121: SDIVX_I	sdivx	%r17, 0xfffff1f6, %r11
	.word 0xa9540000  ! 122: RDPR_GL	<illegal instruction>
DS_0_54:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 123: RESTORE_R	restore	%r31, %r0, %r31
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_55
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_55:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e007  ! 124: CASA_R	casa	[%r31] %asi, %r7, %r20
change_to_randtl_0_56:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_56:
	.word 0x8f902002  ! 125: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe88008a0  ! 126: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x92d1ec1f  ! 127: UMULcc_I	umulcc 	%r7, 0x0c1f, %r9
splash_lsu_0_57:
	setx 0xec4bc9d69d244861, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 128: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_58:
	tsubcctv %r7, 0x165d, %r26
	.word 0xd207ec1f  ! 129: LDUW_I	lduw	[%r31 + 0x0c1f], %r9
	.word 0xd297e000  ! 130: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r9
	.word 0x91903e02  ! 131: WRPR_PIL_I	wrpr	%r0, 0x1e02, %pil
	setx 0x91393566dfc35ba8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_59:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 133: WRASI_I	wr	%r0, 0x0004, %asi
DS_0_60:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 134: SAVE_R	save	%r31, %r0, %r31
	.word 0xd28008a0  ! 135: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
memptr_0_61:
	set 0x60740000, %r31
	.word 0x8581ab9a  ! 136: WRCCR_I	wr	%r6, 0x0b9a, %ccr
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 137: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_62
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_62:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e007  ! 138: CASA_R	casa	[%r31] %asi, %r7, %r9
	.word 0x87802083  ! 139: WRASI_I	wr	%r0, 0x0083, %asi
change_to_randtl_0_63:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_63:
	.word 0x8f902003  ! 140: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 141: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd26feb9a  ! 142: LDSTUB_I	ldstub	%r9, [%r31 + 0x0b9a]
	.word 0x9753c000  ! 143: RDPR_FQ	<illegal instruction>
	.word 0xd6cfe030  ! 144: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01973  ! 145: FqTOd	dis not found

debug_0_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 146: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_66
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_66:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 147: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x9191b6c3  ! 148: WRPR_PIL_I	wrpr	%r6, 0x16c3, %pil
DS_0_67:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd315000b  ! 1: LDQF_R	-	[%r20, %r11], %f9
	.word 0xa3a0c832  ! 149: FADDs	fadds	%f3, %f18, %f17
pmu_0_68:
	nop
	setx 0xfffff1e0fffff330, %g1, %g7
	.word 0xa3800007  ! 150: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38800001  ! 151: BGU	bgu,a	<label_0x1>
	.word 0xe33fc000  ! 152: STDF_R	std	%f17, [%r0, %r31]
splash_cmpr_0_69:
	setx 0xf7716040974bccfc, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 153: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5450000  ! 154: RD_SET_SOFTINT	rd	%set_softint, %r18
donret_0_70:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_70-donret_0_70), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_70:
	.word 0xe4fff6c3  ! 155: SWAPA_I	swapa	%r18, [%r31 + 0xfffff6c3] %asi
pmu_0_71:
	nop
	setx 0xfffff06efffff49f, %g1, %g7
	.word 0xa3800007  ! 156: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_0_72:
	setx 0x009c08d8b718f052, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 157: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903f2e  ! 158: WRPR_PSTATE_I	wrpr	%r0, 0x1f2e, %pstate
	.word 0xe48fe000  ! 159: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
change_to_randtl_0_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_73:
	.word 0x8f902000  ! 160: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x91d02032  ! 161: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_tba_0_74:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 162: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_75
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_75:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 163: RDPC	rd	%pc, %r11
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 164: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_76:
	setx 0xadbfafc7fe8c039e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 165: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
cwp_0_77:
    set user_data_start, %o7
	.word 0x93902003  ! 166: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd6800c60  ! 167: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r11
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_78
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_78
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_78:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 168: RDPC	rd	%pc, %r17
	.word 0x90fa4005  ! 169: SDIVcc_R	sdivcc 	%r9, %r5, %r8
splash_cmpr_0_79:
	setx 0x21d5ed8fee9784fd, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 170: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1a0016d  ! 171: FABSq	dis not found

	.word 0xe097e000  ! 172: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r16
mondo_0_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d944012  ! 173: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	.word 0x87802058  ! 174: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x91d02032  ! 175: Tcc_I	ta	icc_or_xcc, %r0 + 50
memptr_0_81:
	set user_data_start, %r31
	.word 0x85813df2  ! 176: WRCCR_I	wr	%r4, 0x1df2, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 177: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe0c804a0  ! 178: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r16
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9168f8cc  ! 179: SDIVX_I	sdivx	%r3, 0xfffff8cc, %r8
	.word 0x97480000  ! 180: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
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
	.word 0xd7e7e012  ! 181: CASA_R	casa	[%r31] %asi, %r18, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_84) + 48, 16, 16)) -> intp(5,0,13)
intvec_0_84:
	.word 0x39400001  ! 182: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd727c000  ! 183: STF_R	st	%f11, [%r0, %r31]
mondo_0_85:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d904011  ! 184: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
splash_lsu_0_86:
	setx 0xc2d444a542ffa7fb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe000  ! 186: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
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
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00492  ! 187: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0xd67ff8cc  ! 188: SWAP_I	swap	%r11, [%r31 + 0xfffff8cc]
	.word 0x87802080  ! 189: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93a0c9c6  ! 190: FDIVd	fdivd	%f34, %f6, %f40
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_88) + 40, 16, 16)) -> intp(0,0,23)
intvec_0_88:
	.word 0x39400001  ! 191: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 192: WRASI_I	wr	%r0, 0x0004, %asi
	setx 0xabbf9c5adc4a82b3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_89:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_90:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_90:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_90
    nop
debug_wait0_90:
    ld [%r23], %r16
    brnz %r16, debug_wait0_90
    nop
    ba,a debug_startwait0_90
continue_debug_0_90:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_90:
    cmp %r13, %r15
    bne,a wait_for_stat_0_90
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_90:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_90
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %18, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00492  ! 194: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
splash_lsu_0_91:
	setx 0x0c177a0d35126f9b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 195: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 196: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
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
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00492  ! 197: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
debug_0_94:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 198: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_95
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_95:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 199: RDPC	rd	%pc, %r16
	.word 0xe07ff8cc  ! 200: SWAP_I	swap	%r16, [%r31 + 0xfffff8cc]
	.word 0x8d903e59  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x1e59, %pstate
tagged_0_96:
	tsubcctv %r20, 0x1231, %r1
	.word 0xe007f8cc  ! 202: LDUW_I	lduw	[%r31 + 0xfffff8cc], %r16
mondo_0_97:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d904001  ! 203: WRPR_WSTATE_R	wrpr	%r1, %r1, %wstate
	.word 0x9ba189d4  ! 204: FDIVd	fdivd	%f6, %f20, %f44
	.word 0x8d9038e2  ! 205: WRPR_PSTATE_I	wrpr	%r0, 0x18e2, %pstate
splash_lsu_0_98:
	setx 0x795978b25b3c1aad, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 206: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa8d03a93  ! 207: UMULcc_I	umulcc 	%r0, 0xfffffa93, %r20
	.word 0xad82250d  ! 208: WR_SOFTINT_REG_I	wr	%r8, 0x050d, %softint
	.word 0x9ba009d3  ! 209: FDIVd	fdivd	%f0, %f50, %f44
	.word 0xa5a0016b  ! 210: FABSq	dis not found

	.word 0x87802020  ! 211: WRASI_I	wr	%r0, 0x0020, %asi
debug_0_99:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_99:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_99
    nop
debug_wait0_99:
    ld [%r23], %r16
    brnz %r16, debug_wait0_99
    nop
    ba,a debug_startwait0_99
continue_debug_0_99:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_99:
    cmp %r13, %r15
    bne,a wait_for_stat_0_99
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_99:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_99
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00492  ! 212: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_100
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_100:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00b  ! 213: CASA_R	casa	[%r31] %asi, %r11, %r18
splash_tba_0_101:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 214: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_0_102:
	setx 0x43d2d64ebce51ab3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x81460000  ! 217: RD_STICK_REG	stbar
	.word 0xe49004a0  ! 218: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01963  ! 219: FqTOd	dis not found

tagged_0_104:
	tsubcctv %r1, 0x12aa, %r7
	.word 0xe807e50d  ! 220: LDUW_I	lduw	[%r31 + 0x050d], %r20
	.word 0x9195248b  ! 221: WRPR_PIL_I	wrpr	%r20, 0x048b, %pil
pmu_0_105:
	nop
	setx 0xffffff50fffffbfa, %g1, %g7
	.word 0xa3800007  ! 222: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_0_106:
	setx 0xf0e31ebaf227f0cb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 223: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 224: LDX_R	ldx	[%r31 + %r0], %r20
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 225: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe83fe48b  ! 226: STD_I	std	%r20, [%r31 + 0x048b]
	.word 0x8d802004  ! 227: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9170325b  ! 228: POPC_I	popc	0x125b, %r8
splash_hpstate_0_107:
	.word 0x81982a05  ! 229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a05, %hpstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e003  ! 230: CASA_R	casa	[%r31] %asi, %r3, %r8
	.word 0x97480000  ! 231: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
splash_htba_0_109:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 232: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d902638  ! 233: WRPR_PSTATE_I	wrpr	%r0, 0x0638, %pstate
debug_0_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 234: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_0_111:
	taddcctv %r15, 0x18b7, %r14
	.word 0xd607f25b  ! 235: LDUW_I	lduw	[%r31 + 0xfffff25b], %r11
cwp_0_112:
    set user_data_start, %o7
	.word 0x93902005  ! 236: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_cmpr_0_113:
	setx 0xab630e3479fe3b3e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 237: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd677c000  ! 238: STX_R	stx	%r11, [%r31 + %r0]
	.word 0xa984c010  ! 239: WR_SET_SOFTINT_R	wr	%r19, %r16, %set_softint
memptr_0_114:
	set user_data_start, %r31
	.word 0x858030a4  ! 240: WRCCR_I	wr	%r0, 0x10a4, %ccr
debug_0_115:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 241: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 242: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_116:
	setx 0xe56f4a05e9f71c35, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 243: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803ea4  ! 244: SIR	sir	0x1ea4
	.word 0xab850011  ! 245: WR_CLEAR_SOFTINT_R	wr	%r20, %r17, %clear_softint
tagged_0_117:
	taddcctv %r17, 0x18d3, %r18
	.word 0xd607fea4  ! 246: LDUW_I	lduw	[%r31 + 0xfffffea4], %r11
debug_0_118:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 247: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d90c009  ! 248: WRPR_WSTATE_R	wrpr	%r3, %r9, %wstate
	.word 0x99500000  ! 249: RDPR_TPC	<illegal instruction>
tagged_0_120:
	tsubcctv %r12, 0x1586, %r26
	.word 0xd807fea4  ! 250: LDUW_I	lduw	[%r31 + 0xfffffea4], %r12
	.word 0x97a00165  ! 251: FABSq	dis not found

	.word 0xd6c004a0  ! 252: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
splash_lsu_0_121:
	setx 0x5ffd3054b70cd16d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 253: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_0_122:
	set 0x60140000, %r31
	.word 0x85842db6  ! 254: WRCCR_I	wr	%r16, 0x0db6, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 255: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6d7e010  ! 256: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r11
splash_cmpr_0_123:
	setx 0xc1b82a89f28a8b73, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 257: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa3500000  ! 259: RDPR_TPC	<illegal instruction>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_124:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e005  ! 260: CASA_R	casa	[%r31] %asi, %r5, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196b  ! 262: FqTOd	dis not found

	.word 0x8d9031df  ! 263: WRPR_PSTATE_I	wrpr	%r0, 0x11df, %pstate
DS_0_126:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xf55ca959	! Random illegal ?
	.word 0x99a0054d  ! 1: FSQRTd	fsqrt	
	.word 0x97a4082a  ! 264: FADDs	fadds	%f16, %f10, %f11
	.word 0xd68008a0  ! 265: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
intveclr_0_127:
	setx 0xf4c742ae7488623d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 266: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95520000  ! 267: RDPR_PIL	rdpr	%pil, %r10
	.word 0xab80800a  ! 268: WR_CLEAR_SOFTINT_R	wr	%r2, %r10, %clear_softint
splash_cmpr_0_128:
	setx 0xd0d6a3d728daab0b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 269: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196b  ! 270: FqTOd	dis not found

splash_cmpr_0_130:
	setx 0xc166844d6816e59f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 271: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_131
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_131:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 272: RDPC	rd	%pc, %r13
splash_cmpr_0_132:
	setx 0x0d6e771bc0003650, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 273: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_133:
	taddcctv %r6, 0x1297, %r24
	.word 0xda07edb6  ! 274: LDUW_I	lduw	[%r31 + 0x0db6], %r13
mondo_0_134:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d918010  ! 275: WRPR_WSTATE_R	wrpr	%r6, %r16, %wstate
cmp_0_135:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_135:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_135
    nop
cmp_wait0_135:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_135
    nop
    ba,a cmp_startwait0_135
continue_cmp_0_135:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xa4, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91930009  ! 276: WRPR_PIL_R	wrpr	%r12, %r9, %pil
cwp_0_136:
    set user_data_start, %o7
	.word 0x93902006  ! 277: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
tagged_0_137:
	taddcctv %r14, 0x1639, %r9
	.word 0xda07edb6  ! 278: LDUW_I	lduw	[%r31 + 0x0db6], %r13
cwp_0_138:
    set user_data_start, %o7
	.word 0x93902000  ! 279: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 280: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_0_139:
	setx 0x9a221a84b00a20f6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 281: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93450000  ! 282: RD_SET_SOFTINT	rd	%set_softint, %r9
splash_tba_0_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 283: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_0_141:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_141:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_141
    nop
debug_wait0_141:
    ld [%r23], %r16
    brnz %r16, debug_wait0_141
    nop
    ba,a debug_startwait0_141
continue_debug_0_141:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_141:
    cmp %r13, %r15
    bne,a wait_for_stat_0_141
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_141:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_141
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd8f00492  ! 284: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
debug_0_142:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 285: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902001  ! 286: WRPR_GL_I	wrpr	%r0, 0x0001, %-
cwp_0_143:
    set user_data_start, %o7
	.word 0x93902001  ! 287: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x879023c3  ! 288: WRPR_TT_I	wrpr	%r0, 0x03c3, %tt
	.word 0x9b702368  ! 289: POPC_I	popc	0x0368, %r13
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_144
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_144:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 290: RDPC	rd	%pc, %r10
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_145
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_145
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_145:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 291: RDPC	rd	%pc, %r9
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 292: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9ba00171  ! 293: FABSq	dis not found

splash_hpstate_0_146:
	.word 0x81982e0f  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0f, %hpstate
mondo_0_147:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d92c008  ! 295: WRPR_WSTATE_R	wrpr	%r11, %r8, %wstate
	.word 0x81460000  ! 296: RD_STICK_REG	stbar
	.word 0x87902167  ! 297: WRPR_TT_I	wrpr	%r0, 0x0167, %tt
tagged_0_148:
	tsubcctv %r1, 0x198f, %r18
	.word 0xda07e368  ! 298: LDUW_I	lduw	[%r31 + 0x0368], %r13
splash_tba_0_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 299: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xda6fe368  ! 300: LDSTUB_I	ldstub	%r13, [%r31 + 0x0368]
splash_cmpr_0_150:
	setx 0x9cdc2202703ffb7c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 301: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdabfe368  ! 302: STDA_I	stda	%r13, [%r31 + 0x0368] %asi
splash_tba_0_151:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9ba00162  ! 304: FABSq	dis not found

	.word 0xda47e368  ! 305: LDSW_I	ldsw	[%r31 + 0x0368], %r13
	.word 0x8d903549  ! 306: WRPR_PSTATE_I	wrpr	%r0, 0x1549, %pstate
cmp_0_152:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_152:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_152
    nop
cmp_wait0_152:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_152
    nop
    ba,a cmp_startwait0_152
continue_cmp_0_152:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 38, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91948013  ! 307: WRPR_PIL_R	wrpr	%r18, %r19, %pil
DS_0_153:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x9ba2c9cd  ! 1: FDIVd	fdivd	%f42, %f44, %f44
	normalw
	.word 0x93458000  ! 308: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xd33fe368  ! 309: STDF_I	std	%f9, [0x0368, %r31]
	.word 0x91d02034  ! 310: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9350c000  ! 311: RDPR_TT	<illegal instruction>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00d  ! 312: CASA_R	casa	[%r31] %asi, %r13, %r9
tagged_0_155:
	taddcctv %r10, 0x1e72, %r12
	.word 0xd207e368  ! 313: LDUW_I	lduw	[%r31 + 0x0368], %r9
DS_0_156:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 314: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9696820  ! 315: SDIVX_I	sdivx	%r5, 0x0820, %r20
	.word 0xe8dfe020  ! 316: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 317: LDX_R	ldx	[%r31 + %r0], %r20
debug_0_158:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 318: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_0_159:
	set 0x00380000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r12
	.word 0x8b98000c  ! 319: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_160
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_160:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 320: RDPC	rd	%pc, %r18
	.word 0xe537c000  ! 321: STQF_R	-	%f18, [%r0, %r31]
	.word 0x93464000  ! 322: RD_STICK_CMPR_REG	rd	%-, %r9
	.word 0x91d02034  ! 323: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xab810002  ! 324: WR_CLEAR_SOFTINT_R	wr	%r4, %r2, %clear_softint
	.word 0xd28804a0  ! 325: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
splash_cmpr_0_161:
	setx 0x97172b857396890b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 326: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902000  ! 327: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
DS_0_162:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xb370aaea	! Random illegal ?
	.word 0x97a049cc  ! 1: FDIVd	fdivd	%f32, %f12, %f42
	.word 0x91a20822  ! 328: FADDs	fadds	%f8, %f2, %f8
	.word 0x8d903cca  ! 329: WRPR_PSTATE_I	wrpr	%r0, 0x1cca, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 330: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd08fe030  ! 331: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r8
mondo_0_163:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d92c003  ! 332: WRPR_WSTATE_R	wrpr	%r11, %r3, %wstate
	.word 0x9a843bd4  ! 333: ADDcc_I	addcc 	%r16, 0xfffffbd4, %r13
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 334: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_hpstate_0_164:
	.word 0x8198209e  ! 335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009e, %hpstate
tagged_0_165:
	taddcctv %r5, 0x115a, %r8
	.word 0xda07fbd4  ! 336: LDUW_I	lduw	[%r31 + 0xfffffbd4], %r13
	.word 0xa190200b  ! 337: WRPR_GL_I	wrpr	%r0, 0x000b, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_166) + 48, 16, 16)) -> intp(3,0,6)
intvec_0_166:
	.word 0x39400001  ! 338: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_decr_0_167:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa7834008  ! 339: WR_GRAPHICS_STATUS_REG_R	wr	%r13, %r8, %-
splash_hpstate_0_168:
	.word 0x819827cf  ! 340: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07cf, %hpstate
DS_0_169:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 341: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d9028e4  ! 342: WRPR_PSTATE_I	wrpr	%r0, 0x08e4, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_170) + 16, 16, 16)) -> intp(5,0,16)
intvec_0_170:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 344: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xa190200a  ! 345: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_lsu_0_171:
	setx 0xb04040653c28c74b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 346: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_0_172:
    set user_data_start, %o7
	.word 0x93902000  ! 347: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_cmpr_0_173:
	setx 0x5bcc9ac7b4e2656a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 348: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdac80e60  ! 349: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r13
	.word 0x95520000  ! 350: RDPR_PIL	<illegal instruction>
	.word 0xd4c00e60  ! 351: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r10
donret_0_174:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_174-donret_0_174), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_174:
	.word 0xd4fffbd4  ! 352: SWAPA_I	swapa	%r10, [%r31 + 0xfffffbd4] %asi
intveclr_0_175:
	setx 0xf9e489789c6e0202, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 353: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_176:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 354: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
cwp_0_177:
    set user_data_start, %o7
	.word 0x93902004  ! 355: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
change_to_randtl_0_178:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_178:
	.word 0x8f902001  ! 356: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd51fc000  ! 357: LDDF_R	ldd	[%r31, %r0], %f10
	.word 0x87802089  ! 358: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd4c804a0  ! 359: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x91d02032  ! 360: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xad82797b  ! 361: WR_SOFTINT_REG_I	wr	%r9, 0x197b, %softint
splash_htba_0_179:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 362: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4c80e40  ! 363: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 364: LDX_R	ldx	[%r31 + %r0], %r10
memptr_0_180:
	set user_data_start, %r31
	.word 0x85827d38  ! 365: WRCCR_I	wr	%r9, 0x1d38, %ccr
debug_0_181:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 366: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_0_182:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 367: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_0_183:
	set 0x00380000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r12
	.word 0x8b98000c  ! 368: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4d804a0  ! 369: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
debug_0_184:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 370: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd4c004a0  ! 371: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0xd4d004a0  ! 372: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
splash_lsu_0_185:
	setx 0x64a4485b7a4bf2e7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 373: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 374: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 375: LDX_R	ldx	[%r31 + %r0], %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_186) + 56, 16, 16)) -> intp(1,0,28)
intvec_0_186:
	.word 0x39400001  ! 376: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f802daf  ! 377: SIR	sir	0x0daf
	setx 0xa9c00d7bd4de0ed2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_187:
	.word 0x39400001  ! 378: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 379: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_hpstate_0_188:
	.word 0x81982815  ! 380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0815, %hpstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_189:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e008  ! 381: CASA_R	casa	[%r31] %asi, %r8, %r10
debug_0_190:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 382: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_191
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_191
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_191:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 383: RDPC	rd	%pc, %r11
	.word 0xd6c7e010  ! 384: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r11
cwp_0_192:
    set user_data_start, %o7
	.word 0x93902004  ! 385: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd68008a0  ! 386: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd6ffc028  ! 387: SWAPA_R	swapa	%r11, [%r31 + %r8] 0x01
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_193:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 388: CASA_R	casa	[%r31] %asi, %r8, %r11
debug_0_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01971  ! 390: FqTOd	dis not found

splash_hpstate_0_196:
	.word 0x81982cd6  ! 391: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd6, %hpstate
	.word 0x87902064  ! 392: WRPR_TT_I	wrpr	%r0, 0x0064, %tt
	setx 0x8d331b3617c52c15, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_197:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d928012  ! 394: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
	.word 0x9ad37eeb  ! 395: UMULcc_I	umulcc 	%r13, 0xfffffeeb, %r13
	.word 0xda8804a0  ! 396: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x95a449c9  ! 397: FDIVd	fdivd	%f48, %f40, %f10
splash_cmpr_0_199:
	setx 0x90a99d5508284be1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91a00548  ! 399: FSQRTd	fsqrt	
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 400: LDX_R	ldx	[%r31 + %r0], %r8
cmpenall_0_200:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmpenall_startwait0_200:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_0_200
    nop
cmpenall_wait0_200:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait0_200
    nop
    ba,a cmpenall_startwait0_200
continue_cmpenall_0_200:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_0_200:
    cmp %r13, %r15
    bne,a wait_for_cmpstat_0_200
    ldxa [0x58]%asi, %r15       !Running_status
    mov 0xff, %r14              !All threads running
    stxa %r14, [0x50]%asi 
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_cmpstat2_0_200:
    cmp %r14, %r15
    bne,a wait_for_cmpstat2_0_200
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

	.xword	0xb565281d73334983
	.xword	0xc7739d2118da3711
	.xword	0xc665f682716cf56e
	.xword	0xc107ef22fccd1506
	.xword	0xee28d6c8d6ee23cc
	.xword	0x0bec5563e3804b90
	.xword	0x8a29d08e6b0150e6
	.xword	0x226882f809ccdbc6
	.xword	0x1133848878258831
	.xword	0xe19d91ca56837f47
	.xword	0x57db63cc2dcfafb0
	.xword	0xa0bb52a26bb86f47
	.xword	0x95bb2e3574a112d7
	.xword	0x27346bec0f0201ff
	.xword	0xce0976dd47528fa2
	.xword	0x8db4d50213facfbe
	.xword	0x24c7d58d9d6eec64
	.xword	0xfa6d17b204ad7b4f
	.xword	0x3a2e6b1b0815dee8
	.xword	0x1463cf30187fa2a1
	.xword	0x10d58331b7013a8d
	.xword	0x8bf1feb2d2ce0cf0
	.xword	0x5fbe6bfca9de14ec
	.xword	0x5e59fc2bff19f780
	.xword	0x9375a713c73d06e9
	.xword	0xca2b8c5e3379500a
	.xword	0x62447a4a6b2b1c3e
	.xword	0x1ecec646241821ab
	.xword	0xb9cc3e5a268ddc38
	.xword	0x7de96a8132c46c77
	.xword	0xfe71e2db1176e5cd
	.xword	0xb039fffcc44a6806
	.xword	0x8679fa86dc32767d
	.xword	0x0d48c115a04f3ad2
	.xword	0x795089a53f696f5c
	.xword	0xcc356de67ee75063
	.xword	0x4bb9b4741df4037a
	.xword	0xe4d3e52e207e7ed6
	.xword	0x6168115d69a87b36
	.xword	0xa6bef6d4dff51936
	.xword	0x1f47b4f9c50394b7
	.xword	0x22909716659baddc
	.xword	0xe6f03785b4d3c4c8
	.xword	0x03db64140e789321
	.xword	0x419bd40784a46240
	.xword	0xe69a54a614c578b4
	.xword	0xb9cc6deaccc83b4a
	.xword	0x3127629e0d6dd8b7
	.xword	0xa764ad81b84e08a5
	.xword	0x7bc790b8d68d43c3
	.xword	0x587dbb8f1d5329e0
	.xword	0x30cdee49046c2fb6
	.xword	0xb847088e5f76ea27
	.xword	0xea948ba5ff482717
	.xword	0xdda49e8592895e97
	.xword	0xbbe23cb5605fb69f
	.xword	0x64e26e164bca31d4
	.xword	0xa4ca5949a120d0ce
	.xword	0x7a7065ee0d11c824
	.xword	0x833d07619a042e29
	.xword	0x228fe088f45f8a66
	.xword	0x6b9e3464d016dcd5
	.xword	0x5d39a25bb3d4a673
	.xword	0xe4c7348b958174ff
	.xword	0x188ae57a654a733c
	.xword	0xbda1146332eb5643
	.xword	0x23fef90a6b8e2a90
	.xword	0x515bd19c71783525
	.xword	0xa0473cceec7fc4d2
	.xword	0x80de59d94370e119
	.xword	0xe63ae7bb644feb59
	.xword	0x936d0a859b268da5
	.xword	0xbc6b55cc5a75fca2
	.xword	0xf3a5a1f74095263a
	.xword	0xd55c3f4ff2bd3626
	.xword	0xdc55191e21328445
	.xword	0xe4851d0c19fb0945
	.xword	0x21a6121fc8c7154a
	.xword	0x427452e30c286189
	.xword	0x02db7d21b4993f3a
	.xword	0xab8f93c419caad3a
	.xword	0xc591ce01dffcfc28
	.xword	0x406d91983ceeda33
	.xword	0xe939a3c50b949936
	.xword	0xb179c59c93aa1602
	.xword	0x1fd7baf46c833fdc
	.xword	0x00812e95e9c30980
	.xword	0x8d56f3dc379f38b2
	.xword	0xb465aee9887d886b
	.xword	0xcb5e9ded01bda423
	.xword	0x1f1f967097ea1abf
	.xword	0x2db1aa0ce393dee4
	.xword	0xfa74e8bedfcd12cf
	.xword	0x5739d9c6773b176c
	.xword	0x16bae2601e48fdca
	.xword	0x0684cf5314c818a6
	.xword	0xb66b6ccc65b1c458
	.xword	0x11c124a554588c15
	.xword	0x83dc250f3996aa69
	.xword	0x85e64ce91cdceb03
	.xword	0x093c308174e4b3e9
	.xword	0x4cb3174343e910a4
	.xword	0x583c952c43779f33
	.xword	0x6371c50c694a8067
	.xword	0x482441ccaa9016f5
	.xword	0x05dc4e1ddeacdffe
	.xword	0x0f9ccd177f201acd
	.xword	0xd1b9d2e0184c176e
	.xword	0x8550c1f615709ffc
	.xword	0x5b5ae77c2d62359b
	.xword	0x87954aa161a629ca
	.xword	0x1afb62bfc103baec
	.xword	0x5050a188cb3cd674
	.xword	0x90911b3b06ec2017
	.xword	0xfd0f97e7ecb0d04c
	.xword	0x433303ddb069578b
	.xword	0xd7e10629dbe2a71b
	.xword	0x3db72287c3b80d89
	.xword	0x2277c7e3ffafba17
	.xword	0xb812d3c53564be63
	.xword	0xb354642f5f7304be
	.xword	0xf6a4ed19d74e6928
	.xword	0xbfc568a67789a4d4
	.xword	0xb7929905beee1c50
	.xword	0x4d58afd37785e2fe
	.xword	0x954439e63d9e36c8
	.xword	0xaa17e96fe4159c48
	.xword	0x8872cd8a8b52d9d5
	.xword	0xcd40438bbe3fecb3
	.xword	0x29bf94274938d6cd
	.xword	0x885d0d2aa0a26580
	.xword	0x5a778c054f0c9cc0
	.xword	0x1f1c179135c342d8
	.xword	0x0d198058b3909acc
	.xword	0x96328c39aba14530
	.xword	0x060d59a65fd4a6e9
	.xword	0xf9ef7902dd8af660
	.xword	0x766d650b44b63760
	.xword	0x444cb8db967684e5
	.xword	0xa623849592b9a853
	.xword	0xc6f6138f44f6376d
	.xword	0x0a55d926a9148cea
	.xword	0x4c088491b2376bca
	.xword	0xc3d3f8e6123b6eb0
	.xword	0x7088286cc555a28e
	.xword	0x2fc099aa15b81e68
	.xword	0x005052c886e9ed67
	.xword	0xabd710845c1d17b7
	.xword	0x13b2ff8893d273c4
	.xword	0x223726dae4ccaba2
	.xword	0x324b21a8523c2f30
	.xword	0xa350d307354f73a5
	.xword	0x2ece6aa780d9532d
	.xword	0xb5bbee666ec534bf
	.xword	0x632557f47027b63b
	.xword	0x769b1348ab9646fb
	.xword	0x9d942aff5abdac8b
	.xword	0x464ab37dc1522ccd
	.xword	0x3379b1adad846789
	.xword	0x1ca077d4fa831827
	.xword	0xf8bf515ed924593a
	.xword	0x8153ccf95dd4f7fd
	.xword	0xd580d8ee80a6e0ea
	.xword	0x5e421bfa017afec3
	.xword	0xa4b9a5eee555cbfc
	.xword	0x9b239912de91238e
	.xword	0x633b6b34997d49c7
	.xword	0x6f658251ed3c3dc6
	.xword	0x1e30e81f74ae8fc3
	.xword	0x01cc4fa0188d0eba
	.xword	0x1a97d90dfe813382
	.xword	0xe04a52aed3f0dcb4
	.xword	0x1585ce16188037f7
	.xword	0xf2da0473488fa029
	.xword	0x7dc5af93e1b2170c
	.xword	0x0c0dcf55ad5cb65b
	.xword	0xc20888cfe09a868b
	.xword	0x7d47517a6e9df4f3
	.xword	0x7afac504f32b2e95
	.xword	0xf77f8581828baceb
	.xword	0x5b256987360767f6
	.xword	0x14b04d2ca4292f92
	.xword	0xdf9cf5d586dfaa9d
	.xword	0xc33d2d2d480251aa
	.xword	0xba42d25a4a3a88fa
	.xword	0xd2579fbfc82c0670
	.xword	0xf6e960824ad813ca
	.xword	0x19d86b115bd6e294
	.xword	0x9d61ca68e881284e
	.xword	0x9ae40942558b41e8
	.xword	0xec429f6fcdeda1e4
	.xword	0x44205d15c691fe5a
	.xword	0xc7c700017b250780
	.xword	0x538ddb0c512ee6ca
	.xword	0xd5db41eccec539d2
	.xword	0x09411f1f76296dee
	.xword	0x6bde20e5d5a05598
	.xword	0xeef3008a3198bd3e
	.xword	0x9fa677e8e7d55c59
	.xword	0x5d85654c3eaccd22
	.xword	0x8578547e02f2acd8
	.xword	0xa0d155cffcc490e1
	.xword	0x0480c429aa862aae
	.xword	0x03666b8f433fdf92
	.xword	0x04198164f6b6d202
	.xword	0xc9412f0cefa63017
	.xword	0xb1d36ebe138551a7
	.xword	0xfc19466682175325
	.xword	0x598c79ee6022956a
	.xword	0xe47b488437e5aca9
	.xword	0x0be3f57c08335d3e
	.xword	0xdb772a01d812cd3b
	.xword	0x333b98ca047d459f
	.xword	0x46767013fd2c3c0a
	.xword	0x325868c0220b6d78
	.xword	0x034e6ef6cb48f3f6
	.xword	0xc01e7842509714c7
	.xword	0x9c56542e0e2d5a3d
	.xword	0xb770bc62ec45c560
	.xword	0x19dfff93240faeb8
	.xword	0xa55f2d8c105d907e
	.xword	0x5ae7c99235a0d9ba
	.xword	0x3ff1b3786bf1d7c2
	.xword	0x4e3359554d8de236
	.xword	0x53c74e275542e058
	.xword	0x4b06e894e5bb5f73
	.xword	0xab7781efb5eedb1f
	.xword	0xf8346d9b7fb723e6
	.xword	0x8dbeb720722b8417
	.xword	0xbe09ca3eed127af5
	.xword	0x3ccbd7183fa45069
	.xword	0x0854e943e669af71
	.xword	0x8f28545674dae157
	.xword	0xa160bdc15ac09d25
	.xword	0x9f954c6df17984ca
	.xword	0x7223078330b1f76b
	.xword	0xaed98be18d2e4785
	.xword	0xf0bfd26a82473fcc
	.xword	0x3c4577dd0aa6d509
	.xword	0xea478fa6fb920373
	.xword	0x2a242d21a2e53120
	.xword	0x61c8e314ccacecaf
	.xword	0x06b89d043e5f3ffd
	.xword	0x80d9826becff768b
	.xword	0xa0fbf41426a92ef8
	.xword	0xe3dea2e5bad157c9
	.xword	0x6c2d12336a7e1197
	.xword	0x9fa6e91609a57455
	.xword	0x8aeda3771d3d5b7e
	.xword	0xd88119dd7f243c3e
	.xword	0xf34056bc54d7b436
	.xword	0x044f076ccd0b45ac
	.xword	0x8b9da22c49b32a2d
	.xword	0x7f35fa254e0d356f
	.xword	0x76b7543fe972d489
	.xword	0xc4a46f209889280b

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
	TTE_CP	 = 0,
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
	TTE_CP	 = 0,
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
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
	.xword	0x627bc3fdcd184a7f
	.xword	0x6d07ff54f1b64e21
	.xword	0x8aabaa52c75acb67
	.xword	0x81154af45e7d5875
	.xword	0xb8515026fd46cb76
	.xword	0x11890185258b3ada
	.xword	0x098b7d6282d1543d
	.xword	0xf76da53dae4c7f37
	.xword	0x8ce509bc8859ba5d
	.xword	0x42401b0a7082b94f
	.xword	0x578856cab95c955c
	.xword	0x3d4c9672f2bed3bd
	.xword	0x2d7fff9f5efc8ce7
	.xword	0xd30506c884adb84d
	.xword	0x41ced47c4dbec259
	.xword	0x2c2794ab4ebbec23
	.xword	0xbb9174c9c1743610
	.xword	0xcfc6afff468ddd94
	.xword	0x1594dd8f34a4201a
	.xword	0x11a12b7cc62316db
	.xword	0x7827513862ec92b2
	.xword	0xe74cda4436a30efe
	.xword	0x9b7ba000ae6b005a
	.xword	0xfb380f953dd56099
	.xword	0x2c50a7457396ccea
	.xword	0x0b09d362204401da
	.xword	0xf76f5b7b5899ff5c
	.xword	0xf294065e31b42715
	.xword	0xc47c94ed9b6c947a
	.xword	0x5b96006a215a4092
	.xword	0x7975d87108966628
	.xword	0x0ec2afe9304652b4



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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
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
	.xword	0xa9a0eab79cec742d
	.xword	0x13a242ec9d8c5003
	.xword	0x3d0a24060adf37a2
	.xword	0x9f0736c1bc24adac
	.xword	0x433473bd8bccc09c
	.xword	0xdaa0453a7066fef9
	.xword	0x75b02e5cfdbee712
	.xword	0xeeefab6f144c0f50
	.xword	0x9ab97428435d0953
	.xword	0x5fb92e3aa7b1d757
	.xword	0xda5db943d82d37d7
	.xword	0xb0a9199b547de3d2
	.xword	0xf26c5479368c2b5b
	.xword	0xe0a7ec93dfd6fc8b
	.xword	0xcfebc93f2ced46dc
	.xword	0x25c2a152ffb3d0b8
	.xword	0x36956df75e5b3dc9
	.xword	0xbb8d32951a0c1f04
	.xword	0x50a893a2ffca2ceb
	.xword	0x9ed82f3acd4b176d
	.xword	0xa760916469ba9a1a
	.xword	0xc4570747835b1a1e
	.xword	0x71fd6c771a82ea33
	.xword	0x04fdab20eeb44448
	.xword	0x394710b2d5dfc91f
	.xword	0xaba896d97fa519a4
	.xword	0x6d57368a7eaeb6f4
	.xword	0x6bcd929c10d5ec24
	.xword	0x67a45bfb0b27f47c
	.xword	0xc48f23405f5177bb
	.xword	0x5ce4d557b9f2e4c8
	.xword	0x47f048141f1d9c7a



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
	.xword	0xc494ca42537868ed
	.xword	0x31305c561279d18f
	.xword	0x1688a1e8287de24a
	.xword	0x99e7e19b2592ef41
	.xword	0x2161bf39b6e685e2
	.xword	0xa813ff437995b95a
	.xword	0x3b16ce7638ca7dba
	.xword	0x178c8e098884a02d
	.xword	0x5597322476388c65
	.xword	0x867e62caa2d4c600
	.xword	0x16933a54bd8323f3
	.xword	0x891fbfebced2638c
	.xword	0x02ae4780067182e7
	.xword	0x33c774db0b349dcf
	.xword	0xf7148849075fcc62
	.xword	0xeaf75d3afef62038
	.xword	0x835645eaa2cfe33a
	.xword	0x6ea51c03e58f5d86
	.xword	0x60b3ec905944dce6
	.xword	0x08d7d9fb07e56e20
	.xword	0xd8cc24494bb5d0b0
	.xword	0x0aeb2927bcd72b9c
	.xword	0x509a58a5fbae549e
	.xword	0x375c9057232d2106
	.xword	0x979223245676a363
	.xword	0xb10a4b3b79c8fda9
	.xword	0xd3b19d7484d71c9e
	.xword	0x4f78272679e86b2c
	.xword	0xa154c608dd5f5575
	.xword	0xa2dd2ce6d27e7d68
	.xword	0x8815c3a3821693eb
	.xword	0x2e1d0c22d13366c2



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
	.xword	0xefc1077c7b26e1b8
	.xword	0xad6df2712eef96b0
	.xword	0xf42dbff70cdeb27e
	.xword	0x9460d68d898adec4
	.xword	0xec89bb23830a2190
	.xword	0x44392c90e8b9c4b9
	.xword	0x57fd5118b9086149
	.xword	0x8dec0be50f5d0534
	.xword	0xdbccd847455bb55d
	.xword	0x4bd8127b5a0dd174
	.xword	0xe38955dda4811c6a
	.xword	0xb9796c4cbeaa109e
	.xword	0xfce6efe01a58be06
	.xword	0xcc894cec456ba651
	.xword	0x8fcf538998acb20d
	.xword	0xd0d6dd06a0349c58
	.xword	0x1f764034ac25ceac
	.xword	0xad9886c078f37ebe
	.xword	0x6cba7ea3796bfd54
	.xword	0xfe816e8280e29852
	.xword	0x508a0a62fc553bc0
	.xword	0xe8bc3a81fd09ac05
	.xword	0xe9712aa70eaffbe0
	.xword	0xda9c9cfc3a16d193
	.xword	0x19233c6efcace08f
	.xword	0x1adf76f3cb73d9f7
	.xword	0xbdd9fef8e399da2a
	.xword	0x1ab8ae57f3e9d225
	.xword	0x7cb082b3b89c4ec2
	.xword	0xf697765bdcc4fe9d
	.xword	0x458651f2f2b7e3eb
	.xword	0x5da427f01f968dd3



#if 0
#endif

