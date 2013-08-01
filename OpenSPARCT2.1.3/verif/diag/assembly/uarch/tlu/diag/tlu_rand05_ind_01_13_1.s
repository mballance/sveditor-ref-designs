/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_01_13_1.s
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
	mov 0xb1, %r14
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
	mov 0xb5, %r14
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
	mov 0x31, %r14
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
	mov 0x30, %r14
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
	mov 0x34, %r14
	mov 0x35, %r30
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
	.word 0xa1902004  ! 1: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd0c804a0  ! 2: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
	.word 0xa5a4c9cb  ! 3: FDIVd	fdivd	%f50, %f42, %f18
pmu_7_0:
	nop
	setx 0xfffff728fffff953, %g1, %g7
	.word 0xa3800007  ! 4: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_7_1:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 5: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_2
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_2:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 6: RDPC	rd	%pc, %r10
intveclr_7_3:
	setx 0xb591fe7083a4f05f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_7_4:
	tsubcctv %r2, 0x1e69, %r4
	.word 0xe607e390  ! 8: LDUW_I	lduw	[%r31 + 0x0390], %r19
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_5:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e008  ! 9: CASA_R	casa	[%r31] %asi, %r8, %r19
	.word 0xad81ffd4  ! 10: WR_SOFTINT_REG_I	wr	%r7, 0x1fd4, %softint
	.word 0x8d902292  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x0292, %pstate
	.word 0x9150c000  ! 12: RDPR_TT	rdpr	%tt, %r8
memptr_7_6:
	set user_data_start, %r31
	.word 0x8582b455  ! 13: WRCCR_I	wr	%r10, 0x1455, %ccr
	.word 0x8790226b  ! 14: WRPR_TT_I	wrpr	%r0, 0x026b, %tt
	.word 0x99a00164  ! 15: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_7
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_7:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 16: RDPC	rd	%pc, %r9
mondo_7_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d950003  ! 17: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
	.word 0xab8125b0  ! 18: WR_CLEAR_SOFTINT_I	wr	%r4, 0x05b0, %clear_softint
	.word 0x99902003  ! 19: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
cwp_7_9:
    set user_data_start, %o7
	.word 0x93902000  ! 20: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
cwp_7_10:
    set user_data_start, %o7
	.word 0x93902006  ! 21: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_7_11:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 22: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8790202d  ! 23: WRPR_TT_I	wrpr	%r0, 0x002d, %tt
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_12
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_12:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 24: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0xe727e431  ! 25: STF_I	st	%f19, [0x0431, %r31]
	.word 0xe68008a0  ! 26: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
memptr_7_13:
	set 0x60140000, %r31
	.word 0x8581acfa  ! 27: WRCCR_I	wr	%r6, 0x0cfa, %ccr
	.word 0x9aacc00c  ! 28: ANDNcc_R	andncc 	%r19, %r12, %r13
memptr_7_14:
	set 0x60140000, %r31
	.word 0x8584be60  ! 29: WRCCR_I	wr	%r18, 0x1e60, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 30: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4d804a0  ! 31: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	.word 0x879020ea  ! 32: WRPR_TT_I	wrpr	%r0, 0x00ea, %tt
splash_cmpr_7_15:
	setx 0x4430048de7504f34, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6b74b1  ! 34: SDIVX_I	sdivx	%r13, 0xfffff4b1, %r13
	.word 0xda8fe010  ! 35: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01963  ! 36: FqTOd	dis not found

	.word 0xd33fc000  ! 37: STDF_R	std	%f9, [%r0, %r31]
	.word 0xa8c32dd5  ! 38: ADDCcc_I	addccc 	%r12, 0x0dd5, %r20
cwp_7_18:
    set user_data_start, %o7
	.word 0x93902005  ! 39: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_decr_7_19:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa781c00b  ! 40: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r11, %-
	.word 0x879023b4  ! 41: WRPR_TT_I	wrpr	%r0, 0x03b4, %tt
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_20:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e002  ! 42: CASA_R	casa	[%r31] %asi, %r2, %r19
	.word 0xa7a00173  ! 43: FABSq	dis not found

	.word 0xe44ff491  ! 44: LDSB_I	ldsb	[%r31 + 0xfffff491], %r18
debug_7_21:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 45: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
cwp_7_22:
    set user_data_start, %o7
	.word 0x93902000  ! 46: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956c2a31  ! 47: SDIVX_I	sdivx	%r16, 0x0a31, %r10
intveclr_7_24:
	setx 0xf82eb2f090cd4c19, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 48: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_7_25:
	setx 0x05fc892a9bbd80b9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 49: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_26:
	setx 0xf30571568a33194b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2e700001  ! 51: BPVS	<illegal instruction>
	.word 0xa7500000  ! 52: RDPR_TPC	rdpr	%tpc, %r19
splash_cmpr_7_27:
	setx 0xacc2a886188f7270, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 53: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802014  ! 54: WRASI_I	wr	%r0, 0x0014, %asi
splash_cmpr_7_28:
	setx 0x035674bf82982887, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_29:
	setx 0xffa0cabd03ed8a30, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 56: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 57: LDX_R	ldx	[%r31 + %r0], %r20
splash_cmpr_7_30:
	setx 0x97c85148ef6ef93d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe86fef00  ! 59: LDSTUB_I	ldstub	%r20, [%r31 + 0x0f00]
	.word 0x9f802ab5  ! 60: SIR	sir	0x0ab5
memptr_7_31:
	set 0x60540000, %r31
	.word 0x85807c5a  ! 61: WRCCR_I	wr	%r1, 0x1c5a, %ccr
debug_7_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 62: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_7_33:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 63: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_7_34:
	setx 0x37a74428e794e60b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 64: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_7_35:
	.word 0x819828cf  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cf, %hpstate
	.word 0x8d902802  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x0802, %pstate
tagged_7_36:
	tsubcctv %r6, 0x19c6, %r15
	.word 0xe807e96a  ! 67: LDUW_I	lduw	[%r31 + 0x096a], %r20
splash_tba_7_37:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 68: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_38) + 0, 16, 16)) -> intp(2,0,23)
intvec_7_38:
	.word 0x39400001  ! 69: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_39:
	setx 0xba0ce4185afd85f5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_40) + 48, 16, 16)) -> intp(5,0,7)
intvec_7_40:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_7_41:
	taddcctv %r2, 0x137b, %r8
	.word 0xe807e96a  ! 72: LDUW_I	lduw	[%r31 + 0x096a], %r20
	.word 0x97454000  ! 73: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0x9ba149c0  ! 74: FDIVd	fdivd	%f36, %f0, %f44
	.word 0x99a449d3  ! 75: FDIVd	fdivd	%f48, %f50, %f12
mondo_7_42:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d904010  ! 76: WRPR_WSTATE_R	wrpr	%r1, %r16, %wstate
	.word 0xa3450000  ! 77: RD_SET_SOFTINT	rd	%set_softint, %r17
	.word 0xd08008a0  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_43:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 79: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01963  ! 80: FqTOd	dis not found

intveclr_7_45:
	setx 0x42df2dacded8cbf2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 81: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_46:
	setx 0xb0fc0733aa7551a4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 82: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_7_47:
	setx 0xc8a6caee4f6b5c8d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 83: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_7_48:
	set user_data_start, %r31
	.word 0x85842e72  ! 84: WRCCR_I	wr	%r16, 0x0e72, %ccr
	.word 0x87802089  ! 85: WRASI_I	wr	%r0, 0x0089, %asi
	rd %pc, %r19
	add %r19, (ivw_7_49-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_49:
	.word 0x91940014  ! 86: WRPR_PIL_R	wrpr	%r16, %r20, %pil
splash_cmpr_7_50:
	setx 0x897cbedde495d88b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 87: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_7_51:
	setx 0xf9dad31751b4178b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 88: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 89: BPN	<illegal instruction>
memptr_7_52:
	set 0x60540000, %r31
	.word 0x8580a658  ! 90: WRCCR_I	wr	%r2, 0x0658, %ccr
	.word 0xe26ff0a9  ! 91: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff0a9]
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 92: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97450000  ! 93: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0xd0800a60  ! 94: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r8
memptr_7_53:
	set 0x60140000, %r31
	.word 0x8581a15b  ! 95: WRCCR_I	wr	%r6, 0x015b, %ccr
	.word 0xd00ff3d6  ! 96: LDUB_I	ldub	[%r31 + 0xfffff3d6], %r8
	.word 0x8780208a  ! 97: WRASI_I	wr	%r0, 0x008a, %asi
intveclr_7_54:
	setx 0x91a8f5bd8454c49a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 98: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_7_55:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 99: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_7_56:
	setx 0xb1d9c1d0f2f4198b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_7_57:
    set user_data_start, %o7
	.word 0x93902001  ! 101: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 102: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_htba_7_58:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 103: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
donret_7_59:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_59-donret_7_59-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_59:
	.word 0xd0fff3d6  ! 104: SWAPA_I	swapa	%r8, [%r31 + 0xfffff3d6] %asi
debug_7_60:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 105: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0x87802058  ! 106: WRASI_I	wr	%r0, 0x0058, %asi
DS_7_61:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f4, %f28, %f8
	.word 0xa7b4c313  ! 107: ALIGNADDRESS	alignaddr	%r19, %r19, %r19
	.word 0x94a8000b  ! 108: ANDNcc_R	andncc 	%r0, %r11, %r10
splash_hpstate_7_62:
	.word 0x81982a4f  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4f, %hpstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_63:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e002  ! 110: CASA_R	casa	[%r31] %asi, %r2, %r16
memptr_7_64:
	set 0x60340000, %r31
	.word 0x858330a9  ! 111: WRCCR_I	wr	%r12, 0x10a9, %ccr
	.word 0xe0bfc020  ! 112: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	.word 0xe08008a0  ! 113: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
donret_7_65:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_65-donret_7_65-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_65:
	.word 0xe0ffeac5  ! 114: SWAPA_I	swapa	%r16, [%r31 + 0x0ac5] %asi
	.word 0xe06feac5  ! 115: LDSTUB_I	ldstub	%r16, [%r31 + 0x0ac5]
splash_cmpr_7_66:
	setx 0x95d46619f9785bb4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 116: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_7_67:
	set 0x60340000, %r31
	.word 0x8583721a  ! 117: WRCCR_I	wr	%r13, 0x121a, %ccr
splash_lsu_7_68:
	setx 0x5342b841492a1305, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 118: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_7_69:
	nop
	setx 0xfffffe42fffff8d2, %g1, %g7
	.word 0xa3800007  ! 119: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x34700001  ! 120: BPG	<illegal instruction>
	.word 0xe077c000  ! 121: STX_R	stx	%r16, [%r31 + %r0]
mondo_7_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d930009  ! 122: WRPR_WSTATE_R	wrpr	%r12, %r9, %wstate
debug_7_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 123: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 124: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_7_72:
	setx 0x49c7fdef12775281, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 125: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_7_73:
	nop
	setx 0xfffff8c4ffffffd8, %g1, %g7
	.word 0xa3800007  ! 126: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_7_74:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d948000  ! 127: WRPR_WSTATE_R	wrpr	%r18, %r0, %wstate
	.word 0xa1902008  ! 128: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xe06ffdfd  ! 129: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffdfd]
	.word 0xe077fdfd  ! 130: STX_I	stx	%r16, [%r31 + 0xfffffdfd]
	.word 0x87902001  ! 131: WRPR_TT_I	wrpr	%r0, 0x0001, %tt
memptr_7_75:
	set user_data_start, %r31
	.word 0x8580b0f5  ! 132: WRCCR_I	wr	%r2, 0x10f5, %ccr
	.word 0x95500000  ! 133: RDPR_TPC	rdpr	%tpc, %r10
	.word 0x8790225d  ! 134: WRPR_TT_I	wrpr	%r0, 0x025d, %tt
	.word 0xd0d7e010  ! 135: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
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
	.word 0x97414000  ! 136: RDPC	rd	%pc, %r11
	.word 0xd927c000  ! 137: STF_R	st	%f12, [%r0, %r31]
	.word 0xd88008a0  ! 138: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_cmpr_7_77:
	setx 0xc54a89a265b06073, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 139: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790236b  ! 140: WRPR_TT_I	wrpr	%r0, 0x036b, %tt
	.word 0xa1902005  ! 141: WRPR_GL_I	wrpr	%r0, 0x0005, %-
DS_7_78:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd15e973f	! Random illegal ?
	.word 0xa3a149d4  ! 1: FDIVd	fdivd	%f36, %f20, %f48
	.word 0x91a1c820  ! 142: FADDs	fadds	%f7, %f0, %f8
	.word 0xa1902003  ! 143: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x97a0016b  ! 144: FABSq	dis not found

splash_tba_7_79:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 145: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 146: LDX_R	ldx	[%r31 + %r0], %r17
mondo_7_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d930005  ! 147: WRPR_WSTATE_R	wrpr	%r12, %r5, %wstate
	.word 0xe2d004a0  ! 148: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
pmu_7_81:
	nop
	setx 0xffffff6ffffffa04, %g1, %g7
	.word 0xa3800007  ! 149: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b5  ! 150: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xe28008a0  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x83d020b2  ! 152: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0xa1902002  ! 153: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d902521  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x0521, %pstate
	.word 0x9f80278b  ! 155: SIR	sir	0x078b
splash_hpstate_7_82:
	.word 0x819823c4  ! 156: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c4, %hpstate
	.word 0xe2cfe030  ! 157: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r17
tagged_7_83:
	taddcctv %r10, 0x1bbd, %r1
	.word 0xe207e9ea  ! 158: LDUW_I	lduw	[%r31 + 0x09ea], %r17
cwp_7_84:
    set user_data_start, %o7
	.word 0x93902004  ! 159: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91d02034  ! 160: Tcc_I	ta	icc_or_xcc, %r0 + 52
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 161: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_7_85:
	.word 0x8198201c  ! 162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001c, %hpstate
	.word 0xe20fe9ea  ! 163: LDUB_I	ldub	[%r31 + 0x09ea], %r17
	.word 0xe2dfe010  ! 164: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r17
debug_7_86:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 165: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_7_87-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_87:
	.word 0x91928010  ! 166: WRPR_PIL_R	wrpr	%r10, %r16, %pil
	.word 0xa190200c  ! 167: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xe26fe9ea  ! 168: LDSTUB_I	ldstub	%r17, [%r31 + 0x09ea]
splash_hpstate_7_88:
	.word 0x81982e8d  ! 169: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8d, %hpstate
memptr_7_89:
	set 0x60540000, %r31
	.word 0x85802e65  ! 170: WRCCR_I	wr	%r0, 0x0e65, %ccr
	.word 0x81b01021  ! 171: SIAM	siam	1
splash_cmpr_7_90:
	setx 0xab2975bdb8d831d5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_91:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 173: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_7_92:
	setx 0xa989dc8a15ffe8f7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 174: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 175: WRASI_I	wr	%r0, 0x0020, %asi
debug_7_93:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 176: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
splash_cmpr_7_94:
	setx 0xf07600c9341be04a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_7_95:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d948013  ! 178: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
	.word 0xe26fe0a3  ! 179: LDSTUB_I	ldstub	%r17, [%r31 + 0x00a3]
	.word 0x97a00171  ! 180: FABSq	dis not found

splash_tba_7_96:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 181: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1902002  ! 182: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_tba_7_97:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 183: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_7_98:
    set user_data_start, %o7
	.word 0x93902007  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
mondo_7_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d91c005  ! 185: WRPR_WSTATE_R	wrpr	%r7, %r5, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01972  ! 186: FqTOd	dis not found

intveclr_7_101:
	setx 0x7605858dc6a1d048, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 187: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_7_102:
	set 0x00390000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x00390000, %r12
	.word 0x8b98000c  ! 188: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d802000  ! 189: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa190200a  ! 190: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xe127c000  ! 191: STF_R	st	%f16, [%r0, %r31]
	.word 0xe007c000  ! 192: LDUW_R	lduw	[%r31 + %r0], %r16
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_103:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 193: CASA_R	casa	[%r31] %asi, %r7, %r16
splash_cmpr_7_104:
	setx 0xec030b5ffd4017cd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 194: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 195: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x97450000  ! 196: RD_SET_SOFTINT	rd	%set_softint, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 197: LDX_R	ldx	[%r31 + %r0], %r8
DS_7_105:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x95b34302  ! 198: ALIGNADDRESS	alignaddr	%r13, %r2, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 199: LDX_R	ldx	[%r31 + %r0], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 200: LDX_R	ldx	[%r31 + %r0], %r19
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 201: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_7_106:
	setx 0xa816f3c23db810ff, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_107:
	setx 0x8f006236a7889ba7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 203: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9a00172  ! 204: FABSq	dis not found

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
	.word 0xa1414000  ! 205: RDPC	rd	%pc, %r16
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 206: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_109
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_109:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 207: RDPC	rd	%pc, %r8
	.word 0xe257c000  ! 208: LDSH_R	ldsh	[%r31 + %r0], %r17
	rd %pc, %r19
	add %r19, (ivw_7_110-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_110:
	.word 0x9192c014  ! 209: WRPR_PIL_R	wrpr	%r11, %r20, %pil
DS_7_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x91b1c30d  ! 210: ALIGNADDRESS	alignaddr	%r7, %r13, %r8
	.word 0x8d802000  ! 211: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91a00562  ! 212: FSQRTq	fsqrt	
	.word 0xe4dfe030  ! 213: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_112)+40, 16, 16)) -> intp(7,1,3)
xir_7_112:
	.word 0xa980f293  ! 214: WR_SET_SOFTINT_I	wr	%r3, 0x1293, %set_softint
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 215: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_7_113:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 216: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_114:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 217: CASA_R	casa	[%r31] %asi, %r18, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 218: LDX_R	ldx	[%r31 + %r0], %r18
debug_7_115:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 219: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe48008a0  ! 220: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa190200e  ! 221: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x22800001  ! 222: BE	be,a	<label_0x1>
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_116:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 223: CASA_R	casa	[%r31] %asi, %r18, %r18
	.word 0xe537c000  ! 224: STQF_R	-	%f18, [%r0, %r31]
change_to_randtl_7_117:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_117:
	.word 0x8f902003  ! 225: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x3e700001  ! 226: BPVC	<illegal instruction>
	.word 0xad803480  ! 227: WR_SOFTINT_REG_I	wr	%r0, 0x1480, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_118)+0, 16, 16)) -> intp(7,1,3)
xir_7_118:
	.word 0xa9802e34  ! 228: WR_SET_SOFTINT_I	wr	%r0, 0x0e34, %set_softint
	.word 0x87902217  ! 229: WRPR_TT_I	wrpr	%r0, 0x0217, %tt
	.word 0xe45fe228  ! 230: LDX_I	ldx	[%r31 + 0x0228], %r18
	.word 0x879020f6  ! 231: WRPR_TT_I	wrpr	%r0, 0x00f6, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 232: LDX_R	ldx	[%r31 + %r0], %r18
debug_7_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 233: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_7_120:
	set user_data_start, %r31
	.word 0x85807a33  ! 234: WRCCR_I	wr	%r1, 0x1a33, %ccr
debug_7_121:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 235: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x24800001  ! 236: BLE	ble,a	<label_0x1>
	.word 0x22800001  ! 237: BE	be,a	<label_0x1>
DS_7_122:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 238: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_123
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_123
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_123:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 239: RDPC	rd	%pc, %r16
	.word 0xa7500000  ! 240: RDPR_TPC	rdpr	%tpc, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_124) + 40, 16, 16)) -> intp(1,0,24)
intvec_7_124:
	.word 0x39400001  ! 241: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd82fee48  ! 242: STB_I	stb	%r12, [%r31 + 0x0e48]
splash_cmpr_7_125:
	setx 0xdff51e33d0872ce4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76abcb7  ! 244: SDIVX_I	sdivx	%r10, 0xfffffcb7, %r19
tagged_7_127:
	taddcctv %r26, 0x1091, %r26
	.word 0xd007fb03  ! 245: LDUW_I	lduw	[%r31 + 0xfffffb03], %r8
splash_lsu_7_128:
	setx 0xe82d8a87d7657abd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 246: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_7_129:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 247: SAVE_R	save	%r31, %r0, %r31
DS_7_130:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 248: RESTORE_R	restore	%r31, %r0, %r31
tagged_7_131:
	taddcctv %r3, 0x1c84, %r18
	.word 0xd007fb03  ! 249: LDUW_I	lduw	[%r31 + 0xfffffb03], %r8
	.word 0xd06ffb03  ! 250: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffb03]
	.word 0x87902077  ! 251: WRPR_TT_I	wrpr	%r0, 0x0077, %tt
splash_cmpr_7_132:
	setx 0xed39b417fc5efbab, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 252: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_133:
	setx 0xfabd4cd7590c90b1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 254: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x83d02032  ! 255: Tcc_I	te	icc_or_xcc, %r0 + 50
intveclr_7_135:
	setx 0xc624e5760926875b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 256: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x92818010  ! 257: ADDcc_R	addcc 	%r6, %r16, %r9
	.word 0xd2cfe020  ! 258: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r9
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_136
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_136:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 259: RDPC	rd	%pc, %r13
	.word 0xd4d00e80  ! 260: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r10
cwp_7_137:
    set user_data_start, %o7
	.word 0x93902002  ! 261: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xab813d0f  ! 262: WR_CLEAR_SOFTINT_I	wr	%r4, 0x1d0f, %clear_softint
mondo_7_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d94c008  ! 263: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
	.word 0x83d02033  ! 264: Tcc_I	te	icc_or_xcc, %r0 + 51
debug_7_139:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 265: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd43fea6f  ! 266: STD_I	std	%r10, [%r31 + 0x0a6f]
	.word 0xd427ea6f  ! 267: STW_I	stw	%r10, [%r31 + 0x0a6f]
	.word 0x99902003  ! 268: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
DS_7_140:
	.word 0xa1a0c9c5  ! 1: FDIVd	fdivd	%f34, %f36, %f16
	pdist %f8, %f8, %f14
	.word 0x91b48300  ! 269: ALIGNADDRESS	alignaddr	%r18, %r0, %r8
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_141
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_141
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_141:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 270: RDPC	rd	%pc, %r16
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 271: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_7_142:
	setx 0xb5562761c92af013, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 272: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x92d47b4d  ! 273: UMULcc_I	umulcc 	%r17, 0xfffffb4d, %r9
splash_cmpr_7_143:
	setx 0x1e6a496afb5dc63b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 274: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_7_144:
	set user_data_start, %r31
	.word 0x8580e79c  ! 275: WRCCR_I	wr	%r3, 0x079c, %ccr
	.word 0xa9a509cd  ! 276: FDIVd	fdivd	%f20, %f44, %f20
	setx 0xe555845b87aab401, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_145:
	.word 0x39400001  ! 277: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802055  ! 278: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x9f802727  ! 279: SIR	sir	0x0727
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
	.word 0xd1e7e00d  ! 280: CASA_R	casa	[%r31] %asi, %r13, %r8
splash_tba_7_147:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa9a00171  ! 282: FABSq	dis not found

	.word 0xa7b44fe1  ! 283: FONES	e	%f19
	.word 0x99454000  ! 284: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
DS_7_148:
	.word 0x99a509cb  ! 1: FDIVd	fdivd	%f20, %f42, %f12
	.word 0xbfe7c000  ! 285: SAVE_R	save	%r31, %r0, %r31
DS_7_149:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe9300005  ! 1: STQF_R	-	%f20, [%r5, %r0]
	normalw
	.word 0x91458000  ! 286: RD_SOFTINT_REG	rd	%softint, %r8
pmu_7_150:
	nop
	setx 0xfffffdb8fffff1d5, %g1, %g7
	.word 0xa3800007  ! 287: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_7_151:
	setx 0xc2274e4d6373bb2c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 288: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93464000  ! 289: RD_STICK_CMPR_REG	rd	%-, %r9
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 290: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_7_152:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d948012  ! 291: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
	.word 0x9a6c27b0  ! 292: UDIVX_I	udivx 	%r16, 0x07b0, %r13
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_153:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e009  ! 293: CASA_R	casa	[%r31] %asi, %r9, %r8
	.word 0x99902002  ! 294: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xa7520000  ! 295: RDPR_PIL	rdpr	%pil, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01973  ! 296: FqTOd	dis not found

	.word 0x9f802ff5  ! 297: SIR	sir	0x0ff5
	.word 0xe6900e80  ! 298: LDUHA_R	lduha	[%r0, %r0] 0x74, %r19
splash_lsu_7_155:
	setx 0x975777e55ef6ba85, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 299: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa5540000  ! 300: RDPR_GL	rdpr	%-, %r18
	.word 0x91d02035  ! 301: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_7_156:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 302: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0xe69fe723  ! 303: LDDA_I	ldda	[%r31, + 0x0723] %asi, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36b38e1  ! 304: SDIVX_I	sdivx	%r12, 0xfffff8e1, %r17
splash_hpstate_7_158:
	.word 0x81982d57  ! 305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d57, %hpstate
splash_cmpr_7_159:
	setx 0xdeb2250c931aa6e7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_160:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 307: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_7_161:
	setx 0xee601c0223475a60, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 308: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_7_162:
	setx 0x418a8eceaac5c86a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 309: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_163:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 310: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0xe86feafa  ! 311: LDSTUB_I	ldstub	%r20, [%r31 + 0x0afa]
	.word 0xe927c000  ! 312: STF_R	st	%f20, [%r0, %r31]
	.word 0xe88008a0  ! 313: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
debug_7_164:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 314: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_7_165:
	setx 0x75f5e6cf0487e581, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 315: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9824008  ! 316: WR_SET_SOFTINT_R	wr	%r9, %r8, %set_softint
	.word 0x99450000  ! 317: RD_SET_SOFTINT	rd	%set_softint, %r12
change_to_randtl_7_166:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_166:
	.word 0x8f902002  ! 318: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xab81c00b  ! 319: WR_CLEAR_SOFTINT_R	wr	%r7, %r11, %clear_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 320: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd527c000  ! 321: STF_R	st	%f10, [%r0, %r31]
change_to_randtl_7_167:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_167:
	.word 0x8f902000  ! 322: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
donret_7_168:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_168-donret_7_168), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_168:
	.word 0xd4ffeafa  ! 323: SWAPA_I	swapa	%r10, [%r31 + 0x0afa] %asi
	.word 0xa2a94013  ! 324: ANDNcc_R	andncc 	%r5, %r19, %r17
	.word 0x93454000  ! 325: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976ce222  ! 326: SDIVX_I	sdivx	%r19, 0x0222, %r11
tagged_7_170:
	tsubcctv %r11, 0x1e6f, %r19
	.word 0xe607e364  ! 327: LDUW_I	lduw	[%r31 + 0x0364], %r19
splash_hpstate_7_171:
	.word 0x81982ca6  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ca6, %hpstate
	.word 0x8d802000  ! 329: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe71fc000  ! 330: LDDF_R	ldd	[%r31, %r0], %f19
splash_htba_7_172:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 331: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa8c36416  ! 332: ADDCcc_I	addccc 	%r13, 0x0416, %r20
memptr_7_173:
	set 0x60740000, %r31
	.word 0x85826676  ! 333: WRCCR_I	wr	%r9, 0x0676, %ccr
	.word 0xd53feb8f  ! 334: STDF_I	std	%f10, [0x0b8f, %r31]
	.word 0xa190200a  ! 335: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd48fe000  ! 336: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r10
	.word 0x87802083  ! 337: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9369ea9b  ! 338: SDIVX_I	sdivx	%r7, 0x0a9b, %r9
	setx 0x1da75372afb82aee, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_175:
	.word 0x39400001  ! 339: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_7_176:
    set user_data_start, %o7
	.word 0x93902000  ! 340: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd23ff4d5  ! 341: STD_I	std	%r9, [%r31 + 0xfffff4d5]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76ca71a  ! 342: SDIVX_I	sdivx	%r18, 0x071a, %r19
	.word 0xd0d004a0  ! 343: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0xd00fc000  ! 344: LDUB_R	ldub	[%r31 + %r0], %r8
splash_tba_7_178:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 345: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd06ff250  ! 346: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff250]
DS_7_179:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd1348002  ! 1: STQF_R	-	%f8, [%r2, %r18]
	normalw
	.word 0x93458000  ! 347: RD_SOFTINT_REG	rd	%softint, %r9
intveclr_7_180:
	setx 0x5cabb925d81c6abf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 348: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6c00e80  ! 349: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r11
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 350: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_7_181:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 351: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_7_182:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 352: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa9520000  ! 353: RDPR_PIL	rdpr	%pil, %r20
	.word 0x8d802000  ! 354: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_decr_7_183:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r20, [%r1] 0x45
	.word 0xa785000d  ! 355: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r13, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 356: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe6800a80  ! 357: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r19
	.word 0x9b480000  ! 358: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0x8d802004  ! 359: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd247c000  ! 360: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0xa190200b  ! 361: WRPR_GL_I	wrpr	%r0, 0x000b, %-
DS_7_184:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x91a009d1  ! 1: FDIVd	fdivd	%f0, %f48, %f8
	normalw
	.word 0x99458000  ! 362: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01963  ! 363: FqTOd	dis not found

intveclr_7_186:
	setx 0xc8f3c633d7894d59, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_7_187:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 365: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802004  ! 366: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87902253  ! 367: WRPR_TT_I	wrpr	%r0, 0x0253, %tt
splash_hpstate_7_188:
	.word 0x819821ce  ! 368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01ce, %hpstate
	.word 0x24700001  ! 369: BPLE	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_189:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 370: RDPC	rd	%pc, %r19
	.word 0x8d902eb5  ! 371: WRPR_PSTATE_I	wrpr	%r0, 0x0eb5, %pstate
splash_hpstate_7_190:
	.word 0x81982784  ! 372: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0784, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a0196d  ! 373: FqTOd	dis not found

	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 374: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 375: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_7_192:
	tsubcctv %r9, 0x18e2, %r4
	.word 0xe207f250  ! 376: LDUW_I	lduw	[%r31 + 0xfffff250], %r17
	.word 0x9f803e6c  ! 377: SIR	sir	0x1e6c
DS_7_193:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f18, %f4, %f2
	.word 0x97b5030c  ! 378: ALIGNADDRESS	alignaddr	%r20, %r12, %r11
splash_cmpr_7_194:
	setx 0xbd3858e19f9ddaff, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 379: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0x9b414000  ! 380: RDPC	rd	%pc, %r13
	.word 0xe2cfe030  ! 381: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r17
	.word 0xe327edb2  ! 382: STF_I	st	%f17, [0x0db2, %r31]
tagged_7_196:
	tsubcctv %r7, 0x1278, %r13
	.word 0xe207edb2  ! 383: LDUW_I	lduw	[%r31 + 0x0db2], %r17
	setx 0x7915e51f0d6f5605, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_197:
	.word 0x39400001  ! 384: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 385: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8780208b  ! 386: WRASI_I	wr	%r0, 0x008b, %asi
splash_decr_7_198:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r6, [%r1] 0x45
	.word 0xa7814006  ! 387: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r6, %-
	.word 0x93a049cc  ! 388: FDIVd	fdivd	%f32, %f12, %f40
splash_lsu_7_199:
	setx 0x5105db7b690806e7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 389: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_7_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d900014  ! 390: WRPR_WSTATE_R	wrpr	%r0, %r20, %wstate
splash_htba_7_201:
	set 0x00390000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00390000, %r12
	.word 0x8b98000c  ! 391: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe137edb2  ! 392: STQF_I	-	%f16, [0x0db2, %r31]
	.word 0x879021d2  ! 393: WRPR_TT_I	wrpr	%r0, 0x01d2, %tt
tagged_7_202:
	tsubcctv %r15, 0x1140, %r19
	.word 0xe007edb2  ! 394: LDUW_I	lduw	[%r31 + 0x0db2], %r16
	.word 0xe0d7e020  ! 395: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
debug_7_203:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 396: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 397: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_7_204:
	setx 0x714e3f77746e20e6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_205:
	setx 0x257a0ecdf1466760, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 400: BPNE	<illegal instruction>
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	.word 0xa1902003  ! 1: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd0c804a0  ! 2: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
	.word 0xa1a489c0  ! 3: FDIVd	fdivd	%f18, %f0, %f16
pmu_6_0:
	nop
	setx 0xfffff8a1fffffa47, %g1, %g7
	.word 0xa3800007  ! 4: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_6_1:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 5: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_2
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_2:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 6: RDPC	rd	%pc, %r10
intveclr_6_3:
	setx 0xb026f823deaa3de6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_6_4:
	tsubcctv %r18, 0x1fc3, %r4
	.word 0xe607e390  ! 8: LDUW_I	lduw	[%r31 + 0x0390], %r19
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_5:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e008  ! 9: CASA_R	casa	[%r31] %asi, %r8, %r19
	.word 0xad80305f  ! 10: WR_SOFTINT_REG_I	wr	%r0, 0x105f, %softint
	.word 0x8d9023f2  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x03f2, %pstate
	.word 0x9950c000  ! 12: RDPR_TT	rdpr	%tt, %r12
memptr_6_6:
	set user_data_start, %r31
	.word 0x8583651f  ! 13: WRCCR_I	wr	%r13, 0x051f, %ccr
	.word 0x87902161  ! 14: WRPR_TT_I	wrpr	%r0, 0x0161, %tt
	.word 0xa3a00164  ! 15: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_7
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_7:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 16: RDPC	rd	%pc, %r16
mondo_6_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d904004  ! 17: WRPR_WSTATE_R	wrpr	%r1, %r4, %wstate
	.word 0xab853258  ! 18: WR_CLEAR_SOFTINT_I	wr	%r20, 0x1258, %clear_softint
	.word 0x99902003  ! 19: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
cwp_6_9:
    set user_data_start, %o7
	.word 0x93902000  ! 20: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
cwp_6_10:
    set user_data_start, %o7
	.word 0x93902006  ! 21: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_6_11:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 22: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8790210f  ! 23: WRPR_TT_I	wrpr	%r0, 0x010f, %tt
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_12
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_12:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 24: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0xe727e431  ! 25: STF_I	st	%f19, [0x0431, %r31]
	.word 0xe68008a0  ! 26: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
memptr_6_13:
	set 0x60540000, %r31
	.word 0x8581e590  ! 27: WRCCR_I	wr	%r7, 0x0590, %ccr
	.word 0x98aa8007  ! 28: ANDNcc_R	andncc 	%r10, %r7, %r12
memptr_6_14:
	set 0x60740000, %r31
	.word 0x85822d3e  ! 29: WRCCR_I	wr	%r8, 0x0d3e, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 30: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4d804a0  ! 31: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	.word 0x879020ab  ! 32: WRPR_TT_I	wrpr	%r0, 0x00ab, %tt
splash_cmpr_6_15:
	setx 0x8a7a6823cc981969, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36c65fb  ! 34: SDIVX_I	sdivx	%r17, 0x05fb, %r17
	.word 0xda8fe020  ! 35: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01972  ! 36: FqTOd	dis not found

	.word 0xd33fc000  ! 37: STDF_R	std	%f9, [%r0, %r31]
	.word 0x94c3331b  ! 38: ADDCcc_I	addccc 	%r12, 0xfffff31b, %r10
cwp_6_18:
    set user_data_start, %o7
	.word 0x93902000  ! 39: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa7820008  ! 40: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r8, %-
	.word 0x87902265  ! 41: WRPR_TT_I	wrpr	%r0, 0x0265, %tt
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_20:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e002  ! 42: CASA_R	casa	[%r31] %asi, %r2, %r19
	.word 0x99a00171  ! 43: FABSq	dis not found

	.word 0xe44ff491  ! 44: LDSB_I	ldsb	[%r31 + 0xfffff491], %r18
debug_6_21:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 45: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
cwp_6_22:
    set user_data_start, %o7
	.word 0x93902007  ! 46: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1692511  ! 47: SDIVX_I	sdivx	%r4, 0x0511, %r16
intveclr_6_24:
	setx 0x04e9243ec4b3cccd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 48: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_6_25:
	setx 0xa1cef511f005bc0d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 49: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_26:
	setx 0xb7609e3ae358b292, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2e700001  ! 51: BPVS	<illegal instruction>
	.word 0x93500000  ! 52: RDPR_TPC	<illegal instruction>
splash_cmpr_6_27:
	setx 0xe4cd151ab03aad05, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 53: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802004  ! 54: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_6_28:
	setx 0xdc89a39a19b40711, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_29:
	setx 0x43e3cd6b5abf822f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 56: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 57: LDX_R	ldx	[%r31 + %r0], %r20
splash_cmpr_6_30:
	setx 0xa52d42cd0e494b9b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe86fef00  ! 59: LDSTUB_I	ldstub	%r20, [%r31 + 0x0f00]
	.word 0x9f8029fe  ! 60: SIR	sir	0x09fe
memptr_6_31:
	set 0x60740000, %r31
	.word 0x85853645  ! 61: WRCCR_I	wr	%r20, 0x1645, %ccr
debug_6_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 62: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_6_33:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 63: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_6_34:
	setx 0xf2d5a8929a2a0679, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 64: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_6_35:
	.word 0x8198284c  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084c, %hpstate
	.word 0x8d902ff1  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x0ff1, %pstate
tagged_6_36:
	tsubcctv %r10, 0x1d29, %r17
	.word 0xe807e96a  ! 67: LDUW_I	lduw	[%r31 + 0x096a], %r20
splash_tba_6_37:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 68: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_38) + 16, 16, 16)) -> intp(5,0,19)
intvec_6_38:
	.word 0x39400001  ! 69: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_39:
	setx 0x9cabd937fa2adb60, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_40) + 48, 16, 16)) -> intp(7,0,3)
intvec_6_40:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_6_41:
	taddcctv %r8, 0x195b, %r13
	.word 0xe807e96a  ! 72: LDUW_I	lduw	[%r31 + 0x096a], %r20
	.word 0x99454000  ! 73: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0x97a4c9cb  ! 74: FDIVd	fdivd	%f50, %f42, %f42
	.word 0x97a489c8  ! 75: FDIVd	fdivd	%f18, %f8, %f42
mondo_6_42:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d940006  ! 76: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
	.word 0xa7450000  ! 77: RD_SET_SOFTINT	rd	%set_softint, %r19
	.word 0xd08008a0  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_43:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 79: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01961  ! 80: FqTOd	dis not found

intveclr_6_45:
	setx 0xca602458ff09412a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 81: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_46:
	setx 0x0ae3f841f3e0c064, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 82: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_6_47:
	setx 0x9e97291d423d97ee, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 83: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_6_48:
	set user_data_start, %r31
	.word 0x85817449  ! 84: WRCCR_I	wr	%r5, 0x1449, %ccr
	.word 0x87802088  ! 85: WRASI_I	wr	%r0, 0x0088, %asi
	rd %pc, %r19
	add %r19, (ivw_6_49-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_49:
	.word 0x91914003  ! 86: WRPR_PIL_R	wrpr	%r5, %r3, %pil
splash_cmpr_6_50:
	setx 0x56ff548901c955ca, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 87: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_6_51:
	setx 0xc71dceb8b4439425, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 88: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 89: BPN	<illegal instruction>
memptr_6_52:
	set 0x60540000, %r31
	.word 0x85807d44  ! 90: WRCCR_I	wr	%r1, 0x1d44, %ccr
	.word 0xe26ff0a9  ! 91: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff0a9]
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 92: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa9450000  ! 93: RD_SET_SOFTINT	rd	%set_softint, %r20
	.word 0xd0800b60  ! 94: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r8
memptr_6_53:
	set 0x60340000, %r31
	.word 0x8584703d  ! 95: WRCCR_I	wr	%r17, 0x103d, %ccr
	.word 0xd00ff3d6  ! 96: LDUB_I	ldub	[%r31 + 0xfffff3d6], %r8
	.word 0x87802016  ! 97: WRASI_I	wr	%r0, 0x0016, %asi
intveclr_6_54:
	setx 0x501bf403430e3b46, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 98: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_6_55:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 99: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_6_56:
	setx 0x1502655e76ab3439, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_6_57:
    set user_data_start, %o7
	.word 0x93902000  ! 101: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 102: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_htba_6_58:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 103: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
donret_6_59:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_59-donret_6_59-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_59:
	.word 0xd0fff3d6  ! 104: SWAPA_I	swapa	%r8, [%r31 + 0xfffff3d6] %asi
debug_6_60:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 105: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0x87802010  ! 106: WRASI_I	wr	%r0, 0x0010, %asi
DS_6_61:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f2, %f12, %f30
	.word 0x93b2c301  ! 107: ALIGNADDRESS	alignaddr	%r11, %r1, %r9
	.word 0x96a8800d  ! 108: ANDNcc_R	andncc 	%r2, %r13, %r11
splash_hpstate_6_62:
	.word 0x819828dc  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08dc, %hpstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_63:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e002  ! 110: CASA_R	casa	[%r31] %asi, %r2, %r16
memptr_6_64:
	set 0x60340000, %r31
	.word 0x8584bebd  ! 111: WRCCR_I	wr	%r18, 0x1ebd, %ccr
	.word 0xe0bfc020  ! 112: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	.word 0xe08008a0  ! 113: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
donret_6_65:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_65-donret_6_65-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_65:
	.word 0xe0ffeac5  ! 114: SWAPA_I	swapa	%r16, [%r31 + 0x0ac5] %asi
	.word 0xe06feac5  ! 115: LDSTUB_I	ldstub	%r16, [%r31 + 0x0ac5]
splash_cmpr_6_66:
	setx 0xe5b4f8b0ed2e73e3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 116: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_6_67:
	set 0x60540000, %r31
	.word 0x85842c8d  ! 117: WRCCR_I	wr	%r16, 0x0c8d, %ccr
splash_lsu_6_68:
	setx 0x516d4e9071384b01, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 118: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_6_69:
	nop
	setx 0xfffff759ffffff84, %g1, %g7
	.word 0xa3800007  ! 119: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x34700001  ! 120: BPG	<illegal instruction>
	.word 0xe077c000  ! 121: STX_R	stx	%r16, [%r31 + %r0]
mondo_6_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d950001  ! 122: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
debug_6_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 123: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 124: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_6_72:
	setx 0x1f1a749b039debac, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 125: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_6_73:
	nop
	setx 0xfffff928fffff25a, %g1, %g7
	.word 0xa3800007  ! 126: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_6_74:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d91c014  ! 127: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
	.word 0xa1902002  ! 128: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xe06ffdfd  ! 129: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffdfd]
	.word 0xe077fdfd  ! 130: STX_I	stx	%r16, [%r31 + 0xfffffdfd]
	.word 0x879020ee  ! 131: WRPR_TT_I	wrpr	%r0, 0x00ee, %tt
memptr_6_75:
	set user_data_start, %r31
	.word 0x85853467  ! 132: WRCCR_I	wr	%r20, 0x1467, %ccr
	.word 0x9b500000  ! 133: RDPR_TPC	rdpr	%tpc, %r13
	.word 0x879020dc  ! 134: WRPR_TT_I	wrpr	%r0, 0x00dc, %tt
	.word 0xd0d7e010  ! 135: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
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
	.word 0x93414000  ! 136: RDPC	rd	%pc, %r9
	.word 0xd927c000  ! 137: STF_R	st	%f12, [%r0, %r31]
	.word 0xd88008a0  ! 138: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_cmpr_6_77:
	setx 0x4e9c43cc1bb9cdd3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 139: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902311  ! 140: WRPR_TT_I	wrpr	%r0, 0x0311, %tt
	.word 0xa190200a  ! 141: WRPR_GL_I	wrpr	%r0, 0x000a, %-
DS_6_78:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xcd408327	! Random illegal ?
	.word 0x93a449c6  ! 1: FDIVd	fdivd	%f48, %f6, %f40
	.word 0xa3a24830  ! 142: FADDs	fadds	%f9, %f16, %f17
	.word 0xa190200c  ! 143: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa9a0016d  ! 144: FABSq	dis not found

splash_tba_6_79:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 145: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 146: LDX_R	ldx	[%r31 + %r0], %r17
mondo_6_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d934010  ! 147: WRPR_WSTATE_R	wrpr	%r13, %r16, %wstate
	.word 0xe2d004a0  ! 148: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
pmu_6_81:
	nop
	setx 0xfffff438fffffbd9, %g1, %g7
	.word 0xa3800007  ! 149: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02034  ! 150: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe28008a0  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x91d020b2  ! 152: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xa1902004  ! 153: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d90314a  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x114a, %pstate
	.word 0x9f802884  ! 155: SIR	sir	0x0884
splash_hpstate_6_82:
	.word 0x8198261e  ! 156: WRHPR_HPSTATE_I	wrhpr	%r0, 0x061e, %hpstate
	.word 0xe2cfe030  ! 157: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r17
tagged_6_83:
	taddcctv %r15, 0x1db8, %r25
	.word 0xe207e9ea  ! 158: LDUW_I	lduw	[%r31 + 0x09ea], %r17
cwp_6_84:
    set user_data_start, %o7
	.word 0x93902004  ! 159: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91d020b2  ! 160: Tcc_I	ta	icc_or_xcc, %r0 + 178
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 161: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_6_85:
	.word 0x819822dd  ! 162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02dd, %hpstate
	.word 0xe20fe9ea  ! 163: LDUB_I	ldub	[%r31 + 0x09ea], %r17
	.word 0xe2dfe030  ! 164: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r17
debug_6_86:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 165: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_6_87-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_87:
	.word 0x91914002  ! 166: WRPR_PIL_R	wrpr	%r5, %r2, %pil
	.word 0xa1902001  ! 167: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xe26fe9ea  ! 168: LDSTUB_I	ldstub	%r17, [%r31 + 0x09ea]
splash_hpstate_6_88:
	.word 0x8198265f  ! 169: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065f, %hpstate
memptr_6_89:
	set 0x60140000, %r31
	.word 0x85837176  ! 170: WRCCR_I	wr	%r13, 0x1176, %ccr
	.word 0x81b01021  ! 171: SIAM	siam	1
splash_cmpr_6_90:
	setx 0xb976afa979abc765, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_91:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 173: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_6_92:
	setx 0x882020c30be4d699, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 174: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 175: WRASI_I	wr	%r0, 0x0080, %asi
debug_6_93:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 176: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
splash_cmpr_6_94:
	setx 0x4fdb3fdf84b13f16, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_6_95:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d920003  ! 178: WRPR_WSTATE_R	wrpr	%r8, %r3, %wstate
	.word 0xe26fe0a3  ! 179: LDSTUB_I	ldstub	%r17, [%r31 + 0x00a3]
	.word 0xa7a00164  ! 180: FABSq	dis not found

splash_tba_6_96:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 181: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1902004  ! 182: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_tba_6_97:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 183: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_6_98:
    set user_data_start, %o7
	.word 0x93902000  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_6_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d904004  ! 185: WRPR_WSTATE_R	wrpr	%r1, %r4, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a0196a  ! 186: FqTOd	dis not found

intveclr_6_101:
	setx 0xaec6846c208fc2bd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 187: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_6_102:
	set 0x003a0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r12
	.word 0x8b98000c  ! 188: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d802000  ! 189: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902008  ! 190: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xe127c000  ! 191: STF_R	st	%f16, [%r0, %r31]
	.word 0xe007c000  ! 192: LDUW_R	lduw	[%r31 + %r0], %r16
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_103:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 193: CASA_R	casa	[%r31] %asi, %r7, %r16
splash_cmpr_6_104:
	setx 0x730013beb66841f7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 194: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 195: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91450000  ! 196: RD_SET_SOFTINT	rd	%set_softint, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 197: LDX_R	ldx	[%r31 + %r0], %r8
DS_6_105:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa5b40303  ! 198: ALIGNADDRESS	alignaddr	%r16, %r3, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 199: LDX_R	ldx	[%r31 + %r0], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 200: LDX_R	ldx	[%r31 + %r0], %r19
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 201: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_6_106:
	setx 0xe50bafdeb2e62620, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_107:
	setx 0x21acf56860f1467f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 203: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a00174  ! 204: FABSq	dis not found

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
	.word 0x9b414000  ! 205: RDPC	rd	%pc, %r13
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 206: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_109
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_109:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 207: RDPC	rd	%pc, %r12
	.word 0xe257c000  ! 208: LDSH_R	ldsh	[%r31 + %r0], %r17
	rd %pc, %r19
	add %r19, (ivw_6_110-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_110:
	.word 0x91930011  ! 209: WRPR_PIL_R	wrpr	%r12, %r17, %pil
DS_6_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa3b50309  ! 210: ALIGNADDRESS	alignaddr	%r20, %r9, %r17
	.word 0x8d802000  ! 211: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99a00570  ! 212: FSQRTq	fsqrt	
	.word 0xe4dfe000  ! 213: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_112)+48, 16, 16)) -> intp(6,1,3)
xir_6_112:
	.word 0xa9832671  ! 214: WR_SET_SOFTINT_I	wr	%r12, 0x0671, %set_softint
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 215: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_6_113:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 216: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_114:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 217: CASA_R	casa	[%r31] %asi, %r18, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 218: LDX_R	ldx	[%r31 + %r0], %r18
debug_6_115:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 219: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe48008a0  ! 220: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa1902001  ! 221: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x22800001  ! 222: BE	be,a	<label_0x1>
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_116:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 223: CASA_R	casa	[%r31] %asi, %r18, %r18
	.word 0xe537c000  ! 224: STQF_R	-	%f18, [%r0, %r31]
change_to_randtl_6_117:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_117:
	.word 0x8f902001  ! 225: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x3e700001  ! 226: BPVC	<illegal instruction>
	.word 0xad8536a0  ! 227: WR_SOFTINT_REG_I	wr	%r20, 0x16a0, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_118)+48, 16, 16)) -> intp(6,1,3)
xir_6_118:
	.word 0xa982f367  ! 228: WR_SET_SOFTINT_I	wr	%r11, 0x1367, %set_softint
	.word 0x87902246  ! 229: WRPR_TT_I	wrpr	%r0, 0x0246, %tt
	.word 0xe45fe228  ! 230: LDX_I	ldx	[%r31 + 0x0228], %r18
	.word 0x8790234d  ! 231: WRPR_TT_I	wrpr	%r0, 0x034d, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 232: LDX_R	ldx	[%r31 + %r0], %r18
debug_6_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 233: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_6_120:
	set user_data_start, %r31
	.word 0x8582a65b  ! 234: WRCCR_I	wr	%r10, 0x065b, %ccr
debug_6_121:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 235: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x24800001  ! 236: BLE	ble,a	<label_0x1>
	.word 0x22800001  ! 237: BE	be,a	<label_0x1>
DS_6_122:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 238: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_123
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_123
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_123:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 239: RDPC	rd	%pc, %r11
	.word 0x97500000  ! 240: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_124) + 16, 16, 16)) -> intp(1,0,13)
intvec_6_124:
	.word 0x39400001  ! 241: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd82fee48  ! 242: STB_I	stb	%r12, [%r31 + 0x0e48]
splash_cmpr_6_125:
	setx 0x7dce21ee1629fb13, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1687d84  ! 244: SDIVX_I	sdivx	%r1, 0xfffffd84, %r16
tagged_6_127:
	taddcctv %r5, 0x185e, %r7
	.word 0xd007fb03  ! 245: LDUW_I	lduw	[%r31 + 0xfffffb03], %r8
splash_lsu_6_128:
	setx 0x3d0bc969ed0f98f1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 246: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_6_129:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 247: SAVE_R	save	%r31, %r0, %r31
DS_6_130:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 248: RESTORE_R	restore	%r31, %r0, %r31
tagged_6_131:
	taddcctv %r13, 0x1377, %r6
	.word 0xd007fb03  ! 249: LDUW_I	lduw	[%r31 + 0xfffffb03], %r8
	.word 0xd06ffb03  ! 250: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffb03]
	.word 0x879023f2  ! 251: WRPR_TT_I	wrpr	%r0, 0x03f2, %tt
splash_cmpr_6_132:
	setx 0x97bb7099e12e79bb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 252: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_133:
	setx 0x189ed607b42051df, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 254: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02035  ! 255: Tcc_I	ta	icc_or_xcc, %r0 + 53
intveclr_6_135:
	setx 0xf0b7000e47906d6b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 256: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x94814014  ! 257: ADDcc_R	addcc 	%r5, %r20, %r10
	.word 0xd2cfe010  ! 258: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_136
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_136:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 259: RDPC	rd	%pc, %r10
	.word 0xd4d004a0  ! 260: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
cwp_6_137:
    set user_data_start, %o7
	.word 0x93902003  ! 261: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xab8372bd  ! 262: WR_CLEAR_SOFTINT_I	wr	%r13, 0x12bd, %clear_softint
mondo_6_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d94800a  ! 263: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
	.word 0x91d02034  ! 264: Tcc_I	ta	icc_or_xcc, %r0 + 52
debug_6_139:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 265: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd43fea6f  ! 266: STD_I	std	%r10, [%r31 + 0x0a6f]
	.word 0xd427ea6f  ! 267: STW_I	stw	%r10, [%r31 + 0x0a6f]
	.word 0x99902003  ! 268: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
DS_6_140:
	.word 0x99a289d4  ! 1: FDIVd	fdivd	%f10, %f20, %f12
	pdist %f26, %f26, %f14
	.word 0x99b20302  ! 269: ALIGNADDRESS	alignaddr	%r8, %r2, %r12
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_141
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_141
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_141:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 270: RDPC	rd	%pc, %r12
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 271: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_6_142:
	setx 0x17ef5474ba91344b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 272: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x96d265ee  ! 273: UMULcc_I	umulcc 	%r9, 0x05ee, %r11
splash_cmpr_6_143:
	setx 0xcdc473bd0de0e43c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 274: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_6_144:
	set user_data_start, %r31
	.word 0x85853c7c  ! 275: WRCCR_I	wr	%r20, 0x1c7c, %ccr
	.word 0x91a0c9ca  ! 276: FDIVd	fdivd	%f34, %f10, %f8
	setx 0x02972c0f94523594, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_145:
	.word 0x39400001  ! 277: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 278: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x9f802bbe  ! 279: SIR	sir	0x0bbe
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
	.word 0xd1e7e00d  ! 280: CASA_R	casa	[%r31] %asi, %r13, %r8
splash_tba_6_147:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa7a0016a  ! 282: FABSq	dis not found

	.word 0x93b20ff1  ! 283: FONES	e	%f9
	.word 0x9b454000  ! 284: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
DS_6_148:
	.word 0xa9a1c9c7  ! 1: FDIVd	fdivd	%f38, %f38, %f20
	.word 0xbfe7c000  ! 285: SAVE_R	save	%r31, %r0, %r31
DS_6_149:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd3314001  ! 1: STQF_R	-	%f9, [%r1, %r5]
	normalw
	.word 0xa9458000  ! 286: RD_SOFTINT_REG	rd	%softint, %r20
pmu_6_150:
	nop
	setx 0xfffff29afffffdbb, %g1, %g7
	.word 0xa3800007  ! 287: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_6_151:
	setx 0x830556391babc20b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 288: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91464000  ! 289: RD_STICK_CMPR_REG	rd	%-, %r8
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 290: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_6_152:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d92800b  ! 291: WRPR_WSTATE_R	wrpr	%r10, %r11, %wstate
	.word 0xa06c2793  ! 292: UDIVX_I	udivx 	%r16, 0x0793, %r16
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_153:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e009  ! 293: CASA_R	casa	[%r31] %asi, %r9, %r8
	.word 0x99902004  ! 294: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x99520000  ! 295: RDPR_PIL	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01964  ! 296: FqTOd	dis not found

	.word 0x9f80384d  ! 297: SIR	sir	0x184d
	.word 0xe6900e60  ! 298: LDUHA_R	lduha	[%r0, %r0] 0x73, %r19
splash_lsu_6_155:
	setx 0x143be9073cc4724f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 299: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9540000  ! 300: RDPR_GL	<illegal instruction>
	.word 0x83d02032  ! 301: Tcc_I	te	icc_or_xcc, %r0 + 50
debug_6_156:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 302: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0xe69fe723  ! 303: LDDA_I	ldda	[%r31, + 0x0723] %asi, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976b64ff  ! 304: SDIVX_I	sdivx	%r13, 0x04ff, %r11
splash_hpstate_6_158:
	.word 0x81982a16  ! 305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a16, %hpstate
splash_cmpr_6_159:
	setx 0x33d568c4126f6f5f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_160:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 307: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_6_161:
	setx 0xcb36b422abbc5e05, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 308: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_6_162:
	setx 0x743c9732d0eece6f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 309: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_163:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 310: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0xe86feafa  ! 311: LDSTUB_I	ldstub	%r20, [%r31 + 0x0afa]
	.word 0xe927c000  ! 312: STF_R	st	%f20, [%r0, %r31]
	.word 0xe88008a0  ! 313: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
debug_6_164:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 314: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_6_165:
	setx 0xe7ec7d4b7d3c92a9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 315: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9820005  ! 316: WR_SET_SOFTINT_R	wr	%r8, %r5, %set_softint
	.word 0x9b450000  ! 317: RD_SET_SOFTINT	rd	%set_softint, %r13
change_to_randtl_6_166:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_166:
	.word 0x8f902001  ! 318: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xab804008  ! 319: WR_CLEAR_SOFTINT_R	wr	%r1, %r8, %clear_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 320: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd527c000  ! 321: STF_R	st	%f10, [%r0, %r31]
change_to_randtl_6_167:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_167:
	.word 0x8f902002  ! 322: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
donret_6_168:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_168-donret_6_168), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_168:
	.word 0xd4ffeafa  ! 323: SWAPA_I	swapa	%r10, [%r31 + 0x0afa] %asi
	.word 0x9aa9c00c  ! 324: ANDNcc_R	andncc 	%r7, %r12, %r13
	.word 0xa5454000  ! 325: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16ae33e  ! 326: SDIVX_I	sdivx	%r11, 0x033e, %r16
tagged_6_170:
	tsubcctv %r17, 0x1583, %r14
	.word 0xe607e364  ! 327: LDUW_I	lduw	[%r31 + 0x0364], %r19
splash_hpstate_6_171:
	.word 0x81982867  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0867, %hpstate
	.word 0x8d802000  ! 329: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe71fc000  ! 330: LDDF_R	ldd	[%r31, %r0], %f19
splash_htba_6_172:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 331: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x94c0e30b  ! 332: ADDCcc_I	addccc 	%r3, 0x030b, %r10
memptr_6_173:
	set 0x60340000, %r31
	.word 0x8580ffa4  ! 333: WRCCR_I	wr	%r3, 0x1fa4, %ccr
	.word 0xd53feb8f  ! 334: STDF_I	std	%f10, [0x0b8f, %r31]
	.word 0xa1902000  ! 335: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xd48fe020  ! 336: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	.word 0x87802088  ! 337: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6b2d46  ! 338: SDIVX_I	sdivx	%r12, 0x0d46, %r13
	setx 0x0291647b39c09d0b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_175:
	.word 0x39400001  ! 339: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_6_176:
    set user_data_start, %o7
	.word 0x93902003  ! 340: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd23ff4d5  ! 341: STD_I	std	%r9, [%r31 + 0xfffff4d5]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56ca413  ! 342: SDIVX_I	sdivx	%r18, 0x0413, %r18
	.word 0xd0d00e80  ! 343: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r8
	.word 0xd00fc000  ! 344: LDUB_R	ldub	[%r31 + %r0], %r8
splash_tba_6_178:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 345: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd06ff250  ! 346: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff250]
DS_6_179:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd531c009  ! 1: STQF_R	-	%f10, [%r9, %r7]
	normalw
	.word 0xa3458000  ! 347: RD_SOFTINT_REG	rd	%softint, %r17
intveclr_6_180:
	setx 0x4107b1c042c97857, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 348: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6c004a0  ! 349: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 350: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_6_181:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 351: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_6_182:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 352: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa7520000  ! 353: RDPR_PIL	<illegal instruction>
	.word 0x8d802004  ! 354: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa7848007  ! 355: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 356: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe68008a0  ! 357: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x91480000  ! 358: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x8d802000  ! 359: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd247c000  ! 360: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0xa190200f  ! 361: WRPR_GL_I	wrpr	%r0, 0x000f, %-
DS_6_184:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x99a249d4  ! 1: FDIVd	fdivd	%f40, %f20, %f12
	normalw
	.word 0x99458000  ! 362: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01961  ! 363: FqTOd	dis not found

intveclr_6_186:
	setx 0xeb1ad9a390742bf2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_6_187:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 365: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8780201c  ! 366: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x879021a5  ! 367: WRPR_TT_I	wrpr	%r0, 0x01a5, %tt
splash_hpstate_6_188:
	.word 0x81982b47  ! 368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b47, %hpstate
	.word 0x24700001  ! 369: BPLE	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_189:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 370: RDPC	rd	%pc, %r8
	.word 0x8d902db6  ! 371: WRPR_PSTATE_I	wrpr	%r0, 0x0db6, %pstate
splash_hpstate_6_190:
	.word 0x81982fde  ! 372: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fde, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01967  ! 373: FqTOd	dis not found

	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 374: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 375: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_6_192:
	tsubcctv %r13, 0x18d0, %r22
	.word 0xe207f250  ! 376: LDUW_I	lduw	[%r31 + 0xfffff250], %r17
	.word 0x9f803d04  ! 377: SIR	sir	0x1d04
DS_6_193:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f28, %f28, %f0
	.word 0xa3b2c30c  ! 378: ALIGNADDRESS	alignaddr	%r11, %r12, %r17
splash_cmpr_6_194:
	setx 0x38a2a35806719d8d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 379: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xa3414000  ! 380: RDPC	rd	%pc, %r17
	.word 0xe2cfe020  ! 381: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r17
	.word 0xe327edb2  ! 382: STF_I	st	%f17, [0x0db2, %r31]
tagged_6_196:
	tsubcctv %r7, 0x1896, %r21
	.word 0xe207edb2  ! 383: LDUW_I	lduw	[%r31 + 0x0db2], %r17
	setx 0x6f424cfffbf22bef, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_197:
	.word 0x39400001  ! 384: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 385: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x87802004  ! 386: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa780c006  ! 387: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r6, %-
	.word 0x9ba449cd  ! 388: FDIVd	fdivd	%f48, %f44, %f44
splash_lsu_6_199:
	setx 0xa5aad9c171901695, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 389: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_6_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d92c012  ! 390: WRPR_WSTATE_R	wrpr	%r11, %r18, %wstate
splash_htba_6_201:
	set 0x003a0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r12
	.word 0x8b98000c  ! 391: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe137edb2  ! 392: STQF_I	-	%f16, [0x0db2, %r31]
	.word 0x87902243  ! 393: WRPR_TT_I	wrpr	%r0, 0x0243, %tt
tagged_6_202:
	tsubcctv %r8, 0x1271, %r2
	.word 0xe007edb2  ! 394: LDUW_I	lduw	[%r31 + 0x0db2], %r16
	.word 0xe0d7e030  ! 395: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
debug_6_203:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 396: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 397: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_6_204:
	setx 0x03d21d042e6c6a27, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_205:
	setx 0x1e8e7c4255e7e059, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 400: BPNE	<illegal instruction>
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	.word 0xa1902002  ! 1: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd0c80e60  ! 2: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r8
	.word 0xa7a2c9d1  ! 3: FDIVd	fdivd	%f42, %f48, %f50
pmu_5_0:
	nop
	setx 0xfffffd96fffff728, %g1, %g7
	.word 0xa3800007  ! 4: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_5_1:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 5: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_2
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_2:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 6: RDPC	rd	%pc, %r17
intveclr_5_3:
	setx 0xed7e36bc4484b0e1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_5_4:
	tsubcctv %r4, 0x1b94, %r18
	.word 0xe607e390  ! 8: LDUW_I	lduw	[%r31 + 0x0390], %r19
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_5:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e008  ! 9: CASA_R	casa	[%r31] %asi, %r8, %r19
	.word 0xad80acb9  ! 10: WR_SOFTINT_REG_I	wr	%r2, 0x0cb9, %softint
	.word 0x8d902c0c  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x0c0c, %pstate
	.word 0x9550c000  ! 12: RDPR_TT	rdpr	%tt, %r10
memptr_5_6:
	set user_data_start, %r31
	.word 0x8582773d  ! 13: WRCCR_I	wr	%r9, 0x173d, %ccr
	.word 0x8790236c  ! 14: WRPR_TT_I	wrpr	%r0, 0x036c, %tt
	.word 0x95a00166  ! 15: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_7
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_7:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 16: RDPC	rd	%pc, %r18
mondo_5_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d94c008  ! 17: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
	.word 0xab82b182  ! 18: WR_CLEAR_SOFTINT_I	wr	%r10, 0x1182, %clear_softint
	.word 0x99902001  ! 19: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
cwp_5_9:
    set user_data_start, %o7
	.word 0x93902000  ! 20: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
cwp_5_10:
    set user_data_start, %o7
	.word 0x93902006  ! 21: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_5_11:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 22: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87902127  ! 23: WRPR_TT_I	wrpr	%r0, 0x0127, %tt
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_12
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_12:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 24: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0xe727e431  ! 25: STF_I	st	%f19, [0x0431, %r31]
	.word 0xe68008a0  ! 26: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
memptr_5_13:
	set 0x60740000, %r31
	.word 0x858433da  ! 27: WRCCR_I	wr	%r16, 0x13da, %ccr
	.word 0x92a90014  ! 28: ANDNcc_R	andncc 	%r4, %r20, %r9
memptr_5_14:
	set 0x60740000, %r31
	.word 0x85833b2b  ! 29: WRCCR_I	wr	%r12, 0x1b2b, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 30: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4d80e80  ! 31: LDXA_R	ldxa	[%r0, %r0] 0x74, %r18
	.word 0x879021dd  ! 32: WRPR_TT_I	wrpr	%r0, 0x01dd, %tt
splash_cmpr_5_15:
	setx 0xd669d22c163e5605, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996cbf47  ! 34: SDIVX_I	sdivx	%r18, 0xffffff47, %r12
	.word 0xda8fe030  ! 35: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01970  ! 36: FqTOd	dis not found

	.word 0xd33fc000  ! 37: STDF_R	std	%f9, [%r0, %r31]
	.word 0xa8c06b86  ! 38: ADDCcc_I	addccc 	%r1, 0x0b86, %r20
cwp_5_18:
    set user_data_start, %o7
	.word 0x93902005  ! 39: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa7814000  ! 40: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r0, %-
	.word 0x87902131  ! 41: WRPR_TT_I	wrpr	%r0, 0x0131, %tt
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_20:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e002  ! 42: CASA_R	casa	[%r31] %asi, %r2, %r19
	.word 0x99a00164  ! 43: FABSq	dis not found

	.word 0xe44ff491  ! 44: LDSB_I	ldsb	[%r31 + 0xfffff491], %r18
debug_5_21:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 45: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
cwp_5_22:
    set user_data_start, %o7
	.word 0x93902007  ! 46: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16ce33b  ! 47: SDIVX_I	sdivx	%r19, 0x033b, %r16
intveclr_5_24:
	setx 0xfd7930b808f0c83e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 48: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_5_25:
	setx 0x038581ea1105d245, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 49: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_26:
	setx 0x256846f4ef4e3c8e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2e700001  ! 51: BPVS	<illegal instruction>
	.word 0x91500000  ! 52: RDPR_TPC	<illegal instruction>
splash_cmpr_5_27:
	setx 0x43499172ad48afd4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 53: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802010  ! 54: WRASI_I	wr	%r0, 0x0010, %asi
splash_cmpr_5_28:
	setx 0x63d07d1d1b16d742, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_29:
	setx 0xe1b09844cb15cb72, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 56: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 57: LDX_R	ldx	[%r31 + %r0], %r20
splash_cmpr_5_30:
	setx 0xc13918019c986ad3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe86fef00  ! 59: LDSTUB_I	ldstub	%r20, [%r31 + 0x0f00]
	.word 0x9f8034c3  ! 60: SIR	sir	0x14c3
memptr_5_31:
	set 0x60140000, %r31
	.word 0x8584fd77  ! 61: WRCCR_I	wr	%r19, 0x1d77, %ccr
debug_5_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 62: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_5_33:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 63: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_5_34:
	setx 0xa14bd6e64ce5f913, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 64: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_5_35:
	.word 0x81982d1f  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1f, %hpstate
	.word 0x8d903096  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x1096, %pstate
tagged_5_36:
	tsubcctv %r12, 0x1ad4, %r21
	.word 0xe807e96a  ! 67: LDUW_I	lduw	[%r31 + 0x096a], %r20
splash_tba_5_37:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 68: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_38) + 16, 16, 16)) -> intp(7,0,27)
intvec_5_38:
	.word 0x39400001  ! 69: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_39:
	setx 0x2b6761b009054dec, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_40) + 48, 16, 16)) -> intp(0,0,7)
intvec_5_40:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_5_41:
	taddcctv %r2, 0x1b37, %r11
	.word 0xe807e96a  ! 72: LDUW_I	lduw	[%r31 + 0x096a], %r20
	.word 0x95454000  ! 73: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	.word 0x93a1c9cd  ! 74: FDIVd	fdivd	%f38, %f44, %f40
	.word 0x91a289d3  ! 75: FDIVd	fdivd	%f10, %f50, %f8
mondo_5_42:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d910014  ! 76: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
	.word 0x9b450000  ! 77: RD_SET_SOFTINT	rd	%set_softint, %r13
	.word 0xd0800c80  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r8
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_43:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 79: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01972  ! 80: FqTOd	dis not found

intveclr_5_45:
	setx 0xcb678d1e948c1aaa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 81: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_46:
	setx 0x423e57104c15ec12, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 82: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_5_47:
	setx 0xbf5d78fac96cce6f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 83: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_5_48:
	set user_data_start, %r31
	.word 0x85827f4c  ! 84: WRCCR_I	wr	%r9, 0x1f4c, %ccr
	.word 0x8780208b  ! 85: WRASI_I	wr	%r0, 0x008b, %asi
	rd %pc, %r19
	add %r19, (ivw_5_49-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_49:
	.word 0x91940003  ! 86: WRPR_PIL_R	wrpr	%r16, %r3, %pil
splash_cmpr_5_50:
	setx 0xd61004c4a433cf1e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 87: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_5_51:
	setx 0x358d3cfd66b87819, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 88: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 89: BPN	<illegal instruction>
memptr_5_52:
	set 0x60140000, %r31
	.word 0x85846b8c  ! 90: WRCCR_I	wr	%r17, 0x0b8c, %ccr
	.word 0xe26ff0a9  ! 91: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff0a9]
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 92: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa3450000  ! 93: RD_SET_SOFTINT	rd	%set_softint, %r17
	.word 0xd08008a0  ! 94: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
memptr_5_53:
	set 0x60540000, %r31
	.word 0x85846c79  ! 95: WRCCR_I	wr	%r17, 0x0c79, %ccr
	.word 0xd00ff3d6  ! 96: LDUB_I	ldub	[%r31 + 0xfffff3d6], %r8
	.word 0x87802016  ! 97: WRASI_I	wr	%r0, 0x0016, %asi
intveclr_5_54:
	setx 0x9a27a40eca39e1d2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 98: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_5_55:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 99: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_5_56:
	setx 0x70abedd24f900adf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_5_57:
    set user_data_start, %o7
	.word 0x93902007  ! 101: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 102: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_5_58:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 103: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
donret_5_59:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_59-donret_5_59-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_59:
	.word 0xd0fff3d6  ! 104: SWAPA_I	swapa	%r8, [%r31 + 0xfffff3d6] %asi
debug_5_60:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 105: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0x87802055  ! 106: WRASI_I	wr	%r0, 0x0055, %asi
DS_5_61:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f20, %f6, %f6
	.word 0x93b14302  ! 107: ALIGNADDRESS	alignaddr	%r5, %r2, %r9
	.word 0x9aa98002  ! 108: ANDNcc_R	andncc 	%r6, %r2, %r13
splash_hpstate_5_62:
	.word 0x819828ce  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ce, %hpstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_63:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e002  ! 110: CASA_R	casa	[%r31] %asi, %r2, %r16
memptr_5_64:
	set 0x60540000, %r31
	.word 0x8582e3fe  ! 111: WRCCR_I	wr	%r11, 0x03fe, %ccr
	.word 0xe0bfc020  ! 112: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	.word 0xe08008a0  ! 113: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
donret_5_65:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_65-donret_5_65-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_65:
	.word 0xe0ffeac5  ! 114: SWAPA_I	swapa	%r16, [%r31 + 0x0ac5] %asi
	.word 0xe06feac5  ! 115: LDSTUB_I	ldstub	%r16, [%r31 + 0x0ac5]
splash_cmpr_5_66:
	setx 0xb9a652df91ce9d9a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 116: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_5_67:
	set 0x60740000, %r31
	.word 0x8584b479  ! 117: WRCCR_I	wr	%r18, 0x1479, %ccr
splash_lsu_5_68:
	setx 0x09ea47ac6910c341, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 118: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_5_69:
	nop
	setx 0xfffff0c0fffff641, %g1, %g7
	.word 0xa3800007  ! 119: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x34700001  ! 120: BPG	<illegal instruction>
	.word 0xe077c000  ! 121: STX_R	stx	%r16, [%r31 + %r0]
mondo_5_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d930009  ! 122: WRPR_WSTATE_R	wrpr	%r12, %r9, %wstate
debug_5_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 123: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 124: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_5_72:
	setx 0xd2799959bbc2395a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 125: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_5_73:
	nop
	setx 0xfffff546fffffb95, %g1, %g7
	.word 0xa3800007  ! 126: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_5_74:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d92800d  ! 127: WRPR_WSTATE_R	wrpr	%r10, %r13, %wstate
	.word 0xa1902008  ! 128: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xe06ffdfd  ! 129: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffdfd]
	.word 0xe077fdfd  ! 130: STX_I	stx	%r16, [%r31 + 0xfffffdfd]
	.word 0x879021f3  ! 131: WRPR_TT_I	wrpr	%r0, 0x01f3, %tt
memptr_5_75:
	set user_data_start, %r31
	.word 0x858026fe  ! 132: WRCCR_I	wr	%r0, 0x06fe, %ccr
	.word 0xa5500000  ! 133: RDPR_TPC	rdpr	%tpc, %r18
	.word 0x87902155  ! 134: WRPR_TT_I	wrpr	%r0, 0x0155, %tt
	.word 0xd0d7e020  ! 135: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
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
	.word 0xa9414000  ! 136: RDPC	rd	%pc, %r20
	.word 0xd927c000  ! 137: STF_R	st	%f12, [%r0, %r31]
	.word 0xd88008a0  ! 138: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_cmpr_5_77:
	setx 0x585190a219245cd4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 139: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879020cb  ! 140: WRPR_TT_I	wrpr	%r0, 0x00cb, %tt
	.word 0xa190200a  ! 141: WRPR_GL_I	wrpr	%r0, 0x000a, %-
DS_5_78:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd15e6e55	! Random illegal ?
	.word 0xa1a089c4  ! 1: FDIVd	fdivd	%f2, %f4, %f16
	.word 0x91a5082a  ! 142: FADDs	fadds	%f20, %f10, %f8
	.word 0xa190200b  ! 143: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x99a00164  ! 144: FABSq	dis not found

splash_tba_5_79:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 145: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 146: LDX_R	ldx	[%r31 + %r0], %r17
mondo_5_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d94000b  ! 147: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
	.word 0xe2d004a0  ! 148: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
pmu_5_81:
	nop
	setx 0xfffff936fffff2a3, %g1, %g7
	.word 0xa3800007  ! 149: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d02032  ! 150: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xe28008a0  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x93d02032  ! 152: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xa190200b  ! 153: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d9031fa  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x11fa, %pstate
	.word 0x9f803cbc  ! 155: SIR	sir	0x1cbc
splash_hpstate_5_82:
	.word 0x81982d86  ! 156: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d86, %hpstate
	.word 0xe2cfe020  ! 157: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r17
tagged_5_83:
	taddcctv %r15, 0x1856, %r16
	.word 0xe207e9ea  ! 158: LDUW_I	lduw	[%r31 + 0x09ea], %r17
cwp_5_84:
    set user_data_start, %o7
	.word 0x93902001  ! 159: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x91d02032  ! 160: Tcc_I	ta	icc_or_xcc, %r0 + 50
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 161: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_5_85:
	.word 0x8198265d  ! 162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065d, %hpstate
	.word 0xe20fe9ea  ! 163: LDUB_I	ldub	[%r31 + 0x09ea], %r17
	.word 0xe2dfe020  ! 164: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r17
debug_5_86:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 165: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_5_87-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_87:
	.word 0x9190000d  ! 166: WRPR_PIL_R	wrpr	%r0, %r13, %pil
	.word 0xa1902006  ! 167: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xe26fe9ea  ! 168: LDSTUB_I	ldstub	%r17, [%r31 + 0x09ea]
splash_hpstate_5_88:
	.word 0x81982d44  ! 169: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d44, %hpstate
memptr_5_89:
	set 0x60740000, %r31
	.word 0x8581e2c3  ! 170: WRCCR_I	wr	%r7, 0x02c3, %ccr
	.word 0x81b01021  ! 171: SIAM	siam	1
splash_cmpr_5_90:
	setx 0x3feebf4865dfc62b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_91:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 173: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_5_92:
	setx 0x8eb9642c312f7901, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 174: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 175: WRASI_I	wr	%r0, 0x0004, %asi
debug_5_93:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 176: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
splash_cmpr_5_94:
	setx 0x827daa2ca053b124, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_5_95:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d93000d  ! 178: WRPR_WSTATE_R	wrpr	%r12, %r13, %wstate
	.word 0xe26fe0a3  ! 179: LDSTUB_I	ldstub	%r17, [%r31 + 0x00a3]
	.word 0xa1a00164  ! 180: FABSq	dis not found

splash_tba_5_96:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 181: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1902007  ! 182: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_tba_5_97:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 183: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_5_98:
    set user_data_start, %o7
	.word 0x93902000  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_5_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d94c00d  ! 185: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01964  ! 186: FqTOd	dis not found

intveclr_5_101:
	setx 0xc2cff9eb5dce54fb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 187: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_5_102:
	set 0x003b0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r12
	.word 0x8b98000c  ! 188: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d802000  ! 189: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa190200e  ! 190: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xe127c000  ! 191: STF_R	st	%f16, [%r0, %r31]
	.word 0xe007c000  ! 192: LDUW_R	lduw	[%r31 + %r0], %r16
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_103:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 193: CASA_R	casa	[%r31] %asi, %r7, %r16
splash_cmpr_5_104:
	setx 0x04e6bd00bcda5400, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 194: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 195: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x99450000  ! 196: RD_SET_SOFTINT	rd	%set_softint, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 197: LDX_R	ldx	[%r31 + %r0], %r8
DS_5_105:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x93b0830d  ! 198: ALIGNADDRESS	alignaddr	%r2, %r13, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 199: LDX_R	ldx	[%r31 + %r0], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 200: LDX_R	ldx	[%r31 + %r0], %r19
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 201: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_5_106:
	setx 0x574360879f94f1f4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_107:
	setx 0x4ec0e704343ea276, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 203: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9ba00171  ! 204: FABSq	dis not found

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
	.word 0xa3414000  ! 205: RDPC	rd	%pc, %r17
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 206: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_109
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_109:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 207: RDPC	rd	%pc, %r8
	.word 0xe257c000  ! 208: LDSH_R	ldsh	[%r31 + %r0], %r17
	rd %pc, %r19
	add %r19, (ivw_5_110-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_110:
	.word 0x91948010  ! 209: WRPR_PIL_R	wrpr	%r18, %r16, %pil
DS_5_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa7b0030c  ! 210: ALIGNADDRESS	alignaddr	%r0, %r12, %r19
	.word 0x8d802000  ! 211: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa7a0056d  ! 212: FSQRTq	fsqrt	
	.word 0xe4dfe000  ! 213: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_112)+40, 16, 16)) -> intp(5,1,3)
xir_5_112:
	.word 0xa982b999  ! 214: WR_SET_SOFTINT_I	wr	%r10, 0x1999, %set_softint
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 215: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_5_113:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 216: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_114:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 217: CASA_R	casa	[%r31] %asi, %r18, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 218: LDX_R	ldx	[%r31 + %r0], %r18
debug_5_115:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 219: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe48008a0  ! 220: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa1902004  ! 221: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x22800001  ! 222: BE	be,a	<label_0x1>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_116:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 223: CASA_R	casa	[%r31] %asi, %r18, %r18
	.word 0xe537c000  ! 224: STQF_R	-	%f18, [%r0, %r31]
change_to_randtl_5_117:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_117:
	.word 0x8f902000  ! 225: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x3e700001  ! 226: BPVC	<illegal instruction>
	.word 0xad84e7ec  ! 227: WR_SOFTINT_REG_I	wr	%r19, 0x07ec, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_118)+32, 16, 16)) -> intp(5,1,3)
xir_5_118:
	.word 0xa980ef9a  ! 228: WR_SET_SOFTINT_I	wr	%r3, 0x0f9a, %set_softint
	.word 0x879022a0  ! 229: WRPR_TT_I	wrpr	%r0, 0x02a0, %tt
	.word 0xe45fe228  ! 230: LDX_I	ldx	[%r31 + 0x0228], %r18
	.word 0x87902009  ! 231: WRPR_TT_I	wrpr	%r0, 0x0009, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 232: LDX_R	ldx	[%r31 + %r0], %r18
debug_5_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 233: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_5_120:
	set user_data_start, %r31
	.word 0x85833dda  ! 234: WRCCR_I	wr	%r12, 0x1dda, %ccr
debug_5_121:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 235: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x24800001  ! 236: BLE	ble,a	<label_0x1>
	.word 0x22800001  ! 237: BE	be,a	<label_0x1>
DS_5_122:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 238: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_123
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_123
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_123:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 239: RDPC	rd	%pc, %r13
	.word 0x95500000  ! 240: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_124) + 40, 16, 16)) -> intp(6,0,31)
intvec_5_124:
	.word 0x39400001  ! 241: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd82fee48  ! 242: STB_I	stb	%r12, [%r31 + 0x0e48]
splash_cmpr_5_125:
	setx 0x0ab4a5a010038313, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56c7506  ! 244: SDIVX_I	sdivx	%r17, 0xfffff506, %r18
tagged_5_127:
	taddcctv %r10, 0x19ed, %r2
	.word 0xd007fb03  ! 245: LDUW_I	lduw	[%r31 + 0xfffffb03], %r8
splash_lsu_5_128:
	setx 0x744413fc9b187d65, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 246: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_5_129:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 247: SAVE_R	save	%r31, %r0, %r31
DS_5_130:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 248: RESTORE_R	restore	%r31, %r0, %r31
tagged_5_131:
	taddcctv %r22, 0x19f7, %r5
	.word 0xd007fb03  ! 249: LDUW_I	lduw	[%r31 + 0xfffffb03], %r8
	.word 0xd06ffb03  ! 250: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffb03]
	.word 0x879021dd  ! 251: WRPR_TT_I	wrpr	%r0, 0x01dd, %tt
splash_cmpr_5_132:
	setx 0x980a1eeeac0a993e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 252: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_133:
	setx 0xf0f6170d3949363e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 254: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02033  ! 255: Tcc_I	ta	icc_or_xcc, %r0 + 51
intveclr_5_135:
	setx 0xb83577eeeaa3cf9f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 256: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9884000c  ! 257: ADDcc_R	addcc 	%r16, %r12, %r12
	.word 0xd2cfe010  ! 258: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_136
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_136:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 259: RDPC	rd	%pc, %r9
	.word 0xd4d004a0  ! 260: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
cwp_5_137:
    set user_data_start, %o7
	.word 0x93902000  ! 261: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xab852bdc  ! 262: WR_CLEAR_SOFTINT_I	wr	%r20, 0x0bdc, %clear_softint
mondo_5_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d928000  ! 263: WRPR_WSTATE_R	wrpr	%r10, %r0, %wstate
	.word 0x91d020b2  ! 264: Tcc_I	ta	icc_or_xcc, %r0 + 178
debug_5_139:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 265: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd43fea6f  ! 266: STD_I	std	%r10, [%r31 + 0x0a6f]
	.word 0xd427ea6f  ! 267: STW_I	stw	%r10, [%r31 + 0x0a6f]
	.word 0x99902003  ! 268: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
DS_5_140:
	.word 0x99a109c3  ! 1: FDIVd	fdivd	%f4, %f34, %f12
	pdist %f4, %f22, %f10
	.word 0xa9b34310  ! 269: ALIGNADDRESS	alignaddr	%r13, %r16, %r20
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_141
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_141
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_141:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 270: RDPC	rd	%pc, %r12
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 271: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_5_142:
	setx 0x984fe50acf707be6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 272: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x98d1ff92  ! 273: UMULcc_I	umulcc 	%r7, 0xffffff92, %r12
splash_cmpr_5_143:
	setx 0x4feb5528952c468c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 274: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_5_144:
	set user_data_start, %r31
	.word 0x8584611a  ! 275: WRCCR_I	wr	%r17, 0x011a, %ccr
	.word 0xa7a089c3  ! 276: FDIVd	fdivd	%f2, %f34, %f50
	setx 0x6a4a5fd37425fe5d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_145:
	.word 0x39400001  ! 277: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780208b  ! 278: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x9f803a1b  ! 279: SIR	sir	0x1a1b
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
	.word 0xd1e7e00d  ! 280: CASA_R	casa	[%r31] %asi, %r13, %r8
splash_tba_5_147:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa9a00168  ! 282: FABSq	dis not found

	.word 0x91b28ff4  ! 283: FONES	e	%f8
	.word 0x97454000  ! 284: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
DS_5_148:
	.word 0x91a089c7  ! 1: FDIVd	fdivd	%f2, %f38, %f8
	.word 0xbfe7c000  ! 285: SAVE_R	save	%r31, %r0, %r31
DS_5_149:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe1300003  ! 1: STQF_R	-	%f16, [%r3, %r0]
	normalw
	.word 0x97458000  ! 286: RD_SOFTINT_REG	rd	%softint, %r11
pmu_5_150:
	nop
	setx 0xfffff2b9fffff10e, %g1, %g7
	.word 0xa3800007  ! 287: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_5_151:
	setx 0x68df7f84e80179f1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 288: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97464000  ! 289: RD_STICK_CMPR_REG	rd	%-, %r11
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 290: Tcc_R	te	icc_or_xcc, %r0 + %r30
mondo_5_152:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d934000  ! 291: WRPR_WSTATE_R	wrpr	%r13, %r0, %wstate
	.word 0x9a682983  ! 292: UDIVX_I	udivx 	%r0, 0x0983, %r13
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_153:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e009  ! 293: CASA_R	casa	[%r31] %asi, %r9, %r8
	.word 0x99902002  ! 294: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x9b520000  ! 295: RDPR_PIL	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01973  ! 296: FqTOd	dis not found

	.word 0x9f803365  ! 297: SIR	sir	0x1365
	.word 0xe69004a0  ! 298: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
splash_lsu_5_155:
	setx 0xa02aa331b91d250d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 299: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9540000  ! 300: RDPR_GL	<illegal instruction>
	.word 0x91d02034  ! 301: Tcc_I	ta	icc_or_xcc, %r0 + 52
debug_5_156:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 302: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0xe69fe723  ! 303: LDDA_I	ldda	[%r31, + 0x0723] %asi, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96d290e  ! 304: SDIVX_I	sdivx	%r20, 0x090e, %r20
splash_hpstate_5_158:
	.word 0x8198280e  ! 305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080e, %hpstate
splash_cmpr_5_159:
	setx 0xbdf7d1ced4cb366c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_160:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 307: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_5_161:
	setx 0xee95fd898cd6ac7e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 308: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_5_162:
	setx 0xcf0dd52a3b93423c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 309: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_163:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 310: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0xe86feafa  ! 311: LDSTUB_I	ldstub	%r20, [%r31 + 0x0afa]
	.word 0xe927c000  ! 312: STF_R	st	%f20, [%r0, %r31]
	.word 0xe8800a60  ! 313: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r20
debug_5_164:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 314: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_5_165:
	setx 0x486144b657ecba5e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 315: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9818011  ! 316: WR_SET_SOFTINT_R	wr	%r6, %r17, %set_softint
	.word 0x95450000  ! 317: RD_SET_SOFTINT	rd	%set_softint, %r10
change_to_randtl_5_166:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_166:
	.word 0x8f902001  ! 318: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xab800002  ! 319: WR_CLEAR_SOFTINT_R	wr	%r0, %r2, %clear_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 320: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd527c000  ! 321: STF_R	st	%f10, [%r0, %r31]
change_to_randtl_5_167:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_167:
	.word 0x8f902003  ! 322: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
donret_5_168:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_168-donret_5_168), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_168:
	.word 0xd4ffeafa  ! 323: SWAPA_I	swapa	%r10, [%r31 + 0x0afa] %asi
	.word 0xa6ac0012  ! 324: ANDNcc_R	andncc 	%r16, %r18, %r19
	.word 0x95454000  ! 325: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95687bc7  ! 326: SDIVX_I	sdivx	%r1, 0xfffffbc7, %r10
tagged_5_170:
	tsubcctv %r21, 0x1334, %r5
	.word 0xe607e364  ! 327: LDUW_I	lduw	[%r31 + 0x0364], %r19
splash_hpstate_5_171:
	.word 0x81982ecf  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecf, %hpstate
	.word 0x8d802000  ! 329: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe71fc000  ! 330: LDDF_R	ldd	[%r31, %r0], %f19
splash_htba_5_172:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 331: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x94c120bf  ! 332: ADDCcc_I	addccc 	%r4, 0x00bf, %r10
memptr_5_173:
	set 0x60540000, %r31
	.word 0x85833158  ! 333: WRCCR_I	wr	%r12, 0x1158, %ccr
	.word 0xd53feb8f  ! 334: STDF_I	std	%f10, [0x0b8f, %r31]
	.word 0xa1902007  ! 335: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xd48fe020  ! 336: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	.word 0x87802080  ! 337: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56b7298  ! 338: SDIVX_I	sdivx	%r13, 0xfffff298, %r18
	setx 0x1e727393b67d7127, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_175:
	.word 0x39400001  ! 339: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_5_176:
    set user_data_start, %o7
	.word 0x93902000  ! 340: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd23ff4d5  ! 341: STD_I	std	%r9, [%r31 + 0xfffff4d5]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa768b6a3  ! 342: SDIVX_I	sdivx	%r2, 0xfffff6a3, %r19
	.word 0xd0d00e60  ! 343: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r8
	.word 0xd00fc000  ! 344: LDUB_R	ldub	[%r31 + %r0], %r8
splash_tba_5_178:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 345: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd06ff250  ! 346: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff250]
DS_5_179:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe3314006  ! 1: STQF_R	-	%f17, [%r6, %r5]
	normalw
	.word 0xa9458000  ! 347: RD_SOFTINT_REG	rd	%softint, %r20
intveclr_5_180:
	setx 0xb7931dbb4a0ccfc1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 348: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6c004a0  ! 349: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 350: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_5_181:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 351: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_5_182:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 352: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1520000  ! 353: RDPR_PIL	<illegal instruction>
	.word 0x8d802004  ! 354: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa7850000  ! 355: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r0, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 356: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe6800b60  ! 357: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r19
	.word 0x91480000  ! 358: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x8d802004  ! 359: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd247c000  ! 360: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0xa190200b  ! 361: WRPR_GL_I	wrpr	%r0, 0x000b, %-
DS_5_184:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa3a209ca  ! 1: FDIVd	fdivd	%f8, %f10, %f48
	normalw
	.word 0x93458000  ! 362: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a0196a  ! 363: FqTOd	dis not found

intveclr_5_186:
	setx 0x2d30b2fa300b6fdd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_5_187:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 365: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802014  ! 366: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87902338  ! 367: WRPR_TT_I	wrpr	%r0, 0x0338, %tt
splash_hpstate_5_188:
	.word 0x8198220c  ! 368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020c, %hpstate
	.word 0x24700001  ! 369: BPLE	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_189:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 370: RDPC	rd	%pc, %r9
	.word 0x8d902183  ! 371: WRPR_PSTATE_I	wrpr	%r0, 0x0183, %pstate
splash_hpstate_5_190:
	.word 0x819826d7  ! 372: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d7, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01971  ! 373: FqTOd	dis not found

	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 374: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 375: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_5_192:
	tsubcctv %r4, 0x189c, %r1
	.word 0xe207f250  ! 376: LDUW_I	lduw	[%r31 + 0xfffff250], %r17
	.word 0x9f803274  ! 377: SIR	sir	0x1274
DS_5_193:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f6, %f30, %f10
	.word 0xa3b44313  ! 378: ALIGNADDRESS	alignaddr	%r17, %r19, %r17
splash_cmpr_5_194:
	setx 0x2dee3834d23ca49a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 379: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0x91414000  ! 380: RDPC	rd	%pc, %r8
	.word 0xe2cfe010  ! 381: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r17
	.word 0xe327edb2  ! 382: STF_I	st	%f17, [0x0db2, %r31]
tagged_5_196:
	tsubcctv %r17, 0x1513, %r20
	.word 0xe207edb2  ! 383: LDUW_I	lduw	[%r31 + 0x0db2], %r17
	setx 0x32b0ae003449adc0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_197:
	.word 0x39400001  ! 384: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 385: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x87802080  ! 386: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa7824010  ! 387: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r16, %-
	.word 0x99a349c2  ! 388: FDIVd	fdivd	%f44, %f2, %f12
splash_lsu_5_199:
	setx 0xecde2688e8dd69a9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 389: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_5_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d918004  ! 390: WRPR_WSTATE_R	wrpr	%r6, %r4, %wstate
splash_htba_5_201:
	set 0x003b0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r12
	.word 0x8b98000c  ! 391: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe137edb2  ! 392: STQF_I	-	%f16, [0x0db2, %r31]
	.word 0x879021b2  ! 393: WRPR_TT_I	wrpr	%r0, 0x01b2, %tt
tagged_5_202:
	tsubcctv %r12, 0x1ce5, %r2
	.word 0xe007edb2  ! 394: LDUW_I	lduw	[%r31 + 0x0db2], %r16
	.word 0xe0d7e030  ! 395: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
debug_5_203:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 396: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 397: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_5_204:
	setx 0xc3bc2c41a3a41311, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_205:
	setx 0xf4a5b5f3ce87253d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 400: BPNE	<illegal instruction>
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	.word 0xa190200a  ! 1: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd0c804a0  ! 2: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
	.word 0x91a349c9  ! 3: FDIVd	fdivd	%f44, %f40, %f8
pmu_4_0:
	nop
	setx 0xfffffad3fffff119, %g1, %g7
	.word 0xa3800007  ! 4: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_4_1:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 5: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_2
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_2:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 6: RDPC	rd	%pc, %r13
intveclr_4_3:
	setx 0x57421ec075f6e555, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_4_4:
	tsubcctv %r24, 0x1375, %r22
	.word 0xe607e390  ! 8: LDUW_I	lduw	[%r31 + 0x0390], %r19
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_5:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e008  ! 9: CASA_R	casa	[%r31] %asi, %r8, %r19
	.word 0xad8260fc  ! 10: WR_SOFTINT_REG_I	wr	%r9, 0x00fc, %softint
	.word 0x8d9039d4  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x19d4, %pstate
	.word 0x9350c000  ! 12: RDPR_TT	rdpr	%tt, %r9
memptr_4_6:
	set user_data_start, %r31
	.word 0x8584bd27  ! 13: WRCCR_I	wr	%r18, 0x1d27, %ccr
	.word 0x879023e6  ! 14: WRPR_TT_I	wrpr	%r0, 0x03e6, %tt
	.word 0x9ba0016c  ! 15: FABSq	dis not found

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
	.word 0x93414000  ! 16: RDPC	rd	%pc, %r9
mondo_4_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d91400c  ! 17: WRPR_WSTATE_R	wrpr	%r5, %r12, %wstate
	.word 0xab827568  ! 18: WR_CLEAR_SOFTINT_I	wr	%r9, 0x1568, %clear_softint
	.word 0x99902001  ! 19: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
cwp_4_9:
    set user_data_start, %o7
	.word 0x93902001  ! 20: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
cwp_4_10:
    set user_data_start, %o7
	.word 0x93902004  ! 21: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_4_11:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 22: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x879021b6  ! 23: WRPR_TT_I	wrpr	%r0, 0x01b6, %tt
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_12
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_12:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 24: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0xe727e431  ! 25: STF_I	st	%f19, [0x0431, %r31]
	.word 0xe6800bc0  ! 26: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r19
memptr_4_13:
	set 0x60540000, %r31
	.word 0x8584b96d  ! 27: WRCCR_I	wr	%r18, 0x196d, %ccr
	.word 0x94aac00d  ! 28: ANDNcc_R	andncc 	%r11, %r13, %r10
memptr_4_14:
	set 0x60140000, %r31
	.word 0x85807ace  ! 29: WRCCR_I	wr	%r1, 0x1ace, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 30: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4d804a0  ! 31: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	.word 0x87902058  ! 32: WRPR_TT_I	wrpr	%r0, 0x0058, %tt
splash_cmpr_4_15:
	setx 0xb80e0936beb61df8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916d23c4  ! 34: SDIVX_I	sdivx	%r20, 0x03c4, %r8
	.word 0xda8fe030  ! 35: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01974  ! 36: FqTOd	dis not found

	.word 0xd33fc000  ! 37: STDF_R	std	%f9, [%r0, %r31]
	.word 0xa2c07cfb  ! 38: ADDCcc_I	addccc 	%r1, 0xfffffcfb, %r17
cwp_4_18:
    set user_data_start, %o7
	.word 0x93902003  ! 39: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa784000a  ! 40: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r10, %-
	.word 0x87902025  ! 41: WRPR_TT_I	wrpr	%r0, 0x0025, %tt
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_20:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e002  ! 42: CASA_R	casa	[%r31] %asi, %r2, %r19
	.word 0x93a00173  ! 43: FABSq	dis not found

	.word 0xe44ff491  ! 44: LDSB_I	ldsb	[%r31 + 0xfffff491], %r18
debug_4_21:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_21:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_21
    nop
debug_wait4_21:
    ld [%r23], %r16
    brnz %r16, debug_wait4_21
    nop
    ba,a debug_startwait4_21
continue_debug_4_21:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_21:
    cmp %r13, %r15
    bne,a wait_for_stat_4_21
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_21:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_21
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 45: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
cwp_4_22:
    set user_data_start, %o7
	.word 0x93902002  ! 46: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97687bed  ! 47: SDIVX_I	sdivx	%r1, 0xfffffbed, %r11
intveclr_4_24:
	setx 0xd58f45584a5519f2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 48: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_4_25:
	setx 0x1ecb831b038dceed, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 49: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_26:
	setx 0xaddc93628fa3af04, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2e700001  ! 51: BPVS	<illegal instruction>
	.word 0xa9500000  ! 52: RDPR_TPC	<illegal instruction>
splash_cmpr_4_27:
	setx 0x627033e74edf1572, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 53: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802088  ! 54: WRASI_I	wr	%r0, 0x0088, %asi
splash_cmpr_4_28:
	setx 0x9e9155bed6f65f1e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_29:
	setx 0x241edb0b64cbe894, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 56: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 57: LDX_R	ldx	[%r31 + %r0], %r20
splash_cmpr_4_30:
	setx 0x6bc6a4896f5c8355, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe86fef00  ! 59: LDSTUB_I	ldstub	%r20, [%r31 + 0x0f00]
	.word 0x9f802970  ! 60: SIR	sir	0x0970
memptr_4_31:
	set 0x60540000, %r31
	.word 0x858529e1  ! 61: WRCCR_I	wr	%r20, 0x09e1, %ccr
debug_4_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 62: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_4_33:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 63: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_4_34:
	setx 0x58527b4cc3f74af7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 64: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_35:
	.word 0x81982d9e  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9e, %hpstate
	.word 0x8d903361  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x1361, %pstate
tagged_4_36:
	tsubcctv %r20, 0x18d6, %r19
	.word 0xe807e96a  ! 67: LDUW_I	lduw	[%r31 + 0x096a], %r20
splash_tba_4_37:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 68: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_38) + 16, 16, 16)) -> intp(0,0,18)
intvec_4_38:
	.word 0x39400001  ! 69: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_39:
	setx 0x3247814eaf20f30e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_40) + 0, 16, 16)) -> intp(4,0,27)
intvec_4_40:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_4_41:
	taddcctv %r24, 0x183e, %r8
	.word 0xe807e96a  ! 72: LDUW_I	lduw	[%r31 + 0x096a], %r20
	.word 0xa3454000  ! 73: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0xa9a289d0  ! 74: FDIVd	fdivd	%f10, %f16, %f20
	.word 0x95a149cd  ! 75: FDIVd	fdivd	%f36, %f44, %f10
mondo_4_42:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d924014  ! 76: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
	.word 0x91450000  ! 77: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0xd08008a0  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_43:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 79: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01967  ! 80: FqTOd	dis not found

intveclr_4_45:
	setx 0x8617e92b5d01bd1b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 81: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_46:
	setx 0x34f5d3e15c2165e8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 82: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_47:
	setx 0xcc0cc24946df4bbd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 83: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_4_48:
	set user_data_start, %r31
	.word 0x85827ad3  ! 84: WRCCR_I	wr	%r9, 0x1ad3, %ccr
	.word 0x8780208a  ! 85: WRASI_I	wr	%r0, 0x008a, %asi
	rd %pc, %r19
	add %r19, (ivw_4_49-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_49:
	.word 0x91950002  ! 86: WRPR_PIL_R	wrpr	%r20, %r2, %pil
splash_cmpr_4_50:
	setx 0xe98986acfd651490, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 87: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_4_51:
	setx 0xbe8e7c0eef276c35, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 88: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 89: BPN	<illegal instruction>
memptr_4_52:
	set 0x60140000, %r31
	.word 0x85812c6d  ! 90: WRCCR_I	wr	%r4, 0x0c6d, %ccr
	.word 0xe26ff0a9  ! 91: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff0a9]
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 92: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9b450000  ! 93: RD_SET_SOFTINT	rd	%set_softint, %r13
	.word 0xd08008a0  ! 94: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
memptr_4_53:
	set 0x60540000, %r31
	.word 0x8580fc18  ! 95: WRCCR_I	wr	%r3, 0x1c18, %ccr
	.word 0xd00ff3d6  ! 96: LDUB_I	ldub	[%r31 + 0xfffff3d6], %r8
	.word 0x87802004  ! 97: WRASI_I	wr	%r0, 0x0004, %asi
intveclr_4_54:
	setx 0xca51f56072c2ea45, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 98: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_55:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 99: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_4_56:
	setx 0x61e0014141769415, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_4_57:
    set user_data_start, %o7
	.word 0x93902005  ! 101: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 102: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_htba_4_58:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 103: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
donret_4_59:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_59-donret_4_59-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_59:
	.word 0xd0fff3d6  ! 104: SWAPA_I	swapa	%r8, [%r31 + 0xfffff3d6] %asi
debug_4_60:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_60:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_60
    nop
debug_wait4_60:
    ld [%r23], %r16
    brnz %r16, debug_wait4_60
    nop
    ba,a debug_startwait4_60
continue_debug_4_60:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_60:
    cmp %r13, %r15
    bne,a wait_for_stat_4_60
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_60:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_60
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe0f00492  ! 105: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0x87802014  ! 106: WRASI_I	wr	%r0, 0x0014, %asi
DS_4_61:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f22, %f30, %f30
	.word 0x99b28306  ! 107: ALIGNADDRESS	alignaddr	%r10, %r6, %r12
	.word 0xa0a8800a  ! 108: ANDNcc_R	andncc 	%r2, %r10, %r16
splash_hpstate_4_62:
	.word 0x81982196  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0196, %hpstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_63:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e002  ! 110: CASA_R	casa	[%r31] %asi, %r2, %r16
memptr_4_64:
	set 0x60740000, %r31
	.word 0x8580b619  ! 111: WRCCR_I	wr	%r2, 0x1619, %ccr
	.word 0xe0bfc020  ! 112: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	.word 0xe0800c40  ! 113: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r16
donret_4_65:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_65-donret_4_65-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_65:
	.word 0xe0ffeac5  ! 114: SWAPA_I	swapa	%r16, [%r31 + 0x0ac5] %asi
	.word 0xe06feac5  ! 115: LDSTUB_I	ldstub	%r16, [%r31 + 0x0ac5]
splash_cmpr_4_66:
	setx 0x495a17426d34464e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 116: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_4_67:
	set 0x60540000, %r31
	.word 0x8584286c  ! 117: WRCCR_I	wr	%r16, 0x086c, %ccr
splash_lsu_4_68:
	setx 0xa66a4cab0c09a071, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 118: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_4_69:
	nop
	setx 0xfffff3e6fffff9c1, %g1, %g7
	.word 0xa3800007  ! 119: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x34700001  ! 120: BPG	<illegal instruction>
	.word 0xe077c000  ! 121: STX_R	stx	%r16, [%r31 + %r0]
mondo_4_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d928012  ! 122: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
debug_4_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 123: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 124: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_4_72:
	setx 0x005d9c78e1fc5768, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 125: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_4_73:
	nop
	setx 0xfffffb0cfffff6af, %g1, %g7
	.word 0xa3800007  ! 126: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_4_74:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d92400c  ! 127: WRPR_WSTATE_R	wrpr	%r9, %r12, %wstate
	.word 0xa1902007  ! 128: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xe06ffdfd  ! 129: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffdfd]
	.word 0xe077fdfd  ! 130: STX_I	stx	%r16, [%r31 + 0xfffffdfd]
	.word 0x87902281  ! 131: WRPR_TT_I	wrpr	%r0, 0x0281, %tt
memptr_4_75:
	set user_data_start, %r31
	.word 0x85836101  ! 132: WRCCR_I	wr	%r13, 0x0101, %ccr
	.word 0x99500000  ! 133: RDPR_TPC	<illegal instruction>
	.word 0x879022c3  ! 134: WRPR_TT_I	wrpr	%r0, 0x02c3, %tt
	.word 0xd0d7e000  ! 135: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
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
	.word 0xa7414000  ! 136: RDPC	rd	%pc, %r19
	.word 0xd927c000  ! 137: STF_R	st	%f12, [%r0, %r31]
	.word 0xd88008a0  ! 138: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_cmpr_4_77:
	setx 0xe604ccaf335dbf75, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 139: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790231a  ! 140: WRPR_TT_I	wrpr	%r0, 0x031a, %tt
	.word 0xa190200b  ! 141: WRPR_GL_I	wrpr	%r0, 0x000b, %-
DS_4_78:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x9b5a9a2f	! Random illegal ?
	.word 0xa5a4c9cb  ! 1: FDIVd	fdivd	%f50, %f42, %f18
	.word 0x91a30834  ! 142: FADDs	fadds	%f12, %f20, %f8
	.word 0xa1902000  ! 143: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa5a00161  ! 144: FABSq	dis not found

splash_tba_4_79:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 145: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 146: LDX_R	ldx	[%r31 + %r0], %r17
mondo_4_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d908003  ! 147: WRPR_WSTATE_R	wrpr	%r2, %r3, %wstate
	.word 0xe2d004a0  ! 148: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
pmu_4_81:
	nop
	setx 0xffffff6dffffff37, %g1, %g7
	.word 0xa3800007  ! 149: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02034  ! 150: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe2800c40  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r17
	.word 0x91d02033  ! 152: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa190200e  ! 153: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d903904  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x1904, %pstate
	.word 0x9f803037  ! 155: SIR	sir	0x1037
splash_hpstate_4_82:
	.word 0x819820ce  ! 156: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00ce, %hpstate
	.word 0xe2cfe010  ! 157: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r17
tagged_4_83:
	taddcctv %r20, 0x16bf, %r9
	.word 0xe207e9ea  ! 158: LDUW_I	lduw	[%r31 + 0x09ea], %r17
cwp_4_84:
    set user_data_start, %o7
	.word 0x93902003  ! 159: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x83d02032  ! 160: Tcc_I	te	icc_or_xcc, %r0 + 50
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 161: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_4_85:
	.word 0x819827c4  ! 162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c4, %hpstate
	.word 0xe20fe9ea  ! 163: LDUB_I	ldub	[%r31 + 0x09ea], %r17
	.word 0xe2dfe000  ! 164: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r17
debug_4_86:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 165: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_4_87-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_87:
	.word 0x9190c000  ! 166: WRPR_PIL_R	wrpr	%r3, %r0, %pil
	.word 0xa1902004  ! 167: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xe26fe9ea  ! 168: LDSTUB_I	ldstub	%r17, [%r31 + 0x09ea]
splash_hpstate_4_88:
	.word 0x81982b55  ! 169: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b55, %hpstate
memptr_4_89:
	set 0x60140000, %r31
	.word 0x858425fe  ! 170: WRCCR_I	wr	%r16, 0x05fe, %ccr
	.word 0x81b01021  ! 171: SIAM	siam	1
splash_cmpr_4_90:
	setx 0x773adfab3d175082, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_91:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 173: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_4_92:
	setx 0x1c9f8e303d9a8d6d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 174: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 175: WRASI_I	wr	%r0, 0x001c, %asi
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
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00492  ! 176: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
splash_cmpr_4_94:
	setx 0x79fa66bc47b3b582, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_95:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d904001  ! 178: WRPR_WSTATE_R	wrpr	%r1, %r1, %wstate
	.word 0xe26fe0a3  ! 179: LDSTUB_I	ldstub	%r17, [%r31 + 0x00a3]
	.word 0x97a00165  ! 180: FABSq	dis not found

splash_tba_4_96:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 181: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa190200a  ! 182: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_tba_4_97:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 183: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_4_98:
    set user_data_start, %o7
	.word 0x93902007  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
mondo_4_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d928006  ! 185: WRPR_WSTATE_R	wrpr	%r10, %r6, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a0196c  ! 186: FqTOd	dis not found

intveclr_4_101:
	setx 0x1d67f3fa1856b217, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 187: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_4_102:
	set 0x00380000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r12
	.word 0x8b98000c  ! 188: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d802000  ! 189: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa190200c  ! 190: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xe127c000  ! 191: STF_R	st	%f16, [%r0, %r31]
	.word 0xe007c000  ! 192: LDUW_R	lduw	[%r31 + %r0], %r16
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_103:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 193: CASA_R	casa	[%r31] %asi, %r7, %r16
splash_cmpr_4_104:
	setx 0x2008297383134368, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 194: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 195: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa5450000  ! 196: RD_SET_SOFTINT	rd	%set_softint, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 197: LDX_R	ldx	[%r31 + %r0], %r8
DS_4_105:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x99b4030a  ! 198: ALIGNADDRESS	alignaddr	%r16, %r10, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 199: LDX_R	ldx	[%r31 + %r0], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 200: LDX_R	ldx	[%r31 + %r0], %r19
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 201: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_4_106:
	setx 0xa84e730e3dc3c826, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_107:
	setx 0x7a72bef071d9c11c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 203: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5a0016d  ! 204: FABSq	dis not found

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
	.word 0x99414000  ! 205: RDPC	rd	%pc, %r12
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 206: Tcc_R	te	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_109
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_109:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 207: RDPC	rd	%pc, %r12
	.word 0xe257c000  ! 208: LDSH_R	ldsh	[%r31 + %r0], %r17
	rd %pc, %r19
	add %r19, (ivw_4_110-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_110:
	.word 0x91948007  ! 209: WRPR_PIL_R	wrpr	%r18, %r7, %pil
DS_4_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa1b28309  ! 210: ALIGNADDRESS	alignaddr	%r10, %r9, %r16
	.word 0x8d802000  ! 211: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x97a0056d  ! 212: FSQRTq	fsqrt	
	.word 0xe4dfe020  ! 213: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_112)+0, 16, 16)) -> intp(4,1,3)
xir_4_112:
	.word 0xa9852c5b  ! 214: WR_SET_SOFTINT_I	wr	%r20, 0x0c5b, %set_softint
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 215: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_htba_4_113:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 216: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_114:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 217: CASA_R	casa	[%r31] %asi, %r18, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 218: LDX_R	ldx	[%r31 + %r0], %r18
debug_4_115:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 219: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe48008a0  ! 220: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa1902008  ! 221: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x22800001  ! 222: BE	be,a	<label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_116:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 223: CASA_R	casa	[%r31] %asi, %r18, %r18
	.word 0xe537c000  ! 224: STQF_R	-	%f18, [%r0, %r31]
change_to_randtl_4_117:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_117:
	.word 0x8f902002  ! 225: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x3e700001  ! 226: BPVC	<illegal instruction>
	.word 0xad832dde  ! 227: WR_SOFTINT_REG_I	wr	%r12, 0x0dde, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_118)+16, 16, 16)) -> intp(4,1,3)
xir_4_118:
	.word 0xa9802c53  ! 228: WR_SET_SOFTINT_I	wr	%r0, 0x0c53, %set_softint
	.word 0x8790206a  ! 229: WRPR_TT_I	wrpr	%r0, 0x006a, %tt
	.word 0xe45fe228  ! 230: LDX_I	ldx	[%r31 + 0x0228], %r18
	.word 0x879022a0  ! 231: WRPR_TT_I	wrpr	%r0, 0x02a0, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 232: LDX_R	ldx	[%r31 + %r0], %r18
debug_4_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 233: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_4_120:
	set user_data_start, %r31
	.word 0x8582b0ad  ! 234: WRCCR_I	wr	%r10, 0x10ad, %ccr
debug_4_121:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 235: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x24800001  ! 236: BLE	ble,a	<label_0x1>
	.word 0x22800001  ! 237: BE	be,a	<label_0x1>
DS_4_122:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 238: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_123
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_123
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_123:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 239: RDPC	rd	%pc, %r11
	.word 0x99500000  ! 240: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_124) + 56, 16, 16)) -> intp(5,0,0)
intvec_4_124:
	.word 0x39400001  ! 241: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd82fee48  ! 242: STB_I	stb	%r12, [%r31 + 0x0e48]
splash_cmpr_4_125:
	setx 0x39c23784e84050e7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936d2568  ! 244: SDIVX_I	sdivx	%r20, 0x0568, %r9
tagged_4_127:
	taddcctv %r10, 0x190c, %r19
	.word 0xd007fb03  ! 245: LDUW_I	lduw	[%r31 + 0xfffffb03], %r8
splash_lsu_4_128:
	setx 0x8c4f09dcd115766d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 246: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_4_129:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 247: SAVE_R	save	%r31, %r0, %r31
DS_4_130:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 248: RESTORE_R	restore	%r31, %r0, %r31
tagged_4_131:
	taddcctv %r19, 0x11c9, %r12
	.word 0xd007fb03  ! 249: LDUW_I	lduw	[%r31 + 0xfffffb03], %r8
	.word 0xd06ffb03  ! 250: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffb03]
	.word 0x8790228e  ! 251: WRPR_TT_I	wrpr	%r0, 0x028e, %tt
splash_cmpr_4_132:
	setx 0xaf99ac3608a5c971, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 252: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_133:
	setx 0x7b9ae40104e53323, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 254: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02035  ! 255: Tcc_I	ta	icc_or_xcc, %r0 + 53
intveclr_4_135:
	setx 0xccc07a1cf387188d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 256: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa484400a  ! 257: ADDcc_R	addcc 	%r17, %r10, %r18
	.word 0xd2cfe010  ! 258: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_136
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_136:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 259: RDPC	rd	%pc, %r13
	.word 0xd4d00e40  ! 260: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r10
cwp_4_137:
    set user_data_start, %o7
	.word 0x93902000  ! 261: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xab832117  ! 262: WR_CLEAR_SOFTINT_I	wr	%r12, 0x0117, %clear_softint
mondo_4_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d93400b  ! 263: WRPR_WSTATE_R	wrpr	%r13, %r11, %wstate
	.word 0x93d02032  ! 264: Tcc_I	tne	icc_or_xcc, %r0 + 50
debug_4_139:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 265: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd43fea6f  ! 266: STD_I	std	%r10, [%r31 + 0x0a6f]
	.word 0xd427ea6f  ! 267: STW_I	stw	%r10, [%r31 + 0x0a6f]
	.word 0x99902001  ! 268: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
DS_4_140:
	.word 0x99a149d4  ! 1: FDIVd	fdivd	%f36, %f20, %f12
	pdist %f30, %f22, %f24
	.word 0x99b08313  ! 269: ALIGNADDRESS	alignaddr	%r2, %r19, %r12
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_141
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_141
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_141:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 270: RDPC	rd	%pc, %r17
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 271: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_4_142:
	setx 0x6442f7e8fc326c82, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 272: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9ad370d1  ! 273: UMULcc_I	umulcc 	%r13, 0xfffff0d1, %r13
splash_cmpr_4_143:
	setx 0x8e398dcf59baadbe, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 274: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_4_144:
	set user_data_start, %r31
	.word 0x858076d2  ! 275: WRCCR_I	wr	%r1, 0x16d2, %ccr
	.word 0xa5a449c7  ! 276: FDIVd	fdivd	%f48, %f38, %f18
	setx 0x650360c7b6ce7480, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_145:
	.word 0x39400001  ! 277: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 278: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x9f803efa  ! 279: SIR	sir	0x1efa
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
	.word 0xd1e7e00d  ! 280: CASA_R	casa	[%r31] %asi, %r13, %r8
splash_tba_4_147:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x97a00160  ! 282: FABSq	dis not found

	.word 0x97b14fe6  ! 283: FONES	e	%f11
	.word 0xa5454000  ! 284: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
DS_4_148:
	.word 0x97a509cd  ! 1: FDIVd	fdivd	%f20, %f44, %f42
	.word 0xbfe7c000  ! 285: SAVE_R	save	%r31, %r0, %r31
DS_4_149:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xdb31c00c  ! 1: STQF_R	-	%f13, [%r12, %r7]
	normalw
	.word 0xa9458000  ! 286: RD_SOFTINT_REG	rd	%softint, %r20
pmu_4_150:
	nop
	setx 0xfffffaf4fffff7cc, %g1, %g7
	.word 0xa3800007  ! 287: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_4_151:
	setx 0x8087688982b56c2e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 288: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93464000  ! 289: RD_STICK_CMPR_REG	rd	%-, %r9
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 290: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_4_152:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d924010  ! 291: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
	.word 0x946c74e1  ! 292: UDIVX_I	udivx 	%r17, 0xfffff4e1, %r10
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_153:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e009  ! 293: CASA_R	casa	[%r31] %asi, %r9, %r8
	.word 0x99902005  ! 294: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x99520000  ! 295: RDPR_PIL	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01973  ! 296: FqTOd	dis not found

	.word 0x9f802640  ! 297: SIR	sir	0x0640
	.word 0xe69004a0  ! 298: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
splash_lsu_4_155:
	setx 0xbee798ba78bcf6a5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 299: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91540000  ! 300: RDPR_GL	<illegal instruction>
	.word 0x91d02035  ! 301: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_4_156:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_156:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_156
    nop
debug_wait4_156:
    ld [%r23], %r16
    brnz %r16, debug_wait4_156
    nop
    ba,a debug_startwait4_156
continue_debug_4_156:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_156:
    cmp %r13, %r15
    bne,a wait_for_stat_4_156
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_156:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_156
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %19, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00492  ! 302: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0xe69fe723  ! 303: LDDA_I	ldda	[%r31, + 0x0723] %asi, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9169a2e2  ! 304: SDIVX_I	sdivx	%r6, 0x02e2, %r8
splash_hpstate_4_158:
	.word 0x8198200c  ! 305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000c, %hpstate
splash_cmpr_4_159:
	setx 0x1b5d769008dec797, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_160:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 307: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_4_161:
	setx 0xaf39eac4b451b684, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 308: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_162:
	setx 0x70dfeb1cfb9d6099, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 309: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_163:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 310: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0xe86feafa  ! 311: LDSTUB_I	ldstub	%r20, [%r31 + 0x0afa]
	.word 0xe927c000  ! 312: STF_R	st	%f20, [%r0, %r31]
	.word 0xe88008a0  ! 313: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
debug_4_164:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 314: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_4_165:
	setx 0x94b302033b1fe65e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 315: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9848014  ! 316: WR_SET_SOFTINT_R	wr	%r18, %r20, %set_softint
	.word 0x91450000  ! 317: RD_SET_SOFTINT	rd	%set_softint, %r8
change_to_randtl_4_166:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_166:
	.word 0x8f902002  ! 318: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xab848014  ! 319: WR_CLEAR_SOFTINT_R	wr	%r18, %r20, %clear_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 320: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd527c000  ! 321: STF_R	st	%f10, [%r0, %r31]
change_to_randtl_4_167:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_167:
	.word 0x8f902002  ! 322: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
donret_4_168:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_168-donret_4_168), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_168:
	.word 0xd4ffeafa  ! 323: SWAPA_I	swapa	%r10, [%r31 + 0x0afa] %asi
	.word 0x94aa000c  ! 324: ANDNcc_R	andncc 	%r8, %r12, %r10
	.word 0x97454000  ! 325: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956afa79  ! 326: SDIVX_I	sdivx	%r11, 0xfffffa79, %r10
tagged_4_170:
	tsubcctv %r26, 0x1fab, %r20
	.word 0xe607e364  ! 327: LDUW_I	lduw	[%r31 + 0x0364], %r19
splash_hpstate_4_171:
	.word 0x8198282f  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x082f, %hpstate
	.word 0x8d802000  ! 329: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe71fc000  ! 330: LDDF_R	ldd	[%r31, %r0], %f19
splash_htba_4_172:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 331: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x94c27bf1  ! 332: ADDCcc_I	addccc 	%r9, 0xfffffbf1, %r10
memptr_4_173:
	set 0x60740000, %r31
	.word 0x8584a62d  ! 333: WRCCR_I	wr	%r18, 0x062d, %ccr
	.word 0xd53feb8f  ! 334: STDF_I	std	%f10, [0x0b8f, %r31]
	.word 0xa1902000  ! 335: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xd48fe010  ! 336: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0x87802055  ! 337: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916cace6  ! 338: SDIVX_I	sdivx	%r18, 0x0ce6, %r8
	setx 0x57329678f0130352, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_175:
	.word 0x39400001  ! 339: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_4_176:
    set user_data_start, %o7
	.word 0x93902001  ! 340: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd23ff4d5  ! 341: STD_I	std	%r9, [%r31 + 0xfffff4d5]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916b6961  ! 342: SDIVX_I	sdivx	%r13, 0x0961, %r8
	.word 0xd0d004a0  ! 343: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0xd00fc000  ! 344: LDUB_R	ldub	[%r31 + %r0], %r8
splash_tba_4_178:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 345: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd06ff250  ! 346: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff250]
DS_4_179:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe7314010  ! 1: STQF_R	-	%f19, [%r16, %r5]
	normalw
	.word 0x95458000  ! 347: RD_SOFTINT_REG	rd	%softint, %r10
intveclr_4_180:
	setx 0xb71c365fb9605dd2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 348: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6c004a0  ! 349: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 350: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_4_181:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 351: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_4_182:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 352: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa3520000  ! 353: RDPR_PIL	<illegal instruction>
	.word 0x8d802000  ! 354: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa784000d  ! 355: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r13, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 356: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe68008a0  ! 357: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x97480000  ! 358: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0x8d802000  ! 359: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd247c000  ! 360: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0xa1902005  ! 361: WRPR_GL_I	wrpr	%r0, 0x0005, %-
DS_4_184:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa7a289c0  ! 1: FDIVd	fdivd	%f10, %f0, %f50
	normalw
	.word 0xa3458000  ! 362: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01969  ! 363: FqTOd	dis not found

intveclr_4_186:
	setx 0xb5ae6611af7a8da0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_187:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 365: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802080  ! 366: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x87902220  ! 367: WRPR_TT_I	wrpr	%r0, 0x0220, %tt
splash_hpstate_4_188:
	.word 0x8198210e  ! 368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010e, %hpstate
	.word 0x24700001  ! 369: BPLE	<illegal instruction>
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
	.word 0x99414000  ! 370: RDPC	rd	%pc, %r12
	.word 0x8d903ac9  ! 371: WRPR_PSTATE_I	wrpr	%r0, 0x1ac9, %pstate
splash_hpstate_4_190:
	.word 0x81982b56  ! 372: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b56, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01964  ! 373: FqTOd	dis not found

	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 374: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 375: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_4_192:
	tsubcctv %r5, 0x1922, %r5
	.word 0xe207f250  ! 376: LDUW_I	lduw	[%r31 + 0xfffff250], %r17
	.word 0x9f8036a3  ! 377: SIR	sir	0x16a3
DS_4_193:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f12, %f30, %f28
	.word 0x93b1c308  ! 378: ALIGNADDRESS	alignaddr	%r7, %r8, %r9
splash_cmpr_4_194:
	setx 0x9459bf73e74319bd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 379: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0x99414000  ! 380: RDPC	rd	%pc, %r12
	.word 0xe2cfe030  ! 381: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r17
	.word 0xe327edb2  ! 382: STF_I	st	%f17, [0x0db2, %r31]
tagged_4_196:
	tsubcctv %r18, 0x1df7, %r9
	.word 0xe207edb2  ! 383: LDUW_I	lduw	[%r31 + 0x0db2], %r17
	setx 0xa5ac63e6773207ad, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_197:
	.word 0x39400001  ! 384: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 385: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x87802014  ! 386: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa7814013  ! 387: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r19, %-
	.word 0xa9a089c2  ! 388: FDIVd	fdivd	%f2, %f2, %f20
splash_lsu_4_199:
	setx 0x8eef18f3711c32e1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 389: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d914006  ! 390: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
splash_htba_4_201:
	set 0x00380000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r12
	.word 0x8b98000c  ! 391: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe137edb2  ! 392: STQF_I	-	%f16, [0x0db2, %r31]
	.word 0x8790230c  ! 393: WRPR_TT_I	wrpr	%r0, 0x030c, %tt
tagged_4_202:
	tsubcctv %r26, 0x1c2f, %r2
	.word 0xe007edb2  ! 394: LDUW_I	lduw	[%r31 + 0x0db2], %r16
	.word 0xe0d7e020  ! 395: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
debug_4_203:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 396: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 397: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_4_204:
	setx 0xc76bc976efdb118a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_205:
	setx 0x8e55189d27a13c1f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 400: BPNE	<illegal instruction>
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	.word 0xa190200d  ! 1: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd0c804a0  ! 2: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
	.word 0x93a4c9c9  ! 3: FDIVd	fdivd	%f50, %f40, %f40
pmu_3_0:
	nop
	setx 0xfffff1d3fffff844, %g1, %g7
	.word 0xa3800007  ! 4: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_3_1:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 5: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_2
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_2:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 6: RDPC	rd	%pc, %r13
intveclr_3_3:
	setx 0x97e4f68cf610c4ff, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_3_4:
	tsubcctv %r1, 0x18ec, %r16
	.word 0xe607e390  ! 8: LDUW_I	lduw	[%r31 + 0x0390], %r19
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_5:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e008  ! 9: CASA_R	casa	[%r31] %asi, %r8, %r19
	.word 0xad8431d3  ! 10: WR_SOFTINT_REG_I	wr	%r16, 0x11d3, %softint
	.word 0x8d902780  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x0780, %pstate
	.word 0x9950c000  ! 12: RDPR_TT	rdpr	%tt, %r12
memptr_3_6:
	set user_data_start, %r31
	.word 0x8582677d  ! 13: WRCCR_I	wr	%r9, 0x077d, %ccr
	.word 0x8790230d  ! 14: WRPR_TT_I	wrpr	%r0, 0x030d, %tt
	.word 0xa7a00174  ! 15: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_7
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_7:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 16: RDPC	rd	%pc, %r9
mondo_3_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d950004  ! 17: WRPR_WSTATE_R	wrpr	%r20, %r4, %wstate
	.word 0xab837b0f  ! 18: WR_CLEAR_SOFTINT_I	wr	%r13, 0x1b0f, %clear_softint
	.word 0x99902002  ! 19: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
cwp_3_9:
    set user_data_start, %o7
	.word 0x93902000  ! 20: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
cwp_3_10:
    set user_data_start, %o7
	.word 0x93902000  ! 21: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
debug_3_11:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 22: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x879021e5  ! 23: WRPR_TT_I	wrpr	%r0, 0x01e5, %tt
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_12
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_12:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 24: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0xe727e431  ! 25: STF_I	st	%f19, [0x0431, %r31]
	.word 0xe6800b60  ! 26: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r19
memptr_3_13:
	set 0x60540000, %r31
	.word 0x8581318b  ! 27: WRCCR_I	wr	%r4, 0x118b, %ccr
	.word 0x98a80004  ! 28: ANDNcc_R	andncc 	%r0, %r4, %r12
memptr_3_14:
	set 0x60540000, %r31
	.word 0x85822be6  ! 29: WRCCR_I	wr	%r8, 0x0be6, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 30: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4d804a0  ! 31: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	.word 0x879021a4  ! 32: WRPR_TT_I	wrpr	%r0, 0x01a4, %tt
splash_cmpr_3_15:
	setx 0xf20e1c15e201b1ee, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936c231f  ! 34: SDIVX_I	sdivx	%r16, 0x031f, %r9
	.word 0xda8fe000  ! 35: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01970  ! 36: FqTOd	dis not found

	.word 0xd33fc000  ! 37: STDF_R	std	%f9, [%r0, %r31]
	.word 0xa0c0b9bf  ! 38: ADDCcc_I	addccc 	%r2, 0xfffff9bf, %r16
cwp_3_18:
    set user_data_start, %o7
	.word 0x93902007  ! 39: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa7800012  ! 40: WR_GRAPHICS_STATUS_REG_R	wr	%r0, %r18, %-
	.word 0x87902110  ! 41: WRPR_TT_I	wrpr	%r0, 0x0110, %tt
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_20:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e002  ! 42: CASA_R	casa	[%r31] %asi, %r2, %r19
	.word 0x95a00170  ! 43: FABSq	dis not found

	.word 0xe44ff491  ! 44: LDSB_I	ldsb	[%r31 + 0xfffff491], %r18
debug_3_21:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 45: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
cwp_3_22:
    set user_data_start, %o7
	.word 0x93902005  ! 46: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916d225e  ! 47: SDIVX_I	sdivx	%r20, 0x025e, %r8
intveclr_3_24:
	setx 0xe6e1d86d046c2754, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 48: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_3_25:
	setx 0x1b61db0504a547f3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 49: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_26:
	setx 0xe81fbba1d290181a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2e700001  ! 51: BPVS	<illegal instruction>
	.word 0xa9500000  ! 52: RDPR_TPC	<illegal instruction>
splash_cmpr_3_27:
	setx 0x094f4dfd34069732, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 53: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780204f  ! 54: WRASI_I	wr	%r0, 0x004f, %asi
splash_cmpr_3_28:
	setx 0x3a481d6fa0109cb7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_29:
	setx 0xd107fea7f930e08a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 56: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 57: LDX_R	ldx	[%r31 + %r0], %r20
splash_cmpr_3_30:
	setx 0x12587a0e0da08eec, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe86fef00  ! 59: LDSTUB_I	ldstub	%r20, [%r31 + 0x0f00]
	.word 0x9f803fbb  ! 60: SIR	sir	0x1fbb
memptr_3_31:
	set 0x60740000, %r31
	.word 0x85852b50  ! 61: WRCCR_I	wr	%r20, 0x0b50, %ccr
debug_3_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 62: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_3_33:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 63: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_3_34:
	setx 0xde5f988bf2d18b0d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 64: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_3_35:
	.word 0x819828ce  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ce, %hpstate
	.word 0x8d902d43  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x0d43, %pstate
tagged_3_36:
	tsubcctv %r11, 0x1c45, %r22
	.word 0xe807e96a  ! 67: LDUW_I	lduw	[%r31 + 0x096a], %r20
splash_tba_3_37:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 68: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_38) + 24, 16, 16)) -> intp(2,0,22)
intvec_3_38:
	.word 0x39400001  ! 69: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_39:
	setx 0xe4ac9e7f11319627, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_40) + 24, 16, 16)) -> intp(0,0,9)
intvec_3_40:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_3_41:
	taddcctv %r26, 0x1064, %r16
	.word 0xe807e96a  ! 72: LDUW_I	lduw	[%r31 + 0x096a], %r20
	.word 0x95454000  ! 73: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	.word 0x9ba309ca  ! 74: FDIVd	fdivd	%f12, %f10, %f44
	.word 0x93a4c9cd  ! 75: FDIVd	fdivd	%f50, %f44, %f40
mondo_3_42:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d90c013  ! 76: WRPR_WSTATE_R	wrpr	%r3, %r19, %wstate
	.word 0x97450000  ! 77: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0xd08008a0  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_43:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 79: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01962  ! 80: FqTOd	dis not found

intveclr_3_45:
	setx 0xeb83510711947d8f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 81: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_46:
	setx 0x9afa8f9b9d5f90e8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 82: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_3_47:
	setx 0x4642badb07ea0d19, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 83: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_3_48:
	set user_data_start, %r31
	.word 0x8584b360  ! 84: WRCCR_I	wr	%r18, 0x1360, %ccr
	.word 0x87802016  ! 85: WRASI_I	wr	%r0, 0x0016, %asi
	rd %pc, %r19
	add %r19, (ivw_3_49-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_49:
	.word 0x91948005  ! 86: WRPR_PIL_R	wrpr	%r18, %r5, %pil
splash_cmpr_3_50:
	setx 0x16602f16776bd013, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 87: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_3_51:
	setx 0x36c08b93f3e532cd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 88: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 89: BPN	<illegal instruction>
memptr_3_52:
	set 0x60740000, %r31
	.word 0x8581f9e5  ! 90: WRCCR_I	wr	%r7, 0x19e5, %ccr
	.word 0xe26ff0a9  ! 91: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff0a9]
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 92: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97450000  ! 93: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0xd08008a0  ! 94: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
memptr_3_53:
	set 0x60140000, %r31
	.word 0x85836c49  ! 95: WRCCR_I	wr	%r13, 0x0c49, %ccr
	.word 0xd00ff3d6  ! 96: LDUB_I	ldub	[%r31 + 0xfffff3d6], %r8
	.word 0x87802004  ! 97: WRASI_I	wr	%r0, 0x0004, %asi
intveclr_3_54:
	setx 0x41fe8f547839bf76, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 98: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_3_55:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 99: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_3_56:
	setx 0x5cd2c006c1968bf7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_3_57:
    set user_data_start, %o7
	.word 0x93902006  ! 101: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 102: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_3_58:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 103: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
donret_3_59:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_59-donret_3_59-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_59:
	.word 0xd0fff3d6  ! 104: SWAPA_I	swapa	%r8, [%r31 + 0xfffff3d6] %asi
debug_3_60:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 105: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0x87802058  ! 106: WRASI_I	wr	%r0, 0x0058, %asi
DS_3_61:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f12, %f30, %f8
	.word 0x91b20312  ! 107: ALIGNADDRESS	alignaddr	%r8, %r18, %r8
	.word 0x90ad0014  ! 108: ANDNcc_R	andncc 	%r20, %r20, %r8
splash_hpstate_3_62:
	.word 0x81982106  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0106, %hpstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_63:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e002  ! 110: CASA_R	casa	[%r31] %asi, %r2, %r16
memptr_3_64:
	set 0x60740000, %r31
	.word 0x85853322  ! 111: WRCCR_I	wr	%r20, 0x1322, %ccr
	.word 0xe0bfc020  ! 112: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	.word 0xe0800c20  ! 113: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r16
donret_3_65:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_65-donret_3_65-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_65:
	.word 0xe0ffeac5  ! 114: SWAPA_I	swapa	%r16, [%r31 + 0x0ac5] %asi
	.word 0xe06feac5  ! 115: LDSTUB_I	ldstub	%r16, [%r31 + 0x0ac5]
splash_cmpr_3_66:
	setx 0x3cd83393f4f63bd4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 116: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_3_67:
	set 0x60140000, %r31
	.word 0x85812365  ! 117: WRCCR_I	wr	%r4, 0x0365, %ccr
splash_lsu_3_68:
	setx 0xcdd053d89a4465ff, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 118: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_3_69:
	nop
	setx 0xfffff10efffff4fb, %g1, %g7
	.word 0xa3800007  ! 119: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x34700001  ! 120: BPG	<illegal instruction>
	.word 0xe077c000  ! 121: STX_R	stx	%r16, [%r31 + %r0]
mondo_3_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d948013  ! 122: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
debug_3_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 123: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 124: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_3_72:
	setx 0xf147427fb08f6587, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 125: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_3_73:
	nop
	setx 0xfffffdfcffffff3b, %g1, %g7
	.word 0xa3800007  ! 126: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_3_74:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d94c014  ! 127: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0xa190200b  ! 128: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xe06ffdfd  ! 129: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffdfd]
	.word 0xe077fdfd  ! 130: STX_I	stx	%r16, [%r31 + 0xfffffdfd]
	.word 0x879022ec  ! 131: WRPR_TT_I	wrpr	%r0, 0x02ec, %tt
memptr_3_75:
	set user_data_start, %r31
	.word 0x85852cfa  ! 132: WRCCR_I	wr	%r20, 0x0cfa, %ccr
	.word 0x93500000  ! 133: RDPR_TPC	<illegal instruction>
	.word 0x87902193  ! 134: WRPR_TT_I	wrpr	%r0, 0x0193, %tt
	.word 0xd0d7e020  ! 135: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
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
	.word 0x95414000  ! 136: RDPC	rd	%pc, %r10
	.word 0xd927c000  ! 137: STF_R	st	%f12, [%r0, %r31]
	.word 0xd8800c20  ! 138: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r12
splash_cmpr_3_77:
	setx 0xde4596e98d467a3f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 139: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879021c4  ! 140: WRPR_TT_I	wrpr	%r0, 0x01c4, %tt
	.word 0xa1902004  ! 141: WRPR_GL_I	wrpr	%r0, 0x0004, %-
DS_3_78:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa75bab17	! Random illegal ?
	.word 0xa1a109c0  ! 1: FDIVd	fdivd	%f4, %f0, %f16
	.word 0x95a34823  ! 142: FADDs	fadds	%f13, %f3, %f10
	.word 0xa1902004  ! 143: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x97a00173  ! 144: FABSq	dis not found

splash_tba_3_79:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 145: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 146: LDX_R	ldx	[%r31 + %r0], %r17
mondo_3_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d918009  ! 147: WRPR_WSTATE_R	wrpr	%r6, %r9, %wstate
	.word 0xe2d004a0  ! 148: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
pmu_3_81:
	nop
	setx 0xfffff0a2fffffc9b, %g1, %g7
	.word 0xa3800007  ! 149: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02032  ! 150: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe28008a0  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x91d02035  ! 152: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902002  ! 153: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d902d90  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x0d90, %pstate
	.word 0x9f802d52  ! 155: SIR	sir	0x0d52
splash_hpstate_3_82:
	.word 0x81982915  ! 156: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0915, %hpstate
	.word 0xe2cfe020  ! 157: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r17
tagged_3_83:
	taddcctv %r25, 0x1c74, %r10
	.word 0xe207e9ea  ! 158: LDUW_I	lduw	[%r31 + 0x09ea], %r17
cwp_3_84:
    set user_data_start, %o7
	.word 0x93902002  ! 159: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91d02033  ! 160: Tcc_I	ta	icc_or_xcc, %r0 + 51
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 161: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_3_85:
	.word 0x81982d0c  ! 162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0c, %hpstate
	.word 0xe20fe9ea  ! 163: LDUB_I	ldub	[%r31 + 0x09ea], %r17
	.word 0xe2dfe020  ! 164: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r17
debug_3_86:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 165: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_3_87-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_87:
	.word 0x91918011  ! 166: WRPR_PIL_R	wrpr	%r6, %r17, %pil
	.word 0xa1902009  ! 167: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xe26fe9ea  ! 168: LDSTUB_I	ldstub	%r17, [%r31 + 0x09ea]
splash_hpstate_3_88:
	.word 0x8198224d  ! 169: WRHPR_HPSTATE_I	wrhpr	%r0, 0x024d, %hpstate
memptr_3_89:
	set 0x60340000, %r31
	.word 0x8580aeb8  ! 170: WRCCR_I	wr	%r2, 0x0eb8, %ccr
	.word 0x81b01021  ! 171: SIAM	siam	1
splash_cmpr_3_90:
	setx 0xa0bb22f74901628f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_91:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 173: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_3_92:
	setx 0x859c5ce90ca3abc9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 174: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 175: WRASI_I	wr	%r0, 0x0014, %asi
debug_3_93:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 176: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
splash_cmpr_3_94:
	setx 0xa22aa18c2f3f4111, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_3_95:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d920000  ! 178: WRPR_WSTATE_R	wrpr	%r8, %r0, %wstate
	.word 0xe26fe0a3  ! 179: LDSTUB_I	ldstub	%r17, [%r31 + 0x00a3]
	.word 0xa1a00168  ! 180: FABSq	dis not found

splash_tba_3_96:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 181: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa190200d  ! 182: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_tba_3_97:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 183: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_3_98:
    set user_data_start, %o7
	.word 0x93902006  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_3_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d908009  ! 185: WRPR_WSTATE_R	wrpr	%r2, %r9, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01969  ! 186: FqTOd	dis not found

intveclr_3_101:
	setx 0x6d17417d3daae0c0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 187: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_3_102:
	set 0x00390000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x00390000, %r12
	.word 0x8b98000c  ! 188: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d802000  ! 189: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902002  ! 190: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xe127c000  ! 191: STF_R	st	%f16, [%r0, %r31]
	.word 0xe007c000  ! 192: LDUW_R	lduw	[%r31 + %r0], %r16
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_103:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 193: CASA_R	casa	[%r31] %asi, %r7, %r16
splash_cmpr_3_104:
	setx 0x319fd9d5abd3a977, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 194: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 195: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93450000  ! 196: RD_SET_SOFTINT	rd	%set_softint, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 197: LDX_R	ldx	[%r31 + %r0], %r8
DS_3_105:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa3b10305  ! 198: ALIGNADDRESS	alignaddr	%r4, %r5, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 199: LDX_R	ldx	[%r31 + %r0], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 200: LDX_R	ldx	[%r31 + %r0], %r19
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 201: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_3_106:
	setx 0x95c75c22a301a483, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_107:
	setx 0xe15c0807ec6b49fd, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 203: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1a00161  ! 204: FABSq	dis not found

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
	.word 0xa7414000  ! 205: RDPC	rd	%pc, %r19
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 206: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_109
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_109:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 207: RDPC	rd	%pc, %r18
	.word 0xe257c000  ! 208: LDSH_R	ldsh	[%r31 + %r0], %r17
	rd %pc, %r19
	add %r19, (ivw_3_110-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_110:
	.word 0x91928005  ! 209: WRPR_PIL_R	wrpr	%r10, %r5, %pil
DS_3_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x97b4c312  ! 210: ALIGNADDRESS	alignaddr	%r19, %r18, %r11
	.word 0x8d802000  ! 211: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1a00561  ! 212: FSQRTq	fsqrt	
	.word 0xe4dfe030  ! 213: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_112)+24, 16, 16)) -> intp(3,1,3)
xir_3_112:
	.word 0xa980fc6a  ! 214: WR_SET_SOFTINT_I	wr	%r3, 0x1c6a, %set_softint
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 215: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_3_113:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 216: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_114:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 217: CASA_R	casa	[%r31] %asi, %r18, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 218: LDX_R	ldx	[%r31 + %r0], %r18
debug_3_115:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 219: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe48008a0  ! 220: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa1902002  ! 221: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x22800001  ! 222: BE	be,a	<label_0x1>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_116:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 223: CASA_R	casa	[%r31] %asi, %r18, %r18
	.word 0xe537c000  ! 224: STQF_R	-	%f18, [%r0, %r31]
change_to_randtl_3_117:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_117:
	.word 0x8f902001  ! 225: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x3e700001  ! 226: BPVC	<illegal instruction>
	.word 0xad827322  ! 227: WR_SOFTINT_REG_I	wr	%r9, 0x1322, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_118)+24, 16, 16)) -> intp(3,1,3)
xir_3_118:
	.word 0xa9802d9a  ! 228: WR_SET_SOFTINT_I	wr	%r0, 0x0d9a, %set_softint
	.word 0x87902070  ! 229: WRPR_TT_I	wrpr	%r0, 0x0070, %tt
	.word 0xe45fe228  ! 230: LDX_I	ldx	[%r31 + 0x0228], %r18
	.word 0x8790208b  ! 231: WRPR_TT_I	wrpr	%r0, 0x008b, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 232: LDX_R	ldx	[%r31 + %r0], %r18
debug_3_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 233: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_3_120:
	set user_data_start, %r31
	.word 0x8584b5b2  ! 234: WRCCR_I	wr	%r18, 0x15b2, %ccr
debug_3_121:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 235: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x24800001  ! 236: BLE	ble,a	<label_0x1>
	.word 0x22800001  ! 237: BE	be,a	<label_0x1>
DS_3_122:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 238: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_123
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_123
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_123:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 239: RDPC	rd	%pc, %r17
	.word 0xa7500000  ! 240: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_124) + 24, 16, 16)) -> intp(5,0,0)
intvec_3_124:
	.word 0x39400001  ! 241: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd82fee48  ! 242: STB_I	stb	%r12, [%r31 + 0x0e48]
splash_cmpr_3_125:
	setx 0x4cf6bfd729219d5f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56cbca7  ! 244: SDIVX_I	sdivx	%r18, 0xfffffca7, %r18
tagged_3_127:
	taddcctv %r5, 0x1dcc, %r22
	.word 0xd007fb03  ! 245: LDUW_I	lduw	[%r31 + 0xfffffb03], %r8
splash_lsu_3_128:
	setx 0xfa9718b6fa1d1ab3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 246: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_3_129:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 247: SAVE_R	save	%r31, %r0, %r31
DS_3_130:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 248: RESTORE_R	restore	%r31, %r0, %r31
tagged_3_131:
	taddcctv %r11, 0x12ed, %r1
	.word 0xd007fb03  ! 249: LDUW_I	lduw	[%r31 + 0xfffffb03], %r8
	.word 0xd06ffb03  ! 250: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffb03]
	.word 0x87902307  ! 251: WRPR_TT_I	wrpr	%r0, 0x0307, %tt
splash_cmpr_3_132:
	setx 0x4fd15748cb4f7bd9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 252: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_133:
	setx 0x29d2fda2c2b33bc7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 254: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x83d02032  ! 255: Tcc_I	te	icc_or_xcc, %r0 + 50
intveclr_3_135:
	setx 0xa93ba01cb8b2f2ec, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 256: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa682c014  ! 257: ADDcc_R	addcc 	%r11, %r20, %r19
	.word 0xd2cfe020  ! 258: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r9
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_136
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_136:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 259: RDPC	rd	%pc, %r12
	.word 0xd4d00e80  ! 260: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r10
cwp_3_137:
    set user_data_start, %o7
	.word 0x93902006  ! 261: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xab81a5d6  ! 262: WR_CLEAR_SOFTINT_I	wr	%r6, 0x05d6, %clear_softint
mondo_3_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d950014  ! 263: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	.word 0x93d020b5  ! 264: Tcc_I	tne	icc_or_xcc, %r0 + 181
debug_3_139:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 265: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd43fea6f  ! 266: STD_I	std	%r10, [%r31 + 0x0a6f]
	.word 0xd427ea6f  ! 267: STW_I	stw	%r10, [%r31 + 0x0a6f]
	.word 0x99902005  ! 268: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
DS_3_140:
	.word 0x95a449c7  ! 1: FDIVd	fdivd	%f48, %f38, %f10
	pdist %f24, %f14, %f26
	.word 0x95b0c312  ! 269: ALIGNADDRESS	alignaddr	%r3, %r18, %r10
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_141
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_141
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_141:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 270: RDPC	rd	%pc, %r12
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 271: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_3_142:
	setx 0x7fc0a59e3d1f031f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 272: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa6d526f4  ! 273: UMULcc_I	umulcc 	%r20, 0x06f4, %r19
splash_cmpr_3_143:
	setx 0x2b5a070fea3ad1b8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 274: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_3_144:
	set user_data_start, %r31
	.word 0x8584794a  ! 275: WRCCR_I	wr	%r17, 0x194a, %ccr
	.word 0x93a1c9c2  ! 276: FDIVd	fdivd	%f38, %f2, %f40
	setx 0xc16486a63dfc2ab5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_145:
	.word 0x39400001  ! 277: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802055  ! 278: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x9f80240b  ! 279: SIR	sir	0x040b
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
	.word 0xd1e7e00d  ! 280: CASA_R	casa	[%r31] %asi, %r13, %r8
splash_tba_3_147:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa3a00160  ! 282: FABSq	dis not found

	.word 0xa9b0cfe5  ! 283: FONES	e	%f20
	.word 0xa3454000  ! 284: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
DS_3_148:
	.word 0x91a209d2  ! 1: FDIVd	fdivd	%f8, %f18, %f8
	.word 0xbfe7c000  ! 285: SAVE_R	save	%r31, %r0, %r31
DS_3_149:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe9330013  ! 1: STQF_R	-	%f20, [%r19, %r12]
	normalw
	.word 0x9b458000  ! 286: RD_SOFTINT_REG	rd	%softint, %r13
pmu_3_150:
	nop
	setx 0xfffff4d7fffff6d3, %g1, %g7
	.word 0xa3800007  ! 287: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_3_151:
	setx 0xca0795f691e239f3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 288: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1464000  ! 289: RD_STICK_CMPR_REG	rd	%-, %r16
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 290: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_3_152:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d92c008  ! 291: WRPR_WSTATE_R	wrpr	%r11, %r8, %wstate
	.word 0x9669eeee  ! 292: UDIVX_I	udivx 	%r7, 0x0eee, %r11
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_153:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e009  ! 293: CASA_R	casa	[%r31] %asi, %r9, %r8
	.word 0x99902004  ! 294: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xa5520000  ! 295: RDPR_PIL	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01961  ! 296: FqTOd	dis not found

	.word 0x9f8031ab  ! 297: SIR	sir	0x11ab
	.word 0xe69004a0  ! 298: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
splash_lsu_3_155:
	setx 0x3b2497526d089275, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 299: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9b540000  ! 300: RDPR_GL	<illegal instruction>
	.word 0x91d02033  ! 301: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_3_156:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 302: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0xe69fe723  ! 303: LDDA_I	ldda	[%r31, + 0x0723] %asi, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996a3d06  ! 304: SDIVX_I	sdivx	%r8, 0xfffffd06, %r12
splash_hpstate_3_158:
	.word 0x819826c4  ! 305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c4, %hpstate
splash_cmpr_3_159:
	setx 0x6d4603a21db75b20, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_160:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 307: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_3_161:
	setx 0xb3bd4c6827e21955, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 308: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_3_162:
	setx 0xba7b8a4862c14514, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 309: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_163:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 310: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0xe86feafa  ! 311: LDSTUB_I	ldstub	%r20, [%r31 + 0x0afa]
	.word 0xe927c000  ! 312: STF_R	st	%f20, [%r0, %r31]
	.word 0xe88008a0  ! 313: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
debug_3_164:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 314: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_3_165:
	setx 0xcc16e308bb4279da, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 315: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa984800a  ! 316: WR_SET_SOFTINT_R	wr	%r18, %r10, %set_softint
	.word 0x93450000  ! 317: RD_SET_SOFTINT	rd	%set_softint, %r9
change_to_randtl_3_166:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_166:
	.word 0x8f902001  ! 318: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xab84000b  ! 319: WR_CLEAR_SOFTINT_R	wr	%r16, %r11, %clear_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 320: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd527c000  ! 321: STF_R	st	%f10, [%r0, %r31]
change_to_randtl_3_167:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_167:
	.word 0x8f902002  ! 322: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
donret_3_168:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_168-donret_3_168), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_168:
	.word 0xd4ffeafa  ! 323: SWAPA_I	swapa	%r10, [%r31 + 0x0afa] %asi
	.word 0x96aa0008  ! 324: ANDNcc_R	andncc 	%r8, %r8, %r11
	.word 0xa5454000  ! 325: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996ce4a7  ! 326: SDIVX_I	sdivx	%r19, 0x04a7, %r12
tagged_3_170:
	tsubcctv %r8, 0x1556, %r11
	.word 0xe607e364  ! 327: LDUW_I	lduw	[%r31 + 0x0364], %r19
splash_hpstate_3_171:
	.word 0x819823cd  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03cd, %hpstate
	.word 0x8d802000  ! 329: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe71fc000  ! 330: LDDF_R	ldd	[%r31, %r0], %f19
splash_htba_3_172:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 331: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x96c43a2c  ! 332: ADDCcc_I	addccc 	%r16, 0xfffffa2c, %r11
memptr_3_173:
	set 0x60740000, %r31
	.word 0x8581e73b  ! 333: WRCCR_I	wr	%r7, 0x073b, %ccr
	.word 0xd53feb8f  ! 334: STDF_I	std	%f10, [0x0b8f, %r31]
	.word 0xa190200c  ! 335: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xd48fe010  ! 336: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0x8780208a  ! 337: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996d3c33  ! 338: SDIVX_I	sdivx	%r20, 0xfffffc33, %r12
	setx 0x76631cbf08fbd812, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_175:
	.word 0x39400001  ! 339: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_3_176:
    set user_data_start, %o7
	.word 0x93902004  ! 340: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd23ff4d5  ! 341: STD_I	std	%r9, [%r31 + 0xfffff4d5]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976cb13f  ! 342: SDIVX_I	sdivx	%r18, 0xfffff13f, %r11
	.word 0xd0d004a0  ! 343: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0xd00fc000  ! 344: LDUB_R	ldub	[%r31 + %r0], %r8
splash_tba_3_178:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 345: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd06ff250  ! 346: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff250]
DS_3_179:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd9330005  ! 1: STQF_R	-	%f12, [%r5, %r12]
	normalw
	.word 0x95458000  ! 347: RD_SOFTINT_REG	rd	%softint, %r10
intveclr_3_180:
	setx 0x0ea88d0730453042, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 348: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6c004a0  ! 349: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 350: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_3_181:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 351: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_3_182:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 352: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x97520000  ! 353: RDPR_PIL	<illegal instruction>
	.word 0x8d802000  ! 354: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa7808007  ! 355: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 356: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe6800b80  ! 357: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r19
	.word 0x93480000  ! 358: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x8d802004  ! 359: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd247c000  ! 360: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0xa1902000  ! 361: WRPR_GL_I	wrpr	%r0, 0x0000, %-
DS_3_184:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa9a489ca  ! 1: FDIVd	fdivd	%f18, %f10, %f20
	normalw
	.word 0x99458000  ! 362: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01960  ! 363: FqTOd	dis not found

intveclr_3_186:
	setx 0x1bfcc8b122a702fe, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_3_187:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 365: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802088  ! 366: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x879021c0  ! 367: WRPR_TT_I	wrpr	%r0, 0x01c0, %tt
splash_hpstate_3_188:
	.word 0x81982f4e  ! 368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4e, %hpstate
	.word 0x24700001  ! 369: BPLE	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_189:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 370: RDPC	rd	%pc, %r8
	.word 0x8d902fac  ! 371: WRPR_PSTATE_I	wrpr	%r0, 0x0fac, %pstate
splash_hpstate_3_190:
	.word 0x8198261e  ! 372: WRHPR_HPSTATE_I	wrhpr	%r0, 0x061e, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01970  ! 373: FqTOd	dis not found

	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 374: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 375: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_3_192:
	tsubcctv %r24, 0x1700, %r26
	.word 0xe207f250  ! 376: LDUW_I	lduw	[%r31 + 0xfffff250], %r17
	.word 0x9f803f0e  ! 377: SIR	sir	0x1f0e
DS_3_193:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f30, %f12, %f28
	.word 0x93b00312  ! 378: ALIGNADDRESS	alignaddr	%r0, %r18, %r9
splash_cmpr_3_194:
	setx 0xd462d14aeca40264, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 379: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xa3414000  ! 380: RDPC	rd	%pc, %r17
	.word 0xe2cfe000  ! 381: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r17
	.word 0xe327edb2  ! 382: STF_I	st	%f17, [0x0db2, %r31]
tagged_3_196:
	tsubcctv %r16, 0x157d, %r1
	.word 0xe207edb2  ! 383: LDUW_I	lduw	[%r31 + 0x0db2], %r17
	setx 0x779eba4ca36c7684, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_197:
	.word 0x39400001  ! 384: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 385: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x87802080  ! 386: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa7808003  ! 387: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r3, %-
	.word 0x93a509cc  ! 388: FDIVd	fdivd	%f20, %f12, %f40
splash_lsu_3_199:
	setx 0xd539ca04bb1e3cfd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 389: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_3_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d944004  ! 390: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
splash_htba_3_201:
	set 0x00390000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00390000, %r12
	.word 0x8b98000c  ! 391: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe137edb2  ! 392: STQF_I	-	%f16, [0x0db2, %r31]
	.word 0x87902194  ! 393: WRPR_TT_I	wrpr	%r0, 0x0194, %tt
tagged_3_202:
	tsubcctv %r1, 0x16cc, %r14
	.word 0xe007edb2  ! 394: LDUW_I	lduw	[%r31 + 0x0db2], %r16
	.word 0xe0d7e030  ! 395: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
debug_3_203:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 396: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 397: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_3_204:
	setx 0x468911211460daa6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_205:
	setx 0x5f803c8da0533b1e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 400: BPNE	<illegal instruction>
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	.word 0xa190200d  ! 1: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd0c80e40  ! 2: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r8
	.word 0x95a509c1  ! 3: FDIVd	fdivd	%f20, %f32, %f10
pmu_2_0:
	nop
	setx 0xfffff467fffffb40, %g1, %g7
	.word 0xa3800007  ! 4: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_2_1:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 5: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_2
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_2:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 6: RDPC	rd	%pc, %r19
intveclr_2_3:
	setx 0x8c4b586872406cf1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_2_4:
	tsubcctv %r4, 0x1ec5, %r3
	.word 0xe607e390  ! 8: LDUW_I	lduw	[%r31 + 0x0390], %r19
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_5:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e008  ! 9: CASA_R	casa	[%r31] %asi, %r8, %r19
	.word 0xad80b8a3  ! 10: WR_SOFTINT_REG_I	wr	%r2, 0x18a3, %softint
	.word 0x8d903f2f  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x1f2f, %pstate
	.word 0x9750c000  ! 12: RDPR_TT	rdpr	%tt, %r11
memptr_2_6:
	set user_data_start, %r31
	.word 0x8584f7e2  ! 13: WRCCR_I	wr	%r19, 0x17e2, %ccr
	.word 0x87902257  ! 14: WRPR_TT_I	wrpr	%r0, 0x0257, %tt
	.word 0x93a00163  ! 15: FABSq	dis not found

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
	.word 0x91414000  ! 16: RDPC	rd	%pc, %r8
mondo_2_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d944014  ! 17: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0xab80ff5f  ! 18: WR_CLEAR_SOFTINT_I	wr	%r3, 0x1f5f, %clear_softint
	.word 0x99902003  ! 19: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
cwp_2_9:
    set user_data_start, %o7
	.word 0x93902002  ! 20: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
cwp_2_10:
    set user_data_start, %o7
	.word 0x93902000  ! 21: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
debug_2_11:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 22: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8790215e  ! 23: WRPR_TT_I	wrpr	%r0, 0x015e, %tt
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_12
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_12:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 24: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0xe727e431  ! 25: STF_I	st	%f19, [0x0431, %r31]
	.word 0xe68008a0  ! 26: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
memptr_2_13:
	set 0x60140000, %r31
	.word 0x858236fc  ! 27: WRCCR_I	wr	%r8, 0x16fc, %ccr
	.word 0x94aa4005  ! 28: ANDNcc_R	andncc 	%r9, %r5, %r10
memptr_2_14:
	set 0x60140000, %r31
	.word 0x8584b17d  ! 29: WRCCR_I	wr	%r18, 0x117d, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 30: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4d804a0  ! 31: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	.word 0x879020d7  ! 32: WRPR_TT_I	wrpr	%r0, 0x00d7, %tt
splash_cmpr_2_15:
	setx 0x5e5676cb09514715, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99696cbc  ! 34: SDIVX_I	sdivx	%r5, 0x0cbc, %r12
	.word 0xda8fe000  ! 35: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01974  ! 36: FqTOd	dis not found

	.word 0xd33fc000  ! 37: STDF_R	std	%f9, [%r0, %r31]
	.word 0x94c4a347  ! 38: ADDCcc_I	addccc 	%r18, 0x0347, %r10
cwp_2_18:
    set user_data_start, %o7
	.word 0x93902007  ! 39: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa784c012  ! 40: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r18, %-
	.word 0x87902157  ! 41: WRPR_TT_I	wrpr	%r0, 0x0157, %tt
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_20:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e002  ! 42: CASA_R	casa	[%r31] %asi, %r2, %r19
	.word 0x93a00172  ! 43: FABSq	dis not found

	.word 0xe44ff491  ! 44: LDSB_I	ldsb	[%r31 + 0xfffff491], %r18
debug_2_21:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 45: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
cwp_2_22:
    set user_data_start, %o7
	.word 0x93902000  ! 46: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996c73e7  ! 47: SDIVX_I	sdivx	%r17, 0xfffff3e7, %r12
intveclr_2_24:
	setx 0x0956a7dd5ea8a99e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 48: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_2_25:
	setx 0x4bfad067b4dba65d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 49: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_26:
	setx 0x7f549c0fd619595c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2e700001  ! 51: BPVS	<illegal instruction>
	.word 0xa7500000  ! 52: RDPR_TPC	<illegal instruction>
splash_cmpr_2_27:
	setx 0x0017ce598f67870e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 53: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780208b  ! 54: WRASI_I	wr	%r0, 0x008b, %asi
splash_cmpr_2_28:
	setx 0x2e30a201a680bbee, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_29:
	setx 0x0796d64993a42341, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 56: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 57: LDX_R	ldx	[%r31 + %r0], %r20
splash_cmpr_2_30:
	setx 0xb071e9104cbf3e7d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe86fef00  ! 59: LDSTUB_I	ldstub	%r20, [%r31 + 0x0f00]
	.word 0x9f803ff8  ! 60: SIR	sir	0x1ff8
memptr_2_31:
	set 0x60740000, %r31
	.word 0x85847848  ! 61: WRCCR_I	wr	%r17, 0x1848, %ccr
debug_2_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 62: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_2_33:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 63: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_2_34:
	setx 0x40dbd1f17a8325cb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 64: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_35:
	.word 0x81982857  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0857, %hpstate
	.word 0x8d90295f  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x095f, %pstate
tagged_2_36:
	tsubcctv %r17, 0x1f64, %r12
	.word 0xe807e96a  ! 67: LDUW_I	lduw	[%r31 + 0x096a], %r20
splash_tba_2_37:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 68: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_38) + 8, 16, 16)) -> intp(6,0,10)
intvec_2_38:
	.word 0x39400001  ! 69: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_39:
	setx 0xb9eeb067e573688c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_40) + 16, 16, 16)) -> intp(0,0,17)
intvec_2_40:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_2_41:
	taddcctv %r13, 0x145d, %r22
	.word 0xe807e96a  ! 72: LDUW_I	lduw	[%r31 + 0x096a], %r20
	.word 0x9b454000  ! 73: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	.word 0xa3a349c8  ! 74: FDIVd	fdivd	%f44, %f8, %f48
	.word 0x99a489cb  ! 75: FDIVd	fdivd	%f18, %f42, %f12
mondo_2_42:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d94800c  ! 76: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
	.word 0x93450000  ! 77: RD_SET_SOFTINT	rd	%set_softint, %r9
	.word 0xd08008a0  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_43:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 79: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01971  ! 80: FqTOd	dis not found

intveclr_2_45:
	setx 0xbe3da91a7846e190, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 81: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_46:
	setx 0x2709edca0bdd15ae, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 82: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_47:
	setx 0x5ae827f888bb599b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 83: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_2_48:
	set user_data_start, %r31
	.word 0x8580f424  ! 84: WRCCR_I	wr	%r3, 0x1424, %ccr
	.word 0x87802004  ! 85: WRASI_I	wr	%r0, 0x0004, %asi
	rd %pc, %r19
	add %r19, (ivw_2_49-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_49:
	.word 0x91940007  ! 86: WRPR_PIL_R	wrpr	%r16, %r7, %pil
splash_cmpr_2_50:
	setx 0x233892b9df940d7d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 87: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_2_51:
	setx 0x4367caac527a7611, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 88: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 89: BPN	<illegal instruction>
memptr_2_52:
	set 0x60140000, %r31
	.word 0x85853eea  ! 90: WRCCR_I	wr	%r20, 0x1eea, %ccr
	.word 0xe26ff0a9  ! 91: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff0a9]
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 92: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97450000  ! 93: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0xd08008a0  ! 94: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
memptr_2_53:
	set 0x60540000, %r31
	.word 0x8582a1c6  ! 95: WRCCR_I	wr	%r10, 0x01c6, %ccr
	.word 0xd00ff3d6  ! 96: LDUB_I	ldub	[%r31 + 0xfffff3d6], %r8
	.word 0x87802055  ! 97: WRASI_I	wr	%r0, 0x0055, %asi
intveclr_2_54:
	setx 0x49be0f6a5f767d96, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 98: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_55:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 99: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_2_56:
	setx 0x3a18e070765f9937, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_2_57:
    set user_data_start, %o7
	.word 0x93902002  ! 101: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 102: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_htba_2_58:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 103: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
donret_2_59:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_59-donret_2_59-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_59:
	.word 0xd0fff3d6  ! 104: SWAPA_I	swapa	%r8, [%r31 + 0xfffff3d6] %asi
debug_2_60:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 105: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0x87802088  ! 106: WRASI_I	wr	%r0, 0x0088, %asi
DS_2_61:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f14, %f22, %f6
	.word 0x91b2c301  ! 107: ALIGNADDRESS	alignaddr	%r11, %r1, %r8
	.word 0x90ac800c  ! 108: ANDNcc_R	andncc 	%r18, %r12, %r8
splash_hpstate_2_62:
	.word 0x81982dcc  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dcc, %hpstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_63:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e002  ! 110: CASA_R	casa	[%r31] %asi, %r2, %r16
memptr_2_64:
	set 0x60340000, %r31
	.word 0x85816009  ! 111: WRCCR_I	wr	%r5, 0x0009, %ccr
	.word 0xe0bfc020  ! 112: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	.word 0xe0800b40  ! 113: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r16
donret_2_65:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_65-donret_2_65-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_65:
	.word 0xe0ffeac5  ! 114: SWAPA_I	swapa	%r16, [%r31 + 0x0ac5] %asi
	.word 0xe06feac5  ! 115: LDSTUB_I	ldstub	%r16, [%r31 + 0x0ac5]
splash_cmpr_2_66:
	setx 0x4d92389f937c18f4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 116: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_2_67:
	set 0x60740000, %r31
	.word 0x8581a40c  ! 117: WRCCR_I	wr	%r6, 0x040c, %ccr
splash_lsu_2_68:
	setx 0x9cf88df04690c159, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 118: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_2_69:
	nop
	setx 0xffffff10fffffd0f, %g1, %g7
	.word 0xa3800007  ! 119: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x34700001  ! 120: BPG	<illegal instruction>
	.word 0xe077c000  ! 121: STX_R	stx	%r16, [%r31 + %r0]
mondo_2_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d910013  ! 122: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
debug_2_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 123: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 124: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_2_72:
	setx 0xa63cfcac298b8dbf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 125: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_2_73:
	nop
	setx 0xffffffadfffff633, %g1, %g7
	.word 0xa3800007  ! 126: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_2_74:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d920011  ! 127: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
	.word 0xa1902001  ! 128: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xe06ffdfd  ! 129: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffdfd]
	.word 0xe077fdfd  ! 130: STX_I	stx	%r16, [%r31 + 0xfffffdfd]
	.word 0x879021c8  ! 131: WRPR_TT_I	wrpr	%r0, 0x01c8, %tt
memptr_2_75:
	set user_data_start, %r31
	.word 0x85813596  ! 132: WRCCR_I	wr	%r4, 0x1596, %ccr
	.word 0xa9500000  ! 133: RDPR_TPC	<illegal instruction>
	.word 0x8790222a  ! 134: WRPR_TT_I	wrpr	%r0, 0x022a, %tt
	.word 0xd0d7e000  ! 135: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
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
	.word 0xa7414000  ! 136: RDPC	rd	%pc, %r19
	.word 0xd927c000  ! 137: STF_R	st	%f12, [%r0, %r31]
	.word 0xd88008a0  ! 138: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_cmpr_2_77:
	setx 0xa6aefcbb83142f23, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 139: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879023de  ! 140: WRPR_TT_I	wrpr	%r0, 0x03de, %tt
	.word 0xa190200d  ! 141: WRPR_GL_I	wrpr	%r0, 0x000d, %-
DS_2_78:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xb171a35e	! Random illegal ?
	.word 0x91a1c9c6  ! 1: FDIVd	fdivd	%f38, %f6, %f8
	.word 0x9ba24827  ! 142: FADDs	fadds	%f9, %f7, %f13
	.word 0xa1902003  ! 143: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa9a00171  ! 144: FABSq	dis not found

splash_tba_2_79:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 145: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 146: LDX_R	ldx	[%r31 + %r0], %r17
mondo_2_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d92400d  ! 147: WRPR_WSTATE_R	wrpr	%r9, %r13, %wstate
	.word 0xe2d004a0  ! 148: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
pmu_2_81:
	nop
	setx 0xfffff211fffff113, %g1, %g7
	.word 0xa3800007  ! 149: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02035  ! 150: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe28008a0  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x91d020b5  ! 152: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xa1902005  ! 153: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d902b65  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x0b65, %pstate
	.word 0x9f80322a  ! 155: SIR	sir	0x122a
splash_hpstate_2_82:
	.word 0x8198244c  ! 156: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044c, %hpstate
	.word 0xe2cfe020  ! 157: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r17
tagged_2_83:
	taddcctv %r15, 0x1fc9, %r18
	.word 0xe207e9ea  ! 158: LDUW_I	lduw	[%r31 + 0x09ea], %r17
cwp_2_84:
    set user_data_start, %o7
	.word 0x93902000  ! 159: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x83d020b2  ! 160: Tcc_I	te	icc_or_xcc, %r0 + 178
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 161: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_2_85:
	.word 0x81982a17  ! 162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a17, %hpstate
	.word 0xe20fe9ea  ! 163: LDUB_I	ldub	[%r31 + 0x09ea], %r17
	.word 0xe2dfe030  ! 164: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r17
debug_2_86:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 165: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_2_87-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_87:
	.word 0x91908014  ! 166: WRPR_PIL_R	wrpr	%r2, %r20, %pil
	.word 0xa1902000  ! 167: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xe26fe9ea  ! 168: LDSTUB_I	ldstub	%r17, [%r31 + 0x09ea]
splash_hpstate_2_88:
	.word 0x8198209e  ! 169: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009e, %hpstate
memptr_2_89:
	set 0x60340000, %r31
	.word 0x8585234f  ! 170: WRCCR_I	wr	%r20, 0x034f, %ccr
	.word 0x81b01021  ! 171: SIAM	siam	1
splash_cmpr_2_90:
	setx 0x5b11c70021f5ad8e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_91:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 173: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_2_92:
	setx 0x67a60f3d2f60dc57, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 174: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780208a  ! 175: WRASI_I	wr	%r0, 0x008a, %asi
debug_2_93:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 176: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
splash_cmpr_2_94:
	setx 0x4807376f16f15ce5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_95:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d90000a  ! 178: WRPR_WSTATE_R	wrpr	%r0, %r10, %wstate
	.word 0xe26fe0a3  ! 179: LDSTUB_I	ldstub	%r17, [%r31 + 0x00a3]
	.word 0xa9a00174  ! 180: FABSq	dis not found

splash_tba_2_96:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 181: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1902004  ! 182: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_tba_2_97:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 183: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_2_98:
    set user_data_start, %o7
	.word 0x93902007  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
mondo_2_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d908008  ! 185: WRPR_WSTATE_R	wrpr	%r2, %r8, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a0196a  ! 186: FqTOd	dis not found

intveclr_2_101:
	setx 0x39468efa1a07a9bd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 187: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_2_102:
	set 0x003a0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r12
	.word 0x8b98000c  ! 188: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d802000  ! 189: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa190200a  ! 190: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xe127c000  ! 191: STF_R	st	%f16, [%r0, %r31]
	.word 0xe007c000  ! 192: LDUW_R	lduw	[%r31 + %r0], %r16
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_103:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 193: CASA_R	casa	[%r31] %asi, %r7, %r16
splash_cmpr_2_104:
	setx 0xef47e2cae9b42b54, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 194: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 195: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7450000  ! 196: RD_SET_SOFTINT	rd	%set_softint, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 197: LDX_R	ldx	[%r31 + %r0], %r8
DS_2_105:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x93b04314  ! 198: ALIGNADDRESS	alignaddr	%r1, %r20, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 199: LDX_R	ldx	[%r31 + %r0], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 200: LDX_R	ldx	[%r31 + %r0], %r19
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 201: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_2_106:
	setx 0x2cc906d5a8326940, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_107:
	setx 0x2c44778134b8dd45, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 203: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1a00160  ! 204: FABSq	dis not found

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
	.word 0xa5414000  ! 205: RDPC	rd	%pc, %r18
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 206: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_109
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_109:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 207: RDPC	rd	%pc, %r20
	.word 0xe257c000  ! 208: LDSH_R	ldsh	[%r31 + %r0], %r17
	rd %pc, %r19
	add %r19, (ivw_2_110-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_110:
	.word 0x9194c00d  ! 209: WRPR_PIL_R	wrpr	%r19, %r13, %pil
DS_2_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x91b10302  ! 210: ALIGNADDRESS	alignaddr	%r4, %r2, %r8
	.word 0x8d802000  ! 211: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1a0056d  ! 212: FSQRTq	fsqrt	
	.word 0xe4dfe030  ! 213: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_112)+24, 16, 16)) -> intp(2,1,3)
xir_2_112:
	.word 0xa98066a4  ! 214: WR_SET_SOFTINT_I	wr	%r1, 0x06a4, %set_softint
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 215: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_htba_2_113:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 216: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_114:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 217: CASA_R	casa	[%r31] %asi, %r18, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 218: LDX_R	ldx	[%r31 + %r0], %r18
debug_2_115:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 219: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe48008a0  ! 220: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa190200b  ! 221: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x22800001  ! 222: BE	be,a	<label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_116:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 223: CASA_R	casa	[%r31] %asi, %r18, %r18
	.word 0xe537c000  ! 224: STQF_R	-	%f18, [%r0, %r31]
change_to_randtl_2_117:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_117:
	.word 0x8f902003  ! 225: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x3e700001  ! 226: BPVC	<illegal instruction>
	.word 0xad807b4c  ! 227: WR_SOFTINT_REG_I	wr	%r1, 0x1b4c, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_118)+24, 16, 16)) -> intp(2,1,3)
xir_2_118:
	.word 0xa9836a9d  ! 228: WR_SET_SOFTINT_I	wr	%r13, 0x0a9d, %set_softint
	.word 0x87902197  ! 229: WRPR_TT_I	wrpr	%r0, 0x0197, %tt
	.word 0xe45fe228  ! 230: LDX_I	ldx	[%r31 + 0x0228], %r18
	.word 0x87902378  ! 231: WRPR_TT_I	wrpr	%r0, 0x0378, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 232: LDX_R	ldx	[%r31 + %r0], %r18
debug_2_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 233: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_2_120:
	set user_data_start, %r31
	.word 0x85807eb4  ! 234: WRCCR_I	wr	%r1, 0x1eb4, %ccr
debug_2_121:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 235: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x24800001  ! 236: BLE	ble,a	<label_0x1>
	.word 0x22800001  ! 237: BE	be,a	<label_0x1>
DS_2_122:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 238: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_123
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_123
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_123:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 239: RDPC	rd	%pc, %r13
	.word 0x93500000  ! 240: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_124) + 16, 16, 16)) -> intp(5,0,4)
intvec_2_124:
	.word 0x39400001  ! 241: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd82fee48  ! 242: STB_I	stb	%r12, [%r31 + 0x0e48]
splash_cmpr_2_125:
	setx 0x50e594c1b97e5dbf, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9169e3d9  ! 244: SDIVX_I	sdivx	%r7, 0x03d9, %r8
tagged_2_127:
	taddcctv %r13, 0x1fac, %r20
	.word 0xd007fb03  ! 245: LDUW_I	lduw	[%r31 + 0xfffffb03], %r8
splash_lsu_2_128:
	setx 0xa5c40aae095c3a6d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 246: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_2_129:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 247: SAVE_R	save	%r31, %r0, %r31
DS_2_130:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 248: RESTORE_R	restore	%r31, %r0, %r31
tagged_2_131:
	taddcctv %r2, 0x18d7, %r12
	.word 0xd007fb03  ! 249: LDUW_I	lduw	[%r31 + 0xfffffb03], %r8
	.word 0xd06ffb03  ! 250: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffb03]
	.word 0x8790238c  ! 251: WRPR_TT_I	wrpr	%r0, 0x038c, %tt
splash_cmpr_2_132:
	setx 0x7afb152a342907d6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 252: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_133:
	setx 0x3ee7d8113d6754ff, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 254: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02034  ! 255: Tcc_I	ta	icc_or_xcc, %r0 + 52
intveclr_2_135:
	setx 0x9d10318561f2f78f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 256: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x98808006  ! 257: ADDcc_R	addcc 	%r2, %r6, %r12
	.word 0xd2cfe000  ! 258: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r9
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_136
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_136:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 259: RDPC	rd	%pc, %r13
	.word 0xd4d00e80  ! 260: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r10
cwp_2_137:
    set user_data_start, %o7
	.word 0x93902001  ! 261: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xab81fcc6  ! 262: WR_CLEAR_SOFTINT_I	wr	%r7, 0x1cc6, %clear_softint
mondo_2_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d930005  ! 263: WRPR_WSTATE_R	wrpr	%r12, %r5, %wstate
	.word 0x91d020b3  ! 264: Tcc_I	ta	icc_or_xcc, %r0 + 179
debug_2_139:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 265: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd43fea6f  ! 266: STD_I	std	%r10, [%r31 + 0x0a6f]
	.word 0xd427ea6f  ! 267: STW_I	stw	%r10, [%r31 + 0x0a6f]
	.word 0x99902001  ! 268: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
DS_2_140:
	.word 0x93a049c4  ! 1: FDIVd	fdivd	%f32, %f4, %f40
	pdist %f10, %f20, %f16
	.word 0x97b1c313  ! 269: ALIGNADDRESS	alignaddr	%r7, %r19, %r11
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_141
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_141
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_141:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 270: RDPC	rd	%pc, %r16
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 271: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_2_142:
	setx 0x64b9e9efe76b1dab, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 272: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x92d26aec  ! 273: UMULcc_I	umulcc 	%r9, 0x0aec, %r9
splash_cmpr_2_143:
	setx 0x1c3a3ba0657da1a3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 274: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_2_144:
	set user_data_start, %r31
	.word 0x8585243a  ! 275: WRCCR_I	wr	%r20, 0x043a, %ccr
	.word 0x99a049c4  ! 276: FDIVd	fdivd	%f32, %f4, %f12
	setx 0x01f23986776c72dd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_145:
	.word 0x39400001  ! 277: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 278: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x9f803fd7  ! 279: SIR	sir	0x1fd7
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
	.word 0xd1e7e00d  ! 280: CASA_R	casa	[%r31] %asi, %r13, %r8
splash_tba_2_147:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x97a00166  ! 282: FABSq	dis not found

	.word 0xa1b40fed  ! 283: FONES	e	%f16
	.word 0x9b454000  ! 284: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
DS_2_148:
	.word 0xa3a209c1  ! 1: FDIVd	fdivd	%f8, %f32, %f48
	.word 0xbfe7c000  ! 285: SAVE_R	save	%r31, %r0, %r31
DS_2_149:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd7318006  ! 1: STQF_R	-	%f11, [%r6, %r6]
	normalw
	.word 0x97458000  ! 286: RD_SOFTINT_REG	rd	%softint, %r11
pmu_2_150:
	nop
	setx 0xfffffc7cfffff061, %g1, %g7
	.word 0xa3800007  ! 287: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_2_151:
	setx 0xf8ce30a9ad64329d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 288: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91464000  ! 289: RD_STICK_CMPR_REG	rd	%-, %r8
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 290: Tcc_R	te	icc_or_xcc, %r0 + %r30
mondo_2_152:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d90000a  ! 291: WRPR_WSTATE_R	wrpr	%r0, %r10, %wstate
	.word 0x986c6cac  ! 292: UDIVX_I	udivx 	%r17, 0x0cac, %r12
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_153:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e009  ! 293: CASA_R	casa	[%r31] %asi, %r9, %r8
	.word 0x99902001  ! 294: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x93520000  ! 295: RDPR_PIL	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01960  ! 296: FqTOd	dis not found

	.word 0x9f80259a  ! 297: SIR	sir	0x059a
	.word 0xe69004a0  ! 298: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
splash_lsu_2_155:
	setx 0x860a03fc0c5c3b5f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 299: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93540000  ! 300: RDPR_GL	<illegal instruction>
	.word 0x93d02033  ! 301: Tcc_I	tne	icc_or_xcc, %r0 + 51
debug_2_156:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 302: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0xe69fe723  ! 303: LDDA_I	ldda	[%r31, + 0x0723] %asi, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916b3d89  ! 304: SDIVX_I	sdivx	%r12, 0xfffffd89, %r8
splash_hpstate_2_158:
	.word 0x8198240d  ! 305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040d, %hpstate
splash_cmpr_2_159:
	setx 0x3cb8b7d67efcc83e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_160:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 307: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_2_161:
	setx 0x344c91b0d921e100, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 308: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_162:
	setx 0xd3153520e58b0c52, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 309: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_163:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 310: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0xe86feafa  ! 311: LDSTUB_I	ldstub	%r20, [%r31 + 0x0afa]
	.word 0xe927c000  ! 312: STF_R	st	%f20, [%r0, %r31]
	.word 0xe8800b40  ! 313: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r20
debug_2_164:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 314: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_2_165:
	setx 0xedafcd632d3fdc3a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 315: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9840013  ! 316: WR_SET_SOFTINT_R	wr	%r16, %r19, %set_softint
	.word 0x97450000  ! 317: RD_SET_SOFTINT	rd	%set_softint, %r11
change_to_randtl_2_166:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_166:
	.word 0x8f902000  ! 318: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xab80c013  ! 319: WR_CLEAR_SOFTINT_R	wr	%r3, %r19, %clear_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 320: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd527c000  ! 321: STF_R	st	%f10, [%r0, %r31]
change_to_randtl_2_167:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_167:
	.word 0x8f902001  ! 322: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
donret_2_168:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_168-donret_2_168), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_168:
	.word 0xd4ffeafa  ! 323: SWAPA_I	swapa	%r10, [%r31 + 0x0afa] %asi
	.word 0x92acc005  ! 324: ANDNcc_R	andncc 	%r19, %r5, %r9
	.word 0xa9454000  ! 325: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916cf62e  ! 326: SDIVX_I	sdivx	%r19, 0xfffff62e, %r8
tagged_2_170:
	tsubcctv %r22, 0x1d98, %r3
	.word 0xe607e364  ! 327: LDUW_I	lduw	[%r31 + 0x0364], %r19
splash_hpstate_2_171:
	.word 0x8198220c  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020c, %hpstate
	.word 0x8d802000  ! 329: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe71fc000  ! 330: LDDF_R	ldd	[%r31, %r0], %f19
splash_htba_2_172:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 331: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa8c4b62e  ! 332: ADDCcc_I	addccc 	%r18, 0xfffff62e, %r20
memptr_2_173:
	set 0x60140000, %r31
	.word 0x85826850  ! 333: WRCCR_I	wr	%r9, 0x0850, %ccr
	.word 0xd53feb8f  ! 334: STDF_I	std	%f10, [0x0b8f, %r31]
	.word 0xa190200d  ! 335: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd48fe010  ! 336: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0x87802016  ! 337: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936a6d3b  ! 338: SDIVX_I	sdivx	%r9, 0x0d3b, %r9
	setx 0xc59cde44416f1920, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_175:
	.word 0x39400001  ! 339: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_2_176:
    set user_data_start, %o7
	.word 0x93902007  ! 340: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd23ff4d5  ! 341: STD_I	std	%r9, [%r31 + 0xfffff4d5]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1692e73  ! 342: SDIVX_I	sdivx	%r4, 0x0e73, %r16
	.word 0xd0d004a0  ! 343: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0xd00fc000  ! 344: LDUB_R	ldub	[%r31 + %r0], %r8
splash_tba_2_178:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 345: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd06ff250  ! 346: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff250]
DS_2_179:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe5314011  ! 1: STQF_R	-	%f18, [%r17, %r5]
	normalw
	.word 0x93458000  ! 347: RD_SOFTINT_REG	rd	%softint, %r9
intveclr_2_180:
	setx 0x519ab6bc5cd3b3f2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 348: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6c004a0  ! 349: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 350: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_2_181:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 351: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_2_182:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 352: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa7520000  ! 353: RDPR_PIL	<illegal instruction>
	.word 0x8d802000  ! 354: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa780c010  ! 355: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r16, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 356: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe68008a0  ! 357: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xa7480000  ! 358: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0x8d802004  ! 359: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd247c000  ! 360: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0xa190200f  ! 361: WRPR_GL_I	wrpr	%r0, 0x000f, %-
DS_2_184:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x95a509d3  ! 1: FDIVd	fdivd	%f20, %f50, %f10
	normalw
	.word 0x97458000  ! 362: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01962  ! 363: FqTOd	dis not found

intveclr_2_186:
	setx 0x588495eca4a355b6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_187:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 365: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802089  ! 366: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x879023af  ! 367: WRPR_TT_I	wrpr	%r0, 0x03af, %tt
splash_hpstate_2_188:
	.word 0x81982adf  ! 368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adf, %hpstate
	.word 0x24700001  ! 369: BPLE	<illegal instruction>
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
	.word 0x95414000  ! 370: RDPC	rd	%pc, %r10
	.word 0x8d902482  ! 371: WRPR_PSTATE_I	wrpr	%r0, 0x0482, %pstate
splash_hpstate_2_190:
	.word 0x81982e8c  ! 372: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8c, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01963  ! 373: FqTOd	dis not found

	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 374: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 375: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_2_192:
	tsubcctv %r24, 0x156d, %r3
	.word 0xe207f250  ! 376: LDUW_I	lduw	[%r31 + 0xfffff250], %r17
	.word 0x9f803744  ! 377: SIR	sir	0x1744
DS_2_193:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f4, %f10, %f0
	.word 0x91b1c314  ! 378: ALIGNADDRESS	alignaddr	%r7, %r20, %r8
splash_cmpr_2_194:
	setx 0xe3485fded47c6c06, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 379: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xa7414000  ! 380: RDPC	rd	%pc, %r19
	.word 0xe2cfe020  ! 381: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r17
	.word 0xe327edb2  ! 382: STF_I	st	%f17, [0x0db2, %r31]
tagged_2_196:
	tsubcctv %r18, 0x14cd, %r6
	.word 0xe207edb2  ! 383: LDUW_I	lduw	[%r31 + 0x0db2], %r17
	setx 0xaea83e58a40461d7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_197:
	.word 0x39400001  ! 384: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 385: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x87802080  ! 386: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa7830001  ! 387: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r1, %-
	.word 0xa7a049d2  ! 388: FDIVd	fdivd	%f32, %f18, %f50
splash_lsu_2_199:
	setx 0xabfc2d9f3f9ec635, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 389: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d908004  ! 390: WRPR_WSTATE_R	wrpr	%r2, %r4, %wstate
splash_htba_2_201:
	set 0x003a0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r12
	.word 0x8b98000c  ! 391: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe137edb2  ! 392: STQF_I	-	%f16, [0x0db2, %r31]
	.word 0x87902098  ! 393: WRPR_TT_I	wrpr	%r0, 0x0098, %tt
tagged_2_202:
	tsubcctv %r2, 0x1c17, %r16
	.word 0xe007edb2  ! 394: LDUW_I	lduw	[%r31 + 0x0db2], %r16
	.word 0xe0d7e020  ! 395: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
debug_2_203:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 396: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 397: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_2_204:
	setx 0x161a6f21db3d4eb7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_205:
	setx 0x3af1b119adf3760b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 400: BPNE	<illegal instruction>
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	.word 0xa1902007  ! 1: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xd0c80e60  ! 2: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r8
	.word 0x97a1c9c7  ! 3: FDIVd	fdivd	%f38, %f38, %f42
pmu_1_0:
	nop
	setx 0xfffff603fffff9b0, %g1, %g7
	.word 0xa3800007  ! 4: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_1_1:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 5: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_2
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_2:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 6: RDPC	rd	%pc, %r20
intveclr_1_3:
	setx 0xef9fb72ac54cee77, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_1_4:
	tsubcctv %r20, 0x1dc2, %r9
	.word 0xe607e390  ! 8: LDUW_I	lduw	[%r31 + 0x0390], %r19
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_5:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e008  ! 9: CASA_R	casa	[%r31] %asi, %r8, %r19
	.word 0xad832bff  ! 10: WR_SOFTINT_REG_I	wr	%r12, 0x0bff, %softint
	.word 0x8d903a71  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x1a71, %pstate
	.word 0xa950c000  ! 12: RDPR_TT	rdpr	%tt, %r20
memptr_1_6:
	set user_data_start, %r31
	.word 0x85802978  ! 13: WRCCR_I	wr	%r0, 0x0978, %ccr
	.word 0x8790222b  ! 14: WRPR_TT_I	wrpr	%r0, 0x022b, %tt
	.word 0xa7a00169  ! 15: FABSq	dis not found

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
	.word 0x97414000  ! 16: RDPC	rd	%pc, %r11
mondo_1_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d904014  ! 17: WRPR_WSTATE_R	wrpr	%r1, %r20, %wstate
	.word 0xab82b236  ! 18: WR_CLEAR_SOFTINT_I	wr	%r10, 0x1236, %clear_softint
	.word 0x99902005  ! 19: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
cwp_1_9:
    set user_data_start, %o7
	.word 0x93902003  ! 20: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
cwp_1_10:
    set user_data_start, %o7
	.word 0x93902002  ! 21: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
debug_1_11:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 22: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8790212c  ! 23: WRPR_TT_I	wrpr	%r0, 0x012c, %tt
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_12
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_12:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 24: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0xe727e431  ! 25: STF_I	st	%f19, [0x0431, %r31]
	.word 0xe6800c00  ! 26: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r19
memptr_1_13:
	set 0x60740000, %r31
	.word 0x85832833  ! 27: WRCCR_I	wr	%r12, 0x0833, %ccr
	.word 0xa2aa0007  ! 28: ANDNcc_R	andncc 	%r8, %r7, %r17
memptr_1_14:
	set 0x60140000, %r31
	.word 0x85822c72  ! 29: WRCCR_I	wr	%r8, 0x0c72, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 30: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4d80e40  ! 31: LDXA_R	ldxa	[%r0, %r0] 0x72, %r18
	.word 0x8790218b  ! 32: WRPR_TT_I	wrpr	%r0, 0x018b, %tt
splash_cmpr_1_15:
	setx 0x86c10dec815d12a4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95687fc5  ! 34: SDIVX_I	sdivx	%r1, 0xffffffc5, %r10
	.word 0xda8fe010  ! 35: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196b  ! 36: FqTOd	dis not found

	.word 0xd33fc000  ! 37: STDF_R	std	%f9, [%r0, %r31]
	.word 0xa0c07428  ! 38: ADDCcc_I	addccc 	%r1, 0xfffff428, %r16
cwp_1_18:
    set user_data_start, %o7
	.word 0x93902001  ! 39: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_decr_1_19:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa784c00b  ! 40: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r11, %-
	.word 0x879020db  ! 41: WRPR_TT_I	wrpr	%r0, 0x00db, %tt
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_20:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e002  ! 42: CASA_R	casa	[%r31] %asi, %r2, %r19
	.word 0x93a00170  ! 43: FABSq	dis not found

	.word 0xe44ff491  ! 44: LDSB_I	ldsb	[%r31 + 0xfffff491], %r18
debug_1_21:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 45: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
cwp_1_22:
    set user_data_start, %o7
	.word 0x93902005  ! 46: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916a796f  ! 47: SDIVX_I	sdivx	%r9, 0xfffff96f, %r8
intveclr_1_24:
	setx 0x4ec7c6b2bf7c5253, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 48: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_1_25:
	setx 0x17440ebdf1ecfc49, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 49: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_26:
	setx 0xb8d01ee7cc5cf33e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2e700001  ! 51: BPVS	<illegal instruction>
	.word 0xa3500000  ! 52: RDPR_TPC	<illegal instruction>
splash_cmpr_1_27:
	setx 0xc13f32288a41aad6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 53: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802004  ! 54: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_1_28:
	setx 0x3fe30a364e0c41f6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_29:
	setx 0xe2dc0e7d81aa7e93, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 56: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 57: LDX_R	ldx	[%r31 + %r0], %r20
splash_cmpr_1_30:
	setx 0xbe31789a65b31ebf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe86fef00  ! 59: LDSTUB_I	ldstub	%r20, [%r31 + 0x0f00]
	.word 0x9f8024df  ! 60: SIR	sir	0x04df
memptr_1_31:
	set 0x60340000, %r31
	.word 0x8580b923  ! 61: WRCCR_I	wr	%r2, 0x1923, %ccr
debug_1_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 62: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_1_33:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 63: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_1_34:
	setx 0x824d34c8de525013, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 64: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_35:
	.word 0x81982b1e  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1e, %hpstate
	.word 0x8d902d18  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x0d18, %pstate
tagged_1_36:
	tsubcctv %r4, 0x182c, %r19
	.word 0xe807e96a  ! 67: LDUW_I	lduw	[%r31 + 0x096a], %r20
splash_tba_1_37:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 68: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_38) + 24, 16, 16)) -> intp(6,0,16)
intvec_1_38:
	.word 0x39400001  ! 69: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_39:
	setx 0x9b6de8a2ff13b52b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_40) + 0, 16, 16)) -> intp(2,0,24)
intvec_1_40:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_1_41:
	taddcctv %r2, 0x10c9, %r26
	.word 0xe807e96a  ! 72: LDUW_I	lduw	[%r31 + 0x096a], %r20
	.word 0xa5454000  ! 73: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0x99a509d2  ! 74: FDIVd	fdivd	%f20, %f18, %f12
	.word 0x97a409d4  ! 75: FDIVd	fdivd	%f16, %f20, %f42
mondo_1_42:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d948012  ! 76: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
	.word 0x97450000  ! 77: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0xd08008a0  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_43:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 79: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01972  ! 80: FqTOd	dis not found

intveclr_1_45:
	setx 0xdcfbc819ff8d9418, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 81: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_46:
	setx 0x95ee005f3cdc22e1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 82: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_47:
	setx 0xf5ed4099322f131c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 83: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_1_48:
	set user_data_start, %r31
	.word 0x8581f40c  ! 84: WRCCR_I	wr	%r7, 0x140c, %ccr
	.word 0x87802058  ! 85: WRASI_I	wr	%r0, 0x0058, %asi
	rd %pc, %r19
	add %r19, (ivw_1_49-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_49:
	.word 0x91900014  ! 86: WRPR_PIL_R	wrpr	%r0, %r20, %pil
splash_cmpr_1_50:
	setx 0xce2d550231e8b045, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 87: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_1_51:
	setx 0x8b61e5be3e0850b7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 88: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 89: BPN	<illegal instruction>
memptr_1_52:
	set 0x60140000, %r31
	.word 0x8580a426  ! 90: WRCCR_I	wr	%r2, 0x0426, %ccr
	.word 0xe26ff0a9  ! 91: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff0a9]
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 92: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9b450000  ! 93: RD_SET_SOFTINT	rd	%set_softint, %r13
	.word 0xd08008a0  ! 94: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
memptr_1_53:
	set 0x60740000, %r31
	.word 0x8582acb9  ! 95: WRCCR_I	wr	%r10, 0x0cb9, %ccr
	.word 0xd00ff3d6  ! 96: LDUB_I	ldub	[%r31 + 0xfffff3d6], %r8
	.word 0x87802020  ! 97: WRASI_I	wr	%r0, 0x0020, %asi
intveclr_1_54:
	setx 0x13229e88f18caffa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 98: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_55:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 99: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_1_56:
	setx 0x3c5cdcdcc98186d1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_1_57:
    set user_data_start, %o7
	.word 0x93902007  ! 101: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 102: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_1_58:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 103: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
donret_1_59:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_59-donret_1_59-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_59:
	.word 0xd0fff3d6  ! 104: SWAPA_I	swapa	%r8, [%r31 + 0xfffff3d6] %asi
debug_1_60:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 105: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0x8780201c  ! 106: WRASI_I	wr	%r0, 0x001c, %asi
DS_1_61:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f10, %f14, %f24
	.word 0x91b08308  ! 107: ALIGNADDRESS	alignaddr	%r2, %r8, %r8
	.word 0x96aa8013  ! 108: ANDNcc_R	andncc 	%r10, %r19, %r11
splash_hpstate_1_62:
	.word 0x81982ec5  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec5, %hpstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_63:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e002  ! 110: CASA_R	casa	[%r31] %asi, %r2, %r16
memptr_1_64:
	set 0x60140000, %r31
	.word 0x85833ec9  ! 111: WRCCR_I	wr	%r12, 0x1ec9, %ccr
	.word 0xe0bfc020  ! 112: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	.word 0xe0800b00  ! 113: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r16
donret_1_65:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_65-donret_1_65-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_65:
	.word 0xe0ffeac5  ! 114: SWAPA_I	swapa	%r16, [%r31 + 0x0ac5] %asi
	.word 0xe06feac5  ! 115: LDSTUB_I	ldstub	%r16, [%r31 + 0x0ac5]
splash_cmpr_1_66:
	setx 0xdd7914e3148bb59a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 116: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_1_67:
	set 0x60540000, %r31
	.word 0x85852b8b  ! 117: WRCCR_I	wr	%r20, 0x0b8b, %ccr
splash_lsu_1_68:
	setx 0x77d38e273d8d418b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 118: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_1_69:
	nop
	setx 0xffffffcafffff080, %g1, %g7
	.word 0xa3800007  ! 119: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x34700001  ! 120: BPG	<illegal instruction>
	.word 0xe077c000  ! 121: STX_R	stx	%r16, [%r31 + %r0]
mondo_1_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d90c006  ! 122: WRPR_WSTATE_R	wrpr	%r3, %r6, %wstate
debug_1_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 123: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 124: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_1_72:
	setx 0xc58326b4f78217c7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 125: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_1_73:
	nop
	setx 0xfffff3e8fffff61e, %g1, %g7
	.word 0xa3800007  ! 126: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_1_74:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d92000c  ! 127: WRPR_WSTATE_R	wrpr	%r8, %r12, %wstate
	.word 0xa190200e  ! 128: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xe06ffdfd  ! 129: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffdfd]
	.word 0xe077fdfd  ! 130: STX_I	stx	%r16, [%r31 + 0xfffffdfd]
	.word 0x87902307  ! 131: WRPR_TT_I	wrpr	%r0, 0x0307, %tt
memptr_1_75:
	set user_data_start, %r31
	.word 0x85837ff3  ! 132: WRCCR_I	wr	%r13, 0x1ff3, %ccr
	.word 0xa3500000  ! 133: RDPR_TPC	<illegal instruction>
	.word 0x87902285  ! 134: WRPR_TT_I	wrpr	%r0, 0x0285, %tt
	.word 0xd0d7e020  ! 135: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
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
	.word 0xa9414000  ! 136: RDPC	rd	%pc, %r20
	.word 0xd927c000  ! 137: STF_R	st	%f12, [%r0, %r31]
	.word 0xd8800c20  ! 138: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r12
splash_cmpr_1_77:
	setx 0xb77ca170616e4c60, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 139: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790236c  ! 140: WRPR_TT_I	wrpr	%r0, 0x036c, %tt
	.word 0xa1902005  ! 141: WRPR_GL_I	wrpr	%r0, 0x0005, %-
DS_1_78:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xdb5278d1	! Random illegal ?
	.word 0xa7a049c1  ! 1: FDIVd	fdivd	%f32, %f32, %f50
	.word 0xa1a4c830  ! 142: FADDs	fadds	%f19, %f16, %f16
	.word 0xa1902004  ! 143: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x9ba00168  ! 144: FABSq	dis not found

splash_tba_1_79:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 145: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 146: LDX_R	ldx	[%r31 + %r0], %r17
mondo_1_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d904001  ! 147: WRPR_WSTATE_R	wrpr	%r1, %r1, %wstate
	.word 0xe2d004a0  ! 148: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
pmu_1_81:
	nop
	setx 0xfffffac3ffffff97, %g1, %g7
	.word 0xa3800007  ! 149: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02035  ! 150: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe2800c00  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r17
	.word 0x91d02032  ! 152: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa190200c  ! 153: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8d90374e  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x174e, %pstate
	.word 0x9f803826  ! 155: SIR	sir	0x1826
splash_hpstate_1_82:
	.word 0x81982c87  ! 156: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c87, %hpstate
	.word 0xe2cfe000  ! 157: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r17
tagged_1_83:
	taddcctv %r11, 0x16b1, %r1
	.word 0xe207e9ea  ! 158: LDUW_I	lduw	[%r31 + 0x09ea], %r17
cwp_1_84:
    set user_data_start, %o7
	.word 0x93902007  ! 159: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91d020b4  ! 160: Tcc_I	ta	icc_or_xcc, %r0 + 180
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 161: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_1_85:
	.word 0x81982d85  ! 162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d85, %hpstate
	.word 0xe20fe9ea  ! 163: LDUB_I	ldub	[%r31 + 0x09ea], %r17
	.word 0xe2dfe030  ! 164: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r17
debug_1_86:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 165: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_1_87-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_87:
	.word 0x9192c012  ! 166: WRPR_PIL_R	wrpr	%r11, %r18, %pil
	.word 0xa1902005  ! 167: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xe26fe9ea  ! 168: LDSTUB_I	ldstub	%r17, [%r31 + 0x09ea]
splash_hpstate_1_88:
	.word 0x81982c56  ! 169: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c56, %hpstate
memptr_1_89:
	set 0x60540000, %r31
	.word 0x8584ff28  ! 170: WRCCR_I	wr	%r19, 0x1f28, %ccr
	.word 0x81b01021  ! 171: SIAM	siam	1
splash_cmpr_1_90:
	setx 0x4321f5030b9090ef, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_91:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 173: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_1_92:
	setx 0xfb1dc611956f6f1f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 174: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 175: WRASI_I	wr	%r0, 0x0089, %asi
debug_1_93:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 176: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
splash_cmpr_1_94:
	setx 0xdcaa1d655fbda083, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_95:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d91c000  ! 178: WRPR_WSTATE_R	wrpr	%r7, %r0, %wstate
	.word 0xe26fe0a3  ! 179: LDSTUB_I	ldstub	%r17, [%r31 + 0x00a3]
	.word 0xa1a00170  ! 180: FABSq	dis not found

splash_tba_1_96:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 181: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1902003  ! 182: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_tba_1_97:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 183: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_1_98:
    set user_data_start, %o7
	.word 0x93902005  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
mondo_1_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d950006  ! 185: WRPR_WSTATE_R	wrpr	%r20, %r6, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01972  ! 186: FqTOd	dis not found

intveclr_1_101:
	setx 0x6ce0786dd4a74a37, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 187: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_1_102:
	set 0x003b0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r12
	.word 0x8b98000c  ! 188: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d802000  ! 189: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902002  ! 190: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xe127c000  ! 191: STF_R	st	%f16, [%r0, %r31]
	.word 0xe007c000  ! 192: LDUW_R	lduw	[%r31 + %r0], %r16
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_103:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 193: CASA_R	casa	[%r31] %asi, %r7, %r16
splash_cmpr_1_104:
	setx 0x9feace3949eca1d2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 194: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 195: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9450000  ! 196: RD_SET_SOFTINT	rd	%set_softint, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 197: LDX_R	ldx	[%r31 + %r0], %r8
DS_1_105:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x97b48311  ! 198: ALIGNADDRESS	alignaddr	%r18, %r17, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 199: LDX_R	ldx	[%r31 + %r0], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 200: LDX_R	ldx	[%r31 + %r0], %r19
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 201: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_1_106:
	setx 0x733aa5222c7c330c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_107:
	setx 0xe10bce7de4f8f935, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 203: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7a00167  ! 204: FABSq	dis not found

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
	.word 0x99414000  ! 205: RDPC	rd	%pc, %r12
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 206: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_109
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_109:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 207: RDPC	rd	%pc, %r11
	.word 0xe257c000  ! 208: LDSH_R	ldsh	[%r31 + %r0], %r17
	rd %pc, %r19
	add %r19, (ivw_1_110-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_110:
	.word 0x91944004  ! 209: WRPR_PIL_R	wrpr	%r17, %r4, %pil
DS_1_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa1b04314  ! 210: ALIGNADDRESS	alignaddr	%r1, %r20, %r16
	.word 0x8d802000  ! 211: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa7a00570  ! 212: FSQRTq	fsqrt	
	.word 0xe4dfe010  ! 213: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_112)+32, 16, 16)) -> intp(1,1,3)
xir_1_112:
	.word 0xa9807fd9  ! 214: WR_SET_SOFTINT_I	wr	%r1, 0x1fd9, %set_softint
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 215: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_1_113:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 216: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_114:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 217: CASA_R	casa	[%r31] %asi, %r18, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 218: LDX_R	ldx	[%r31 + %r0], %r18
debug_1_115:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 219: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe48008a0  ! 220: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa1902003  ! 221: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x22800001  ! 222: BE	be,a	<label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_116:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 223: CASA_R	casa	[%r31] %asi, %r18, %r18
	.word 0xe537c000  ! 224: STQF_R	-	%f18, [%r0, %r31]
change_to_randtl_1_117:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_117:
	.word 0x8f902000  ! 225: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x3e700001  ! 226: BPVC	<illegal instruction>
	.word 0xad8535ae  ! 227: WR_SOFTINT_REG_I	wr	%r20, 0x15ae, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_118)+32, 16, 16)) -> intp(1,1,3)
xir_1_118:
	.word 0xa9836d7a  ! 228: WR_SET_SOFTINT_I	wr	%r13, 0x0d7a, %set_softint
	.word 0x879023d7  ! 229: WRPR_TT_I	wrpr	%r0, 0x03d7, %tt
	.word 0xe45fe228  ! 230: LDX_I	ldx	[%r31 + 0x0228], %r18
	.word 0x87902188  ! 231: WRPR_TT_I	wrpr	%r0, 0x0188, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 232: LDX_R	ldx	[%r31 + %r0], %r18
debug_1_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 233: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_1_120:
	set user_data_start, %r31
	.word 0x85836e76  ! 234: WRCCR_I	wr	%r13, 0x0e76, %ccr
debug_1_121:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 235: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x24800001  ! 236: BLE	ble,a	<label_0x1>
	.word 0x22800001  ! 237: BE	be,a	<label_0x1>
DS_1_122:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 238: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_123
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_123
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_123:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 239: RDPC	rd	%pc, %r13
	.word 0xa3500000  ! 240: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_124) + 0, 16, 16)) -> intp(1,0,15)
intvec_1_124:
	.word 0x39400001  ! 241: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd82fee48  ! 242: STB_I	stb	%r12, [%r31 + 0x0e48]
splash_cmpr_1_125:
	setx 0xff14a73ec5f92ca2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6964c4  ! 244: SDIVX_I	sdivx	%r5, 0x04c4, %r13
tagged_1_127:
	taddcctv %r23, 0x1939, %r9
	.word 0xd007fb03  ! 245: LDUW_I	lduw	[%r31 + 0xfffffb03], %r8
splash_lsu_1_128:
	setx 0x2ead82d61a540d55, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 246: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_1_129:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 247: SAVE_R	save	%r31, %r0, %r31
DS_1_130:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 248: RESTORE_R	restore	%r31, %r0, %r31
tagged_1_131:
	taddcctv %r23, 0x10d7, %r8
	.word 0xd007fb03  ! 249: LDUW_I	lduw	[%r31 + 0xfffffb03], %r8
	.word 0xd06ffb03  ! 250: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffb03]
	.word 0x8790230f  ! 251: WRPR_TT_I	wrpr	%r0, 0x030f, %tt
splash_cmpr_1_132:
	setx 0x6fe0626daf00a4a8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 252: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_133:
	setx 0x0472370567e7a891, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 254: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d020b2  ! 255: Tcc_I	ta	icc_or_xcc, %r0 + 178
intveclr_1_135:
	setx 0x5c426d559cc72aa2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 256: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa881c011  ! 257: ADDcc_R	addcc 	%r7, %r17, %r20
	.word 0xd2cfe000  ! 258: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r9
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_136
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_136:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 259: RDPC	rd	%pc, %r8
	.word 0xd4d004a0  ! 260: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
cwp_1_137:
    set user_data_start, %o7
	.word 0x93902001  ! 261: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xab843f22  ! 262: WR_CLEAR_SOFTINT_I	wr	%r16, 0x1f22, %clear_softint
mondo_1_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d91c007  ! 263: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
	.word 0x91d02034  ! 264: Tcc_I	ta	icc_or_xcc, %r0 + 52
debug_1_139:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 265: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd43fea6f  ! 266: STD_I	std	%r10, [%r31 + 0x0a6f]
	.word 0xd427ea6f  ! 267: STW_I	stw	%r10, [%r31 + 0x0a6f]
	.word 0x99902000  ! 268: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
DS_1_140:
	.word 0x99a449c5  ! 1: FDIVd	fdivd	%f48, %f36, %f12
	pdist %f10, %f2, %f20
	.word 0x95b18306  ! 269: ALIGNADDRESS	alignaddr	%r6, %r6, %r10
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_141
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_141
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_141:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 270: RDPC	rd	%pc, %r13
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 271: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_1_142:
	setx 0xb9dac4eedfa51719, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 272: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x92d422ad  ! 273: UMULcc_I	umulcc 	%r16, 0x02ad, %r9
splash_cmpr_1_143:
	setx 0x7a665aa632892430, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 274: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_1_144:
	set user_data_start, %r31
	.word 0x8584f853  ! 275: WRCCR_I	wr	%r19, 0x1853, %ccr
	.word 0x9ba0c9d0  ! 276: FDIVd	fdivd	%f34, %f16, %f44
	setx 0x9b370da961fc489e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_145:
	.word 0x39400001  ! 277: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 278: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x9f802039  ! 279: SIR	sir	0x0039
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
	.word 0xd1e7e00d  ! 280: CASA_R	casa	[%r31] %asi, %r13, %r8
splash_tba_1_147:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa7a00171  ! 282: FABSq	dis not found

	.word 0xa1b40fe2  ! 283: FONES	e	%f16
	.word 0x97454000  ! 284: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
DS_1_148:
	.word 0x91a249d2  ! 1: FDIVd	fdivd	%f40, %f18, %f8
	.word 0xbfe7c000  ! 285: SAVE_R	save	%r31, %r0, %r31
DS_1_149:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe731c006  ! 1: STQF_R	-	%f19, [%r6, %r7]
	normalw
	.word 0xa9458000  ! 286: RD_SOFTINT_REG	rd	%softint, %r20
pmu_1_150:
	nop
	setx 0xfffff200fffff296, %g1, %g7
	.word 0xa3800007  ! 287: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_1_151:
	setx 0xa79ffd1c685c8b81, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 288: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91464000  ! 289: RD_STICK_CMPR_REG	rd	%-, %r8
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 290: Tcc_R	te	icc_or_xcc, %r0 + %r30
mondo_1_152:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d918010  ! 291: WRPR_WSTATE_R	wrpr	%r6, %r16, %wstate
	.word 0x986c67e2  ! 292: UDIVX_I	udivx 	%r17, 0x07e2, %r12
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_153:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e009  ! 293: CASA_R	casa	[%r31] %asi, %r9, %r8
	.word 0x99902002  ! 294: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x99520000  ! 295: RDPR_PIL	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01965  ! 296: FqTOd	dis not found

	.word 0x9f803fa6  ! 297: SIR	sir	0x1fa6
	.word 0xe69004a0  ! 298: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
splash_lsu_1_155:
	setx 0x3bfd1147afc26c79, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 299: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9540000  ! 300: RDPR_GL	<illegal instruction>
	.word 0x91d02035  ! 301: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_1_156:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 302: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0xe69fe723  ! 303: LDDA_I	ldda	[%r31, + 0x0723] %asi, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96b21c9  ! 304: SDIVX_I	sdivx	%r12, 0x01c9, %r20
splash_hpstate_1_158:
	.word 0x819825df  ! 305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05df, %hpstate
splash_cmpr_1_159:
	setx 0x819d0167624afc89, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_160:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 307: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_1_161:
	setx 0xb4281e0a9b09c365, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 308: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_162:
	setx 0x77d7b6458c75b410, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 309: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_163:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 310: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0xe86feafa  ! 311: LDSTUB_I	ldstub	%r20, [%r31 + 0x0afa]
	.word 0xe927c000  ! 312: STF_R	st	%f20, [%r0, %r31]
	.word 0xe88008a0  ! 313: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
debug_1_164:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 314: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_1_165:
	setx 0x885db62e7223f5c0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 315: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9844010  ! 316: WR_SET_SOFTINT_R	wr	%r17, %r16, %set_softint
	.word 0x99450000  ! 317: RD_SET_SOFTINT	rd	%set_softint, %r12
change_to_randtl_1_166:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_166:
	.word 0x8f902000  ! 318: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xab810006  ! 319: WR_CLEAR_SOFTINT_R	wr	%r4, %r6, %clear_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 320: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd527c000  ! 321: STF_R	st	%f10, [%r0, %r31]
change_to_randtl_1_167:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_167:
	.word 0x8f902003  ! 322: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
donret_1_168:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_168-donret_1_168), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_168:
	.word 0xd4ffeafa  ! 323: SWAPA_I	swapa	%r10, [%r31 + 0x0afa] %asi
	.word 0xa6ab400d  ! 324: ANDNcc_R	andncc 	%r13, %r13, %r19
	.word 0x97454000  ! 325: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa169e097  ! 326: SDIVX_I	sdivx	%r7, 0x0097, %r16
tagged_1_170:
	tsubcctv %r20, 0x1723, %r18
	.word 0xe607e364  ! 327: LDUW_I	lduw	[%r31 + 0x0364], %r19
splash_hpstate_1_171:
	.word 0x81982d77  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d77, %hpstate
	.word 0x8d802004  ! 329: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe71fc000  ! 330: LDDF_R	ldd	[%r31, %r0], %f19
splash_htba_1_172:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 331: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x94c4e5fb  ! 332: ADDCcc_I	addccc 	%r19, 0x05fb, %r10
memptr_1_173:
	set 0x60340000, %r31
	.word 0x8584eab1  ! 333: WRCCR_I	wr	%r19, 0x0ab1, %ccr
	.word 0xd53feb8f  ! 334: STDF_I	std	%f10, [0x0b8f, %r31]
	.word 0xa1902002  ! 335: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd48fe010  ! 336: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0x87802020  ! 337: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56a3bd0  ! 338: SDIVX_I	sdivx	%r8, 0xfffffbd0, %r18
	setx 0x502b2fb144b16302, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_175:
	.word 0x39400001  ! 339: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_1_176:
    set user_data_start, %o7
	.word 0x93902006  ! 340: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd23ff4d5  ! 341: STD_I	std	%r9, [%r31 + 0xfffff4d5]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956822bc  ! 342: SDIVX_I	sdivx	%r0, 0x02bc, %r10
	.word 0xd0d004a0  ! 343: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0xd00fc000  ! 344: LDUB_R	ldub	[%r31 + %r0], %r8
splash_tba_1_178:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 345: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd06ff250  ! 346: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff250]
DS_1_179:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd133000a  ! 1: STQF_R	-	%f8, [%r10, %r12]
	normalw
	.word 0x97458000  ! 347: RD_SOFTINT_REG	rd	%softint, %r11
intveclr_1_180:
	setx 0xf9ca55ca3e7f6907, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 348: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6c004a0  ! 349: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 350: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_1_181:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 351: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_1_182:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 352: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa5520000  ! 353: RDPR_PIL	<illegal instruction>
	.word 0x8d802000  ! 354: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_decr_1_183:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r10, [%r1] 0x45
	.word 0xa7830002  ! 355: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r2, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 356: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe68008a0  ! 357: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x95480000  ! 358: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x8d802000  ! 359: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd247c000  ! 360: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0xa190200e  ! 361: WRPR_GL_I	wrpr	%r0, 0x000e, %-
DS_1_184:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x97a089d3  ! 1: FDIVd	fdivd	%f2, %f50, %f42
	normalw
	.word 0x91458000  ! 362: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a0196c  ! 363: FqTOd	dis not found

intveclr_1_186:
	setx 0x1f6f31a3583e9b7d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_187:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 365: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802010  ! 366: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x879020e1  ! 367: WRPR_TT_I	wrpr	%r0, 0x00e1, %tt
splash_hpstate_1_188:
	.word 0x8198260f  ! 368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060f, %hpstate
	.word 0x24700001  ! 369: BPLE	<illegal instruction>
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
	.word 0x91414000  ! 370: RDPC	rd	%pc, %r8
	.word 0x8d90295c  ! 371: WRPR_PSTATE_I	wrpr	%r0, 0x095c, %pstate
splash_hpstate_1_190:
	.word 0x81982dc7  ! 372: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc7, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a0196a  ! 373: FqTOd	dis not found

	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 374: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 375: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_1_192:
	tsubcctv %r3, 0x14af, %r23
	.word 0xe207f250  ! 376: LDUW_I	lduw	[%r31 + 0xfffff250], %r17
	.word 0x9f8024e0  ! 377: SIR	sir	0x04e0
DS_1_193:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f14, %f4, %f18
	.word 0xa3b18301  ! 378: ALIGNADDRESS	alignaddr	%r6, %r1, %r17
splash_cmpr_1_194:
	setx 0xfe6223303e8d7563, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 379: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0x93414000  ! 380: RDPC	rd	%pc, %r9
	.word 0xe2cfe000  ! 381: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r17
	.word 0xe327edb2  ! 382: STF_I	st	%f17, [0x0db2, %r31]
tagged_1_196:
	tsubcctv %r6, 0x1154, %r23
	.word 0xe207edb2  ! 383: LDUW_I	lduw	[%r31 + 0x0db2], %r17
	setx 0x6c12c36745fe8035, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_197:
	.word 0x39400001  ! 384: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 385: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x87802010  ! 386: WRASI_I	wr	%r0, 0x0010, %asi
splash_decr_1_198:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa784c012  ! 387: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r18, %-
	.word 0x93a2c9d1  ! 388: FDIVd	fdivd	%f42, %f48, %f40
splash_lsu_1_199:
	setx 0xb66efc6d46ee0185, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 389: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d910000  ! 390: WRPR_WSTATE_R	wrpr	%r4, %r0, %wstate
splash_htba_1_201:
	set 0x003b0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r12
	.word 0x8b98000c  ! 391: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe137edb2  ! 392: STQF_I	-	%f16, [0x0db2, %r31]
	.word 0x87902061  ! 393: WRPR_TT_I	wrpr	%r0, 0x0061, %tt
tagged_1_202:
	tsubcctv %r26, 0x1e16, %r5
	.word 0xe007edb2  ! 394: LDUW_I	lduw	[%r31 + 0x0db2], %r16
	.word 0xe0d7e020  ! 395: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
debug_1_203:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 396: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 397: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_1_204:
	setx 0xaf95a2367f1c9d33, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_205:
	setx 0x0d05dc69367ff2be, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 400: BPNE	<illegal instruction>
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xa1902002  ! 1: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd0c804a0  ! 2: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
	.word 0xa5a149c8  ! 3: FDIVd	fdivd	%f36, %f8, %f18
pmu_0_0:
	nop
	setx 0xfffffaddfffffc2c, %g1, %g7
	.word 0xa3800007  ! 4: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_0_1:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 5: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_2
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_2:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 6: RDPC	rd	%pc, %r19
intveclr_0_3:
	setx 0x5c627bd3c6634be6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 7: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_4:
	tsubcctv %r8, 0x1092, %r8
	.word 0xe607e390  ! 8: LDUW_I	lduw	[%r31 + 0x0390], %r19
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_5:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e008  ! 9: CASA_R	casa	[%r31] %asi, %r8, %r19
	.word 0xad84ab7d  ! 10: WR_SOFTINT_REG_I	wr	%r18, 0x0b7d, %softint
	.word 0x8d9023c2  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x03c2, %pstate
	.word 0x9550c000  ! 12: RDPR_TT	<illegal instruction>
memptr_0_6:
	set user_data_start, %r31
	.word 0x8580fcd4  ! 13: WRCCR_I	wr	%r3, 0x1cd4, %ccr
	.word 0x87902191  ! 14: WRPR_TT_I	wrpr	%r0, 0x0191, %tt
	.word 0x97a0016d  ! 15: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_7
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_7:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 16: RDPC	rd	%pc, %r19
mondo_0_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d934012  ! 17: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
	.word 0xab82e431  ! 18: WR_CLEAR_SOFTINT_I	wr	%r11, 0x0431, %clear_softint
	.word 0x99902000  ! 19: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
cwp_0_9:
    set user_data_start, %o7
	.word 0x93902003  ! 20: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
cwp_0_10:
    set user_data_start, %o7
	.word 0x93902004  ! 21: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_0_11:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 22: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8790223d  ! 23: WRPR_TT_I	wrpr	%r0, 0x023d, %tt
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_12
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_12:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 24: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0xe727e431  ! 25: STF_I	st	%f19, [0x0431, %r31]
	.word 0xe68008a0  ! 26: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
memptr_0_13:
	set 0x60140000, %r31
	.word 0x858236bf  ! 27: WRCCR_I	wr	%r8, 0x16bf, %ccr
	.word 0xa4ac8013  ! 28: ANDNcc_R	andncc 	%r18, %r19, %r18
memptr_0_14:
	set 0x60340000, %r31
	.word 0x85847a58  ! 29: WRCCR_I	wr	%r17, 0x1a58, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 30: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4d804a0  ! 31: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	.word 0x87902073  ! 32: WRPR_TT_I	wrpr	%r0, 0x0073, %tt
splash_cmpr_0_15:
	setx 0xb534ac4e68c482a8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6b33f3  ! 34: SDIVX_I	sdivx	%r12, 0xfffff3f3, %r13
	.word 0xda8fe020  ! 35: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01968  ! 36: FqTOd	dis not found

	.word 0xd33fc000  ! 37: STDF_R	std	%f9, [%r0, %r31]
	.word 0xa6c17491  ! 38: ADDCcc_I	addccc 	%r5, 0xfffff491, %r19
cwp_0_18:
    set user_data_start, %o7
	.word 0x93902000  ! 39: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_decr_0_19:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r19, [%r1] 0x45
	.word 0xa7818002  ! 40: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r2, %-
	.word 0x87902176  ! 41: WRPR_TT_I	wrpr	%r0, 0x0176, %tt
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_20:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e002  ! 42: CASA_R	casa	[%r31] %asi, %r2, %r19
	.word 0xa5a00161  ! 43: FABSq	dis not found

	.word 0xe44ff491  ! 44: LDSB_I	ldsb	[%r31 + 0xfffff491], %r18
debug_0_21:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_21:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_21
    nop
debug_wait0_21:
    ld [%r23], %r16
    brnz %r16, debug_wait0_21
    nop
    ba,a debug_startwait0_21
continue_debug_0_21:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_21:
    cmp %r13, %r15
    bne,a wait_for_stat_0_21
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_21:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_21
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00492  ! 45: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
cwp_0_22:
    set user_data_start, %o7
	.word 0x93902001  ! 46: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6a6f00  ! 47: SDIVX_I	sdivx	%r9, 0x0f00, %r13
intveclr_0_24:
	setx 0xb00a68086a990098, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 48: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_25:
	setx 0x97ebda55cc3ff333, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 49: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_26:
	setx 0x818077db2dcda6d2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 50: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2e700001  ! 51: BPVS	<illegal instruction>
	.word 0xa9500000  ! 52: RDPR_TPC	<illegal instruction>
splash_cmpr_0_27:
	setx 0x2031688ae09e1aef, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 53: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802080  ! 54: WRASI_I	wr	%r0, 0x0080, %asi
splash_cmpr_0_28:
	setx 0x1fde57936d9881d9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_29:
	setx 0x1c52d750db473725, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 56: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 57: LDX_R	ldx	[%r31 + %r0], %r20
splash_cmpr_0_30:
	setx 0xa07456569e5fc700, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 58: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe86fef00  ! 59: LDSTUB_I	ldstub	%r20, [%r31 + 0x0f00]
	.word 0x9f8025d5  ! 60: SIR	sir	0x05d5
memptr_0_31:
	set 0x60340000, %r31
	.word 0x8580e96a  ! 61: WRCCR_I	wr	%r3, 0x096a, %ccr
debug_0_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 62: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_0_33:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 63: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_0_34:
	setx 0x20d5d2e0c15f0731, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 64: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_0_35:
	.word 0x81982315  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0315, %hpstate
	.word 0x8d903bc7  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x1bc7, %pstate
tagged_0_36:
	tsubcctv %r20, 0x17f2, %r26
	.word 0xe807e96a  ! 67: LDUW_I	lduw	[%r31 + 0x096a], %r20
splash_tba_0_37:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 68: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_38) + 40, 16, 16)) -> intp(1,0,16)
intvec_0_38:
	.word 0x39400001  ! 69: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_39:
	setx 0x0313ada7c37fa483, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_40) + 0, 16, 16)) -> intp(0,0,18)
intvec_0_40:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_41:
	taddcctv %r20, 0x12f3, %r1
	.word 0xe807e96a  ! 72: LDUW_I	lduw	[%r31 + 0x096a], %r20
	.word 0x95454000  ! 73: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	.word 0x9ba409c6  ! 74: FDIVd	fdivd	%f16, %f6, %f44
	.word 0x9ba049c0  ! 75: FDIVd	fdivd	%f32, %f0, %f44
mondo_0_42:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d914010  ! 76: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
	.word 0x91450000  ! 77: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0xd08008a0  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_43:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 79: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01961  ! 80: FqTOd	dis not found

intveclr_0_45:
	setx 0xd1b69c8a7ab35859, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 81: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_46:
	setx 0x49784e518ea531f7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 82: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_47:
	setx 0x6c8cc4a170628cea, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 83: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_0_48:
	set user_data_start, %r31
	.word 0x8584af80  ! 84: WRCCR_I	wr	%r18, 0x0f80, %ccr
	.word 0x87802016  ! 85: WRASI_I	wr	%r0, 0x0016, %asi
cmp_0_49:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_49:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_49
    nop
cmp_wait0_49:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_49
    nop
    ba,a cmp_startwait0_49
continue_cmp_0_49:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 2, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9190000d  ! 86: WRPR_PIL_R	wrpr	%r0, %r13, %pil
splash_cmpr_0_50:
	setx 0x8fd25c5cdc808960, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 87: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_51:
	setx 0xd74bd682669823d9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 88: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 89: BPN	<illegal instruction>
memptr_0_52:
	set 0x60340000, %r31
	.word 0x858130a9  ! 90: WRCCR_I	wr	%r4, 0x10a9, %ccr
	.word 0xe26ff0a9  ! 91: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff0a9]
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 92: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91450000  ! 93: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0xd08008a0  ! 94: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
memptr_0_53:
	set 0x60540000, %r31
	.word 0x8582b3d6  ! 95: WRCCR_I	wr	%r10, 0x13d6, %ccr
	.word 0xd00ff3d6  ! 96: LDUB_I	ldub	[%r31 + 0xfffff3d6], %r8
	.word 0x87802089  ! 97: WRASI_I	wr	%r0, 0x0089, %asi
intveclr_0_54:
	setx 0x34384f42d4b7dbea, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 98: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_55:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 99: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_0_56:
	setx 0x8e36cc9cec443415, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_0_57:
    set user_data_start, %o7
	.word 0x93902005  ! 101: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 102: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_0_58:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 103: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
donret_0_59:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_59-donret_0_59-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_59:
	.word 0xd0fff3d6  ! 104: SWAPA_I	swapa	%r8, [%r31 + 0xfffff3d6] %asi
debug_0_60:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_60:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_60
    nop
debug_wait0_60:
    ld [%r23], %r16
    brnz %r16, debug_wait0_60
    nop
    ba,a debug_startwait0_60
continue_debug_0_60:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_60:
    cmp %r13, %r15
    bne,a wait_for_stat_0_60
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_60:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_60
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe0f00492  ! 105: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0x87802058  ! 106: WRASI_I	wr	%r0, 0x0058, %asi
DS_0_61:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f30, %f0, %f2
	.word 0x9bb00313  ! 107: ALIGNADDRESS	alignaddr	%r0, %r19, %r13
	.word 0xa0acc002  ! 108: ANDNcc_R	andncc 	%r19, %r2, %r16
splash_hpstate_0_62:
	.word 0x8198281c  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081c, %hpstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_63:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e002  ! 110: CASA_R	casa	[%r31] %asi, %r2, %r16
memptr_0_64:
	set 0x60140000, %r31
	.word 0x8584aac5  ! 111: WRCCR_I	wr	%r18, 0x0ac5, %ccr
	.word 0xe0bfc020  ! 112: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	.word 0xe0800b80  ! 113: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r16
donret_0_65:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_65-donret_0_65-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_65:
	.word 0xe0ffeac5  ! 114: SWAPA_I	swapa	%r16, [%r31 + 0x0ac5] %asi
	.word 0xe06feac5  ! 115: LDSTUB_I	ldstub	%r16, [%r31 + 0x0ac5]
splash_cmpr_0_66:
	setx 0x39176513c493e2cb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 116: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_0_67:
	set 0x60540000, %r31
	.word 0x85837dfd  ! 117: WRCCR_I	wr	%r13, 0x1dfd, %ccr
splash_lsu_0_68:
	setx 0x7d696d32d459f08b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 118: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_0_69:
	nop
	setx 0xfffff4e0fffff094, %g1, %g7
	.word 0xa3800007  ! 119: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x34700001  ! 120: BPG	<illegal instruction>
	.word 0xe077c000  ! 121: STX_R	stx	%r16, [%r31 + %r0]
mondo_0_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d93400b  ! 122: WRPR_WSTATE_R	wrpr	%r13, %r11, %wstate
debug_0_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 123: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 124: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_72:
	setx 0x6dfbeffc3902109d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 125: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_0_73:
	nop
	setx 0xfffff470fffff54a, %g1, %g7
	.word 0xa3800007  ! 126: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_0_74:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d948012  ! 127: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
	.word 0xa1902006  ! 128: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xe06ffdfd  ! 129: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffdfd]
	.word 0xe077fdfd  ! 130: STX_I	stx	%r16, [%r31 + 0xfffffdfd]
	.word 0x8790218c  ! 131: WRPR_TT_I	wrpr	%r0, 0x018c, %tt
memptr_0_75:
	set user_data_start, %r31
	.word 0x8584602e  ! 132: WRCCR_I	wr	%r17, 0x002e, %ccr
	.word 0x91500000  ! 133: RDPR_TPC	<illegal instruction>
	.word 0x87902142  ! 134: WRPR_TT_I	wrpr	%r0, 0x0142, %tt
	.word 0xd0d7e030  ! 135: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
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
	.word 0x99414000  ! 136: RDPC	rd	%pc, %r12
	.word 0xd927c000  ! 137: STF_R	st	%f12, [%r0, %r31]
	.word 0xd88008a0  ! 138: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_cmpr_0_77:
	setx 0xe369dfc4c9040f82, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 139: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879020f9  ! 140: WRPR_TT_I	wrpr	%r0, 0x00f9, %tt
	.word 0xa1902009  ! 141: WRPR_GL_I	wrpr	%r0, 0x0009, %-
DS_0_78:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe145a928	! Random illegal ?
	.word 0x9ba149d2  ! 1: FDIVd	fdivd	%f36, %f18, %f44
	.word 0xa9a2482d  ! 142: FADDs	fadds	%f9, %f13, %f20
	.word 0xa1902002  ! 143: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa3a00174  ! 144: FABSq	dis not found

splash_tba_0_79:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 145: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 146: LDX_R	ldx	[%r31 + %r0], %r17
mondo_0_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d908007  ! 147: WRPR_WSTATE_R	wrpr	%r2, %r7, %wstate
	.word 0xe2d00e60  ! 148: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r17
pmu_0_81:
	nop
	setx 0xfffff9b5fffffcf5, %g1, %g7
	.word 0xa3800007  ! 149: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02034  ! 150: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe2800ae0  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r17
	.word 0x93d02035  ! 152: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xa1902006  ! 153: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8d9023a1  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x03a1, %pstate
	.word 0x9f8029ea  ! 155: SIR	sir	0x09ea
splash_hpstate_0_82:
	.word 0x81982a16  ! 156: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a16, %hpstate
	.word 0xe2cfe020  ! 157: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r17
tagged_0_83:
	taddcctv %r24, 0x1cb4, %r14
	.word 0xe207e9ea  ! 158: LDUW_I	lduw	[%r31 + 0x09ea], %r17
cwp_0_84:
    set user_data_start, %o7
	.word 0x93902002  ! 159: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91d02034  ! 160: Tcc_I	ta	icc_or_xcc, %r0 + 52
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 161: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_0_85:
	.word 0x81982ece  ! 162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ece, %hpstate
	.word 0xe20fe9ea  ! 163: LDUB_I	ldub	[%r31 + 0x09ea], %r17
	.word 0xe2dfe010  ! 164: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r17
debug_0_86:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 165: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
cmp_0_87:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_87:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_87
    nop
cmp_wait0_87:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_87
    nop
    ba,a cmp_startwait0_87
continue_cmp_0_87:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 32, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91948004  ! 166: WRPR_PIL_R	wrpr	%r18, %r4, %pil
	.word 0xa1902009  ! 167: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xe26fe9ea  ! 168: LDSTUB_I	ldstub	%r17, [%r31 + 0x09ea]
splash_hpstate_0_88:
	.word 0x81982914  ! 169: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0914, %hpstate
memptr_0_89:
	set 0x60540000, %r31
	.word 0x858320a3  ! 170: WRCCR_I	wr	%r12, 0x00a3, %ccr
	.word 0x81b01021  ! 171: SIAM	siam	1
splash_cmpr_0_90:
	setx 0xf30007711c25164e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_91:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 173: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_0_92:
	setx 0x363c8a91d904a40b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 174: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 175: WRASI_I	wr	%r0, 0x0089, %asi
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
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00492  ! 176: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
splash_cmpr_0_94:
	setx 0xb2ca763aef5faf4a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_95:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d928001  ! 178: WRPR_WSTATE_R	wrpr	%r10, %r1, %wstate
	.word 0xe26fe0a3  ! 179: LDSTUB_I	ldstub	%r17, [%r31 + 0x00a3]
	.word 0x95a0016c  ! 180: FABSq	dis not found

splash_tba_0_96:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 181: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1902006  ! 182: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_tba_0_97:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 183: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_0_98:
    set user_data_start, %o7
	.word 0x93902003  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
mondo_0_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d940007  ! 185: WRPR_WSTATE_R	wrpr	%r16, %r7, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01967  ! 186: FqTOd	dis not found

intveclr_0_101:
	setx 0x6f5081037b16e320, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 187: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_0_102:
	set 0x00380000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r12
	.word 0x8b98000c  ! 188: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d802000  ! 189: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902008  ! 190: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xe127c000  ! 191: STF_R	st	%f16, [%r0, %r31]
	.word 0xe007c000  ! 192: LDUW_R	lduw	[%r31 + %r0], %r16
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_103:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e007  ! 193: CASA_R	casa	[%r31] %asi, %r7, %r16
splash_cmpr_0_104:
	setx 0x3b1ddfe479a50cb4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 194: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 195: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91450000  ! 196: RD_SET_SOFTINT	rd	%set_softint, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 197: LDX_R	ldx	[%r31 + %r0], %r8
DS_0_105:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa7b00312  ! 198: ALIGNADDRESS	alignaddr	%r0, %r18, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 199: LDX_R	ldx	[%r31 + %r0], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 200: LDX_R	ldx	[%r31 + %r0], %r19
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 201: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_0_106:
	setx 0x22b1a9d24ca62ea5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_107:
	setx 0xc6cca4cd570ec854, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 203: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a00168  ! 204: FABSq	dis not found

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
	.word 0x93414000  ! 205: RDPC	rd	%pc, %r9
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 206: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_109
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_109:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 207: RDPC	rd	%pc, %r17
	.word 0xe257c000  ! 208: LDSH_R	ldsh	[%r31 + %r0], %r17
cmp_0_110:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_110:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_110
    nop
cmp_wait0_110:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_110
    nop
    ba,a cmp_startwait0_110
continue_cmp_0_110:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x6a, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9192800c  ! 209: WRPR_PIL_R	wrpr	%r10, %r12, %pil
DS_0_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x9bb5030a  ! 210: ALIGNADDRESS	alignaddr	%r20, %r10, %r13
	.word 0x8d802000  ! 211: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa5a00572  ! 212: FSQRTq	fsqrt	
	.word 0xe4dfe020  ! 213: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_112)+8, 16, 16)) -> intp(0,1,3)
xir_0_112:
	.word 0xa982ea66  ! 214: WR_SET_SOFTINT_I	wr	%r11, 0x0a66, %set_softint
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 215: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_0_113:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 216: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_114:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 217: CASA_R	casa	[%r31] %asi, %r18, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 218: LDX_R	ldx	[%r31 + %r0], %r18
debug_0_115:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 219: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe48008a0  ! 220: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa1902005  ! 221: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x22800001  ! 222: BE	be,a	<label_0x1>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_116:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 223: CASA_R	casa	[%r31] %asi, %r18, %r18
	.word 0xe537c000  ! 224: STQF_R	-	%f18, [%r0, %r31]
change_to_randtl_0_117:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_117:
	.word 0x8f902003  ! 225: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x3e700001  ! 226: BPVC	<illegal instruction>
	.word 0xad837c7a  ! 227: WR_SOFTINT_REG_I	wr	%r13, 0x1c7a, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_118)+56, 16, 16)) -> intp(0,1,3)
xir_0_118:
	.word 0xa9812228  ! 228: WR_SET_SOFTINT_I	wr	%r4, 0x0228, %set_softint
	.word 0x879021d4  ! 229: WRPR_TT_I	wrpr	%r0, 0x01d4, %tt
	.word 0xe45fe228  ! 230: LDX_I	ldx	[%r31 + 0x0228], %r18
	.word 0x8790224e  ! 231: WRPR_TT_I	wrpr	%r0, 0x024e, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 232: LDX_R	ldx	[%r31 + %r0], %r18
debug_0_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 233: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_0_120:
	set user_data_start, %r31
	.word 0x85842e48  ! 234: WRCCR_I	wr	%r16, 0x0e48, %ccr
debug_0_121:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 235: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x24800001  ! 236: BLE	ble,a	<label_0x1>
	.word 0x22800001  ! 237: BE	be,a	<label_0x1>
DS_0_122:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 238: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_123
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_123
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_123:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 239: RDPC	rd	%pc, %r20
	.word 0x99500000  ! 240: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_124) + 8, 16, 16)) -> intp(0,0,7)
intvec_0_124:
	.word 0x39400001  ! 241: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd82fee48  ! 242: STB_I	stb	%r12, [%r31 + 0x0e48]
splash_cmpr_0_125:
	setx 0x56f0a220555aaab7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916afb03  ! 244: SDIVX_I	sdivx	%r11, 0xfffffb03, %r8
tagged_0_127:
	taddcctv %r11, 0x1a5a, %r23
	.word 0xd007fb03  ! 245: LDUW_I	lduw	[%r31 + 0xfffffb03], %r8
splash_lsu_0_128:
	setx 0xb1243a8a543074d7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 246: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_129:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 247: SAVE_R	save	%r31, %r0, %r31
DS_0_130:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 248: RESTORE_R	restore	%r31, %r0, %r31
tagged_0_131:
	taddcctv %r24, 0x148f, %r12
	.word 0xd007fb03  ! 249: LDUW_I	lduw	[%r31 + 0xfffffb03], %r8
	.word 0xd06ffb03  ! 250: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffffb03]
	.word 0x87902216  ! 251: WRPR_TT_I	wrpr	%r0, 0x0216, %tt
splash_cmpr_0_132:
	setx 0x3cee2a44703d3378, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 252: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_133:
	setx 0x76fd986bb6709ee7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_134:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 254: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d020b4  ! 255: Tcc_I	ta	icc_or_xcc, %r0 + 180
intveclr_0_135:
	setx 0x5b7b69f371023039, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 256: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9280800d  ! 257: ADDcc_R	addcc 	%r2, %r13, %r9
	.word 0xd2cfe020  ! 258: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r9
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_136
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_136:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 259: RDPC	rd	%pc, %r10
	.word 0xd4d004a0  ! 260: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
cwp_0_137:
    set user_data_start, %o7
	.word 0x93902001  ! 261: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xab81ea6f  ! 262: WR_CLEAR_SOFTINT_I	wr	%r7, 0x0a6f, %clear_softint
mondo_0_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d924000  ! 263: WRPR_WSTATE_R	wrpr	%r9, %r0, %wstate
	.word 0x91d020b5  ! 264: Tcc_I	ta	icc_or_xcc, %r0 + 181
debug_0_139:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 265: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd43fea6f  ! 266: STD_I	std	%r10, [%r31 + 0x0a6f]
	.word 0xd427ea6f  ! 267: STW_I	stw	%r10, [%r31 + 0x0a6f]
	.word 0x99902000  ! 268: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
DS_0_140:
	.word 0x9ba409c2  ! 1: FDIVd	fdivd	%f16, %f2, %f44
	pdist %f6, %f20, %f26
	.word 0x97b1c307  ! 269: ALIGNADDRESS	alignaddr	%r7, %r7, %r11
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_141
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_141
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_141:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 270: RDPC	rd	%pc, %r19
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 271: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_142:
	setx 0xfcbfca62e8ca05cf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 272: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x98d4a91d  ! 273: UMULcc_I	umulcc 	%r18, 0x091d, %r12
splash_cmpr_0_143:
	setx 0xe77b53d2477f9ca0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 274: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_0_144:
	set user_data_start, %r31
	.word 0x85852748  ! 275: WRCCR_I	wr	%r20, 0x0748, %ccr
	.word 0x91a009cd  ! 276: FDIVd	fdivd	%f0, %f44, %f8
	setx 0xcdccdf95a00735a1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_145:
	.word 0x39400001  ! 277: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 278: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x9f803bb9  ! 279: SIR	sir	0x1bb9
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
	.word 0xd1e7e00d  ! 280: CASA_R	casa	[%r31] %asi, %r13, %r8
splash_tba_0_147:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9ba00167  ! 282: FABSq	dis not found

	.word 0x97b4cfe8  ! 283: FONES	e	%f11
	.word 0x97454000  ! 284: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
DS_0_148:
	.word 0x9ba289cd  ! 1: FDIVd	fdivd	%f10, %f44, %f44
	.word 0xbfe7c000  ! 285: SAVE_R	save	%r31, %r0, %r31
DS_0_149:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe132c000  ! 1: STQF_R	-	%f16, [%r0, %r11]
	normalw
	.word 0xa5458000  ! 286: RD_SOFTINT_REG	rd	%softint, %r18
pmu_0_150:
	nop
	setx 0xfffff89efffff16f, %g1, %g7
	.word 0xa3800007  ! 287: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_0_151:
	setx 0xb441893719bb72f0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 288: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97464000  ! 289: RD_STICK_CMPR_REG	rd	%-, %r11
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 290: Tcc_R	te	icc_or_xcc, %r0 + %r30
mondo_0_152:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d950009  ! 291: WRPR_WSTATE_R	wrpr	%r20, %r9, %wstate
	.word 0x906cfe24  ! 292: UDIVX_I	udivx 	%r19, 0xfffffe24, %r8
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_153:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e009  ! 293: CASA_R	casa	[%r31] %asi, %r9, %r8
	.word 0x99902004  ! 294: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x97520000  ! 295: RDPR_PIL	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01970  ! 296: FqTOd	dis not found

	.word 0x9f802723  ! 297: SIR	sir	0x0723
	.word 0xe69004a0  ! 298: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
splash_lsu_0_155:
	setx 0x6869aa422a632271, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 299: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7540000  ! 300: RDPR_GL	<illegal instruction>
	.word 0x83d02033  ! 301: Tcc_I	te	icc_or_xcc, %r0 + 51
debug_0_156:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_156:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_156
    nop
debug_wait0_156:
    ld [%r23], %r16
    brnz %r16, debug_wait0_156
    nop
    ba,a debug_startwait0_156
continue_debug_0_156:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_156:
    cmp %r13, %r15
    bne,a wait_for_stat_0_156
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_156:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_156
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00492  ! 302: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0xe69fe723  ! 303: LDDA_I	ldda	[%r31, + 0x0723] %asi, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96b2afa  ! 304: SDIVX_I	sdivx	%r12, 0x0afa, %r20
splash_hpstate_0_158:
	.word 0x81982346  ! 305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0346, %hpstate
splash_cmpr_0_159:
	setx 0xf2da8f1ec4544e28, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_160:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 307: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_161:
	setx 0xbf334a6281db8ba7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 308: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_162:
	setx 0x08265e05aceabcf2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 309: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_163:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 310: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0xe86feafa  ! 311: LDSTUB_I	ldstub	%r20, [%r31 + 0x0afa]
	.word 0xe927c000  ! 312: STF_R	st	%f20, [%r0, %r31]
	.word 0xe88008a0  ! 313: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
debug_0_164:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 314: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_0_165:
	setx 0xe06538f86f1c7db9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 315: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9808013  ! 316: WR_SET_SOFTINT_R	wr	%r2, %r19, %set_softint
	.word 0x95450000  ! 317: RD_SET_SOFTINT	rd	%set_softint, %r10
change_to_randtl_0_166:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_166:
	.word 0x8f902001  ! 318: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xab80800a  ! 319: WR_CLEAR_SOFTINT_R	wr	%r2, %r10, %clear_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 320: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd527c000  ! 321: STF_R	st	%f10, [%r0, %r31]
change_to_randtl_0_167:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_167:
	.word 0x8f902000  ! 322: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
donret_0_168:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_168-donret_0_168), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_168:
	.word 0xd4ffeafa  ! 323: SWAPA_I	swapa	%r10, [%r31 + 0x0afa] %asi
	.word 0x98ac4011  ! 324: ANDNcc_R	andncc 	%r17, %r17, %r12
	.word 0x93454000  ! 325: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76a6364  ! 326: SDIVX_I	sdivx	%r9, 0x0364, %r19
tagged_0_170:
	tsubcctv %r25, 0x1c60, %r14
	.word 0xe607e364  ! 327: LDUW_I	lduw	[%r31 + 0x0364], %r19
splash_hpstate_0_171:
	.word 0x81982a74  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a74, %hpstate
	.word 0x8d802000  ! 329: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe71fc000  ! 330: LDDF_R	ldd	[%r31, %r0], %f19
splash_htba_0_172:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 331: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x94c0a2ad  ! 332: ADDCcc_I	addccc 	%r2, 0x02ad, %r10
memptr_0_173:
	set 0x60340000, %r31
	.word 0x8580eb8f  ! 333: WRCCR_I	wr	%r3, 0x0b8f, %ccr
	.word 0xd53feb8f  ! 334: STDF_I	std	%f10, [0x0b8f, %r31]
	.word 0xa1902008  ! 335: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd48fe030  ! 336: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
	.word 0x8780201c  ! 337: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936cb4d5  ! 338: SDIVX_I	sdivx	%r18, 0xfffff4d5, %r9
	setx 0xfdf2d3e189ad333f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_175:
	.word 0x39400001  ! 339: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_0_176:
    set user_data_start, %o7
	.word 0x93902002  ! 340: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd23ff4d5  ! 341: STD_I	std	%r9, [%r31 + 0xfffff4d5]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916a7250  ! 342: SDIVX_I	sdivx	%r9, 0xfffff250, %r8
	.word 0xd0d00e40  ! 343: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r8
	.word 0xd00fc000  ! 344: LDUB_R	ldub	[%r31 + %r0], %r8
splash_tba_0_178:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 345: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd06ff250  ! 346: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff250]
DS_0_179:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd9344004  ! 1: STQF_R	-	%f12, [%r4, %r17]
	normalw
	.word 0x97458000  ! 347: RD_SOFTINT_REG	rd	%softint, %r11
intveclr_0_180:
	setx 0x9cd18a057b45ec8b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 348: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6c004a0  ! 349: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 350: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_0_181:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 351: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_0_182:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 352: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa7520000  ! 353: RDPR_PIL	<illegal instruction>
	.word 0x8d802004  ! 354: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_decr_0_183:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r19, [%r1] 0x45
	.word 0xa7818010  ! 355: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r16, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 356: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe68008a0  ! 357: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x93480000  ! 358: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x8d802004  ! 359: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd247c000  ! 360: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0xa1902000  ! 361: WRPR_GL_I	wrpr	%r0, 0x0000, %-
DS_0_184:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x95a109c0  ! 1: FDIVd	fdivd	%f4, %f0, %f10
	normalw
	.word 0x97458000  ! 362: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0196d  ! 363: FqTOd	dis not found

intveclr_0_186:
	setx 0x9f6edb3a62fbe7b7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_187:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 365: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8780208a  ! 366: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0x87902094  ! 367: WRPR_TT_I	wrpr	%r0, 0x0094, %tt
splash_hpstate_0_188:
	.word 0x8198289f  ! 368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089f, %hpstate
	.word 0x24700001  ! 369: BPLE	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_189:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 370: RDPC	rd	%pc, %r10
	.word 0x8d903920  ! 371: WRPR_PSTATE_I	wrpr	%r0, 0x1920, %pstate
splash_hpstate_0_190:
	.word 0x8198200c  ! 372: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000c, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01971  ! 373: FqTOd	dis not found

	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 374: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 375: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_192:
	tsubcctv %r17, 0x1d30, %r4
	.word 0xe207f250  ! 376: LDUW_I	lduw	[%r31 + 0xfffff250], %r17
	.word 0x9f802db2  ! 377: SIR	sir	0x0db2
DS_0_193:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f16, %f30, %f14
	.word 0xa9b20311  ! 378: ALIGNADDRESS	alignaddr	%r8, %r17, %r20
splash_cmpr_0_194:
	setx 0x2a7e6d81a23f0a6e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 379: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xa3414000  ! 380: RDPC	rd	%pc, %r17
	.word 0xe2cfe030  ! 381: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r17
	.word 0xe327edb2  ! 382: STF_I	st	%f17, [0x0db2, %r31]
tagged_0_196:
	tsubcctv %r25, 0x1980, %r18
	.word 0xe207edb2  ! 383: LDUW_I	lduw	[%r31 + 0x0db2], %r17
	setx 0xa7f3646f2c68872a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_197:
	.word 0x39400001  ! 384: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 385: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8780208a  ! 386: WRASI_I	wr	%r0, 0x008a, %asi
splash_decr_0_198:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa780c003  ! 387: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r3, %-
	.word 0xa1a249cd  ! 388: FDIVd	fdivd	%f40, %f44, %f16
splash_lsu_0_199:
	setx 0x870b271b58fc3ab5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 389: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d930013  ! 390: WRPR_WSTATE_R	wrpr	%r12, %r19, %wstate
splash_htba_0_201:
	set 0x00380000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r12
	.word 0x8b98000c  ! 391: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe137edb2  ! 392: STQF_I	-	%f16, [0x0db2, %r31]
	.word 0x879022b7  ! 393: WRPR_TT_I	wrpr	%r0, 0x02b7, %tt
tagged_0_202:
	tsubcctv %r23, 0x13ac, %r6
	.word 0xe007edb2  ! 394: LDUW_I	lduw	[%r31 + 0x0db2], %r16
	.word 0xe0d7e030  ! 395: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
debug_0_203:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 396: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 397: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_204:
	setx 0xb7a273bc3053f2f1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 398: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_205:
	setx 0xfa3b11ef5a107fa0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 400: BPNE	<illegal instruction>
cmpenall_0_206:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmpenall_startwait0_206:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_0_206
    nop
cmpenall_wait0_206:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait0_206
    nop
    ba,a cmpenall_startwait0_206
continue_cmpenall_0_206:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_0_206:
    cmp %r13, %r15
    bne,a wait_for_cmpstat_0_206
    ldxa [0x58]%asi, %r15       !Running_status
    mov 0xff, %r14              !All threads running
    stxa %r14, [0x50]%asi 
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_cmpstat2_0_206:
    cmp %r14, %r15
    bne,a wait_for_cmpstat2_0_206
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

	.xword	0x06c4c93f0acc4458
	.xword	0x86721eb54f1cd469
	.xword	0xb2b1019605b12521
	.xword	0x024975e42e862ac3
	.xword	0xcfd2e48a9bdd8420
	.xword	0x7a43c06430aa6a5b
	.xword	0x2db3f55cd0441965
	.xword	0x42fafdc8d88db356
	.xword	0xa4df08e24ed6087c
	.xword	0x90d687e102fa4956
	.xword	0xfe4b715e3c108021
	.xword	0x7d6110837a704e4c
	.xword	0xc021fadbe5b73757
	.xword	0x96ccdb0fc2eda510
	.xword	0xdb8a50e347f901f6
	.xword	0x878881ed7803d46d
	.xword	0x27a161f2213fa246
	.xword	0xdd64c24d20f4479f
	.xword	0x333790ce463645c5
	.xword	0x4b174bacd5fe103a
	.xword	0x9bd3852abd164e01
	.xword	0xf76b8afba785ecfc
	.xword	0x2bdb1260b35de737
	.xword	0x5de660285dd3cab1
	.xword	0x42270f958e310a44
	.xword	0x0ca0dfbf3569372b
	.xword	0xd4b29a5d8d29bb3d
	.xword	0x2f01ad6de52dac3c
	.xword	0xe0fccba1f09acfb0
	.xword	0xc1b4ef03b6c7a9fd
	.xword	0xe9ee4499aeec2b75
	.xword	0x4ed394c8f71de2b1
	.xword	0x87fa57dcd57cff4e
	.xword	0x0bf649efa9c28702
	.xword	0x21063ad8eaaa7981
	.xword	0xa1198e098a597d94
	.xword	0x7a35840b979596d4
	.xword	0x55d039949a8ee2f3
	.xword	0x29edf51631706cca
	.xword	0x8697dcb830cdf16c
	.xword	0x782e6a4cb805db9a
	.xword	0x9ecfb5a50a4ae295
	.xword	0x932cc0d778b1c1d0
	.xword	0x932af2b807505b66
	.xword	0x1f5c3e0c3b3b4192
	.xword	0x1ad10d4e89d9b369
	.xword	0xc8ec704c66eb9650
	.xword	0xbe71886e32c8eb52
	.xword	0x65cfa399a820f303
	.xword	0xfc4a94ef6236b395
	.xword	0x124a44ea81fe45bd
	.xword	0xc4dbcdda927f5907
	.xword	0x7ec96c22f843a481
	.xword	0x5f986203bd6c163e
	.xword	0xdcfd4aa738319284
	.xword	0xfc03f7e069dd2774
	.xword	0x2f95b3d561bad2b2
	.xword	0xb09874dd04986bbd
	.xword	0xe9c41e896f458c4b
	.xword	0x045b5bfa3179d012
	.xword	0x024d398b47239625
	.xword	0x974d8f45e4bc59b5
	.xword	0x91fbce078f958817
	.xword	0x9382b6acfd53cda6
	.xword	0xdf9529660f87570f
	.xword	0xafd1f2ffd3e9b8f9
	.xword	0xff3c797cc59420a6
	.xword	0xd4206d5e1a60743e
	.xword	0x0e54000a03ec1ff8
	.xword	0x12f48ab02db5b176
	.xword	0x0ec2647b025b14f6
	.xword	0x6ff96969cbb7eaa7
	.xword	0x193ed723ccb6f433
	.xword	0xae671cf7e9a9187b
	.xword	0x605bf5222f89b814
	.xword	0x3c6f5bb038d63d04
	.xword	0xef79aedb9acc11a9
	.xword	0x6b4b24b429e1373b
	.xword	0x56763080d335d5a2
	.xword	0xcfe3f330c48f92c5
	.xword	0xe375bb91ee688a41
	.xword	0xeba66f46bdc1571a
	.xword	0x99a8e9c2095c0caf
	.xword	0xae6b886754c48ac1
	.xword	0x7d646ed5fe57636c
	.xword	0x77c129f76e648fd9
	.xword	0x25c9b9a1bab9cda1
	.xword	0x76bf16b7fd0b5a1e
	.xword	0x86d2458b9bacb4b0
	.xword	0xf23c8f1a17554969
	.xword	0x1a5e248876decf0c
	.xword	0x80ab7109c08f22a4
	.xword	0xb58af638feb19a03
	.xword	0x7e4b8d2d67ad2b39
	.xword	0xb31b1e32a5997e7e
	.xword	0x1ecfee5d49c62883
	.xword	0xf0d374b6165b2d03
	.xword	0x9fba8e8577bfb733
	.xword	0xe25c971347219955
	.xword	0x2f4a9fcdb4b58785
	.xword	0xc8479c00acd86063
	.xword	0x7edaf58eb4f54d88
	.xword	0x308a19f8b018bd03
	.xword	0xec026912e51ace20
	.xword	0x420fd8575ae6b2f8
	.xword	0x9281382cbdf43ad5
	.xword	0x796d0bb92a091389
	.xword	0x6574da12e50c506d
	.xword	0x0bb19860fe0d3fea
	.xword	0xd5c7c674514ae06f
	.xword	0x00cedac50409cab7
	.xword	0xeec22fd7927d2f44
	.xword	0xb3ac9ff0845abca9
	.xword	0xe87348dfb8dbc892
	.xword	0xfa5bb0970a042623
	.xword	0xdd10ba21dcf24f62
	.xword	0xbd6c698f1230f096
	.xword	0xe51796959691f317
	.xword	0x0f229ebb5635b547
	.xword	0x48116a2c3c9577cd
	.xword	0xa44c76f45121f168
	.xword	0x8f4bd5967872e945
	.xword	0x0f47e7b983898fc9
	.xword	0x679eec48cafe8629
	.xword	0xa6773e27df2da0f2
	.xword	0x279583e4b808c132
	.xword	0x9bb3f42746e59873
	.xword	0x7e8fef5b547e8f3e
	.xword	0x97a6a646226055f9
	.xword	0xc4e5a339aa4b19b6
	.xword	0xb57e6c0d8be21165
	.xword	0xfeed322a520d602b
	.xword	0x090776eb1fa79c78
	.xword	0xbd9661d8c6060be9
	.xword	0x6647b082a5cce667
	.xword	0xb7fa76c4548e0dca
	.xword	0xbeea309efdc84521
	.xword	0x9076053679e87095
	.xword	0x30a686a461208064
	.xword	0xd868167aaf0b1e23
	.xword	0xfcf750e802fd65f0
	.xword	0x34e6448cef094e85
	.xword	0x733dc9e30223cfca
	.xword	0xd7d1bea2970af0f7
	.xword	0x7fab6f55969a8a71
	.xword	0xacb37dcb6277f3c3
	.xword	0x435262c9de9e9a6c
	.xword	0xf5cac1a8436a88cc
	.xword	0xbcb5f54829a35305
	.xword	0x4876dcaaa30b9308
	.xword	0x7f5dc6eb05977fd1
	.xword	0x45e4bb6fc89c05a5
	.xword	0x4304ebac563704d4
	.xword	0xc58b33d07b895dea
	.xword	0x0b154c87a3e4d775
	.xword	0x95cbf86fb2186331
	.xword	0xf2c19396d3ce9adb
	.xword	0xbe95feae0418a553
	.xword	0x09230f61d6ae4972
	.xword	0xa17b4968110c4413
	.xword	0xada0e6436b722ec0
	.xword	0x9607aefe55d4e197
	.xword	0xa4db59e4887d8500
	.xword	0x47a6c9c64c5d8288
	.xword	0x70c3df5e188122b2
	.xword	0xc304249d0929c121
	.xword	0x414ec1f2d2657e27
	.xword	0xbe0bc0fe972a7dd7
	.xword	0xe62a57a3620d3f0b
	.xword	0xbea9eacee41623bf
	.xword	0x1a849512ca17859a
	.xword	0x20953514c286ba4f
	.xword	0x0258b473978d92b8
	.xword	0x65cb1aa3743e90cb
	.xword	0xfeb0f9d7f1be54e4
	.xword	0xd158f34aefaed2cd
	.xword	0xa42a922a0098dde1
	.xword	0x121ce86c2887c737
	.xword	0x3f8e6a3b5397ccee
	.xword	0x75943eae07003e3e
	.xword	0x67cdf2c536cb77af
	.xword	0xd1bd0f7847cdcb7f
	.xword	0xd66f03de4dceb75d
	.xword	0x167575de76ea62f7
	.xword	0x1edcc67b1ce84687
	.xword	0x452974a7128760f5
	.xword	0x0b6c586b9093ab21
	.xword	0xd8f8535f4a64eb77
	.xword	0x1abce40d2c08994d
	.xword	0x8686a6b16965aa78
	.xword	0xf4678e222613613d
	.xword	0x4fcadf9ddd67e863
	.xword	0x5fc76cb49f1f8021
	.xword	0x27763818a11397d7
	.xword	0x75d4edf8bf1409cf
	.xword	0xd048ce811464360d
	.xword	0x93528dbb7f0620ab
	.xword	0xf5f88e826c9a9168
	.xword	0x689c05a9bbf1bb3a
	.xword	0xc6e94235613ed975
	.xword	0xd1dc4c780dcd56e4
	.xword	0xae4a84844e5ec512
	.xword	0xfb8d5b716a8f8a7e
	.xword	0x8ac578a370f7d2de
	.xword	0xbc3cc75dc669e6d9
	.xword	0x95b380b7b43b68cf
	.xword	0x40d992e87c0aaaa1
	.xword	0xb7cc70d0c254c68e
	.xword	0x8080fb719a7a322f
	.xword	0xabe9274f130dc87f
	.xword	0x06c625ab74255ef6
	.xword	0x084de525da2350c4
	.xword	0xc1d9bb5d4fc01655
	.xword	0xfcc2b4764901258c
	.xword	0x4617dc1a7ab57311
	.xword	0x7b517417cabd5390
	.xword	0xf7502dc00b4045b5
	.xword	0xb7adafe843371e86
	.xword	0x15e26decd5816165
	.xword	0x879c0671d6f81d93
	.xword	0x2131da3ff7fdf96b
	.xword	0x5f32355de48f2e9b
	.xword	0x56b51498c063911a
	.xword	0xd2dfef632f838303
	.xword	0xc3f0a65c1e41b017
	.xword	0x19e8f5699d4e36ee
	.xword	0xf98ebead64cb8989
	.xword	0xb518386cb96998b5
	.xword	0x64064781c6ef4a82
	.xword	0x56f61c14d82cf54e
	.xword	0x265f45e2f505ae0e
	.xword	0x4459a1041b86c438
	.xword	0x5cc3a1b0c46b055d
	.xword	0x5d5d47bb59f07fd9
	.xword	0xb59f73253be76735
	.xword	0xa7e7df592df4e5d5
	.xword	0xa0dca66cdbbe3ad4
	.xword	0x1abe3403337b551c
	.xword	0x9975ff5b9994e60d
	.xword	0x3b8bdd551e2c193e
	.xword	0xafc130239b9997fc
	.xword	0x7385554e588ac444
	.xword	0x0a07da4c20b9416b
	.xword	0xb9e9dc5c602a9f5b
	.xword	0xa55256a539a6d056
	.xword	0xcbc3b56f4384c155
	.xword	0x95bb4249c25f2a59
	.xword	0x2b8646f5343e34d6
	.xword	0xd799f086348fb633
	.xword	0x7342206f8c3a8d89
	.xword	0x92c5abd6f638994d
	.xword	0x2044e9fddd3fbbe2
	.xword	0xe0296ffc9c0c4835
	.xword	0xcd301119abf30730
	.xword	0xf1cbfde0822e1b9f
	.xword	0xb474db831ff734e8

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
	.xword	0x523cf63a7e131451
	.xword	0xb5f647fa04a8f473
	.xword	0xb7f89ca5ee8e7131
	.xword	0x0eb635eb2e67af76
	.xword	0xe682e877d31a0eba
	.xword	0x686a376faa9b4f78
	.xword	0x7ab9b640c791016c
	.xword	0x167f785a2dd0f68c
	.xword	0xdd4381079cb8008e
	.xword	0x6f3146e27b4924f6
	.xword	0x1344de76e42cb42e
	.xword	0xe591f5ea78c62ed4
	.xword	0xa218c456161bbb29
	.xword	0x6c763b474c7ac219
	.xword	0xdaa39bf6aec6a8e0
	.xword	0x738282da6ba549dc
	.xword	0xe8240f34fa1198a9
	.xword	0x8415710440ea9f66
	.xword	0x3628c4392319138a
	.xword	0xb44dc743554007c1
	.xword	0x397a98514c0a4879
	.xword	0x002576693262ffae
	.xword	0xa038e65df6b26193
	.xword	0x541ccfc13a7c1a4a
	.xword	0x19a3b580d1f64f4a
	.xword	0x75ec16dc7b5c39b3
	.xword	0xec8cc6fb167816bc
	.xword	0xc8b6dc572fa350fe
	.xword	0xbe2f70a56eccca29
	.xword	0x18ba11cfd6e75204
	.xword	0xec1e2c3cf781f76a
	.xword	0x6e2a4d5dc11ec7d6



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
	TTE_CV	 = 0,
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
	.xword	0x97907edcf841985d
	.xword	0x6bdd65b20ab2765b
	.xword	0x6048fbe9b39c6412
	.xword	0xceb3ae6cd5de2a99
	.xword	0x5b9dcb398fcfb9b1
	.xword	0x3dc89c7aefa92de1
	.xword	0x919e4c3c42c55f82
	.xword	0x25c182260f759da9
	.xword	0x2991bf1fd36ce3bf
	.xword	0x80a08d98103b528d
	.xword	0xd85119177544aa76
	.xword	0x6a68f6a7f16db172
	.xword	0xe74088bf2c5d5ba0
	.xword	0xf1e9733eb1ecdcfe
	.xword	0x89284e557c43070d
	.xword	0xd6658c1d7cec6000
	.xword	0x2b2138fe07dbff69
	.xword	0x7ffb7cd5d26c1f33
	.xword	0xd68aedbea6227492
	.xword	0x11584de5710866aa
	.xword	0x3276f9c4cc72b9c4
	.xword	0x48c4a0ba06c3149c
	.xword	0x3f7837d632c2823e
	.xword	0xbd8061740952814e
	.xword	0x46a1735900b35acd
	.xword	0xbd14084098709293
	.xword	0x0ec33a597b34d03b
	.xword	0xcea17ac3cc488a38
	.xword	0x217866c80173ae72
	.xword	0x76bfa78a04046717
	.xword	0x03ea9c51057293ea
	.xword	0xd41c24f48c0e2494



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
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
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
	.xword	0x178bd89773af46f5
	.xword	0x19e178eef6afbd55
	.xword	0x61b3d6733f841f40
	.xword	0x72042d5a5fe851dd
	.xword	0x57f3346e5e8c7dbd
	.xword	0x039db9442190b415
	.xword	0xd71f0a6c7ff40b4d
	.xword	0x495dd96f673c8995
	.xword	0xc7d2098724b745ea
	.xword	0x1e304e7daa7e44dd
	.xword	0xbcdacf71f5068d8d
	.xword	0x92d0173c5eff7652
	.xword	0x1e10e7d5101ffb7c
	.xword	0xa28d3d016f3b5dd9
	.xword	0x81ed66dd55faa9d7
	.xword	0xf1feb554b8156ded
	.xword	0xa214b7e14dcd2177
	.xword	0x5cb3f0b9a32d15bf
	.xword	0x8a3fe1b3ec07a76e
	.xword	0xa253e4d539669aaa
	.xword	0x97cdc5e5a37df419
	.xword	0x6bc13d5e0743e483
	.xword	0xe9e3eab9e66702c0
	.xword	0xe97abe84dd32b0a8
	.xword	0xac41170866e8eb16
	.xword	0x2672a3ace80300aa
	.xword	0xdc60acd501412d46
	.xword	0x6705917779110104
	.xword	0x1726dae25b4aba2a
	.xword	0x7babd06c6686cd80
	.xword	0x653b4de9c6139fb9
	.xword	0x09670e535a403c7b



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
	.xword	0x81a0de79934a38ff
	.xword	0xd66c7a7ca96df051
	.xword	0x41abfaf9a68434b4
	.xword	0xbd3e687426235932
	.xword	0xf1ea45d9590d1c0b
	.xword	0xd5fd70f44e2e8f00
	.xword	0xbfc9bca98157a26d
	.xword	0x6c903eb98679d8ae
	.xword	0x733ca7db2b574599
	.xword	0x50aac51acf8c0467
	.xword	0x7a7224e8145ff4a3
	.xword	0xf343ec4e8926ceb1
	.xword	0x758502eac7d12242
	.xword	0xb1077af7b1f14124
	.xword	0x6f5efcb7a398f300
	.xword	0x405816fe207988a2
	.xword	0xfe3887368067a898
	.xword	0x2838e65ddff5c646
	.xword	0x1de3e9c827253723
	.xword	0xb52141ca63c68e30
	.xword	0xe6405a4282d63f4a
	.xword	0x11ab7514a808e8fb
	.xword	0x153458b87b113c3b
	.xword	0x63d8d99e2dfed08d
	.xword	0x71572f36bedadd7f
	.xword	0xa1d5c3489e846f53
	.xword	0xf8a9eb7f6eb0d8ef
	.xword	0x28d017c04c9b3ebf
	.xword	0x0e41c5843edd6582
	.xword	0xa33e9694fa549611
	.xword	0x93f74d8e0aabf9a2
	.xword	0xd8a74b8fc240f661



#if 0
#endif

