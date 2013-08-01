/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_36.s
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
    rdhpr %htstate, %g1;\
    wrhpr %g1, 0x400, %htstate;\
    retry;nop
# 694 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 711 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_unauth_access_0x0b
#define SUN_H_HT0_IAE_unauth_access_0x0b \
    done;nop
# 716 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_nfo_page_0x0c
#define SUN_H_HT0_IAE_nfo_page_0x0c \
    done;nop
# 725 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 12 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!! START of Interrupt Handlers !!!!!!!!!!!!!!!!!

#define H_HT0_Externally_Initiated_Reset_0x03
#define SUN_H_HT0_Externally_Initiated_Reset_0x03 \
    setx External_Reset_Handler, %g6, %g7; \
    jmp %g7; \
    nop 

!!!!! SPU Interrupt Handlers

#define H_HT0_Control_Word_Queue_Interrupt_0x3c
#define My_HT0_Control_Word_Queue_Interrupt_0x3c \
    	mov 0x20,%g1; mov 1, %g2;stxa %g2,[%g1]0x40; retry

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
# 41 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 141 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! Hstick-match trap handler
# 144 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 189 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! SW interuupt handlers
# 192 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 682 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 252 "diag.j"
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
	mov 0x32, %r14
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
	mov 0x32, %r14
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
	mov 0xb3, %r14
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
	mov 0xb1, %r14
	mov 0x32, %r30
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
    mov %l2, %i7

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
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 1: LDX_R	ldx	[%r31 + %r0], %r17
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_0
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_0:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 2: RDPC	rd	%pc, %r19
	.word 0xd28fe030  ! 3: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r9
	.word 0x91d020b2  ! 4: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_cmpr_7_1:
	setx 0x243f660a85f53dc0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 5: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 6: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a0196c  ! 7: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 8: LDX_R	ldx	[%r31 + %r0], %r17
debug_7_3:
	nop
	mov 8, %r18
	.word 0xd0f00852  ! 9: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	.word 0xe2d00e80  ! 10: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r17
	.word 0x8790209f  ! 11: WRPR_TT_I	wrpr	%r0, 0x009f, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976cf164  ! 12: SDIVX_I	sdivx	%r19, 0xfffff164, %r11
debug_7_5:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 13: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_7_6:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 14: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
splash_cmpr_7_7:
	setx 0xff4cc93a9f138756, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 15: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916cba57  ! 16: SDIVX_I	sdivx	%r18, 0xfffffa57, %r8
splash_cmpr_7_9:
	setx 0xe24946622d46da97, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 17: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879021b8  ! 18: WRPR_TT_I	wrpr	%r0, 0x01b8, %tt
change_to_randtl_7_10:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_10:
	.word 0x8f902000  ! 19: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
donret_7_11:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_11-donret_7_11), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_11:
	.word 0xe2ffe750  ! 20: SWAPA_I	swapa	%r17, [%r31 + 0x0750] %asi
change_to_randtl_7_12:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_12:
	.word 0x8f902000  ! 21: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_7_13:
	taddcctv %r11, 0x1e47, %r10
	.word 0xe207e750  ! 22: LDUW_I	lduw	[%r31 + 0x0750], %r17
	.word 0x22700001  ! 23: BPE	<illegal instruction>
	.word 0xa745c000  ! 24: RD_TICK_CMPR_REG	rd	%-, %r19
mondo_7_14:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d948003  ! 25: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
	.word 0x83d020b5  ! 26: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0x87802055  ! 27: WRASI_I	wr	%r0, 0x0055, %asi
intveclr_7_15:
	setx 0xf139eefc51eeb672, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8cfe010  ! 29: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r12
	.word 0xa1902007  ! 30: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_lsu_7_16:
	setx 0x8586f6c1776f5b97, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 31: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 32: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
mondo_7_17:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d92c005  ! 33: WRPR_WSTATE_R	wrpr	%r11, %r5, %wstate
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 34: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_7_18:
	.word 0x81982f35  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f35, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 36: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x91480000  ! 37: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
splash_lsu_7_19:
	setx 0x5fad462d443ac1b1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 38: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 39: RD_STICK_REG	stbar
	.word 0x81510000  ! 40: RDPR_TICK	rdpr	%tick, %r0
tagged_7_20:
	tsubcctv %r14, 0x1303, %r24
	.word 0xd807e750  ! 41: LDUW_I	lduw	[%r31 + 0x0750], %r12
splash_lsu_7_21:
	setx 0x6a36927336bf99cd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 42: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_7_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d920012  ! 43: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
	.word 0xa190200e  ! 44: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x9248c007  ! 45: MULX_R	mulx 	%r3, %r7, %r9
	.word 0xa5450000  ! 46: RD_SET_SOFTINT	rd	%set_softint, %r18
intveclr_7_23:
	setx 0xa5e40d8bf5ec33a4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 47: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_24)) -> intp(7,0,30)
intvec_7_24:
	.word 0x39400001  ! 48: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902219  ! 49: WRPR_TT_I	wrpr	%r0, 0x0219, %tt
debug_7_25:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 50: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_7_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d904010  ! 51: WRPR_WSTATE_R	wrpr	%r1, %r16, %wstate
	.word 0x879020b7  ! 52: WRPR_TT_I	wrpr	%r0, 0x00b7, %tt
	.word 0xa3a249cb  ! 53: FDIVd	fdivd	%f40, %f42, %f48
splash_hpstate_7_27:
	.word 0x81982d95  ! 54: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d95, %hpstate
	.word 0x87802058  ! 55: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x91d02032  ! 56: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x3e700001  ! 57: BPVC	<illegal instruction>
	.word 0xe60fc000  ! 58: LDUB_R	ldub	[%r31 + %r0], %r19
	rd %pc, %r19
	add %r19, (ivw_7_28-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_28:
	.word 0x97a00166  ! 59: FABSq	dis not found

	.word 0xd48fe010  ! 60: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0xd4c7e010  ! 61: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
DS_7_29:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 62: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
splash_tba_7_30:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 63: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_7_31:
	setx 0xb0b9eef2bce744c2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 64: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_32:
	setx 0x8fd0d45e273fb593, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 65: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_7_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d950002  ! 66: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
debug_7_34:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 67: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_7_35:
	.word 0x81982cdc  ! 68: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdc, %hpstate
intveclr_7_36:
	setx 0x7442adae9e415d9e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902f9d  ! 70: WRPR_PSTATE_I	wrpr	%r0, 0x0f9d, %pstate
splash_cmpr_7_37:
	setx 0xd7ac655bd7f5f737, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 71: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_7_38:
	nop
	setx 0xfffff719fffff658, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_7_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d948012  ! 73: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
	rd %pc, %r19
	add %r19, (ivw_7_40-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_40:
	.word 0x93a00169  ! 74: FABSq	dis not found

pmu_7_41:
	nop
	setx 0xfffffa39fffff5b1, %g1, %g7
	.word 0xa3800007  ! 75: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd02fe750  ! 76: STB_I	stb	%r8, [%r31 + 0x0750]
splash_cmpr_7_42:
	setx 0xe9a60381ef83a2aa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 77: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3c700001  ! 78: BPPOS	<illegal instruction>
debug_7_43:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 79: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_7_44:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 80: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd08008a0  ! 81: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	rd %pc, %r19
	add %r19, (ivw_7_45-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_45:
	.word 0x99a00164  ! 82: FABSq	dis not found

splash_lsu_7_46:
	setx 0x48b66715d7262cd9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 83: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_7_47:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_47:
	.word 0x8f902001  ! 84: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 85: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802080  ! 86: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x9191b756  ! 87: WRPR_PIL_I	wrpr	%r6, 0x1756, %pil
	.word 0xd69004a0  ! 88: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0xa1902009  ! 89: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xd6c004a0  ! 90: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
mondo_7_48:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d948012  ! 91: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
splash_cmpr_7_49:
	setx 0x4711cc11712df752, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 92: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 93: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87802014  ! 94: WRASI_I	wr	%r0, 0x0014, %asi
mondo_7_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d92c012  ! 95: WRPR_WSTATE_R	wrpr	%r11, %r18, %wstate
	.word 0xd6dfe000  ! 96: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
	.word 0x93902004  ! 97: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
change_to_randtl_7_51:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_51:
	.word 0x8f902001  ! 98: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_7_52:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_52:
	.word 0x8f902002  ! 99: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d9023bb  ! 100: WRPR_PSTATE_I	wrpr	%r0, 0x03bb, %pstate
	.word 0x91d02032  ! 101: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd73fc000  ! 102: STDF_R	std	%f11, [%r0, %r31]
	.word 0xa981c003  ! 103: WR_SET_SOFTINT_R	wr	%r7, %r3, %set_softint
	.word 0xa190200c  ! 104: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x879021b8  ! 105: WRPR_TT_I	wrpr	%r0, 0x01b8, %tt
debug_7_53:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 106: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_7_54-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_54:
	.word 0x93a0016a  ! 107: FABSq	dis not found

splash_lsu_7_55:
	setx 0x9afac88e34819259, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 108: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 109: SIAM	siam	1
debug_7_56:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 110: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_7_57:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_57-donret_7_57), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_57:
	.word 0xd8fff234  ! 111: SWAPA_I	swapa	%r12, [%r31 + 0xfffff234] %asi
DS_7_58:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa966b2f3	! Random illegal ?
	.word 0x93a00551  ! 1: FSQRTd	fsqrt	
	.word 0x95a00830  ! 112: FADDs	fadds	%f0, %f16, %f10
splash_tba_7_59:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 113: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x99a049e5  ! 114: FDIVq	dis not found

	.word 0xd4d004a0  ! 115: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 116: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76af8fb  ! 117: SDIVX_I	sdivx	%r11, 0xfffff8fb, %r19
intveclr_7_61:
	setx 0x7a48e1c754db6a13, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 118: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 119: SIAM	siam	1
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 120: LDX_R	ldx	[%r31 + %r0], %r13
tagged_7_62:
	tsubcctv %r18, 0x147b, %r26
	.word 0xda07e1f9  ! 121: LDUW_I	lduw	[%r31 + 0x01f9], %r13
	.word 0xda57c000  ! 122: LDSH_R	ldsh	[%r31 + %r0], %r13
tagged_7_63:
	taddcctv %r24, 0x1977, %r14
	.word 0xda07e1f9  ! 123: LDUW_I	lduw	[%r31 + 0x01f9], %r13
	.word 0xdac004a0  ! 124: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
donret_7_64:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_64-donret_7_64), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_64:
	.word 0xdaffe1f9  ! 125: SWAPA_I	swapa	%r13, [%r31 + 0x01f9] %asi
	.word 0xdacfe030  ! 126: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
mondo_7_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d940009  ! 127: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
splash_cmpr_7_66:
	setx 0x738480a7d9952f87, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 128: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_7_67:
	.word 0x81982906  ! 129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0906, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_7_68)) -> intp(7,1,3)
xir_7_68:
	.word 0xa982bb76  ! 130: WR_SET_SOFTINT_I	wr	%r10, 0x1b76, %set_softint
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01963  ! 131: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_70)) -> intp(3,0,6)
intvec_7_70:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 133: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x91d02033  ! 134: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd48008a0  ! 135: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
debug_7_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 136: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_7_72:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_72-donret_7_72), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_72:
	.word 0xd4fff312  ! 137: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
splash_lsu_7_73:
	setx 0xc4c26a03290145dd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 138: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_7_74:
	setx 0x25cb643a3488d239, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 139: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b3  ! 140: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0x93a01a6c  ! 141: FqTOi	fqtoi	
tagged_7_75:
	taddcctv %r24, 0x1034, %r8
	.word 0xe207f312  ! 142: LDUW_I	lduw	[%r31 + 0xfffff312], %r17
splash_hpstate_7_76:
	.word 0x81982645  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0645, %hpstate
	.word 0xa1454000  ! 144: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
splash_htba_7_77:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 145: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_7_78:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 146: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_7_79:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 147: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_80)) -> intp(6,0,9)
intvec_7_80:
	.word 0x39400001  ! 148: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_7_81:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 149: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_7_82:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_82:
	.word 0x8f902001  ! 150: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_7_83:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 151: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02033  ! 152: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d903884  ! 153: WRPR_PSTATE_I	wrpr	%r0, 0x1884, %pstate
	.word 0x9b50c000  ! 154: RDPR_TT	rdpr	%tt, %r13
DS_7_84:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 155: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_7_85:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 156: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802016  ! 157: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x91d02035  ! 158: Tcc_I	ta	icc_or_xcc, %r0 + 53
intveclr_7_86:
	setx 0xc639db4c3fd9f57d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 159: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_7_87:
	taddcctv %r13, 0x12a3, %r22
	.word 0xe607f312  ! 160: LDUW_I	lduw	[%r31 + 0xfffff312], %r19
mondo_7_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d92c004  ! 161: WRPR_WSTATE_R	wrpr	%r11, %r4, %wstate
splash_tba_7_89:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 162: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_7_90:
	.word 0x81982c4c  ! 163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4c, %hpstate
splash_cmpr_7_91:
	setx 0x918ec210ffd5b930, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 164: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe71fc000  ! 165: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x93902007  ! 166: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_7_92:
	.word 0x95a409cd  ! 1: FDIVd	fdivd	%f16, %f44, %f10
	.word 0x9965320e	! Random illegal ?
	.word 0xa3a00541  ! 1: FSQRTd	fsqrt	
	.word 0x93a08829  ! 167: FADDs	fadds	%f2, %f9, %f9
	.word 0xa1902001  ! 168: WRPR_GL_I	wrpr	%r0, 0x0001, %-
donret_7_93:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_93-donret_7_93), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_93:
	.word 0xd4fff312  ! 169: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
	.word 0x93902002  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
donret_7_94:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_94-donret_7_94), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_94:
	.word 0xd4fff312  ! 171: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
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
	.word 0x9b414000  ! 172: RDPC	rd	%pc, %r13
	.word 0xd0dfe000  ! 173: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r8
	.word 0xa190200d  ! 174: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd127c000  ! 175: STF_R	st	%f8, [%r0, %r31]
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 176: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_7_96:
	setx 0xf7609bba9a22d636, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 177: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9025e7  ! 178: WRPR_PSTATE_I	wrpr	%r0, 0x05e7, %pstate
	.word 0x97480000  ! 179: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xd28008a0  ! 180: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x91d02033  ! 181: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x81510000  ! 182: RDPR_TICK	rdpr	%tick, %r0
mondo_7_97:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d914003  ! 183: WRPR_WSTATE_R	wrpr	%r5, %r3, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_98)) -> intp(3,0,25)
intvec_7_98:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_7_99:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_99:
	.word 0x8f902002  ! 185: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x93902001  ! 186: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 187: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_7_100:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_100:
	.word 0x8f902000  ! 188: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d802000  ! 189: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_7_101:
	setx 0xb33e91e624848bd0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 190: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01966  ! 191: FqTOd	dis not found

	setx 0x2e05dbff3ba7e55d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_103:
	.word 0x39400001  ! 192: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd08804a0  ! 193: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
mondo_7_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d90400a  ! 194: WRPR_WSTATE_R	wrpr	%r1, %r10, %wstate
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 195: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd09004a0  ! 196: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0xd06ff312  ! 197: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff312]
change_to_randtl_7_105:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_105:
	.word 0x8f902003  ! 198: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_cmpr_7_106:
	setx 0xcfa78f395608202f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 199: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802055  ! 200: WRASI_I	wr	%r0, 0x0055, %asi
	rd %pc, %r19
	add %r19, (ivw_7_107-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_107:
	.word 0x99a00160  ! 201: FABSq	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56cadcb  ! 202: SDIVX_I	sdivx	%r18, 0x0dcb, %r18
	.word 0xd6d004a0  ! 203: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
splash_hpstate_7_109:
	.word 0x81982f16  ! 204: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f16, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 205: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_7_110:
	.word 0xa1a4c9c9  ! 1: FDIVd	fdivd	%f50, %f40, %f16
	.word 0xbfe7c000  ! 206: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_7_111:
	setx 0x12228e67e53c0ed6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 208: LDX_R	ldx	[%r31 + %r0], %r11
splash_tba_7_112:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 209: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_7_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 210: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd727c000  ! 211: STF_R	st	%f11, [%r0, %r31]
	.word 0xa9828002  ! 212: WR_SET_SOFTINT_R	wr	%r10, %r2, %set_softint
mondo_7_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d908002  ! 213: WRPR_WSTATE_R	wrpr	%r2, %r2, %wstate
mondo_7_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d91c012  ! 214: WRPR_WSTATE_R	wrpr	%r7, %r18, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01969  ! 215: FqTOd	dis not found

	.word 0xa2f9c014  ! 216: SDIVcc_R	sdivcc 	%r7, %r20, %r17
	.word 0xa190200d  ! 217: WRPR_GL_I	wrpr	%r0, 0x000d, %-
mondo_7_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d950003  ! 218: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
	.word 0xe4800be0  ! 219: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r18
	.word 0xe4bfc020  ! 220: STDA_R	stda	%r18, [%r31 + %r0] 0x01
tagged_7_118:
	tsubcctv %r2, 0x13e3, %r16
	.word 0xe407f661  ! 221: LDUW_I	lduw	[%r31 + 0xfffff661], %r18
	.word 0x879020da  ! 222: WRPR_TT_I	wrpr	%r0, 0x00da, %tt
	.word 0xe4d7e000  ! 223: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r18
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
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
	.word 0xa9414000  ! 224: RDPC	rd	%pc, %r20
	rd %pc, %r19
	add %r19, (ivw_7_120-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_120:
	.word 0x93a0016b  ! 225: FABSq	dis not found

donret_7_121:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_121-donret_7_121), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_121:
	.word 0xd2fff661  ! 226: SWAPA_I	swapa	%r9, [%r31 + 0xfffff661] %asi
	.word 0xa9824014  ! 227: WR_SET_SOFTINT_R	wr	%r9, %r20, %set_softint
	.word 0x9849000b  ! 228: MULX_R	mulx 	%r4, %r11, %r12
splash_lsu_7_122:
	setx 0xdab16d2edda0b8a9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 229: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x5de1809b98b9ee51, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_123:
	.word 0x39400001  ! 230: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe21ff661  ! 231: LDD_I	ldd	[%r31 + 0xfffff661], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 232: LDX_R	ldx	[%r31 + %r0], %r17
DS_7_124:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 233: SAVE_R	save	%r31, %r0, %r31
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 234: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_7_125:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 235: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_126)) -> intp(6,0,29)
intvec_7_126:
	.word 0x39400001  ! 236: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_7_127:
	setx 0x6c48fa861663b875, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_7_128-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_128:
	.word 0xa5a00164  ! 238: FABSq	dis not found

	.word 0xd69ff661  ! 239: LDDA_I	ldda	[%r31, + 0xfffff661] %asi, %r11
DS_7_129:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe7320003  ! 1: STQF_R	-	%f19, [%r3, %r8]
	normalw
	.word 0x93458000  ! 240: RD_SOFTINT_REG	rd	%softint, %r9
splash_lsu_7_130:
	setx 0x14472844ecf60c99, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 241: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2c804a0  ! 242: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
splash_tba_7_131:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 243: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902008  ! 244: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xe2d004a0  ! 245: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0xe2d004a0  ! 246: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0x97520000  ! 247: RDPR_PIL	rdpr	%pil, %r11
tagged_7_132:
	tsubcctv %r13, 0x18f0, %r11
	.word 0xe607f661  ! 248: LDUW_I	lduw	[%r31 + 0xfffff661], %r19
debug_7_133:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 249: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe727c000  ! 250: STF_R	st	%f19, [%r0, %r31]
splash_lsu_7_134:
	setx 0xdb513b6c616ec7eb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 251: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x32800001  ! 252: BNE	bne,a	<label_0x1>
	.word 0xe6d80e80  ! 253: LDXA_R	ldxa	[%r0, %r0] 0x74, %r19
	.word 0xe66ff661  ! 254: LDSTUB_I	ldstub	%r19, [%r31 + 0xfffff661]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01972  ! 255: FqTOd	dis not found

	.word 0x8d902936  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x0936, %pstate
splash_hpstate_7_136:
	.word 0x8198259d  ! 257: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059d, %hpstate
	.word 0xa9a0cdc0  ! 258: FdMULq	fdmulq	
	.word 0x93902005  ! 259: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
mondo_7_137:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d950009  ! 260: WRPR_WSTATE_R	wrpr	%r20, %r9, %wstate
	.word 0xe2900e60  ! 261: LDUHA_R	lduha	[%r0, %r0] 0x73, %r17
mondo_7_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d940010  ! 262: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
	.word 0x87802063  ! 263: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x87802016  ! 264: WRASI_I	wr	%r0, 0x0016, %asi
mondo_7_139:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d90800b  ! 265: WRPR_WSTATE_R	wrpr	%r2, %r11, %wstate
mondo_7_140:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d90c012  ! 266: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
debug_7_141:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 267: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x8d903acc  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x1acc, %pstate
debug_7_142:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 269: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab844002  ! 270: WR_CLEAR_SOFTINT_R	wr	%r17, %r2, %clear_softint
debug_7_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 271: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1902007  ! 272: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 273: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01974  ! 274: FqTOd	dis not found

tagged_7_145:
	taddcctv %r8, 0x1fa9, %r5
	.word 0xd407f661  ! 275: LDUW_I	lduw	[%r31 + 0xfffff661], %r10
splash_cmpr_7_146:
	setx 0x15ac280304a14d3d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 276: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d90210c  ! 277: WRPR_PSTATE_I	wrpr	%r0, 0x010c, %pstate
splash_tba_7_147:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 278: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_7_148:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 279: RESTORE_R	restore	%r31, %r0, %r31
mondo_7_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d90c013  ! 280: WRPR_WSTATE_R	wrpr	%r3, %r19, %wstate
splash_lsu_7_150:
	setx 0xd97c54f59d5ead31, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 281: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879023bc  ! 282: WRPR_TT_I	wrpr	%r0, 0x03bc, %tt
	setx 0x73f23df56cf99ec0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_151:
	.word 0x39400001  ! 283: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd40ff661  ! 284: LDUB_I	ldub	[%r31 + 0xfffff661], %r10
mondo_7_152:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d910010  ! 285: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
	.word 0x8d902ca1  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x0ca1, %pstate
splash_tba_7_153:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 287: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879022c0  ! 288: WRPR_TT_I	wrpr	%r0, 0x02c0, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916b2733  ! 289: SDIVX_I	sdivx	%r12, 0x0733, %r8
splash_tba_7_155:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 290: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_7_156:
	setx 0x47d64f74a53b54dc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 291: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01972  ! 292: FqTOd	dis not found

splash_lsu_7_158:
	setx 0xb9a44ccfd29b7b1f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 293: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 294: RD_STICK_REG	stbar
splash_cmpr_7_159:
	setx 0xed10492b6a25b10a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_160:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 296: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902cf9  ! 297: WRPR_PSTATE_I	wrpr	%r0, 0x0cf9, %pstate
	.word 0xa2fcb11b  ! 298: SDIVcc_I	sdivcc 	%r18, 0xfffff11b, %r17
	.word 0xa980c003  ! 299: WR_SET_SOFTINT_R	wr	%r3, %r3, %set_softint
	.word 0xd08804a0  ! 300: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	setx 0xbd80fb1c25c77aef, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_161:
	.word 0x39400001  ! 301: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0d804a0  ! 302: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_162)) -> intp(0,0,15)
intvec_7_162:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_7_163:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d94c010  ! 304: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0xab84000d  ! 305: WR_CLEAR_SOFTINT_R	wr	%r16, %r13, %clear_softint
	.word 0xa190200e  ! 306: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 307: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01969  ! 308: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01963  ! 309: FqTOd	dis not found

	.word 0x87802080  ! 310: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x87802014  ! 311: WRASI_I	wr	%r0, 0x0014, %asi
mondo_7_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d950001  ! 312: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
pmu_7_167:
	nop
	setx 0xfffff150fffff28f, %g1, %g7
	.word 0xa3800007  ! 313: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_7_168:
	setx 0x961d757c730cdec1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 314: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879022f0  ! 315: WRPR_TT_I	wrpr	%r0, 0x02f0, %tt
	.word 0x91937062  ! 316: WRPR_PIL_I	wrpr	%r13, 0x1062, %pil
tagged_7_169:
	taddcctv %r6, 0x156e, %r7
	.word 0xd607ee91  ! 317: LDUW_I	lduw	[%r31 + 0x0e91], %r11
	.word 0xa9a349cc  ! 318: FDIVd	fdivd	%f44, %f12, %f20
	.word 0xd06fee91  ! 319: LDSTUB_I	ldstub	%r8, [%r31 + 0x0e91]
	.word 0xd06fee91  ! 320: LDSTUB_I	ldstub	%r8, [%r31 + 0x0e91]
splash_tba_7_170:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 321: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9ac175e5  ! 322: ADDCcc_I	addccc 	%r5, 0xfffff5e5, %r13
splash_cmpr_7_171:
	setx 0xece79e8de6090088, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 323: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802089  ! 324: WRASI_I	wr	%r0, 0x0089, %asi
	rd %pc, %r19
	add %r19, (ivw_7_172-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_172:
	.word 0xa9a00163  ! 325: FABSq	dis not found

	.word 0x93902005  ! 326: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_7_173:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 327: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_7_174:
	.word 0x81982a84  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a84, %hpstate
splash_tba_7_175:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 329: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_176:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 330: RDPC	rd	%pc, %r13
tagged_7_177:
	taddcctv %r11, 0x1ce4, %r10
	.word 0xda07e697  ! 331: LDUW_I	lduw	[%r31 + 0x0697], %r13
	.word 0xda1fc000  ! 332: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xa24cc008  ! 333: MULX_R	mulx 	%r19, %r8, %r17
	.word 0xe2dfe020  ! 334: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r17
change_to_randtl_7_178:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_178:
	.word 0x8f902002  ! 335: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_7_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 336: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_7_180:
	setx 0xf4ba25d89f48a4f5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902005  ! 338: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
mondo_7_181:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d90800a  ! 339: WRPR_WSTATE_R	wrpr	%r2, %r10, %wstate
donret_7_182:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_182-donret_7_182), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_182:
	.word 0xe2ffe697  ! 340: SWAPA_I	swapa	%r17, [%r31 + 0x0697] %asi
	.word 0xe26fe697  ! 341: LDSTUB_I	ldstub	%r17, [%r31 + 0x0697]
intveclr_7_183:
	setx 0x40219f5b0f0c22ca, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 342: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_7_184:
	.word 0x81982cd4  ! 343: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd4, %hpstate
intveclr_7_185:
	setx 0x56f40e0d5382aee3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_186)) -> intp(3,0,15)
intvec_7_186:
	.word 0x39400001  ! 345: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfe020  ! 346: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r17
splash_tba_7_187:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 347: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902003  ! 348: WRPR_GL_I	wrpr	%r0, 0x0003, %-
change_to_randtl_7_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_188:
	.word 0x8f902001  ! 349: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	setx 0xe4e3529fc10b4751, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_189:
	.word 0x39400001  ! 350: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 351: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_190
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_190
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_190:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 352: RDPC	rd	%pc, %r18
	.word 0xe69fe697  ! 353: LDDA_I	ldda	[%r31, + 0x0697] %asi, %r19
	.word 0x87802016  ! 354: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xe647c000  ! 355: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0xe68804a0  ! 356: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
mondo_7_191:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d91800a  ! 357: WRPR_WSTATE_R	wrpr	%r6, %r10, %wstate
pmu_7_192:
	nop
	setx 0xfffffa72fffffd0f, %g1, %g7
	.word 0xa3800007  ! 358: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_7_193-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_193:
	.word 0x97a00160  ! 359: FABSq	dis not found

splash_cmpr_7_194:
	setx 0xb849d25ecbc74759, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 360: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93540000  ! 361: RDPR_GL	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01974  ! 362: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 363: LDX_R	ldx	[%r31 + %r0], %r13
intveclr_7_196:
	setx 0xe219293aead3d39b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 365: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01966  ! 366: FqTOd	dis not found

DS_7_198:
	.word 0x9ba489d0  ! 1: FDIVd	fdivd	%f18, %f16, %f44
	.word 0xe161e857	! Random illegal ?
	.word 0xd3150010  ! 1: LDQF_R	-	[%r20, %r16], %f9
	.word 0xa9a0c831  ! 367: FADDs	fadds	%f3, %f17, %f20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a0196a  ! 368: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.xir_7_200)) -> intp(7,1,3)
xir_7_200:
	.word 0xa9823daa  ! 369: WR_SET_SOFTINT_I	wr	%r8, 0x1daa, %set_softint
	.word 0x8780204f  ! 370: WRASI_I	wr	%r0, 0x004f, %asi
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_201
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_201:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 371: RDPC	rd	%pc, %r18
	.word 0x99902003  ! 372: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x87802004  ! 373: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd4d804a0  ! 374: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
change_to_randtl_7_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_202:
	.word 0x8f902001  ! 375: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x99464000  ! 376: RD_STICK_CMPR_REG	rd	%-, %r12
DS_7_203:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 377: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe06ffe9a  ! 378: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffe9a]
	.word 0x83d02034  ! 379: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x87802016  ! 380: WRASI_I	wr	%r0, 0x0016, %asi
splash_cmpr_7_204:
	setx 0x92d4055448d2d1bf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 381: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_7_205:
	.word 0x8198239e  ! 382: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039e, %hpstate
splash_cmpr_7_206:
	setx 0x603db3d43d609833, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 383: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91480000  ! 384: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
tagged_7_207:
	taddcctv %r26, 0x194d, %r18
	.word 0xe407fe9a  ! 385: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r18
	.word 0xa190200c  ! 386: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xe527fe9a  ! 387: STF_I	st	%f18, [0x1e9a, %r31]
splash_cmpr_7_208:
	setx 0x061d5a6045131383, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 388: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 389: WRFPRS_I	wr	%r0, 0x0004, %fprs
debug_7_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 390: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_7_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_210:
	.word 0x8f902001  ! 391: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe4d004a0  ! 392: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r18
debug_7_211:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 393: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe49ffe9a  ! 394: LDDA_I	ldda	[%r31, + 0xfffffe9a] %asi, %r18
	.word 0xe42ffe9a  ! 395: STB_I	stb	%r18, [%r31 + 0xfffffe9a]
	.word 0xe457fe9a  ! 396: LDSH_I	ldsh	[%r31 + 0xfffffe9a], %r18
DS_7_212:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x97a2c9d4  ! 1: FDIVd	fdivd	%f42, %f20, %f42
	normalw
	.word 0xa7458000  ! 397: RD_SOFTINT_REG	rd	%softint, %r19
tagged_7_213:
	taddcctv %r25, 0x1b0d, %r21
	.word 0xd607fe9a  ! 398: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r11
splash_hpstate_7_214:
	.word 0x81982e8e  ! 399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8e, %hpstate
	.word 0xd60fc000  ! 400: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0x8790224b  ! 401: WRPR_TT_I	wrpr	%r0, 0x024b, %tt
splash_tba_7_215:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 402: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01968  ! 403: FqTOd	dis not found

debug_7_217:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 404: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd48008a0  ! 405: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_218:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 406: RDPC	rd	%pc, %r8
	rd %pc, %r19
	add %r19, (ivw_7_219-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_219:
	.word 0x97a0016b  ! 407: FABSq	dis not found

splash_htba_7_220:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 408: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
change_to_randtl_7_221:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_221:
	.word 0x8f902002  ! 409: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x87802020  ! 410: WRASI_I	wr	%r0, 0x0020, %asi
splash_cmpr_7_222:
	setx 0x6394054aa7d2dcf7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 411: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_7_223:
	nop
	setx 0xfffff2d2fffff9df, %g1, %g7
	.word 0xa3800007  ! 412: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_7_224:
	tsubcctv %r20, 0x1938, %r22
	.word 0xe207fe9a  ! 413: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r17
mondo_7_225:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d918009  ! 414: WRPR_WSTATE_R	wrpr	%r6, %r9, %wstate
splash_tba_7_226:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 415: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f802ca1  ! 416: SIR	sir	0x0ca1
splash_cmpr_7_227:
	setx 0xc7e09ef3bc876765, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 417: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99520000  ! 418: RDPR_PIL	<illegal instruction>
debug_7_228:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 419: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0x91d02032  ! 420: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xdadfe000  ! 421: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
debug_7_229:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 422: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5686e75  ! 423: SDIVX_I	sdivx	%r1, 0x0e75, %r18
	.word 0xd08fe020  ! 424: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r8
splash_hpstate_7_231:
	.word 0x81982cb6  ! 425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cb6, %hpstate
mondo_7_232:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d94c00a  ! 426: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
	.word 0xd08008a0  ! 427: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd057c000  ! 428: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a0196d  ! 429: FqTOd	dis not found

	rd %pc, %r19
	add %r19, (ivw_7_234-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_234:
	.word 0x99a00160  ! 430: FABSq	dis not found

	.word 0xa7540000  ! 431: RDPR_GL	rdpr	%-, %r19
	.word 0x90d0bb93  ! 432: UMULcc_I	umulcc 	%r2, 0xfffffb93, %r8
	.word 0x87802055  ! 433: WRASI_I	wr	%r0, 0x0055, %asi
splash_cmpr_7_235:
	setx 0xce59e6fde91dd67f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 434: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_7_236:
	.word 0x81982a0c  ! 435: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0c, %hpstate
	.word 0xd0c004a0  ! 436: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0x99a049c0  ! 437: FDIVd	fdivd	%f32, %f0, %f12
tagged_7_237:
	taddcctv %r6, 0x1ebf, %r21
	.word 0xd607f110  ! 438: LDUW_I	lduw	[%r31 + 0xfffff110], %r11
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_238)) -> intp(4,0,29)
intvec_7_238:
	.word 0x39400001  ! 439: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_7_239:
	setx 0x7f2f3e46f8d6bb2b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6d804a0  ! 441: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
splash_cmpr_7_240:
	setx 0x237e7c786f5e23d2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 442: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01962  ! 443: FqTOd	dis not found

	.word 0xe6d7e030  ! 444: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r19
	.word 0x8780204f  ! 445: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01967  ! 446: FqTOd	dis not found

	.word 0x91d02032  ! 447: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_cmpr_7_243:
	setx 0x69e2fe697f95a1e2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902425  ! 449: WRPR_PSTATE_I	wrpr	%r0, 0x0425, %pstate
change_to_randtl_7_244:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_244:
	.word 0x8f902000  ! 450: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	rd %pc, %r19
	add %r19, (ivw_7_245-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_245:
	.word 0x91a00168  ! 451: FABSq	dis not found

debug_7_246:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 452: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0x97a249c0  ! 453: FDIVd	fdivd	%f40, %f0, %f42
tagged_7_247:
	taddcctv %r25, 0x194b, %r19
	.word 0xd407f110  ! 454: LDUW_I	lduw	[%r31 + 0xfffff110], %r10
	.word 0x8780204f  ! 455: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xd48008a0  ! 456: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
debug_7_248:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 457: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	setx 0x114c2f6456b9d5e7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_249:
	.word 0x39400001  ! 458: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97464000  ! 459: RD_STICK_CMPR_REG	rd	%-, %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_7_250)) -> intp(7,1,3)
xir_7_250:
	.word 0xa982f9b6  ! 460: WR_SET_SOFTINT_I	wr	%r11, 0x19b6, %set_softint
intveclr_7_251:
	setx 0x6a2ac2b2f65f5428, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 461: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_7_252:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 462: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
mondo_7_253:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d92c001  ! 463: WRPR_WSTATE_R	wrpr	%r11, %r1, %wstate
debug_7_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 464: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_255
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_255
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_255:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 465: RDPC	rd	%pc, %r11
change_to_randtl_7_256:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_256:
	.word 0x8f902000  ! 466: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9f80275a  ! 467: SIR	sir	0x075a
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_257:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 468: RDPC	rd	%pc, %r11
debug_7_258:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 469: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
tagged_7_259:
	taddcctv %r13, 0x15a8, %r1
	.word 0xd407f2f6  ! 470: LDUW_I	lduw	[%r31 + 0xfffff2f6], %r10
	.word 0xa953c000  ! 471: RDPR_FQ	<illegal instruction>
	.word 0xd24ff2f6  ! 472: LDSB_I	ldsb	[%r31 + 0xfffff2f6], %r9
	.word 0x8d90399a  ! 473: WRPR_PSTATE_I	wrpr	%r0, 0x199a, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97692c14  ! 474: SDIVX_I	sdivx	%r4, 0x0c14, %r11
splash_cmpr_7_261:
	setx 0xe5621143b84b174b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 475: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_7_262:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_262:
	.word 0x8f902000  ! 476: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd697e010  ! 477: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0xa8faedfa  ! 478: SDIVcc_I	sdivcc 	%r11, 0x0dfa, %r20
splash_cmpr_7_263:
	setx 0xe0a0d65d9ffd2482, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 479: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 480: LDX_R	ldx	[%r31 + %r0], %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 481: LDX_R	ldx	[%r31 + %r0], %r10
mondo_7_264:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d934005  ! 482: WRPR_WSTATE_R	wrpr	%r13, %r5, %wstate
splash_tba_7_265:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 483: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 484: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x87802010  ! 485: WRASI_I	wr	%r0, 0x0010, %asi
splash_tba_7_266:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 486: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd49fe208  ! 487: LDDA_I	ldda	[%r31, + 0x0208] %asi, %r10
debug_7_267:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 488: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0xa982c00c  ! 489: WR_SET_SOFTINT_R	wr	%r11, %r12, %set_softint
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_268
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_268
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_268:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 490: RDPC	rd	%pc, %r18
	.word 0x8d802000  ! 491: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_7_269:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 492: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_7_270:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 493: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	setx 0x39109e6d3ff52ba2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_271:
	.word 0x39400001  ! 494: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_7_272:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd3308014  ! 1: STQF_R	-	%f9, [%r20, %r2]
	normalw
	.word 0xa7458000  ! 495: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0xe6800b20  ! 496: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r19
debug_7_273:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 497: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 498: LDX_R	ldx	[%r31 + %r0], %r19
tagged_7_274:
	tsubcctv %r17, 0x17d7, %r21
	.word 0xe607e208  ! 499: LDUW_I	lduw	[%r31 + 0x0208], %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_7_275)) -> intp(7,1,3)
xir_7_275:
	.word 0xa982fa6e  ! 500: WR_SET_SOFTINT_I	wr	%r11, 0x1a6e, %set_softint
mondo_7_276:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d95000a  ! 501: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
splash_cmpr_7_277:
	setx 0xc4ba32a85988e735, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 502: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_7_278:
	tsubcctv %r25, 0x17d1, %r5
	.word 0xe607f4d4  ! 503: LDUW_I	lduw	[%r31 + 0xfffff4d4], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 504: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xad817337  ! 505: WR_SOFTINT_REG_I	wr	%r5, 0x1337, %softint
	.word 0x87902227  ! 506: WRPR_TT_I	wrpr	%r0, 0x0227, %tt
	.word 0xe677c000  ! 507: STX_R	stx	%r19, [%r31 + %r0]
	rd %pc, %r19
	add %r19, (ivw_7_279-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_279:
	.word 0xa7a00167  ! 508: FABSq	dis not found

DS_7_280:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 509: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_7_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_281:
	.word 0x8f902003  ! 510: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_282
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_282
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_282:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 511: RDPC	rd	%pc, %r8
splash_hpstate_7_283:
	.word 0x81982ad4  ! 512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad4, %hpstate
mondo_7_284:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d94c00b  ! 513: WRPR_WSTATE_R	wrpr	%r19, %r11, %wstate
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_285
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_285
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_285:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 514: RDPC	rd	%pc, %r12
	.word 0xe83fec34  ! 515: STD_I	std	%r20, [%r31 + 0x0c34]
debug_7_286:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 516: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_7_287:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_287:
	.word 0x8f902003  ! 517: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x95a089d1  ! 518: FDIVd	fdivd	%f2, %f48, %f10
mondo_7_288:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d94c012  ! 519: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
mondo_7_289:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d928007  ! 520: WRPR_WSTATE_R	wrpr	%r10, %r7, %wstate
change_to_randtl_7_290:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_290:
	.word 0x8f902002  ! 521: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd327c000  ! 522: STF_R	st	%f9, [%r0, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 523: LDX_R	ldx	[%r31 + %r0], %r9
debug_7_291:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 524: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
intveclr_7_292:
	setx 0x1204a0363f8d45d1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01967  ! 526: FqTOd	dis not found

mondo_7_294:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d92000d  ! 527: WRPR_WSTATE_R	wrpr	%r8, %r13, %wstate
tagged_7_295:
	taddcctv %r10, 0x1b8c, %r13
	.word 0xd407ec34  ! 528: LDUW_I	lduw	[%r31 + 0x0c34], %r10
	.word 0x8d802004  ! 529: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87902012  ! 530: WRPR_TT_I	wrpr	%r0, 0x0012, %tt
	.word 0x83d020b5  ! 531: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0x30800001  ! 532: BA	ba,a	<label_0x1>
	.word 0xd4c804a0  ! 533: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x91d02032  ! 534: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_cmpr_7_296:
	setx 0x03a3017ae53df3b4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 535: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01968  ! 536: FqTOd	dis not found

DS_7_298:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd735201f  ! 1: STQF_I	-	%f11, [0x001f, %r20]
	normalw
	.word 0x93458000  ! 537: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x93902005  ! 538: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x91d02033  ! 539: Tcc_I	ta	icc_or_xcc, %r0 + 51
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 540: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996aa138  ! 541: SDIVX_I	sdivx	%r10, 0x0138, %r12
	.word 0x38800001  ! 542: BGU	bgu,a	<label_0x1>
	.word 0xe6c7e010  ! 543: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r19
splash_lsu_7_300:
	setx 0xde36168e2a43e22f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 544: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 545: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91d02032  ! 546: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902003  ! 547: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 548: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802e21  ! 549: SIR	sir	0x0e21
	setx 0xb11530f65763e1a9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_301:
	.word 0x39400001  ! 550: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 551: LDX_R	ldx	[%r31 + %r0], %r19
splash_tba_7_302:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 552: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_7_303:
	.word 0x819827ff  ! 553: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07ff, %hpstate
splash_lsu_7_304:
	setx 0x4ea20df74f66c505, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 554: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_7_305:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d910009  ! 555: WRPR_WSTATE_R	wrpr	%r4, %r9, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56cfaa9  ! 556: SDIVX_I	sdivx	%r19, 0xfffffaa9, %r18
	.word 0x91500000  ! 557: RDPR_TPC	rdpr	%tpc, %r8
splash_cmpr_7_307:
	setx 0x49422b19fac48ff3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 558: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_7_308:
	.word 0x81982cdd  ! 559: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdd, %hpstate
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_309
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_309
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_309:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 560: RDPC	rd	%pc, %r11
splash_tba_7_310:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 561: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_7_311:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 562: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xdad7e030  ! 563: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r13
debug_7_312:
	nop
	mov 8, %r18
	.word 0xe6f00852  ! 564: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0x93480000  ! 565: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
splash_cmpr_7_313:
	setx 0x423cc7e89adc1db5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 566: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd66fe176  ! 567: LDSTUB_I	ldstub	%r11, [%r31 + 0x0176]
	.word 0xd6d004a0  ! 568: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0xd697e010  ! 569: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
splash_cmpr_7_314:
	setx 0xab18e7ecee14da87, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 570: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_315:
	setx 0xdcd5a48fcd0d1daa, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 571: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd61fe176  ! 572: LDD_I	ldd	[%r31 + 0x0176], %r11
change_to_randtl_7_316:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_316:
	.word 0x8f902001  ! 573: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	rd %pc, %r19
	add %r19, (ivw_7_317-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_317:
	.word 0x93a0016b  ! 574: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_7_318-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_318:
	.word 0xa7a00164  ! 575: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 576: LDX_R	ldx	[%r31 + %r0], %r9
mondo_7_319:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d92c006  ! 577: WRPR_WSTATE_R	wrpr	%r11, %r6, %wstate
	.word 0x93902007  ! 578: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa9a049d3  ! 579: FDIVd	fdivd	%f32, %f50, %f20
intveclr_7_320:
	setx 0x3901df8728f4d310, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 580: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 581: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe4800b20  ! 582: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r18
	rd %pc, %r19
	add %r19, (ivw_7_321-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_321:
	.word 0xa7a00166  ! 583: FABSq	dis not found

	.word 0xa1902007  ! 584: WRPR_GL_I	wrpr	%r0, 0x0007, %-
intveclr_7_322:
	setx 0x441b131f6e7bcac2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 585: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_7_323:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 586: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_7_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d93000a  ! 587: WRPR_WSTATE_R	wrpr	%r12, %r10, %wstate
splash_cmpr_7_325:
	setx 0x5e8cc3f9ff882a6e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 588: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe29004a0  ! 589: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
	.word 0xe25fe176  ! 590: LDX_I	ldx	[%r31 + 0x0176], %r17
	.word 0x93902003  ! 591: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 592: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 593: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x879022b2  ! 594: WRPR_TT_I	wrpr	%r0, 0x02b2, %tt
debug_7_326:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 595: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01962  ! 596: FqTOd	dis not found

splash_cmpr_7_328:
	setx 0x5c194b045dfdefaf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 597: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe257c000  ! 598: LDSH_R	ldsh	[%r31 + %r0], %r17
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_329
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_329
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_329:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 599: RDPC	rd	%pc, %r8
	.word 0xe41fc000  ! 600: LDD_R	ldd	[%r31 + %r0], %r18
splash_cmpr_7_330:
	setx 0x7e79677907ff3bbb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 601: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 602: LDX_R	ldx	[%r31 + %r0], %r18
mondo_7_331:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d950012  ! 603: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	.word 0x91a109d2  ! 604: FDIVd	fdivd	%f4, %f18, %f8
splash_lsu_7_332:
	setx 0x128d027a7fb384cb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 605: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 606: Tcc_I	ta	icc_or_xcc, %r0 + 179
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_333
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_333
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_333:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 607: RDPC	rd	%pc, %r13
splash_tba_7_334:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 608: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81510000  ! 609: RDPR_TICK	rdpr	%tick, %r0
	.word 0xd057c000  ! 610: LDSH_R	ldsh	[%r31 + %r0], %r8
tagged_7_335:
	taddcctv %r15, 0x1841, %r9
	.word 0xd007e176  ! 611: LDUW_I	lduw	[%r31 + 0x0176], %r8
	.word 0x83d020b4  ! 612: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0x9b454000  ! 613: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
intveclr_7_336:
	setx 0xc135a5834fed130b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 614: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_7_337:
	setx 0x2882f0aabb9c4ac1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 615: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_7_338:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xff7c9e58	! Random illegal ?
	.word 0xe3150007  ! 1: LDQF_R	-	[%r20, %r7], %f17
	.word 0x9ba4c828  ! 616: FADDs	fadds	%f19, %f8, %f13
mondo_7_339:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d90400d  ! 617: WRPR_WSTATE_R	wrpr	%r1, %r13, %wstate
splash_cmpr_7_340:
	setx 0x1fcc38789bc83150, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 618: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 619: Tcc_I	ta	icc_or_xcc, %r0 + 53
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 620: LDX_R	ldx	[%r31 + %r0], %r16
splash_cmpr_7_341:
	setx 0x26114e377c4dc949, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 621: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0c00e40  ! 622: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r16
	.word 0xe137e176  ! 623: STQF_I	-	%f16, [0x0176, %r31]
change_to_randtl_7_342:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_342:
	.word 0x8f902002  ! 624: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_7_343:
	taddcctv %r13, 0x11a7, %r4
	.word 0xe007e176  ! 625: LDUW_I	lduw	[%r31 + 0x0176], %r16
	.word 0x95a48d28  ! 626: FsMULd	fsmuld	%f18, %f8, %f10
splash_tba_7_344:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 627: WRPR_TBA_R	wrpr	%r0, %r2, %tba
pmu_7_345:
	nop
	setx 0xfffff52afffffdb3, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01965  ! 629: FqTOd	dis not found

	.word 0xad826533  ! 630: WR_SOFTINT_REG_I	wr	%r9, 0x0533, %softint
	.word 0xd447c000  ! 631: LDSW_R	ldsw	[%r31 + %r0], %r10
	.word 0x93902001  ! 632: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
debug_7_347:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 633: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_348
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_348
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_348:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 634: RDPC	rd	%pc, %r9
DS_7_349:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa9a189cb  ! 1: FDIVd	fdivd	%f6, %f42, %f20
	normalw
	.word 0x97458000  ! 635: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x95464000  ! 636: RD_STICK_CMPR_REG	rd	%-, %r10
	.word 0xd28008a0  ! 637: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xa7500000  ! 638: RDPR_TPC	rdpr	%tpc, %r19
tagged_7_350:
	tsubcctv %r6, 0x1c23, %r11
	.word 0xe807fb6a  ! 639: LDUW_I	lduw	[%r31 + 0xfffffb6a], %r20
	.word 0xa190200e  ! 640: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	setx 0x0d31cd4e8900c159, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_351:
	.word 0x39400001  ! 641: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_7_352:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 642: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_7_353:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 643: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_354
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_354
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_354:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 644: RDPC	rd	%pc, %r11
	.word 0xda800ba0  ! 645: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r13
	.word 0x99454000  ! 646: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0x93902007  ! 647: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_cmpr_7_355:
	setx 0xcdb97b304c000be8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 648: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02035  ! 649: Tcc_I	tne	icc_or_xcc, %r0 + 53
debug_7_356:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 650: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd81ffb6a  ! 651: LDD_I	ldd	[%r31 + 0xfffffb6a], %r12
mondo_7_357:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d924006  ! 652: WRPR_WSTATE_R	wrpr	%r9, %r6, %wstate
	.word 0x879022ae  ! 653: WRPR_TT_I	wrpr	%r0, 0x02ae, %tt
	.word 0x8790207c  ! 654: WRPR_TT_I	wrpr	%r0, 0x007c, %tt
	.word 0x91480000  ! 655: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x879020e6  ! 656: WRPR_TT_I	wrpr	%r0, 0x00e6, %tt
	.word 0x87802010  ! 657: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d802000  ! 658: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802063  ! 659: WRASI_I	wr	%r0, 0x0063, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_358)) -> intp(3,0,20)
intvec_7_358:
	.word 0x39400001  ! 660: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_7_359:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 661: SAVE_R	save	%r31, %r0, %r31
	.word 0x99540000  ! 662: RDPR_GL	rdpr	%-, %r12
debug_7_360:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 663: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
debug_7_361:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 664: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xda1fc000  ! 665: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xa9b24feb  ! 666: FONES	e	%f20
	.word 0xe68008a0  ! 667: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe6dfe010  ! 668: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r19
	.word 0x8780201c  ! 669: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x93902004  ! 670: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
change_to_randtl_7_362:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_362:
	.word 0x8f902001  ! 671: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x97a01a6b  ! 672: FqTOi	fqtoi	
	.word 0xe48fe020  ! 673: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r18
	.word 0xe49004a0  ! 674: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0x8d90245a  ! 675: WRPR_PSTATE_I	wrpr	%r0, 0x045a, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01970  ! 676: FqTOd	dis not found

	.word 0xd89fc020  ! 677: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0x93902000  ! 678: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_7_364:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d920000  ! 679: WRPR_WSTATE_R	wrpr	%r8, %r0, %wstate
	.word 0xd89004a0  ! 680: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
mondo_7_365:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d94000b  ! 681: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
splash_cmpr_7_366:
	setx 0xe0ad54dead382eea, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 682: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 683: LDX_R	ldx	[%r31 + %r0], %r12
DS_7_367:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 684: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x87802004  ! 685: WRASI_I	wr	%r0, 0x0004, %asi
intveclr_7_368:
	setx 0xdb52f6985e86a998, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 686: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196a  ! 687: FqTOd	dis not found

splash_lsu_7_370:
	setx 0x3eb4b974923b398b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 688: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_7_371:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 689: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 690: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x93902002  ! 691: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01962  ! 692: FqTOd	dis not found

	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 693: Tcc_R	te	icc_or_xcc, %r0 + %r30
	setx 0x208df106dccf089d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_373:
	.word 0x39400001  ! 694: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d804a0  ! 695: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
splash_hpstate_7_374:
	.word 0x819826de  ! 696: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06de, %hpstate
	.word 0x83d02034  ! 697: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xd48fe000  ! 698: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r10
	.word 0x93450000  ! 699: RD_SET_SOFTINT	rd	%set_softint, %r9
change_to_randtl_7_375:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_375:
	.word 0x8f902002  ! 700: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_7_376:
	setx 0x2a772763ba098405, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 701: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_7_377:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_377:
	.word 0x8f902002  ! 702: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
change_to_randtl_7_378:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_378:
	.word 0x8f902000  ! 703: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_7_379:
	taddcctv %r24, 0x176a, %r25
	.word 0xd607fb6a  ! 704: LDUW_I	lduw	[%r31 + 0xfffffb6a], %r11
	.word 0xd6d80e40  ! 705: LDXA_R	ldxa	[%r0, %r0] 0x72, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976d2dc9  ! 706: SDIVX_I	sdivx	%r20, 0x0dc9, %r11
	.word 0x87802004  ! 707: WRASI_I	wr	%r0, 0x0004, %asi
change_to_randtl_7_381:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_381:
	.word 0x8f902002  ! 708: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
change_to_randtl_7_382:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_382:
	.word 0x8f902001  ! 709: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 710: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879022a3  ! 711: WRPR_TT_I	wrpr	%r0, 0x02a3, %tt
	.word 0x8790222e  ! 712: WRPR_TT_I	wrpr	%r0, 0x022e, %tt
debug_7_383:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 713: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4dfe010  ! 714: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r10
	.word 0x99902000  ! 715: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x93902004  ! 716: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_hpstate_7_384:
	.word 0x81982b0c  ! 717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0c, %hpstate
splash_tba_7_385:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 718: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_7_386:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 719: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_7_387:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 720: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x99450000  ! 721: RD_SET_SOFTINT	rd	%set_softint, %r12
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 722: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd81ffa75  ! 723: LDD_I	ldd	[%r31 + 0xfffffa75], %r12
	.word 0x8d903261  ! 724: WRPR_PSTATE_I	wrpr	%r0, 0x1261, %pstate
	.word 0x9191275e  ! 725: WRPR_PIL_I	wrpr	%r4, 0x075e, %pil
mondo_7_388:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d908007  ! 726: WRPR_WSTATE_R	wrpr	%r2, %r7, %wstate
tagged_7_389:
	taddcctv %r26, 0x1d40, %r8
	.word 0xd807f31f  ! 727: LDUW_I	lduw	[%r31 + 0xfffff31f], %r12
DS_7_390:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xf36cf6c3	! Random illegal ?
	.word 0x97a489c6  ! 1: FDIVd	fdivd	%f18, %f6, %f42
	.word 0xa7a28830  ! 728: FADDs	fadds	%f10, %f16, %f19
	.word 0xa3520000  ! 729: RDPR_PIL	rdpr	%pil, %r17
	.word 0x2a700001  ! 730: BPCS	<illegal instruction>
splash_cmpr_7_391:
	setx 0xc44bedd1dfb6b979, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 731: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_392:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 732: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d020b5  ! 733: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_cmpr_7_393:
	setx 0x6e88f64fd619757c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 734: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976ae5d7  ! 735: SDIVX_I	sdivx	%r11, 0x05d7, %r11
	rd %pc, %r19
	add %r19, (ivw_7_395-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_395:
	.word 0x9ba00168  ! 736: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01967  ! 737: FqTOd	dis not found

	setx 0xa66b539b649089e6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_397:
	.word 0x39400001  ! 738: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_7_398:
	setx 0x08b63087e5d3f21e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 739: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99520000  ! 740: RDPR_PIL	rdpr	%pil, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36c6cf6  ! 741: SDIVX_I	sdivx	%r17, 0x0cf6, %r17
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_400
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_400
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_400:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 742: RDPC	rd	%pc, %r8
debug_7_401:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 743: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x99540000  ! 744: RDPR_GL	<illegal instruction>
	.word 0x8d802004  ! 745: WRFPRS_I	wr	%r0, 0x0004, %fprs
    set sync_thr_counter1, %r23
    mov 7, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_402
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_402
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_402:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 746: RDPC	rd	%pc, %r11
splash_tba_7_403:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 747: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_7_404:
	setx 0xa4578e7959d38b9b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 748: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_7_405:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d944002  ! 749: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
	.word 0x3c800001  ! 750: BPOS	bpos,a	<label_0x1>
DS_7_406:
	.word 0xa3a4c9c6  ! 1: FDIVd	fdivd	%f50, %f6, %f48
	.word 0xbfe7c000  ! 751: SAVE_R	save	%r31, %r0, %r31
mondo_7_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d914011  ! 752: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936c6e06  ! 753: SDIVX_I	sdivx	%r17, 0x0e06, %r9
	.word 0x9550c000  ! 754: RDPR_TT	rdpr	%tt, %r10
	.word 0x87802004  ! 755: WRASI_I	wr	%r0, 0x0004, %asi
tagged_7_409:
	taddcctv %r10, 0x1ac7, %r24
	.word 0xd607e3d0  ! 756: LDUW_I	lduw	[%r31 + 0x03d0], %r11
	.word 0xd6d7e020  ! 757: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r11
	.word 0x9950c000  ! 758: RDPR_TT	rdpr	%tt, %r12
mondo_7_410:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d948002  ! 759: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
splash_lsu_7_411:
	setx 0x0e4e4cb4724c8059, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 760: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_7_412:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d918012  ! 761: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
	.word 0xa5480000  ! 762: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	.word 0xa5540000  ! 763: RDPR_GL	<illegal instruction>
change_to_randtl_7_413:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_413:
	.word 0x8f902000  ! 764: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
mondo_7_414:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d904011  ! 765: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
debug_7_415:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 766: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_7_416:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d908007  ! 767: WRPR_WSTATE_R	wrpr	%r2, %r7, %wstate
	.word 0xe2d7e000  ! 768: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r17
debug_7_417:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 769: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x87802058  ! 770: WRASI_I	wr	%r0, 0x0058, %asi
splash_cmpr_7_418:
	setx 0x47e44a6bddf1c281, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 771: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02034  ! 772: Tcc_I	ta	icc_or_xcc, %r0 + 52
!$EV trig_pc_d(1, @VA(.MAIN.xir_7_419)) -> intp(7,1,3)
xir_7_419:
	.word 0xa980e5ab  ! 773: WR_SET_SOFTINT_I	wr	%r3, 0x05ab, %set_softint
	.word 0xe20fc000  ! 774: LDUB_R	ldub	[%r31 + %r0], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 775: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_7_420:
	.word 0x819828ed  ! 776: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ed, %hpstate
	.word 0x83d02033  ! 777: Tcc_I	te	icc_or_xcc, %r0 + 51
tagged_7_421:
	taddcctv %r13, 0x1647, %r7
	.word 0xe207f180  ! 778: LDUW_I	lduw	[%r31 + 0xfffff180], %r17
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 779: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_7_422:
	setx 0x8c0620dba083ca06, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 780: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91500000  ! 781: RDPR_TPC	<illegal instruction>
debug_7_423:
	nop
	mov 8, %r18
	.word 0xe6f00852  ! 782: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
debug_7_424:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 783: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976b6b8d  ! 784: SDIVX_I	sdivx	%r13, 0x0b8d, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976a3501  ! 785: SDIVX_I	sdivx	%r8, 0xfffff501, %r11
	.word 0xd137c000  ! 786: STQF_R	-	%f8, [%r0, %r31]
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 787: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_7_427:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d950006  ! 788: WRPR_WSTATE_R	wrpr	%r20, %r6, %wstate
donret_7_428:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_428-donret_7_428), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_428:
	.word 0xd0fff5af  ! 789: SWAPA_I	swapa	%r8, [%r31 + 0xfffff5af] %asi
	.word 0xd127c000  ! 790: STF_R	st	%f8, [%r0, %r31]
	.word 0xa145c000  ! 791: RD_TICK_CMPR_REG	rd	%-, %r16
mondo_7_429:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d94c010  ! 792: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01974  ! 793: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 794: LDX_R	ldx	[%r31 + %r0], %r11
splash_cmpr_7_431:
	setx 0xc23b4e572b6061bb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 795: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_432:
	setx 0x5de8ab390f05fa87, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 796: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 797: BPNE	<illegal instruction>
	.word 0x93902001  ! 798: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
debug_7_433:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 1: LDX_R	ldx	[%r31 + %r0], %r17
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_0
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_0:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 2: RDPC	rd	%pc, %r8
	.word 0xd28fe030  ! 3: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r9
	.word 0x91d02033  ! 4: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_cmpr_6_1:
	setx 0x8d34c89a0a08dca1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 5: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 6: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01970  ! 7: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 8: LDX_R	ldx	[%r31 + %r0], %r17
debug_6_3:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 9: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0xe2d00e60  ! 10: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r17
	.word 0x879023fa  ! 11: WRPR_TT_I	wrpr	%r0, 0x03fa, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97693052  ! 12: SDIVX_I	sdivx	%r4, 0xfffff052, %r11
debug_6_5:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 13: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_6_6:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 14: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
splash_cmpr_6_7:
	setx 0xf18b9a92756561b5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 15: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916a6941  ! 16: SDIVX_I	sdivx	%r9, 0x0941, %r8
splash_cmpr_6_9:
	setx 0x26a1c2af42cc5b4d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 17: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879020f7  ! 18: WRPR_TT_I	wrpr	%r0, 0x00f7, %tt
change_to_randtl_6_10:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_10:
	.word 0x8f902000  ! 19: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
donret_6_11:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_11-donret_6_11), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_11:
	.word 0xe2ffe750  ! 20: SWAPA_I	swapa	%r17, [%r31 + 0x0750] %asi
change_to_randtl_6_12:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_12:
	.word 0x8f902001  ! 21: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_6_13:
	taddcctv %r18, 0x18b9, %r8
	.word 0xe207e750  ! 22: LDUW_I	lduw	[%r31 + 0x0750], %r17
	.word 0x22700001  ! 23: BPE	<illegal instruction>
	.word 0xa145c000  ! 24: RD_TICK_CMPR_REG	rd	%-, %r16
mondo_6_14:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d900003  ! 25: WRPR_WSTATE_R	wrpr	%r0, %r3, %wstate
	.word 0x83d02034  ! 26: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x87802058  ! 27: WRASI_I	wr	%r0, 0x0058, %asi
intveclr_6_15:
	setx 0x1301027ac23b8e9a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8cfe000  ! 29: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
	.word 0xa190200e  ! 30: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_lsu_6_16:
	setx 0xd5990fcea849e4b7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 31: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 32: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
mondo_6_17:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d924011  ! 33: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 34: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_hpstate_6_18:
	.word 0x819824df  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04df, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 36: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa9480000  ! 37: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
splash_lsu_6_19:
	setx 0xd23356d412cccfcd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 38: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 39: RD_STICK_REG	stbar
	.word 0x81510000  ! 40: RDPR_TICK	rdpr	%tick, %r0
tagged_6_20:
	tsubcctv %r8, 0x1015, %r16
	.word 0xd807e750  ! 41: LDUW_I	lduw	[%r31 + 0x0750], %r12
splash_lsu_6_21:
	setx 0x504c8bc278113951, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 42: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_6_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d914013  ! 43: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
	.word 0xa1902009  ! 44: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xa2484002  ! 45: MULX_R	mulx 	%r1, %r2, %r17
	.word 0x99450000  ! 46: RD_SET_SOFTINT	rd	%set_softint, %r12
intveclr_6_23:
	setx 0x54470fb6eecba404, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 47: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_24)) -> intp(4,0,22)
intvec_6_24:
	.word 0x39400001  ! 48: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790228d  ! 49: WRPR_TT_I	wrpr	%r0, 0x028d, %tt
debug_6_25:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 50: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_6_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d94400b  ! 51: WRPR_WSTATE_R	wrpr	%r17, %r11, %wstate
	.word 0x879023d4  ! 52: WRPR_TT_I	wrpr	%r0, 0x03d4, %tt
	.word 0xa3a049d3  ! 53: FDIVd	fdivd	%f32, %f50, %f48
splash_hpstate_6_27:
	.word 0x81982d34  ! 54: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d34, %hpstate
	.word 0x87802089  ! 55: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x93d020b5  ! 56: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x3e700001  ! 57: BPVC	<illegal instruction>
	.word 0xe60fc000  ! 58: LDUB_R	ldub	[%r31 + %r0], %r19
	rd %pc, %r19
	add %r19, (ivw_6_28-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_28:
	.word 0x97a0016b  ! 59: FABSq	dis not found

	.word 0xd48fe030  ! 60: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
	.word 0xd4c7e030  ! 61: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
DS_6_29:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 62: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
splash_tba_6_30:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 63: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_6_31:
	setx 0x64dfdaf854bbb6a2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 64: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_32:
	setx 0x837cdd4ce1b0516a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 65: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_6_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d940006  ! 66: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
debug_6_34:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 67: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_6_35:
	.word 0x81982c9d  ! 68: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9d, %hpstate
intveclr_6_36:
	setx 0x2a2c154ffbbaf0fc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903241  ! 70: WRPR_PSTATE_I	wrpr	%r0, 0x1241, %pstate
splash_cmpr_6_37:
	setx 0xfea9693878c408a7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 71: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_6_38:
	nop
	setx 0xfffffebefffff478, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_6_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d950005  ! 73: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	rd %pc, %r19
	add %r19, (ivw_6_40-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_40:
	.word 0x95a00164  ! 74: FABSq	dis not found

pmu_6_41:
	nop
	setx 0xfffff71cfffff766, %g1, %g7
	.word 0xa3800007  ! 75: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd02fe750  ! 76: STB_I	stb	%r8, [%r31 + 0x0750]
splash_cmpr_6_42:
	setx 0xd034c0993ab77052, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 77: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3c700001  ! 78: BPPOS	<illegal instruction>
debug_6_43:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 79: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_6_44:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 80: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd0800a80  ! 81: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r8
	rd %pc, %r19
	add %r19, (ivw_6_45-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_45:
	.word 0xa5a00166  ! 82: FABSq	dis not found

splash_lsu_6_46:
	setx 0x230de42ff2037f99, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 83: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_6_47:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_47:
	.word 0x8f902002  ! 84: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 85: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 86: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x9194fe46  ! 87: WRPR_PIL_I	wrpr	%r19, 0x1e46, %pil
	.word 0xd69004a0  ! 88: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0xa190200c  ! 89: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xd6c004a0  ! 90: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
mondo_6_48:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d94c007  ! 91: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
splash_cmpr_6_49:
	setx 0x3a4ab9f35362a0a8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 92: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02034  ! 93: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x87802004  ! 94: WRASI_I	wr	%r0, 0x0004, %asi
mondo_6_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d950005  ! 95: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	.word 0xd6dfe000  ! 96: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
	.word 0x93902000  ! 97: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
change_to_randtl_6_51:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_51:
	.word 0x8f902000  ! 98: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_6_52:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_52:
	.word 0x8f902002  ! 99: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d90244d  ! 100: WRPR_PSTATE_I	wrpr	%r0, 0x044d, %pstate
	.word 0x91d020b3  ! 101: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xd73fc000  ! 102: STDF_R	std	%f11, [%r0, %r31]
	.word 0xa980c001  ! 103: WR_SET_SOFTINT_R	wr	%r3, %r1, %set_softint
	.word 0xa190200c  ! 104: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x879021c1  ! 105: WRPR_TT_I	wrpr	%r0, 0x01c1, %tt
debug_6_53:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 106: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_6_54-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_54:
	.word 0x9ba00170  ! 107: FABSq	dis not found

splash_lsu_6_55:
	setx 0x29f93f6d7816ddab, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 108: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 109: SIAM	siam	1
debug_6_56:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 110: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_6_57:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_57-donret_6_57), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_57:
	.word 0xd8fff234  ! 111: SWAPA_I	swapa	%r12, [%r31 + 0xfffff234] %asi
DS_6_58:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x937617da	! Random illegal ?
	.word 0x97a00542  ! 1: FSQRTd	fsqrt	
	.word 0x91a14834  ! 112: FADDs	fadds	%f5, %f20, %f8
splash_tba_6_59:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 113: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x95a489f4  ! 114: FDIVq	dis not found

	.word 0xd4d00e40  ! 115: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 116: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36c7878  ! 117: SDIVX_I	sdivx	%r17, 0xfffff878, %r17
intveclr_6_61:
	setx 0x0abc57174cb6d232, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 118: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 119: SIAM	siam	1
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 120: LDX_R	ldx	[%r31 + %r0], %r13
tagged_6_62:
	tsubcctv %r20, 0x1158, %r13
	.word 0xda07e1f9  ! 121: LDUW_I	lduw	[%r31 + 0x01f9], %r13
	.word 0xda57c000  ! 122: LDSH_R	ldsh	[%r31 + %r0], %r13
tagged_6_63:
	taddcctv %r17, 0x1dde, %r22
	.word 0xda07e1f9  ! 123: LDUW_I	lduw	[%r31 + 0x01f9], %r13
	.word 0xdac004a0  ! 124: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
donret_6_64:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_64-donret_6_64), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_64:
	.word 0xdaffe1f9  ! 125: SWAPA_I	swapa	%r13, [%r31 + 0x01f9] %asi
	.word 0xdacfe000  ! 126: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r13
mondo_6_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d94000b  ! 127: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
splash_cmpr_6_66:
	setx 0x32dd296e296584d0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 128: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_6_67:
	.word 0x819824cd  ! 129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cd, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_6_68)) -> intp(6,1,3)
xir_6_68:
	.word 0xa981b394  ! 130: WR_SET_SOFTINT_I	wr	%r6, 0x1394, %set_softint
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01966  ! 131: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_70)) -> intp(3,0,13)
intvec_6_70:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 133: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x83d02033  ! 134: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xd48008a0  ! 135: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
debug_6_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 136: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_6_72:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_72-donret_6_72), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_72:
	.word 0xd4fff312  ! 137: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
splash_lsu_6_73:
	setx 0xdd3e83ddf3fa91ed, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 138: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_6_74:
	setx 0x567f91016344e5d1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 139: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 140: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa9a01a6c  ! 141: FqTOi	fqtoi	
tagged_6_75:
	taddcctv %r26, 0x1fcc, %r22
	.word 0xe207f312  ! 142: LDUW_I	lduw	[%r31 + 0xfffff312], %r17
splash_hpstate_6_76:
	.word 0x8198270c  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070c, %hpstate
	.word 0x99454000  ! 144: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
splash_htba_6_77:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 145: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_6_78:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 146: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_6_79:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 147: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_80)) -> intp(3,0,0)
intvec_6_80:
	.word 0x39400001  ! 148: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_6_81:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 149: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_6_82:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_82:
	.word 0x8f902001  ! 150: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_6_83:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 151: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x83d02034  ! 152: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8d903032  ! 153: WRPR_PSTATE_I	wrpr	%r0, 0x1032, %pstate
	.word 0xa950c000  ! 154: RDPR_TT	rdpr	%tt, %r20
DS_6_84:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 155: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_6_85:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 156: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802004  ! 157: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93d020b4  ! 158: Tcc_I	tne	icc_or_xcc, %r0 + 180
intveclr_6_86:
	setx 0x6df222e91c5468e3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 159: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_6_87:
	taddcctv %r3, 0x1dce, %r12
	.word 0xe607f312  ! 160: LDUW_I	lduw	[%r31 + 0xfffff312], %r19
mondo_6_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d944004  ! 161: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
splash_tba_6_89:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 162: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_6_90:
	.word 0x8198245c  ! 163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x045c, %hpstate
splash_cmpr_6_91:
	setx 0x35c44705c4b2a200, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 164: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe71fc000  ! 165: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x93902006  ! 166: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_6_92:
	.word 0x93a1c9cc  ! 1: FDIVd	fdivd	%f38, %f12, %f40
	.word 0x9f6e44a9	! Random illegal ?
	.word 0x91a00551  ! 1: FSQRTd	fsqrt	
	.word 0x97a0882a  ! 167: FADDs	fadds	%f2, %f10, %f11
	.word 0xa1902008  ! 168: WRPR_GL_I	wrpr	%r0, 0x0008, %-
donret_6_93:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_93-donret_6_93), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_93:
	.word 0xd4fff312  ! 169: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
	.word 0x93902001  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
donret_6_94:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_94-donret_6_94), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_94:
	.word 0xd4fff312  ! 171: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
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
	.word 0x95414000  ! 172: RDPC	rd	%pc, %r10
	.word 0xd0dfe030  ! 173: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r8
	.word 0xa1902005  ! 174: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xd127c000  ! 175: STF_R	st	%f8, [%r0, %r31]
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 176: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_6_96:
	setx 0x34d620046045c1b4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 177: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9028ff  ! 178: WRPR_PSTATE_I	wrpr	%r0, 0x08ff, %pstate
	.word 0xa7480000  ! 179: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0xd28008a0  ! 180: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x93d02032  ! 181: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x81510000  ! 182: RDPR_TICK	rdpr	%tick, %r0
mondo_6_97:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d948006  ! 183: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_98)) -> intp(2,0,3)
intvec_6_98:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_6_99:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_99:
	.word 0x8f902000  ! 185: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902005  ! 186: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 187: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_6_100:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_100:
	.word 0x8f902000  ! 188: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d802000  ! 189: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_6_101:
	setx 0xc4a6ec5fc28c125c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 190: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01970  ! 191: FqTOd	dis not found

	setx 0x697748ff0728276f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_103:
	.word 0x39400001  ! 192: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0880e40  ! 193: LDUBA_R	lduba	[%r0, %r0] 0x72, %r8
mondo_6_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d924004  ! 194: WRPR_WSTATE_R	wrpr	%r9, %r4, %wstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 195: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd09004a0  ! 196: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0xd06ff312  ! 197: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff312]
change_to_randtl_6_105:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_105:
	.word 0x8f902003  ! 198: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_cmpr_6_106:
	setx 0xf23e7a1916e4fef3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 199: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802020  ! 200: WRASI_I	wr	%r0, 0x0020, %asi
	rd %pc, %r19
	add %r19, (ivw_6_107-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_107:
	.word 0xa5a00163  ! 201: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56ce242  ! 202: SDIVX_I	sdivx	%r19, 0x0242, %r18
	.word 0xd6d004a0  ! 203: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
splash_hpstate_6_109:
	.word 0x81982b1d  ! 204: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1d, %hpstate
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 205: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_6_110:
	.word 0xa9a209c3  ! 1: FDIVd	fdivd	%f8, %f34, %f20
	.word 0xbfe7c000  ! 206: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_6_111:
	setx 0x3788f8843fb42d06, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 208: LDX_R	ldx	[%r31 + %r0], %r11
splash_tba_6_112:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 209: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_6_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 210: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd727c000  ! 211: STF_R	st	%f11, [%r0, %r31]
	.word 0xa981c005  ! 212: WR_SET_SOFTINT_R	wr	%r7, %r5, %set_softint
mondo_6_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d92c00d  ! 213: WRPR_WSTATE_R	wrpr	%r11, %r13, %wstate
mondo_6_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d900013  ! 214: WRPR_WSTATE_R	wrpr	%r0, %r19, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196b  ! 215: FqTOd	dis not found

	.word 0x90f8400c  ! 216: SDIVcc_R	sdivcc 	%r1, %r12, %r8
	.word 0xa190200d  ! 217: WRPR_GL_I	wrpr	%r0, 0x000d, %-
mondo_6_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d93000c  ! 218: WRPR_WSTATE_R	wrpr	%r12, %r12, %wstate
	.word 0xe48008a0  ! 219: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe4bfc020  ! 220: STDA_R	stda	%r18, [%r31 + %r0] 0x01
tagged_6_118:
	tsubcctv %r9, 0x1498, %r2
	.word 0xe407f661  ! 221: LDUW_I	lduw	[%r31 + 0xfffff661], %r18
	.word 0x8790202d  ! 222: WRPR_TT_I	wrpr	%r0, 0x002d, %tt
	.word 0xe4d7e000  ! 223: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r18
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
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
	.word 0x99414000  ! 224: RDPC	rd	%pc, %r12
	rd %pc, %r19
	add %r19, (ivw_6_120-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_120:
	.word 0x9ba00163  ! 225: FABSq	dis not found

donret_6_121:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_121-donret_6_121), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_121:
	.word 0xd2fff661  ! 226: SWAPA_I	swapa	%r9, [%r31 + 0xfffff661] %asi
	.word 0xa9834004  ! 227: WR_SET_SOFTINT_R	wr	%r13, %r4, %set_softint
	.word 0x904c000c  ! 228: MULX_R	mulx 	%r16, %r12, %r8
splash_lsu_6_122:
	setx 0xcb943fc3687cc015, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 229: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x441cbb841cef9bf6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_123:
	.word 0x39400001  ! 230: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe21ff661  ! 231: LDD_I	ldd	[%r31 + 0xfffff661], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 232: LDX_R	ldx	[%r31 + %r0], %r17
DS_6_124:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 233: SAVE_R	save	%r31, %r0, %r31
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 234: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_6_125:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 235: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_126)) -> intp(7,0,12)
intvec_6_126:
	.word 0x39400001  ! 236: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_6_127:
	setx 0xd015bf667849f323, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_6_128-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_128:
	.word 0xa1a00174  ! 238: FABSq	dis not found

	.word 0xd69ff661  ! 239: LDDA_I	ldda	[%r31, + 0xfffff661] %asi, %r11
DS_6_129:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd132c008  ! 1: STQF_R	-	%f8, [%r8, %r11]
	normalw
	.word 0x91458000  ! 240: RD_SOFTINT_REG	rd	%softint, %r8
splash_lsu_6_130:
	setx 0x8086a61a0b0b1a5b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 241: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2c80e80  ! 242: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r17
splash_tba_6_131:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 243: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200f  ! 244: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xe2d004a0  ! 245: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0xe2d004a0  ! 246: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0x97520000  ! 247: RDPR_PIL	rdpr	%pil, %r11
tagged_6_132:
	tsubcctv %r6, 0x19d5, %r1
	.word 0xe607f661  ! 248: LDUW_I	lduw	[%r31 + 0xfffff661], %r19
debug_6_133:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 249: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe727c000  ! 250: STF_R	st	%f19, [%r0, %r31]
splash_lsu_6_134:
	setx 0x6b1311b03dc83b29, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 251: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x32800001  ! 252: BNE	bne,a	<label_0x1>
	.word 0xe6d804a0  ! 253: LDXA_R	ldxa	[%r0, %r0] 0x25, %r19
	.word 0xe66ff661  ! 254: LDSTUB_I	ldstub	%r19, [%r31 + 0xfffff661]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a0196d  ! 255: FqTOd	dis not found

	.word 0x8d902f61  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x0f61, %pstate
splash_hpstate_6_136:
	.word 0x81982954  ! 257: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0954, %hpstate
	.word 0xa7a10dc2  ! 258: FdMULq	fdmulq	
	.word 0x93902007  ! 259: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
mondo_6_137:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d900008  ! 260: WRPR_WSTATE_R	wrpr	%r0, %r8, %wstate
	.word 0xe29004a0  ! 261: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
mondo_6_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d948005  ! 262: WRPR_WSTATE_R	wrpr	%r18, %r5, %wstate
	.word 0x87802055  ! 263: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x8780201c  ! 264: WRASI_I	wr	%r0, 0x001c, %asi
mondo_6_139:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d908008  ! 265: WRPR_WSTATE_R	wrpr	%r2, %r8, %wstate
mondo_6_140:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d908014  ! 266: WRPR_WSTATE_R	wrpr	%r2, %r20, %wstate
debug_6_141:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 267: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0x8d9022a8  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x02a8, %pstate
debug_6_142:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 269: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab83000c  ! 270: WR_CLEAR_SOFTINT_R	wr	%r12, %r12, %clear_softint
debug_6_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 271: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa190200c  ! 272: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 273: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196a  ! 274: FqTOd	dis not found

tagged_6_145:
	taddcctv %r16, 0x1428, %r4
	.word 0xd407f661  ! 275: LDUW_I	lduw	[%r31 + 0xfffff661], %r10
splash_cmpr_6_146:
	setx 0xa64e28075e4afd50, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 276: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d90257e  ! 277: WRPR_PSTATE_I	wrpr	%r0, 0x057e, %pstate
splash_tba_6_147:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 278: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_6_148:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 279: RESTORE_R	restore	%r31, %r0, %r31
mondo_6_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d900013  ! 280: WRPR_WSTATE_R	wrpr	%r0, %r19, %wstate
splash_lsu_6_150:
	setx 0x09f64e3e4b042fa3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 281: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879021ba  ! 282: WRPR_TT_I	wrpr	%r0, 0x01ba, %tt
	setx 0xff45f74aee940d60, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_151:
	.word 0x39400001  ! 283: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd40ff661  ! 284: LDUB_I	ldub	[%r31 + 0xfffff661], %r10
mondo_6_152:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d910007  ! 285: WRPR_WSTATE_R	wrpr	%r4, %r7, %wstate
	.word 0x8d9025ed  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x05ed, %pstate
splash_tba_6_153:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 287: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790201a  ! 288: WRPR_TT_I	wrpr	%r0, 0x001a, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996c6aae  ! 289: SDIVX_I	sdivx	%r17, 0x0aae, %r12
splash_tba_6_155:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 290: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_6_156:
	setx 0x876f73b134250777, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 291: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01970  ! 292: FqTOd	dis not found

splash_lsu_6_158:
	setx 0xbe05290751024555, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 293: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 294: RD_STICK_REG	stbar
splash_cmpr_6_159:
	setx 0xd1fdc52ba83af20e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_160:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 296: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d903105  ! 297: WRPR_PSTATE_I	wrpr	%r0, 0x1105, %pstate
	.word 0xa2fc266a  ! 298: SDIVcc_I	sdivcc 	%r16, 0x066a, %r17
	.word 0xa9834014  ! 299: WR_SET_SOFTINT_R	wr	%r13, %r20, %set_softint
	.word 0xd08804a0  ! 300: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	setx 0xea143277e2ce9f74, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_161:
	.word 0x39400001  ! 301: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0d804a0  ! 302: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_162)) -> intp(0,0,25)
intvec_6_162:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_6_163:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d910012  ! 304: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
	.word 0xab84c007  ! 305: WR_CLEAR_SOFTINT_R	wr	%r19, %r7, %clear_softint
	.word 0xa1902008  ! 306: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 307: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196a  ! 308: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01974  ! 309: FqTOd	dis not found

	.word 0x87802088  ! 310: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8780201c  ! 311: WRASI_I	wr	%r0, 0x001c, %asi
mondo_6_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d910005  ! 312: WRPR_WSTATE_R	wrpr	%r4, %r5, %wstate
pmu_6_167:
	nop
	setx 0xfffff7f6fffffd59, %g1, %g7
	.word 0xa3800007  ! 313: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_6_168:
	setx 0x7d4af1d05e89c511, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 314: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902076  ! 315: WRPR_TT_I	wrpr	%r0, 0x0076, %tt
	.word 0x9194b054  ! 316: WRPR_PIL_I	wrpr	%r18, 0x1054, %pil
tagged_6_169:
	taddcctv %r16, 0x13b1, %r4
	.word 0xd607ee91  ! 317: LDUW_I	lduw	[%r31 + 0x0e91], %r11
	.word 0xa7a349c7  ! 318: FDIVd	fdivd	%f44, %f38, %f50
	.word 0xd06fee91  ! 319: LDSTUB_I	ldstub	%r8, [%r31 + 0x0e91]
	.word 0xd06fee91  ! 320: LDSTUB_I	ldstub	%r8, [%r31 + 0x0e91]
splash_tba_6_170:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 321: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x96c1704a  ! 322: ADDCcc_I	addccc 	%r5, 0xfffff04a, %r11
splash_cmpr_6_171:
	setx 0x96d3451293798f9c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 323: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802080  ! 324: WRASI_I	wr	%r0, 0x0080, %asi
	rd %pc, %r19
	add %r19, (ivw_6_172-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_172:
	.word 0x99a00173  ! 325: FABSq	dis not found

	.word 0x93902002  ! 326: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
debug_6_173:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 327: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_6_174:
	.word 0x81982ccd  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ccd, %hpstate
splash_tba_6_175:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 329: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_176:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 330: RDPC	rd	%pc, %r8
tagged_6_177:
	taddcctv %r7, 0x1f0d, %r20
	.word 0xda07e697  ! 331: LDUW_I	lduw	[%r31 + 0x0697], %r13
	.word 0xda1fc000  ! 332: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x96498014  ! 333: MULX_R	mulx 	%r6, %r20, %r11
	.word 0xe2dfe000  ! 334: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r17
change_to_randtl_6_178:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_178:
	.word 0x8f902001  ! 335: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_6_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 336: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_6_180:
	setx 0xb6020cd826cee600, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902005  ! 338: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
mondo_6_181:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d918004  ! 339: WRPR_WSTATE_R	wrpr	%r6, %r4, %wstate
donret_6_182:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_182-donret_6_182), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_182:
	.word 0xe2ffe697  ! 340: SWAPA_I	swapa	%r17, [%r31 + 0x0697] %asi
	.word 0xe26fe697  ! 341: LDSTUB_I	ldstub	%r17, [%r31 + 0x0697]
intveclr_6_183:
	setx 0x392e11962fc4552a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 342: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_6_184:
	.word 0x8198280e  ! 343: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080e, %hpstate
intveclr_6_185:
	setx 0x2bef932afabc671d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_186)) -> intp(1,0,30)
intvec_6_186:
	.word 0x39400001  ! 345: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfe010  ! 346: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r17
splash_tba_6_187:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 347: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902002  ! 348: WRPR_GL_I	wrpr	%r0, 0x0002, %-
change_to_randtl_6_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_188:
	.word 0x8f902001  ! 349: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	setx 0xca83e3f6a0211806, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_189:
	.word 0x39400001  ! 350: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902000  ! 351: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_190
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_190
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_190:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 352: RDPC	rd	%pc, %r8
	.word 0xe69fe697  ! 353: LDDA_I	ldda	[%r31, + 0x0697] %asi, %r19
	.word 0x87802014  ! 354: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xe647c000  ! 355: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0xe68804a0  ! 356: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
mondo_6_191:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d928009  ! 357: WRPR_WSTATE_R	wrpr	%r10, %r9, %wstate
pmu_6_192:
	nop
	setx 0xfffff6b1fffff59f, %g1, %g7
	.word 0xa3800007  ! 358: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_6_193-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_193:
	.word 0x97a00167  ! 359: FABSq	dis not found

splash_cmpr_6_194:
	setx 0x75859e32ec8730fc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 360: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99540000  ! 361: RDPR_GL	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01961  ! 362: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 363: LDX_R	ldx	[%r31 + %r0], %r13
intveclr_6_196:
	setx 0x3b7ba0c95e05ce5b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 365: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01966  ! 366: FqTOd	dis not found

DS_6_198:
	.word 0x95a209cd  ! 1: FDIVd	fdivd	%f8, %f44, %f10
	.word 0x9959fe59	! Random illegal ?
	.word 0xe3140014  ! 1: LDQF_R	-	[%r16, %r20], %f17
	.word 0x93a2c831  ! 367: FADDs	fadds	%f11, %f17, %f9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01972  ! 368: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.xir_6_200)) -> intp(6,1,3)
xir_6_200:
	.word 0xa981a07b  ! 369: WR_SET_SOFTINT_I	wr	%r6, 0x007b, %set_softint
	.word 0x8780201c  ! 370: WRASI_I	wr	%r0, 0x001c, %asi
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_201
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_201:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 371: RDPC	rd	%pc, %r16
	.word 0x99902004  ! 372: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x87802010  ! 373: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd4d804a0  ! 374: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
change_to_randtl_6_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_202:
	.word 0x8f902000  ! 375: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa9464000  ! 376: RD_STICK_CMPR_REG	rd	%-, %r20
DS_6_203:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 377: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe06ffe9a  ! 378: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffe9a]
	.word 0x93d02032  ! 379: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x87802016  ! 380: WRASI_I	wr	%r0, 0x0016, %asi
splash_cmpr_6_204:
	setx 0x3c31584d01de3ee0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 381: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_6_205:
	.word 0x81982706  ! 382: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0706, %hpstate
splash_cmpr_6_206:
	setx 0xf36995f9d46a3a78, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 383: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97480000  ! 384: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
tagged_6_207:
	taddcctv %r19, 0x19ea, %r12
	.word 0xe407fe9a  ! 385: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r18
	.word 0xa190200d  ! 386: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xe527fe9a  ! 387: STF_I	st	%f18, [0x1e9a, %r31]
splash_cmpr_6_208:
	setx 0xee2dbbcc716056c8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 388: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 389: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_6_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 390: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_6_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_210:
	.word 0x8f902001  ! 391: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe4d004a0  ! 392: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r18
debug_6_211:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 393: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe49ffe9a  ! 394: LDDA_I	ldda	[%r31, + 0xfffffe9a] %asi, %r18
	.word 0xe42ffe9a  ! 395: STB_I	stb	%r18, [%r31 + 0xfffffe9a]
	.word 0xe457fe9a  ! 396: LDSH_I	ldsh	[%r31 + 0xfffffe9a], %r18
DS_6_212:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa5a149c0  ! 1: FDIVd	fdivd	%f36, %f0, %f18
	normalw
	.word 0x91458000  ! 397: RD_SOFTINT_REG	rd	%softint, %r8
tagged_6_213:
	taddcctv %r16, 0x1ba8, %r21
	.word 0xd607fe9a  ! 398: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r11
splash_hpstate_6_214:
	.word 0x81982b06  ! 399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b06, %hpstate
	.word 0xd60fc000  ! 400: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0x8790224c  ! 401: WRPR_TT_I	wrpr	%r0, 0x024c, %tt
splash_tba_6_215:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 402: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a0196a  ! 403: FqTOd	dis not found

debug_6_217:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 404: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd4800a80  ! 405: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r10
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_218:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 406: RDPC	rd	%pc, %r10
	rd %pc, %r19
	add %r19, (ivw_6_219-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_219:
	.word 0x93a00171  ! 407: FABSq	dis not found

splash_htba_6_220:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 408: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
change_to_randtl_6_221:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_221:
	.word 0x8f902002  ! 409: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x87802088  ! 410: WRASI_I	wr	%r0, 0x0088, %asi
splash_cmpr_6_222:
	setx 0xbbd344eef553c9a9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 411: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_6_223:
	nop
	setx 0xfffff6d8fffffa03, %g1, %g7
	.word 0xa3800007  ! 412: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_6_224:
	tsubcctv %r10, 0x199a, %r15
	.word 0xe207fe9a  ! 413: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r17
mondo_6_225:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d928010  ! 414: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
splash_tba_6_226:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 415: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f803c71  ! 416: SIR	sir	0x1c71
splash_cmpr_6_227:
	setx 0x1dafef6c95ce4572, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 417: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1520000  ! 418: RDPR_PIL	<illegal instruction>
debug_6_228:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 419: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0x93d020b3  ! 420: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0xdadfe020  ! 421: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r13
debug_6_229:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 422: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976c618a  ! 423: SDIVX_I	sdivx	%r17, 0x018a, %r11
	.word 0xd08fe000  ! 424: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r8
splash_hpstate_6_231:
	.word 0x819823ae  ! 425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03ae, %hpstate
mondo_6_232:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d914000  ! 426: WRPR_WSTATE_R	wrpr	%r5, %r0, %wstate
	.word 0xd08008a0  ! 427: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd057c000  ! 428: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01969  ! 429: FqTOd	dis not found

	rd %pc, %r19
	add %r19, (ivw_6_234-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_234:
	.word 0x95a0016a  ! 430: FABSq	dis not found

	.word 0xa3540000  ! 431: RDPR_GL	<illegal instruction>
	.word 0x94d478ed  ! 432: UMULcc_I	umulcc 	%r17, 0xfffff8ed, %r10
	.word 0x87802089  ! 433: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_6_235:
	setx 0x0a0a05e36a41f774, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 434: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_6_236:
	.word 0x81982986  ! 435: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0986, %hpstate
	.word 0xd0c004a0  ! 436: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0xa9a489cc  ! 437: FDIVd	fdivd	%f18, %f12, %f20
tagged_6_237:
	taddcctv %r16, 0x178a, %r17
	.word 0xd607f110  ! 438: LDUW_I	lduw	[%r31 + 0xfffff110], %r11
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_238)) -> intp(4,0,19)
intvec_6_238:
	.word 0x39400001  ! 439: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_6_239:
	setx 0x219df2144387df4b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6d80e60  ! 441: LDXA_R	ldxa	[%r0, %r0] 0x73, %r11
splash_cmpr_6_240:
	setx 0x40fa909e8c5ddecc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 442: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01972  ! 443: FqTOd	dis not found

	.word 0xe6d7e010  ! 444: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r19
	.word 0x87802058  ! 445: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01974  ! 446: FqTOd	dis not found

	.word 0x91d02035  ! 447: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_6_243:
	setx 0xa9ebd710b03588b6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902864  ! 449: WRPR_PSTATE_I	wrpr	%r0, 0x0864, %pstate
change_to_randtl_6_244:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_244:
	.word 0x8f902002  ! 450: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	rd %pc, %r19
	add %r19, (ivw_6_245-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_245:
	.word 0x97a00172  ! 451: FABSq	dis not found

debug_6_246:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 452: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x93a2c9d3  ! 453: FDIVd	fdivd	%f42, %f50, %f40
tagged_6_247:
	taddcctv %r25, 0x1533, %r16
	.word 0xd407f110  ! 454: LDUW_I	lduw	[%r31 + 0xfffff110], %r10
	.word 0x87802089  ! 455: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd48008a0  ! 456: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
debug_6_248:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 457: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	setx 0x0b4f149cdd03754c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_249:
	.word 0x39400001  ! 458: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9464000  ! 459: RD_STICK_CMPR_REG	rd	%-, %r20
!$EV trig_pc_d(1, @VA(.MAIN.xir_6_250)) -> intp(6,1,3)
xir_6_250:
	.word 0xa982fa13  ! 460: WR_SET_SOFTINT_I	wr	%r11, 0x1a13, %set_softint
intveclr_6_251:
	setx 0xd4ee4fbedc286521, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 461: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_6_252:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 462: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
mondo_6_253:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d930008  ! 463: WRPR_WSTATE_R	wrpr	%r12, %r8, %wstate
debug_6_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 464: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_255
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_255
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_255:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 465: RDPC	rd	%pc, %r20
change_to_randtl_6_256:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_256:
	.word 0x8f902002  ! 466: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x9f802427  ! 467: SIR	sir	0x0427
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_257:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 468: RDPC	rd	%pc, %r12
debug_6_258:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 469: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
tagged_6_259:
	taddcctv %r12, 0x10b8, %r15
	.word 0xd407f2f6  ! 470: LDUW_I	lduw	[%r31 + 0xfffff2f6], %r10
	.word 0xa553c000  ! 471: RDPR_FQ	<illegal instruction>
	.word 0xd24ff2f6  ! 472: LDSB_I	ldsb	[%r31 + 0xfffff2f6], %r9
	.word 0x8d902004  ! 473: WRPR_PSTATE_I	wrpr	%r0, 0x0004, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9369b799  ! 474: SDIVX_I	sdivx	%r6, 0xfffff799, %r9
splash_cmpr_6_261:
	setx 0xaf0c87a6c4507d04, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 475: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_6_262:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_262:
	.word 0x8f902002  ! 476: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd697e010  ! 477: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0x92faf79c  ! 478: SDIVcc_I	sdivcc 	%r11, 0xfffff79c, %r9
splash_cmpr_6_263:
	setx 0x8d92c6821fb0bcc5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 479: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 480: LDX_R	ldx	[%r31 + %r0], %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 481: LDX_R	ldx	[%r31 + %r0], %r10
mondo_6_264:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d908012  ! 482: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
splash_tba_6_265:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 483: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 484: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x87802055  ! 485: WRASI_I	wr	%r0, 0x0055, %asi
splash_tba_6_266:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 486: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd49fe208  ! 487: LDDA_I	ldda	[%r31, + 0x0208] %asi, %r10
debug_6_267:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 488: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0xa9814010  ! 489: WR_SET_SOFTINT_R	wr	%r5, %r16, %set_softint
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_268
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_268
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_268:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 490: RDPC	rd	%pc, %r19
	.word 0x8d802000  ! 491: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_6_269:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 492: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_6_270:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 493: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	setx 0x26b399b698225854, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_271:
	.word 0x39400001  ! 494: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_6_272:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd330c000  ! 1: STQF_R	-	%f9, [%r0, %r3]
	normalw
	.word 0xa7458000  ! 495: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0xe68008a0  ! 496: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
debug_6_273:
	nop
	mov 8, %r18
	.word 0xd0f00852  ! 497: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 498: LDX_R	ldx	[%r31 + %r0], %r19
tagged_6_274:
	tsubcctv %r13, 0x1c7c, %r21
	.word 0xe607e208  ! 499: LDUW_I	lduw	[%r31 + 0x0208], %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_6_275)) -> intp(6,1,3)
xir_6_275:
	.word 0xa9813679  ! 500: WR_SET_SOFTINT_I	wr	%r4, 0x1679, %set_softint
mondo_6_276:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d948001  ! 501: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
splash_cmpr_6_277:
	setx 0x6464ed2d0862d9c7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 502: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_6_278:
	tsubcctv %r26, 0x18af, %r22
	.word 0xe607f4d4  ! 503: LDUW_I	lduw	[%r31 + 0xfffff4d4], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 504: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xad813365  ! 505: WR_SOFTINT_REG_I	wr	%r4, 0x1365, %softint
	.word 0x87902373  ! 506: WRPR_TT_I	wrpr	%r0, 0x0373, %tt
	.word 0xe677c000  ! 507: STX_R	stx	%r19, [%r31 + %r0]
	rd %pc, %r19
	add %r19, (ivw_6_279-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_279:
	.word 0x91a00174  ! 508: FABSq	dis not found

DS_6_280:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 509: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_6_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_281:
	.word 0x8f902001  ! 510: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_282
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_282
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_282:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 511: RDPC	rd	%pc, %r10
splash_hpstate_6_283:
	.word 0x8198294c  ! 512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094c, %hpstate
mondo_6_284:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d900006  ! 513: WRPR_WSTATE_R	wrpr	%r0, %r6, %wstate
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_285
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_285
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_285:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 514: RDPC	rd	%pc, %r9
	.word 0xe83fec34  ! 515: STD_I	std	%r20, [%r31 + 0x0c34]
debug_6_286:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 516: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_6_287:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_287:
	.word 0x8f902003  ! 517: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x97a0c9c5  ! 518: FDIVd	fdivd	%f34, %f36, %f42
mondo_6_288:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d948009  ! 519: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
mondo_6_289:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d94c003  ! 520: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
change_to_randtl_6_290:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_290:
	.word 0x8f902000  ! 521: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd327c000  ! 522: STF_R	st	%f9, [%r0, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 523: LDX_R	ldx	[%r31 + %r0], %r9
debug_6_291:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 524: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
intveclr_6_292:
	setx 0xf200a6f75fdcd0a6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01972  ! 526: FqTOd	dis not found

mondo_6_294:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d924007  ! 527: WRPR_WSTATE_R	wrpr	%r9, %r7, %wstate
tagged_6_295:
	taddcctv %r23, 0x14c9, %r17
	.word 0xd407ec34  ! 528: LDUW_I	lduw	[%r31 + 0x0c34], %r10
	.word 0x8d802000  ! 529: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8790215b  ! 530: WRPR_TT_I	wrpr	%r0, 0x015b, %tt
	.word 0x93d020b3  ! 531: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0x30800001  ! 532: BA	ba,a	<label_0x1>
	.word 0xd4c804a0  ! 533: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x91d02034  ! 534: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_6_296:
	setx 0x32b602748cef5329, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 535: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01965  ! 536: FqTOd	dis not found

DS_6_298:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe131ff32  ! 1: STQF_I	-	%f16, [0x1f32, %r7]
	normalw
	.word 0x99458000  ! 537: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x93902004  ! 538: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91d02035  ! 539: Tcc_I	ta	icc_or_xcc, %r0 + 53
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 540: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916c364c  ! 541: SDIVX_I	sdivx	%r16, 0xfffff64c, %r8
	.word 0x38800001  ! 542: BGU	bgu,a	<label_0x1>
	.word 0xe6c7e030  ! 543: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r19
splash_lsu_6_300:
	setx 0xbd34661dd0e6361d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 544: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 545: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x93d020b3  ! 546: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0x93902005  ! 547: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 548: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f8039c3  ! 549: SIR	sir	0x19c3
	setx 0x978b60db65bde397, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_301:
	.word 0x39400001  ! 550: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 551: LDX_R	ldx	[%r31 + %r0], %r19
splash_tba_6_302:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 552: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_6_303:
	.word 0x81982026  ! 553: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0026, %hpstate
splash_lsu_6_304:
	setx 0x55f88440092dde33, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 554: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_6_305:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d918013  ! 555: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93692dde  ! 556: SDIVX_I	sdivx	%r4, 0x0dde, %r9
	.word 0x9b500000  ! 557: RDPR_TPC	rdpr	%tpc, %r13
splash_cmpr_6_307:
	setx 0x0564b1d11d4b298a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 558: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_6_308:
	.word 0x8198288e  ! 559: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088e, %hpstate
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_309
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_309
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_309:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 560: RDPC	rd	%pc, %r12
splash_tba_6_310:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 561: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_6_311:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 562: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xdad7e010  ! 563: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r13
debug_6_312:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 564: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0x91480000  ! 565: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
splash_cmpr_6_313:
	setx 0xb07c90d178501f61, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 566: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd66fe176  ! 567: LDSTUB_I	ldstub	%r11, [%r31 + 0x0176]
	.word 0xd6d004a0  ! 568: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0xd697e000  ! 569: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
splash_cmpr_6_314:
	setx 0x379bfb00ac7a8568, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 570: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_315:
	setx 0xb92ac04ac6de2bca, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 571: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd61fe176  ! 572: LDD_I	ldd	[%r31 + 0x0176], %r11
change_to_randtl_6_316:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_316:
	.word 0x8f902001  ! 573: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	rd %pc, %r19
	add %r19, (ivw_6_317-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_317:
	.word 0x95a00161  ! 574: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_6_318-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_318:
	.word 0x93a00171  ! 575: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 576: LDX_R	ldx	[%r31 + %r0], %r9
mondo_6_319:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d92400c  ! 577: WRPR_WSTATE_R	wrpr	%r9, %r12, %wstate
	.word 0x93902003  ! 578: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa5a289c6  ! 579: FDIVd	fdivd	%f10, %f6, %f18
intveclr_6_320:
	setx 0x6e3955dbc3fba4d9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 580: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 581: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe4800b60  ! 582: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r18
	rd %pc, %r19
	add %r19, (ivw_6_321-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_321:
	.word 0x9ba00171  ! 583: FABSq	dis not found

	.word 0xa190200c  ! 584: WRPR_GL_I	wrpr	%r0, 0x000c, %-
intveclr_6_322:
	setx 0x51702ce878be11d4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 585: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_6_323:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 586: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_6_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d900012  ! 587: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
splash_cmpr_6_325:
	setx 0x5e9b227ccb37c0de, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 588: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe29004a0  ! 589: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
	.word 0xe25fe176  ! 590: LDX_I	ldx	[%r31 + 0x0176], %r17
	.word 0x93902007  ! 591: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 592: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 593: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x87902270  ! 594: WRPR_TT_I	wrpr	%r0, 0x0270, %tt
debug_6_326:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 595: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01964  ! 596: FqTOd	dis not found

splash_cmpr_6_328:
	setx 0x21ab145cc066ac19, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 597: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe257c000  ! 598: LDSH_R	ldsh	[%r31 + %r0], %r17
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_329
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_329
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_329:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 599: RDPC	rd	%pc, %r11
	.word 0xe41fc000  ! 600: LDD_R	ldd	[%r31 + %r0], %r18
splash_cmpr_6_330:
	setx 0x8e19018f13530e2d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 601: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 602: LDX_R	ldx	[%r31 + %r0], %r18
mondo_6_331:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d934006  ! 603: WRPR_WSTATE_R	wrpr	%r13, %r6, %wstate
	.word 0x97a409c5  ! 604: FDIVd	fdivd	%f16, %f36, %f42
splash_lsu_6_332:
	setx 0xb81a2f797545d403, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 605: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 606: Tcc_I	ta	icc_or_xcc, %r0 + 51
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_333
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_333
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_333:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 607: RDPC	rd	%pc, %r11
splash_tba_6_334:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 608: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81510000  ! 609: RDPR_TICK	rdpr	%tick, %r0
	.word 0xd057c000  ! 610: LDSH_R	ldsh	[%r31 + %r0], %r8
tagged_6_335:
	taddcctv %r10, 0x1c96, %r17
	.word 0xd007e176  ! 611: LDUW_I	lduw	[%r31 + 0x0176], %r8
	.word 0x93d02033  ! 612: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xa9454000  ! 613: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
intveclr_6_336:
	setx 0x1a79912c788f6994, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 614: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_6_337:
	setx 0x8f8eb8fffad65c11, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 615: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_6_338:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xf55ab833	! Random illegal ?
	.word 0xdb110007  ! 1: LDQF_R	-	[%r4, %r7], %f13
	.word 0xa3a34823  ! 616: FADDs	fadds	%f13, %f3, %f17
mondo_6_339:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d914014  ! 617: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
splash_cmpr_6_340:
	setx 0x899d0cc24dea875e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 618: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 619: Tcc_I	ta	icc_or_xcc, %r0 + 51
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 620: LDX_R	ldx	[%r31 + %r0], %r16
splash_cmpr_6_341:
	setx 0xe33387336019a564, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 621: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0c00e80  ! 622: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r16
	.word 0xe137e176  ! 623: STQF_I	-	%f16, [0x0176, %r31]
change_to_randtl_6_342:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_342:
	.word 0x8f902001  ! 624: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_6_343:
	taddcctv %r3, 0x16fb, %r12
	.word 0xe007e176  ! 625: LDUW_I	lduw	[%r31 + 0x0176], %r16
	.word 0x99a18d34  ! 626: FsMULd	fsmuld	%f6, %f20, %f12
splash_tba_6_344:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 627: WRPR_TBA_R	wrpr	%r0, %r2, %tba
pmu_6_345:
	nop
	setx 0xfffff453fffff306, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196c  ! 629: FqTOd	dis not found

	.word 0xad817291  ! 630: WR_SOFTINT_REG_I	wr	%r5, 0x1291, %softint
	.word 0xd447c000  ! 631: LDSW_R	ldsw	[%r31 + %r0], %r10
	.word 0x93902004  ! 632: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_6_347:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 633: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_348
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_348
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_348:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 634: RDPC	rd	%pc, %r9
DS_6_349:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa5a1c9d0  ! 1: FDIVd	fdivd	%f38, %f16, %f18
	normalw
	.word 0x9b458000  ! 635: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xa1464000  ! 636: RD_STICK_CMPR_REG	rd	%-, %r16
	.word 0xd28008a0  ! 637: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x9b500000  ! 638: RDPR_TPC	<illegal instruction>
tagged_6_350:
	tsubcctv %r14, 0x1e72, %r2
	.word 0xe807fb6a  ! 639: LDUW_I	lduw	[%r31 + 0xfffffb6a], %r20
	.word 0xa190200e  ! 640: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	setx 0x01b9476f4fa676b6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_351:
	.word 0x39400001  ! 641: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_6_352:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 642: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_6_353:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 643: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_354
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_354
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_354:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 644: RDPC	rd	%pc, %r16
	.word 0xda800ae0  ! 645: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r13
	.word 0x93454000  ! 646: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0x93902001  ! 647: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_cmpr_6_355:
	setx 0x0b08ea20814ef200, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 648: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 649: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_6_356:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 650: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd81ffb6a  ! 651: LDD_I	ldd	[%r31 + 0xfffffb6a], %r12
mondo_6_357:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d950011  ! 652: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
	.word 0x87902045  ! 653: WRPR_TT_I	wrpr	%r0, 0x0045, %tt
	.word 0x8790237c  ! 654: WRPR_TT_I	wrpr	%r0, 0x037c, %tt
	.word 0x93480000  ! 655: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x8790237d  ! 656: WRPR_TT_I	wrpr	%r0, 0x037d, %tt
	.word 0x87802014  ! 657: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d802000  ! 658: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802016  ! 659: WRASI_I	wr	%r0, 0x0016, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_358)) -> intp(4,0,25)
intvec_6_358:
	.word 0x39400001  ! 660: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_6_359:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 661: SAVE_R	save	%r31, %r0, %r31
	.word 0x99540000  ! 662: RDPR_GL	rdpr	%-, %r12
debug_6_360:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 663: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
debug_6_361:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 664: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xda1fc000  ! 665: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x91b20ff0  ! 666: FONES	e	%f8
	.word 0xe6800ba0  ! 667: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r19
	.word 0xe6dfe010  ! 668: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r19
	.word 0x87802063  ! 669: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x93902002  ! 670: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
change_to_randtl_6_362:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_362:
	.word 0x8f902000  ! 671: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x91a01a6a  ! 672: FqTOi	fqtoi	
	.word 0xe48fe010  ! 673: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r18
	.word 0xe49004a0  ! 674: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0x8d902b8b  ! 675: WRPR_PSTATE_I	wrpr	%r0, 0x0b8b, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01974  ! 676: FqTOd	dis not found

	.word 0xd89fc020  ! 677: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0x93902000  ! 678: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_6_364:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d930012  ! 679: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
	.word 0xd8900e40  ! 680: LDUHA_R	lduha	[%r0, %r0] 0x72, %r12
mondo_6_365:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d940008  ! 681: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
splash_cmpr_6_366:
	setx 0x95be13de25d003f1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 682: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 683: LDX_R	ldx	[%r31 + %r0], %r12
DS_6_367:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 684: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x87802004  ! 685: WRASI_I	wr	%r0, 0x0004, %asi
intveclr_6_368:
	setx 0x5db1a87cb7501eb4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 686: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196c  ! 687: FqTOd	dis not found

splash_lsu_6_370:
	setx 0xacd54ed5e393337b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 688: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_6_371:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 689: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 690: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x93902000  ! 691: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01972  ! 692: FqTOd	dis not found

	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 693: Tcc_R	te	icc_or_xcc, %r0 + %r30
	setx 0xe6cd9cde3da9639a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_373:
	.word 0x39400001  ! 694: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d804a0  ! 695: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
splash_hpstate_6_374:
	.word 0x8198248e  ! 696: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048e, %hpstate
	.word 0x83d020b2  ! 697: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0xd48fe010  ! 698: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0xa9450000  ! 699: RD_SET_SOFTINT	rd	%set_softint, %r20
change_to_randtl_6_375:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_375:
	.word 0x8f902000  ! 700: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_6_376:
	setx 0x19a99aa6b0c8496e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 701: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_6_377:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_377:
	.word 0x8f902001  ! 702: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_6_378:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_378:
	.word 0x8f902002  ! 703: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_6_379:
	taddcctv %r1, 0x1e9f, %r4
	.word 0xd607fb6a  ! 704: LDUW_I	lduw	[%r31 + 0xfffffb6a], %r11
	.word 0xd6d804a0  ! 705: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956d2d00  ! 706: SDIVX_I	sdivx	%r20, 0x0d00, %r10
	.word 0x87802089  ! 707: WRASI_I	wr	%r0, 0x0089, %asi
change_to_randtl_6_381:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_381:
	.word 0x8f902003  ! 708: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
change_to_randtl_6_382:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_382:
	.word 0x8f902002  ! 709: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 710: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790201b  ! 711: WRPR_TT_I	wrpr	%r0, 0x001b, %tt
	.word 0x8790239b  ! 712: WRPR_TT_I	wrpr	%r0, 0x039b, %tt
debug_6_383:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 713: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4dfe030  ! 714: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
	.word 0x99902001  ! 715: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x93902001  ! 716: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_hpstate_6_384:
	.word 0x81982896  ! 717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0896, %hpstate
splash_tba_6_385:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 718: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_6_386:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 719: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_6_387:
	set 0x003a0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 720: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x97450000  ! 721: RD_SET_SOFTINT	rd	%set_softint, %r11
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 722: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd81ffa75  ! 723: LDD_I	ldd	[%r31 + 0xfffffa75], %r12
	.word 0x8d902a9e  ! 724: WRPR_PSTATE_I	wrpr	%r0, 0x0a9e, %pstate
	.word 0x9192327b  ! 725: WRPR_PIL_I	wrpr	%r8, 0x127b, %pil
mondo_6_388:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d91c012  ! 726: WRPR_WSTATE_R	wrpr	%r7, %r18, %wstate
tagged_6_389:
	taddcctv %r20, 0x1f1e, %r25
	.word 0xd807f31f  ! 727: LDUW_I	lduw	[%r31 + 0xfffff31f], %r12
DS_6_390:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbd630381	! Random illegal ?
	.word 0x91a2c9c4  ! 1: FDIVd	fdivd	%f42, %f4, %f8
	.word 0xa1a00826  ! 728: FADDs	fadds	%f0, %f6, %f16
	.word 0xa1520000  ! 729: RDPR_PIL	<illegal instruction>
	.word 0x2a700001  ! 730: BPCS	<illegal instruction>
splash_cmpr_6_391:
	setx 0xa430d9de52fb11a7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 731: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_392:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 732: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02035  ! 733: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_6_393:
	setx 0xd4148fab9a53c94f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 734: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91693ced  ! 735: SDIVX_I	sdivx	%r4, 0xfffffced, %r8
	rd %pc, %r19
	add %r19, (ivw_6_395-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_395:
	.word 0x99a0016b  ! 736: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01970  ! 737: FqTOd	dis not found

	setx 0xdf73bfdf7021b979, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_397:
	.word 0x39400001  ! 738: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_6_398:
	setx 0x4a40dfcc4d95ef4c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 739: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9b520000  ! 740: RDPR_PIL	rdpr	%pil, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9569e208  ! 741: SDIVX_I	sdivx	%r7, 0x0208, %r10
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_400
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_400
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_400:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 742: RDPC	rd	%pc, %r12
debug_6_401:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 743: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa3540000  ! 744: RDPR_GL	<illegal instruction>
	.word 0x8d802000  ! 745: WRFPRS_I	wr	%r0, 0x0000, %fprs
    set sync_thr_counter1, %r23
    mov 6, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_402
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_402
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_402:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 746: RDPC	rd	%pc, %r16
splash_tba_6_403:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 747: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_6_404:
	setx 0x35aaf17c079444bd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 748: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_6_405:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d94000a  ! 749: WRPR_WSTATE_R	wrpr	%r16, %r10, %wstate
	.word 0x3c800001  ! 750: BPOS	bpos,a	<label_0x1>
DS_6_406:
	.word 0xa9a1c9c4  ! 1: FDIVd	fdivd	%f38, %f4, %f20
	.word 0xbfe7c000  ! 751: SAVE_R	save	%r31, %r0, %r31
mondo_6_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d928013  ! 752: WRPR_WSTATE_R	wrpr	%r10, %r19, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9168bff7  ! 753: SDIVX_I	sdivx	%r2, 0xfffffff7, %r8
	.word 0x9550c000  ! 754: RDPR_TT	rdpr	%tt, %r10
	.word 0x87802058  ! 755: WRASI_I	wr	%r0, 0x0058, %asi
tagged_6_409:
	taddcctv %r1, 0x17ba, %r19
	.word 0xd607e3d0  ! 756: LDUW_I	lduw	[%r31 + 0x03d0], %r11
	.word 0xd6d7e030  ! 757: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
	.word 0x9750c000  ! 758: RDPR_TT	rdpr	%tt, %r11
mondo_6_410:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d914000  ! 759: WRPR_WSTATE_R	wrpr	%r5, %r0, %wstate
splash_lsu_6_411:
	setx 0xf2a1d900ba21e9ed, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 760: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_6_412:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d90c002  ! 761: WRPR_WSTATE_R	wrpr	%r3, %r2, %wstate
	.word 0x99480000  ! 762: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x91540000  ! 763: RDPR_GL	<illegal instruction>
change_to_randtl_6_413:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_413:
	.word 0x8f902003  ! 764: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
mondo_6_414:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d904006  ! 765: WRPR_WSTATE_R	wrpr	%r1, %r6, %wstate
debug_6_415:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 766: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_6_416:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d94c012  ! 767: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	.word 0xe2d7e020  ! 768: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r17
debug_6_417:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 769: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0x87802020  ! 770: WRASI_I	wr	%r0, 0x0020, %asi
splash_cmpr_6_418:
	setx 0xde4c0796deb5c4e0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 771: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02034  ! 772: Tcc_I	ta	icc_or_xcc, %r0 + 52
!$EV trig_pc_d(1, @VA(.MAIN.xir_6_419)) -> intp(6,1,3)
xir_6_419:
	.word 0xa984320f  ! 773: WR_SET_SOFTINT_I	wr	%r16, 0x120f, %set_softint
	.word 0xe20fc000  ! 774: LDUB_R	ldub	[%r31 + %r0], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 775: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_6_420:
	.word 0x819826cf  ! 776: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06cf, %hpstate
	.word 0x91d02033  ! 777: Tcc_I	ta	icc_or_xcc, %r0 + 51
tagged_6_421:
	taddcctv %r5, 0x1351, %r8
	.word 0xe207f180  ! 778: LDUW_I	lduw	[%r31 + 0xfffff180], %r17
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 779: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_6_422:
	setx 0x77a124506c7d24dc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 780: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91500000  ! 781: RDPR_TPC	<illegal instruction>
debug_6_423:
	nop
	mov 8, %r18
	.word 0xe6f00852  ! 782: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
debug_6_424:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 783: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956c2d6c  ! 784: SDIVX_I	sdivx	%r16, 0x0d6c, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96c245d  ! 785: SDIVX_I	sdivx	%r16, 0x045d, %r20
	.word 0xd137c000  ! 786: STQF_R	-	%f8, [%r0, %r31]
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 787: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_6_427:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d918010  ! 788: WRPR_WSTATE_R	wrpr	%r6, %r16, %wstate
donret_6_428:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_428-donret_6_428), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_428:
	.word 0xd0fff5af  ! 789: SWAPA_I	swapa	%r8, [%r31 + 0xfffff5af] %asi
	.word 0xd127c000  ! 790: STF_R	st	%f8, [%r0, %r31]
	.word 0xa145c000  ! 791: RD_TICK_CMPR_REG	rd	%-, %r16
mondo_6_429:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d94c001  ! 792: WRPR_WSTATE_R	wrpr	%r19, %r1, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01964  ! 793: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 794: LDX_R	ldx	[%r31 + %r0], %r11
splash_cmpr_6_431:
	setx 0xbbda76f0f23bd875, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 795: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_432:
	setx 0xd4b84a1ae248ec71, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 796: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 797: BPNE	<illegal instruction>
	.word 0x93902004  ! 798: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_6_433:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 1: LDX_R	ldx	[%r31 + %r0], %r17
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_0
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_0:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 2: RDPC	rd	%pc, %r18
	.word 0xd28fe030  ! 3: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r9
	.word 0x91d020b5  ! 4: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_cmpr_5_1:
	setx 0x37099a201d6a841a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 5: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 6: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01970  ! 7: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 8: LDX_R	ldx	[%r31 + %r0], %r17
debug_5_3:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 9: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	.word 0xe2d00e40  ! 10: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r17
	.word 0x87902077  ! 11: WRPR_TT_I	wrpr	%r0, 0x0077, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa769bf22  ! 12: SDIVX_I	sdivx	%r6, 0xffffff22, %r19
debug_5_5:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 13: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_5_6:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 14: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
splash_cmpr_5_7:
	setx 0x18e508e86c027df7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 15: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956965d3  ! 16: SDIVX_I	sdivx	%r5, 0x05d3, %r10
splash_cmpr_5_9:
	setx 0xe52192436f2e8399, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 17: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902328  ! 18: WRPR_TT_I	wrpr	%r0, 0x0328, %tt
change_to_randtl_5_10:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_10:
	.word 0x8f902001  ! 19: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
donret_5_11:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_11-donret_5_11), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_11:
	.word 0xe2ffe750  ! 20: SWAPA_I	swapa	%r17, [%r31 + 0x0750] %asi
change_to_randtl_5_12:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_12:
	.word 0x8f902002  ! 21: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_5_13:
	taddcctv %r23, 0x1ad0, %r9
	.word 0xe207e750  ! 22: LDUW_I	lduw	[%r31 + 0x0750], %r17
	.word 0x22700001  ! 23: BPE	<illegal instruction>
	.word 0x9745c000  ! 24: RD_TICK_CMPR_REG	rd	%-, %r11
mondo_5_14:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d91000c  ! 25: WRPR_WSTATE_R	wrpr	%r4, %r12, %wstate
	.word 0x83d02033  ! 26: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x87802016  ! 27: WRASI_I	wr	%r0, 0x0016, %asi
intveclr_5_15:
	setx 0x5cf0b363654fa7ae, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8cfe020  ! 29: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
	.word 0xa1902009  ! 30: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_lsu_5_16:
	setx 0x06974e740e1d321b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 31: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902000  ! 32: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_5_17:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d90c014  ! 33: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 34: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_5_18:
	.word 0x81982b14  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b14, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 36: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa7480000  ! 37: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
splash_lsu_5_19:
	setx 0xaa6405f60195ef67, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 38: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 39: RD_STICK_REG	stbar
	.word 0x81510000  ! 40: RDPR_TICK	rdpr	%tick, %r0
tagged_5_20:
	tsubcctv %r15, 0x1f5d, %r20
	.word 0xd807e750  ! 41: LDUW_I	lduw	[%r31 + 0x0750], %r12
splash_lsu_5_21:
	setx 0xa18e8dd7c61ceddb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 42: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_5_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d918011  ! 43: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
	.word 0xa190200d  ! 44: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x96490003  ! 45: MULX_R	mulx 	%r4, %r3, %r11
	.word 0x99450000  ! 46: RD_SET_SOFTINT	rd	%set_softint, %r12
intveclr_5_23:
	setx 0xc34a707175ef7a03, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 47: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_24)) -> intp(6,0,9)
intvec_5_24:
	.word 0x39400001  ! 48: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902247  ! 49: WRPR_TT_I	wrpr	%r0, 0x0247, %tt
debug_5_25:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 50: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_5_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d94800b  ! 51: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
	.word 0x87902092  ! 52: WRPR_TT_I	wrpr	%r0, 0x0092, %tt
	.word 0x9ba309cb  ! 53: FDIVd	fdivd	%f12, %f42, %f44
splash_hpstate_5_27:
	.word 0x81982765  ! 54: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0765, %hpstate
	.word 0x8780204f  ! 55: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x91d02035  ! 56: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x3e700001  ! 57: BPVC	<illegal instruction>
	.word 0xe60fc000  ! 58: LDUB_R	ldub	[%r31 + %r0], %r19
	rd %pc, %r19
	add %r19, (ivw_5_28-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_28:
	.word 0x99a00163  ! 59: FABSq	dis not found

	.word 0xd48fe020  ! 60: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	.word 0xd4c7e000  ! 61: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r10
DS_5_29:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 62: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
splash_tba_5_30:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 63: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_5_31:
	setx 0x625a86b2016ecd1b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 64: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_32:
	setx 0x92125d149103fcc5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 65: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_5_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d94c007  ! 66: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
debug_5_34:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 67: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_5_35:
	.word 0x81982555  ! 68: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0555, %hpstate
intveclr_5_36:
	setx 0x2275e231596f72d6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9037a0  ! 70: WRPR_PSTATE_I	wrpr	%r0, 0x17a0, %pstate
splash_cmpr_5_37:
	setx 0x90ee9acb1ce2bd88, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 71: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_5_38:
	nop
	setx 0xfffff267fffff9b5, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_5_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d934006  ! 73: WRPR_WSTATE_R	wrpr	%r13, %r6, %wstate
	rd %pc, %r19
	add %r19, (ivw_5_40-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_40:
	.word 0xa1a00167  ! 74: FABSq	dis not found

pmu_5_41:
	nop
	setx 0xfffff421fffff703, %g1, %g7
	.word 0xa3800007  ! 75: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd02fe750  ! 76: STB_I	stb	%r8, [%r31 + 0x0750]
splash_cmpr_5_42:
	setx 0x232f6fd0dfebaf30, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 77: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3c700001  ! 78: BPPOS	<illegal instruction>
debug_5_43:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 79: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_5_44:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 80: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd08008a0  ! 81: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	rd %pc, %r19
	add %r19, (ivw_5_45-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_45:
	.word 0x95a00168  ! 82: FABSq	dis not found

splash_lsu_5_46:
	setx 0xab25a8acde888bb3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 83: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_5_47:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_47:
	.word 0x8f902002  ! 84: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 85: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802080  ! 86: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x91933cf5  ! 87: WRPR_PIL_I	wrpr	%r12, 0x1cf5, %pil
	.word 0xd69004a0  ! 88: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0xa1902006  ! 89: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd6c004a0  ! 90: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
mondo_5_48:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d908014  ! 91: WRPR_WSTATE_R	wrpr	%r2, %r20, %wstate
splash_cmpr_5_49:
	setx 0xa9f7a663df85f20c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 92: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 93: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8780204f  ! 94: WRASI_I	wr	%r0, 0x004f, %asi
mondo_5_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d904009  ! 95: WRPR_WSTATE_R	wrpr	%r1, %r9, %wstate
	.word 0xd6dfe010  ! 96: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
	.word 0x93902004  ! 97: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
change_to_randtl_5_51:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_51:
	.word 0x8f902003  ! 98: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
change_to_randtl_5_52:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_52:
	.word 0x8f902001  ! 99: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d903965  ! 100: WRPR_PSTATE_I	wrpr	%r0, 0x1965, %pstate
	.word 0x91d020b4  ! 101: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xd73fc000  ! 102: STDF_R	std	%f11, [%r0, %r31]
	.word 0xa981c009  ! 103: WR_SET_SOFTINT_R	wr	%r7, %r9, %set_softint
	.word 0xa1902002  ! 104: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x879020d9  ! 105: WRPR_TT_I	wrpr	%r0, 0x00d9, %tt
debug_5_53:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 106: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_5_54-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_54:
	.word 0xa1a00173  ! 107: FABSq	dis not found

splash_lsu_5_55:
	setx 0x91b756635c33d7dd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 108: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 109: SIAM	siam	1
debug_5_56:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 110: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_5_57:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_57-donret_5_57), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_57:
	.word 0xd8fff234  ! 111: SWAPA_I	swapa	%r12, [%r31 + 0xfffff234] %asi
DS_5_58:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xeb6c4ad3	! Random illegal ?
	.word 0x91a00553  ! 1: FSQRTd	fsqrt	
	.word 0x95a2882b  ! 112: FADDs	fadds	%f10, %f11, %f10
splash_tba_5_59:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 113: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x95a409e2  ! 114: FDIVq	dis not found

	.word 0xd4d004a0  ! 115: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 116: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3683264  ! 117: SDIVX_I	sdivx	%r0, 0xfffff264, %r17
intveclr_5_61:
	setx 0x032e5dd138ddbc70, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 118: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 119: SIAM	siam	1
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 120: LDX_R	ldx	[%r31 + %r0], %r13
tagged_5_62:
	tsubcctv %r14, 0x1ad4, %r12
	.word 0xda07e1f9  ! 121: LDUW_I	lduw	[%r31 + 0x01f9], %r13
	.word 0xda57c000  ! 122: LDSH_R	ldsh	[%r31 + %r0], %r13
tagged_5_63:
	taddcctv %r19, 0x1c93, %r10
	.word 0xda07e1f9  ! 123: LDUW_I	lduw	[%r31 + 0x01f9], %r13
	.word 0xdac004a0  ! 124: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
donret_5_64:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_64-donret_5_64), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_64:
	.word 0xdaffe1f9  ! 125: SWAPA_I	swapa	%r13, [%r31 + 0x01f9] %asi
	.word 0xdacfe010  ! 126: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r13
mondo_5_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d914007  ! 127: WRPR_WSTATE_R	wrpr	%r5, %r7, %wstate
splash_cmpr_5_66:
	setx 0xcadffc9dbc78f536, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 128: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_5_67:
	.word 0x819820dc  ! 129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00dc, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_5_68)) -> intp(5,1,3)
xir_5_68:
	.word 0xa982fcfd  ! 130: WR_SET_SOFTINT_I	wr	%r11, 0x1cfd, %set_softint
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01961  ! 131: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_70)) -> intp(2,0,11)
intvec_5_70:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 133: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x93d02032  ! 134: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xd4800bc0  ! 135: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r10
debug_5_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 136: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_5_72:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_72-donret_5_72), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_72:
	.word 0xd4fff312  ! 137: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
splash_lsu_5_73:
	setx 0xa2c989dcb7c07a31, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 138: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_5_74:
	setx 0x4eb76a74b1715af9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 139: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b5  ! 140: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0x91a01a6d  ! 141: FqTOi	fqtoi	
tagged_5_75:
	taddcctv %r5, 0x1310, %r22
	.word 0xe207f312  ! 142: LDUW_I	lduw	[%r31 + 0xfffff312], %r17
splash_hpstate_5_76:
	.word 0x81982454  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0454, %hpstate
	.word 0x95454000  ! 144: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
splash_htba_5_77:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 145: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_5_78:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 146: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_5_79:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 147: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_80)) -> intp(1,0,12)
intvec_5_80:
	.word 0x39400001  ! 148: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_5_81:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 149: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_5_82:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_82:
	.word 0x8f902002  ! 150: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_5_83:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 151: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02032  ! 152: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d90373d  ! 153: WRPR_PSTATE_I	wrpr	%r0, 0x173d, %pstate
	.word 0x9150c000  ! 154: RDPR_TT	<illegal instruction>
DS_5_84:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 155: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_5_85:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 156: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802014  ! 157: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x91d020b2  ! 158: Tcc_I	ta	icc_or_xcc, %r0 + 178
intveclr_5_86:
	setx 0xc5817f8770dab002, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 159: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_5_87:
	taddcctv %r25, 0x1386, %r10
	.word 0xe607f312  ! 160: LDUW_I	lduw	[%r31 + 0xfffff312], %r19
mondo_5_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d924013  ! 161: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
splash_tba_5_89:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 162: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_5_90:
	.word 0x81982c05  ! 163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c05, %hpstate
splash_cmpr_5_91:
	setx 0x68495e224bb8af61, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 164: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe71fc000  ! 165: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x93902007  ! 166: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_5_92:
	.word 0x9ba109c7  ! 1: FDIVd	fdivd	%f4, %f38, %f44
	.word 0xab7b9159	! Random illegal ?
	.word 0x99a00543  ! 1: FSQRTd	fsqrt	
	.word 0x95a40834  ! 167: FADDs	fadds	%f16, %f20, %f10
	.word 0xa1902004  ! 168: WRPR_GL_I	wrpr	%r0, 0x0004, %-
donret_5_93:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_93-donret_5_93), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_93:
	.word 0xd4fff312  ! 169: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
	.word 0x93902006  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
donret_5_94:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_94-donret_5_94), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_94:
	.word 0xd4fff312  ! 171: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
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
	.word 0x91414000  ! 172: RDPC	rd	%pc, %r8
	.word 0xd0dfe010  ! 173: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r8
	.word 0xa1902007  ! 174: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xd127c000  ! 175: STF_R	st	%f8, [%r0, %r31]
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 176: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_5_96:
	setx 0x3028e1890b97c8ff, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 177: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903f68  ! 178: WRPR_PSTATE_I	wrpr	%r0, 0x1f68, %pstate
	.word 0xa3480000  ! 179: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xd28008a0  ! 180: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x83d02035  ! 181: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x81510000  ! 182: RDPR_TICK	rdpr	%tick, %r0
mondo_5_97:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d930001  ! 183: WRPR_WSTATE_R	wrpr	%r12, %r1, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_98)) -> intp(1,0,12)
intvec_5_98:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_5_99:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_99:
	.word 0x8f902000  ! 185: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902000  ! 186: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 187: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_5_100:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_100:
	.word 0x8f902002  ! 188: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d802000  ! 189: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_5_101:
	setx 0x2b27df8ff894bb13, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 190: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01972  ! 191: FqTOd	dis not found

	setx 0x0e9156dc5ac3b8de, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_103:
	.word 0x39400001  ! 192: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0880e80  ! 193: LDUBA_R	lduba	[%r0, %r0] 0x74, %r8
mondo_5_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d948005  ! 194: WRPR_WSTATE_R	wrpr	%r18, %r5, %wstate
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 195: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd0900e80  ! 196: LDUHA_R	lduha	[%r0, %r0] 0x74, %r8
	.word 0xd06ff312  ! 197: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff312]
change_to_randtl_5_105:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_105:
	.word 0x8f902002  ! 198: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_5_106:
	setx 0xb588bcdb8f14d822, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 199: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780204f  ! 200: WRASI_I	wr	%r0, 0x004f, %asi
	rd %pc, %r19
	add %r19, (ivw_5_107-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_107:
	.word 0x93a00171  ! 201: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9969f422  ! 202: SDIVX_I	sdivx	%r7, 0xfffff422, %r12
	.word 0xd6d00e40  ! 203: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r11
splash_hpstate_5_109:
	.word 0x81982317  ! 204: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0317, %hpstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 205: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_5_110:
	.word 0x9ba149d4  ! 1: FDIVd	fdivd	%f36, %f20, %f44
	.word 0xbfe7c000  ! 206: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_5_111:
	setx 0xeb59ddca6e1bd8d3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 208: LDX_R	ldx	[%r31 + %r0], %r11
splash_tba_5_112:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 209: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_5_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 210: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd727c000  ! 211: STF_R	st	%f11, [%r0, %r31]
	.word 0xa983400a  ! 212: WR_SET_SOFTINT_R	wr	%r13, %r10, %set_softint
mondo_5_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d91c00a  ! 213: WRPR_WSTATE_R	wrpr	%r7, %r10, %wstate
mondo_5_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d94c011  ! 214: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a0196c  ! 215: FqTOd	dis not found

	.word 0xa2f90014  ! 216: SDIVcc_R	sdivcc 	%r4, %r20, %r17
	.word 0xa1902000  ! 217: WRPR_GL_I	wrpr	%r0, 0x0000, %-
mondo_5_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d904013  ! 218: WRPR_WSTATE_R	wrpr	%r1, %r19, %wstate
	.word 0xe4800b80  ! 219: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r18
	.word 0xe4bfc020  ! 220: STDA_R	stda	%r18, [%r31 + %r0] 0x01
tagged_5_118:
	tsubcctv %r10, 0x1a40, %r9
	.word 0xe407f661  ! 221: LDUW_I	lduw	[%r31 + 0xfffff661], %r18
	.word 0x8790228d  ! 222: WRPR_TT_I	wrpr	%r0, 0x028d, %tt
	.word 0xe4d7e010  ! 223: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r18
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
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
	.word 0x95414000  ! 224: RDPC	rd	%pc, %r10
	rd %pc, %r19
	add %r19, (ivw_5_120-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_120:
	.word 0x91a00161  ! 225: FABSq	dis not found

donret_5_121:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_121-donret_5_121), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_121:
	.word 0xd2fff661  ! 226: SWAPA_I	swapa	%r9, [%r31 + 0xfffff661] %asi
	.word 0xa9808007  ! 227: WR_SET_SOFTINT_R	wr	%r2, %r7, %set_softint
	.word 0x9a49000d  ! 228: MULX_R	mulx 	%r4, %r13, %r13
splash_lsu_5_122:
	setx 0x24d2cbfd12ffc58f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 229: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x36e375f5ac10eb47, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_123:
	.word 0x39400001  ! 230: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe21ff661  ! 231: LDD_I	ldd	[%r31 + 0xfffff661], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 232: LDX_R	ldx	[%r31 + %r0], %r17
DS_5_124:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 233: SAVE_R	save	%r31, %r0, %r31
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 234: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_5_125:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 235: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_126)) -> intp(5,0,19)
intvec_5_126:
	.word 0x39400001  ! 236: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_5_127:
	setx 0xf37a1d740afae0fd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_5_128-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_128:
	.word 0x91a00174  ! 238: FABSq	dis not found

	.word 0xd69ff661  ! 239: LDDA_I	ldda	[%r31, + 0xfffff661] %asi, %r11
DS_5_129:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd532400d  ! 1: STQF_R	-	%f10, [%r13, %r9]
	normalw
	.word 0x9b458000  ! 240: RD_SOFTINT_REG	rd	%softint, %r13
splash_lsu_5_130:
	setx 0x7fea29f860df3941, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 241: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2c804a0  ! 242: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
splash_tba_5_131:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 243: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200c  ! 244: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xe2d004a0  ! 245: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0xe2d004a0  ! 246: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0xa9520000  ! 247: RDPR_PIL	rdpr	%pil, %r20
tagged_5_132:
	tsubcctv %r22, 0x1e9f, %r25
	.word 0xe607f661  ! 248: LDUW_I	lduw	[%r31 + 0xfffff661], %r19
debug_5_133:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 249: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe727c000  ! 250: STF_R	st	%f19, [%r0, %r31]
splash_lsu_5_134:
	setx 0xfe3105446ce293a1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 251: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x32800001  ! 252: BNE	bne,a	<label_0x1>
	.word 0xe6d80e80  ! 253: LDXA_R	ldxa	[%r0, %r0] 0x74, %r19
	.word 0xe66ff661  ! 254: LDSTUB_I	ldstub	%r19, [%r31 + 0xfffff661]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196b  ! 255: FqTOd	dis not found

	.word 0x8d902928  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x0928, %pstate
splash_hpstate_5_136:
	.word 0x81982c44  ! 257: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c44, %hpstate
	.word 0x93a18dd1  ! 258: FdMULq	fdmulq	
	.word 0x93902000  ! 259: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_5_137:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d900005  ! 260: WRPR_WSTATE_R	wrpr	%r0, %r5, %wstate
	.word 0xe2900e80  ! 261: LDUHA_R	lduha	[%r0, %r0] 0x74, %r17
mondo_5_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d904013  ! 262: WRPR_WSTATE_R	wrpr	%r1, %r19, %wstate
	.word 0x87802055  ! 263: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x8780201c  ! 264: WRASI_I	wr	%r0, 0x001c, %asi
mondo_5_139:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d914005  ! 265: WRPR_WSTATE_R	wrpr	%r5, %r5, %wstate
mondo_5_140:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d944000  ! 266: WRPR_WSTATE_R	wrpr	%r17, %r0, %wstate
debug_5_141:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 267: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	.word 0x8d903d29  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x1d29, %pstate
debug_5_142:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 269: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab81c014  ! 270: WR_CLEAR_SOFTINT_R	wr	%r7, %r20, %clear_softint
debug_5_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 271: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1902007  ! 272: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 273: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a0196a  ! 274: FqTOd	dis not found

tagged_5_145:
	taddcctv %r9, 0x193b, %r5
	.word 0xd407f661  ! 275: LDUW_I	lduw	[%r31 + 0xfffff661], %r10
splash_cmpr_5_146:
	setx 0x9c721ccf25e3d5c8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 276: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902e44  ! 277: WRPR_PSTATE_I	wrpr	%r0, 0x0e44, %pstate
splash_tba_5_147:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 278: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_5_148:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 279: RESTORE_R	restore	%r31, %r0, %r31
mondo_5_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d914002  ! 280: WRPR_WSTATE_R	wrpr	%r5, %r2, %wstate
splash_lsu_5_150:
	setx 0x8525f675de967581, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 281: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879020e4  ! 282: WRPR_TT_I	wrpr	%r0, 0x00e4, %tt
	setx 0x8fccabe50a3ba7c6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_151:
	.word 0x39400001  ! 283: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd40ff661  ! 284: LDUB_I	ldub	[%r31 + 0xfffff661], %r10
mondo_5_152:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d924001  ! 285: WRPR_WSTATE_R	wrpr	%r9, %r1, %wstate
	.word 0x8d903c4d  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x1c4d, %pstate
splash_tba_5_153:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 287: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879023ca  ! 288: WRPR_TT_I	wrpr	%r0, 0x03ca, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956b37f0  ! 289: SDIVX_I	sdivx	%r12, 0xfffff7f0, %r10
splash_tba_5_155:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 290: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_5_156:
	setx 0x9de85cf4708e7639, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 291: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01961  ! 292: FqTOd	dis not found

splash_lsu_5_158:
	setx 0x4259698783267223, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 293: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 294: RD_STICK_REG	stbar
splash_cmpr_5_159:
	setx 0x283d09736a278efe, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_160:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 296: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d9026c6  ! 297: WRPR_PSTATE_I	wrpr	%r0, 0x06c6, %pstate
	.word 0x90fcb112  ! 298: SDIVcc_I	sdivcc 	%r18, 0xfffff112, %r8
	.word 0xa9828012  ! 299: WR_SET_SOFTINT_R	wr	%r10, %r18, %set_softint
	.word 0xd0880e40  ! 300: LDUBA_R	lduba	[%r0, %r0] 0x72, %r8
	setx 0x5f30cc62c8b53352, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_161:
	.word 0x39400001  ! 301: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0d804a0  ! 302: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_162)) -> intp(4,0,5)
intvec_5_162:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_5_163:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d94c013  ! 304: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	.word 0xab81c00b  ! 305: WR_CLEAR_SOFTINT_R	wr	%r7, %r11, %clear_softint
	.word 0xa1902007  ! 306: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 307: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01970  ! 308: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a0196c  ! 309: FqTOd	dis not found

	.word 0x87802004  ! 310: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802063  ! 311: WRASI_I	wr	%r0, 0x0063, %asi
mondo_5_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d948011  ! 312: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
pmu_5_167:
	nop
	setx 0xfffff704fffff08e, %g1, %g7
	.word 0xa3800007  ! 313: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_5_168:
	setx 0xaf3643e352c83cf7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 314: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879023d3  ! 315: WRPR_TT_I	wrpr	%r0, 0x03d3, %tt
	.word 0x919126a4  ! 316: WRPR_PIL_I	wrpr	%r4, 0x06a4, %pil
tagged_5_169:
	taddcctv %r2, 0x182b, %r3
	.word 0xd607ee91  ! 317: LDUW_I	lduw	[%r31 + 0x0e91], %r11
	.word 0x97a2c9c4  ! 318: FDIVd	fdivd	%f42, %f4, %f42
	.word 0xd06fee91  ! 319: LDSTUB_I	ldstub	%r8, [%r31 + 0x0e91]
	.word 0xd06fee91  ! 320: LDSTUB_I	ldstub	%r8, [%r31 + 0x0e91]
splash_tba_5_170:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 321: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa0c33955  ! 322: ADDCcc_I	addccc 	%r12, 0xfffff955, %r16
splash_cmpr_5_171:
	setx 0x49a7063675c76363, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 323: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780201c  ! 324: WRASI_I	wr	%r0, 0x001c, %asi
	rd %pc, %r19
	add %r19, (ivw_5_172-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_172:
	.word 0x93a00167  ! 325: FABSq	dis not found

	.word 0x93902003  ! 326: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_5_173:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 327: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_5_174:
	.word 0x81982e5d  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5d, %hpstate
splash_tba_5_175:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 329: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_176:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 330: RDPC	rd	%pc, %r8
tagged_5_177:
	taddcctv %r10, 0x1a16, %r20
	.word 0xda07e697  ! 331: LDUW_I	lduw	[%r31 + 0x0697], %r13
	.word 0xda1fc000  ! 332: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x964c0011  ! 333: MULX_R	mulx 	%r16, %r17, %r11
	.word 0xe2dfe000  ! 334: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r17
change_to_randtl_5_178:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_178:
	.word 0x8f902000  ! 335: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_5_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 336: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_5_180:
	setx 0xfc5d210edbf99419, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902000  ! 338: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_5_181:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d940013  ! 339: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
donret_5_182:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_182-donret_5_182), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_182:
	.word 0xe2ffe697  ! 340: SWAPA_I	swapa	%r17, [%r31 + 0x0697] %asi
	.word 0xe26fe697  ! 341: LDSTUB_I	ldstub	%r17, [%r31 + 0x0697]
intveclr_5_183:
	setx 0xd7bcd47b8fe2cc83, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 342: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_5_184:
	.word 0x81982fc4  ! 343: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc4, %hpstate
intveclr_5_185:
	setx 0x63468dd6832ead08, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_186)) -> intp(1,0,21)
intvec_5_186:
	.word 0x39400001  ! 345: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfe000  ! 346: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r17
splash_tba_5_187:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 347: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200e  ! 348: WRPR_GL_I	wrpr	%r0, 0x000e, %-
change_to_randtl_5_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_188:
	.word 0x8f902000  ! 349: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	setx 0xe7d6b921418c56eb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_189:
	.word 0x39400001  ! 350: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 351: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_190
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_190
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_190:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 352: RDPC	rd	%pc, %r13
	.word 0xe69fe697  ! 353: LDDA_I	ldda	[%r31, + 0x0697] %asi, %r19
	.word 0x87802055  ! 354: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xe647c000  ! 355: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0xe6880e80  ! 356: LDUBA_R	lduba	[%r0, %r0] 0x74, %r19
mondo_5_191:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d948002  ! 357: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
pmu_5_192:
	nop
	setx 0xfffffe3bfffff2ae, %g1, %g7
	.word 0xa3800007  ! 358: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_5_193-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_193:
	.word 0x91a0016a  ! 359: FABSq	dis not found

splash_cmpr_5_194:
	setx 0x1c96fdcb67abd29a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 360: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95540000  ! 361: RDPR_GL	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01971  ! 362: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 363: LDX_R	ldx	[%r31 + %r0], %r13
intveclr_5_196:
	setx 0x08f9045332b2e1b2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 365: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01973  ! 366: FqTOd	dis not found

DS_5_198:
	.word 0x99a509c5  ! 1: FDIVd	fdivd	%f20, %f36, %f12
	.word 0x914c4e84	! Random illegal ?
	.word 0xd313000d  ! 1: LDQF_R	-	[%r12, %r13], %f9
	.word 0xa9a44825  ! 367: FADDs	fadds	%f17, %f5, %f20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01971  ! 368: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.xir_5_200)) -> intp(5,1,3)
xir_5_200:
	.word 0xa981f8e8  ! 369: WR_SET_SOFTINT_I	wr	%r7, 0x18e8, %set_softint
	.word 0x8780204f  ! 370: WRASI_I	wr	%r0, 0x004f, %asi
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_201
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_201:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 371: RDPC	rd	%pc, %r12
	.word 0x99902003  ! 372: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x87802014  ! 373: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd4d804a0  ! 374: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
change_to_randtl_5_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_202:
	.word 0x8f902001  ! 375: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93464000  ! 376: RD_STICK_CMPR_REG	rd	%-, %r9
DS_5_203:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 377: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe06ffe9a  ! 378: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffe9a]
	.word 0x91d020b4  ! 379: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x87802010  ! 380: WRASI_I	wr	%r0, 0x0010, %asi
splash_cmpr_5_204:
	setx 0xcf09c43389cef3f1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 381: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_5_205:
	.word 0x81982745  ! 382: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0745, %hpstate
splash_cmpr_5_206:
	setx 0xcd680709ded30c3e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 383: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9b480000  ! 384: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
tagged_5_207:
	taddcctv %r10, 0x187c, %r15
	.word 0xe407fe9a  ! 385: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r18
	.word 0xa1902007  ! 386: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xe527fe9a  ! 387: STF_I	st	%f18, [0x1e9a, %r31]
splash_cmpr_5_208:
	setx 0x31682a25b8db226c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 388: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 389: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_5_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 390: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_5_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_210:
	.word 0x8f902000  ! 391: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe4d00e80  ! 392: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r18
debug_5_211:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 393: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe49ffe9a  ! 394: LDDA_I	ldda	[%r31, + 0xfffffe9a] %asi, %r18
	.word 0xe42ffe9a  ! 395: STB_I	stb	%r18, [%r31 + 0xfffffe9a]
	.word 0xe457fe9a  ! 396: LDSH_I	ldsh	[%r31 + 0xfffffe9a], %r18
DS_5_212:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9ba089c3  ! 1: FDIVd	fdivd	%f2, %f34, %f44
	normalw
	.word 0x91458000  ! 397: RD_SOFTINT_REG	rd	%softint, %r8
tagged_5_213:
	taddcctv %r16, 0x1288, %r22
	.word 0xd607fe9a  ! 398: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r11
splash_hpstate_5_214:
	.word 0x81982e87  ! 399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e87, %hpstate
	.word 0xd60fc000  ! 400: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0x879021a7  ! 401: WRPR_TT_I	wrpr	%r0, 0x01a7, %tt
splash_tba_5_215:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 402: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01965  ! 403: FqTOd	dis not found

debug_5_217:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 404: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd48008a0  ! 405: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_218:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 406: RDPC	rd	%pc, %r17
	rd %pc, %r19
	add %r19, (ivw_5_219-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_219:
	.word 0x95a00174  ! 407: FABSq	dis not found

splash_htba_5_220:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 408: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
change_to_randtl_5_221:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_221:
	.word 0x8f902000  ! 409: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x87802010  ! 410: WRASI_I	wr	%r0, 0x0010, %asi
splash_cmpr_5_222:
	setx 0x18276d84694e46db, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 411: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_5_223:
	nop
	setx 0xfffffce8fffffa6c, %g1, %g7
	.word 0xa3800007  ! 412: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_5_224:
	tsubcctv %r26, 0x166f, %r18
	.word 0xe207fe9a  ! 413: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r17
mondo_5_225:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d924005  ! 414: WRPR_WSTATE_R	wrpr	%r9, %r5, %wstate
splash_tba_5_226:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 415: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f80297e  ! 416: SIR	sir	0x097e
splash_cmpr_5_227:
	setx 0xe6c451644181715d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 417: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93520000  ! 418: RDPR_PIL	<illegal instruction>
debug_5_228:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 419: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	.word 0x91d02033  ! 420: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xdadfe010  ! 421: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
debug_5_229:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 422: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96d27fa  ! 423: SDIVX_I	sdivx	%r20, 0x07fa, %r20
	.word 0xd08fe020  ! 424: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r8
splash_hpstate_5_231:
	.word 0x819825a7  ! 425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05a7, %hpstate
mondo_5_232:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d928011  ! 426: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
	.word 0xd08008a0  ! 427: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd057c000  ! 428: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01965  ! 429: FqTOd	dis not found

	rd %pc, %r19
	add %r19, (ivw_5_234-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_234:
	.word 0x91a00168  ! 430: FABSq	dis not found

	.word 0x91540000  ! 431: RDPR_GL	<illegal instruction>
	.word 0xa0d53922  ! 432: UMULcc_I	umulcc 	%r20, 0xfffff922, %r16
	.word 0x87802020  ! 433: WRASI_I	wr	%r0, 0x0020, %asi
splash_cmpr_5_235:
	setx 0xf038803aa85e11b4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 434: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_5_236:
	.word 0x8198248e  ! 435: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048e, %hpstate
	.word 0xd0c00e60  ! 436: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r8
	.word 0xa7a449cb  ! 437: FDIVd	fdivd	%f48, %f42, %f50
tagged_5_237:
	taddcctv %r7, 0x16a9, %r24
	.word 0xd607f110  ! 438: LDUW_I	lduw	[%r31 + 0xfffff110], %r11
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_238)) -> intp(0,0,19)
intvec_5_238:
	.word 0x39400001  ! 439: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_5_239:
	setx 0x00c678f5578f245c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6d804a0  ! 441: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
splash_cmpr_5_240:
	setx 0xd3b6b3586e358b09, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 442: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01972  ! 443: FqTOd	dis not found

	.word 0xe6d7e020  ! 444: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r19
	.word 0x87802014  ! 445: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01972  ! 446: FqTOd	dis not found

	.word 0x93d02034  ! 447: Tcc_I	tne	icc_or_xcc, %r0 + 52
splash_cmpr_5_243:
	setx 0x7a120dea62e942da, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9033c3  ! 449: WRPR_PSTATE_I	wrpr	%r0, 0x13c3, %pstate
change_to_randtl_5_244:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_244:
	.word 0x8f902000  ! 450: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	rd %pc, %r19
	add %r19, (ivw_5_245-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_245:
	.word 0x99a00164  ! 451: FABSq	dis not found

debug_5_246:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 452: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x9ba109c9  ! 453: FDIVd	fdivd	%f4, %f40, %f44
tagged_5_247:
	taddcctv %r8, 0x1738, %r25
	.word 0xd407f110  ! 454: LDUW_I	lduw	[%r31 + 0xfffff110], %r10
	.word 0x87802080  ! 455: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd48008a0  ! 456: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
debug_5_248:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 457: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	setx 0xa434c92576309aa4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_249:
	.word 0x39400001  ! 458: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9464000  ! 459: RD_STICK_CMPR_REG	rd	%-, %r20
!$EV trig_pc_d(1, @VA(.MAIN.xir_5_250)) -> intp(5,1,3)
xir_5_250:
	.word 0xa982352d  ! 460: WR_SET_SOFTINT_I	wr	%r8, 0x152d, %set_softint
intveclr_5_251:
	setx 0xd560c07095a27d0a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 461: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_5_252:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 462: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
mondo_5_253:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d948000  ! 463: WRPR_WSTATE_R	wrpr	%r18, %r0, %wstate
debug_5_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 464: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_255
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_255
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_255:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 465: RDPC	rd	%pc, %r13
change_to_randtl_5_256:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_256:
	.word 0x8f902000  ! 466: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9f802017  ! 467: SIR	sir	0x0017
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_257:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 468: RDPC	rd	%pc, %r13
debug_5_258:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 469: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
tagged_5_259:
	taddcctv %r6, 0x18e1, %r15
	.word 0xd407f2f6  ! 470: LDUW_I	lduw	[%r31 + 0xfffff2f6], %r10
	.word 0x9353c000  ! 471: RDPR_FQ	<illegal instruction>
	.word 0xd24ff2f6  ! 472: LDSB_I	ldsb	[%r31 + 0xfffff2f6], %r9
	.word 0x8d903aed  ! 473: WRPR_PSTATE_I	wrpr	%r0, 0x1aed, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9692280  ! 474: SDIVX_I	sdivx	%r4, 0x0280, %r20
splash_cmpr_5_261:
	setx 0x0d7652fea257070f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 475: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_5_262:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_262:
	.word 0x8f902002  ! 476: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd697e010  ! 477: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0xa0f8fa84  ! 478: SDIVcc_I	sdivcc 	%r3, 0xfffffa84, %r16
splash_cmpr_5_263:
	setx 0xc3da607f34efc880, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 479: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 480: LDX_R	ldx	[%r31 + %r0], %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 481: LDX_R	ldx	[%r31 + %r0], %r10
mondo_5_264:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d90c013  ! 482: WRPR_WSTATE_R	wrpr	%r3, %r19, %wstate
splash_tba_5_265:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 483: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 484: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8780201c  ! 485: WRASI_I	wr	%r0, 0x001c, %asi
splash_tba_5_266:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 486: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd49fe208  ! 487: LDDA_I	ldda	[%r31, + 0x0208] %asi, %r10
debug_5_267:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 488: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0xa9840013  ! 489: WR_SET_SOFTINT_R	wr	%r16, %r19, %set_softint
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_268
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_268
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_268:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 490: RDPC	rd	%pc, %r10
	.word 0x8d802000  ! 491: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_5_269:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 492: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_5_270:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 493: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	setx 0x2f8293aaaa878c29, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_271:
	.word 0x39400001  ! 494: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_5_272:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd9304000  ! 1: STQF_R	-	%f12, [%r0, %r1]
	normalw
	.word 0x99458000  ! 495: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xe6800b60  ! 496: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r19
debug_5_273:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 497: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 498: LDX_R	ldx	[%r31 + %r0], %r19
tagged_5_274:
	tsubcctv %r1, 0x13c4, %r12
	.word 0xe607e208  ! 499: LDUW_I	lduw	[%r31 + 0x0208], %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_5_275)) -> intp(5,1,3)
xir_5_275:
	.word 0xa981e34a  ! 500: WR_SET_SOFTINT_I	wr	%r7, 0x034a, %set_softint
mondo_5_276:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d944008  ! 501: WRPR_WSTATE_R	wrpr	%r17, %r8, %wstate
splash_cmpr_5_277:
	setx 0x8815c6c111fa9133, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 502: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_5_278:
	tsubcctv %r21, 0x1bd6, %r16
	.word 0xe607f4d4  ! 503: LDUW_I	lduw	[%r31 + 0xfffff4d4], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 504: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xad81f537  ! 505: WR_SOFTINT_REG_I	wr	%r7, 0x1537, %softint
	.word 0x87902299  ! 506: WRPR_TT_I	wrpr	%r0, 0x0299, %tt
	.word 0xe677c000  ! 507: STX_R	stx	%r19, [%r31 + %r0]
	rd %pc, %r19
	add %r19, (ivw_5_279-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_279:
	.word 0x97a00174  ! 508: FABSq	dis not found

DS_5_280:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 509: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_5_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_281:
	.word 0x8f902001  ! 510: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_282
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_282
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_282:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 511: RDPC	rd	%pc, %r16
splash_hpstate_5_283:
	.word 0x81982b06  ! 512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b06, %hpstate
mondo_5_284:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d92c00a  ! 513: WRPR_WSTATE_R	wrpr	%r11, %r10, %wstate
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_285
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_285
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_285:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 514: RDPC	rd	%pc, %r11
	.word 0xe83fec34  ! 515: STD_I	std	%r20, [%r31 + 0x0c34]
debug_5_286:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 516: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_5_287:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_287:
	.word 0x8f902003  ! 517: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa3a209ca  ! 518: FDIVd	fdivd	%f8, %f10, %f48
mondo_5_288:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d908012  ! 519: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
mondo_5_289:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d90c002  ! 520: WRPR_WSTATE_R	wrpr	%r3, %r2, %wstate
change_to_randtl_5_290:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_290:
	.word 0x8f902001  ! 521: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd327c000  ! 522: STF_R	st	%f9, [%r0, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 523: LDX_R	ldx	[%r31 + %r0], %r9
debug_5_291:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 524: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
intveclr_5_292:
	setx 0xc4b9a766fcbe00f7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01962  ! 526: FqTOd	dis not found

mondo_5_294:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d94c007  ! 527: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
tagged_5_295:
	taddcctv %r5, 0x1e23, %r21
	.word 0xd407ec34  ! 528: LDUW_I	lduw	[%r31 + 0x0c34], %r10
	.word 0x8d802000  ! 529: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879022f7  ! 530: WRPR_TT_I	wrpr	%r0, 0x02f7, %tt
	.word 0x91d02033  ! 531: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x30800001  ! 532: BA	ba,a	<label_0x1>
	.word 0xd4c804a0  ! 533: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x91d02033  ! 534: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_cmpr_5_296:
	setx 0xb15ed1a601351682, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 535: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01969  ! 536: FqTOd	dis not found

DS_5_298:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd534a4ff  ! 1: STQF_I	-	%f10, [0x04ff, %r18]
	normalw
	.word 0xa3458000  ! 537: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x93902005  ! 538: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x91d020b5  ! 539: Tcc_I	ta	icc_or_xcc, %r0 + 181
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 540: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996c67b4  ! 541: SDIVX_I	sdivx	%r17, 0x07b4, %r12
	.word 0x38800001  ! 542: BGU	bgu,a	<label_0x1>
	.word 0xe6c7e030  ! 543: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r19
splash_lsu_5_300:
	setx 0x11ff5c4d0b6827c3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 544: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 545: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91d020b5  ! 546: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x93902000  ! 547: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 548: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f8028e7  ! 549: SIR	sir	0x08e7
	setx 0x563bffa340890579, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_301:
	.word 0x39400001  ! 550: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 551: LDX_R	ldx	[%r31 + %r0], %r19
splash_tba_5_302:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 552: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_5_303:
	.word 0x81982995  ! 553: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0995, %hpstate
splash_lsu_5_304:
	setx 0xbe090a79daefc429, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 554: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_5_305:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d90c010  ! 555: WRPR_WSTATE_R	wrpr	%r3, %r16, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956c77ae  ! 556: SDIVX_I	sdivx	%r17, 0xfffff7ae, %r10
	.word 0x95500000  ! 557: RDPR_TPC	rdpr	%tpc, %r10
splash_cmpr_5_307:
	setx 0x0440f152d6bffcdb, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 558: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_5_308:
	.word 0x81982cd7  ! 559: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd7, %hpstate
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_309
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_309
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_309:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 560: RDPC	rd	%pc, %r17
splash_tba_5_310:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 561: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_5_311:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 562: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xdad7e000  ! 563: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
debug_5_312:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 564: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0x95480000  ! 565: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
splash_cmpr_5_313:
	setx 0xdfefabc7ff8c6fca, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 566: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd66fe176  ! 567: LDSTUB_I	ldstub	%r11, [%r31 + 0x0176]
	.word 0xd6d004a0  ! 568: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0xd697e000  ! 569: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
splash_cmpr_5_314:
	setx 0x74137984b25749bf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 570: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_315:
	setx 0x3f94f9c8e2464b92, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 571: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd61fe176  ! 572: LDD_I	ldd	[%r31 + 0x0176], %r11
change_to_randtl_5_316:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_316:
	.word 0x8f902001  ! 573: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	rd %pc, %r19
	add %r19, (ivw_5_317-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_317:
	.word 0x91a00174  ! 574: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_5_318-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_318:
	.word 0x99a00168  ! 575: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 576: LDX_R	ldx	[%r31 + %r0], %r9
mondo_5_319:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d90c014  ! 577: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
	.word 0x93902002  ! 578: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93a249c3  ! 579: FDIVd	fdivd	%f40, %f34, %f40
intveclr_5_320:
	setx 0xdb62b636a1939ce4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 580: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 581: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe4800b60  ! 582: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r18
	rd %pc, %r19
	add %r19, (ivw_5_321-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_321:
	.word 0x95a00165  ! 583: FABSq	dis not found

	.word 0xa1902008  ! 584: WRPR_GL_I	wrpr	%r0, 0x0008, %-
intveclr_5_322:
	setx 0xfa7ca4813e834c8d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 585: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_5_323:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 586: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_5_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d924012  ! 587: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
splash_cmpr_5_325:
	setx 0x43bdea823e7eaa9d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 588: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe29004a0  ! 589: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
	.word 0xe25fe176  ! 590: LDX_I	ldx	[%r31 + 0x0176], %r17
	.word 0x93902002  ! 591: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 592: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 593: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8790210f  ! 594: WRPR_TT_I	wrpr	%r0, 0x010f, %tt
debug_5_326:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 595: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01967  ! 596: FqTOd	dis not found

splash_cmpr_5_328:
	setx 0x6ec8471d506b8bd8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 597: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe257c000  ! 598: LDSH_R	ldsh	[%r31 + %r0], %r17
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_329
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_329
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_329:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 599: RDPC	rd	%pc, %r16
	.word 0xe41fc000  ! 600: LDD_R	ldd	[%r31 + %r0], %r18
splash_cmpr_5_330:
	setx 0x60ffa4dff20db27f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 601: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 602: LDX_R	ldx	[%r31 + %r0], %r18
mondo_5_331:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d94400d  ! 603: WRPR_WSTATE_R	wrpr	%r17, %r13, %wstate
	.word 0x93a289d1  ! 604: FDIVd	fdivd	%f10, %f48, %f40
splash_lsu_5_332:
	setx 0xec76dad9d2766a2b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 605: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d02033  ! 606: Tcc_I	tne	icc_or_xcc, %r0 + 51
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_333
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_333
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_333:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 607: RDPC	rd	%pc, %r12
splash_tba_5_334:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 608: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81510000  ! 609: RDPR_TICK	rdpr	%tick, %r0
	.word 0xd057c000  ! 610: LDSH_R	ldsh	[%r31 + %r0], %r8
tagged_5_335:
	taddcctv %r22, 0x1992, %r10
	.word 0xd007e176  ! 611: LDUW_I	lduw	[%r31 + 0x0176], %r8
	.word 0x91d020b3  ! 612: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xa9454000  ! 613: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
intveclr_5_336:
	setx 0x8a7d6f22fc84df70, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 614: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_5_337:
	setx 0x1b015f8c88d920f5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 615: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_5_338:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd559f493	! Random illegal ?
	.word 0xd5104005  ! 1: LDQF_R	-	[%r1, %r5], %f10
	.word 0xa9a14831  ! 616: FADDs	fadds	%f5, %f17, %f20
mondo_5_339:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d91c011  ! 617: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
splash_cmpr_5_340:
	setx 0x17b2f49fb59e7770, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 618: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02035  ! 619: Tcc_I	tne	icc_or_xcc, %r0 + 53
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 620: LDX_R	ldx	[%r31 + %r0], %r16
splash_cmpr_5_341:
	setx 0xe816a69f595c69e1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 621: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0c004a0  ! 622: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
	.word 0xe137e176  ! 623: STQF_I	-	%f16, [0x0176, %r31]
change_to_randtl_5_342:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_342:
	.word 0x8f902002  ! 624: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_5_343:
	taddcctv %r21, 0x1f84, %r6
	.word 0xe007e176  ! 625: LDUW_I	lduw	[%r31 + 0x0176], %r16
	.word 0x99a50d25  ! 626: FsMULd	fsmuld	%f20, %f36, %f12
splash_tba_5_344:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 627: WRPR_TBA_R	wrpr	%r0, %r2, %tba
pmu_5_345:
	nop
	setx 0xfffffd01fffff7b6, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01965  ! 629: FqTOd	dis not found

	.word 0xad84e31b  ! 630: WR_SOFTINT_REG_I	wr	%r19, 0x031b, %softint
	.word 0xd447c000  ! 631: LDSW_R	ldsw	[%r31 + %r0], %r10
	.word 0x93902006  ! 632: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_5_347:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 633: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_348
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_348
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_348:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 634: RDPC	rd	%pc, %r11
DS_5_349:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x95a049c6  ! 1: FDIVd	fdivd	%f32, %f6, %f10
	normalw
	.word 0x9b458000  ! 635: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xa3464000  ! 636: RD_STICK_CMPR_REG	rd	%-, %r17
	.word 0xd28008a0  ! 637: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x97500000  ! 638: RDPR_TPC	<illegal instruction>
tagged_5_350:
	tsubcctv %r17, 0x1948, %r2
	.word 0xe807fb6a  ! 639: LDUW_I	lduw	[%r31 + 0xfffffb6a], %r20
	.word 0xa190200f  ! 640: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	setx 0x35c0aa8ebae41490, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_351:
	.word 0x39400001  ! 641: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_5_352:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 642: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_5_353:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 643: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_354
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_354
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_354:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 644: RDPC	rd	%pc, %r9
	.word 0xda8008a0  ! 645: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x91454000  ! 646: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0x93902000  ! 647: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_cmpr_5_355:
	setx 0xfacd13ac31735e9c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 648: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b5  ! 649: Tcc_I	ta	icc_or_xcc, %r0 + 181
debug_5_356:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 650: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd81ffb6a  ! 651: LDD_I	ldd	[%r31 + 0xfffffb6a], %r12
mondo_5_357:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d914008  ! 652: WRPR_WSTATE_R	wrpr	%r5, %r8, %wstate
	.word 0x879021ec  ! 653: WRPR_TT_I	wrpr	%r0, 0x01ec, %tt
	.word 0x87902094  ! 654: WRPR_TT_I	wrpr	%r0, 0x0094, %tt
	.word 0x99480000  ! 655: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x879023d7  ! 656: WRPR_TT_I	wrpr	%r0, 0x03d7, %tt
	.word 0x87802010  ! 657: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d802000  ! 658: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802058  ! 659: WRASI_I	wr	%r0, 0x0058, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_358)) -> intp(5,0,5)
intvec_5_358:
	.word 0x39400001  ! 660: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_5_359:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 661: SAVE_R	save	%r31, %r0, %r31
	.word 0xa5540000  ! 662: RDPR_GL	rdpr	%-, %r18
debug_5_360:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 663: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
debug_5_361:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 664: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xda1fc000  ! 665: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x93b0cfe6  ! 666: FONES	e	%f9
	.word 0xe68008a0  ! 667: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe6dfe010  ! 668: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r19
	.word 0x8780204f  ! 669: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x93902001  ! 670: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_randtl_5_362:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_362:
	.word 0x8f902000  ! 671: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9ba01a72  ! 672: FqTOi	fqtoi	
	.word 0xe48fe020  ! 673: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r18
	.word 0xe49004a0  ! 674: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0x8d902759  ! 675: WRPR_PSTATE_I	wrpr	%r0, 0x0759, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01967  ! 676: FqTOd	dis not found

	.word 0xd89fc020  ! 677: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0x93902001  ! 678: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
mondo_5_364:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d940009  ! 679: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
	.word 0xd8900e60  ! 680: LDUHA_R	lduha	[%r0, %r0] 0x73, %r12
mondo_5_365:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d94c014  ! 681: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
splash_cmpr_5_366:
	setx 0x5ad0328368794fe5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 682: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 683: LDX_R	ldx	[%r31 + %r0], %r12
DS_5_367:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 684: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x87802020  ! 685: WRASI_I	wr	%r0, 0x0020, %asi
intveclr_5_368:
	setx 0x52729a0a8e7696ff, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 686: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196b  ! 687: FqTOd	dis not found

splash_lsu_5_370:
	setx 0x5523f22eb06d9dcb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 688: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_5_371:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 689: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 690: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x93902003  ! 691: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a0196b  ! 692: FqTOd	dis not found

	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 693: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0xe4f09f311e86fafe, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_373:
	.word 0x39400001  ! 694: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d80e60  ! 695: LDXA_R	ldxa	[%r0, %r0] 0x73, %r10
splash_hpstate_5_374:
	.word 0x81982f1c  ! 696: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1c, %hpstate
	.word 0x83d020b2  ! 697: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0xd48fe030  ! 698: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
	.word 0x99450000  ! 699: RD_SET_SOFTINT	rd	%set_softint, %r12
change_to_randtl_5_375:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_375:
	.word 0x8f902000  ! 700: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_5_376:
	setx 0x8e38d2aaa49cd83a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 701: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_5_377:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_377:
	.word 0x8f902000  ! 702: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_5_378:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_378:
	.word 0x8f902000  ! 703: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_5_379:
	taddcctv %r23, 0x1a63, %r9
	.word 0xd607fb6a  ! 704: LDUW_I	lduw	[%r31 + 0xfffffb6a], %r11
	.word 0xd6d804a0  ! 705: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956cf1ad  ! 706: SDIVX_I	sdivx	%r19, 0xfffff1ad, %r10
	.word 0x87802016  ! 707: WRASI_I	wr	%r0, 0x0016, %asi
change_to_randtl_5_381:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_381:
	.word 0x8f902001  ! 708: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_5_382:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_382:
	.word 0x8f902001  ! 709: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 710: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879020eb  ! 711: WRPR_TT_I	wrpr	%r0, 0x00eb, %tt
	.word 0x8790211d  ! 712: WRPR_TT_I	wrpr	%r0, 0x011d, %tt
debug_5_383:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 713: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4dfe000  ! 714: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	.word 0x99902004  ! 715: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x93902005  ! 716: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_hpstate_5_384:
	.word 0x819825bf  ! 717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05bf, %hpstate
splash_tba_5_385:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 718: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_5_386:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 719: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_5_387:
	set 0x003b0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 720: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa5450000  ! 721: RD_SET_SOFTINT	rd	%set_softint, %r18
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 722: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd81ffa75  ! 723: LDD_I	ldd	[%r31 + 0xfffffa75], %r12
	.word 0x8d903286  ! 724: WRPR_PSTATE_I	wrpr	%r0, 0x1286, %pstate
	.word 0x9190e30f  ! 725: WRPR_PIL_I	wrpr	%r3, 0x030f, %pil
mondo_5_388:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d904010  ! 726: WRPR_WSTATE_R	wrpr	%r1, %r16, %wstate
tagged_5_389:
	taddcctv %r4, 0x145a, %r24
	.word 0xd807f31f  ! 727: LDUW_I	lduw	[%r31 + 0xfffff31f], %r12
DS_5_390:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x9b734aaa	! Random illegal ?
	.word 0x93a149c6  ! 1: FDIVd	fdivd	%f36, %f6, %f40
	.word 0x95a18828  ! 728: FADDs	fadds	%f6, %f8, %f10
	.word 0x95520000  ! 729: RDPR_PIL	<illegal instruction>
	.word 0x2a700001  ! 730: BPCS	<illegal instruction>
splash_cmpr_5_391:
	setx 0x0274e10777737397, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 731: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_392:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 732: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93d02033  ! 733: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_cmpr_5_393:
	setx 0x4442aacecca277ea, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 734: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976b24a5  ! 735: SDIVX_I	sdivx	%r12, 0x04a5, %r11
	rd %pc, %r19
	add %r19, (ivw_5_395-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_395:
	.word 0x91a00162  ! 736: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01968  ! 737: FqTOd	dis not found

	setx 0x465e59a77e94e2ce, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_397:
	.word 0x39400001  ! 738: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_5_398:
	setx 0x4f5c4df8d7f37561, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 739: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7520000  ! 740: RDPR_PIL	rdpr	%pil, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976cf17d  ! 741: SDIVX_I	sdivx	%r19, 0xfffff17d, %r11
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_400
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_400
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_400:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 742: RDPC	rd	%pc, %r9
debug_5_401:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 743: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9b540000  ! 744: RDPR_GL	<illegal instruction>
	.word 0x8d802000  ! 745: WRFPRS_I	wr	%r0, 0x0000, %fprs
    set sync_thr_counter1, %r23
    mov 5, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_402
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_402
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_402:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 746: RDPC	rd	%pc, %r19
splash_tba_5_403:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 747: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_5_404:
	setx 0xe1c82b30d919dfd3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 748: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_5_405:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d934001  ! 749: WRPR_WSTATE_R	wrpr	%r13, %r1, %wstate
	.word 0x3c800001  ! 750: BPOS	bpos,a	<label_0x1>
DS_5_406:
	.word 0x99a049c2  ! 1: FDIVd	fdivd	%f32, %f2, %f12
	.word 0xbfe7c000  ! 751: SAVE_R	save	%r31, %r0, %r31
mondo_5_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d91400b  ! 752: WRPR_WSTATE_R	wrpr	%r5, %r11, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916a7aaf  ! 753: SDIVX_I	sdivx	%r9, 0xfffffaaf, %r8
	.word 0x9950c000  ! 754: RDPR_TT	rdpr	%tt, %r12
	.word 0x87802004  ! 755: WRASI_I	wr	%r0, 0x0004, %asi
tagged_5_409:
	taddcctv %r13, 0x1b89, %r18
	.word 0xd607e3d0  ! 756: LDUW_I	lduw	[%r31 + 0x03d0], %r11
	.word 0xd6d7e030  ! 757: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
	.word 0xa950c000  ! 758: RDPR_TT	rdpr	%tt, %r20
mondo_5_410:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d914002  ! 759: WRPR_WSTATE_R	wrpr	%r5, %r2, %wstate
splash_lsu_5_411:
	setx 0xe5251418a199af85, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 760: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_5_412:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d94800c  ! 761: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
	.word 0x97480000  ! 762: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0x93540000  ! 763: RDPR_GL	<illegal instruction>
change_to_randtl_5_413:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_413:
	.word 0x8f902001  ! 764: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_5_414:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d904012  ! 765: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
debug_5_415:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 766: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_5_416:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d910002  ! 767: WRPR_WSTATE_R	wrpr	%r4, %r2, %wstate
	.word 0xe2d7e000  ! 768: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r17
debug_5_417:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 769: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0x87802088  ! 770: WRASI_I	wr	%r0, 0x0088, %asi
splash_cmpr_5_418:
	setx 0x058a10a3e3c9169f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 771: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b2  ! 772: Tcc_I	ta	icc_or_xcc, %r0 + 178
!$EV trig_pc_d(1, @VA(.MAIN.xir_5_419)) -> intp(5,1,3)
xir_5_419:
	.word 0xa981bf60  ! 773: WR_SET_SOFTINT_I	wr	%r6, 0x1f60, %set_softint
	.word 0xe20fc000  ! 774: LDUB_R	ldub	[%r31 + %r0], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 775: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_5_420:
	.word 0x819820a7  ! 776: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00a7, %hpstate
	.word 0x83d02034  ! 777: Tcc_I	te	icc_or_xcc, %r0 + 52
tagged_5_421:
	taddcctv %r26, 0x1fa6, %r15
	.word 0xe207f180  ! 778: LDUW_I	lduw	[%r31 + 0xfffff180], %r17
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 779: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_5_422:
	setx 0x8c7ec0b632ed65da, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 780: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95500000  ! 781: RDPR_TPC	<illegal instruction>
debug_5_423:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 782: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
debug_5_424:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 783: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa369f87b  ! 784: SDIVX_I	sdivx	%r7, 0xfffff87b, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa569a3d3  ! 785: SDIVX_I	sdivx	%r6, 0x03d3, %r18
	.word 0xd137c000  ! 786: STQF_R	-	%f8, [%r0, %r31]
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 787: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_5_427:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d92c009  ! 788: WRPR_WSTATE_R	wrpr	%r11, %r9, %wstate
donret_5_428:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_428-donret_5_428), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_428:
	.word 0xd0fff5af  ! 789: SWAPA_I	swapa	%r8, [%r31 + 0xfffff5af] %asi
	.word 0xd127c000  ! 790: STF_R	st	%f8, [%r0, %r31]
	.word 0x9145c000  ! 791: RD_TICK_CMPR_REG	rd	%-, %r8
mondo_5_429:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d944005  ! 792: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01970  ! 793: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 794: LDX_R	ldx	[%r31 + %r0], %r11
splash_cmpr_5_431:
	setx 0xbc1d3145d0da46a0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 795: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_432:
	setx 0x6b2df11908abfdd7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 796: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 797: BPNE	<illegal instruction>
	.word 0x93902001  ! 798: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
debug_5_433:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 1: LDX_R	ldx	[%r31 + %r0], %r17
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_0
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_0:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 2: RDPC	rd	%pc, %r13
	.word 0xd28fe020  ! 3: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r9
	.word 0x91d02034  ! 4: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_4_1:
	setx 0x91fa48c3a7f0381e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 5: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 6: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01962  ! 7: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 8: LDX_R	ldx	[%r31 + %r0], %r17
debug_4_3:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_3:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_3
    nop
debug_wait4_3:
    ld [%r23], %r2
    brnz %r2, debug_wait4_3
    nop
    ba,a debug_startwait4_3
continue_debug_4_3:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_3:
    cmp %r13, %r15
    bne,a wait_for_stat_4_3
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_3:
    cmp %r14, %r15
    bne,a wait_for_debug_4_3
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %16, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00852  ! 9: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0xe2d004a0  ! 10: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0x8790208f  ! 11: WRPR_TT_I	wrpr	%r0, 0x008f, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996a7349  ! 12: SDIVX_I	sdivx	%r9, 0xfffff349, %r12
debug_4_5:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 13: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_4_6:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_6:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_6
    nop
debug_wait4_6:
    ld [%r23], %r2
    brnz %r2, debug_wait4_6
    nop
    ba,a debug_startwait4_6
continue_debug_4_6:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_6:
    cmp %r13, %r15
    bne,a wait_for_stat_4_6
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_6:
    cmp %r14, %r15
    bne,a wait_for_debug_4_6
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00852  ! 14: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
splash_cmpr_4_7:
	setx 0x5f1019081c93aa1e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 15: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b68b08d  ! 16: SDIVX_I	sdivx	%r2, 0xfffff08d, %r13
splash_cmpr_4_9:
	setx 0xb4d04918f9e17cf0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 17: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879021b1  ! 18: WRPR_TT_I	wrpr	%r0, 0x01b1, %tt
change_to_randtl_4_10:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_10:
	.word 0x8f902002  ! 19: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
donret_4_11:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_11-donret_4_11), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_11:
	.word 0xe2ffe750  ! 20: SWAPA_I	swapa	%r17, [%r31 + 0x0750] %asi
change_to_randtl_4_12:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_12:
	.word 0x8f902000  ! 21: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_4_13:
	taddcctv %r24, 0x1f39, %r17
	.word 0xe207e750  ! 22: LDUW_I	lduw	[%r31 + 0x0750], %r17
	.word 0x22700001  ! 23: BPE	<illegal instruction>
	.word 0x9745c000  ! 24: RD_TICK_CMPR_REG	rd	%-, %r11
mondo_4_14:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d914004  ! 25: WRPR_WSTATE_R	wrpr	%r5, %r4, %wstate
	.word 0x91d02034  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87802080  ! 27: WRASI_I	wr	%r0, 0x0080, %asi
intveclr_4_15:
	setx 0xa6e26543264e8037, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8cfe030  ! 29: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r12
	.word 0xa1902000  ! 30: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_lsu_4_16:
	setx 0x5bb5775183e3370d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 31: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 32: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
mondo_4_17:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d948004  ! 33: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 34: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_4_18:
	.word 0x819820fc  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00fc, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 36: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x95480000  ! 37: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
splash_lsu_4_19:
	setx 0x13565bec8d868be1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 38: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 39: RD_STICK_REG	stbar
	.word 0x81510000  ! 40: RDPR_TICK	rdpr	%tick, %r0
tagged_4_20:
	tsubcctv %r5, 0x1669, %r18
	.word 0xd807e750  ! 41: LDUW_I	lduw	[%r31 + 0x0750], %r12
splash_lsu_4_21:
	setx 0x533c7806d3513a39, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 42: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d90c009  ! 43: WRPR_WSTATE_R	wrpr	%r3, %r9, %wstate
	.word 0xa1902006  ! 44: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa2488006  ! 45: MULX_R	mulx 	%r2, %r6, %r17
	.word 0x93450000  ! 46: RD_SET_SOFTINT	rd	%set_softint, %r9
intveclr_4_23:
	setx 0xdd407baabe54d0d4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 47: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_24)) -> intp(4,0,24)
intvec_4_24:
	.word 0x39400001  ! 48: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879020b3  ! 49: WRPR_TT_I	wrpr	%r0, 0x00b3, %tt
debug_4_25:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 50: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_4_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d924008  ! 51: WRPR_WSTATE_R	wrpr	%r9, %r8, %wstate
	.word 0x8790219c  ! 52: WRPR_TT_I	wrpr	%r0, 0x019c, %tt
	.word 0xa5a489d3  ! 53: FDIVd	fdivd	%f18, %f50, %f18
splash_hpstate_4_27:
	.word 0x8198200c  ! 54: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000c, %hpstate
	.word 0x87802014  ! 55: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x91d02032  ! 56: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x3e700001  ! 57: BPVC	<illegal instruction>
	.word 0xe60fc000  ! 58: LDUB_R	ldub	[%r31 + %r0], %r19
	rd %pc, %r19
	add %r19, (ivw_4_28-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_28:
	.word 0x93a00169  ! 59: FABSq	dis not found

	.word 0xd48fe020  ! 60: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	.word 0xd4c7e010  ! 61: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
DS_4_29:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 62: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
splash_tba_4_30:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 63: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_4_31:
	setx 0x4c6cebb06244f022, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 64: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_32:
	setx 0x1e812c2f180eb977, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 65: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d930000  ! 66: WRPR_WSTATE_R	wrpr	%r12, %r0, %wstate
debug_4_34:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 67: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_4_35:
	.word 0x819824cd  ! 68: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cd, %hpstate
intveclr_4_36:
	setx 0xaf37de7231d5c803, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9031c7  ! 70: WRPR_PSTATE_I	wrpr	%r0, 0x11c7, %pstate
splash_cmpr_4_37:
	setx 0x22867743e6187763, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 71: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_4_38:
	nop
	setx 0xfffffa41fffffac6, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_4_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d92c00c  ! 73: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
	rd %pc, %r19
	add %r19, (ivw_4_40-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_40:
	.word 0x9ba00170  ! 74: FABSq	dis not found

pmu_4_41:
	nop
	setx 0xfffff7c9fffff6da, %g1, %g7
	.word 0xa3800007  ! 75: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd02fe750  ! 76: STB_I	stb	%r8, [%r31 + 0x0750]
splash_cmpr_4_42:
	setx 0x39dca008dab5f070, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 77: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3c700001  ! 78: BPPOS	<illegal instruction>
debug_4_43:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 79: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_4_44:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 80: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd08008a0  ! 81: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	rd %pc, %r19
	add %r19, (ivw_4_45-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_45:
	.word 0x93a00160  ! 82: FABSq	dis not found

splash_lsu_4_46:
	setx 0x8a2e7bae3b8d30d1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 83: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_4_47:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_47:
	.word 0x8f902001  ! 84: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 85: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802014  ! 86: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x9190b773  ! 87: WRPR_PIL_I	wrpr	%r2, 0x1773, %pil
	.word 0xd69004a0  ! 88: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0xa1902002  ! 89: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd6c004a0  ! 90: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
mondo_4_48:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d914012  ! 91: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
splash_cmpr_4_49:
	setx 0xdddda4d900573d69, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 92: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02033  ! 93: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x87802058  ! 94: WRASI_I	wr	%r0, 0x0058, %asi
mondo_4_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d924012  ! 95: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
	.word 0xd6dfe020  ! 96: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r11
	.word 0x93902007  ! 97: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
change_to_randtl_4_51:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_51:
	.word 0x8f902000  ! 98: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_4_52:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_52:
	.word 0x8f902000  ! 99: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d903947  ! 100: WRPR_PSTATE_I	wrpr	%r0, 0x1947, %pstate
	.word 0x83d02032  ! 101: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xd73fc000  ! 102: STDF_R	std	%f11, [%r0, %r31]
	.word 0xa9804011  ! 103: WR_SET_SOFTINT_R	wr	%r1, %r17, %set_softint
	.word 0xa1902007  ! 104: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8790230f  ! 105: WRPR_TT_I	wrpr	%r0, 0x030f, %tt
debug_4_53:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 106: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_4_54-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_54:
	.word 0x97a00169  ! 107: FABSq	dis not found

splash_lsu_4_55:
	setx 0xb281a501cd8fa58f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 108: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 109: SIAM	siam	1
debug_4_56:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 110: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_4_57:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_57-donret_4_57), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_57:
	.word 0xd8fff234  ! 111: SWAPA_I	swapa	%r12, [%r31 + 0xfffff234] %asi
DS_4_58:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe96d4360	! Random illegal ?
	.word 0xa5a00551  ! 1: FSQRTd	fsqrt	
	.word 0x97a2c829  ! 112: FADDs	fadds	%f11, %f9, %f11
splash_tba_4_59:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 113: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91a089e2  ! 114: FDIVq	dis not found

	.word 0xd4d004a0  ! 115: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 116: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36972bf  ! 117: SDIVX_I	sdivx	%r5, 0xfffff2bf, %r17
intveclr_4_61:
	setx 0x9de9369ff8d19564, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 118: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 119: SIAM	siam	1
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 120: LDX_R	ldx	[%r31 + %r0], %r13
tagged_4_62:
	tsubcctv %r19, 0x1317, %r24
	.word 0xda07e1f9  ! 121: LDUW_I	lduw	[%r31 + 0x01f9], %r13
	.word 0xda57c000  ! 122: LDSH_R	ldsh	[%r31 + %r0], %r13
tagged_4_63:
	taddcctv %r13, 0x1b5f, %r24
	.word 0xda07e1f9  ! 123: LDUW_I	lduw	[%r31 + 0x01f9], %r13
	.word 0xdac004a0  ! 124: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
donret_4_64:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_64-donret_4_64), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_64:
	.word 0xdaffe1f9  ! 125: SWAPA_I	swapa	%r13, [%r31 + 0x01f9] %asi
	.word 0xdacfe000  ! 126: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r13
mondo_4_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d944002  ! 127: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
splash_cmpr_4_66:
	setx 0x312a0c3a66509cd8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 128: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_4_67:
	.word 0x81982ed4  ! 129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed4, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_4_68)) -> intp(4,1,3)
xir_4_68:
	.word 0xa984a3c7  ! 130: WR_SET_SOFTINT_I	wr	%r18, 0x03c7, %set_softint
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01972  ! 131: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_70)) -> intp(5,0,4)
intvec_4_70:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 133: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x91d02032  ! 134: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd48008a0  ! 135: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
debug_4_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 136: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_4_72:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_72-donret_4_72), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_72:
	.word 0xd4fff312  ! 137: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
splash_lsu_4_73:
	setx 0x1561f6f5613a718f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 138: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_4_74:
	setx 0x838b35ba2739cfd9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 139: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 140: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa7a01a65  ! 141: FqTOi	fqtoi	
tagged_4_75:
	taddcctv %r18, 0x1c74, %r14
	.word 0xe207f312  ! 142: LDUW_I	lduw	[%r31 + 0xfffff312], %r17
splash_hpstate_4_76:
	.word 0x81982b0d  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0d, %hpstate
	.word 0xa7454000  ! 144: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
splash_htba_4_77:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 145: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_4_78:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 146: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_4_79:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 147: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_80)) -> intp(0,0,13)
intvec_4_80:
	.word 0x39400001  ! 148: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_81:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 149: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_4_82:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_82:
	.word 0x8f902002  ! 150: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_4_83:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 151: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d020b4  ! 152: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x8d9031c4  ! 153: WRPR_PSTATE_I	wrpr	%r0, 0x11c4, %pstate
	.word 0x9950c000  ! 154: RDPR_TT	<illegal instruction>
DS_4_84:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 155: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_4_85:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 156: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802014  ! 157: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x91d02034  ! 158: Tcc_I	ta	icc_or_xcc, %r0 + 52
intveclr_4_86:
	setx 0x68d44e482f4725c4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 159: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_4_87:
	taddcctv %r14, 0x1d8d, %r10
	.word 0xe607f312  ! 160: LDUW_I	lduw	[%r31 + 0xfffff312], %r19
mondo_4_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d944008  ! 161: WRPR_WSTATE_R	wrpr	%r17, %r8, %wstate
splash_tba_4_89:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 162: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_4_90:
	.word 0x819827ce  ! 163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07ce, %hpstate
splash_cmpr_4_91:
	setx 0x85cbb9265f804e92, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 164: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe71fc000  ! 165: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x93902000  ! 166: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_4_92:
	.word 0xa9a109c6  ! 1: FDIVd	fdivd	%f4, %f6, %f20
	.word 0xfd692a6f	! Random illegal ?
	.word 0x91a00546  ! 1: FSQRTd	fsqrt	
	.word 0x9ba34830  ! 167: FADDs	fadds	%f13, %f16, %f13
	.word 0xa190200b  ! 168: WRPR_GL_I	wrpr	%r0, 0x000b, %-
donret_4_93:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_93-donret_4_93), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_93:
	.word 0xd4fff312  ! 169: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
	.word 0x93902004  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
donret_4_94:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_94-donret_4_94), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_94:
	.word 0xd4fff312  ! 171: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
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
	.word 0xa5414000  ! 172: RDPC	rd	%pc, %r18
	.word 0xd0dfe010  ! 173: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r8
	.word 0xa1902008  ! 174: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd127c000  ! 175: STF_R	st	%f8, [%r0, %r31]
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 176: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_4_96:
	setx 0xc3d84299749a6d03, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 177: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9037cc  ! 178: WRPR_PSTATE_I	wrpr	%r0, 0x17cc, %pstate
	.word 0x99480000  ! 179: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0xd28008a0  ! 180: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x91d02032  ! 181: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81510000  ! 182: RDPR_TICK	rdpr	%tick, %r0
mondo_4_97:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d920010  ! 183: WRPR_WSTATE_R	wrpr	%r8, %r16, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_98)) -> intp(6,0,18)
intvec_4_98:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_4_99:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_99:
	.word 0x8f902000  ! 185: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902001  ! 186: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 187: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_4_100:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_100:
	.word 0x8f902000  ! 188: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d802000  ! 189: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_4_101:
	setx 0x996f9491bfa8de48, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 190: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01971  ! 191: FqTOd	dis not found

	setx 0x9b471f168ea2efdf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_103:
	.word 0x39400001  ! 192: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd08804a0  ! 193: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
mondo_4_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d948008  ! 194: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 195: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd09004a0  ! 196: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0xd06ff312  ! 197: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff312]
change_to_randtl_4_105:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_105:
	.word 0x8f902002  ! 198: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_4_106:
	setx 0xbfbf5f6a07c3a851, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 199: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802058  ! 200: WRASI_I	wr	%r0, 0x0058, %asi
	rd %pc, %r19
	add %r19, (ivw_4_107-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_107:
	.word 0xa5a00160  ! 201: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9369a60c  ! 202: SDIVX_I	sdivx	%r6, 0x060c, %r9
	.word 0xd6d004a0  ! 203: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
splash_hpstate_4_109:
	.word 0x81982414  ! 204: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0414, %hpstate
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 205: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_4_110:
	.word 0x9ba349c6  ! 1: FDIVd	fdivd	%f44, %f6, %f44
	.word 0xbfe7c000  ! 206: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_4_111:
	setx 0x6e3f47bcd0ea91fb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 208: LDX_R	ldx	[%r31 + %r0], %r11
splash_tba_4_112:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 209: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_4_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 210: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd727c000  ! 211: STF_R	st	%f11, [%r0, %r31]
	.word 0xa9804010  ! 212: WR_SET_SOFTINT_R	wr	%r1, %r16, %set_softint
mondo_4_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d91c000  ! 213: WRPR_WSTATE_R	wrpr	%r7, %r0, %wstate
mondo_4_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d920010  ! 214: WRPR_WSTATE_R	wrpr	%r8, %r16, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01970  ! 215: FqTOd	dis not found

	.word 0x96f8c011  ! 216: SDIVcc_R	sdivcc 	%r3, %r17, %r11
	.word 0xa1902009  ! 217: WRPR_GL_I	wrpr	%r0, 0x0009, %-
mondo_4_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d924012  ! 218: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
	.word 0xe48008a0  ! 219: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe4bfc020  ! 220: STDA_R	stda	%r18, [%r31 + %r0] 0x01
tagged_4_118:
	tsubcctv %r22, 0x1197, %r19
	.word 0xe407f661  ! 221: LDUW_I	lduw	[%r31 + 0xfffff661], %r18
	.word 0x879020a6  ! 222: WRPR_TT_I	wrpr	%r0, 0x00a6, %tt
	.word 0xe4d7e010  ! 223: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r18
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
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
	.word 0xa9414000  ! 224: RDPC	rd	%pc, %r20
	rd %pc, %r19
	add %r19, (ivw_4_120-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_120:
	.word 0x93a00162  ! 225: FABSq	dis not found

donret_4_121:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_121-donret_4_121), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_121:
	.word 0xd2fff661  ! 226: SWAPA_I	swapa	%r9, [%r31 + 0xfffff661] %asi
	.word 0xa9820012  ! 227: WR_SET_SOFTINT_R	wr	%r8, %r18, %set_softint
	.word 0x944c800a  ! 228: MULX_R	mulx 	%r18, %r10, %r10
splash_lsu_4_122:
	setx 0x95a3ecc04747f425, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 229: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x143bd662ee865e24, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_123:
	.word 0x39400001  ! 230: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe21ff661  ! 231: LDD_I	ldd	[%r31 + 0xfffff661], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 232: LDX_R	ldx	[%r31 + %r0], %r17
DS_4_124:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 233: SAVE_R	save	%r31, %r0, %r31
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 234: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_4_125:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 235: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_126)) -> intp(1,0,23)
intvec_4_126:
	.word 0x39400001  ! 236: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_4_127:
	setx 0xde5fb4c40ff62bd3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_4_128-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_128:
	.word 0xa9a00160  ! 238: FABSq	dis not found

	.word 0xd69ff661  ! 239: LDDA_I	ldda	[%r31, + 0xfffff661] %asi, %r11
DS_4_129:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd1304000  ! 1: STQF_R	-	%f8, [%r0, %r1]
	normalw
	.word 0x99458000  ! 240: RD_SOFTINT_REG	rd	%softint, %r12
splash_lsu_4_130:
	setx 0xcfce76302839032f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 241: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2c804a0  ! 242: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
splash_tba_4_131:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 243: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200a  ! 244: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xe2d00e60  ! 245: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r17
	.word 0xe2d00e80  ! 246: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r17
	.word 0x99520000  ! 247: RDPR_PIL	<illegal instruction>
tagged_4_132:
	tsubcctv %r3, 0x18b5, %r19
	.word 0xe607f661  ! 248: LDUW_I	lduw	[%r31 + 0xfffff661], %r19
debug_4_133:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 249: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe727c000  ! 250: STF_R	st	%f19, [%r0, %r31]
splash_lsu_4_134:
	setx 0x08047b52ecd6593b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 251: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x32800001  ! 252: BNE	bne,a	<label_0x1>
	.word 0xe6d804a0  ! 253: LDXA_R	ldxa	[%r0, %r0] 0x25, %r19
	.word 0xe66ff661  ! 254: LDSTUB_I	ldstub	%r19, [%r31 + 0xfffff661]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01972  ! 255: FqTOd	dis not found

	.word 0x8d902a55  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x0a55, %pstate
splash_hpstate_4_136:
	.word 0x8198290c  ! 257: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090c, %hpstate
	.word 0x97a48dd4  ! 258: FdMULq	fdmulq	
	.word 0x93902007  ! 259: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
mondo_4_137:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d940011  ! 260: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0xe29004a0  ! 261: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
mondo_4_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d95000d  ! 262: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
	.word 0x87802089  ! 263: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87802016  ! 264: WRASI_I	wr	%r0, 0x0016, %asi
mondo_4_139:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d94800b  ! 265: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
mondo_4_140:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d940007  ! 266: WRPR_WSTATE_R	wrpr	%r16, %r7, %wstate
debug_4_141:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_141:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_141
    nop
debug_wait4_141:
    ld [%r23], %r2
    brnz %r2, debug_wait4_141
    nop
    ba,a debug_startwait4_141
continue_debug_4_141:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_141:
    cmp %r13, %r15
    bne,a wait_for_stat_4_141
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_141:
    cmp %r14, %r15
    bne,a wait_for_debug_4_141
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe0f00852  ! 267: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0x8d902e44  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x0e44, %pstate
debug_4_142:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 269: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab804011  ! 270: WR_CLEAR_SOFTINT_R	wr	%r1, %r17, %clear_softint
debug_4_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 271: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa190200a  ! 272: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 273: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01960  ! 274: FqTOd	dis not found

tagged_4_145:
	taddcctv %r23, 0x1863, %r21
	.word 0xd407f661  ! 275: LDUW_I	lduw	[%r31 + 0xfffff661], %r10
splash_cmpr_4_146:
	setx 0x52f420cebeae5bf2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 276: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902541  ! 277: WRPR_PSTATE_I	wrpr	%r0, 0x0541, %pstate
splash_tba_4_147:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 278: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_4_148:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 279: RESTORE_R	restore	%r31, %r0, %r31
mondo_4_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d94c006  ! 280: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
splash_lsu_4_150:
	setx 0x82602092841014d9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 281: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879023f7  ! 282: WRPR_TT_I	wrpr	%r0, 0x03f7, %tt
	setx 0xb3f1fa1fe19cab0d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_151:
	.word 0x39400001  ! 283: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd40ff661  ! 284: LDUB_I	ldub	[%r31 + 0xfffff661], %r10
mondo_4_152:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d944014  ! 285: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0x8d903298  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x1298, %pstate
splash_tba_4_153:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 287: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902190  ! 288: WRPR_TT_I	wrpr	%r0, 0x0190, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9968e304  ! 289: SDIVX_I	sdivx	%r3, 0x0304, %r12
splash_tba_4_155:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 290: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_4_156:
	setx 0xa8f0bfd808c378ed, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 291: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196c  ! 292: FqTOd	dis not found

splash_lsu_4_158:
	setx 0x2e06d38668b1c16f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 293: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 294: RD_STICK_REG	stbar
splash_cmpr_4_159:
	setx 0x154af8c0b11251a5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_160:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 296: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d903e43  ! 297: WRPR_PSTATE_I	wrpr	%r0, 0x1e43, %pstate
	.word 0xa2fcb356  ! 298: SDIVcc_I	sdivcc 	%r18, 0xfffff356, %r17
	.word 0xa985000a  ! 299: WR_SET_SOFTINT_R	wr	%r20, %r10, %set_softint
	.word 0xd0880e80  ! 300: LDUBA_R	lduba	[%r0, %r0] 0x74, %r8
	setx 0x8659618d75ca7573, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_161:
	.word 0x39400001  ! 301: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0d804a0  ! 302: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_162)) -> intp(7,0,28)
intvec_4_162:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_163:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d900001  ! 304: WRPR_WSTATE_R	wrpr	%r0, %r1, %wstate
	.word 0xab848011  ! 305: WR_CLEAR_SOFTINT_R	wr	%r18, %r17, %clear_softint
	.word 0xa1902007  ! 306: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 307: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01974  ! 308: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01960  ! 309: FqTOd	dis not found

	.word 0x87802088  ! 310: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87802004  ! 311: WRASI_I	wr	%r0, 0x0004, %asi
mondo_4_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d900007  ! 312: WRPR_WSTATE_R	wrpr	%r0, %r7, %wstate
pmu_4_167:
	nop
	setx 0xfffff26cfffff441, %g1, %g7
	.word 0xa3800007  ! 313: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_4_168:
	setx 0xee356e6650a828bd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 314: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879023db  ! 315: WRPR_TT_I	wrpr	%r0, 0x03db, %tt
	.word 0x9190e13b  ! 316: WRPR_PIL_I	wrpr	%r3, 0x013b, %pil
tagged_4_169:
	taddcctv %r12, 0x167b, %r1
	.word 0xd607ee91  ! 317: LDUW_I	lduw	[%r31 + 0x0e91], %r11
	.word 0x9ba249c2  ! 318: FDIVd	fdivd	%f40, %f2, %f44
	.word 0xd06fee91  ! 319: LDSTUB_I	ldstub	%r8, [%r31 + 0x0e91]
	.word 0xd06fee91  ! 320: LDSTUB_I	ldstub	%r8, [%r31 + 0x0e91]
splash_tba_4_170:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 321: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x90c52148  ! 322: ADDCcc_I	addccc 	%r20, 0x0148, %r8
splash_cmpr_4_171:
	setx 0x23ff02cd6526369e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 323: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802089  ! 324: WRASI_I	wr	%r0, 0x0089, %asi
	rd %pc, %r19
	add %r19, (ivw_4_172-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_172:
	.word 0xa5a00172  ! 325: FABSq	dis not found

	.word 0x93902002  ! 326: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
debug_4_173:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 327: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_4_174:
	.word 0x81982c14  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c14, %hpstate
splash_tba_4_175:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 329: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_176:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 330: RDPC	rd	%pc, %r12
tagged_4_177:
	taddcctv %r9, 0x1a4b, %r18
	.word 0xda07e697  ! 331: LDUW_I	lduw	[%r31 + 0x0697], %r13
	.word 0xda1fc000  ! 332: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xa4480007  ! 333: MULX_R	mulx 	%r0, %r7, %r18
	.word 0xe2dfe030  ! 334: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r17
change_to_randtl_4_178:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_178:
	.word 0x8f902001  ! 335: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_4_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 336: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_4_180:
	setx 0x4423a96cbe8aa524, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902000  ! 338: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_4_181:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d904007  ! 339: WRPR_WSTATE_R	wrpr	%r1, %r7, %wstate
donret_4_182:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_182-donret_4_182), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_182:
	.word 0xe2ffe697  ! 340: SWAPA_I	swapa	%r17, [%r31 + 0x0697] %asi
	.word 0xe26fe697  ! 341: LDSTUB_I	ldstub	%r17, [%r31 + 0x0697]
intveclr_4_183:
	setx 0x3d2d32b7ed0368bd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 342: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_184:
	.word 0x8198284f  ! 343: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084f, %hpstate
intveclr_4_185:
	setx 0x3f06c236ee5b3ed5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_186)) -> intp(3,0,23)
intvec_4_186:
	.word 0x39400001  ! 345: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfe020  ! 346: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r17
splash_tba_4_187:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 347: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200a  ! 348: WRPR_GL_I	wrpr	%r0, 0x000a, %-
change_to_randtl_4_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_188:
	.word 0x8f902000  ! 349: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	setx 0xbbecc03e713dea98, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_189:
	.word 0x39400001  ! 350: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 351: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_190
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_190
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_190:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 352: RDPC	rd	%pc, %r12
	.word 0xe69fe697  ! 353: LDDA_I	ldda	[%r31, + 0x0697] %asi, %r19
	.word 0x87802016  ! 354: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xe647c000  ! 355: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0xe68804a0  ! 356: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
mondo_4_191:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d928007  ! 357: WRPR_WSTATE_R	wrpr	%r10, %r7, %wstate
pmu_4_192:
	nop
	setx 0xfffff315ffffffcc, %g1, %g7
	.word 0xa3800007  ! 358: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_4_193-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_193:
	.word 0xa1a00162  ! 359: FABSq	dis not found

splash_cmpr_4_194:
	setx 0xe0a6d0f4e8df0ed2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 360: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99540000  ! 361: RDPR_GL	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01973  ! 362: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 363: LDX_R	ldx	[%r31 + %r0], %r13
intveclr_4_196:
	setx 0xb8fba65a7b8a30d0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 365: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01964  ! 366: FqTOd	dis not found

DS_4_198:
	.word 0x93a209ca  ! 1: FDIVd	fdivd	%f8, %f10, %f40
	.word 0xcd7d28d5	! Random illegal ?
	.word 0xd9114003  ! 1: LDQF_R	-	[%r5, %r3], %f12
	.word 0x93a0c832  ! 367: FADDs	fadds	%f3, %f18, %f9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01968  ! 368: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.xir_4_200)) -> intp(4,1,3)
xir_4_200:
	.word 0xa983243a  ! 369: WR_SET_SOFTINT_I	wr	%r12, 0x043a, %set_softint
	.word 0x87802014  ! 370: WRASI_I	wr	%r0, 0x0014, %asi
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_201
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_201:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 371: RDPC	rd	%pc, %r11
	.word 0x99902000  ! 372: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x87802010  ! 373: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd4d804a0  ! 374: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
change_to_randtl_4_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_202:
	.word 0x8f902002  ! 375: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa5464000  ! 376: RD_STICK_CMPR_REG	rd	%-, %r18
DS_4_203:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 377: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe06ffe9a  ! 378: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffe9a]
	.word 0x83d020b2  ! 379: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0x87802089  ! 380: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_4_204:
	setx 0x17deb4350b96373f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 381: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_4_205:
	.word 0x81982086  ! 382: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0086, %hpstate
splash_cmpr_4_206:
	setx 0x67fc3103fa51a2c6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 383: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93480000  ! 384: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
tagged_4_207:
	taddcctv %r15, 0x142d, %r2
	.word 0xe407fe9a  ! 385: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r18
	.word 0xa1902007  ! 386: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xe527fe9a  ! 387: STF_I	st	%f18, [0x1e9a, %r31]
splash_cmpr_4_208:
	setx 0xdc051984d06d2226, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 388: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 389: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_4_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 390: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_4_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_210:
	.word 0x8f902000  ! 391: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe4d004a0  ! 392: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r18
debug_4_211:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 393: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe49ffe9a  ! 394: LDDA_I	ldda	[%r31, + 0xfffffe9a] %asi, %r18
	.word 0xe42ffe9a  ! 395: STB_I	stb	%r18, [%r31 + 0xfffffe9a]
	.word 0xe457fe9a  ! 396: LDSH_I	ldsh	[%r31 + 0xfffffe9a], %r18
DS_4_212:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9ba409d0  ! 1: FDIVd	fdivd	%f16, %f16, %f44
	normalw
	.word 0x9b458000  ! 397: RD_SOFTINT_REG	rd	%softint, %r13
tagged_4_213:
	taddcctv %r20, 0x1480, %r2
	.word 0xd607fe9a  ! 398: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r11
splash_hpstate_4_214:
	.word 0x8198290e  ! 399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090e, %hpstate
	.word 0xd60fc000  ! 400: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0x87902309  ! 401: WRPR_TT_I	wrpr	%r0, 0x0309, %tt
splash_tba_4_215:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 402: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01961  ! 403: FqTOd	dis not found

debug_4_217:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 404: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd48008a0  ! 405: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_218:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 406: RDPC	rd	%pc, %r9
	rd %pc, %r19
	add %r19, (ivw_4_219-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_219:
	.word 0x91a00172  ! 407: FABSq	dis not found

splash_htba_4_220:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 408: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
change_to_randtl_4_221:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_221:
	.word 0x8f902003  ! 409: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x87802055  ! 410: WRASI_I	wr	%r0, 0x0055, %asi
splash_cmpr_4_222:
	setx 0x6aab07f6f656dcdb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 411: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_4_223:
	nop
	setx 0xfffffb23fffff6b8, %g1, %g7
	.word 0xa3800007  ! 412: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_4_224:
	tsubcctv %r14, 0x17ab, %r2
	.word 0xe207fe9a  ! 413: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r17
mondo_4_225:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d940010  ! 414: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
splash_tba_4_226:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 415: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f802be7  ! 416: SIR	sir	0x0be7
splash_cmpr_4_227:
	setx 0x27121ba44be68a7a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 417: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99520000  ! 418: RDPR_PIL	<illegal instruction>
debug_4_228:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_228:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_228
    nop
debug_wait4_228:
    ld [%r23], %r2
    brnz %r2, debug_wait4_228
    nop
    ba,a debug_startwait4_228
continue_debug_4_228:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_228:
    cmp %r13, %r15
    bne,a wait_for_stat_4_228
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_228:
    cmp %r14, %r15
    bne,a wait_for_debug_4_228
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00852  ! 419: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	.word 0x91d02033  ! 420: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xdadfe020  ! 421: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r13
debug_4_229:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 422: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56a31ae  ! 423: SDIVX_I	sdivx	%r8, 0xfffff1ae, %r18
	.word 0xd08fe010  ! 424: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r8
splash_hpstate_4_231:
	.word 0x81982fd7  ! 425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd7, %hpstate
mondo_4_232:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d94c013  ! 426: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	.word 0xd08008a0  ! 427: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd057c000  ! 428: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01969  ! 429: FqTOd	dis not found

	rd %pc, %r19
	add %r19, (ivw_4_234-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_234:
	.word 0x9ba00160  ! 430: FABSq	dis not found

	.word 0x9b540000  ! 431: RDPR_GL	<illegal instruction>
	.word 0x92d12710  ! 432: UMULcc_I	umulcc 	%r4, 0x0710, %r9
	.word 0x87802089  ! 433: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_4_235:
	setx 0xa6582bfcd3fd8215, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 434: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_4_236:
	.word 0x81982f8f  ! 435: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8f, %hpstate
	.word 0xd0c00e60  ! 436: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r8
	.word 0x95a109c0  ! 437: FDIVd	fdivd	%f4, %f0, %f10
tagged_4_237:
	taddcctv %r1, 0x12bd, %r3
	.word 0xd607f110  ! 438: LDUW_I	lduw	[%r31 + 0xfffff110], %r11
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_238)) -> intp(2,0,7)
intvec_4_238:
	.word 0x39400001  ! 439: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_4_239:
	setx 0xe88bfb5d5ee7563e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6d804a0  ! 441: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
splash_cmpr_4_240:
	setx 0xab3e86071e051bb7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 442: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01961  ! 443: FqTOd	dis not found

	.word 0xe6d7e030  ! 444: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r19
	.word 0x8780201c  ! 445: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01971  ! 446: FqTOd	dis not found

	.word 0x83d020b4  ! 447: Tcc_I	te	icc_or_xcc, %r0 + 180
splash_cmpr_4_243:
	setx 0xb3fe77db507ecb61, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9032a9  ! 449: WRPR_PSTATE_I	wrpr	%r0, 0x12a9, %pstate
change_to_randtl_4_244:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_244:
	.word 0x8f902002  ! 450: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	rd %pc, %r19
	add %r19, (ivw_4_245-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_245:
	.word 0x99a00164  ! 451: FABSq	dis not found

debug_4_246:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_246:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_246
    nop
debug_wait4_246:
    ld [%r23], %r2
    brnz %r2, debug_wait4_246
    nop
    ba,a debug_startwait4_246
continue_debug_4_246:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_246:
    cmp %r13, %r15
    bne,a wait_for_stat_4_246
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_246:
    cmp %r14, %r15
    bne,a wait_for_debug_4_246
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe0f00852  ! 452: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0x99a1c9d3  ! 453: FDIVd	fdivd	%f38, %f50, %f12
tagged_4_247:
	taddcctv %r9, 0x1863, %r25
	.word 0xd407f110  ! 454: LDUW_I	lduw	[%r31 + 0xfffff110], %r10
	.word 0x87802014  ! 455: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd4800ae0  ! 456: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r10
debug_4_248:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 457: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	setx 0x81dd31061597b703, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_249:
	.word 0x39400001  ! 458: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93464000  ! 459: RD_STICK_CMPR_REG	rd	%-, %r9
!$EV trig_pc_d(1, @VA(.MAIN.xir_4_250)) -> intp(4,1,3)
xir_4_250:
	.word 0xa984f4d1  ! 460: WR_SET_SOFTINT_I	wr	%r19, 0x14d1, %set_softint
intveclr_4_251:
	setx 0xc04bf77194730352, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 461: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_252:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_252:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_252
    nop
debug_wait4_252:
    ld [%r23], %r2
    brnz %r2, debug_wait4_252
    nop
    ba,a debug_startwait4_252
continue_debug_4_252:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_252:
    cmp %r13, %r15
    bne,a wait_for_stat_4_252
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_252:
    cmp %r14, %r15
    bne,a wait_for_debug_4_252
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00852  ! 462: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
mondo_4_253:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d940004  ! 463: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
debug_4_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 464: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_255
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_255
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_255:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 465: RDPC	rd	%pc, %r11
change_to_randtl_4_256:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_256:
	.word 0x8f902002  ! 466: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x9f803788  ! 467: SIR	sir	0x1788
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_257:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 468: RDPC	rd	%pc, %r20
debug_4_258:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_258:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_258
    nop
debug_wait4_258:
    ld [%r23], %r2
    brnz %r2, debug_wait4_258
    nop
    ba,a debug_startwait4_258
continue_debug_4_258:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_258:
    cmp %r13, %r15
    bne,a wait_for_stat_4_258
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_258:
    cmp %r14, %r15
    bne,a wait_for_debug_4_258
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00852  ! 469: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
tagged_4_259:
	taddcctv %r24, 0x17b3, %r4
	.word 0xd407f2f6  ! 470: LDUW_I	lduw	[%r31 + 0xfffff2f6], %r10
	.word 0x9153c000  ! 471: RDPR_FQ	<illegal instruction>
	.word 0xd24ff2f6  ! 472: LDSB_I	ldsb	[%r31 + 0xfffff2f6], %r9
	.word 0x8d902acd  ! 473: WRPR_PSTATE_I	wrpr	%r0, 0x0acd, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956a26cf  ! 474: SDIVX_I	sdivx	%r8, 0x06cf, %r10
splash_cmpr_4_261:
	setx 0xc11e1ebfc35b6d66, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 475: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_4_262:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_262:
	.word 0x8f902002  ! 476: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd697e000  ! 477: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
	.word 0xa6fd285a  ! 478: SDIVcc_I	sdivcc 	%r20, 0x085a, %r19
splash_cmpr_4_263:
	setx 0x8ecc1e4bf4e6bb4d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 479: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 480: LDX_R	ldx	[%r31 + %r0], %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 481: LDX_R	ldx	[%r31 + %r0], %r10
mondo_4_264:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d90800c  ! 482: WRPR_WSTATE_R	wrpr	%r2, %r12, %wstate
splash_tba_4_265:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 483: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 484: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x87802055  ! 485: WRASI_I	wr	%r0, 0x0055, %asi
splash_tba_4_266:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 486: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd49fe208  ! 487: LDDA_I	ldda	[%r31, + 0x0208] %asi, %r10
debug_4_267:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_267:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_267
    nop
debug_wait4_267:
    ld [%r23], %r2
    brnz %r2, debug_wait4_267
    nop
    ba,a debug_startwait4_267
continue_debug_4_267:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_267:
    cmp %r13, %r15
    bne,a wait_for_stat_4_267
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_267:
    cmp %r14, %r15
    bne,a wait_for_debug_4_267
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00852  ! 488: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0xa9850014  ! 489: WR_SET_SOFTINT_R	wr	%r20, %r20, %set_softint
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_268
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_268
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_268:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 490: RDPC	rd	%pc, %r18
	.word 0x8d802000  ! 491: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_4_269:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 492: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_4_270:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_270:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_270
    nop
debug_wait4_270:
    ld [%r23], %r2
    brnz %r2, debug_wait4_270
    nop
    ba,a debug_startwait4_270
continue_debug_4_270:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_270:
    cmp %r13, %r15
    bne,a wait_for_stat_4_270
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_270:
    cmp %r14, %r15
    bne,a wait_for_debug_4_270
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00852  ! 493: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	setx 0x5e2484047d710efe, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_271:
	.word 0x39400001  ! 494: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_272:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd534400a  ! 1: STQF_R	-	%f10, [%r10, %r17]
	normalw
	.word 0x99458000  ! 495: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xe68008a0  ! 496: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
debug_4_273:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_273:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_273
    nop
debug_wait4_273:
    ld [%r23], %r2
    brnz %r2, debug_wait4_273
    nop
    ba,a debug_startwait4_273
continue_debug_4_273:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_273:
    cmp %r13, %r15
    bne,a wait_for_stat_4_273
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_273:
    cmp %r14, %r15
    bne,a wait_for_debug_4_273
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %18, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00852  ! 497: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 498: LDX_R	ldx	[%r31 + %r0], %r19
tagged_4_274:
	tsubcctv %r26, 0x1f93, %r16
	.word 0xe607e208  ! 499: LDUW_I	lduw	[%r31 + 0x0208], %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_4_275)) -> intp(4,1,3)
xir_4_275:
	.word 0xa98268ef  ! 500: WR_SET_SOFTINT_I	wr	%r9, 0x08ef, %set_softint
mondo_4_276:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d940003  ! 501: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
splash_cmpr_4_277:
	setx 0x859249367958d54b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 502: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_4_278:
	tsubcctv %r23, 0x1692, %r25
	.word 0xe607f4d4  ! 503: LDUW_I	lduw	[%r31 + 0xfffff4d4], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 504: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xad853201  ! 505: WR_SOFTINT_REG_I	wr	%r20, 0x1201, %softint
	.word 0x87902200  ! 506: WRPR_TT_I	wrpr	%r0, 0x0200, %tt
	.word 0xe677c000  ! 507: STX_R	stx	%r19, [%r31 + %r0]
	rd %pc, %r19
	add %r19, (ivw_4_279-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_279:
	.word 0xa1a00173  ! 508: FABSq	dis not found

DS_4_280:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 509: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_4_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_281:
	.word 0x8f902003  ! 510: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_282
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_282
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_282:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 511: RDPC	rd	%pc, %r9
splash_hpstate_4_283:
	.word 0x8198260f  ! 512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060f, %hpstate
mondo_4_284:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d940000  ! 513: WRPR_WSTATE_R	wrpr	%r16, %r0, %wstate
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_285
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_285
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_285:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 514: RDPC	rd	%pc, %r12
	.word 0xe83fec34  ! 515: STD_I	std	%r20, [%r31 + 0x0c34]
debug_4_286:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 516: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_4_287:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_287:
	.word 0x8f902003  ! 517: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x93a089c2  ! 518: FDIVd	fdivd	%f2, %f2, %f40
mondo_4_288:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d94800a  ! 519: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
mondo_4_289:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d940013  ! 520: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
change_to_randtl_4_290:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_290:
	.word 0x8f902001  ! 521: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd327c000  ! 522: STF_R	st	%f9, [%r0, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 523: LDX_R	ldx	[%r31 + %r0], %r9
debug_4_291:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_291:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_291
    nop
debug_wait4_291:
    ld [%r23], %r2
    brnz %r2, debug_wait4_291
    nop
    ba,a debug_startwait4_291
continue_debug_4_291:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_291:
    cmp %r13, %r15
    bne,a wait_for_stat_4_291
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_291:
    cmp %r14, %r15
    bne,a wait_for_debug_4_291
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00852  ! 524: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
intveclr_4_292:
	setx 0x5010493862e5e72a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196c  ! 526: FqTOd	dis not found

mondo_4_294:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d92c009  ! 527: WRPR_WSTATE_R	wrpr	%r11, %r9, %wstate
tagged_4_295:
	taddcctv %r10, 0x11c6, %r15
	.word 0xd407ec34  ! 528: LDUW_I	lduw	[%r31 + 0x0c34], %r10
	.word 0x8d802000  ! 529: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879020e2  ! 530: WRPR_TT_I	wrpr	%r0, 0x00e2, %tt
	.word 0x91d02035  ! 531: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x30800001  ! 532: BA	ba,a	<label_0x1>
	.word 0xd4c80e60  ! 533: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r10
	.word 0x91d020b2  ! 534: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_cmpr_4_296:
	setx 0x6dab5e7d5e73099a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 535: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01972  ! 536: FqTOd	dis not found

DS_4_298:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb352136  ! 1: STQF_I	-	%f13, [0x0136, %r20]
	normalw
	.word 0x93458000  ! 537: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x93902004  ! 538: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91d02033  ! 539: Tcc_I	ta	icc_or_xcc, %r0 + 51
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 540: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936b2884  ! 541: SDIVX_I	sdivx	%r12, 0x0884, %r9
	.word 0x38800001  ! 542: BGU	bgu,a	<label_0x1>
	.word 0xe6c7e000  ! 543: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r19
splash_lsu_4_300:
	setx 0xefcd43163a7954e7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 544: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 545: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x91d02035  ! 546: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902006  ! 547: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 548: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f8026ec  ! 549: SIR	sir	0x06ec
	setx 0x5983ddb77d3480ac, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_301:
	.word 0x39400001  ! 550: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 551: LDX_R	ldx	[%r31 + %r0], %r19
splash_tba_4_302:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 552: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_4_303:
	.word 0x8198259e  ! 553: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059e, %hpstate
splash_lsu_4_304:
	setx 0x152281e646642b17, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 554: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_305:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d90800c  ! 555: WRPR_WSTATE_R	wrpr	%r2, %r12, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6d3a81  ! 556: SDIVX_I	sdivx	%r20, 0xfffffa81, %r13
	.word 0x9b500000  ! 557: RDPR_TPC	rdpr	%tpc, %r13
splash_cmpr_4_307:
	setx 0xd7d5caa0cd5b644c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 558: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_4_308:
	.word 0x8198259e  ! 559: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059e, %hpstate
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_309
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_309
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_309:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 560: RDPC	rd	%pc, %r17
splash_tba_4_310:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 561: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_4_311:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 562: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xdad7e020  ! 563: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
debug_4_312:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_312:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_312
    nop
debug_wait4_312:
    ld [%r23], %r2
    brnz %r2, debug_wait4_312
    nop
    ba,a debug_startwait4_312
continue_debug_4_312:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_312:
    cmp %r13, %r15
    bne,a wait_for_stat_4_312
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_312:
    cmp %r14, %r15
    bne,a wait_for_debug_4_312
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00852  ! 564: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0x93480000  ! 565: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
splash_cmpr_4_313:
	setx 0x793631bbe4f1872e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 566: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd66fe176  ! 567: LDSTUB_I	ldstub	%r11, [%r31 + 0x0176]
	.word 0xd6d004a0  ! 568: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0xd697e000  ! 569: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
splash_cmpr_4_314:
	setx 0xf53e285f76e88a79, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 570: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_315:
	setx 0x5c1551042b01a87f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 571: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd61fe176  ! 572: LDD_I	ldd	[%r31 + 0x0176], %r11
change_to_randtl_4_316:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_316:
	.word 0x8f902001  ! 573: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	rd %pc, %r19
	add %r19, (ivw_4_317-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_317:
	.word 0xa3a0016b  ! 574: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_4_318-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_318:
	.word 0x95a00173  ! 575: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 576: LDX_R	ldx	[%r31 + %r0], %r9
mondo_4_319:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d94c008  ! 577: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
	.word 0x93902006  ! 578: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x99a209cd  ! 579: FDIVd	fdivd	%f8, %f44, %f12
intveclr_4_320:
	setx 0x84b7af16b5cc2124, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 580: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 581: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe48008a0  ! 582: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	rd %pc, %r19
	add %r19, (ivw_4_321-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_321:
	.word 0x97a00174  ! 583: FABSq	dis not found

	.word 0xa190200a  ! 584: WRPR_GL_I	wrpr	%r0, 0x000a, %-
intveclr_4_322:
	setx 0x5cb72edecb675024, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 585: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_4_323:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 586: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_4_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d91c002  ! 587: WRPR_WSTATE_R	wrpr	%r7, %r2, %wstate
splash_cmpr_4_325:
	setx 0x9df2ec0605295145, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 588: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe29004a0  ! 589: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
	.word 0xe25fe176  ! 590: LDX_I	ldx	[%r31 + 0x0176], %r17
	.word 0x93902001  ! 591: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 592: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 593: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x879021d2  ! 594: WRPR_TT_I	wrpr	%r0, 0x01d2, %tt
debug_4_326:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 595: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01960  ! 596: FqTOd	dis not found

splash_cmpr_4_328:
	setx 0xee66255bd8ab7992, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 597: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe257c000  ! 598: LDSH_R	ldsh	[%r31 + %r0], %r17
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_329
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_329
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_329:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 599: RDPC	rd	%pc, %r20
	.word 0xe41fc000  ! 600: LDD_R	ldd	[%r31 + %r0], %r18
splash_cmpr_4_330:
	setx 0xf40dbc8533cf52fa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 601: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 602: LDX_R	ldx	[%r31 + %r0], %r18
mondo_4_331:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d948004  ! 603: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
	.word 0x95a349c0  ! 604: FDIVd	fdivd	%f44, %f0, %f10
splash_lsu_4_332:
	setx 0xb1c429dbf4d8a6bf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 605: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 606: Tcc_I	ta	icc_or_xcc, %r0 + 181
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_333
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_333
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_333:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 607: RDPC	rd	%pc, %r17
splash_tba_4_334:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 608: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81510000  ! 609: RDPR_TICK	rdpr	%tick, %r0
	.word 0xd057c000  ! 610: LDSH_R	ldsh	[%r31 + %r0], %r8
tagged_4_335:
	taddcctv %r25, 0x1b4b, %r5
	.word 0xd007e176  ! 611: LDUW_I	lduw	[%r31 + 0x0176], %r8
	.word 0x91d02033  ! 612: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93454000  ! 613: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
intveclr_4_336:
	setx 0xd8586fdf54cd6caa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 614: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_4_337:
	setx 0xd2b25416bc6f7425, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 615: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_4_338:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8547751c	! Random illegal ?
	.word 0xd3144014  ! 1: LDQF_R	-	[%r17, %r20], %f9
	.word 0x99a30820  ! 616: FADDs	fadds	%f12, %f0, %f12
mondo_4_339:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d950004  ! 617: WRPR_WSTATE_R	wrpr	%r20, %r4, %wstate
splash_cmpr_4_340:
	setx 0x0ff12462254a0444, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 618: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d02033  ! 619: Tcc_I	te	icc_or_xcc, %r0 + 51
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 620: LDX_R	ldx	[%r31 + %r0], %r16
splash_cmpr_4_341:
	setx 0x6b0b13270d0ba7b5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 621: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0c004a0  ! 622: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
	.word 0xe137e176  ! 623: STQF_I	-	%f16, [0x0176, %r31]
change_to_randtl_4_342:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_342:
	.word 0x8f902001  ! 624: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_4_343:
	taddcctv %r19, 0x1b3f, %r2
	.word 0xe007e176  ! 625: LDUW_I	lduw	[%r31 + 0x0176], %r16
	.word 0xa3a0cd30  ! 626: FsMULd	fsmuld	%f3, %f16, %f48
splash_tba_4_344:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 627: WRPR_TBA_R	wrpr	%r0, %r2, %tba
pmu_4_345:
	nop
	setx 0xfffffcd0fffffd40, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01964  ! 629: FqTOd	dis not found

	.word 0xad82e0b5  ! 630: WR_SOFTINT_REG_I	wr	%r11, 0x00b5, %softint
	.word 0xd447c000  ! 631: LDSW_R	ldsw	[%r31 + %r0], %r10
	.word 0x93902004  ! 632: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_4_347:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 633: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_348
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_348
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_348:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 634: RDPC	rd	%pc, %r17
DS_4_349:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x99a4c9cd  ! 1: FDIVd	fdivd	%f50, %f44, %f12
	normalw
	.word 0xa9458000  ! 635: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0x99464000  ! 636: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0xd2800aa0  ! 637: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r9
	.word 0x93500000  ! 638: RDPR_TPC	<illegal instruction>
tagged_4_350:
	tsubcctv %r18, 0x1e99, %r10
	.word 0xe807fb6a  ! 639: LDUW_I	lduw	[%r31 + 0xfffffb6a], %r20
	.word 0xa1902007  ! 640: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	setx 0x89c6509eeb9f4cd8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_351:
	.word 0x39400001  ! 641: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_4_352:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 642: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_4_353:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 643: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_354
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_354
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_354:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 644: RDPC	rd	%pc, %r17
	.word 0xda8008a0  ! 645: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x91454000  ! 646: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0x93902006  ! 647: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_cmpr_4_355:
	setx 0xbf0048798b7efbe0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 648: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02032  ! 649: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_4_356:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 650: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd81ffb6a  ! 651: LDD_I	ldd	[%r31 + 0xfffffb6a], %r12
mondo_4_357:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d924007  ! 652: WRPR_WSTATE_R	wrpr	%r9, %r7, %wstate
	.word 0x87902071  ! 653: WRPR_TT_I	wrpr	%r0, 0x0071, %tt
	.word 0x87902095  ! 654: WRPR_TT_I	wrpr	%r0, 0x0095, %tt
	.word 0x93480000  ! 655: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x87902317  ! 656: WRPR_TT_I	wrpr	%r0, 0x0317, %tt
	.word 0x87802020  ! 657: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8d802000  ! 658: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802004  ! 659: WRASI_I	wr	%r0, 0x0004, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_358)) -> intp(1,0,8)
intvec_4_358:
	.word 0x39400001  ! 660: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_359:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 661: SAVE_R	save	%r31, %r0, %r31
	.word 0xa1540000  ! 662: RDPR_GL	<illegal instruction>
debug_4_360:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_360:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_360
    nop
debug_wait4_360:
    ld [%r23], %r2
    brnz %r2, debug_wait4_360
    nop
    ba,a debug_startwait4_360
continue_debug_4_360:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_360:
    cmp %r13, %r15
    bne,a wait_for_stat_4_360
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_360:
    cmp %r14, %r15
    bne,a wait_for_debug_4_360
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00852  ! 663: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
debug_4_361:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 664: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xda1fc000  ! 665: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x99b14ff2  ! 666: FONES	e	%f12
	.word 0xe68008a0  ! 667: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe6dfe000  ! 668: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r19
	.word 0x87802010  ! 669: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x93902001  ! 670: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_randtl_4_362:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_362:
	.word 0x8f902000  ! 671: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93a01a71  ! 672: FqTOi	fqtoi	
	.word 0xe48fe020  ! 673: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r18
	.word 0xe4900e60  ! 674: LDUHA_R	lduha	[%r0, %r0] 0x73, %r18
	.word 0x8d90395b  ! 675: WRPR_PSTATE_I	wrpr	%r0, 0x195b, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01968  ! 676: FqTOd	dis not found

	.word 0xd89fc020  ! 677: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0x93902003  ! 678: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
mondo_4_364:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d950014  ! 679: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	.word 0xd89004a0  ! 680: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
mondo_4_365:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d90c002  ! 681: WRPR_WSTATE_R	wrpr	%r3, %r2, %wstate
splash_cmpr_4_366:
	setx 0x02bbe5bb0ed86975, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 682: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 683: LDX_R	ldx	[%r31 + %r0], %r12
DS_4_367:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 684: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x87802016  ! 685: WRASI_I	wr	%r0, 0x0016, %asi
intveclr_4_368:
	setx 0xdb7824988680ff55, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 686: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196d  ! 687: FqTOd	dis not found

splash_lsu_4_370:
	setx 0x53451fba87ca0503, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 688: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_4_371:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 689: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 690: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x93902006  ! 691: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01972  ! 692: FqTOd	dis not found

	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 693: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0xcc1b0a2e14b2a496, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_373:
	.word 0x39400001  ! 694: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d804a0  ! 695: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
splash_hpstate_4_374:
	.word 0x81982147  ! 696: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0147, %hpstate
	.word 0x93d020b3  ! 697: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0xd48fe010  ! 698: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0x9b450000  ! 699: RD_SET_SOFTINT	rd	%set_softint, %r13
change_to_randtl_4_375:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_375:
	.word 0x8f902001  ! 700: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_4_376:
	setx 0xdc0b86f4fce0868c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 701: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_4_377:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_377:
	.word 0x8f902003  ! 702: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
change_to_randtl_4_378:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_378:
	.word 0x8f902001  ! 703: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_4_379:
	taddcctv %r19, 0x12d0, %r13
	.word 0xd607fb6a  ! 704: LDUW_I	lduw	[%r31 + 0xfffffb6a], %r11
	.word 0xd6d804a0  ! 705: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936975ab  ! 706: SDIVX_I	sdivx	%r5, 0xfffff5ab, %r9
	.word 0x87802063  ! 707: WRASI_I	wr	%r0, 0x0063, %asi
change_to_randtl_4_381:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_381:
	.word 0x8f902003  ! 708: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
change_to_randtl_4_382:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_382:
	.word 0x8f902001  ! 709: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 710: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87902271  ! 711: WRPR_TT_I	wrpr	%r0, 0x0271, %tt
	.word 0x879021ce  ! 712: WRPR_TT_I	wrpr	%r0, 0x01ce, %tt
debug_4_383:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 713: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4dfe010  ! 714: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r10
	.word 0x99902005  ! 715: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x93902002  ! 716: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_hpstate_4_384:
	.word 0x8198223d  ! 717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x023d, %hpstate
splash_tba_4_385:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 718: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_4_386:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 719: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_4_387:
	set 0x00380000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 720: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x97450000  ! 721: RD_SET_SOFTINT	rd	%set_softint, %r11
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 722: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd81ffa75  ! 723: LDD_I	ldd	[%r31 + 0xfffffa75], %r12
	.word 0x8d9029c2  ! 724: WRPR_PSTATE_I	wrpr	%r0, 0x09c2, %pstate
	.word 0x9192b1d4  ! 725: WRPR_PIL_I	wrpr	%r10, 0x11d4, %pil
mondo_4_388:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d930006  ! 726: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
tagged_4_389:
	taddcctv %r8, 0x1c17, %r21
	.word 0xd807f31f  ! 727: LDUW_I	lduw	[%r31 + 0xfffff31f], %r12
DS_4_390:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xab4dc360	! Random illegal ?
	.word 0x93a1c9d0  ! 1: FDIVd	fdivd	%f38, %f16, %f40
	.word 0x95a4c822  ! 728: FADDs	fadds	%f19, %f2, %f10
	.word 0x99520000  ! 729: RDPR_PIL	<illegal instruction>
	.word 0x2a700001  ! 730: BPCS	<illegal instruction>
splash_cmpr_4_391:
	setx 0xf3bc9f75d0bff63e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 731: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_392:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 732: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d020b4  ! 733: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_cmpr_4_393:
	setx 0xb2ef06057cfbb7e2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 734: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93682bf3  ! 735: SDIVX_I	sdivx	%r0, 0x0bf3, %r9
	rd %pc, %r19
	add %r19, (ivw_4_395-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_395:
	.word 0xa7a00163  ! 736: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01969  ! 737: FqTOd	dis not found

	setx 0xd16a64f3237831d0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_397:
	.word 0x39400001  ! 738: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_4_398:
	setx 0xf14a10e5e41b2ad9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 739: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9b520000  ! 740: RDPR_PIL	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16a7e3b  ! 741: SDIVX_I	sdivx	%r9, 0xfffffe3b, %r16
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_400
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_400
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_400:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 742: RDPC	rd	%pc, %r19
debug_4_401:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 743: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9b540000  ! 744: RDPR_GL	<illegal instruction>
	.word 0x8d802000  ! 745: WRFPRS_I	wr	%r0, 0x0000, %fprs
    set sync_thr_counter1, %r23
    mov 4, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_402
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_402
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_402:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 746: RDPC	rd	%pc, %r18
splash_tba_4_403:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 747: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_4_404:
	setx 0x70b137739d4be08b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 748: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_405:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d934010  ! 749: WRPR_WSTATE_R	wrpr	%r13, %r16, %wstate
	.word 0x3c800001  ! 750: BPOS	bpos,a	<label_0x1>
DS_4_406:
	.word 0xa3a089c0  ! 1: FDIVd	fdivd	%f2, %f0, %f48
	.word 0xbfe7c000  ! 751: SAVE_R	save	%r31, %r0, %r31
mondo_4_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d934011  ! 752: WRPR_WSTATE_R	wrpr	%r13, %r17, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9968aeae  ! 753: SDIVX_I	sdivx	%r2, 0x0eae, %r12
	.word 0x9350c000  ! 754: RDPR_TT	rdpr	%tt, %r9
	.word 0x87802058  ! 755: WRASI_I	wr	%r0, 0x0058, %asi
tagged_4_409:
	taddcctv %r8, 0x149b, %r5
	.word 0xd607e3d0  ! 756: LDUW_I	lduw	[%r31 + 0x03d0], %r11
	.word 0xd6d7e010  ! 757: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r11
	.word 0x9550c000  ! 758: RDPR_TT	<illegal instruction>
mondo_4_410:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d94800d  ! 759: WRPR_WSTATE_R	wrpr	%r18, %r13, %wstate
splash_lsu_4_411:
	setx 0x58aca0aeef2631f7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 760: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_412:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d924006  ! 761: WRPR_WSTATE_R	wrpr	%r9, %r6, %wstate
	.word 0x99480000  ! 762: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x93540000  ! 763: RDPR_GL	<illegal instruction>
change_to_randtl_4_413:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_413:
	.word 0x8f902000  ! 764: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
mondo_4_414:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d94800b  ! 765: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
debug_4_415:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 766: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_4_416:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d950003  ! 767: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
	.word 0xe2d7e000  ! 768: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r17
debug_4_417:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_417:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_417
    nop
debug_wait4_417:
    ld [%r23], %r2
    brnz %r2, debug_wait4_417
    nop
    ba,a debug_startwait4_417
continue_debug_4_417:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_417:
    cmp %r13, %r15
    bne,a wait_for_stat_4_417
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_417:
    cmp %r14, %r15
    bne,a wait_for_debug_4_417
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd2f00852  ! 769: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0x87802010  ! 770: WRASI_I	wr	%r0, 0x0010, %asi
splash_cmpr_4_418:
	setx 0xfb021b81fbcd2d4a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 771: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02033  ! 772: Tcc_I	tne	icc_or_xcc, %r0 + 51
!$EV trig_pc_d(1, @VA(.MAIN.xir_4_419)) -> intp(4,1,3)
xir_4_419:
	.word 0xa9833def  ! 773: WR_SET_SOFTINT_I	wr	%r12, 0x1def, %set_softint
	.word 0xe20fc000  ! 774: LDUB_R	ldub	[%r31 + %r0], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 775: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_4_420:
	.word 0x819822c4  ! 776: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c4, %hpstate
	.word 0x91d02035  ! 777: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_4_421:
	taddcctv %r2, 0x18a4, %r23
	.word 0xe207f180  ! 778: LDUW_I	lduw	[%r31 + 0xfffff180], %r17
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 779: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_4_422:
	setx 0x093ebdf9847b45ea, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 780: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1500000  ! 781: RDPR_TPC	<illegal instruction>
debug_4_423:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_423:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_423
    nop
debug_wait4_423:
    ld [%r23], %r2
    brnz %r2, debug_wait4_423
    nop
    ba,a debug_startwait4_423
continue_debug_4_423:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_423:
    cmp %r13, %r15
    bne,a wait_for_stat_4_423
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_423:
    cmp %r14, %r15
    bne,a wait_for_debug_4_423
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %19, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd8f00852  ! 782: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
debug_4_424:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 783: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa569b589  ! 784: SDIVX_I	sdivx	%r6, 0xfffff589, %r18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956caf07  ! 785: SDIVX_I	sdivx	%r18, 0x0f07, %r10
	.word 0xd137c000  ! 786: STQF_R	-	%f8, [%r0, %r31]
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 787: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_4_427:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d934010  ! 788: WRPR_WSTATE_R	wrpr	%r13, %r16, %wstate
donret_4_428:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_428-donret_4_428), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_428:
	.word 0xd0fff5af  ! 789: SWAPA_I	swapa	%r8, [%r31 + 0xfffff5af] %asi
	.word 0xd127c000  ! 790: STF_R	st	%f8, [%r0, %r31]
	.word 0x9745c000  ! 791: RD_TICK_CMPR_REG	rd	%-, %r11
mondo_4_429:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d90c00b  ! 792: WRPR_WSTATE_R	wrpr	%r3, %r11, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01971  ! 793: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 794: LDX_R	ldx	[%r31 + %r0], %r11
splash_cmpr_4_431:
	setx 0x06170db217f68d7c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 795: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_432:
	setx 0xbb7f5b6ffeabbf7b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 796: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 797: BPNE	<illegal instruction>
	.word 0x93902005  ! 798: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_4_433:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 1: LDX_R	ldx	[%r31 + %r0], %r17
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_0
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_0:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 2: RDPC	rd	%pc, %r19
	.word 0xd28fe000  ! 3: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r9
	.word 0x91d020b4  ! 4: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_cmpr_3_1:
	setx 0x10f38483a3016fe5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 5: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 6: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01967  ! 7: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 8: LDX_R	ldx	[%r31 + %r0], %r17
debug_3_3:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 9: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0xe2d004a0  ! 10: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0x8790231e  ! 11: WRPR_TT_I	wrpr	%r0, 0x031e, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976c2ff1  ! 12: SDIVX_I	sdivx	%r16, 0x0ff1, %r11
debug_3_5:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 13: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_3_6:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 14: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
splash_cmpr_3_7:
	setx 0xb2ed60bb5c63512f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 15: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56b6aeb  ! 16: SDIVX_I	sdivx	%r13, 0x0aeb, %r18
splash_cmpr_3_9:
	setx 0x97852f6aafccb2ab, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 17: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879020a7  ! 18: WRPR_TT_I	wrpr	%r0, 0x00a7, %tt
change_to_randtl_3_10:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_10:
	.word 0x8f902000  ! 19: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
donret_3_11:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_11-donret_3_11), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_11:
	.word 0xe2ffe750  ! 20: SWAPA_I	swapa	%r17, [%r31 + 0x0750] %asi
change_to_randtl_3_12:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_12:
	.word 0x8f902000  ! 21: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_3_13:
	taddcctv %r10, 0x15fd, %r4
	.word 0xe207e750  ! 22: LDUW_I	lduw	[%r31 + 0x0750], %r17
	.word 0x22700001  ! 23: BPE	<illegal instruction>
	.word 0x9345c000  ! 24: RD_TICK_CMPR_REG	rd	%-, %r9
mondo_3_14:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d950010  ! 25: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
	.word 0x83d02034  ! 26: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8780201c  ! 27: WRASI_I	wr	%r0, 0x001c, %asi
intveclr_3_15:
	setx 0xf38c0c2846c2f577, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8cfe020  ! 29: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
	.word 0xa1902001  ! 30: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_lsu_3_16:
	setx 0xa4cedff2e88e1ca9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 31: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 32: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_3_17:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d934004  ! 33: WRPR_WSTATE_R	wrpr	%r13, %r4, %wstate
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 34: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_hpstate_3_18:
	.word 0x81982306  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0306, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 36: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa1480000  ! 37: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
splash_lsu_3_19:
	setx 0xfef8045984097f11, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 38: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 39: RD_STICK_REG	stbar
	.word 0x81510000  ! 40: RDPR_TICK	rdpr	%tick, %r0
tagged_3_20:
	tsubcctv %r10, 0x1022, %r12
	.word 0xd807e750  ! 41: LDUW_I	lduw	[%r31 + 0x0750], %r12
splash_lsu_3_21:
	setx 0x055e173aac5c2155, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 42: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_3_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d934004  ! 43: WRPR_WSTATE_R	wrpr	%r13, %r4, %wstate
	.word 0xa1902004  ! 44: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xa24c0007  ! 45: MULX_R	mulx 	%r16, %r7, %r17
	.word 0x95450000  ! 46: RD_SET_SOFTINT	rd	%set_softint, %r10
intveclr_3_23:
	setx 0x7af39df7b107a033, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 47: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_24)) -> intp(1,0,26)
intvec_3_24:
	.word 0x39400001  ! 48: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902054  ! 49: WRPR_TT_I	wrpr	%r0, 0x0054, %tt
debug_3_25:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 50: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_3_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d920013  ! 51: WRPR_WSTATE_R	wrpr	%r8, %r19, %wstate
	.word 0x87902287  ! 52: WRPR_TT_I	wrpr	%r0, 0x0287, %tt
	.word 0x91a4c9c8  ! 53: FDIVd	fdivd	%f50, %f8, %f8
splash_hpstate_3_27:
	.word 0x81982dc6  ! 54: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc6, %hpstate
	.word 0x87802063  ! 55: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x91d02035  ! 56: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x3e700001  ! 57: BPVC	<illegal instruction>
	.word 0xe60fc000  ! 58: LDUB_R	ldub	[%r31 + %r0], %r19
	rd %pc, %r19
	add %r19, (ivw_3_28-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_28:
	.word 0x9ba00168  ! 59: FABSq	dis not found

	.word 0xd48fe020  ! 60: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	.word 0xd4c7e030  ! 61: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
DS_3_29:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 62: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
splash_tba_3_30:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 63: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_3_31:
	setx 0xf33a148cdb772d7a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 64: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_32:
	setx 0x1f04d9f08c95a9c8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 65: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_3_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d918011  ! 66: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
debug_3_34:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 67: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_3_35:
	.word 0x81982e4e  ! 68: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4e, %hpstate
intveclr_3_36:
	setx 0xecd9f2010895252d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9026b5  ! 70: WRPR_PSTATE_I	wrpr	%r0, 0x06b5, %pstate
splash_cmpr_3_37:
	setx 0x2fc9b6da3c15ac95, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 71: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_3_38:
	nop
	setx 0xfffffa72fffff7fd, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_3_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d90c001  ! 73: WRPR_WSTATE_R	wrpr	%r3, %r1, %wstate
	rd %pc, %r19
	add %r19, (ivw_3_40-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_40:
	.word 0x91a00161  ! 74: FABSq	dis not found

pmu_3_41:
	nop
	setx 0xffffff2efffffe42, %g1, %g7
	.word 0xa3800007  ! 75: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd02fe750  ! 76: STB_I	stb	%r8, [%r31 + 0x0750]
splash_cmpr_3_42:
	setx 0xcb133afa702b46cb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 77: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3c700001  ! 78: BPPOS	<illegal instruction>
debug_3_43:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 79: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_3_44:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 80: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd08008a0  ! 81: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	rd %pc, %r19
	add %r19, (ivw_3_45-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_45:
	.word 0x91a00161  ! 82: FABSq	dis not found

splash_lsu_3_46:
	setx 0x5a6cde5a40982283, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 83: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_3_47:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_47:
	.word 0x8f902002  ! 84: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 85: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802080  ! 86: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x91953ea2  ! 87: WRPR_PIL_I	wrpr	%r20, 0x1ea2, %pil
	.word 0xd69004a0  ! 88: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0xa1902000  ! 89: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xd6c004a0  ! 90: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
mondo_3_48:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d924006  ! 91: WRPR_WSTATE_R	wrpr	%r9, %r6, %wstate
splash_cmpr_3_49:
	setx 0xefe0886c3d6e11de, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 92: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d020b3  ! 93: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0x87802014  ! 94: WRASI_I	wr	%r0, 0x0014, %asi
mondo_3_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d94c001  ! 95: WRPR_WSTATE_R	wrpr	%r19, %r1, %wstate
	.word 0xd6dfe020  ! 96: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r11
	.word 0x93902004  ! 97: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
change_to_randtl_3_51:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_51:
	.word 0x8f902003  ! 98: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
change_to_randtl_3_52:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_52:
	.word 0x8f902001  ! 99: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d9025c1  ! 100: WRPR_PSTATE_I	wrpr	%r0, 0x05c1, %pstate
	.word 0x83d02033  ! 101: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xd73fc000  ! 102: STDF_R	std	%f11, [%r0, %r31]
	.word 0xa984c004  ! 103: WR_SET_SOFTINT_R	wr	%r19, %r4, %set_softint
	.word 0xa1902002  ! 104: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8790209b  ! 105: WRPR_TT_I	wrpr	%r0, 0x009b, %tt
debug_3_53:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 106: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_3_54-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_54:
	.word 0xa1a00165  ! 107: FABSq	dis not found

splash_lsu_3_55:
	setx 0x2f1b2c02252793f1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 108: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 109: SIAM	siam	1
debug_3_56:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 110: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_3_57:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_57-donret_3_57), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_57:
	.word 0xd8fff234  ! 111: SWAPA_I	swapa	%r12, [%r31 + 0xfffff234] %asi
DS_3_58:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x8f6fe460	! Random illegal ?
	.word 0x95a00554  ! 1: FSQRTd	fsqrt	
	.word 0x97a00834  ! 112: FADDs	fadds	%f0, %f20, %f11
splash_tba_3_59:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 113: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93a309e5  ! 114: FDIVq	dis not found

	.word 0xd4d00e80  ! 115: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 116: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16a7721  ! 117: SDIVX_I	sdivx	%r9, 0xfffff721, %r16
intveclr_3_61:
	setx 0x449d4306f33f4d57, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 118: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 119: SIAM	siam	1
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 120: LDX_R	ldx	[%r31 + %r0], %r13
tagged_3_62:
	tsubcctv %r6, 0x13a1, %r2
	.word 0xda07e1f9  ! 121: LDUW_I	lduw	[%r31 + 0x01f9], %r13
	.word 0xda57c000  ! 122: LDSH_R	ldsh	[%r31 + %r0], %r13
tagged_3_63:
	taddcctv %r9, 0x1426, %r16
	.word 0xda07e1f9  ! 123: LDUW_I	lduw	[%r31 + 0x01f9], %r13
	.word 0xdac004a0  ! 124: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
donret_3_64:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_64-donret_3_64), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_64:
	.word 0xdaffe1f9  ! 125: SWAPA_I	swapa	%r13, [%r31 + 0x01f9] %asi
	.word 0xdacfe020  ! 126: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r13
mondo_3_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d910014  ! 127: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
splash_cmpr_3_66:
	setx 0xf05819185caec499, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 128: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_3_67:
	.word 0x81982705  ! 129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0705, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_3_68)) -> intp(3,1,3)
xir_3_68:
	.word 0xa982ad31  ! 130: WR_SET_SOFTINT_I	wr	%r10, 0x0d31, %set_softint
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01967  ! 131: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_70)) -> intp(2,0,16)
intvec_3_70:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 133: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x83d02033  ! 134: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xd48008a0  ! 135: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
debug_3_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 136: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_3_72:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_72-donret_3_72), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_72:
	.word 0xd4fff312  ! 137: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
splash_lsu_3_73:
	setx 0xf41c42ab7aa0be6b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 138: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_3_74:
	setx 0xa5d4d9cf19f8ab13, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 139: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 140: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x9ba01a70  ! 141: FqTOi	fqtoi	
tagged_3_75:
	taddcctv %r13, 0x183c, %r24
	.word 0xe207f312  ! 142: LDUW_I	lduw	[%r31 + 0xfffff312], %r17
splash_hpstate_3_76:
	.word 0x819821c7  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c7, %hpstate
	.word 0xa3454000  ! 144: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
splash_htba_3_77:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 145: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_3_78:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 146: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_3_79:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 147: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_80)) -> intp(0,0,30)
intvec_3_80:
	.word 0x39400001  ! 148: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_3_81:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 149: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_3_82:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_82:
	.word 0x8f902001  ! 150: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_3_83:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 151: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x83d020b2  ! 152: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0x8d903d25  ! 153: WRPR_PSTATE_I	wrpr	%r0, 0x1d25, %pstate
	.word 0x9150c000  ! 154: RDPR_TT	<illegal instruction>
DS_3_84:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 155: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_3_85:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 156: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802080  ! 157: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x91d02035  ! 158: Tcc_I	ta	icc_or_xcc, %r0 + 53
intveclr_3_86:
	setx 0x874291331c5cf0eb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 159: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_3_87:
	taddcctv %r25, 0x1581, %r5
	.word 0xe607f312  ! 160: LDUW_I	lduw	[%r31 + 0xfffff312], %r19
mondo_3_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d91c007  ! 161: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
splash_tba_3_89:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 162: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_3_90:
	.word 0x8198235d  ! 163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035d, %hpstate
splash_cmpr_3_91:
	setx 0x7da1cf90242140b7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 164: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe71fc000  ! 165: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x93902003  ! 166: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_3_92:
	.word 0x99a189d3  ! 1: FDIVd	fdivd	%f6, %f50, %f12
	.word 0xc341ac36	! Random illegal ?
	.word 0x91a00552  ! 1: FSQRTd	fsqrt	
	.word 0x9ba0482a  ! 167: FADDs	fadds	%f1, %f10, %f13
	.word 0xa1902007  ! 168: WRPR_GL_I	wrpr	%r0, 0x0007, %-
donret_3_93:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_93-donret_3_93), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_93:
	.word 0xd4fff312  ! 169: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
	.word 0x93902006  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
donret_3_94:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_94-donret_3_94), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_94:
	.word 0xd4fff312  ! 171: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
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
	.word 0xa3414000  ! 172: RDPC	rd	%pc, %r17
	.word 0xd0dfe000  ! 173: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r8
	.word 0xa1902005  ! 174: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xd127c000  ! 175: STF_R	st	%f8, [%r0, %r31]
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 176: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_3_96:
	setx 0xe451942999cf2450, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 177: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903a7b  ! 178: WRPR_PSTATE_I	wrpr	%r0, 0x1a7b, %pstate
	.word 0x97480000  ! 179: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xd2800ae0  ! 180: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r9
	.word 0x93d02035  ! 181: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x81510000  ! 182: RDPR_TICK	rdpr	%tick, %r0
mondo_3_97:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d904000  ! 183: WRPR_WSTATE_R	wrpr	%r1, %r0, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_98)) -> intp(6,0,14)
intvec_3_98:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_3_99:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_99:
	.word 0x8f902000  ! 185: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902002  ! 186: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 187: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_3_100:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_100:
	.word 0x8f902001  ! 188: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d802004  ! 189: WRFPRS_I	wr	%r0, 0x0004, %fprs
intveclr_3_101:
	setx 0x2cf88238985e4cf4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 190: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01973  ! 191: FqTOd	dis not found

	setx 0x2eeeafe330428194, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_103:
	.word 0x39400001  ! 192: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0880e80  ! 193: LDUBA_R	lduba	[%r0, %r0] 0x74, %r8
mondo_3_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d92c006  ! 194: WRPR_WSTATE_R	wrpr	%r11, %r6, %wstate
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 195: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd0900e80  ! 196: LDUHA_R	lduha	[%r0, %r0] 0x74, %r8
	.word 0xd06ff312  ! 197: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff312]
change_to_randtl_3_105:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_105:
	.word 0x8f902003  ! 198: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_cmpr_3_106:
	setx 0x3bcf5bfe2445c334, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 199: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802016  ! 200: WRASI_I	wr	%r0, 0x0016, %asi
	rd %pc, %r19
	add %r19, (ivw_3_107-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_107:
	.word 0x95a0016d  ! 201: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91697d10  ! 202: SDIVX_I	sdivx	%r5, 0xfffffd10, %r8
	.word 0xd6d00e60  ! 203: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r11
splash_hpstate_3_109:
	.word 0x81982506  ! 204: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0506, %hpstate
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 205: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_3_110:
	.word 0x97a489c1  ! 1: FDIVd	fdivd	%f18, %f32, %f42
	.word 0xbfe7c000  ! 206: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_3_111:
	setx 0x52f2ad52b211e7fd, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 208: LDX_R	ldx	[%r31 + %r0], %r11
splash_tba_3_112:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 209: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_3_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 210: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd727c000  ! 211: STF_R	st	%f11, [%r0, %r31]
	.word 0xa9840006  ! 212: WR_SET_SOFTINT_R	wr	%r16, %r6, %set_softint
mondo_3_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d95000c  ! 213: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
mondo_3_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d908008  ! 214: WRPR_WSTATE_R	wrpr	%r2, %r8, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01969  ! 215: FqTOd	dis not found

	.word 0x98fc4000  ! 216: SDIVcc_R	sdivcc 	%r17, %r0, %r12
	.word 0xa1902003  ! 217: WRPR_GL_I	wrpr	%r0, 0x0003, %-
mondo_3_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d928011  ! 218: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
	.word 0xe48008a0  ! 219: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe4bfc020  ! 220: STDA_R	stda	%r18, [%r31 + %r0] 0x01
tagged_3_118:
	tsubcctv %r15, 0x10f2, %r13
	.word 0xe407f661  ! 221: LDUW_I	lduw	[%r31 + 0xfffff661], %r18
	.word 0x879021df  ! 222: WRPR_TT_I	wrpr	%r0, 0x01df, %tt
	.word 0xe4d7e000  ! 223: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r18
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
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
	.word 0x99414000  ! 224: RDPC	rd	%pc, %r12
	rd %pc, %r19
	add %r19, (ivw_3_120-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_120:
	.word 0xa1a00161  ! 225: FABSq	dis not found

donret_3_121:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_121-donret_3_121), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_121:
	.word 0xd2fff661  ! 226: SWAPA_I	swapa	%r9, [%r31 + 0xfffff661] %asi
	.word 0xa9830010  ! 227: WR_SET_SOFTINT_R	wr	%r12, %r16, %set_softint
	.word 0x9648c008  ! 228: MULX_R	mulx 	%r3, %r8, %r11
splash_lsu_3_122:
	setx 0xff9f5a396354b791, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 229: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x3b00216986713b50, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_123:
	.word 0x39400001  ! 230: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe21ff661  ! 231: LDD_I	ldd	[%r31 + 0xfffff661], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 232: LDX_R	ldx	[%r31 + %r0], %r17
DS_3_124:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 233: SAVE_R	save	%r31, %r0, %r31
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 234: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_3_125:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 235: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_126)) -> intp(5,0,21)
intvec_3_126:
	.word 0x39400001  ! 236: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_3_127:
	setx 0x19f57f5e8cb118e7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_3_128-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_128:
	.word 0x99a00172  ! 238: FABSq	dis not found

	.word 0xd69ff661  ! 239: LDDA_I	ldda	[%r31, + 0xfffff661] %asi, %r11
DS_3_129:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe932c006  ! 1: STQF_R	-	%f20, [%r6, %r11]
	normalw
	.word 0x9b458000  ! 240: RD_SOFTINT_REG	rd	%softint, %r13
splash_lsu_3_130:
	setx 0x54f23fcef1f07f29, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 241: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2c804a0  ! 242: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
splash_tba_3_131:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 243: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902004  ! 244: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xe2d004a0  ! 245: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0xe2d004a0  ! 246: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0x97520000  ! 247: RDPR_PIL	<illegal instruction>
tagged_3_132:
	tsubcctv %r6, 0x10ce, %r12
	.word 0xe607f661  ! 248: LDUW_I	lduw	[%r31 + 0xfffff661], %r19
debug_3_133:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 249: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe727c000  ! 250: STF_R	st	%f19, [%r0, %r31]
splash_lsu_3_134:
	setx 0xa2d4343cdb9b6a3f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 251: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x32800001  ! 252: BNE	bne,a	<label_0x1>
	.word 0xe6d804a0  ! 253: LDXA_R	ldxa	[%r0, %r0] 0x25, %r19
	.word 0xe66ff661  ! 254: LDSTUB_I	ldstub	%r19, [%r31 + 0xfffff661]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01971  ! 255: FqTOd	dis not found

	.word 0x8d902d9a  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x0d9a, %pstate
splash_hpstate_3_136:
	.word 0x81982214  ! 257: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0214, %hpstate
	.word 0x97a18dd3  ! 258: FdMULq	fdmulq	
	.word 0x93902004  ! 259: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
mondo_3_137:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d910009  ! 260: WRPR_WSTATE_R	wrpr	%r4, %r9, %wstate
	.word 0xe2900e40  ! 261: LDUHA_R	lduha	[%r0, %r0] 0x72, %r17
mondo_3_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d91400a  ! 262: WRPR_WSTATE_R	wrpr	%r5, %r10, %wstate
	.word 0x87802088  ! 263: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87802063  ! 264: WRASI_I	wr	%r0, 0x0063, %asi
mondo_3_139:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d950007  ! 265: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
mondo_3_140:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d91800c  ! 266: WRPR_WSTATE_R	wrpr	%r6, %r12, %wstate
debug_3_141:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 267: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0x8d903b10  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x1b10, %pstate
debug_3_142:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 269: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab818003  ! 270: WR_CLEAR_SOFTINT_R	wr	%r6, %r3, %clear_softint
debug_3_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 271: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1902001  ! 272: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 273: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01964  ! 274: FqTOd	dis not found

tagged_3_145:
	taddcctv %r16, 0x1c71, %r10
	.word 0xd407f661  ! 275: LDUW_I	lduw	[%r31 + 0xfffff661], %r10
splash_cmpr_3_146:
	setx 0x1b0620e77bb9d215, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 276: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9038b1  ! 277: WRPR_PSTATE_I	wrpr	%r0, 0x18b1, %pstate
splash_tba_3_147:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 278: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_3_148:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 279: RESTORE_R	restore	%r31, %r0, %r31
mondo_3_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d908005  ! 280: WRPR_WSTATE_R	wrpr	%r2, %r5, %wstate
splash_lsu_3_150:
	setx 0xf33a7ab0f2483cb1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 281: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879020e2  ! 282: WRPR_TT_I	wrpr	%r0, 0x00e2, %tt
	setx 0x43f1055e1bf2a4fc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_151:
	.word 0x39400001  ! 283: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd40ff661  ! 284: LDUB_I	ldub	[%r31 + 0xfffff661], %r10
mondo_3_152:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d91c00b  ! 285: WRPR_WSTATE_R	wrpr	%r7, %r11, %wstate
	.word 0x8d902357  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x0357, %pstate
splash_tba_3_153:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 287: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879022d1  ! 288: WRPR_TT_I	wrpr	%r0, 0x02d1, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96a32b1  ! 289: SDIVX_I	sdivx	%r8, 0xfffff2b1, %r20
splash_tba_3_155:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 290: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_3_156:
	setx 0xbe76ccf687eb4c7b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 291: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0196b  ! 292: FqTOd	dis not found

splash_lsu_3_158:
	setx 0xce1c4149a6a5a573, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 293: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 294: RD_STICK_REG	stbar
splash_cmpr_3_159:
	setx 0x9826b27f3c50560d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_160:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 296: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902ea5  ! 297: WRPR_PSTATE_I	wrpr	%r0, 0x0ea5, %pstate
	.word 0x90f82abd  ! 298: SDIVcc_I	sdivcc 	%r0, 0x0abd, %r8
	.word 0xa9844007  ! 299: WR_SET_SOFTINT_R	wr	%r17, %r7, %set_softint
	.word 0xd08804a0  ! 300: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	setx 0x4fdecbb87332c9a9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_161:
	.word 0x39400001  ! 301: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0d80e40  ! 302: LDXA_R	ldxa	[%r0, %r0] 0x72, %r8
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_162)) -> intp(4,0,25)
intvec_3_162:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_3_163:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d934006  ! 304: WRPR_WSTATE_R	wrpr	%r13, %r6, %wstate
	.word 0xab84000d  ! 305: WR_CLEAR_SOFTINT_R	wr	%r16, %r13, %clear_softint
	.word 0xa1902000  ! 306: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 307: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a0196b  ! 308: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01969  ! 309: FqTOd	dis not found

	.word 0x87802088  ! 310: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87802010  ! 311: WRASI_I	wr	%r0, 0x0010, %asi
mondo_3_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d930006  ! 312: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
pmu_3_167:
	nop
	setx 0xfffff04efffffa89, %g1, %g7
	.word 0xa3800007  ! 313: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_3_168:
	setx 0x63b24a65eeae05f5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 314: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902277  ! 315: WRPR_TT_I	wrpr	%r0, 0x0277, %tt
	.word 0x9191af4d  ! 316: WRPR_PIL_I	wrpr	%r6, 0x0f4d, %pil
tagged_3_169:
	taddcctv %r15, 0x1059, %r19
	.word 0xd607ee91  ! 317: LDUW_I	lduw	[%r31 + 0x0e91], %r11
	.word 0x97a009c5  ! 318: FDIVd	fdivd	%f0, %f36, %f42
	.word 0xd06fee91  ! 319: LDSTUB_I	ldstub	%r8, [%r31 + 0x0e91]
	.word 0xd06fee91  ! 320: LDSTUB_I	ldstub	%r8, [%r31 + 0x0e91]
splash_tba_3_170:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 321: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa2c4b266  ! 322: ADDCcc_I	addccc 	%r18, 0xfffff266, %r17
splash_cmpr_3_171:
	setx 0x19f253e0b248feba, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 323: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802010  ! 324: WRASI_I	wr	%r0, 0x0010, %asi
	rd %pc, %r19
	add %r19, (ivw_3_172-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_172:
	.word 0x91a0016d  ! 325: FABSq	dis not found

	.word 0x93902005  ! 326: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_3_173:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 327: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_3_174:
	.word 0x81982dbf  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dbf, %hpstate
splash_tba_3_175:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 329: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_176:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 330: RDPC	rd	%pc, %r13
tagged_3_177:
	taddcctv %r15, 0x1f99, %r13
	.word 0xda07e697  ! 331: LDUW_I	lduw	[%r31 + 0x0697], %r13
	.word 0xda1fc000  ! 332: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x964b0009  ! 333: MULX_R	mulx 	%r12, %r9, %r11
	.word 0xe2dfe000  ! 334: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r17
change_to_randtl_3_178:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_178:
	.word 0x8f902000  ! 335: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_3_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 336: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_3_180:
	setx 0x675fbd19dae78aca, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902002  ! 338: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
mondo_3_181:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d914010  ! 339: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
donret_3_182:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_182-donret_3_182), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_182:
	.word 0xe2ffe697  ! 340: SWAPA_I	swapa	%r17, [%r31 + 0x0697] %asi
	.word 0xe26fe697  ! 341: LDSTUB_I	ldstub	%r17, [%r31 + 0x0697]
intveclr_3_183:
	setx 0xd2653a7b7751dc42, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 342: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_3_184:
	.word 0x81982197  ! 343: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0197, %hpstate
intveclr_3_185:
	setx 0xbc25ad81e783f700, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_186)) -> intp(0,0,11)
intvec_3_186:
	.word 0x39400001  ! 345: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfe010  ! 346: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r17
splash_tba_3_187:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 347: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902001  ! 348: WRPR_GL_I	wrpr	%r0, 0x0001, %-
change_to_randtl_3_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_188:
	.word 0x8f902000  ! 349: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	setx 0x46e732bd063e0797, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_189:
	.word 0x39400001  ! 350: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 351: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_190
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_190
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_190:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 352: RDPC	rd	%pc, %r12
	.word 0xe69fe697  ! 353: LDDA_I	ldda	[%r31, + 0x0697] %asi, %r19
	.word 0x87802080  ! 354: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xe647c000  ! 355: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0xe68804a0  ! 356: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
mondo_3_191:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d91c00b  ! 357: WRPR_WSTATE_R	wrpr	%r7, %r11, %wstate
pmu_3_192:
	nop
	setx 0xfffffe65fffffbb5, %g1, %g7
	.word 0xa3800007  ! 358: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_3_193-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_193:
	.word 0x95a00163  ! 359: FABSq	dis not found

splash_cmpr_3_194:
	setx 0xa5123bf1c5e7b5f0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 360: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9b540000  ! 361: RDPR_GL	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01962  ! 362: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 363: LDX_R	ldx	[%r31 + %r0], %r13
intveclr_3_196:
	setx 0xdd0e130617436d82, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 365: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01971  ! 366: FqTOd	dis not found

DS_3_198:
	.word 0x95a149c1  ! 1: FDIVd	fdivd	%f36, %f32, %f10
	.word 0x8369d134	! Random illegal ?
	.word 0xd1114007  ! 1: LDQF_R	-	[%r5, %r7], %f8
	.word 0x97a4882d  ! 367: FADDs	fadds	%f18, %f13, %f11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01968  ! 368: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.xir_3_200)) -> intp(3,1,3)
xir_3_200:
	.word 0xa982f321  ! 369: WR_SET_SOFTINT_I	wr	%r11, 0x1321, %set_softint
	.word 0x87802055  ! 370: WRASI_I	wr	%r0, 0x0055, %asi
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_201
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_201:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 371: RDPC	rd	%pc, %r13
	.word 0x99902005  ! 372: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x87802004  ! 373: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd4d804a0  ! 374: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
change_to_randtl_3_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_202:
	.word 0x8f902000  ! 375: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa9464000  ! 376: RD_STICK_CMPR_REG	rd	%-, %r20
DS_3_203:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 377: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe06ffe9a  ! 378: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffe9a]
	.word 0x93d020b5  ! 379: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x87802080  ! 380: WRASI_I	wr	%r0, 0x0080, %asi
splash_cmpr_3_204:
	setx 0xa73155f981ecd5c3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 381: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_3_205:
	.word 0x81982d15  ! 382: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d15, %hpstate
splash_cmpr_3_206:
	setx 0xceb02759ebc810a1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 383: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5480000  ! 384: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
tagged_3_207:
	taddcctv %r5, 0x1eb0, %r15
	.word 0xe407fe9a  ! 385: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r18
	.word 0xa190200c  ! 386: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xe527fe9a  ! 387: STF_I	st	%f18, [0x1e9a, %r31]
splash_cmpr_3_208:
	setx 0x54699febcaafa3c9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 388: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 389: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_3_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 390: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_3_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_210:
	.word 0x8f902002  ! 391: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe4d004a0  ! 392: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r18
debug_3_211:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 393: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe49ffe9a  ! 394: LDDA_I	ldda	[%r31, + 0xfffffe9a] %asi, %r18
	.word 0xe42ffe9a  ! 395: STB_I	stb	%r18, [%r31 + 0xfffffe9a]
	.word 0xe457fe9a  ! 396: LDSH_I	ldsh	[%r31 + 0xfffffe9a], %r18
DS_3_212:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x97a109c8  ! 1: FDIVd	fdivd	%f4, %f8, %f42
	normalw
	.word 0x93458000  ! 397: RD_SOFTINT_REG	rd	%softint, %r9
tagged_3_213:
	taddcctv %r22, 0x14e9, %r13
	.word 0xd607fe9a  ! 398: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r11
splash_hpstate_3_214:
	.word 0x81982257  ! 399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0257, %hpstate
	.word 0xd60fc000  ! 400: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0x87902247  ! 401: WRPR_TT_I	wrpr	%r0, 0x0247, %tt
splash_tba_3_215:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 402: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01974  ! 403: FqTOd	dis not found

debug_3_217:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 404: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd48008a0  ! 405: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_218:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 406: RDPC	rd	%pc, %r9
	rd %pc, %r19
	add %r19, (ivw_3_219-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_219:
	.word 0x9ba00167  ! 407: FABSq	dis not found

splash_htba_3_220:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 408: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
change_to_randtl_3_221:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_221:
	.word 0x8f902001  ! 409: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x87802014  ! 410: WRASI_I	wr	%r0, 0x0014, %asi
splash_cmpr_3_222:
	setx 0xd9f929de3e8b99e6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 411: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_3_223:
	nop
	setx 0xfffffdc0fffffbe2, %g1, %g7
	.word 0xa3800007  ! 412: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_3_224:
	tsubcctv %r14, 0x1945, %r17
	.word 0xe207fe9a  ! 413: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r17
mondo_3_225:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d90c009  ! 414: WRPR_WSTATE_R	wrpr	%r3, %r9, %wstate
splash_tba_3_226:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 415: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f802f7a  ! 416: SIR	sir	0x0f7a
splash_cmpr_3_227:
	setx 0x46cd78d762e36bfd, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 417: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7520000  ! 418: RDPR_PIL	<illegal instruction>
debug_3_228:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 419: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x83d02032  ! 420: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xdadfe030  ! 421: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
debug_3_229:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 422: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76a2ad1  ! 423: SDIVX_I	sdivx	%r8, 0x0ad1, %r19
	.word 0xd08fe010  ! 424: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r8
splash_hpstate_3_231:
	.word 0x819821ed  ! 425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01ed, %hpstate
mondo_3_232:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d91c013  ! 426: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
	.word 0xd08008a0  ! 427: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd057c000  ! 428: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01971  ! 429: FqTOd	dis not found

	rd %pc, %r19
	add %r19, (ivw_3_234-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_234:
	.word 0x99a00163  ! 430: FABSq	dis not found

	.word 0x93540000  ! 431: RDPR_GL	<illegal instruction>
	.word 0x9ad0e90d  ! 432: UMULcc_I	umulcc 	%r3, 0x090d, %r13
	.word 0x87802010  ! 433: WRASI_I	wr	%r0, 0x0010, %asi
splash_cmpr_3_235:
	setx 0x429201c9264028d8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 434: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_3_236:
	.word 0x819820ce  ! 435: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00ce, %hpstate
	.word 0xd0c00e80  ! 436: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r8
	.word 0xa9a009c6  ! 437: FDIVd	fdivd	%f0, %f6, %f20
tagged_3_237:
	taddcctv %r10, 0x1d32, %r18
	.word 0xd607f110  ! 438: LDUW_I	lduw	[%r31 + 0xfffff110], %r11
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_238)) -> intp(5,0,3)
intvec_3_238:
	.word 0x39400001  ! 439: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_3_239:
	setx 0xc0476d1ae553dcf2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6d80e60  ! 441: LDXA_R	ldxa	[%r0, %r0] 0x73, %r11
splash_cmpr_3_240:
	setx 0x1f7998c90c8e2b15, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 442: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01972  ! 443: FqTOd	dis not found

	.word 0xe6d7e010  ! 444: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r19
	.word 0x87802004  ! 445: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01965  ! 446: FqTOd	dis not found

	.word 0x91d020b5  ! 447: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_cmpr_3_243:
	setx 0xce16c349221b0a16, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9035e1  ! 449: WRPR_PSTATE_I	wrpr	%r0, 0x15e1, %pstate
change_to_randtl_3_244:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_244:
	.word 0x8f902000  ! 450: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	rd %pc, %r19
	add %r19, (ivw_3_245-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_245:
	.word 0x99a00172  ! 451: FABSq	dis not found

debug_3_246:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 452: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0x99a449d1  ! 453: FDIVd	fdivd	%f48, %f48, %f12
tagged_3_247:
	taddcctv %r1, 0x1b61, %r24
	.word 0xd407f110  ! 454: LDUW_I	lduw	[%r31 + 0xfffff110], %r10
	.word 0x87802004  ! 455: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd4800ae0  ! 456: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r10
debug_3_248:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 457: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	setx 0xc0b390c4a33a1d40, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_249:
	.word 0x39400001  ! 458: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91464000  ! 459: RD_STICK_CMPR_REG	rd	%-, %r8
!$EV trig_pc_d(1, @VA(.MAIN.xir_3_250)) -> intp(3,1,3)
xir_3_250:
	.word 0xa984e466  ! 460: WR_SET_SOFTINT_I	wr	%r19, 0x0466, %set_softint
intveclr_3_251:
	setx 0xaf7fc4d90dffd781, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 461: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_3_252:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 462: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
mondo_3_253:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d948014  ! 463: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
debug_3_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 464: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_255
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_255
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_255:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 465: RDPC	rd	%pc, %r20
change_to_randtl_3_256:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_256:
	.word 0x8f902001  ! 466: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x9f80220c  ! 467: SIR	sir	0x020c
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_257:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 468: RDPC	rd	%pc, %r13
debug_3_258:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 469: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
tagged_3_259:
	taddcctv %r13, 0x1b14, %r11
	.word 0xd407f2f6  ! 470: LDUW_I	lduw	[%r31 + 0xfffff2f6], %r10
	.word 0xa353c000  ! 471: RDPR_FQ	<illegal instruction>
	.word 0xd24ff2f6  ! 472: LDSB_I	ldsb	[%r31 + 0xfffff2f6], %r9
	.word 0x8d9031b0  ! 473: WRPR_PSTATE_I	wrpr	%r0, 0x11b0, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6cb8da  ! 474: SDIVX_I	sdivx	%r18, 0xfffff8da, %r13
splash_cmpr_3_261:
	setx 0xc69982519ae13c37, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 475: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_3_262:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_262:
	.word 0x8f902002  ! 476: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd697e030  ! 477: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r11
	.word 0x98faf55a  ! 478: SDIVcc_I	sdivcc 	%r11, 0xfffff55a, %r12
splash_cmpr_3_263:
	setx 0xb2fdfe9b55a16b0b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 479: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 480: LDX_R	ldx	[%r31 + %r0], %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 481: LDX_R	ldx	[%r31 + %r0], %r10
mondo_3_264:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d91c007  ! 482: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
splash_tba_3_265:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 483: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 484: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x87802088  ! 485: WRASI_I	wr	%r0, 0x0088, %asi
splash_tba_3_266:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 486: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd49fe208  ! 487: LDDA_I	ldda	[%r31, + 0x0208] %asi, %r10
debug_3_267:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 488: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0xa9818004  ! 489: WR_SET_SOFTINT_R	wr	%r6, %r4, %set_softint
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_268
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_268
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_268:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 490: RDPC	rd	%pc, %r10
	.word 0x8d802004  ! 491: WRFPRS_I	wr	%r0, 0x0004, %fprs
debug_3_269:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 492: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_3_270:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 493: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	setx 0xe8f652b9abf34670, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_271:
	.word 0x39400001  ! 494: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_3_272:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd3324009  ! 1: STQF_R	-	%f9, [%r9, %r9]
	normalw
	.word 0xa3458000  ! 495: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0xe6800b40  ! 496: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r19
debug_3_273:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 497: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 498: LDX_R	ldx	[%r31 + %r0], %r19
tagged_3_274:
	tsubcctv %r17, 0x1a49, %r7
	.word 0xe607e208  ! 499: LDUW_I	lduw	[%r31 + 0x0208], %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_3_275)) -> intp(3,1,3)
xir_3_275:
	.word 0xa981737a  ! 500: WR_SET_SOFTINT_I	wr	%r5, 0x137a, %set_softint
mondo_3_276:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d900013  ! 501: WRPR_WSTATE_R	wrpr	%r0, %r19, %wstate
splash_cmpr_3_277:
	setx 0x710efab28df2f3ad, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 502: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_3_278:
	tsubcctv %r5, 0x1776, %r16
	.word 0xe607f4d4  ! 503: LDUW_I	lduw	[%r31 + 0xfffff4d4], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 504: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xad832918  ! 505: WR_SOFTINT_REG_I	wr	%r12, 0x0918, %softint
	.word 0x87902016  ! 506: WRPR_TT_I	wrpr	%r0, 0x0016, %tt
	.word 0xe677c000  ! 507: STX_R	stx	%r19, [%r31 + %r0]
	rd %pc, %r19
	add %r19, (ivw_3_279-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_279:
	.word 0x99a00172  ! 508: FABSq	dis not found

DS_3_280:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 509: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_3_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_281:
	.word 0x8f902001  ! 510: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_282
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_282
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_282:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 511: RDPC	rd	%pc, %r16
splash_hpstate_3_283:
	.word 0x81982387  ! 512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0387, %hpstate
mondo_3_284:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d944009  ! 513: WRPR_WSTATE_R	wrpr	%r17, %r9, %wstate
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_285
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_285
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_285:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 514: RDPC	rd	%pc, %r19
	.word 0xe83fec34  ! 515: STD_I	std	%r20, [%r31 + 0x0c34]
debug_3_286:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 516: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_3_287:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_287:
	.word 0x8f902003  ! 517: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa9a349c1  ! 518: FDIVd	fdivd	%f44, %f32, %f20
mondo_3_288:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d924013  ! 519: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
mondo_3_289:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d910001  ! 520: WRPR_WSTATE_R	wrpr	%r4, %r1, %wstate
change_to_randtl_3_290:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_290:
	.word 0x8f902000  ! 521: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd327c000  ! 522: STF_R	st	%f9, [%r0, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 523: LDX_R	ldx	[%r31 + %r0], %r9
debug_3_291:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 524: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
intveclr_3_292:
	setx 0xc30ebcc4e4241f60, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01971  ! 526: FqTOd	dis not found

mondo_3_294:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d90c00d  ! 527: WRPR_WSTATE_R	wrpr	%r3, %r13, %wstate
tagged_3_295:
	taddcctv %r23, 0x1274, %r24
	.word 0xd407ec34  ! 528: LDUW_I	lduw	[%r31 + 0x0c34], %r10
	.word 0x8d802004  ! 529: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x879020d0  ! 530: WRPR_TT_I	wrpr	%r0, 0x00d0, %tt
	.word 0x91d020b5  ! 531: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x30800001  ! 532: BA	ba,a	<label_0x1>
	.word 0xd4c80e40  ! 533: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r10
	.word 0x93d02032  ! 534: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_cmpr_3_296:
	setx 0x7db778e9f8b4bf59, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 535: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0196c  ! 536: FqTOd	dis not found

DS_3_298:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb3038e5  ! 1: STQF_I	-	%f13, [0x18e5, %r0]
	normalw
	.word 0x93458000  ! 537: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x93902007  ! 538: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91d020b4  ! 539: Tcc_I	ta	icc_or_xcc, %r0 + 180
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 540: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9569b10e  ! 541: SDIVX_I	sdivx	%r6, 0xfffff10e, %r10
	.word 0x38800001  ! 542: BGU	bgu,a	<label_0x1>
	.word 0xe6c7e000  ! 543: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r19
splash_lsu_3_300:
	setx 0x3130e678446d95cd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 544: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 545: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x91d02034  ! 546: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902002  ! 547: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 548: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f803717  ! 549: SIR	sir	0x1717
	setx 0x47d48f20be8da2c2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_301:
	.word 0x39400001  ! 550: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 551: LDX_R	ldx	[%r31 + %r0], %r19
splash_tba_3_302:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 552: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_3_303:
	.word 0x81982f86  ! 553: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f86, %hpstate
splash_lsu_3_304:
	setx 0x76e67c0fefa0179f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 554: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_3_305:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d944008  ! 555: WRPR_WSTATE_R	wrpr	%r17, %r8, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56833b6  ! 556: SDIVX_I	sdivx	%r0, 0xfffff3b6, %r18
	.word 0x91500000  ! 557: RDPR_TPC	rdpr	%tpc, %r8
splash_cmpr_3_307:
	setx 0x28a694a4cb56bce7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 558: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_3_308:
	.word 0x81982847  ! 559: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0847, %hpstate
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_309
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_309
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_309:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 560: RDPC	rd	%pc, %r11
splash_tba_3_310:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 561: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_3_311:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 562: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xdad7e000  ! 563: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
debug_3_312:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 564: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0x97480000  ! 565: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
splash_cmpr_3_313:
	setx 0x5742ca84fed0a85b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 566: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd66fe176  ! 567: LDSTUB_I	ldstub	%r11, [%r31 + 0x0176]
	.word 0xd6d004a0  ! 568: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0xd697e000  ! 569: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
splash_cmpr_3_314:
	setx 0x5a9f779fb4f5eb90, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 570: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_315:
	setx 0xf194ff0e207286f0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 571: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd61fe176  ! 572: LDD_I	ldd	[%r31 + 0x0176], %r11
change_to_randtl_3_316:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_316:
	.word 0x8f902000  ! 573: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	rd %pc, %r19
	add %r19, (ivw_3_317-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_317:
	.word 0x95a00169  ! 574: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_3_318-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_318:
	.word 0xa9a00171  ! 575: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 576: LDX_R	ldx	[%r31 + %r0], %r9
mondo_3_319:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d92800a  ! 577: WRPR_WSTATE_R	wrpr	%r10, %r10, %wstate
	.word 0x93902003  ! 578: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91a0c9d2  ! 579: FDIVd	fdivd	%f34, %f18, %f8
intveclr_3_320:
	setx 0x72bfaa2f86584848, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 580: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 581: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe4800c00  ! 582: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r18
	rd %pc, %r19
	add %r19, (ivw_3_321-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_321:
	.word 0x93a00161  ! 583: FABSq	dis not found

	.word 0xa1902001  ! 584: WRPR_GL_I	wrpr	%r0, 0x0001, %-
intveclr_3_322:
	setx 0xc8bf51f9c660f60a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 585: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_3_323:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 586: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_3_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d948012  ! 587: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
splash_cmpr_3_325:
	setx 0x7116c4c70a5206cd, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 588: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe29004a0  ! 589: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
	.word 0xe25fe176  ! 590: LDX_I	ldx	[%r31 + 0x0176], %r17
	.word 0x93902002  ! 591: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 592: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 593: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8790227a  ! 594: WRPR_TT_I	wrpr	%r0, 0x027a, %tt
debug_3_326:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 595: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01966  ! 596: FqTOd	dis not found

splash_cmpr_3_328:
	setx 0xb6e05179c74e51a4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 597: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe257c000  ! 598: LDSH_R	ldsh	[%r31 + %r0], %r17
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_329
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_329
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_329:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 599: RDPC	rd	%pc, %r17
	.word 0xe41fc000  ! 600: LDD_R	ldd	[%r31 + %r0], %r18
splash_cmpr_3_330:
	setx 0xd6041e35f43b88e4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 601: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 602: LDX_R	ldx	[%r31 + %r0], %r18
mondo_3_331:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d92c002  ! 603: WRPR_WSTATE_R	wrpr	%r11, %r2, %wstate
	.word 0x95a309c9  ! 604: FDIVd	fdivd	%f12, %f40, %f10
splash_lsu_3_332:
	setx 0xec99a28544cb6d53, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 605: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 606: Tcc_I	ta	icc_or_xcc, %r0 + 52
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_333
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_333
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_333:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 607: RDPC	rd	%pc, %r10
splash_tba_3_334:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 608: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81510000  ! 609: RDPR_TICK	rdpr	%tick, %r0
	.word 0xd057c000  ! 610: LDSH_R	ldsh	[%r31 + %r0], %r8
tagged_3_335:
	taddcctv %r6, 0x1a30, %r9
	.word 0xd007e176  ! 611: LDUW_I	lduw	[%r31 + 0x0176], %r8
	.word 0x91d02033  ! 612: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x97454000  ! 613: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
intveclr_3_336:
	setx 0x700dfe0d5f222d26, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 614: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_3_337:
	setx 0x34cbd6674e9fff1b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 615: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_3_338:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8761f0fd	! Random illegal ?
	.word 0xd1104010  ! 1: LDQF_R	-	[%r1, %r16], %f8
	.word 0x99a00830  ! 616: FADDs	fadds	%f0, %f16, %f12
mondo_3_339:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d920009  ! 617: WRPR_WSTATE_R	wrpr	%r8, %r9, %wstate
splash_cmpr_3_340:
	setx 0x98d20cdeec1ab0d0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 618: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02032  ! 619: Tcc_I	ta	icc_or_xcc, %r0 + 50
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 620: LDX_R	ldx	[%r31 + %r0], %r16
splash_cmpr_3_341:
	setx 0x8ef41a92f93e3c20, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 621: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0c004a0  ! 622: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
	.word 0xe137e176  ! 623: STQF_I	-	%f16, [0x0176, %r31]
change_to_randtl_3_342:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_342:
	.word 0x8f902001  ! 624: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_3_343:
	taddcctv %r14, 0x1e60, %r9
	.word 0xe007e176  ! 625: LDUW_I	lduw	[%r31 + 0x0176], %r16
	.word 0xa9a08d27  ! 626: FsMULd	fsmuld	%f2, %f38, %f20
splash_tba_3_344:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 627: WRPR_TBA_R	wrpr	%r0, %r2, %tba
pmu_3_345:
	nop
	setx 0xffffff47fffff99a, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01970  ! 629: FqTOd	dis not found

	.word 0xad812fc0  ! 630: WR_SOFTINT_REG_I	wr	%r4, 0x0fc0, %softint
	.word 0xd447c000  ! 631: LDSW_R	ldsw	[%r31 + %r0], %r10
	.word 0x93902006  ! 632: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_3_347:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 633: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_348
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_348
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_348:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 634: RDPC	rd	%pc, %r8
DS_3_349:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x95a149d3  ! 1: FDIVd	fdivd	%f36, %f50, %f10
	normalw
	.word 0x9b458000  ! 635: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x91464000  ! 636: RD_STICK_CMPR_REG	rd	%-, %r8
	.word 0xd28008a0  ! 637: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x97500000  ! 638: RDPR_TPC	<illegal instruction>
tagged_3_350:
	tsubcctv %r18, 0x1e0c, %r25
	.word 0xe807fb6a  ! 639: LDUW_I	lduw	[%r31 + 0xfffffb6a], %r20
	.word 0xa190200b  ! 640: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	setx 0x2c982eec377cbc08, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_351:
	.word 0x39400001  ! 641: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_3_352:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 642: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_3_353:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 643: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_354
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_354
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_354:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 644: RDPC	rd	%pc, %r8
	.word 0xda800a80  ! 645: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r13
	.word 0x99454000  ! 646: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0x93902003  ! 647: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_cmpr_3_355:
	setx 0xe060323b27d20d6e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 648: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 649: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_3_356:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 650: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd81ffb6a  ! 651: LDD_I	ldd	[%r31 + 0xfffffb6a], %r12
mondo_3_357:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d910008  ! 652: WRPR_WSTATE_R	wrpr	%r4, %r8, %wstate
	.word 0x879020eb  ! 653: WRPR_TT_I	wrpr	%r0, 0x00eb, %tt
	.word 0x879020d6  ! 654: WRPR_TT_I	wrpr	%r0, 0x00d6, %tt
	.word 0x9b480000  ! 655: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0x879021fd  ! 656: WRPR_TT_I	wrpr	%r0, 0x01fd, %tt
	.word 0x87802089  ! 657: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d802000  ! 658: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802063  ! 659: WRASI_I	wr	%r0, 0x0063, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_358)) -> intp(2,0,8)
intvec_3_358:
	.word 0x39400001  ! 660: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_3_359:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 661: SAVE_R	save	%r31, %r0, %r31
	.word 0x93540000  ! 662: RDPR_GL	<illegal instruction>
debug_3_360:
	nop
	mov 8, %r18
	.word 0xe6f00852  ! 663: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
debug_3_361:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 664: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xda1fc000  ! 665: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xa3b00fe2  ! 666: FONES	e	%f17
	.word 0xe68008a0  ! 667: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe6dfe010  ! 668: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r19
	.word 0x87802004  ! 669: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93902002  ! 670: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
change_to_randtl_3_362:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_362:
	.word 0x8f902002  ! 671: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x9ba01a69  ! 672: FqTOi	fqtoi	
	.word 0xe48fe030  ! 673: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r18
	.word 0xe49004a0  ! 674: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0x8d903380  ! 675: WRPR_PSTATE_I	wrpr	%r0, 0x1380, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01973  ! 676: FqTOd	dis not found

	.word 0xd89fc020  ! 677: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0x93902000  ! 678: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_3_364:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d924001  ! 679: WRPR_WSTATE_R	wrpr	%r9, %r1, %wstate
	.word 0xd89004a0  ! 680: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
mondo_3_365:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d940001  ! 681: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
splash_cmpr_3_366:
	setx 0xdc348e039c5b3f4f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 682: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 683: LDX_R	ldx	[%r31 + %r0], %r12
DS_3_367:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 684: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x8780204f  ! 685: WRASI_I	wr	%r0, 0x004f, %asi
intveclr_3_368:
	setx 0x3c27848987b1d2c8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 686: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01969  ! 687: FqTOd	dis not found

splash_lsu_3_370:
	setx 0x661d2094a5c26ad5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 688: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_3_371:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 689: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 690: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x93902006  ! 691: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196c  ! 692: FqTOd	dis not found

	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 693: Tcc_R	te	icc_or_xcc, %r0 + %r30
	setx 0xde2c29a0b3575f8c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_373:
	.word 0x39400001  ! 694: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d80e80  ! 695: LDXA_R	ldxa	[%r0, %r0] 0x74, %r10
splash_hpstate_3_374:
	.word 0x8198224e  ! 696: WRHPR_HPSTATE_I	wrhpr	%r0, 0x024e, %hpstate
	.word 0x91d02035  ! 697: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd48fe020  ! 698: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	.word 0x97450000  ! 699: RD_SET_SOFTINT	rd	%set_softint, %r11
change_to_randtl_3_375:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_375:
	.word 0x8f902003  ! 700: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_cmpr_3_376:
	setx 0xe1a2f5507d8d0891, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 701: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_3_377:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_377:
	.word 0x8f902001  ! 702: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_3_378:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_378:
	.word 0x8f902002  ! 703: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_3_379:
	taddcctv %r9, 0x1cc2, %r4
	.word 0xd607fb6a  ! 704: LDUW_I	lduw	[%r31 + 0xfffffb6a], %r11
	.word 0xd6d80e40  ! 705: LDXA_R	ldxa	[%r0, %r0] 0x72, %r11
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b68b744  ! 706: SDIVX_I	sdivx	%r2, 0xfffff744, %r13
	.word 0x87802089  ! 707: WRASI_I	wr	%r0, 0x0089, %asi
change_to_randtl_3_381:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_381:
	.word 0x8f902002  ! 708: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
change_to_randtl_3_382:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_382:
	.word 0x8f902000  ! 709: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 710: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8790214f  ! 711: WRPR_TT_I	wrpr	%r0, 0x014f, %tt
	.word 0x879023f3  ! 712: WRPR_TT_I	wrpr	%r0, 0x03f3, %tt
debug_3_383:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 713: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4dfe020  ! 714: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
	.word 0x99902003  ! 715: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x93902002  ! 716: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_hpstate_3_384:
	.word 0x81982e7e  ! 717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e7e, %hpstate
splash_tba_3_385:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 718: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_3_386:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 719: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_3_387:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 720: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x9b450000  ! 721: RD_SET_SOFTINT	rd	%set_softint, %r13
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 722: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd81ffa75  ! 723: LDD_I	ldd	[%r31 + 0xfffffa75], %r12
	.word 0x8d902865  ! 724: WRPR_PSTATE_I	wrpr	%r0, 0x0865, %pstate
	.word 0x9194205f  ! 725: WRPR_PIL_I	wrpr	%r16, 0x005f, %pil
mondo_3_388:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d90c011  ! 726: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
tagged_3_389:
	taddcctv %r8, 0x1c56, %r5
	.word 0xd807f31f  ! 727: LDUW_I	lduw	[%r31 + 0xfffff31f], %r12
DS_3_390:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe76ea47d	! Random illegal ?
	.word 0xa7a009c6  ! 1: FDIVd	fdivd	%f0, %f6, %f50
	.word 0xa7a08827  ! 728: FADDs	fadds	%f2, %f7, %f19
	.word 0x99520000  ! 729: RDPR_PIL	<illegal instruction>
	.word 0x2a700001  ! 730: BPCS	<illegal instruction>
splash_cmpr_3_391:
	setx 0x725f02f1e141cfa7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 731: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_392:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 732: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x83d02034  ! 733: Tcc_I	te	icc_or_xcc, %r0 + 52
splash_cmpr_3_393:
	setx 0x1b2ecbf6a0a0baf6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 734: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996b7a79  ! 735: SDIVX_I	sdivx	%r13, 0xfffffa79, %r12
	rd %pc, %r19
	add %r19, (ivw_3_395-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_395:
	.word 0xa1a00169  ! 736: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01969  ! 737: FqTOd	dis not found

	setx 0x51b181acd1f1fed0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_397:
	.word 0x39400001  ! 738: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_3_398:
	setx 0xd287d67424071cde, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 739: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97520000  ! 740: RDPR_PIL	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9768a2ef  ! 741: SDIVX_I	sdivx	%r2, 0x02ef, %r11
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_400
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_400
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_400:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 742: RDPC	rd	%pc, %r10
debug_3_401:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 743: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x95540000  ! 744: RDPR_GL	<illegal instruction>
	.word 0x8d802000  ! 745: WRFPRS_I	wr	%r0, 0x0000, %fprs
    set sync_thr_counter1, %r23
    mov 3, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_402
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_402
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_402:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 746: RDPC	rd	%pc, %r19
splash_tba_3_403:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 747: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_3_404:
	setx 0xa7faf24fe4575a1d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 748: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_3_405:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d91000d  ! 749: WRPR_WSTATE_R	wrpr	%r4, %r13, %wstate
	.word 0x3c800001  ! 750: BPOS	bpos,a	<label_0x1>
DS_3_406:
	.word 0x91a289c0  ! 1: FDIVd	fdivd	%f10, %f0, %f8
	.word 0xbfe7c000  ! 751: SAVE_R	save	%r31, %r0, %r31
mondo_3_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d934013  ! 752: WRPR_WSTATE_R	wrpr	%r13, %r19, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6a3bba  ! 753: SDIVX_I	sdivx	%r8, 0xfffffbba, %r13
	.word 0x9950c000  ! 754: RDPR_TT	rdpr	%tt, %r12
	.word 0x87802058  ! 755: WRASI_I	wr	%r0, 0x0058, %asi
tagged_3_409:
	taddcctv %r24, 0x15c9, %r8
	.word 0xd607e3d0  ! 756: LDUW_I	lduw	[%r31 + 0x03d0], %r11
	.word 0xd6d7e030  ! 757: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
	.word 0xa950c000  ! 758: RDPR_TT	<illegal instruction>
mondo_3_410:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d908001  ! 759: WRPR_WSTATE_R	wrpr	%r2, %r1, %wstate
splash_lsu_3_411:
	setx 0x30f23bc9f9174035, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 760: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_3_412:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d924008  ! 761: WRPR_WSTATE_R	wrpr	%r9, %r8, %wstate
	.word 0xa5480000  ! 762: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	.word 0x95540000  ! 763: RDPR_GL	<illegal instruction>
change_to_randtl_3_413:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_413:
	.word 0x8f902002  ! 764: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_3_414:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d90400b  ! 765: WRPR_WSTATE_R	wrpr	%r1, %r11, %wstate
debug_3_415:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 766: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_3_416:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d91c006  ! 767: WRPR_WSTATE_R	wrpr	%r7, %r6, %wstate
	.word 0xe2d7e020  ! 768: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r17
debug_3_417:
	nop
	mov 8, %r18
	.word 0xe6f00852  ! 769: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0x8780204f  ! 770: WRASI_I	wr	%r0, 0x004f, %asi
splash_cmpr_3_418:
	setx 0xc3bbef833481f7a8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 771: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 772: Tcc_I	ta	icc_or_xcc, %r0 + 51
!$EV trig_pc_d(1, @VA(.MAIN.xir_3_419)) -> intp(3,1,3)
xir_3_419:
	.word 0xa98276e9  ! 773: WR_SET_SOFTINT_I	wr	%r9, 0x16e9, %set_softint
	.word 0xe20fc000  ! 774: LDUB_R	ldub	[%r31 + %r0], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 775: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_3_420:
	.word 0x81982fe5  ! 776: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fe5, %hpstate
	.word 0x83d02035  ! 777: Tcc_I	te	icc_or_xcc, %r0 + 53
tagged_3_421:
	taddcctv %r8, 0x1ebf, %r18
	.word 0xe207f180  ! 778: LDUW_I	lduw	[%r31 + 0xfffff180], %r17
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 779: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_3_422:
	setx 0x484747d7c0c25819, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 780: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9b500000  ! 781: RDPR_TPC	<illegal instruction>
debug_3_423:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 782: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
debug_3_424:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 783: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1697c09  ! 784: SDIVX_I	sdivx	%r5, 0xfffffc09, %r16
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956928fe  ! 785: SDIVX_I	sdivx	%r4, 0x08fe, %r10
	.word 0xd137c000  ! 786: STQF_R	-	%f8, [%r0, %r31]
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 787: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_3_427:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d94c009  ! 788: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
donret_3_428:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_428-donret_3_428), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_428:
	.word 0xd0fff5af  ! 789: SWAPA_I	swapa	%r8, [%r31 + 0xfffff5af] %asi
	.word 0xd127c000  ! 790: STF_R	st	%f8, [%r0, %r31]
	.word 0x9745c000  ! 791: RD_TICK_CMPR_REG	rd	%-, %r11
mondo_3_429:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d920011  ! 792: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a0196d  ! 793: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 794: LDX_R	ldx	[%r31 + %r0], %r11
splash_cmpr_3_431:
	setx 0xe8c8d1138bc896d0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 795: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_432:
	setx 0x2b852715e6fd4941, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 796: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 797: BPNE	<illegal instruction>
	.word 0x93902006  ! 798: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_3_433:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 1: LDX_R	ldx	[%r31 + %r0], %r17
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_0
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_0:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 2: RDPC	rd	%pc, %r11
	.word 0xd28fe000  ! 3: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r9
	.word 0x91d020b5  ! 4: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_cmpr_2_1:
	setx 0x3455c200bc58460c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 5: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 6: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196a  ! 7: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 8: LDX_R	ldx	[%r31 + %r0], %r17
debug_2_3:
	nop
	mov 8, %r18
	.word 0xe6f00852  ! 9: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0xe2d004a0  ! 10: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0x87902154  ! 11: WRPR_TT_I	wrpr	%r0, 0x0154, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9968b1c9  ! 12: SDIVX_I	sdivx	%r2, 0xfffff1c9, %r12
debug_2_5:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 13: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_2_6:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 14: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
splash_cmpr_2_7:
	setx 0x851d4837b6dee36a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 15: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96ab5ac  ! 16: SDIVX_I	sdivx	%r10, 0xfffff5ac, %r20
splash_cmpr_2_9:
	setx 0x9ed332c861136fce, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 17: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902045  ! 18: WRPR_TT_I	wrpr	%r0, 0x0045, %tt
change_to_randtl_2_10:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_10:
	.word 0x8f902000  ! 19: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
donret_2_11:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_11-donret_2_11), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_11:
	.word 0xe2ffe750  ! 20: SWAPA_I	swapa	%r17, [%r31 + 0x0750] %asi
change_to_randtl_2_12:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_12:
	.word 0x8f902000  ! 21: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_2_13:
	taddcctv %r4, 0x11f8, %r14
	.word 0xe207e750  ! 22: LDUW_I	lduw	[%r31 + 0x0750], %r17
	.word 0x22700001  ! 23: BPE	<illegal instruction>
	.word 0x9945c000  ! 24: RD_TICK_CMPR_REG	rd	%-, %r12
mondo_2_14:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d914010  ! 25: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
	.word 0x91d02033  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8780201c  ! 27: WRASI_I	wr	%r0, 0x001c, %asi
intveclr_2_15:
	setx 0xd08d887f6f3e9782, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8cfe010  ! 29: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r12
	.word 0xa1902009  ! 30: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_lsu_2_16:
	setx 0xe7b16410477dcd07, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 31: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 32: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
mondo_2_17:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d94c012  ! 33: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 34: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_2_18:
	.word 0x81982bec  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bec, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 36: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x93480000  ! 37: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
splash_lsu_2_19:
	setx 0x45ad1a322f2f8549, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 38: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 39: RD_STICK_REG	stbar
	.word 0x81510000  ! 40: RDPR_TICK	rdpr	%tick, %r0
tagged_2_20:
	tsubcctv %r1, 0x1ca3, %r3
	.word 0xd807e750  ! 41: LDUW_I	lduw	[%r31 + 0x0750], %r12
splash_lsu_2_21:
	setx 0xa3cecced2b02f629, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 42: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d944002  ! 43: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
	.word 0xa190200b  ! 44: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x9a4b0009  ! 45: MULX_R	mulx 	%r12, %r9, %r13
	.word 0x97450000  ! 46: RD_SET_SOFTINT	rd	%set_softint, %r11
intveclr_2_23:
	setx 0x1ea4dbb23ad093da, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 47: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_24)) -> intp(0,0,29)
intvec_2_24:
	.word 0x39400001  ! 48: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902225  ! 49: WRPR_TT_I	wrpr	%r0, 0x0225, %tt
debug_2_25:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 50: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_2_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d944009  ! 51: WRPR_WSTATE_R	wrpr	%r17, %r9, %wstate
	.word 0x87902009  ! 52: WRPR_TT_I	wrpr	%r0, 0x0009, %tt
	.word 0xa9a089ca  ! 53: FDIVd	fdivd	%f2, %f10, %f20
splash_hpstate_2_27:
	.word 0x81982785  ! 54: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0785, %hpstate
	.word 0x87802016  ! 55: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x91d020b4  ! 56: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x3e700001  ! 57: BPVC	<illegal instruction>
	.word 0xe60fc000  ! 58: LDUB_R	ldub	[%r31 + %r0], %r19
	rd %pc, %r19
	add %r19, (ivw_2_28-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_28:
	.word 0x91a0016a  ! 59: FABSq	dis not found

	.word 0xd48fe020  ! 60: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	.word 0xd4c7e010  ! 61: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
DS_2_29:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 62: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
splash_tba_2_30:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 63: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_2_31:
	setx 0x3290ba0d329ebf7d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 64: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_32:
	setx 0x7c8b16e79a6f2388, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 65: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d94c010  ! 66: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
debug_2_34:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 67: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_2_35:
	.word 0x81982bd4  ! 68: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd4, %hpstate
intveclr_2_36:
	setx 0x1fd78b2a46a16804, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902a33  ! 70: WRPR_PSTATE_I	wrpr	%r0, 0x0a33, %pstate
splash_cmpr_2_37:
	setx 0xee4b3826977a7c98, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 71: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_2_38:
	nop
	setx 0xfffff7acfffff2d6, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_2_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d910012  ! 73: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
	rd %pc, %r19
	add %r19, (ivw_2_40-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_40:
	.word 0xa3a00161  ! 74: FABSq	dis not found

pmu_2_41:
	nop
	setx 0xfffff5cbfffff03c, %g1, %g7
	.word 0xa3800007  ! 75: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd02fe750  ! 76: STB_I	stb	%r8, [%r31 + 0x0750]
splash_cmpr_2_42:
	setx 0x8c6ac73606dcf7c8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 77: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3c700001  ! 78: BPPOS	<illegal instruction>
debug_2_43:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 79: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_2_44:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 80: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd0800ba0  ! 81: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r8
	rd %pc, %r19
	add %r19, (ivw_2_45-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_45:
	.word 0x99a00168  ! 82: FABSq	dis not found

splash_lsu_2_46:
	setx 0xede61c827c7aa3bf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 83: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_2_47:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_47:
	.word 0x8f902000  ! 84: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 85: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802020  ! 86: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x9193356d  ! 87: WRPR_PIL_I	wrpr	%r12, 0x156d, %pil
	.word 0xd6900e80  ! 88: LDUHA_R	lduha	[%r0, %r0] 0x74, %r11
	.word 0xa190200a  ! 89: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd6c004a0  ! 90: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
mondo_2_48:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d94c00b  ! 91: WRPR_WSTATE_R	wrpr	%r19, %r11, %wstate
splash_cmpr_2_49:
	setx 0x8382eaba1c2ceaa6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 92: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b5  ! 93: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x87802080  ! 94: WRASI_I	wr	%r0, 0x0080, %asi
mondo_2_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d904014  ! 95: WRPR_WSTATE_R	wrpr	%r1, %r20, %wstate
	.word 0xd6dfe030  ! 96: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r11
	.word 0x93902007  ! 97: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
change_to_randtl_2_51:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_51:
	.word 0x8f902001  ! 98: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_2_52:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_52:
	.word 0x8f902002  ! 99: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d903f93  ! 100: WRPR_PSTATE_I	wrpr	%r0, 0x1f93, %pstate
	.word 0x91d02033  ! 101: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd73fc000  ! 102: STDF_R	std	%f11, [%r0, %r31]
	.word 0xa9808004  ! 103: WR_SET_SOFTINT_R	wr	%r2, %r4, %set_softint
	.word 0xa1902009  ! 104: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x87902135  ! 105: WRPR_TT_I	wrpr	%r0, 0x0135, %tt
debug_2_53:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 106: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_2_54-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_54:
	.word 0x91a00163  ! 107: FABSq	dis not found

splash_lsu_2_55:
	setx 0x34cf5f1059ad98bf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 108: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 109: SIAM	siam	1
debug_2_56:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 110: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_2_57:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_57-donret_2_57), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_57:
	.word 0xd8fff234  ! 111: SWAPA_I	swapa	%r12, [%r31 + 0xfffff234] %asi
DS_2_58:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xf15231fa	! Random illegal ?
	.word 0xa3a0054b  ! 1: FSQRTd	fsqrt	
	.word 0x93a4c829  ! 112: FADDs	fadds	%f19, %f9, %f9
splash_tba_2_59:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 113: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x97a209e8  ! 114: FDIVq	dis not found

	.word 0xd4d004a0  ! 115: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 116: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9169e17b  ! 117: SDIVX_I	sdivx	%r7, 0x017b, %r8
intveclr_2_61:
	setx 0x0aed7b9157e03208, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 118: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 119: SIAM	siam	1
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 120: LDX_R	ldx	[%r31 + %r0], %r13
tagged_2_62:
	tsubcctv %r15, 0x16dc, %r1
	.word 0xda07e1f9  ! 121: LDUW_I	lduw	[%r31 + 0x01f9], %r13
	.word 0xda57c000  ! 122: LDSH_R	ldsh	[%r31 + %r0], %r13
tagged_2_63:
	taddcctv %r15, 0x15b3, %r26
	.word 0xda07e1f9  ! 123: LDUW_I	lduw	[%r31 + 0x01f9], %r13
	.word 0xdac004a0  ! 124: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
donret_2_64:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_64-donret_2_64), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_64:
	.word 0xdaffe1f9  ! 125: SWAPA_I	swapa	%r13, [%r31 + 0x01f9] %asi
	.word 0xdacfe030  ! 126: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
mondo_2_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d914006  ! 127: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
splash_cmpr_2_66:
	setx 0x44eb547c0b31431a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 128: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_2_67:
	.word 0x81982dce  ! 129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dce, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_2_68)) -> intp(2,1,3)
xir_2_68:
	.word 0xa981a9f3  ! 130: WR_SET_SOFTINT_I	wr	%r6, 0x09f3, %set_softint
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01963  ! 131: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_70)) -> intp(4,0,10)
intvec_2_70:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 133: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x91d02035  ! 134: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd48008a0  ! 135: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
debug_2_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 136: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_2_72:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_72-donret_2_72), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_72:
	.word 0xd4fff312  ! 137: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
splash_lsu_2_73:
	setx 0xbaa512c07c79aae9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 138: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_2_74:
	setx 0x04f79e055708f4bf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 139: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d02032  ! 140: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x97a01a72  ! 141: FqTOi	fqtoi	
tagged_2_75:
	taddcctv %r25, 0x1bc0, %r5
	.word 0xe207f312  ! 142: LDUW_I	lduw	[%r31 + 0xfffff312], %r17
splash_hpstate_2_76:
	.word 0x81982204  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0204, %hpstate
	.word 0xa9454000  ! 144: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
splash_htba_2_77:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 145: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_2_78:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 146: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_2_79:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 147: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_80)) -> intp(7,0,24)
intvec_2_80:
	.word 0x39400001  ! 148: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_81:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 149: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_2_82:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_82:
	.word 0x8f902001  ! 150: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_2_83:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 151: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d020b3  ! 152: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x8d9037a2  ! 153: WRPR_PSTATE_I	wrpr	%r0, 0x17a2, %pstate
	.word 0x9550c000  ! 154: RDPR_TT	<illegal instruction>
DS_2_84:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 155: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_2_85:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 156: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802080  ! 157: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x83d02034  ! 158: Tcc_I	te	icc_or_xcc, %r0 + 52
intveclr_2_86:
	setx 0xa0c254832e615830, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 159: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_2_87:
	taddcctv %r13, 0x122a, %r24
	.word 0xe607f312  ! 160: LDUW_I	lduw	[%r31 + 0xfffff312], %r19
mondo_2_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d920010  ! 161: WRPR_WSTATE_R	wrpr	%r8, %r16, %wstate
splash_tba_2_89:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 162: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_2_90:
	.word 0x81982945  ! 163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0945, %hpstate
splash_cmpr_2_91:
	setx 0xb4c5dd5121f69e22, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 164: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe71fc000  ! 165: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x93902000  ! 166: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_2_92:
	.word 0x9ba0c9d2  ! 1: FDIVd	fdivd	%f34, %f18, %f44
	.word 0xa55cb913	! Random illegal ?
	.word 0xa7a00548  ! 1: FSQRTd	fsqrt	
	.word 0xa3a3082b  ! 167: FADDs	fadds	%f12, %f11, %f17
	.word 0xa1902000  ! 168: WRPR_GL_I	wrpr	%r0, 0x0000, %-
donret_2_93:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_93-donret_2_93), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_93:
	.word 0xd4fff312  ! 169: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
	.word 0x93902006  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
donret_2_94:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_94-donret_2_94), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_94:
	.word 0xd4fff312  ! 171: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
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
	.word 0x99414000  ! 172: RDPC	rd	%pc, %r12
	.word 0xd0dfe020  ! 173: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r8
	.word 0xa1902003  ! 174: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd127c000  ! 175: STF_R	st	%f8, [%r0, %r31]
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 176: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_2_96:
	setx 0xa5a63cf9a39b14e9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 177: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902f01  ! 178: WRPR_PSTATE_I	wrpr	%r0, 0x0f01, %pstate
	.word 0x95480000  ! 179: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0xd28008a0  ! 180: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x91d02034  ! 181: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x81510000  ! 182: RDPR_TICK	rdpr	%tick, %r0
mondo_2_97:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d92c003  ! 183: WRPR_WSTATE_R	wrpr	%r11, %r3, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_98)) -> intp(0,0,18)
intvec_2_98:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_2_99:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_99:
	.word 0x8f902002  ! 185: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x93902004  ! 186: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 187: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_2_100:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_100:
	.word 0x8f902001  ! 188: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d802000  ! 189: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_2_101:
	setx 0x5147351f62ec348a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 190: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01973  ! 191: FqTOd	dis not found

	setx 0xf88e12dbd643e58a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_103:
	.word 0x39400001  ! 192: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd08804a0  ! 193: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
mondo_2_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d918005  ! 194: WRPR_WSTATE_R	wrpr	%r6, %r5, %wstate
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 195: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd09004a0  ! 196: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0xd06ff312  ! 197: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff312]
change_to_randtl_2_105:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_105:
	.word 0x8f902002  ! 198: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_2_106:
	setx 0x558f2e5ba77d26d1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 199: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780201c  ! 200: WRASI_I	wr	%r0, 0x001c, %asi
	rd %pc, %r19
	add %r19, (ivw_2_107-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_107:
	.word 0xa1a0016b  ! 201: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa768684f  ! 202: SDIVX_I	sdivx	%r1, 0x084f, %r19
	.word 0xd6d00e60  ! 203: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r11
splash_hpstate_2_109:
	.word 0x819824dd  ! 204: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04dd, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 205: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_2_110:
	.word 0xa7a309d3  ! 1: FDIVd	fdivd	%f12, %f50, %f50
	.word 0xbfe7c000  ! 206: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_2_111:
	setx 0x5b7b0d9cfe668fdf, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 208: LDX_R	ldx	[%r31 + %r0], %r11
splash_tba_2_112:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 209: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_2_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 210: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd727c000  ! 211: STF_R	st	%f11, [%r0, %r31]
	.word 0xa9844014  ! 212: WR_SET_SOFTINT_R	wr	%r17, %r20, %set_softint
mondo_2_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d934000  ! 213: WRPR_WSTATE_R	wrpr	%r13, %r0, %wstate
mondo_2_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d924006  ! 214: WRPR_WSTATE_R	wrpr	%r9, %r6, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01965  ! 215: FqTOd	dis not found

	.word 0x94f8400d  ! 216: SDIVcc_R	sdivcc 	%r1, %r13, %r10
	.word 0xa1902007  ! 217: WRPR_GL_I	wrpr	%r0, 0x0007, %-
mondo_2_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d910011  ! 218: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
	.word 0xe48008a0  ! 219: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe4bfc020  ! 220: STDA_R	stda	%r18, [%r31 + %r0] 0x01
tagged_2_118:
	tsubcctv %r13, 0x10f9, %r13
	.word 0xe407f661  ! 221: LDUW_I	lduw	[%r31 + 0xfffff661], %r18
	.word 0x879021e8  ! 222: WRPR_TT_I	wrpr	%r0, 0x01e8, %tt
	.word 0xe4d7e010  ! 223: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r18
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
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
	.word 0x95414000  ! 224: RDPC	rd	%pc, %r10
	rd %pc, %r19
	add %r19, (ivw_2_120-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_120:
	.word 0xa9a00160  ! 225: FABSq	dis not found

donret_2_121:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_121-donret_2_121), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_121:
	.word 0xd2fff661  ! 226: SWAPA_I	swapa	%r9, [%r31 + 0xfffff661] %asi
	.word 0xa9800010  ! 227: WR_SET_SOFTINT_R	wr	%r0, %r16, %set_softint
	.word 0x904a8010  ! 228: MULX_R	mulx 	%r10, %r16, %r8
splash_lsu_2_122:
	setx 0x5233c07fa42bd4c5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 229: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xa5199f7a64621e27, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_123:
	.word 0x39400001  ! 230: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe21ff661  ! 231: LDD_I	ldd	[%r31 + 0xfffff661], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 232: LDX_R	ldx	[%r31 + %r0], %r17
DS_2_124:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 233: SAVE_R	save	%r31, %r0, %r31
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 234: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_2_125:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 235: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_126)) -> intp(6,0,10)
intvec_2_126:
	.word 0x39400001  ! 236: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_2_127:
	setx 0x9ca7fbe558271a13, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_2_128-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_128:
	.word 0x93a00166  ! 238: FABSq	dis not found

	.word 0xd69ff661  ! 239: LDDA_I	ldda	[%r31, + 0xfffff661] %asi, %r11
DS_2_129:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe9318012  ! 1: STQF_R	-	%f20, [%r18, %r6]
	normalw
	.word 0x99458000  ! 240: RD_SOFTINT_REG	rd	%softint, %r12
splash_lsu_2_130:
	setx 0xa8f72d23ed7e792f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 241: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2c804a0  ! 242: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
splash_tba_2_131:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 243: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200d  ! 244: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xe2d004a0  ! 245: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0xe2d004a0  ! 246: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0xa5520000  ! 247: RDPR_PIL	<illegal instruction>
tagged_2_132:
	tsubcctv %r6, 0x1ec0, %r21
	.word 0xe607f661  ! 248: LDUW_I	lduw	[%r31 + 0xfffff661], %r19
debug_2_133:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 249: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe727c000  ! 250: STF_R	st	%f19, [%r0, %r31]
splash_lsu_2_134:
	setx 0xf3109db49c3b64cd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 251: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x32800001  ! 252: BNE	bne,a	<label_0x1>
	.word 0xe6d804a0  ! 253: LDXA_R	ldxa	[%r0, %r0] 0x25, %r19
	.word 0xe66ff661  ! 254: LDSTUB_I	ldstub	%r19, [%r31 + 0xfffff661]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01962  ! 255: FqTOd	dis not found

	.word 0x8d902c1d  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x0c1d, %pstate
splash_hpstate_2_136:
	.word 0x81982b0c  ! 257: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0c, %hpstate
	.word 0x91a24dc2  ! 258: FdMULq	fdmulq	
	.word 0x93902007  ! 259: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
mondo_2_137:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d95000c  ! 260: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
	.word 0xe29004a0  ! 261: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
mondo_2_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d948004  ! 262: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
	.word 0x87802088  ! 263: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87802004  ! 264: WRASI_I	wr	%r0, 0x0004, %asi
mondo_2_139:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d918006  ! 265: WRPR_WSTATE_R	wrpr	%r6, %r6, %wstate
mondo_2_140:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d918007  ! 266: WRPR_WSTATE_R	wrpr	%r6, %r7, %wstate
debug_2_141:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 267: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0x8d9029a0  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x09a0, %pstate
debug_2_142:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 269: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab850005  ! 270: WR_CLEAR_SOFTINT_R	wr	%r20, %r5, %clear_softint
debug_2_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 271: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa190200b  ! 272: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 273: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01966  ! 274: FqTOd	dis not found

tagged_2_145:
	taddcctv %r21, 0x1ef7, %r6
	.word 0xd407f661  ! 275: LDUW_I	lduw	[%r31 + 0xfffff661], %r10
splash_cmpr_2_146:
	setx 0x4f55edd9d8b9f705, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 276: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9035c5  ! 277: WRPR_PSTATE_I	wrpr	%r0, 0x15c5, %pstate
splash_tba_2_147:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 278: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_2_148:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 279: RESTORE_R	restore	%r31, %r0, %r31
mondo_2_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d930009  ! 280: WRPR_WSTATE_R	wrpr	%r12, %r9, %wstate
splash_lsu_2_150:
	setx 0xd535ddf5a3d4d8bf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 281: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790209c  ! 282: WRPR_TT_I	wrpr	%r0, 0x009c, %tt
	setx 0xb535219aca724052, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_151:
	.word 0x39400001  ! 283: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd40ff661  ! 284: LDUB_I	ldub	[%r31 + 0xfffff661], %r10
mondo_2_152:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d94c002  ! 285: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
	.word 0x8d9029e4  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x09e4, %pstate
splash_tba_2_153:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 287: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879020d5  ! 288: WRPR_TT_I	wrpr	%r0, 0x00d5, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996ce5f6  ! 289: SDIVX_I	sdivx	%r19, 0x05f6, %r12
splash_tba_2_155:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 290: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_2_156:
	setx 0x164803a25ebcd5c9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 291: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196b  ! 292: FqTOd	dis not found

splash_lsu_2_158:
	setx 0x82fa9ba57469b677, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 293: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 294: RD_STICK_REG	stbar
splash_cmpr_2_159:
	setx 0x6e2aa4f86bb292d5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_160:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 296: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d90238a  ! 297: WRPR_PSTATE_I	wrpr	%r0, 0x038a, %pstate
	.word 0xa4f96396  ! 298: SDIVcc_I	sdivcc 	%r5, 0x0396, %r18
	.word 0xa9830005  ! 299: WR_SET_SOFTINT_R	wr	%r12, %r5, %set_softint
	.word 0xd0880e40  ! 300: LDUBA_R	lduba	[%r0, %r0] 0x72, %r8
	setx 0xe420f47c6242678c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_161:
	.word 0x39400001  ! 301: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0d804a0  ! 302: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_162)) -> intp(0,0,2)
intvec_2_162:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_163:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d95000d  ! 304: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
	.word 0xab81000d  ! 305: WR_CLEAR_SOFTINT_R	wr	%r4, %r13, %clear_softint
	.word 0xa190200b  ! 306: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 307: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196b  ! 308: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01974  ! 309: FqTOd	dis not found

	.word 0x87802016  ! 310: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x87802089  ! 311: WRASI_I	wr	%r0, 0x0089, %asi
mondo_2_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d950010  ! 312: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
pmu_2_167:
	nop
	setx 0xfffff61ffffff7f0, %g1, %g7
	.word 0xa3800007  ! 313: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_2_168:
	setx 0x9d8f2584664f3fcd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 314: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879021cd  ! 315: WRPR_TT_I	wrpr	%r0, 0x01cd, %tt
	.word 0x9190e296  ! 316: WRPR_PIL_I	wrpr	%r3, 0x0296, %pil
tagged_2_169:
	taddcctv %r19, 0x1fb3, %r6
	.word 0xd607ee91  ! 317: LDUW_I	lduw	[%r31 + 0x0e91], %r11
	.word 0x99a109d0  ! 318: FDIVd	fdivd	%f4, %f16, %f12
	.word 0xd06fee91  ! 319: LDSTUB_I	ldstub	%r8, [%r31 + 0x0e91]
	.word 0xd06fee91  ! 320: LDSTUB_I	ldstub	%r8, [%r31 + 0x0e91]
splash_tba_2_170:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 321: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x94c0b648  ! 322: ADDCcc_I	addccc 	%r2, 0xfffff648, %r10
splash_cmpr_2_171:
	setx 0x6a34bafc3f47ef10, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 323: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802014  ! 324: WRASI_I	wr	%r0, 0x0014, %asi
	rd %pc, %r19
	add %r19, (ivw_2_172-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_172:
	.word 0x97a0016d  ! 325: FABSq	dis not found

	.word 0x93902003  ! 326: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_2_173:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 327: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_2_174:
	.word 0x81982b95  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b95, %hpstate
splash_tba_2_175:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 329: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_176:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 330: RDPC	rd	%pc, %r16
tagged_2_177:
	taddcctv %r16, 0x128e, %r18
	.word 0xda07e697  ! 331: LDUW_I	lduw	[%r31 + 0x0697], %r13
	.word 0xda1fc000  ! 332: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x9a490003  ! 333: MULX_R	mulx 	%r4, %r3, %r13
	.word 0xe2dfe010  ! 334: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r17
change_to_randtl_2_178:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_178:
	.word 0x8f902000  ! 335: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_2_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 336: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_2_180:
	setx 0x0a99cb488cc4725c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902002  ! 338: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
mondo_2_181:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d94c010  ! 339: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
donret_2_182:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_182-donret_2_182), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_182:
	.word 0xe2ffe697  ! 340: SWAPA_I	swapa	%r17, [%r31 + 0x0697] %asi
	.word 0xe26fe697  ! 341: LDSTUB_I	ldstub	%r17, [%r31 + 0x0697]
intveclr_2_183:
	setx 0xa91918e665f0285f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 342: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_184:
	.word 0x81982f8f  ! 343: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8f, %hpstate
intveclr_2_185:
	setx 0xf7d96a638937c1b4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_186)) -> intp(3,0,13)
intvec_2_186:
	.word 0x39400001  ! 345: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfe020  ! 346: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r17
splash_tba_2_187:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 347: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200c  ! 348: WRPR_GL_I	wrpr	%r0, 0x000c, %-
change_to_randtl_2_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_188:
	.word 0x8f902002  ! 349: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	setx 0x954f45a4692d06b3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_189:
	.word 0x39400001  ! 350: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 351: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_190
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_190
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_190:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 352: RDPC	rd	%pc, %r11
	.word 0xe69fe697  ! 353: LDDA_I	ldda	[%r31, + 0x0697] %asi, %r19
	.word 0x87802055  ! 354: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xe647c000  ! 355: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0xe6880e80  ! 356: LDUBA_R	lduba	[%r0, %r0] 0x74, %r19
mondo_2_191:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d94c013  ! 357: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
pmu_2_192:
	nop
	setx 0xfffff4e2fffff2b9, %g1, %g7
	.word 0xa3800007  ! 358: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_2_193-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_193:
	.word 0x97a0016a  ! 359: FABSq	dis not found

splash_cmpr_2_194:
	setx 0xd3799d353d850d9e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 360: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99540000  ! 361: RDPR_GL	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01970  ! 362: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 363: LDX_R	ldx	[%r31 + %r0], %r13
intveclr_2_196:
	setx 0xdf52983ad5396760, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 365: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01970  ! 366: FqTOd	dis not found

DS_2_198:
	.word 0x9ba0c9c6  ! 1: FDIVd	fdivd	%f34, %f6, %f44
	.word 0xab6706d3	! Random illegal ?
	.word 0xe9114010  ! 1: LDQF_R	-	[%r5, %r16], %f20
	.word 0xa1a4c834  ! 367: FADDs	fadds	%f19, %f20, %f16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01967  ! 368: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.xir_2_200)) -> intp(2,1,3)
xir_2_200:
	.word 0xa98174c3  ! 369: WR_SET_SOFTINT_I	wr	%r5, 0x14c3, %set_softint
	.word 0x87802055  ! 370: WRASI_I	wr	%r0, 0x0055, %asi
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_201
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_201:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 371: RDPC	rd	%pc, %r19
	.word 0x99902001  ! 372: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x87802014  ! 373: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd4d804a0  ! 374: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
change_to_randtl_2_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_202:
	.word 0x8f902001  ! 375: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x97464000  ! 376: RD_STICK_CMPR_REG	rd	%-, %r11
DS_2_203:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 377: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe06ffe9a  ! 378: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffe9a]
	.word 0x83d020b3  ! 379: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0x87802063  ! 380: WRASI_I	wr	%r0, 0x0063, %asi
splash_cmpr_2_204:
	setx 0x06c0979f8f915a5a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 381: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_2_205:
	.word 0x81982fc6  ! 382: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc6, %hpstate
splash_cmpr_2_206:
	setx 0xafbf9df53feea228, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 383: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93480000  ! 384: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
tagged_2_207:
	taddcctv %r9, 0x1553, %r18
	.word 0xe407fe9a  ! 385: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r18
	.word 0xa190200d  ! 386: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xe527fe9a  ! 387: STF_I	st	%f18, [0x1e9a, %r31]
splash_cmpr_2_208:
	setx 0x4af1c66fbbba39fc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 388: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 389: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_2_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 390: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_2_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_210:
	.word 0x8f902000  ! 391: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe4d00e60  ! 392: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r18
debug_2_211:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 393: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe49ffe9a  ! 394: LDDA_I	ldda	[%r31, + 0xfffffe9a] %asi, %r18
	.word 0xe42ffe9a  ! 395: STB_I	stb	%r18, [%r31 + 0xfffffe9a]
	.word 0xe457fe9a  ! 396: LDSH_I	ldsh	[%r31 + 0xfffffe9a], %r18
DS_2_212:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa7a289c4  ! 1: FDIVd	fdivd	%f10, %f4, %f50
	normalw
	.word 0x91458000  ! 397: RD_SOFTINT_REG	rd	%softint, %r8
tagged_2_213:
	taddcctv %r24, 0x15b4, %r18
	.word 0xd607fe9a  ! 398: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r11
splash_hpstate_2_214:
	.word 0x81982f1d  ! 399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1d, %hpstate
	.word 0xd60fc000  ! 400: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0x87902322  ! 401: WRPR_TT_I	wrpr	%r0, 0x0322, %tt
splash_tba_2_215:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 402: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01966  ! 403: FqTOd	dis not found

debug_2_217:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 404: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd48008a0  ! 405: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_218:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 406: RDPC	rd	%pc, %r12
	rd %pc, %r19
	add %r19, (ivw_2_219-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_219:
	.word 0x95a00168  ! 407: FABSq	dis not found

splash_htba_2_220:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 408: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
change_to_randtl_2_221:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_221:
	.word 0x8f902003  ! 409: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x87802004  ! 410: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_2_222:
	setx 0xa66872a9c19bf16a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 411: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_2_223:
	nop
	setx 0xfffff0b9fffff22c, %g1, %g7
	.word 0xa3800007  ! 412: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_2_224:
	tsubcctv %r22, 0x12d2, %r20
	.word 0xe207fe9a  ! 413: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r17
mondo_2_225:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d940013  ! 414: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
splash_tba_2_226:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 415: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f80395c  ! 416: SIR	sir	0x195c
splash_cmpr_2_227:
	setx 0xd9f94632732fc2a3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 417: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99520000  ! 418: RDPR_PIL	<illegal instruction>
debug_2_228:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 419: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0x91d020b3  ! 420: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xdadfe030  ! 421: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
debug_2_229:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 422: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93686388  ! 423: SDIVX_I	sdivx	%r1, 0x0388, %r9
	.word 0xd08fe030  ! 424: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r8
splash_hpstate_2_231:
	.word 0x81982835  ! 425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0835, %hpstate
mondo_2_232:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d904014  ! 426: WRPR_WSTATE_R	wrpr	%r1, %r20, %wstate
	.word 0xd08008a0  ! 427: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd057c000  ! 428: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01960  ! 429: FqTOd	dis not found

	rd %pc, %r19
	add %r19, (ivw_2_234-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_234:
	.word 0xa5a00167  ! 430: FABSq	dis not found

	.word 0xa5540000  ! 431: RDPR_GL	<illegal instruction>
	.word 0x90d0fa6c  ! 432: UMULcc_I	umulcc 	%r3, 0xfffffa6c, %r8
	.word 0x87802014  ! 433: WRASI_I	wr	%r0, 0x0014, %asi
splash_cmpr_2_235:
	setx 0x8e7f54628f2b0a5c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 434: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_2_236:
	.word 0x81982d97  ! 435: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d97, %hpstate
	.word 0xd0c004a0  ! 436: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0xa9a049c3  ! 437: FDIVd	fdivd	%f32, %f34, %f20
tagged_2_237:
	taddcctv %r15, 0x162b, %r23
	.word 0xd607f110  ! 438: LDUW_I	lduw	[%r31 + 0xfffff110], %r11
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_238)) -> intp(0,0,16)
intvec_2_238:
	.word 0x39400001  ! 439: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_2_239:
	setx 0x15be90059c068fce, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6d804a0  ! 441: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
splash_cmpr_2_240:
	setx 0x4a711406a1e0622b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 442: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01964  ! 443: FqTOd	dis not found

	.word 0xe6d7e000  ! 444: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r19
	.word 0x87802088  ! 445: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01972  ! 446: FqTOd	dis not found

	.word 0x91d02033  ! 447: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_cmpr_2_243:
	setx 0xc92e357146926243, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9026fa  ! 449: WRPR_PSTATE_I	wrpr	%r0, 0x06fa, %pstate
change_to_randtl_2_244:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_244:
	.word 0x8f902002  ! 450: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	rd %pc, %r19
	add %r19, (ivw_2_245-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_245:
	.word 0xa5a0016b  ! 451: FABSq	dis not found

debug_2_246:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 452: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0x9ba509c9  ! 453: FDIVd	fdivd	%f20, %f40, %f44
tagged_2_247:
	taddcctv %r6, 0x1b7a, %r9
	.word 0xd407f110  ! 454: LDUW_I	lduw	[%r31 + 0xfffff110], %r10
	.word 0x87802004  ! 455: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd48008a0  ! 456: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
debug_2_248:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 457: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	setx 0x17304b018f49e95a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_249:
	.word 0x39400001  ! 458: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3464000  ! 459: RD_STICK_CMPR_REG	rd	%-, %r17
!$EV trig_pc_d(1, @VA(.MAIN.xir_2_250)) -> intp(2,1,3)
xir_2_250:
	.word 0xa984ba22  ! 460: WR_SET_SOFTINT_I	wr	%r18, 0x1a22, %set_softint
intveclr_2_251:
	setx 0x7b64ae23ee32e10b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 461: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_252:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 462: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
mondo_2_253:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d948014  ! 463: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
debug_2_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 464: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_255
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_255
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_255:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 465: RDPC	rd	%pc, %r20
change_to_randtl_2_256:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_256:
	.word 0x8f902000  ! 466: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9f803312  ! 467: SIR	sir	0x1312
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_257:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 468: RDPC	rd	%pc, %r20
debug_2_258:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 469: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
tagged_2_259:
	taddcctv %r14, 0x1cd6, %r20
	.word 0xd407f2f6  ! 470: LDUW_I	lduw	[%r31 + 0xfffff2f6], %r10
	.word 0x9353c000  ! 471: RDPR_FQ	<illegal instruction>
	.word 0xd24ff2f6  ! 472: LDSB_I	ldsb	[%r31 + 0xfffff2f6], %r9
	.word 0x8d902cbd  ! 473: WRPR_PSTATE_I	wrpr	%r0, 0x0cbd, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93693a64  ! 474: SDIVX_I	sdivx	%r4, 0xfffffa64, %r9
splash_cmpr_2_261:
	setx 0x4d739624b6e1f259, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 475: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_2_262:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_262:
	.word 0x8f902000  ! 476: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd697e000  ! 477: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
	.word 0x96f827b7  ! 478: SDIVcc_I	sdivcc 	%r0, 0x07b7, %r11
splash_cmpr_2_263:
	setx 0x640a016b29c11ddc, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 479: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 480: LDX_R	ldx	[%r31 + %r0], %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 481: LDX_R	ldx	[%r31 + %r0], %r10
mondo_2_264:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d918007  ! 482: WRPR_WSTATE_R	wrpr	%r6, %r7, %wstate
splash_tba_2_265:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 483: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 484: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8780204f  ! 485: WRASI_I	wr	%r0, 0x004f, %asi
splash_tba_2_266:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 486: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd49fe208  ! 487: LDDA_I	ldda	[%r31, + 0x0208] %asi, %r10
debug_2_267:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 488: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	.word 0xa9824010  ! 489: WR_SET_SOFTINT_R	wr	%r9, %r16, %set_softint
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_268
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_268
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_268:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 490: RDPC	rd	%pc, %r9
	.word 0x8d802004  ! 491: WRFPRS_I	wr	%r0, 0x0004, %fprs
debug_2_269:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 492: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_2_270:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 493: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	setx 0x1518f8ea97c2e1a2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_271:
	.word 0x39400001  ! 494: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_272:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe931000b  ! 1: STQF_R	-	%f20, [%r11, %r4]
	normalw
	.word 0x97458000  ! 495: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xe68008a0  ! 496: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
debug_2_273:
	nop
	mov 8, %r18
	.word 0xe6f00852  ! 497: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 498: LDX_R	ldx	[%r31 + %r0], %r19
tagged_2_274:
	tsubcctv %r7, 0x1fcf, %r2
	.word 0xe607e208  ! 499: LDUW_I	lduw	[%r31 + 0x0208], %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_2_275)) -> intp(2,1,3)
xir_2_275:
	.word 0xa98461d4  ! 500: WR_SET_SOFTINT_I	wr	%r17, 0x01d4, %set_softint
mondo_2_276:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d92400d  ! 501: WRPR_WSTATE_R	wrpr	%r9, %r13, %wstate
splash_cmpr_2_277:
	setx 0xbd2ce401a9cc3ea1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 502: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_2_278:
	tsubcctv %r26, 0x1a5a, %r16
	.word 0xe607f4d4  ! 503: LDUW_I	lduw	[%r31 + 0xfffff4d4], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 504: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xad823911  ! 505: WR_SOFTINT_REG_I	wr	%r8, 0x1911, %softint
	.word 0x879022b4  ! 506: WRPR_TT_I	wrpr	%r0, 0x02b4, %tt
	.word 0xe677c000  ! 507: STX_R	stx	%r19, [%r31 + %r0]
	rd %pc, %r19
	add %r19, (ivw_2_279-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_279:
	.word 0x91a00170  ! 508: FABSq	dis not found

DS_2_280:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 509: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_2_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_281:
	.word 0x8f902003  ! 510: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_282
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_282
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_282:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 511: RDPC	rd	%pc, %r9
splash_hpstate_2_283:
	.word 0x81982515  ! 512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0515, %hpstate
mondo_2_284:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d950008  ! 513: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_285
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_285
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_285:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 514: RDPC	rd	%pc, %r9
	.word 0xe83fec34  ! 515: STD_I	std	%r20, [%r31 + 0x0c34]
debug_2_286:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 516: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_2_287:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_287:
	.word 0x8f902001  ! 517: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa7a189d4  ! 518: FDIVd	fdivd	%f6, %f20, %f50
mondo_2_288:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d918010  ! 519: WRPR_WSTATE_R	wrpr	%r6, %r16, %wstate
mondo_2_289:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d94c00c  ! 520: WRPR_WSTATE_R	wrpr	%r19, %r12, %wstate
change_to_randtl_2_290:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_290:
	.word 0x8f902002  ! 521: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd327c000  ! 522: STF_R	st	%f9, [%r0, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 523: LDX_R	ldx	[%r31 + %r0], %r9
debug_2_291:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 524: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
intveclr_2_292:
	setx 0xc1f9f81e661b442d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01974  ! 526: FqTOd	dis not found

mondo_2_294:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d914010  ! 527: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
tagged_2_295:
	taddcctv %r15, 0x16d3, %r2
	.word 0xd407ec34  ! 528: LDUW_I	lduw	[%r31 + 0x0c34], %r10
	.word 0x8d802000  ! 529: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8790208d  ! 530: WRPR_TT_I	wrpr	%r0, 0x008d, %tt
	.word 0x91d02035  ! 531: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x30800001  ! 532: BA	ba,a	<label_0x1>
	.word 0xd4c804a0  ! 533: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x83d02035  ! 534: Tcc_I	te	icc_or_xcc, %r0 + 53
splash_cmpr_2_296:
	setx 0xf982740908d24db3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 535: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01962  ! 536: FqTOd	dis not found

DS_2_298:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd5317cce  ! 1: STQF_I	-	%f10, [0x1cce, %r5]
	normalw
	.word 0x95458000  ! 537: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x93902004  ! 538: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91d02033  ! 539: Tcc_I	ta	icc_or_xcc, %r0 + 51
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 540: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1687d5b  ! 541: SDIVX_I	sdivx	%r1, 0xfffffd5b, %r16
	.word 0x38800001  ! 542: BGU	bgu,a	<label_0x1>
	.word 0xe6c7e020  ! 543: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r19
splash_lsu_2_300:
	setx 0x2eb713c40d16fee3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 544: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802088  ! 545: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x91d02033  ! 546: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902001  ! 547: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 548: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f8034c2  ! 549: SIR	sir	0x14c2
	setx 0x01aebb6008f50b79, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_301:
	.word 0x39400001  ! 550: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 551: LDX_R	ldx	[%r31 + %r0], %r19
splash_tba_2_302:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 552: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_2_303:
	.word 0x81982c2e  ! 553: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c2e, %hpstate
splash_lsu_2_304:
	setx 0x93457ace25f588b5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 554: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_305:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d95000c  ! 555: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976c296d  ! 556: SDIVX_I	sdivx	%r16, 0x096d, %r11
	.word 0x95500000  ! 557: RDPR_TPC	rdpr	%tpc, %r10
splash_cmpr_2_307:
	setx 0x5f75ba118492d3ca, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 558: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_2_308:
	.word 0x81982c87  ! 559: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c87, %hpstate
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_309
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_309
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_309:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 560: RDPC	rd	%pc, %r20
splash_tba_2_310:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 561: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_2_311:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 562: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xdad7e000  ! 563: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
debug_2_312:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 564: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0x93480000  ! 565: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
splash_cmpr_2_313:
	setx 0x541cff7309813217, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 566: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd66fe176  ! 567: LDSTUB_I	ldstub	%r11, [%r31 + 0x0176]
	.word 0xd6d00e40  ! 568: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r11
	.word 0xd697e030  ! 569: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r11
splash_cmpr_2_314:
	setx 0xcb74909c6b1c4ae8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 570: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_315:
	setx 0x04f73df05018dd89, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 571: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd61fe176  ! 572: LDD_I	ldd	[%r31 + 0x0176], %r11
change_to_randtl_2_316:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_316:
	.word 0x8f902002  ! 573: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	rd %pc, %r19
	add %r19, (ivw_2_317-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_317:
	.word 0x97a00168  ! 574: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_2_318-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_318:
	.word 0x95a00172  ! 575: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 576: LDX_R	ldx	[%r31 + %r0], %r9
mondo_2_319:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d904012  ! 577: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
	.word 0x93902002  ! 578: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x95a109d3  ! 579: FDIVd	fdivd	%f4, %f50, %f10
intveclr_2_320:
	setx 0x3a81dadf50f16082, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 580: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 581: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe48008a0  ! 582: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	rd %pc, %r19
	add %r19, (ivw_2_321-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_321:
	.word 0x95a00173  ! 583: FABSq	dis not found

	.word 0xa1902001  ! 584: WRPR_GL_I	wrpr	%r0, 0x0001, %-
intveclr_2_322:
	setx 0x6726ba94223be731, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 585: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_2_323:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 586: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_2_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d934012  ! 587: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
splash_cmpr_2_325:
	setx 0x2675d70cc85e5ed1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 588: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe29004a0  ! 589: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
	.word 0xe25fe176  ! 590: LDX_I	ldx	[%r31 + 0x0176], %r17
	.word 0x93902006  ! 591: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 592: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 593: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x87902068  ! 594: WRPR_TT_I	wrpr	%r0, 0x0068, %tt
debug_2_326:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 595: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196a  ! 596: FqTOd	dis not found

splash_cmpr_2_328:
	setx 0x4205fe9817c84e11, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 597: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe257c000  ! 598: LDSH_R	ldsh	[%r31 + %r0], %r17
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_329
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_329
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_329:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 599: RDPC	rd	%pc, %r13
	.word 0xe41fc000  ! 600: LDD_R	ldd	[%r31 + %r0], %r18
splash_cmpr_2_330:
	setx 0x97064911c11c8eb8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 601: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 602: LDX_R	ldx	[%r31 + %r0], %r18
mondo_2_331:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d920007  ! 603: WRPR_WSTATE_R	wrpr	%r8, %r7, %wstate
	.word 0xa5a109c3  ! 604: FDIVd	fdivd	%f4, %f34, %f18
splash_lsu_2_332:
	setx 0x38bc1cb814a330a1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 605: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02033  ! 606: Tcc_I	te	icc_or_xcc, %r0 + 51
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_333
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_333
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_333:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 607: RDPC	rd	%pc, %r12
splash_tba_2_334:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 608: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81510000  ! 609: RDPR_TICK	rdpr	%tick, %r0
	.word 0xd057c000  ! 610: LDSH_R	ldsh	[%r31 + %r0], %r8
tagged_2_335:
	taddcctv %r4, 0x189a, %r13
	.word 0xd007e176  ! 611: LDUW_I	lduw	[%r31 + 0x0176], %r8
	.word 0x91d02035  ! 612: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa7454000  ! 613: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
intveclr_2_336:
	setx 0xd9c50a0b7678e491, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 614: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_2_337:
	setx 0xb99c3ba34d60f3d5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 615: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_2_338:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xf95a504b	! Random illegal ?
	.word 0xe312000c  ! 1: LDQF_R	-	[%r8, %r12], %f17
	.word 0x95a3082d  ! 616: FADDs	fadds	%f12, %f13, %f10
mondo_2_339:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d918005  ! 617: WRPR_WSTATE_R	wrpr	%r6, %r5, %wstate
splash_cmpr_2_340:
	setx 0xf498ddae7da85691, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 618: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02032  ! 619: Tcc_I	ta	icc_or_xcc, %r0 + 50
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 620: LDX_R	ldx	[%r31 + %r0], %r16
splash_cmpr_2_341:
	setx 0x4bbb557d8700bf8e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 621: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0c004a0  ! 622: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
	.word 0xe137e176  ! 623: STQF_I	-	%f16, [0x0176, %r31]
change_to_randtl_2_342:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_342:
	.word 0x8f902001  ! 624: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_2_343:
	taddcctv %r1, 0x1c25, %r10
	.word 0xe007e176  ! 625: LDUW_I	lduw	[%r31 + 0x0176], %r16
	.word 0x9ba44d2b  ! 626: FsMULd	fsmuld	%f17, %f42, %f44
splash_tba_2_344:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 627: WRPR_TBA_R	wrpr	%r0, %r2, %tba
pmu_2_345:
	nop
	setx 0xfffff29bfffffecd, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01974  ! 629: FqTOd	dis not found

	.word 0xad80fd34  ! 630: WR_SOFTINT_REG_I	wr	%r3, 0x1d34, %softint
	.word 0xd447c000  ! 631: LDSW_R	ldsw	[%r31 + %r0], %r10
	.word 0x93902006  ! 632: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_2_347:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 633: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_348
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_348
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_348:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 634: RDPC	rd	%pc, %r19
DS_2_349:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x97a209c3  ! 1: FDIVd	fdivd	%f8, %f34, %f42
	normalw
	.word 0x91458000  ! 635: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x9b464000  ! 636: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0xd28008a0  ! 637: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x9b500000  ! 638: RDPR_TPC	<illegal instruction>
tagged_2_350:
	tsubcctv %r12, 0x1bd2, %r17
	.word 0xe807fb6a  ! 639: LDUW_I	lduw	[%r31 + 0xfffffb6a], %r20
	.word 0xa1902005  ! 640: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	setx 0xe3587e66ea4c8708, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_351:
	.word 0x39400001  ! 641: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_2_352:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 642: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_2_353:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 643: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_354
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_354
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_354:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 644: RDPC	rd	%pc, %r13
	.word 0xda8008a0  ! 645: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x93454000  ! 646: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0x93902000  ! 647: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_cmpr_2_355:
	setx 0x23502cd2308c9d3a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 648: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02034  ! 649: Tcc_I	ta	icc_or_xcc, %r0 + 52
debug_2_356:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 650: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd81ffb6a  ! 651: LDD_I	ldd	[%r31 + 0xfffffb6a], %r12
mondo_2_357:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d95000b  ! 652: WRPR_WSTATE_R	wrpr	%r20, %r11, %wstate
	.word 0x879022f5  ! 653: WRPR_TT_I	wrpr	%r0, 0x02f5, %tt
	.word 0x8790208c  ! 654: WRPR_TT_I	wrpr	%r0, 0x008c, %tt
	.word 0x95480000  ! 655: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x879022b2  ! 656: WRPR_TT_I	wrpr	%r0, 0x02b2, %tt
	.word 0x87802020  ! 657: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8d802004  ! 658: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87802010  ! 659: WRASI_I	wr	%r0, 0x0010, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_358)) -> intp(6,0,10)
intvec_2_358:
	.word 0x39400001  ! 660: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_359:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 661: SAVE_R	save	%r31, %r0, %r31
	.word 0x9b540000  ! 662: RDPR_GL	<illegal instruction>
debug_2_360:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 663: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
debug_2_361:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 664: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xda1fc000  ! 665: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x95b4cfe2  ! 666: FONES	e	%f10
	.word 0xe6800c20  ! 667: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r19
	.word 0xe6dfe010  ! 668: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r19
	.word 0x87802016  ! 669: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x93902005  ! 670: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
change_to_randtl_2_362:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_362:
	.word 0x8f902002  ! 671: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa7a01a71  ! 672: FqTOi	fqtoi	
	.word 0xe48fe020  ! 673: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r18
	.word 0xe49004a0  ! 674: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0x8d903324  ! 675: WRPR_PSTATE_I	wrpr	%r0, 0x1324, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01972  ! 676: FqTOd	dis not found

	.word 0xd89fc020  ! 677: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0x93902004  ! 678: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
mondo_2_364:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d948002  ! 679: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
	.word 0xd89004a0  ! 680: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
mondo_2_365:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d904009  ! 681: WRPR_WSTATE_R	wrpr	%r1, %r9, %wstate
splash_cmpr_2_366:
	setx 0x75208ec31df1806d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 682: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 683: LDX_R	ldx	[%r31 + %r0], %r12
DS_2_367:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 684: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x87802016  ! 685: WRASI_I	wr	%r0, 0x0016, %asi
intveclr_2_368:
	setx 0x3f3a8ad60dfcd144, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 686: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01969  ! 687: FqTOd	dis not found

splash_lsu_2_370:
	setx 0xc19c2a13c8047261, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 688: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_2_371:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 689: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 690: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x93902002  ! 691: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01963  ! 692: FqTOd	dis not found

	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 693: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x73384099d58e8083, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_373:
	.word 0x39400001  ! 694: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d804a0  ! 695: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
splash_hpstate_2_374:
	.word 0x81982cc6  ! 696: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc6, %hpstate
	.word 0x91d02035  ! 697: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd48fe010  ! 698: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0xa3450000  ! 699: RD_SET_SOFTINT	rd	%set_softint, %r17
change_to_randtl_2_375:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_375:
	.word 0x8f902003  ! 700: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_cmpr_2_376:
	setx 0xe7eef96fb9d33350, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 701: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_2_377:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_377:
	.word 0x8f902003  ! 702: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
change_to_randtl_2_378:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_378:
	.word 0x8f902001  ! 703: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_2_379:
	taddcctv %r19, 0x1f3a, %r17
	.word 0xd607fb6a  ! 704: LDUW_I	lduw	[%r31 + 0xfffffb6a], %r11
	.word 0xd6d804a0  ! 705: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916c7821  ! 706: SDIVX_I	sdivx	%r17, 0xfffff821, %r8
	.word 0x87802016  ! 707: WRASI_I	wr	%r0, 0x0016, %asi
change_to_randtl_2_381:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_381:
	.word 0x8f902002  ! 708: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
change_to_randtl_2_382:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_382:
	.word 0x8f902001  ! 709: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 710: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8790206a  ! 711: WRPR_TT_I	wrpr	%r0, 0x006a, %tt
	.word 0x8790204d  ! 712: WRPR_TT_I	wrpr	%r0, 0x004d, %tt
debug_2_383:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 713: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4dfe020  ! 714: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
	.word 0x99902002  ! 715: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x93902004  ! 716: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_hpstate_2_384:
	.word 0x81982306  ! 717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0306, %hpstate
splash_tba_2_385:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 718: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_2_386:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 719: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_2_387:
	set 0x003a0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 720: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x97450000  ! 721: RD_SET_SOFTINT	rd	%set_softint, %r11
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 722: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd81ffa75  ! 723: LDD_I	ldd	[%r31 + 0xfffffa75], %r12
	.word 0x8d903c88  ! 724: WRPR_PSTATE_I	wrpr	%r0, 0x1c88, %pstate
	.word 0x9191b24d  ! 725: WRPR_PIL_I	wrpr	%r6, 0x124d, %pil
mondo_2_388:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d940001  ! 726: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
tagged_2_389:
	taddcctv %r12, 0x1b9c, %r15
	.word 0xd807f31f  ! 727: LDUW_I	lduw	[%r31 + 0xfffff31f], %r12
DS_2_390:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xb959fa02	! Random illegal ?
	.word 0x91a309c3  ! 1: FDIVd	fdivd	%f12, %f34, %f8
	.word 0xa1a2082a  ! 728: FADDs	fadds	%f8, %f10, %f16
	.word 0x99520000  ! 729: RDPR_PIL	<illegal instruction>
	.word 0x2a700001  ! 730: BPCS	<illegal instruction>
splash_cmpr_2_391:
	setx 0x667347988586ab5f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 731: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_392:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 732: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93d02035  ! 733: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_cmpr_2_393:
	setx 0xd34f0da205395e44, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 734: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9768f615  ! 735: SDIVX_I	sdivx	%r3, 0xfffff615, %r11
	rd %pc, %r19
	add %r19, (ivw_2_395-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_395:
	.word 0xa1a00171  ! 736: FABSq	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01964  ! 737: FqTOd	dis not found

	setx 0x83aeb24db6a73304, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_397:
	.word 0x39400001  ! 738: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_2_398:
	setx 0xa1d0939a4893b81b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 739: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91520000  ! 740: RDPR_PIL	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956b7cd1  ! 741: SDIVX_I	sdivx	%r13, 0xfffffcd1, %r10
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_400
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_400
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_400:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 742: RDPC	rd	%pc, %r11
debug_2_401:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 743: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9b540000  ! 744: RDPR_GL	<illegal instruction>
	.word 0x8d802000  ! 745: WRFPRS_I	wr	%r0, 0x0000, %fprs
    set sync_thr_counter1, %r23
    mov 2, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_402
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_402
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_402:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 746: RDPC	rd	%pc, %r11
splash_tba_2_403:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 747: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_2_404:
	setx 0x52149b7c80064b03, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 748: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_405:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d918000  ! 749: WRPR_WSTATE_R	wrpr	%r6, %r0, %wstate
	.word 0x3c800001  ! 750: BPOS	bpos,a	<label_0x1>
DS_2_406:
	.word 0x97a109c5  ! 1: FDIVd	fdivd	%f4, %f36, %f42
	.word 0xbfe7c000  ! 751: SAVE_R	save	%r31, %r0, %r31
mondo_2_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d908004  ! 752: WRPR_WSTATE_R	wrpr	%r2, %r4, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16877c8  ! 753: SDIVX_I	sdivx	%r1, 0xfffff7c8, %r16
	.word 0x9750c000  ! 754: RDPR_TT	rdpr	%tt, %r11
	.word 0x87802016  ! 755: WRASI_I	wr	%r0, 0x0016, %asi
tagged_2_409:
	taddcctv %r1, 0x1e64, %r10
	.word 0xd607e3d0  ! 756: LDUW_I	lduw	[%r31 + 0x03d0], %r11
	.word 0xd6d7e020  ! 757: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r11
	.word 0xa350c000  ! 758: RDPR_TT	<illegal instruction>
mondo_2_410:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d940014  ! 759: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
splash_lsu_2_411:
	setx 0x2542c87daf46142f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 760: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_412:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d91800c  ! 761: WRPR_WSTATE_R	wrpr	%r6, %r12, %wstate
	.word 0x9b480000  ! 762: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0xa9540000  ! 763: RDPR_GL	<illegal instruction>
change_to_randtl_2_413:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_413:
	.word 0x8f902002  ! 764: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_2_414:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d940002  ! 765: WRPR_WSTATE_R	wrpr	%r16, %r2, %wstate
debug_2_415:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 766: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_2_416:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d920008  ! 767: WRPR_WSTATE_R	wrpr	%r8, %r8, %wstate
	.word 0xe2d7e010  ! 768: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r17
debug_2_417:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 769: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0x8780204f  ! 770: WRASI_I	wr	%r0, 0x004f, %asi
splash_cmpr_2_418:
	setx 0x32d4f88becc6b535, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 771: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d020b4  ! 772: Tcc_I	te	icc_or_xcc, %r0 + 180
!$EV trig_pc_d(1, @VA(.MAIN.xir_2_419)) -> intp(2,1,3)
xir_2_419:
	.word 0xa984a450  ! 773: WR_SET_SOFTINT_I	wr	%r18, 0x0450, %set_softint
	.word 0xe20fc000  ! 774: LDUB_R	ldub	[%r31 + %r0], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 775: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_2_420:
	.word 0x81982afc  ! 776: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0afc, %hpstate
	.word 0x91d02035  ! 777: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_2_421:
	taddcctv %r12, 0x18a1, %r10
	.word 0xe207f180  ! 778: LDUW_I	lduw	[%r31 + 0xfffff180], %r17
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 779: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_2_422:
	setx 0x1095ce150756afa2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 780: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93500000  ! 781: RDPR_TPC	<illegal instruction>
debug_2_423:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 782: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
debug_2_424:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 783: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa968b3b8  ! 784: SDIVX_I	sdivx	%r2, 0xfffff3b8, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91687c41  ! 785: SDIVX_I	sdivx	%r1, 0xfffffc41, %r8
	.word 0xd137c000  ! 786: STQF_R	-	%f8, [%r0, %r31]
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 787: Tcc_R	te	icc_or_xcc, %r0 + %r30
mondo_2_427:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d934002  ! 788: WRPR_WSTATE_R	wrpr	%r13, %r2, %wstate
donret_2_428:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_428-donret_2_428), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_428:
	.word 0xd0fff5af  ! 789: SWAPA_I	swapa	%r8, [%r31 + 0xfffff5af] %asi
	.word 0xd127c000  ! 790: STF_R	st	%f8, [%r0, %r31]
	.word 0x9745c000  ! 791: RD_TICK_CMPR_REG	rd	%-, %r11
mondo_2_429:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d91c003  ! 792: WRPR_WSTATE_R	wrpr	%r7, %r3, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01969  ! 793: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 794: LDX_R	ldx	[%r31 + %r0], %r11
splash_cmpr_2_431:
	setx 0x7d062d4c4c45afc7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 795: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_432:
	setx 0xb0ad3ae3e68e967a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 796: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 797: BPNE	<illegal instruction>
	.word 0x93902007  ! 798: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
debug_2_433:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 1: LDX_R	ldx	[%r31 + %r0], %r17
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_0
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_0:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 2: RDPC	rd	%pc, %r10
	.word 0xd28fe020  ! 3: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r9
	.word 0x91d02033  ! 4: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_cmpr_1_1:
	setx 0x234a83a237c43c93, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 5: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 6: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a0196d  ! 7: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 8: LDX_R	ldx	[%r31 + %r0], %r17
debug_1_3:
	nop
	mov 8, %r18
	.word 0xe6f00852  ! 9: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0xe2d00e40  ! 10: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r17
	.word 0x8790238b  ! 11: WRPR_TT_I	wrpr	%r0, 0x038b, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9168bebe  ! 12: SDIVX_I	sdivx	%r2, 0xfffffebe, %r8
debug_1_5:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 13: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_1_6:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 14: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
splash_cmpr_1_7:
	setx 0xd4802c923917d9f9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 15: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56c2153  ! 16: SDIVX_I	sdivx	%r16, 0x0153, %r18
splash_cmpr_1_9:
	setx 0xbae5f80959f3b25a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 17: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879020af  ! 18: WRPR_TT_I	wrpr	%r0, 0x00af, %tt
change_to_randtl_1_10:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_10:
	.word 0x8f902001  ! 19: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
donret_1_11:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_11-donret_1_11), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_11:
	.word 0xe2ffe750  ! 20: SWAPA_I	swapa	%r17, [%r31 + 0x0750] %asi
change_to_randtl_1_12:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_12:
	.word 0x8f902002  ! 21: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_1_13:
	taddcctv %r1, 0x1536, %r6
	.word 0xe207e750  ! 22: LDUW_I	lduw	[%r31 + 0x0750], %r17
	.word 0x22700001  ! 23: BPE	<illegal instruction>
	.word 0xa345c000  ! 24: RD_TICK_CMPR_REG	rd	%-, %r17
mondo_1_14:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d900007  ! 25: WRPR_WSTATE_R	wrpr	%r0, %r7, %wstate
	.word 0x91d020b5  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x87802016  ! 27: WRASI_I	wr	%r0, 0x0016, %asi
intveclr_1_15:
	setx 0x315b4c2a32569ac8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8cfe000  ! 29: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
	.word 0xa190200f  ! 30: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_lsu_1_16:
	setx 0x8f31b04531d0c623, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 31: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 32: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
mondo_1_17:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d91c00d  ! 33: WRPR_WSTATE_R	wrpr	%r7, %r13, %wstate
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 34: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_hpstate_1_18:
	.word 0x81982076  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0076, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 36: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x91480000  ! 37: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
splash_lsu_1_19:
	setx 0x9319ebf8b1149d43, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 38: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 39: RD_STICK_REG	stbar
	.word 0x81510000  ! 40: RDPR_TICK	rdpr	%tick, %r0
tagged_1_20:
	tsubcctv %r18, 0x1b90, %r1
	.word 0xd807e750  ! 41: LDUW_I	lduw	[%r31 + 0x0750], %r12
splash_lsu_1_21:
	setx 0xc6419a12e03146b7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 42: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d94000b  ! 43: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
	.word 0xa1902005  ! 44: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xa2494010  ! 45: MULX_R	mulx 	%r5, %r16, %r17
	.word 0xa7450000  ! 46: RD_SET_SOFTINT	rd	%set_softint, %r19
intveclr_1_23:
	setx 0x1c2c1762331165f2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 47: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_24)) -> intp(2,0,29)
intvec_1_24:
	.word 0x39400001  ! 48: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879022a4  ! 49: WRPR_TT_I	wrpr	%r0, 0x02a4, %tt
debug_1_25:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 50: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_1_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d90c012  ! 51: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
	.word 0x879022cf  ! 52: WRPR_TT_I	wrpr	%r0, 0x02cf, %tt
	.word 0x99a4c9c1  ! 53: FDIVd	fdivd	%f50, %f32, %f12
splash_hpstate_1_27:
	.word 0x81982465  ! 54: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0465, %hpstate
	.word 0x87802016  ! 55: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x91d02034  ! 56: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x3e700001  ! 57: BPVC	<illegal instruction>
	.word 0xe60fc000  ! 58: LDUB_R	ldub	[%r31 + %r0], %r19
	rd %pc, %r19
	add %r19, (ivw_1_28-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_28:
	.word 0x97a00162  ! 59: FABSq	dis not found

	.word 0xd48fe030  ! 60: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
	.word 0xd4c7e000  ! 61: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r10
DS_1_29:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 62: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
splash_tba_1_30:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 63: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_1_31:
	setx 0xf3a8bc8c3e6598c0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 64: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_32:
	setx 0x87c1e089751635fe, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 65: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d918013  ! 66: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
debug_1_34:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 67: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_1_35:
	.word 0x81982f8d  ! 68: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8d, %hpstate
intveclr_1_36:
	setx 0x8a8a4ca640a8c273, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902834  ! 70: WRPR_PSTATE_I	wrpr	%r0, 0x0834, %pstate
splash_cmpr_1_37:
	setx 0xaaacbace485bd282, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 71: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_1_38:
	nop
	setx 0xfffff949fffff3d0, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_1_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d92c008  ! 73: WRPR_WSTATE_R	wrpr	%r11, %r8, %wstate
	rd %pc, %r19
	add %r19, (ivw_1_40-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_40:
	.word 0x93a00166  ! 74: FABSq	dis not found

pmu_1_41:
	nop
	setx 0xfffff923fffff73d, %g1, %g7
	.word 0xa3800007  ! 75: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd02fe750  ! 76: STB_I	stb	%r8, [%r31 + 0x0750]
splash_cmpr_1_42:
	setx 0x9f17d2032ec437ad, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 77: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3c700001  ! 78: BPPOS	<illegal instruction>
debug_1_43:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 79: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_1_44:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 80: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd08008a0  ! 81: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	rd %pc, %r19
	add %r19, (ivw_1_45-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_45:
	.word 0xa1a00167  ! 82: FABSq	dis not found

splash_lsu_1_46:
	setx 0xd2ec2d036efb5dd9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 83: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_1_47:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_47:
	.word 0x8f902001  ! 84: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 85: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 86: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91906e2a  ! 87: WRPR_PIL_I	wrpr	%r1, 0x0e2a, %pil
	.word 0xd6900e40  ! 88: LDUHA_R	lduha	[%r0, %r0] 0x72, %r11
	.word 0xa1902005  ! 89: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xd6c00e40  ! 90: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r11
mondo_1_48:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d944000  ! 91: WRPR_WSTATE_R	wrpr	%r17, %r0, %wstate
splash_cmpr_1_49:
	setx 0xc613009f59b0b183, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 92: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 93: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87802004  ! 94: WRASI_I	wr	%r0, 0x0004, %asi
mondo_1_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d90c000  ! 95: WRPR_WSTATE_R	wrpr	%r3, %r0, %wstate
	.word 0xd6dfe000  ! 96: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
	.word 0x93902006  ! 97: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
change_to_randtl_1_51:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_51:
	.word 0x8f902002  ! 98: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
change_to_randtl_1_52:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_52:
	.word 0x8f902000  ! 99: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d9039f8  ! 100: WRPR_PSTATE_I	wrpr	%r0, 0x19f8, %pstate
	.word 0x91d020b3  ! 101: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xd73fc000  ! 102: STDF_R	std	%f11, [%r0, %r31]
	.word 0xa982c00b  ! 103: WR_SET_SOFTINT_R	wr	%r11, %r11, %set_softint
	.word 0xa190200a  ! 104: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x87902313  ! 105: WRPR_TT_I	wrpr	%r0, 0x0313, %tt
debug_1_53:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 106: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_1_54-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_54:
	.word 0xa7a00166  ! 107: FABSq	dis not found

splash_lsu_1_55:
	setx 0xaa6600e4c4b31915, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 108: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 109: SIAM	siam	1
debug_1_56:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 110: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_1_57:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_57-donret_1_57), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_57:
	.word 0xd8fff234  ! 111: SWAPA_I	swapa	%r12, [%r31 + 0xfffff234] %asi
DS_1_58:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x934989af	! Random illegal ?
	.word 0x9ba00553  ! 1: FSQRTd	fsqrt	
	.word 0x97a04828  ! 112: FADDs	fadds	%f1, %f8, %f11
splash_tba_1_59:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 113: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa9a449f4  ! 114: FDIVq	dis not found

	.word 0xd4d00e60  ! 115: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 116: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936cb391  ! 117: SDIVX_I	sdivx	%r18, 0xfffff391, %r9
intveclr_1_61:
	setx 0x0c778ff8894fd410, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 118: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 119: SIAM	siam	1
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 120: LDX_R	ldx	[%r31 + %r0], %r13
tagged_1_62:
	tsubcctv %r16, 0x1965, %r21
	.word 0xda07e1f9  ! 121: LDUW_I	lduw	[%r31 + 0x01f9], %r13
	.word 0xda57c000  ! 122: LDSH_R	ldsh	[%r31 + %r0], %r13
tagged_1_63:
	taddcctv %r6, 0x1a70, %r4
	.word 0xda07e1f9  ! 123: LDUW_I	lduw	[%r31 + 0x01f9], %r13
	.word 0xdac004a0  ! 124: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
donret_1_64:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_64-donret_1_64), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_64:
	.word 0xdaffe1f9  ! 125: SWAPA_I	swapa	%r13, [%r31 + 0x01f9] %asi
	.word 0xdacfe030  ! 126: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
mondo_1_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d910011  ! 127: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
splash_cmpr_1_66:
	setx 0x02cb03362019b088, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 128: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_1_67:
	.word 0x81982acf  ! 129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acf, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_1_68)) -> intp(1,1,3)
xir_1_68:
	.word 0xa9843b80  ! 130: WR_SET_SOFTINT_I	wr	%r16, 0x1b80, %set_softint
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01972  ! 131: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_70)) -> intp(6,0,7)
intvec_1_70:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 133: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x91d020b5  ! 134: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xd4800c40  ! 135: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r10
debug_1_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 136: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_1_72:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_72-donret_1_72), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_72:
	.word 0xd4fff312  ! 137: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
splash_lsu_1_73:
	setx 0x57b489a1dad80633, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 138: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_1_74:
	setx 0x3e46314f1bc9d5f7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 139: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d02033  ! 140: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xa5a01a73  ! 141: FqTOi	fqtoi	
tagged_1_75:
	taddcctv %r15, 0x186d, %r2
	.word 0xe207f312  ! 142: LDUW_I	lduw	[%r31 + 0xfffff312], %r17
splash_hpstate_1_76:
	.word 0x81982e0c  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0c, %hpstate
	.word 0x95454000  ! 144: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
splash_htba_1_77:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 145: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_1_78:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 146: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_1_79:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 147: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_80)) -> intp(0,0,20)
intvec_1_80:
	.word 0x39400001  ! 148: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_81:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 149: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_1_82:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_82:
	.word 0x8f902002  ! 150: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_1_83:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 151: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93d020b4  ! 152: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0x8d90388e  ! 153: WRPR_PSTATE_I	wrpr	%r0, 0x188e, %pstate
	.word 0x9150c000  ! 154: RDPR_TT	<illegal instruction>
DS_1_84:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 155: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_1_85:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 156: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802080  ! 157: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x91d02033  ! 158: Tcc_I	ta	icc_or_xcc, %r0 + 51
intveclr_1_86:
	setx 0x92418b5ae509069c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 159: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_1_87:
	taddcctv %r22, 0x17c9, %r14
	.word 0xe607f312  ! 160: LDUW_I	lduw	[%r31 + 0xfffff312], %r19
mondo_1_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d930003  ! 161: WRPR_WSTATE_R	wrpr	%r12, %r3, %wstate
splash_tba_1_89:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 162: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_1_90:
	.word 0x81982366  ! 163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0366, %hpstate
splash_cmpr_1_91:
	setx 0x1bab509ca3aa6d64, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 164: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe71fc000  ! 165: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x93902002  ! 166: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_1_92:
	.word 0x99a009c5  ! 1: FDIVd	fdivd	%f0, %f36, %f12
	.word 0xd1638c37	! Random illegal ?
	.word 0x9ba00545  ! 1: FSQRTd	fsqrt	
	.word 0x93a14832  ! 167: FADDs	fadds	%f5, %f18, %f9
	.word 0xa190200c  ! 168: WRPR_GL_I	wrpr	%r0, 0x000c, %-
donret_1_93:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_93-donret_1_93), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_93:
	.word 0xd4fff312  ! 169: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
	.word 0x93902006  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
donret_1_94:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_94-donret_1_94), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_94:
	.word 0xd4fff312  ! 171: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
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
	.word 0xa5414000  ! 172: RDPC	rd	%pc, %r18
	.word 0xd0dfe010  ! 173: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r8
	.word 0xa1902006  ! 174: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd127c000  ! 175: STF_R	st	%f8, [%r0, %r31]
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 176: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_1_96:
	setx 0x0cd62360dad05b66, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 177: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902df9  ! 178: WRPR_PSTATE_I	wrpr	%r0, 0x0df9, %pstate
	.word 0x99480000  ! 179: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0xd28008a0  ! 180: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x91d02032  ! 181: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81510000  ! 182: RDPR_TICK	rdpr	%tick, %r0
mondo_1_97:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d904000  ! 183: WRPR_WSTATE_R	wrpr	%r1, %r0, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_98)) -> intp(7,0,23)
intvec_1_98:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_1_99:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_99:
	.word 0x8f902002  ! 185: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x93902005  ! 186: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 187: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_1_100:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_100:
	.word 0x8f902000  ! 188: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d802000  ! 189: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_1_101:
	setx 0xe0289847c2a8a568, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 190: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01971  ! 191: FqTOd	dis not found

	setx 0x045b3b7515f4c03a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_103:
	.word 0x39400001  ! 192: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0880e60  ! 193: LDUBA_R	lduba	[%r0, %r0] 0x73, %r8
mondo_1_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d924003  ! 194: WRPR_WSTATE_R	wrpr	%r9, %r3, %wstate
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 195: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd09004a0  ! 196: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0xd06ff312  ! 197: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff312]
change_to_randtl_1_105:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_105:
	.word 0x8f902001  ! 198: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_1_106:
	setx 0x89f38f4a516d4fb0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 199: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802010  ! 200: WRASI_I	wr	%r0, 0x0010, %asi
	rd %pc, %r19
	add %r19, (ivw_1_107-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_107:
	.word 0x91a00170  ! 201: FABSq	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa368e65a  ! 202: SDIVX_I	sdivx	%r3, 0x065a, %r17
	.word 0xd6d004a0  ! 203: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
splash_hpstate_1_109:
	.word 0x8198250c  ! 204: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050c, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 205: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_1_110:
	.word 0xa9a509c6  ! 1: FDIVd	fdivd	%f20, %f6, %f20
	.word 0xbfe7c000  ! 206: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_1_111:
	setx 0x266c49b68e09c2fa, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 208: LDX_R	ldx	[%r31 + %r0], %r11
splash_tba_1_112:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 209: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_1_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 210: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd727c000  ! 211: STF_R	st	%f11, [%r0, %r31]
	.word 0xa9834005  ! 212: WR_SET_SOFTINT_R	wr	%r13, %r5, %set_softint
mondo_1_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d94c007  ! 213: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
mondo_1_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d910003  ! 214: WRPR_WSTATE_R	wrpr	%r4, %r3, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01972  ! 215: FqTOd	dis not found

	.word 0x92fa8012  ! 216: SDIVcc_R	sdivcc 	%r10, %r18, %r9
	.word 0xa190200c  ! 217: WRPR_GL_I	wrpr	%r0, 0x000c, %-
mondo_1_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d940013  ! 218: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
	.word 0xe48008a0  ! 219: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe4bfc020  ! 220: STDA_R	stda	%r18, [%r31 + %r0] 0x01
tagged_1_118:
	tsubcctv %r14, 0x126e, %r6
	.word 0xe407f661  ! 221: LDUW_I	lduw	[%r31 + 0xfffff661], %r18
	.word 0x879022de  ! 222: WRPR_TT_I	wrpr	%r0, 0x02de, %tt
	.word 0xe4d7e020  ! 223: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r18
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
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
	.word 0xa1414000  ! 224: RDPC	rd	%pc, %r16
	rd %pc, %r19
	add %r19, (ivw_1_120-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_120:
	.word 0x91a00172  ! 225: FABSq	dis not found

donret_1_121:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_121-donret_1_121), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_121:
	.word 0xd2fff661  ! 226: SWAPA_I	swapa	%r9, [%r31 + 0xfffff661] %asi
	.word 0xa983000a  ! 227: WR_SET_SOFTINT_R	wr	%r12, %r10, %set_softint
	.word 0x964b400b  ! 228: MULX_R	mulx 	%r13, %r11, %r11
splash_lsu_1_122:
	setx 0x068c13c6b2b7b947, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 229: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xb49194b750129a48, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_123:
	.word 0x39400001  ! 230: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe21ff661  ! 231: LDD_I	ldd	[%r31 + 0xfffff661], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 232: LDX_R	ldx	[%r31 + %r0], %r17
DS_1_124:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 233: SAVE_R	save	%r31, %r0, %r31
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 234: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_1_125:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 235: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_126)) -> intp(6,0,9)
intvec_1_126:
	.word 0x39400001  ! 236: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_1_127:
	setx 0x87ec0d3cff004331, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_1_128-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_128:
	.word 0x95a00167  ! 238: FABSq	dis not found

	.word 0xd69ff661  ! 239: LDDA_I	ldda	[%r31, + 0xfffff661] %asi, %r11
DS_1_129:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd3314011  ! 1: STQF_R	-	%f9, [%r17, %r5]
	normalw
	.word 0x91458000  ! 240: RD_SOFTINT_REG	rd	%softint, %r8
splash_lsu_1_130:
	setx 0x4266a8616183a5b9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 241: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2c804a0  ! 242: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
splash_tba_1_131:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 243: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902008  ! 244: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xe2d004a0  ! 245: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0xe2d004a0  ! 246: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0xa7520000  ! 247: RDPR_PIL	<illegal instruction>
tagged_1_132:
	tsubcctv %r9, 0x1bb3, %r18
	.word 0xe607f661  ! 248: LDUW_I	lduw	[%r31 + 0xfffff661], %r19
debug_1_133:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 249: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe727c000  ! 250: STF_R	st	%f19, [%r0, %r31]
splash_lsu_1_134:
	setx 0x0fb5a81624080891, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 251: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x32800001  ! 252: BNE	bne,a	<label_0x1>
	.word 0xe6d804a0  ! 253: LDXA_R	ldxa	[%r0, %r0] 0x25, %r19
	.word 0xe66ff661  ! 254: LDSTUB_I	ldstub	%r19, [%r31 + 0xfffff661]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01974  ! 255: FqTOd	dis not found

	.word 0x8d903977  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x1977, %pstate
splash_hpstate_1_136:
	.word 0x81982844  ! 257: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0844, %hpstate
	.word 0x93a10dc1  ! 258: FdMULq	fdmulq	
	.word 0x93902000  ! 259: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_1_137:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d920004  ! 260: WRPR_WSTATE_R	wrpr	%r8, %r4, %wstate
	.word 0xe2900e60  ! 261: LDUHA_R	lduha	[%r0, %r0] 0x73, %r17
mondo_1_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d91800d  ! 262: WRPR_WSTATE_R	wrpr	%r6, %r13, %wstate
	.word 0x87802058  ! 263: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x87802014  ! 264: WRASI_I	wr	%r0, 0x0014, %asi
mondo_1_139:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d910011  ! 265: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
mondo_1_140:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d908013  ! 266: WRPR_WSTATE_R	wrpr	%r2, %r19, %wstate
debug_1_141:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 267: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x8d9033b2  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x13b2, %pstate
debug_1_142:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 269: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab808009  ! 270: WR_CLEAR_SOFTINT_R	wr	%r2, %r9, %clear_softint
debug_1_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 271: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1902005  ! 272: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 273: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01970  ! 274: FqTOd	dis not found

tagged_1_145:
	taddcctv %r25, 0x19d4, %r24
	.word 0xd407f661  ! 275: LDUW_I	lduw	[%r31 + 0xfffff661], %r10
splash_cmpr_1_146:
	setx 0xc61005893ebd3af7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 276: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903852  ! 277: WRPR_PSTATE_I	wrpr	%r0, 0x1852, %pstate
splash_tba_1_147:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 278: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_1_148:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 279: RESTORE_R	restore	%r31, %r0, %r31
mondo_1_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d940006  ! 280: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
splash_lsu_1_150:
	setx 0xa0edf46e8e202cd3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 281: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902156  ! 282: WRPR_TT_I	wrpr	%r0, 0x0156, %tt
	setx 0x0bea04181a9a4dfe, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_151:
	.word 0x39400001  ! 283: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd40ff661  ! 284: LDUB_I	ldub	[%r31 + 0xfffff661], %r10
mondo_1_152:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d92c012  ! 285: WRPR_WSTATE_R	wrpr	%r11, %r18, %wstate
	.word 0x8d9031ad  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x11ad, %pstate
splash_tba_1_153:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 287: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879022a1  ! 288: WRPR_TT_I	wrpr	%r0, 0x02a1, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996d2295  ! 289: SDIVX_I	sdivx	%r20, 0x0295, %r12
splash_tba_1_155:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 290: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_1_156:
	setx 0xccbafdc0315d57b3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 291: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196d  ! 292: FqTOd	dis not found

splash_lsu_1_158:
	setx 0xf66858f8aee78a5b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 293: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 294: RD_STICK_REG	stbar
splash_cmpr_1_159:
	setx 0xae6409325066555f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_160:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 296: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d90311a  ! 297: WRPR_PSTATE_I	wrpr	%r0, 0x111a, %pstate
	.word 0xa8fcb59b  ! 298: SDIVcc_I	sdivcc 	%r18, 0xfffff59b, %r20
	.word 0xa984000b  ! 299: WR_SET_SOFTINT_R	wr	%r16, %r11, %set_softint
	.word 0xd08804a0  ! 300: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	setx 0x95c21d989bba28d0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_161:
	.word 0x39400001  ! 301: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0d804a0  ! 302: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_162)) -> intp(6,0,31)
intvec_1_162:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_163:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d94000c  ! 304: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
	.word 0xab848004  ! 305: WR_CLEAR_SOFTINT_R	wr	%r18, %r4, %clear_softint
	.word 0xa190200a  ! 306: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 307: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a0196b  ! 308: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01967  ! 309: FqTOd	dis not found

	.word 0x87802063  ! 310: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x87802010  ! 311: WRASI_I	wr	%r0, 0x0010, %asi
mondo_1_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d95000c  ! 312: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
pmu_1_167:
	nop
	setx 0xfffff6fafffff617, %g1, %g7
	.word 0xa3800007  ! 313: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_1_168:
	setx 0x8dd823b69cb21bbb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 314: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790201b  ! 315: WRPR_TT_I	wrpr	%r0, 0x001b, %tt
	.word 0x9194f0a5  ! 316: WRPR_PIL_I	wrpr	%r19, 0x10a5, %pil
tagged_1_169:
	taddcctv %r19, 0x15f6, %r14
	.word 0xd607ee91  ! 317: LDUW_I	lduw	[%r31 + 0x0e91], %r11
	.word 0x9ba449c1  ! 318: FDIVd	fdivd	%f48, %f32, %f44
	.word 0xd06fee91  ! 319: LDSTUB_I	ldstub	%r8, [%r31 + 0x0e91]
	.word 0xd06fee91  ! 320: LDSTUB_I	ldstub	%r8, [%r31 + 0x0e91]
splash_tba_1_170:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 321: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa0c4740c  ! 322: ADDCcc_I	addccc 	%r17, 0xfffff40c, %r16
splash_cmpr_1_171:
	setx 0x02297dbf3dd4bc67, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 323: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802004  ! 324: WRASI_I	wr	%r0, 0x0004, %asi
	rd %pc, %r19
	add %r19, (ivw_1_172-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_172:
	.word 0xa9a00162  ! 325: FABSq	dis not found

	.word 0x93902001  ! 326: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
debug_1_173:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 327: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_1_174:
	.word 0x81982244  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0244, %hpstate
splash_tba_1_175:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 329: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_176:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 330: RDPC	rd	%pc, %r10
tagged_1_177:
	taddcctv %r21, 0x1da2, %r7
	.word 0xda07e697  ! 331: LDUW_I	lduw	[%r31 + 0x0697], %r13
	.word 0xda1fc000  ! 332: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x96490005  ! 333: MULX_R	mulx 	%r4, %r5, %r11
	.word 0xe2dfe000  ! 334: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r17
change_to_randtl_1_178:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_178:
	.word 0x8f902002  ! 335: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_1_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 336: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_1_180:
	setx 0x21cb484268e986b3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902004  ! 338: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
mondo_1_181:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d928002  ! 339: WRPR_WSTATE_R	wrpr	%r10, %r2, %wstate
donret_1_182:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_182-donret_1_182), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_182:
	.word 0xe2ffe697  ! 340: SWAPA_I	swapa	%r17, [%r31 + 0x0697] %asi
	.word 0xe26fe697  ! 341: LDSTUB_I	ldstub	%r17, [%r31 + 0x0697]
intveclr_1_183:
	setx 0x1ad440af1e65fba3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 342: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_184:
	.word 0x81982115  ! 343: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0115, %hpstate
intveclr_1_185:
	setx 0xde4bc5b1df8a1519, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_186)) -> intp(5,0,18)
intvec_1_186:
	.word 0x39400001  ! 345: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfe020  ! 346: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r17
splash_tba_1_187:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 347: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200e  ! 348: WRPR_GL_I	wrpr	%r0, 0x000e, %-
change_to_randtl_1_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_188:
	.word 0x8f902000  ! 349: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	setx 0x6bc35fdfad123f10, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_189:
	.word 0x39400001  ! 350: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 351: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_190
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_190
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_190:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 352: RDPC	rd	%pc, %r20
	.word 0xe69fe697  ! 353: LDDA_I	ldda	[%r31, + 0x0697] %asi, %r19
	.word 0x8780201c  ! 354: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xe647c000  ! 355: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0xe68804a0  ! 356: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
mondo_1_191:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d93000b  ! 357: WRPR_WSTATE_R	wrpr	%r12, %r11, %wstate
pmu_1_192:
	nop
	setx 0xfffffc3cfffff3ab, %g1, %g7
	.word 0xa3800007  ! 358: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_1_193-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_193:
	.word 0x95a00174  ! 359: FABSq	dis not found

splash_cmpr_1_194:
	setx 0xedb5a01a748a9cc3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 360: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99540000  ! 361: RDPR_GL	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01969  ! 362: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 363: LDX_R	ldx	[%r31 + %r0], %r13
intveclr_1_196:
	setx 0x47c7ebe8320b045a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 365: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01964  ! 366: FqTOd	dis not found

DS_1_198:
	.word 0x97a009d2  ! 1: FDIVd	fdivd	%f0, %f18, %f42
	.word 0xff6af38c	! Random illegal ?
	.word 0xd1124005  ! 1: LDQF_R	-	[%r9, %r5], %f8
	.word 0xa9a30826  ! 367: FADDs	fadds	%f12, %f6, %f20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01968  ! 368: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.xir_1_200)) -> intp(1,1,3)
xir_1_200:
	.word 0xa981644a  ! 369: WR_SET_SOFTINT_I	wr	%r5, 0x044a, %set_softint
	.word 0x87802004  ! 370: WRASI_I	wr	%r0, 0x0004, %asi
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_201
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_201:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 371: RDPC	rd	%pc, %r17
	.word 0x99902001  ! 372: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x87802058  ! 373: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xd4d80e40  ! 374: LDXA_R	ldxa	[%r0, %r0] 0x72, %r10
change_to_randtl_1_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_202:
	.word 0x8f902001  ! 375: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x9b464000  ! 376: RD_STICK_CMPR_REG	rd	%-, %r13
DS_1_203:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 377: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe06ffe9a  ! 378: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffe9a]
	.word 0x91d02034  ! 379: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87802080  ! 380: WRASI_I	wr	%r0, 0x0080, %asi
splash_cmpr_1_204:
	setx 0x1ab105c0bd413ad1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 381: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_1_205:
	.word 0x81982b5c  ! 382: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5c, %hpstate
splash_cmpr_1_206:
	setx 0xe7c2e80c4fe4ce02, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 383: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9b480000  ! 384: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
tagged_1_207:
	taddcctv %r9, 0x1379, %r15
	.word 0xe407fe9a  ! 385: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r18
	.word 0xa190200d  ! 386: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xe527fe9a  ! 387: STF_I	st	%f18, [0x1e9a, %r31]
splash_cmpr_1_208:
	setx 0x54ff08548b7637cd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 388: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 389: WRFPRS_I	wr	%r0, 0x0004, %fprs
debug_1_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 390: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_1_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_210:
	.word 0x8f902001  ! 391: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe4d00e80  ! 392: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r18
debug_1_211:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 393: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe49ffe9a  ! 394: LDDA_I	ldda	[%r31, + 0xfffffe9a] %asi, %r18
	.word 0xe42ffe9a  ! 395: STB_I	stb	%r18, [%r31 + 0xfffffe9a]
	.word 0xe457fe9a  ! 396: LDSH_I	ldsh	[%r31 + 0xfffffe9a], %r18
DS_1_212:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa3a4c9cc  ! 1: FDIVd	fdivd	%f50, %f12, %f48
	normalw
	.word 0x99458000  ! 397: RD_SOFTINT_REG	rd	%softint, %r12
tagged_1_213:
	taddcctv %r13, 0x1ea7, %r3
	.word 0xd607fe9a  ! 398: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r11
splash_hpstate_1_214:
	.word 0x81982996  ! 399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0996, %hpstate
	.word 0xd60fc000  ! 400: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0x87902377  ! 401: WRPR_TT_I	wrpr	%r0, 0x0377, %tt
splash_tba_1_215:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 402: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01974  ! 403: FqTOd	dis not found

debug_1_217:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 404: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd48008a0  ! 405: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_218:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 406: RDPC	rd	%pc, %r10
	rd %pc, %r19
	add %r19, (ivw_1_219-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_219:
	.word 0x99a00166  ! 407: FABSq	dis not found

splash_htba_1_220:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 408: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
change_to_randtl_1_221:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_221:
	.word 0x8f902001  ! 409: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x87802020  ! 410: WRASI_I	wr	%r0, 0x0020, %asi
splash_cmpr_1_222:
	setx 0xf1a9b75ac2ff4487, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 411: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_1_223:
	nop
	setx 0xfffff96cfffff711, %g1, %g7
	.word 0xa3800007  ! 412: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_1_224:
	tsubcctv %r15, 0x1e94, %r8
	.word 0xe207fe9a  ! 413: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r17
mondo_1_225:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d900004  ! 414: WRPR_WSTATE_R	wrpr	%r0, %r4, %wstate
splash_tba_1_226:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 415: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f803b81  ! 416: SIR	sir	0x1b81
splash_cmpr_1_227:
	setx 0x6c8687925bbd083b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 417: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7520000  ! 418: RDPR_PIL	<illegal instruction>
debug_1_228:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 419: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x83d02032  ! 420: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xdadfe010  ! 421: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
debug_1_229:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 422: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976a3bbf  ! 423: SDIVX_I	sdivx	%r8, 0xfffffbbf, %r11
	.word 0xd08fe010  ! 424: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r8
splash_hpstate_1_231:
	.word 0x81982c2c  ! 425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c2c, %hpstate
mondo_1_232:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d908011  ! 426: WRPR_WSTATE_R	wrpr	%r2, %r17, %wstate
	.word 0xd0800c40  ! 427: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r8
	.word 0xd057c000  ! 428: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01963  ! 429: FqTOd	dis not found

	rd %pc, %r19
	add %r19, (ivw_1_234-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_234:
	.word 0xa9a00167  ! 430: FABSq	dis not found

	.word 0xa5540000  ! 431: RDPR_GL	<illegal instruction>
	.word 0x90d4ef38  ! 432: UMULcc_I	umulcc 	%r19, 0x0f38, %r8
	.word 0x87802016  ! 433: WRASI_I	wr	%r0, 0x0016, %asi
splash_cmpr_1_235:
	setx 0x350f78e43a4c7e94, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 434: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_1_236:
	.word 0x81982045  ! 435: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0045, %hpstate
	.word 0xd0c00e60  ! 436: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r8
	.word 0xa9a049c0  ! 437: FDIVd	fdivd	%f32, %f0, %f20
tagged_1_237:
	taddcctv %r17, 0x1430, %r14
	.word 0xd607f110  ! 438: LDUW_I	lduw	[%r31 + 0xfffff110], %r11
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_238)) -> intp(4,0,29)
intvec_1_238:
	.word 0x39400001  ! 439: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_1_239:
	setx 0xea8d4e0f7566ef05, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6d804a0  ! 441: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
splash_cmpr_1_240:
	setx 0xbdff04739e969278, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 442: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a0196b  ! 443: FqTOd	dis not found

	.word 0xe6d7e000  ! 444: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r19
	.word 0x87802089  ! 445: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01967  ! 446: FqTOd	dis not found

	.word 0x91d020b2  ! 447: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_cmpr_1_243:
	setx 0x7a7e856de065d76e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903810  ! 449: WRPR_PSTATE_I	wrpr	%r0, 0x1810, %pstate
change_to_randtl_1_244:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_244:
	.word 0x8f902000  ! 450: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	rd %pc, %r19
	add %r19, (ivw_1_245-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_245:
	.word 0x95a0016a  ! 451: FABSq	dis not found

debug_1_246:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 452: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x93a089cc  ! 453: FDIVd	fdivd	%f2, %f12, %f40
tagged_1_247:
	taddcctv %r2, 0x13e6, %r13
	.word 0xd407f110  ! 454: LDUW_I	lduw	[%r31 + 0xfffff110], %r10
	.word 0x87802020  ! 455: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xd48008a0  ! 456: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
debug_1_248:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 457: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	setx 0xef25cc9a34961a82, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_249:
	.word 0x39400001  ! 458: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3464000  ! 459: RD_STICK_CMPR_REG	rd	%-, %r17
!$EV trig_pc_d(1, @VA(.MAIN.xir_1_250)) -> intp(1,1,3)
xir_1_250:
	.word 0xa980648a  ! 460: WR_SET_SOFTINT_I	wr	%r1, 0x048a, %set_softint
intveclr_1_251:
	setx 0x6895148b2d7b37fb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 461: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_252:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 462: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
mondo_1_253:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d930012  ! 463: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
debug_1_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 464: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_255
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_255
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_255:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 465: RDPC	rd	%pc, %r18
change_to_randtl_1_256:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_256:
	.word 0x8f902000  ! 466: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9f8030ee  ! 467: SIR	sir	0x10ee
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_257:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 468: RDPC	rd	%pc, %r16
debug_1_258:
	nop
	mov 8, %r18
	.word 0xd0f00852  ! 469: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
tagged_1_259:
	taddcctv %r15, 0x1157, %r9
	.word 0xd407f2f6  ! 470: LDUW_I	lduw	[%r31 + 0xfffff2f6], %r10
	.word 0xa353c000  ! 471: RDPR_FQ	<illegal instruction>
	.word 0xd24ff2f6  ! 472: LDSB_I	ldsb	[%r31 + 0xfffff2f6], %r9
	.word 0x8d9030f6  ! 473: WRPR_PSTATE_I	wrpr	%r0, 0x10f6, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96a301c  ! 474: SDIVX_I	sdivx	%r8, 0xfffff01c, %r20
splash_cmpr_1_261:
	setx 0x10c82a7474db44e7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 475: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_1_262:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_262:
	.word 0x8f902000  ! 476: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd697e000  ! 477: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
	.word 0x90f96bf8  ! 478: SDIVcc_I	sdivcc 	%r5, 0x0bf8, %r8
splash_cmpr_1_263:
	setx 0x1b404b5ea107ee2f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 479: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 480: LDX_R	ldx	[%r31 + %r0], %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 481: LDX_R	ldx	[%r31 + %r0], %r10
mondo_1_264:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d934014  ! 482: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
splash_tba_1_265:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 483: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 484: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x87802080  ! 485: WRASI_I	wr	%r0, 0x0080, %asi
splash_tba_1_266:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 486: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd49fe208  ! 487: LDDA_I	ldda	[%r31, + 0x0208] %asi, %r10
debug_1_267:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 488: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0xa9820007  ! 489: WR_SET_SOFTINT_R	wr	%r8, %r7, %set_softint
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_268
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_268
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_268:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 490: RDPC	rd	%pc, %r10
	.word 0x8d802000  ! 491: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_1_269:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 492: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_1_270:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 493: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	setx 0xdf637382f2e7d738, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_271:
	.word 0x39400001  ! 494: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_272:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe3334006  ! 1: STQF_R	-	%f17, [%r6, %r13]
	normalw
	.word 0x99458000  ! 495: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xe68008a0  ! 496: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
debug_1_273:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 497: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 498: LDX_R	ldx	[%r31 + %r0], %r19
tagged_1_274:
	tsubcctv %r18, 0x11e4, %r3
	.word 0xe607e208  ! 499: LDUW_I	lduw	[%r31 + 0x0208], %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_1_275)) -> intp(1,1,3)
xir_1_275:
	.word 0xa9843838  ! 500: WR_SET_SOFTINT_I	wr	%r16, 0x1838, %set_softint
mondo_1_276:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d908004  ! 501: WRPR_WSTATE_R	wrpr	%r2, %r4, %wstate
splash_cmpr_1_277:
	setx 0x73bdc0b370124fc4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 502: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_1_278:
	tsubcctv %r26, 0x1894, %r22
	.word 0xe607f4d4  ! 503: LDUW_I	lduw	[%r31 + 0xfffff4d4], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 504: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xad84a001  ! 505: WR_SOFTINT_REG_I	wr	%r18, 0x0001, %softint
	.word 0x87902362  ! 506: WRPR_TT_I	wrpr	%r0, 0x0362, %tt
	.word 0xe677c000  ! 507: STX_R	stx	%r19, [%r31 + %r0]
	rd %pc, %r19
	add %r19, (ivw_1_279-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_279:
	.word 0xa5a00160  ! 508: FABSq	dis not found

DS_1_280:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 509: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_1_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_281:
	.word 0x8f902000  ! 510: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_282
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_282
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_282:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 511: RDPC	rd	%pc, %r16
splash_hpstate_1_283:
	.word 0x819821d5  ! 512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d5, %hpstate
mondo_1_284:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d934007  ! 513: WRPR_WSTATE_R	wrpr	%r13, %r7, %wstate
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_285
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_285
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_285:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 514: RDPC	rd	%pc, %r10
	.word 0xe83fec34  ! 515: STD_I	std	%r20, [%r31 + 0x0c34]
debug_1_286:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 516: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_1_287:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_287:
	.word 0x8f902000  ! 517: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x99a009cc  ! 518: FDIVd	fdivd	%f0, %f12, %f12
mondo_1_288:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d92800c  ! 519: WRPR_WSTATE_R	wrpr	%r10, %r12, %wstate
mondo_1_289:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d94800d  ! 520: WRPR_WSTATE_R	wrpr	%r18, %r13, %wstate
change_to_randtl_1_290:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_290:
	.word 0x8f902001  ! 521: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd327c000  ! 522: STF_R	st	%f9, [%r0, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 523: LDX_R	ldx	[%r31 + %r0], %r9
debug_1_291:
	nop
	mov 8, %r18
	.word 0xe6f00852  ! 524: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
intveclr_1_292:
	setx 0x7411560606610eb3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01965  ! 526: FqTOd	dis not found

mondo_1_294:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d94c005  ! 527: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
tagged_1_295:
	taddcctv %r9, 0x133d, %r8
	.word 0xd407ec34  ! 528: LDUW_I	lduw	[%r31 + 0x0c34], %r10
	.word 0x8d802000  ! 529: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902391  ! 530: WRPR_TT_I	wrpr	%r0, 0x0391, %tt
	.word 0x83d020b3  ! 531: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0x30800001  ! 532: BA	ba,a	<label_0x1>
	.word 0xd4c804a0  ! 533: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x91d02033  ! 534: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_cmpr_1_296:
	setx 0x39a4f069604ec916, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 535: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01969  ! 536: FqTOd	dis not found

DS_1_298:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd534bbd7  ! 1: STQF_I	-	%f10, [0x1bd7, %r18]
	normalw
	.word 0x97458000  ! 537: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x93902005  ! 538: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x91d02035  ! 539: Tcc_I	ta	icc_or_xcc, %r0 + 53
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 540: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9968a19c  ! 541: SDIVX_I	sdivx	%r2, 0x019c, %r12
	.word 0x38800001  ! 542: BGU	bgu,a	<label_0x1>
	.word 0xe6c7e000  ! 543: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r19
splash_lsu_1_300:
	setx 0xfdaa8bffd7a3b74f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 544: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 545: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x83d02032  ! 546: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x93902006  ! 547: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 548: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802233  ! 549: SIR	sir	0x0233
	setx 0x59ea82d4c8186612, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_301:
	.word 0x39400001  ! 550: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 551: LDX_R	ldx	[%r31 + %r0], %r19
splash_tba_1_302:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 552: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_1_303:
	.word 0x8198209c  ! 553: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009c, %hpstate
splash_lsu_1_304:
	setx 0xc5ff2df853db7711, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 554: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_305:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d94c003  ! 555: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996d30c8  ! 556: SDIVX_I	sdivx	%r20, 0xfffff0c8, %r12
	.word 0x97500000  ! 557: RDPR_TPC	rdpr	%tpc, %r11
splash_cmpr_1_307:
	setx 0x8e74f5598f64a7d1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 558: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_1_308:
	.word 0x81982e9e  ! 559: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9e, %hpstate
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_309
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_309
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_309:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 560: RDPC	rd	%pc, %r8
splash_tba_1_310:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 561: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_1_311:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 562: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xdad7e000  ! 563: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
debug_1_312:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 564: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0x99480000  ! 565: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
splash_cmpr_1_313:
	setx 0x52846c59fb8f52a4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 566: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd66fe176  ! 567: LDSTUB_I	ldstub	%r11, [%r31 + 0x0176]
	.word 0xd6d004a0  ! 568: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0xd697e030  ! 569: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r11
splash_cmpr_1_314:
	setx 0x54c19d2faf311e53, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 570: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_315:
	setx 0x787713f8fe24855b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 571: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd61fe176  ! 572: LDD_I	ldd	[%r31 + 0x0176], %r11
change_to_randtl_1_316:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_316:
	.word 0x8f902001  ! 573: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	rd %pc, %r19
	add %r19, (ivw_1_317-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_317:
	.word 0x9ba0016c  ! 574: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_1_318-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_318:
	.word 0x97a0016b  ! 575: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 576: LDX_R	ldx	[%r31 + %r0], %r9
mondo_1_319:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d94c011  ! 577: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
	.word 0x93902006  ! 578: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa7a049c1  ! 579: FDIVd	fdivd	%f32, %f32, %f50
intveclr_1_320:
	setx 0x1a93cf2f57c48413, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 580: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 581: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe4800bc0  ! 582: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r18
	rd %pc, %r19
	add %r19, (ivw_1_321-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_321:
	.word 0xa1a0016d  ! 583: FABSq	dis not found

	.word 0xa1902001  ! 584: WRPR_GL_I	wrpr	%r0, 0x0001, %-
intveclr_1_322:
	setx 0x0263424b172e0458, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 585: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_1_323:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 586: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_1_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d948012  ! 587: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
splash_cmpr_1_325:
	setx 0x6fadef83678323b1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 588: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe29004a0  ! 589: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
	.word 0xe25fe176  ! 590: LDX_I	ldx	[%r31 + 0x0176], %r17
	.word 0x93902005  ! 591: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 592: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 593: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x87902361  ! 594: WRPR_TT_I	wrpr	%r0, 0x0361, %tt
debug_1_326:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 595: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01972  ! 596: FqTOd	dis not found

splash_cmpr_1_328:
	setx 0xfd57d0827aa7cbc0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 597: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe257c000  ! 598: LDSH_R	ldsh	[%r31 + %r0], %r17
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_329
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_329
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_329:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 599: RDPC	rd	%pc, %r9
	.word 0xe41fc000  ! 600: LDD_R	ldd	[%r31 + %r0], %r18
splash_cmpr_1_330:
	setx 0x398082b8a95da616, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 601: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 602: LDX_R	ldx	[%r31 + %r0], %r18
mondo_1_331:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d900009  ! 603: WRPR_WSTATE_R	wrpr	%r0, %r9, %wstate
	.word 0x91a449c1  ! 604: FDIVd	fdivd	%f48, %f32, %f8
splash_lsu_1_332:
	setx 0x3038498219e9df31, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 605: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b4  ! 606: Tcc_I	tne	icc_or_xcc, %r0 + 180
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_333
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_333
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_333:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 607: RDPC	rd	%pc, %r20
splash_tba_1_334:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 608: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81510000  ! 609: RDPR_TICK	rdpr	%tick, %r0
	.word 0xd057c000  ! 610: LDSH_R	ldsh	[%r31 + %r0], %r8
tagged_1_335:
	taddcctv %r17, 0x176a, %r4
	.word 0xd007e176  ! 611: LDUW_I	lduw	[%r31 + 0x0176], %r8
	.word 0x91d02032  ! 612: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa5454000  ! 613: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
intveclr_1_336:
	setx 0xde15cb274f17e991, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 614: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_1_337:
	setx 0xbdb9cc99c2391789, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 615: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_1_338:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd5493409	! Random illegal ?
	.word 0xe1110010  ! 1: LDQF_R	-	[%r4, %r16], %f16
	.word 0xa5a2c82b  ! 616: FADDs	fadds	%f11, %f11, %f18
mondo_1_339:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d92800d  ! 617: WRPR_WSTATE_R	wrpr	%r10, %r13, %wstate
splash_cmpr_1_340:
	setx 0x1ed94ef84eefe537, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 618: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 619: Tcc_I	ta	icc_or_xcc, %r0 + 51
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 620: LDX_R	ldx	[%r31 + %r0], %r16
splash_cmpr_1_341:
	setx 0x3a8a0f5a6056b83a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 621: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0c004a0  ! 622: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
	.word 0xe137e176  ! 623: STQF_I	-	%f16, [0x0176, %r31]
change_to_randtl_1_342:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_342:
	.word 0x8f902000  ! 624: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_1_343:
	taddcctv %r23, 0x1498, %r23
	.word 0xe007e176  ! 625: LDUW_I	lduw	[%r31 + 0x0176], %r16
	.word 0x97a20d23  ! 626: FsMULd	fsmuld	%f8, %f34, %f42
splash_tba_1_344:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 627: WRPR_TBA_R	wrpr	%r0, %r2, %tba
pmu_1_345:
	nop
	setx 0xfffff7a4fffff149, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01969  ! 629: FqTOd	dis not found

	.word 0xad80a53f  ! 630: WR_SOFTINT_REG_I	wr	%r2, 0x053f, %softint
	.word 0xd447c000  ! 631: LDSW_R	ldsw	[%r31 + %r0], %r10
	.word 0x93902005  ! 632: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_1_347:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 633: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_348
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_348
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_348:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 634: RDPC	rd	%pc, %r13
DS_1_349:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x9ba189d1  ! 1: FDIVd	fdivd	%f6, %f48, %f44
	normalw
	.word 0xa7458000  ! 635: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0x9b464000  ! 636: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0xd28008a0  ! 637: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xa9500000  ! 638: RDPR_TPC	<illegal instruction>
tagged_1_350:
	tsubcctv %r17, 0x1941, %r23
	.word 0xe807fb6a  ! 639: LDUW_I	lduw	[%r31 + 0xfffffb6a], %r20
	.word 0xa190200b  ! 640: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	setx 0xb2fcf758ad4b7693, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_351:
	.word 0x39400001  ! 641: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_1_352:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 642: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_1_353:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 643: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_354
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_354
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_354:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 644: RDPC	rd	%pc, %r8
	.word 0xda800aa0  ! 645: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r13
	.word 0xa3454000  ! 646: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0x93902004  ! 647: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_cmpr_1_355:
	setx 0x93ee12505e79429e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 648: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b4  ! 649: Tcc_I	ta	icc_or_xcc, %r0 + 180
debug_1_356:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 650: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd81ffb6a  ! 651: LDD_I	ldd	[%r31 + 0xfffffb6a], %r12
mondo_1_357:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d92c013  ! 652: WRPR_WSTATE_R	wrpr	%r11, %r19, %wstate
	.word 0x8790218e  ! 653: WRPR_TT_I	wrpr	%r0, 0x018e, %tt
	.word 0x879022a3  ! 654: WRPR_TT_I	wrpr	%r0, 0x02a3, %tt
	.word 0x97480000  ! 655: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0x87902166  ! 656: WRPR_TT_I	wrpr	%r0, 0x0166, %tt
	.word 0x87802063  ! 657: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x8d802000  ! 658: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802014  ! 659: WRASI_I	wr	%r0, 0x0014, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_358)) -> intp(7,0,17)
intvec_1_358:
	.word 0x39400001  ! 660: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_359:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 661: SAVE_R	save	%r31, %r0, %r31
	.word 0xa3540000  ! 662: RDPR_GL	<illegal instruction>
debug_1_360:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 663: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
debug_1_361:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 664: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xda1fc000  ! 665: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x91b44fe0  ! 666: FONES	e	%f8
	.word 0xe68008a0  ! 667: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe6dfe030  ! 668: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r19
	.word 0x87802010  ! 669: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x93902000  ! 670: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
change_to_randtl_1_362:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_362:
	.word 0x8f902001  ! 671: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa1a01a6a  ! 672: FqTOi	fqtoi	
	.word 0xe48fe000  ! 673: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
	.word 0xe4900e60  ! 674: LDUHA_R	lduha	[%r0, %r0] 0x73, %r18
	.word 0x8d9021b4  ! 675: WRPR_PSTATE_I	wrpr	%r0, 0x01b4, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01966  ! 676: FqTOd	dis not found

	.word 0xd89fc020  ! 677: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0x93902006  ! 678: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_1_364:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d900000  ! 679: WRPR_WSTATE_R	wrpr	%r0, %r0, %wstate
	.word 0xd89004a0  ! 680: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
mondo_1_365:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d94c008  ! 681: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
splash_cmpr_1_366:
	setx 0x1626a99b0ac4f830, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 682: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 683: LDX_R	ldx	[%r31 + %r0], %r12
DS_1_367:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 684: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x87802004  ! 685: WRASI_I	wr	%r0, 0x0004, %asi
intveclr_1_368:
	setx 0xa00fe10c79d0bfa2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 686: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01973  ! 687: FqTOd	dis not found

splash_lsu_1_370:
	setx 0x9590d06ad72a2bc3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 688: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_1_371:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 689: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 690: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x93902001  ! 691: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01973  ! 692: FqTOd	dis not found

	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 693: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x83bbe8eb8c7374ec, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_373:
	.word 0x39400001  ! 694: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d804a0  ! 695: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
splash_hpstate_1_374:
	.word 0x81982f17  ! 696: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f17, %hpstate
	.word 0x91d020b5  ! 697: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xd48fe030  ! 698: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
	.word 0x9b450000  ! 699: RD_SET_SOFTINT	rd	%set_softint, %r13
change_to_randtl_1_375:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_375:
	.word 0x8f902003  ! 700: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_cmpr_1_376:
	setx 0x315d6320033b8aa2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 701: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_1_377:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_377:
	.word 0x8f902003  ! 702: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
change_to_randtl_1_378:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_378:
	.word 0x8f902002  ! 703: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_1_379:
	taddcctv %r14, 0x1dbc, %r22
	.word 0xd607fb6a  ! 704: LDUW_I	lduw	[%r31 + 0xfffffb6a], %r11
	.word 0xd6d804a0  ! 705: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96a36e3  ! 706: SDIVX_I	sdivx	%r8, 0xfffff6e3, %r20
	.word 0x87802004  ! 707: WRASI_I	wr	%r0, 0x0004, %asi
change_to_randtl_1_381:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_381:
	.word 0x8f902003  ! 708: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
change_to_randtl_1_382:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_382:
	.word 0x8f902002  ! 709: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 710: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879021d4  ! 711: WRPR_TT_I	wrpr	%r0, 0x01d4, %tt
	.word 0x8790238e  ! 712: WRPR_TT_I	wrpr	%r0, 0x038e, %tt
debug_1_383:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 713: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4dfe020  ! 714: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
	.word 0x99902001  ! 715: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x93902007  ! 716: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_hpstate_1_384:
	.word 0x819822c7  ! 717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c7, %hpstate
splash_tba_1_385:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 718: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_1_386:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 719: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_1_387:
	set 0x003b0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 720: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93450000  ! 721: RD_SET_SOFTINT	rd	%set_softint, %r9
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 722: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd81ffa75  ! 723: LDD_I	ldd	[%r31 + 0xfffffa75], %r12
	.word 0x8d903ee7  ! 724: WRPR_PSTATE_I	wrpr	%r0, 0x1ee7, %pstate
	.word 0x919031d2  ! 725: WRPR_PIL_I	wrpr	%r0, 0x11d2, %pil
mondo_1_388:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d934014  ! 726: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
tagged_1_389:
	taddcctv %r20, 0x1c50, %r3
	.word 0xd807f31f  ! 727: LDUW_I	lduw	[%r31 + 0xfffff31f], %r12
DS_1_390:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdf6118fe	! Random illegal ?
	.word 0x93a1c9d2  ! 1: FDIVd	fdivd	%f38, %f18, %f40
	.word 0x95a3482d  ! 728: FADDs	fadds	%f13, %f13, %f10
	.word 0x97520000  ! 729: RDPR_PIL	<illegal instruction>
	.word 0x2a700001  ! 730: BPCS	<illegal instruction>
splash_cmpr_1_391:
	setx 0xa46fee9a19523505, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 731: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_392:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 732: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02034  ! 733: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_1_393:
	setx 0x601d368eb96055b1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 734: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9569b6b4  ! 735: SDIVX_I	sdivx	%r6, 0xfffff6b4, %r10
	rd %pc, %r19
	add %r19, (ivw_1_395-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_395:
	.word 0x93a00165  ! 736: FABSq	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01964  ! 737: FqTOd	dis not found

	setx 0x1ce2bc7f2bf5a50e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_397:
	.word 0x39400001  ! 738: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_1_398:
	setx 0x92d9b5c2d21a1d86, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 739: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9520000  ! 740: RDPR_PIL	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9169662f  ! 741: SDIVX_I	sdivx	%r5, 0x062f, %r8
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_400
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_400
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_400:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 742: RDPC	rd	%pc, %r10
debug_1_401:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 743: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x95540000  ! 744: RDPR_GL	<illegal instruction>
	.word 0x8d802000  ! 745: WRFPRS_I	wr	%r0, 0x0000, %fprs
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_402
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_402
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_402:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 746: RDPC	rd	%pc, %r9
splash_tba_1_403:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 747: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_1_404:
	setx 0xd94e5c3d59448763, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 748: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_405:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d92800c  ! 749: WRPR_WSTATE_R	wrpr	%r10, %r12, %wstate
	.word 0x3c800001  ! 750: BPOS	bpos,a	<label_0x1>
DS_1_406:
	.word 0x93a489d0  ! 1: FDIVd	fdivd	%f18, %f16, %f40
	.word 0xbfe7c000  ! 751: SAVE_R	save	%r31, %r0, %r31
mondo_1_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d940011  ! 752: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9568a172  ! 753: SDIVX_I	sdivx	%r2, 0x0172, %r10
	.word 0x9b50c000  ! 754: RDPR_TT	rdpr	%tt, %r13
	.word 0x87802063  ! 755: WRASI_I	wr	%r0, 0x0063, %asi
tagged_1_409:
	taddcctv %r6, 0x135d, %r4
	.word 0xd607e3d0  ! 756: LDUW_I	lduw	[%r31 + 0x03d0], %r11
	.word 0xd6d7e010  ! 757: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r11
	.word 0x9550c000  ! 758: RDPR_TT	<illegal instruction>
mondo_1_410:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d90c007  ! 759: WRPR_WSTATE_R	wrpr	%r3, %r7, %wstate
splash_lsu_1_411:
	setx 0x76d7b94a212d9c9b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 760: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_412:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d948003  ! 761: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
	.word 0xa3480000  ! 762: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xa3540000  ! 763: RDPR_GL	<illegal instruction>
change_to_randtl_1_413:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_413:
	.word 0x8f902001  ! 764: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_1_414:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d924009  ! 765: WRPR_WSTATE_R	wrpr	%r9, %r9, %wstate
debug_1_415:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 766: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_1_416:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d94800b  ! 767: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
	.word 0xe2d7e010  ! 768: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r17
debug_1_417:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 769: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0x8780201c  ! 770: WRASI_I	wr	%r0, 0x001c, %asi
splash_cmpr_1_418:
	setx 0x0d45fd3183a1fbde, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 771: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b4  ! 772: Tcc_I	ta	icc_or_xcc, %r0 + 180
!$EV trig_pc_d(1, @VA(.MAIN.xir_1_419)) -> intp(1,1,3)
xir_1_419:
	.word 0xa982eb60  ! 773: WR_SET_SOFTINT_I	wr	%r11, 0x0b60, %set_softint
	.word 0xe20fc000  ! 774: LDUB_R	ldub	[%r31 + %r0], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 775: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_1_420:
	.word 0x819829b4  ! 776: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09b4, %hpstate
	.word 0x91d02032  ! 777: Tcc_I	ta	icc_or_xcc, %r0 + 50
tagged_1_421:
	taddcctv %r15, 0x1df8, %r25
	.word 0xe207f180  ! 778: LDUW_I	lduw	[%r31 + 0xfffff180], %r17
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 779: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_1_422:
	setx 0x408f48bc1d6a1411, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 780: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7500000  ! 781: RDPR_TPC	<illegal instruction>
debug_1_423:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 782: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
debug_1_424:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 783: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9968638d  ! 784: SDIVX_I	sdivx	%r1, 0x038d, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976d2444  ! 785: SDIVX_I	sdivx	%r20, 0x0444, %r11
	.word 0xd137c000  ! 786: STQF_R	-	%f8, [%r0, %r31]
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 787: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_1_427:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d928007  ! 788: WRPR_WSTATE_R	wrpr	%r10, %r7, %wstate
donret_1_428:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_428-donret_1_428), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_428:
	.word 0xd0fff5af  ! 789: SWAPA_I	swapa	%r8, [%r31 + 0xfffff5af] %asi
	.word 0xd127c000  ! 790: STF_R	st	%f8, [%r0, %r31]
	.word 0x9b45c000  ! 791: RD_TICK_CMPR_REG	rd	%-, %r13
mondo_1_429:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d934000  ! 792: WRPR_WSTATE_R	wrpr	%r13, %r0, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01973  ! 793: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 794: LDX_R	ldx	[%r31 + %r0], %r11
splash_cmpr_1_431:
	setx 0xff888335a4d538e8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 795: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_432:
	setx 0xa942e98721e54fa5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 796: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 797: BPNE	<illegal instruction>
	.word 0x93902006  ! 798: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_1_433:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 1: LDX_R	ldx	[%r31 + %r0], %r17
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_0
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_0:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 2: RDPC	rd	%pc, %r9
	.word 0xd28fe020  ! 3: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r9
	.word 0x91d02033  ! 4: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_cmpr_0_1:
	setx 0x9e5db3d0efd3268d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 5: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 6: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01966  ! 7: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 8: LDX_R	ldx	[%r31 + %r0], %r17
debug_0_3:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_3:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_3
    nop
debug_wait0_3:
    ld [%r23], %r2
    brnz %r2, debug_wait0_3
    nop
    ba,a debug_startwait0_3
continue_debug_0_3:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_3:
    cmp %r13, %r15
    bne,a wait_for_stat_0_3
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_3:
    cmp %r14, %r15
    bne,a wait_for_debug_0_3
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00852  ! 9: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0xe2d004a0  ! 10: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0x8790225a  ! 11: WRPR_TT_I	wrpr	%r0, 0x025a, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93697a35  ! 12: SDIVX_I	sdivx	%r5, 0xfffffa35, %r9
debug_0_5:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 13: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_6:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_6:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_6
    nop
debug_wait0_6:
    ld [%r23], %r2
    brnz %r2, debug_wait0_6
    nop
    ba,a debug_startwait0_6
continue_debug_0_6:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_6:
    cmp %r13, %r15
    bne,a wait_for_stat_0_6
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_6:
    cmp %r14, %r15
    bne,a wait_for_debug_0_6
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00852  ! 14: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
splash_cmpr_0_7:
	setx 0x33308cabee44e221, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 15: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36c6750  ! 16: SDIVX_I	sdivx	%r17, 0x0750, %r17
splash_cmpr_0_9:
	setx 0x6c0b07601b92321d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 17: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790232e  ! 18: WRPR_TT_I	wrpr	%r0, 0x032e, %tt
change_to_randtl_0_10:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_10:
	.word 0x8f902001  ! 19: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
donret_0_11:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_11-donret_0_11), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_11:
	.word 0xe2ffe750  ! 20: SWAPA_I	swapa	%r17, [%r31 + 0x0750] %asi
change_to_randtl_0_12:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_12:
	.word 0x8f902000  ! 21: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_0_13:
	taddcctv %r17, 0x186f, %r8
	.word 0xe207e750  ! 22: LDUW_I	lduw	[%r31 + 0x0750], %r17
	.word 0x22700001  ! 23: BPE	<illegal instruction>
	.word 0x9945c000  ! 24: RD_TICK_CMPR_REG	rd	%-, %r12
mondo_0_14:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d934002  ! 25: WRPR_WSTATE_R	wrpr	%r13, %r2, %wstate
	.word 0x91d02034  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87802063  ! 27: WRASI_I	wr	%r0, 0x0063, %asi
intveclr_0_15:
	setx 0xb992797e58a218df, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8cfe010  ! 29: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r12
	.word 0xa190200e  ! 30: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_lsu_0_16:
	setx 0x3b2f667530686d8b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 31: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 32: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_0_17:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d928007  ! 33: WRPR_WSTATE_R	wrpr	%r10, %r7, %wstate
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 34: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_hpstate_0_18:
	.word 0x819828d6  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d6, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 36: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x99480000  ! 37: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
splash_lsu_0_19:
	setx 0x40f42a1fda9fb55f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 38: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 39: RD_STICK_REG	stbar
	.word 0x81510000  ! 40: RDPR_TICK	rdpr	%tick, %r0
tagged_0_20:
	tsubcctv %r3, 0x119b, %r3
	.word 0xd807e750  ! 41: LDUW_I	lduw	[%r31 + 0x0750], %r12
splash_lsu_0_21:
	setx 0x8f91126280a321eb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 42: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d94c002  ! 43: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
	.word 0xa1902006  ! 44: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x964c000b  ! 45: MULX_R	mulx 	%r16, %r11, %r11
	.word 0x9b450000  ! 46: RD_SET_SOFTINT	rd	%set_softint, %r13
intveclr_0_23:
	setx 0x6a1624f7cf8efdc6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 47: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_24)) -> intp(2,0,30)
intvec_0_24:
	.word 0x39400001  ! 48: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902152  ! 49: WRPR_TT_I	wrpr	%r0, 0x0152, %tt
debug_0_25:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 50: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d924014  ! 51: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
	.word 0x879022e7  ! 52: WRPR_TT_I	wrpr	%r0, 0x02e7, %tt
	.word 0xa7a209cb  ! 53: FDIVd	fdivd	%f8, %f42, %f50
splash_hpstate_0_27:
	.word 0x81982e9e  ! 54: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9e, %hpstate
	.word 0x87802080  ! 55: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x91d02032  ! 56: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x3e700001  ! 57: BPVC	<illegal instruction>
	.word 0xe60fc000  ! 58: LDUB_R	ldub	[%r31 + %r0], %r19
cmp_0_28:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_28:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_28
    nop
cmp_wait0_28:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_28
    nop
    ba,a cmp_startwait0_28
continue_cmp_0_28:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x98, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x95a0016d  ! 59: FABSq	dis not found

	.word 0xd48fe010  ! 60: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0xd4c7e000  ! 61: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r10
DS_0_29:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 62: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
splash_tba_0_30:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 63: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_0_31:
	setx 0x5ecf31b9f5c2b61f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 64: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_32:
	setx 0xd631d34ea07cc4bb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 65: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d930004  ! 66: WRPR_WSTATE_R	wrpr	%r12, %r4, %wstate
debug_0_34:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 67: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_0_35:
	.word 0x8198211e  ! 68: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011e, %hpstate
intveclr_0_36:
	setx 0x305132fa507702a2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 69: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902d72  ! 70: WRPR_PSTATE_I	wrpr	%r0, 0x0d72, %pstate
splash_cmpr_0_37:
	setx 0x42189b1d57a6cb9c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 71: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_0_38:
	nop
	setx 0xfffffe30fffffe80, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_0_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d910005  ! 73: WRPR_WSTATE_R	wrpr	%r4, %r5, %wstate
cmp_0_40:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_40:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_40
    nop
cmp_wait0_40:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_40
    nop
    ba,a cmp_startwait0_40
continue_cmp_0_40:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xe8, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91a00172  ! 74: FABSq	dis not found

pmu_0_41:
	nop
	setx 0xfffffa7dfffff0bc, %g1, %g7
	.word 0xa3800007  ! 75: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd02fe750  ! 76: STB_I	stb	%r8, [%r31 + 0x0750]
splash_cmpr_0_42:
	setx 0xdff2a65ce49ed688, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 77: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3c700001  ! 78: BPPOS	<illegal instruction>
debug_0_43:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 79: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_0_44:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 80: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd0800c60  ! 81: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r8
cmp_0_45:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_45:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_45
    nop
cmp_wait0_45:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_45
    nop
    ba,a cmp_startwait0_45
continue_cmp_0_45:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xda, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x97a00170  ! 82: FABSq	dis not found

splash_lsu_0_46:
	setx 0x48732238edb38be7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 83: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_47:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_47:
	.word 0x8f902003  ! 84: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 85: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 86: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91913234  ! 87: WRPR_PIL_I	wrpr	%r4, 0x1234, %pil
	.word 0xd69004a0  ! 88: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0xa1902005  ! 89: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xd6c004a0  ! 90: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
mondo_0_48:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d92c003  ! 91: WRPR_WSTATE_R	wrpr	%r11, %r3, %wstate
splash_cmpr_0_49:
	setx 0x23d0fb807cce30ad, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 92: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 93: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87802004  ! 94: WRASI_I	wr	%r0, 0x0004, %asi
mondo_0_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d94c011  ! 95: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
	.word 0xd6dfe000  ! 96: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
	.word 0x93902002  ! 97: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
change_to_randtl_0_51:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_51:
	.word 0x8f902002  ! 98: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
change_to_randtl_0_52:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_52:
	.word 0x8f902000  ! 99: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d903541  ! 100: WRPR_PSTATE_I	wrpr	%r0, 0x1541, %pstate
	.word 0x91d02035  ! 101: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd73fc000  ! 102: STDF_R	std	%f11, [%r0, %r31]
	.word 0xa9810014  ! 103: WR_SET_SOFTINT_R	wr	%r4, %r20, %set_softint
	.word 0xa1902006  ! 104: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x879021f0  ! 105: WRPR_TT_I	wrpr	%r0, 0x01f0, %tt
debug_0_53:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 106: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
cmp_0_54:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_54:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_54
    nop
cmp_wait0_54:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_54
    nop
    ba,a cmp_startwait0_54
continue_cmp_0_54:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 30, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x99a00167  ! 107: FABSq	dis not found

splash_lsu_0_55:
	setx 0xa1c2d13126bb6211, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 108: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 109: SIAM	siam	1
debug_0_56:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 110: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_0_57:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_57-donret_0_57), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_57:
	.word 0xd8fff234  ! 111: SWAPA_I	swapa	%r12, [%r31 + 0xfffff234] %asi
DS_0_58:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xb542f521	! Random illegal ?
	.word 0x91a00542  ! 1: FSQRTd	fsqrt	
	.word 0x99a04823  ! 112: FADDs	fadds	%f1, %f3, %f12
splash_tba_0_59:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 113: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x95a289e7  ! 114: FDIVq	dis not found

	.word 0xd4d004a0  ! 115: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 116: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6821f9  ! 117: SDIVX_I	sdivx	%r0, 0x01f9, %r13
intveclr_0_61:
	setx 0xe3d4721d2a294172, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 118: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 119: SIAM	siam	1
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 120: LDX_R	ldx	[%r31 + %r0], %r13
tagged_0_62:
	tsubcctv %r24, 0x1ce5, %r15
	.word 0xda07e1f9  ! 121: LDUW_I	lduw	[%r31 + 0x01f9], %r13
	.word 0xda57c000  ! 122: LDSH_R	ldsh	[%r31 + %r0], %r13
tagged_0_63:
	taddcctv %r9, 0x1045, %r18
	.word 0xda07e1f9  ! 123: LDUW_I	lduw	[%r31 + 0x01f9], %r13
	.word 0xdac00e60  ! 124: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r13
donret_0_64:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_64-donret_0_64), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_64:
	.word 0xdaffe1f9  ! 125: SWAPA_I	swapa	%r13, [%r31 + 0x01f9] %asi
	.word 0xdacfe000  ! 126: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r13
mondo_0_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d928001  ! 127: WRPR_WSTATE_R	wrpr	%r10, %r1, %wstate
splash_cmpr_0_66:
	setx 0xb70f9935368b9f59, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 128: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_0_67:
	.word 0x819820c7  ! 129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c7, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_68)) -> intp(0,1,3)
xir_0_68:
	.word 0xa9837312  ! 130: WR_SET_SOFTINT_I	wr	%r13, 0x1312, %set_softint
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01960  ! 131: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_70)) -> intp(1,0,5)
intvec_0_70:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 133: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x93d02034  ! 134: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xd48008a0  ! 135: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
debug_0_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 136: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_0_72:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_72-donret_0_72), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_72:
	.word 0xd4fff312  ! 137: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
splash_lsu_0_73:
	setx 0x7c77b3db80d14ba3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 138: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_74:
	setx 0x1e82ef40b27048d3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 139: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b5  ! 140: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xa3a01a65  ! 141: FqTOi	fqtoi	
tagged_0_75:
	taddcctv %r4, 0x1fbd, %r22
	.word 0xe207f312  ! 142: LDUW_I	lduw	[%r31 + 0xfffff312], %r17
splash_hpstate_0_76:
	.word 0x81982454  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0454, %hpstate
	.word 0x95454000  ! 144: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
splash_htba_0_77:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 145: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_0_78:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 146: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_0_79:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 147: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_80)) -> intp(2,0,11)
intvec_0_80:
	.word 0x39400001  ! 148: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_81:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 149: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_0_82:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_82:
	.word 0x8f902001  ! 150: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_0_83:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 151: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02032  ! 152: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902b6a  ! 153: WRPR_PSTATE_I	wrpr	%r0, 0x0b6a, %pstate
	.word 0xa750c000  ! 154: RDPR_TT	<illegal instruction>
DS_0_84:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 155: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_0_85:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 156: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802089  ! 157: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x91d020b4  ! 158: Tcc_I	ta	icc_or_xcc, %r0 + 180
intveclr_0_86:
	setx 0x3ef950b4b8946525, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 159: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_87:
	taddcctv %r21, 0x1485, %r20
	.word 0xe607f312  ! 160: LDUW_I	lduw	[%r31 + 0xfffff312], %r19
mondo_0_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d94c010  ! 161: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
splash_tba_0_89:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 162: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_0_90:
	.word 0x8198211d  ! 163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011d, %hpstate
splash_cmpr_0_91:
	setx 0x8c6ef6bbdd4f455f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 164: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe71fc000  ! 165: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x93902001  ! 166: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_0_92:
	.word 0x93a049cd  ! 1: FDIVd	fdivd	%f32, %f44, %f40
	.word 0x83700cc4	! Random illegal ?
	.word 0xa9a0054a  ! 1: FSQRTd	fsqrt	
	.word 0x95a40822  ! 167: FADDs	fadds	%f16, %f2, %f10
	.word 0xa1902004  ! 168: WRPR_GL_I	wrpr	%r0, 0x0004, %-
donret_0_93:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_93-donret_0_93), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_93:
	.word 0xd4fff312  ! 169: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
	.word 0x93902001  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
donret_0_94:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_94-donret_0_94), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_94:
	.word 0xd4fff312  ! 171: SWAPA_I	swapa	%r10, [%r31 + 0xfffff312] %asi
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
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
	.word 0x91414000  ! 172: RDPC	rd	%pc, %r8
	.word 0xd0dfe020  ! 173: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r8
	.word 0xa1902007  ! 174: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xd127c000  ! 175: STF_R	st	%f8, [%r0, %r31]
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 176: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_96:
	setx 0x119b3d1384621193, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 177: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9032bb  ! 178: WRPR_PSTATE_I	wrpr	%r0, 0x12bb, %pstate
	.word 0x93480000  ! 179: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0xd28008a0  ! 180: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x93d020b4  ! 181: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0x81510000  ! 182: RDPR_TICK	rdpr	%tick, %r0
mondo_0_97:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d914007  ! 183: WRPR_WSTATE_R	wrpr	%r5, %r7, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_98)) -> intp(7,0,22)
intvec_0_98:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_99:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_99:
	.word 0x8f902003  ! 185: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x93902005  ! 186: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 187: Tcc_R	te	icc_or_xcc, %r0 + %r30
change_to_randtl_0_100:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_100:
	.word 0x8f902002  ! 188: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d802000  ! 189: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_0_101:
	setx 0xb3bfa42cd1df833c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 190: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01971  ! 191: FqTOd	dis not found

	setx 0x5114888c57c1e88e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_103:
	.word 0x39400001  ! 192: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd08804a0  ! 193: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
mondo_0_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d93400b  ! 194: WRPR_WSTATE_R	wrpr	%r13, %r11, %wstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 195: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd09004a0  ! 196: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0xd06ff312  ! 197: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff312]
change_to_randtl_0_105:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_105:
	.word 0x8f902001  ! 198: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_0_106:
	setx 0x8b17ad0a708dfbec, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 199: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802004  ! 200: WRASI_I	wr	%r0, 0x0004, %asi
cmp_0_107:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_107:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_107
    nop
cmp_wait0_107:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_107
    nop
    ba,a cmp_startwait0_107
continue_cmp_0_107:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x54, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa3a00163  ! 201: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976a3661  ! 202: SDIVX_I	sdivx	%r8, 0xfffff661, %r11
	.word 0xd6d004a0  ! 203: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
splash_hpstate_0_109:
	.word 0x81982cd5  ! 204: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd5, %hpstate
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 205: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_110:
	.word 0x97a089d1  ! 1: FDIVd	fdivd	%f2, %f48, %f42
	.word 0xbfe7c000  ! 206: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_0_111:
	setx 0x9258b12673dd42a8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 208: LDX_R	ldx	[%r31 + %r0], %r11
splash_tba_0_112:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 209: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_0_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 210: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd727c000  ! 211: STF_R	st	%f11, [%r0, %r31]
	.word 0xa9818011  ! 212: WR_SET_SOFTINT_R	wr	%r6, %r17, %set_softint
mondo_0_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d944001  ! 213: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
mondo_0_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d91c012  ! 214: WRPR_WSTATE_R	wrpr	%r7, %r18, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01970  ! 215: FqTOd	dis not found

	.word 0xa4f8800b  ! 216: SDIVcc_R	sdivcc 	%r2, %r11, %r18
	.word 0xa190200a  ! 217: WRPR_GL_I	wrpr	%r0, 0x000a, %-
mondo_0_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d950014  ! 218: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	.word 0xe48008a0  ! 219: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe4bfc020  ! 220: STDA_R	stda	%r18, [%r31 + %r0] 0x01
tagged_0_118:
	tsubcctv %r19, 0x1b83, %r14
	.word 0xe407f661  ! 221: LDUW_I	lduw	[%r31 + 0xfffff661], %r18
	.word 0x87902334  ! 222: WRPR_TT_I	wrpr	%r0, 0x0334, %tt
	.word 0xe4d7e010  ! 223: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r18
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
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
	.word 0x93414000  ! 224: RDPC	rd	%pc, %r9
cmp_0_120:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_120:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_120
    nop
cmp_wait0_120:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_120
    nop
    ba,a cmp_startwait0_120
continue_cmp_0_120:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xa0, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x93a00169  ! 225: FABSq	dis not found

donret_0_121:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_121-donret_0_121), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_121:
	.word 0xd2fff661  ! 226: SWAPA_I	swapa	%r9, [%r31 + 0xfffff661] %asi
	.word 0xa9800014  ! 227: WR_SET_SOFTINT_R	wr	%r0, %r20, %set_softint
	.word 0xa2480001  ! 228: MULX_R	mulx 	%r0, %r1, %r17
splash_lsu_0_122:
	setx 0xd8a0c14412066abf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 229: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xc66967997053b6ea, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_123:
	.word 0x39400001  ! 230: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe21ff661  ! 231: LDD_I	ldd	[%r31 + 0xfffff661], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 232: LDX_R	ldx	[%r31 + %r0], %r17
DS_0_124:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 233: SAVE_R	save	%r31, %r0, %r31
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 234: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_125:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 235: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_126)) -> intp(2,0,17)
intvec_0_126:
	.word 0x39400001  ! 236: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_127:
	setx 0xef9d757540a9a385, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cmp_0_128:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_128:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_128
    nop
cmp_wait0_128:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_128
    nop
    ba,a cmp_startwait0_128
continue_cmp_0_128:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 26, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x97a0016a  ! 238: FABSq	dis not found

	.word 0xd69ff661  ! 239: LDDA_I	ldda	[%r31, + 0xfffff661] %asi, %r11
DS_0_129:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb32c00c  ! 1: STQF_R	-	%f13, [%r12, %r11]
	normalw
	.word 0xa3458000  ! 240: RD_SOFTINT_REG	rd	%softint, %r17
splash_lsu_0_130:
	setx 0x9c2fb2aa5883312b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 241: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2c804a0  ! 242: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
splash_tba_0_131:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 243: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902003  ! 244: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xe2d00e40  ! 245: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r17
	.word 0xe2d004a0  ! 246: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0xa7520000  ! 247: RDPR_PIL	<illegal instruction>
tagged_0_132:
	tsubcctv %r4, 0x1b8e, %r16
	.word 0xe607f661  ! 248: LDUW_I	lduw	[%r31 + 0xfffff661], %r19
debug_0_133:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 249: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe727c000  ! 250: STF_R	st	%f19, [%r0, %r31]
splash_lsu_0_134:
	setx 0x50790349d72c2955, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 251: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x32800001  ! 252: BNE	bne,a	<label_0x1>
	.word 0xe6d804a0  ! 253: LDXA_R	ldxa	[%r0, %r0] 0x25, %r19
	.word 0xe66ff661  ! 254: LDSTUB_I	ldstub	%r19, [%r31 + 0xfffff661]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01971  ! 255: FqTOd	dis not found

	.word 0x8d902e38  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x0e38, %pstate
splash_hpstate_0_136:
	.word 0x819822d7  ! 257: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d7, %hpstate
	.word 0xa3a28dd1  ! 258: FdMULq	fdmulq	
	.word 0x93902000  ! 259: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_0_137:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d90c012  ! 260: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
	.word 0xe29004a0  ! 261: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
mondo_0_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d94c004  ! 262: WRPR_WSTATE_R	wrpr	%r19, %r4, %wstate
	.word 0x8780204f  ! 263: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802055  ! 264: WRASI_I	wr	%r0, 0x0055, %asi
mondo_0_139:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d94c011  ! 265: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
mondo_0_140:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d924000  ! 266: WRPR_WSTATE_R	wrpr	%r9, %r0, %wstate
debug_0_141:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_141:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_141
    nop
debug_wait0_141:
    ld [%r23], %r2
    brnz %r2, debug_wait0_141
    nop
    ba,a debug_startwait0_141
continue_debug_0_141:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_141:
    cmp %r13, %r15
    bne,a wait_for_stat_0_141
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_141:
    cmp %r14, %r15
    bne,a wait_for_debug_0_141
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00852  ! 267: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0x8d902cb8  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x0cb8, %pstate
debug_0_142:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 269: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab818000  ! 270: WR_CLEAR_SOFTINT_R	wr	%r6, %r0, %clear_softint
debug_0_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 271: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa190200c  ! 272: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 273: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a0196b  ! 274: FqTOd	dis not found

tagged_0_145:
	taddcctv %r2, 0x12f8, %r8
	.word 0xd407f661  ! 275: LDUW_I	lduw	[%r31 + 0xfffff661], %r10
splash_cmpr_0_146:
	setx 0x417e3cb68628bff7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 276: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9033f9  ! 277: WRPR_PSTATE_I	wrpr	%r0, 0x13f9, %pstate
splash_tba_0_147:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 278: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_0_148:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 279: RESTORE_R	restore	%r31, %r0, %r31
mondo_0_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d910010  ! 280: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
splash_lsu_0_150:
	setx 0xb6cd6be92cd59f77, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 281: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902260  ! 282: WRPR_TT_I	wrpr	%r0, 0x0260, %tt
	setx 0x6f6cdd258c59dece, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_151:
	.word 0x39400001  ! 283: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd40ff661  ! 284: LDUB_I	ldub	[%r31 + 0xfffff661], %r10
mondo_0_152:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d910004  ! 285: WRPR_WSTATE_R	wrpr	%r4, %r4, %wstate
	.word 0x8d903938  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x1938, %pstate
splash_tba_0_153:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 287: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902281  ! 288: WRPR_TT_I	wrpr	%r0, 0x0281, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b68a93c  ! 289: SDIVX_I	sdivx	%r2, 0x093c, %r13
splash_tba_0_155:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 290: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_0_156:
	setx 0xe123fb0fa0b39685, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 291: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a0196b  ! 292: FqTOd	dis not found

splash_lsu_0_158:
	setx 0x473847a5c01c5417, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 293: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 294: RD_STICK_REG	stbar
splash_cmpr_0_159:
	setx 0x73544d1e7c84c9cc, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_160:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 296: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d903131  ! 297: WRPR_PSTATE_I	wrpr	%r0, 0x1131, %pstate
	.word 0x90fc3336  ! 298: SDIVcc_I	sdivcc 	%r16, 0xfffff336, %r8
	.word 0xa980400a  ! 299: WR_SET_SOFTINT_R	wr	%r1, %r10, %set_softint
	.word 0xd08804a0  ! 300: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	setx 0xd2b2d8769ea7d2c3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_161:
	.word 0x39400001  ! 301: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0d804a0  ! 302: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_162)) -> intp(0,0,26)
intvec_0_162:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_163:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d90c008  ! 304: WRPR_WSTATE_R	wrpr	%r3, %r8, %wstate
	.word 0xab84000b  ! 305: WR_CLEAR_SOFTINT_R	wr	%r16, %r11, %clear_softint
	.word 0xa190200b  ! 306: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 307: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01970  ! 308: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01973  ! 309: FqTOd	dis not found

	.word 0x8780204f  ! 310: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8780204f  ! 311: WRASI_I	wr	%r0, 0x004f, %asi
mondo_0_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d950013  ! 312: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
pmu_0_167:
	nop
	setx 0xfffff92dfffff467, %g1, %g7
	.word 0xa3800007  ! 313: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_0_168:
	setx 0x30a4f5147b90e6d7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 314: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790227b  ! 315: WRPR_TT_I	wrpr	%r0, 0x027b, %tt
	.word 0x91946e91  ! 316: WRPR_PIL_I	wrpr	%r17, 0x0e91, %pil
tagged_0_169:
	taddcctv %r10, 0x14c0, %r3
	.word 0xd607ee91  ! 317: LDUW_I	lduw	[%r31 + 0x0e91], %r11
	.word 0x91a489d1  ! 318: FDIVd	fdivd	%f18, %f48, %f8
	.word 0xd06fee91  ! 319: LDSTUB_I	ldstub	%r8, [%r31 + 0x0e91]
	.word 0xd06fee91  ! 320: LDSTUB_I	ldstub	%r8, [%r31 + 0x0e91]
splash_tba_0_170:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 321: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa8c16697  ! 322: ADDCcc_I	addccc 	%r5, 0x0697, %r20
splash_cmpr_0_171:
	setx 0x2deb49704708a2c4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 323: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802080  ! 324: WRASI_I	wr	%r0, 0x0080, %asi
cmp_0_172:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_172:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_172
    nop
cmp_wait0_172:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_172
    nop
    ba,a cmp_startwait0_172
continue_cmp_0_172:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 40, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x99a00162  ! 325: FABSq	dis not found

	.word 0x93902002  ! 326: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
debug_0_173:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 327: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_0_174:
	.word 0x81982d66  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d66, %hpstate
splash_tba_0_175:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 329: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_176:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 330: RDPC	rd	%pc, %r13
tagged_0_177:
	taddcctv %r10, 0x1722, %r14
	.word 0xda07e697  ! 331: LDUW_I	lduw	[%r31 + 0x0697], %r13
	.word 0xda1fc000  ! 332: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xa24a800a  ! 333: MULX_R	mulx 	%r10, %r10, %r17
	.word 0xe2dfe010  ! 334: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r17
change_to_randtl_0_178:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_178:
	.word 0x8f902002  ! 335: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_0_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 336: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_0_180:
	setx 0x5cf3686e249f1a47, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902002  ! 338: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
mondo_0_181:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d948007  ! 339: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
donret_0_182:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_182-donret_0_182), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_182:
	.word 0xe2ffe697  ! 340: SWAPA_I	swapa	%r17, [%r31 + 0x0697] %asi
	.word 0xe26fe697  ! 341: LDSTUB_I	ldstub	%r17, [%r31 + 0x0697]
intveclr_0_183:
	setx 0x486db905be16eb66, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 342: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_0_184:
	.word 0x81982097  ! 343: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0097, %hpstate
intveclr_0_185:
	setx 0x719044a235be610c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_186)) -> intp(2,0,15)
intvec_0_186:
	.word 0x39400001  ! 345: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfe020  ! 346: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r17
splash_tba_0_187:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 347: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200f  ! 348: WRPR_GL_I	wrpr	%r0, 0x000f, %-
change_to_randtl_0_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_188:
	.word 0x8f902001  ! 349: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	setx 0xe86902be780933ba, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_189:
	.word 0x39400001  ! 350: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 351: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_190
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_190
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_190:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 352: RDPC	rd	%pc, %r19
	.word 0xe69fe697  ! 353: LDDA_I	ldda	[%r31, + 0x0697] %asi, %r19
	.word 0x87802020  ! 354: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe647c000  ! 355: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0xe68804a0  ! 356: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
mondo_0_191:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d928000  ! 357: WRPR_WSTATE_R	wrpr	%r10, %r0, %wstate
pmu_0_192:
	nop
	setx 0xfffff2e4fffff2d0, %g1, %g7
	.word 0xa3800007  ! 358: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cmp_0_193:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_193:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_193
    nop
cmp_wait0_193:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_193
    nop
    ba,a cmp_startwait0_193
continue_cmp_0_193:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x6a, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa1a00170  ! 359: FABSq	dis not found

splash_cmpr_0_194:
	setx 0x3b5d843a931a8440, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 360: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99540000  ! 361: RDPR_GL	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01960  ! 362: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 363: LDX_R	ldx	[%r31 + %r0], %r13
intveclr_0_196:
	setx 0xc440c5d41b902440, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 365: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01962  ! 366: FqTOd	dis not found

DS_0_198:
	.word 0x97a349c2  ! 1: FDIVd	fdivd	%f44, %f2, %f42
	.word 0xef78e29a	! Random illegal ?
	.word 0xe3130001  ! 1: LDQF_R	-	[%r12, %r1], %f17
	.word 0x97a4c834  ! 367: FADDs	fadds	%f19, %f20, %f11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01960  ! 368: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.xir_0_200)) -> intp(0,1,3)
xir_0_200:
	.word 0xa980be9a  ! 369: WR_SET_SOFTINT_I	wr	%r2, 0x1e9a, %set_softint
	.word 0x87802004  ! 370: WRASI_I	wr	%r0, 0x0004, %asi
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_201
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_201:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 371: RDPC	rd	%pc, %r10
	.word 0x99902001  ! 372: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x8780204f  ! 373: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xd4d804a0  ! 374: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
change_to_randtl_0_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_202:
	.word 0x8f902002  ! 375: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa1464000  ! 376: RD_STICK_CMPR_REG	rd	%-, %r16
DS_0_203:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 377: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe06ffe9a  ! 378: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffe9a]
	.word 0x91d02034  ! 379: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87802055  ! 380: WRASI_I	wr	%r0, 0x0055, %asi
splash_cmpr_0_204:
	setx 0xecda6be859abce34, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 381: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_0_205:
	.word 0x8198205c  ! 382: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005c, %hpstate
splash_cmpr_0_206:
	setx 0x645452778a8bf4af, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 383: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5480000  ! 384: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
tagged_0_207:
	taddcctv %r26, 0x10de, %r12
	.word 0xe407fe9a  ! 385: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r18
	.word 0xa1902008  ! 386: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xe527fe9a  ! 387: STF_I	st	%f18, [0x1e9a, %r31]
splash_cmpr_0_208:
	setx 0xf38a2497b4a47d8f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 388: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 389: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_0_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 390: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_0_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_210:
	.word 0x8f902000  ! 391: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe4d00e40  ! 392: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r18
debug_0_211:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 393: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe49ffe9a  ! 394: LDDA_I	ldda	[%r31, + 0xfffffe9a] %asi, %r18
	.word 0xe42ffe9a  ! 395: STB_I	stb	%r18, [%r31 + 0xfffffe9a]
	.word 0xe457fe9a  ! 396: LDSH_I	ldsh	[%r31 + 0xfffffe9a], %r18
DS_0_212:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x97a249d2  ! 1: FDIVd	fdivd	%f40, %f18, %f42
	normalw
	.word 0x97458000  ! 397: RD_SOFTINT_REG	rd	%softint, %r11
tagged_0_213:
	taddcctv %r11, 0x1a5d, %r22
	.word 0xd607fe9a  ! 398: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r11
splash_hpstate_0_214:
	.word 0x819824d5  ! 399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d5, %hpstate
	.word 0xd60fc000  ! 400: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0x87902099  ! 401: WRPR_TT_I	wrpr	%r0, 0x0099, %tt
splash_tba_0_215:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 402: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01973  ! 403: FqTOd	dis not found

debug_0_217:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 404: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd48008a0  ! 405: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_218:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 406: RDPC	rd	%pc, %r13
cmp_0_219:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_219:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_219
    nop
cmp_wait0_219:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_219
    nop
    ba,a cmp_startwait0_219
continue_cmp_0_219:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 54, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa3a00170  ! 407: FABSq	dis not found

splash_htba_0_220:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 408: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
change_to_randtl_0_221:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_221:
	.word 0x8f902002  ! 409: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8780204f  ! 410: WRASI_I	wr	%r0, 0x004f, %asi
splash_cmpr_0_222:
	setx 0x1fca96e0d9f8cb8b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 411: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_0_223:
	nop
	setx 0xfffff001fffffa87, %g1, %g7
	.word 0xa3800007  ! 412: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_0_224:
	tsubcctv %r25, 0x14e6, %r1
	.word 0xe207fe9a  ! 413: LDUW_I	lduw	[%r31 + 0xfffffe9a], %r17
mondo_0_225:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d944002  ! 414: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
splash_tba_0_226:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 415: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f8030eb  ! 416: SIR	sir	0x10eb
splash_cmpr_0_227:
	setx 0x8f4466967908d60e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 417: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9b520000  ! 418: RDPR_PIL	<illegal instruction>
debug_0_228:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_228:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_228
    nop
debug_wait0_228:
    ld [%r23], %r2
    brnz %r2, debug_wait0_228
    nop
    ba,a debug_startwait0_228
continue_debug_0_228:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_228:
    cmp %r13, %r15
    bne,a wait_for_stat_0_228
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_228:
    cmp %r14, %r15
    bne,a wait_for_debug_0_228
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00852  ! 419: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0x83d02035  ! 420: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xdadfe030  ! 421: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
debug_0_229:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 422: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91683f43  ! 423: SDIVX_I	sdivx	%r0, 0xffffff43, %r8
	.word 0xd08fe010  ! 424: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r8
splash_hpstate_0_231:
	.word 0x81982675  ! 425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0675, %hpstate
mondo_0_232:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d91c002  ! 426: WRPR_WSTATE_R	wrpr	%r7, %r2, %wstate
	.word 0xd08008a0  ! 427: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd057c000  ! 428: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01967  ! 429: FqTOd	dis not found

cmp_0_234:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_234:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_234
    nop
cmp_wait0_234:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_234
    nop
    ba,a cmp_startwait0_234
continue_cmp_0_234:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x46, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x99a00171  ! 430: FABSq	dis not found

	.word 0x97540000  ! 431: RDPR_GL	<illegal instruction>
	.word 0x90d17110  ! 432: UMULcc_I	umulcc 	%r5, 0xfffff110, %r8
	.word 0x87802089  ! 433: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_0_235:
	setx 0x62b3aa2e7a0ca3a7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 434: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_0_236:
	.word 0x81982d56  ! 435: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d56, %hpstate
	.word 0xd0c00e60  ! 436: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r8
	.word 0x97a509d2  ! 437: FDIVd	fdivd	%f20, %f18, %f42
tagged_0_237:
	taddcctv %r9, 0x17a5, %r22
	.word 0xd607f110  ! 438: LDUW_I	lduw	[%r31 + 0xfffff110], %r11
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_238)) -> intp(1,0,24)
intvec_0_238:
	.word 0x39400001  ! 439: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_239:
	setx 0xbc1bc515bcfcdc98, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6d804a0  ! 441: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
splash_cmpr_0_240:
	setx 0x84445754ead1aed6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 442: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01974  ! 443: FqTOd	dis not found

	.word 0xe6d7e010  ! 444: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r19
	.word 0x87802089  ! 445: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01969  ! 446: FqTOd	dis not found

	.word 0x91d02032  ! 447: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_cmpr_0_243:
	setx 0xc1e2e4d8927359ae, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903383  ! 449: WRPR_PSTATE_I	wrpr	%r0, 0x1383, %pstate
change_to_randtl_0_244:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_244:
	.word 0x8f902000  ! 450: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
cmp_0_245:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_245:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_245
    nop
cmp_wait0_245:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_245
    nop
    ba,a cmp_startwait0_245
continue_cmp_0_245:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 58, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9ba00163  ! 451: FABSq	dis not found

debug_0_246:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_246:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_246
    nop
debug_wait0_246:
    ld [%r23], %r2
    brnz %r2, debug_wait0_246
    nop
    ba,a debug_startwait0_246
continue_debug_0_246:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_246:
    cmp %r13, %r15
    bne,a wait_for_stat_0_246
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_246:
    cmp %r14, %r15
    bne,a wait_for_debug_0_246
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00852  ! 452: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	.word 0x95a449cd  ! 453: FDIVd	fdivd	%f48, %f44, %f10
tagged_0_247:
	taddcctv %r14, 0x1970, %r13
	.word 0xd407f110  ! 454: LDUW_I	lduw	[%r31 + 0xfffff110], %r10
	.word 0x87802055  ! 455: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xd48008a0  ! 456: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
debug_0_248:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 457: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	setx 0xae2f5a0c255adc4e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_249:
	.word 0x39400001  ! 458: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1464000  ! 459: RD_STICK_CMPR_REG	rd	%-, %r16
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_250)) -> intp(0,1,3)
xir_0_250:
	.word 0xa9843079  ! 460: WR_SET_SOFTINT_I	wr	%r16, 0x1079, %set_softint
intveclr_0_251:
	setx 0xd5638b270708568b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 461: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_252:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_252:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_252
    nop
debug_wait0_252:
    ld [%r23], %r2
    brnz %r2, debug_wait0_252
    nop
    ba,a debug_startwait0_252
continue_debug_0_252:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_252:
    cmp %r13, %r15
    bne,a wait_for_stat_0_252
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_252:
    cmp %r14, %r15
    bne,a wait_for_debug_0_252
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00852  ! 462: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
mondo_0_253:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d90c010  ! 463: WRPR_WSTATE_R	wrpr	%r3, %r16, %wstate
debug_0_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 464: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_255
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_255
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_255:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 465: RDPC	rd	%pc, %r13
change_to_randtl_0_256:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_256:
	.word 0x8f902000  ! 466: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9f8032f6  ! 467: SIR	sir	0x12f6
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_257:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 468: RDPC	rd	%pc, %r10
debug_0_258:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_258:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_258
    nop
debug_wait0_258:
    ld [%r23], %r2
    brnz %r2, debug_wait0_258
    nop
    ba,a debug_startwait0_258
continue_debug_0_258:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_258:
    cmp %r13, %r15
    bne,a wait_for_stat_0_258
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_258:
    cmp %r14, %r15
    bne,a wait_for_debug_0_258
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00852  ! 469: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
tagged_0_259:
	taddcctv %r8, 0x1923, %r1
	.word 0xd407f2f6  ! 470: LDUW_I	lduw	[%r31 + 0xfffff2f6], %r10
	.word 0x9353c000  ! 471: RDPR_FQ	<illegal instruction>
	.word 0xd24ff2f6  ! 472: LDSB_I	ldsb	[%r31 + 0xfffff2f6], %r9
	.word 0x8d90398c  ! 473: WRPR_PSTATE_I	wrpr	%r0, 0x198c, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97687cba  ! 474: SDIVX_I	sdivx	%r1, 0xfffffcba, %r11
splash_cmpr_0_261:
	setx 0x49b79b8c4fe5dae6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 475: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_0_262:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_262:
	.word 0x8f902000  ! 476: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd697e000  ! 477: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
	.word 0x94fce208  ! 478: SDIVcc_I	sdivcc 	%r19, 0x0208, %r10
splash_cmpr_0_263:
	setx 0xbedcb540b0e456d2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 479: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 480: LDX_R	ldx	[%r31 + %r0], %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 481: LDX_R	ldx	[%r31 + %r0], %r10
mondo_0_264:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d948014  ! 482: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
splash_tba_0_265:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 483: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 484: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x87802080  ! 485: WRASI_I	wr	%r0, 0x0080, %asi
splash_tba_0_266:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 486: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd49fe208  ! 487: LDDA_I	ldda	[%r31, + 0x0208] %asi, %r10
debug_0_267:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_267:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_267
    nop
debug_wait0_267:
    ld [%r23], %r2
    brnz %r2, debug_wait0_267
    nop
    ba,a debug_startwait0_267
continue_debug_0_267:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_267:
    cmp %r13, %r15
    bne,a wait_for_stat_0_267
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_267:
    cmp %r14, %r15
    bne,a wait_for_debug_0_267
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %16, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00852  ! 488: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	.word 0xa980c012  ! 489: WR_SET_SOFTINT_R	wr	%r3, %r18, %set_softint
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_268
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_268
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_268:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 490: RDPC	rd	%pc, %r13
	.word 0x8d802000  ! 491: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_0_269:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 492: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_270:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_270:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_270
    nop
debug_wait0_270:
    ld [%r23], %r2
    brnz %r2, debug_wait0_270
    nop
    ba,a debug_startwait0_270
continue_debug_0_270:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_270:
    cmp %r13, %r15
    bne,a wait_for_stat_0_270
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_270:
    cmp %r14, %r15
    bne,a wait_for_debug_0_270
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00852  ! 493: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	setx 0xe1cb9be6e63fdebc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_271:
	.word 0x39400001  ! 494: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_272:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb30400c  ! 1: STQF_R	-	%f13, [%r12, %r1]
	normalw
	.word 0xa7458000  ! 495: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0xe68008a0  ! 496: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
debug_0_273:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_273:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_273
    nop
debug_wait0_273:
    ld [%r23], %r2
    brnz %r2, debug_wait0_273
    nop
    ba,a debug_startwait0_273
continue_debug_0_273:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_273:
    cmp %r13, %r15
    bne,a wait_for_stat_0_273
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_273:
    cmp %r14, %r15
    bne,a wait_for_debug_0_273
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe0f00852  ! 497: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 498: LDX_R	ldx	[%r31 + %r0], %r19
tagged_0_274:
	tsubcctv %r23, 0x18e7, %r16
	.word 0xe607e208  ! 499: LDUW_I	lduw	[%r31 + 0x0208], %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_275)) -> intp(0,1,3)
xir_0_275:
	.word 0xa98374d4  ! 500: WR_SET_SOFTINT_I	wr	%r13, 0x14d4, %set_softint
mondo_0_276:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d904011  ! 501: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
splash_cmpr_0_277:
	setx 0x66f5ee524cdd35f2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 502: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_278:
	tsubcctv %r25, 0x1e5e, %r7
	.word 0xe607f4d4  ! 503: LDUW_I	lduw	[%r31 + 0xfffff4d4], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 504: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xad842c34  ! 505: WR_SOFTINT_REG_I	wr	%r16, 0x0c34, %softint
	.word 0x8790214b  ! 506: WRPR_TT_I	wrpr	%r0, 0x014b, %tt
	.word 0xe677c000  ! 507: STX_R	stx	%r19, [%r31 + %r0]
cmp_0_279:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_279:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_279
    nop
cmp_wait0_279:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_279
    nop
    ba,a cmp_startwait0_279
continue_cmp_0_279:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xae, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa1a0016a  ! 508: FABSq	dis not found

DS_0_280:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 509: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_0_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_281:
	.word 0x8f902000  ! 510: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_282
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_282
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_282:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 511: RDPC	rd	%pc, %r11
splash_hpstate_0_283:
	.word 0x819828ce  ! 512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ce, %hpstate
mondo_0_284:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d91c008  ! 513: WRPR_WSTATE_R	wrpr	%r7, %r8, %wstate
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_285
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_285
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_285:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 514: RDPC	rd	%pc, %r20
	.word 0xe83fec34  ! 515: STD_I	std	%r20, [%r31 + 0x0c34]
debug_0_286:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 516: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_0_287:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_287:
	.word 0x8f902001  ! 517: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93a349c0  ! 518: FDIVd	fdivd	%f44, %f0, %f40
mondo_0_288:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d928005  ! 519: WRPR_WSTATE_R	wrpr	%r10, %r5, %wstate
mondo_0_289:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d90c000  ! 520: WRPR_WSTATE_R	wrpr	%r3, %r0, %wstate
change_to_randtl_0_290:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_290:
	.word 0x8f902002  ! 521: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd327c000  ! 522: STF_R	st	%f9, [%r0, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 523: LDX_R	ldx	[%r31 + %r0], %r9
debug_0_291:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_291:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_291
    nop
debug_wait0_291:
    ld [%r23], %r2
    brnz %r2, debug_wait0_291
    nop
    ba,a debug_startwait0_291
continue_debug_0_291:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_291:
    cmp %r13, %r15
    bne,a wait_for_stat_0_291
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_291:
    cmp %r14, %r15
    bne,a wait_for_debug_0_291
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00852  ! 524: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
intveclr_0_292:
	setx 0xe54c3820cfd42c51, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01969  ! 526: FqTOd	dis not found

mondo_0_294:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d94c013  ! 527: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
tagged_0_295:
	taddcctv %r12, 0x1225, %r13
	.word 0xd407ec34  ! 528: LDUW_I	lduw	[%r31 + 0x0c34], %r10
	.word 0x8d802000  ! 529: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902244  ! 530: WRPR_TT_I	wrpr	%r0, 0x0244, %tt
	.word 0x91d02033  ! 531: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x30800001  ! 532: BA	ba,a	<label_0x1>
	.word 0xd4c80e60  ! 533: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r10
	.word 0x83d02032  ! 534: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_cmpr_0_296:
	setx 0xa8429379f490ffb8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 535: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01960  ! 536: FqTOd	dis not found

DS_0_298:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd731eaec  ! 1: STQF_I	-	%f11, [0x0aec, %r7]
	normalw
	.word 0x99458000  ! 537: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x93902006  ! 538: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d02032  ! 539: Tcc_I	ta	icc_or_xcc, %r0 + 50
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 540: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7696922  ! 541: SDIVX_I	sdivx	%r5, 0x0922, %r19
	.word 0x38800001  ! 542: BGU	bgu,a	<label_0x1>
	.word 0xe6c7e000  ! 543: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r19
splash_lsu_0_300:
	setx 0x2ee6a0b8ace5c86b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 544: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802055  ! 545: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x91d020b2  ! 546: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x93902000  ! 547: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 548: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9f802a43  ! 549: SIR	sir	0x0a43
	setx 0xb2f236b616aedb03, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_301:
	.word 0x39400001  ! 550: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 551: LDX_R	ldx	[%r31 + %r0], %r19
splash_tba_0_302:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 552: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_0_303:
	.word 0x8198247f  ! 553: WRHPR_HPSTATE_I	wrhpr	%r0, 0x047f, %hpstate
splash_lsu_0_304:
	setx 0x34f2042f7349ae33, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 554: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_305:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d940002  ! 555: WRPR_WSTATE_R	wrpr	%r16, %r2, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956b2176  ! 556: SDIVX_I	sdivx	%r12, 0x0176, %r10
	.word 0x97500000  ! 557: RDPR_TPC	rdpr	%tpc, %r11
splash_cmpr_0_307:
	setx 0xb14d9b15747862d9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 558: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_0_308:
	.word 0x81982f0e  ! 559: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0e, %hpstate
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_309
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_309
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_309:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 560: RDPC	rd	%pc, %r13
splash_tba_0_310:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 561: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_0_311:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 562: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xdad7e010  ! 563: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r13
debug_0_312:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_312:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_312
    nop
debug_wait0_312:
    ld [%r23], %r2
    brnz %r2, debug_wait0_312
    nop
    ba,a debug_startwait0_312
continue_debug_0_312:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_312:
    cmp %r13, %r15
    bne,a wait_for_stat_0_312
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_312:
    cmp %r14, %r15
    bne,a wait_for_debug_0_312
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00852  ! 564: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0x97480000  ! 565: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
splash_cmpr_0_313:
	setx 0xd7d787831e440600, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 566: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd66fe176  ! 567: LDSTUB_I	ldstub	%r11, [%r31 + 0x0176]
	.word 0xd6d004a0  ! 568: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0xd697e020  ! 569: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r11
splash_cmpr_0_314:
	setx 0xb84d86a7a95b376b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 570: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_315:
	setx 0x2fff095ebbcb938d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 571: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd61fe176  ! 572: LDD_I	ldd	[%r31 + 0x0176], %r11
change_to_randtl_0_316:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_316:
	.word 0x8f902000  ! 573: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
cmp_0_317:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_317:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_317
    nop
cmp_wait0_317:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_317
    nop
    ba,a cmp_startwait0_317
continue_cmp_0_317:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x7c, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91a00171  ! 574: FABSq	dis not found

cmp_0_318:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_318:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_318
    nop
cmp_wait0_318:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_318
    nop
    ba,a cmp_startwait0_318
continue_cmp_0_318:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x48, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x93a00174  ! 575: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 576: LDX_R	ldx	[%r31 + %r0], %r9
mondo_0_319:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d91400a  ! 577: WRPR_WSTATE_R	wrpr	%r5, %r10, %wstate
	.word 0x93902000  ! 578: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa5a489d4  ! 579: FDIVd	fdivd	%f18, %f20, %f18
intveclr_0_320:
	setx 0x3f9c30f5e171a770, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 580: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 581: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe4800c60  ! 582: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r18
cmp_0_321:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_321:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_321
    nop
cmp_wait0_321:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_321
    nop
    ba,a cmp_startwait0_321
continue_cmp_0_321:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x9a, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa3a00160  ! 583: FABSq	dis not found

	.word 0xa1902002  ! 584: WRPR_GL_I	wrpr	%r0, 0x0002, %-
intveclr_0_322:
	setx 0x1444dba47f922501, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 585: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_0_323:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 586: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_0_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d91800a  ! 587: WRPR_WSTATE_R	wrpr	%r6, %r10, %wstate
splash_cmpr_0_325:
	setx 0x81407b357b1fe578, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 588: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe29004a0  ! 589: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
	.word 0xe25fe176  ! 590: LDX_I	ldx	[%r31 + 0x0176], %r17
	.word 0x93902007  ! 591: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 592: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 593: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8790205d  ! 594: WRPR_TT_I	wrpr	%r0, 0x005d, %tt
debug_0_326:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 595: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a0196b  ! 596: FqTOd	dis not found

splash_cmpr_0_328:
	setx 0xdfd315bbc4c274b9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 597: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe257c000  ! 598: LDSH_R	ldsh	[%r31 + %r0], %r17
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_329
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_329
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_329:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 599: RDPC	rd	%pc, %r18
	.word 0xe41fc000  ! 600: LDD_R	ldd	[%r31 + %r0], %r18
splash_cmpr_0_330:
	setx 0x074d3cf2616c9e7e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 601: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 602: LDX_R	ldx	[%r31 + %r0], %r18
mondo_0_331:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d944009  ! 603: WRPR_WSTATE_R	wrpr	%r17, %r9, %wstate
	.word 0x91a349c4  ! 604: FDIVd	fdivd	%f44, %f4, %f8
splash_lsu_0_332:
	setx 0x3000d789a3c960d3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 605: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 606: Tcc_I	ta	icc_or_xcc, %r0 + 53
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_333
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_333
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_333:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 607: RDPC	rd	%pc, %r8
splash_tba_0_334:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 608: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81510000  ! 609: RDPR_TICK	rdpr	%tick, %r0
	.word 0xd057c000  ! 610: LDSH_R	ldsh	[%r31 + %r0], %r8
tagged_0_335:
	taddcctv %r16, 0x1a63, %r2
	.word 0xd007e176  ! 611: LDUW_I	lduw	[%r31 + 0x0176], %r8
	.word 0x91d02035  ! 612: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93454000  ! 613: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
intveclr_0_336:
	setx 0x68c441deb619c3b8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 614: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_337:
	setx 0x6d044cac1066ff4d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 615: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_338:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8b63251e	! Random illegal ?
	.word 0xe911c011  ! 1: LDQF_R	-	[%r7, %r17], %f20
	.word 0xa1a2c82a  ! 616: FADDs	fadds	%f11, %f10, %f16
mondo_0_339:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d94c003  ! 617: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
splash_cmpr_0_340:
	setx 0x8e6fb41e29647bf4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 618: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 619: Tcc_I	ta	icc_or_xcc, %r0 + 51
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 620: LDX_R	ldx	[%r31 + %r0], %r16
splash_cmpr_0_341:
	setx 0xe752f0551300a835, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 621: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0c004a0  ! 622: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
	.word 0xe137e176  ! 623: STQF_I	-	%f16, [0x0176, %r31]
change_to_randtl_0_342:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_342:
	.word 0x8f902002  ! 624: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_0_343:
	taddcctv %r24, 0x12a0, %r22
	.word 0xe007e176  ! 625: LDUW_I	lduw	[%r31 + 0x0176], %r16
	.word 0xa7a20d26  ! 626: FsMULd	fsmuld	%f8, %f6, %f50
splash_tba_0_344:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 627: WRPR_TBA_R	wrpr	%r0, %r2, %tba
pmu_0_345:
	nop
	setx 0xfffffad2ffffffb7, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01973  ! 629: FqTOd	dis not found

	.word 0xad833b6a  ! 630: WR_SOFTINT_REG_I	wr	%r12, 0x1b6a, %softint
	.word 0xd447c000  ! 631: LDSW_R	ldsw	[%r31 + %r0], %r10
	.word 0x93902001  ! 632: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
debug_0_347:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 633: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_348
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_348
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_348:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 634: RDPC	rd	%pc, %r16
DS_0_349:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x9ba489c6  ! 1: FDIVd	fdivd	%f18, %f6, %f44
	normalw
	.word 0xa7458000  ! 635: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0x93464000  ! 636: RD_STICK_CMPR_REG	rd	%-, %r9
	.word 0xd28008a0  ! 637: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xa9500000  ! 638: RDPR_TPC	<illegal instruction>
tagged_0_350:
	tsubcctv %r21, 0x1292, %r19
	.word 0xe807fb6a  ! 639: LDUW_I	lduw	[%r31 + 0xfffffb6a], %r20
	.word 0xa1902009  ! 640: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	setx 0x28305b49d3c3d535, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_351:
	.word 0x39400001  ! 641: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_0_352:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 642: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_0_353:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 643: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_354
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_354
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_354:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 644: RDPC	rd	%pc, %r13
	.word 0xda8008a0  ! 645: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x99454000  ! 646: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0x93902002  ! 647: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_cmpr_0_355:
	setx 0xcc4b19e11e508feb, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 648: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b4  ! 649: Tcc_I	ta	icc_or_xcc, %r0 + 180
debug_0_356:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 650: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd81ffb6a  ! 651: LDD_I	ldd	[%r31 + 0xfffffb6a], %r12
mondo_0_357:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d94c014  ! 652: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0x87902116  ! 653: WRPR_TT_I	wrpr	%r0, 0x0116, %tt
	.word 0x8790222a  ! 654: WRPR_TT_I	wrpr	%r0, 0x022a, %tt
	.word 0xa1480000  ! 655: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0x879022f2  ! 656: WRPR_TT_I	wrpr	%r0, 0x02f2, %tt
	.word 0x87802010  ! 657: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d802004  ! 658: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87802020  ! 659: WRASI_I	wr	%r0, 0x0020, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_358)) -> intp(3,0,16)
intvec_0_358:
	.word 0x39400001  ! 660: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_359:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 661: SAVE_R	save	%r31, %r0, %r31
	.word 0x9b540000  ! 662: RDPR_GL	<illegal instruction>
debug_0_360:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_360:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_360
    nop
debug_wait0_360:
    ld [%r23], %r2
    brnz %r2, debug_wait0_360
    nop
    ba,a debug_startwait0_360
continue_debug_0_360:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_360:
    cmp %r13, %r15
    bne,a wait_for_stat_0_360
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_360:
    cmp %r14, %r15
    bne,a wait_for_debug_0_360
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd8f00852  ! 663: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
debug_0_361:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 664: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xda1fc000  ! 665: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xa7b14fea  ! 666: FONES	e	%f19
	.word 0xe68008a0  ! 667: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe6dfe000  ! 668: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r19
	.word 0x87802014  ! 669: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93902004  ! 670: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
change_to_randtl_0_362:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_362:
	.word 0x8f902002  ! 671: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa5a01a62  ! 672: FqTOi	fqtoi	
	.word 0xe48fe030  ! 673: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r18
	.word 0xe4900e60  ! 674: LDUHA_R	lduha	[%r0, %r0] 0x73, %r18
	.word 0x8d90280f  ! 675: WRPR_PSTATE_I	wrpr	%r0, 0x080f, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01973  ! 676: FqTOd	dis not found

	.word 0xd89fc020  ! 677: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0x93902006  ! 678: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_0_364:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d92c014  ! 679: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
	.word 0xd8900e40  ! 680: LDUHA_R	lduha	[%r0, %r0] 0x72, %r12
mondo_0_365:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d940014  ! 681: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
splash_cmpr_0_366:
	setx 0xbe20a057b20590e1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 682: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 683: LDX_R	ldx	[%r31 + %r0], %r12
DS_0_367:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 684: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x87802020  ! 685: WRASI_I	wr	%r0, 0x0020, %asi
intveclr_0_368:
	setx 0xad6d52b19393b4b6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 686: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a0196b  ! 687: FqTOd	dis not found

splash_lsu_0_370:
	setx 0x9a96b833c84a306d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 688: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_371:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 689: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 690: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x93902004  ! 691: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01971  ! 692: FqTOd	dis not found

	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 693: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	setx 0x6532319b371ad099, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_373:
	.word 0x39400001  ! 694: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d804a0  ! 695: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
splash_hpstate_0_374:
	.word 0x8198269d  ! 696: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069d, %hpstate
	.word 0x91d02032  ! 697: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd48fe000  ! 698: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r10
	.word 0x97450000  ! 699: RD_SET_SOFTINT	rd	%set_softint, %r11
change_to_randtl_0_375:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_375:
	.word 0x8f902003  ! 700: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_cmpr_0_376:
	setx 0x0a8493c96e309736, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 701: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_0_377:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_377:
	.word 0x8f902003  ! 702: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
change_to_randtl_0_378:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_378:
	.word 0x8f902001  ! 703: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_0_379:
	taddcctv %r7, 0x1a8c, %r25
	.word 0xd607fb6a  ! 704: LDUW_I	lduw	[%r31 + 0xfffffb6a], %r11
	.word 0xd6d804a0  ! 705: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956cfa75  ! 706: SDIVX_I	sdivx	%r19, 0xfffffa75, %r10
	.word 0x87802004  ! 707: WRASI_I	wr	%r0, 0x0004, %asi
change_to_randtl_0_381:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_381:
	.word 0x8f902002  ! 708: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
change_to_randtl_0_382:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_382:
	.word 0x8f902000  ! 709: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 710: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790233c  ! 711: WRPR_TT_I	wrpr	%r0, 0x033c, %tt
	.word 0x879022e1  ! 712: WRPR_TT_I	wrpr	%r0, 0x02e1, %tt
debug_0_383:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 713: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4dfe010  ! 714: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r10
	.word 0x99902005  ! 715: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x93902000  ! 716: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_hpstate_0_384:
	.word 0x819825c7  ! 717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c7, %hpstate
splash_tba_0_385:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 718: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_0_386:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 719: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_0_387:
	set 0x00380000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 720: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x99450000  ! 721: RD_SET_SOFTINT	rd	%set_softint, %r12
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 722: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd81ffa75  ! 723: LDD_I	ldd	[%r31 + 0xfffffa75], %r12
	.word 0x8d902f9a  ! 724: WRPR_PSTATE_I	wrpr	%r0, 0x0f9a, %pstate
	.word 0x9191331f  ! 725: WRPR_PIL_I	wrpr	%r4, 0x131f, %pil
mondo_0_388:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d918011  ! 726: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
tagged_0_389:
	taddcctv %r25, 0x1ad9, %r13
	.word 0xd807f31f  ! 727: LDUW_I	lduw	[%r31 + 0xfffff31f], %r12
DS_0_390:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xeb5cf66c	! Random illegal ?
	.word 0xa5a149d3  ! 1: FDIVd	fdivd	%f36, %f50, %f18
	.word 0x91a24831  ! 728: FADDs	fadds	%f9, %f17, %f8
	.word 0xa1520000  ! 729: RDPR_PIL	<illegal instruction>
	.word 0x2a700001  ! 730: BPCS	<illegal instruction>
splash_cmpr_0_391:
	setx 0xf28ba1132dddc5bb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 731: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_392:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 732: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x83d02035  ! 733: Tcc_I	te	icc_or_xcc, %r0 + 53
splash_cmpr_0_393:
	setx 0xb9fbb72bb6c54cae, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 734: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96a248c  ! 735: SDIVX_I	sdivx	%r8, 0x048c, %r20
cmp_0_395:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_395:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_395
    nop
cmp_wait0_395:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_395
    nop
    ba,a cmp_startwait0_395
continue_cmp_0_395:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xbe, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x95a0016c  ! 736: FABSq	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01971  ! 737: FqTOd	dis not found

	setx 0x1b1c9b115c552d45, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_397:
	.word 0x39400001  ! 738: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_398:
	setx 0xcdab6b032301fc28, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 739: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5520000  ! 740: RDPR_PIL	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996d3216  ! 741: SDIVX_I	sdivx	%r20, 0xfffff216, %r12
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_400
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_400
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_400:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 742: RDPC	rd	%pc, %r19
debug_0_401:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 743: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1540000  ! 744: RDPR_GL	<illegal instruction>
	.word 0x8d802004  ! 745: WRFPRS_I	wr	%r0, 0x0004, %fprs
    set sync_thr_counter1, %r23
    mov 1, %r10
    ta T_CHANGE_HPRIV
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_402
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_402
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_402:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 746: RDPC	rd	%pc, %r13
splash_tba_0_403:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 747: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_0_404:
	setx 0x085cfc4c0cf983eb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 748: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_405:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d910007  ! 749: WRPR_WSTATE_R	wrpr	%r4, %r7, %wstate
	.word 0x3c800001  ! 750: BPOS	bpos,a	<label_0x1>
DS_0_406:
	.word 0x99a409c9  ! 1: FDIVd	fdivd	%f16, %f40, %f12
	.word 0xbfe7c000  ! 751: SAVE_R	save	%r31, %r0, %r31
mondo_0_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d914004  ! 752: WRPR_WSTATE_R	wrpr	%r5, %r4, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976a63d0  ! 753: SDIVX_I	sdivx	%r9, 0x03d0, %r11
	.word 0x9750c000  ! 754: RDPR_TT	rdpr	%tt, %r11
	.word 0x87802088  ! 755: WRASI_I	wr	%r0, 0x0088, %asi
tagged_0_409:
	taddcctv %r6, 0x1aee, %r17
	.word 0xd607e3d0  ! 756: LDUW_I	lduw	[%r31 + 0x03d0], %r11
	.word 0xd6d7e020  ! 757: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r11
	.word 0xa950c000  ! 758: RDPR_TT	<illegal instruction>
mondo_0_410:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d950002  ! 759: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
splash_lsu_0_411:
	setx 0xa5aea4ad939d890f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 760: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_412:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d950004  ! 761: WRPR_WSTATE_R	wrpr	%r20, %r4, %wstate
	.word 0xa3480000  ! 762: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xa3540000  ! 763: RDPR_GL	<illegal instruction>
change_to_randtl_0_413:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_413:
	.word 0x8f902001  ! 764: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_0_414:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d928013  ! 765: WRPR_WSTATE_R	wrpr	%r10, %r19, %wstate
debug_0_415:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 766: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_416:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d92800d  ! 767: WRPR_WSTATE_R	wrpr	%r10, %r13, %wstate
	.word 0xe2d7e030  ! 768: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r17
debug_0_417:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_417:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_417
    nop
debug_wait0_417:
    ld [%r23], %r2
    brnz %r2, debug_wait0_417
    nop
    ba,a debug_startwait0_417
continue_debug_0_417:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_417:
    cmp %r13, %r15
    bne,a wait_for_stat_0_417
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_417:
    cmp %r14, %r15
    bne,a wait_for_debug_0_417
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00852  ! 769: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x87802010  ! 770: WRASI_I	wr	%r0, 0x0010, %asi
splash_cmpr_0_418:
	setx 0x03732940881016b7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 771: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02034  ! 772: Tcc_I	ta	icc_or_xcc, %r0 + 52
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_419)) -> intp(0,1,3)
xir_0_419:
	.word 0xa982b180  ! 773: WR_SET_SOFTINT_I	wr	%r10, 0x1180, %set_softint
	.word 0xe20fc000  ! 774: LDUB_R	ldub	[%r31 + %r0], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 775: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_0_420:
	.word 0x81982474  ! 776: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0474, %hpstate
	.word 0x83d02035  ! 777: Tcc_I	te	icc_or_xcc, %r0 + 53
tagged_0_421:
	taddcctv %r25, 0x1c19, %r25
	.word 0xe207f180  ! 778: LDUW_I	lduw	[%r31 + 0xfffff180], %r17
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 779: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_422:
	setx 0x05f8e0ac305abb02, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 780: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9b500000  ! 781: RDPR_TPC	<illegal instruction>
debug_0_423:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_423:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_423
    nop
debug_wait0_423:
    ld [%r23], %r2
    brnz %r2, debug_wait0_423
    nop
    ba,a debug_startwait0_423
continue_debug_0_423:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_423:
    cmp %r13, %r15
    bne,a wait_for_stat_0_423
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_423:
    cmp %r14, %r15
    bne,a wait_for_debug_0_423
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %16, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00852  ! 782: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
debug_0_424:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 783: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9368f176  ! 784: SDIVX_I	sdivx	%r3, 0xfffff176, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916ab5af  ! 785: SDIVX_I	sdivx	%r10, 0xfffff5af, %r8
	.word 0xd137c000  ! 786: STQF_R	-	%f8, [%r0, %r31]
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 787: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_427:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d944013  ! 788: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
donret_0_428:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_428-donret_0_428), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_428:
	.word 0xd0fff5af  ! 789: SWAPA_I	swapa	%r8, [%r31 + 0xfffff5af] %asi
	.word 0xd127c000  ! 790: STF_R	st	%f8, [%r0, %r31]
	.word 0xa545c000  ! 791: RD_TICK_CMPR_REG	rd	%-, %r18
mondo_0_429:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d950004  ! 792: WRPR_WSTATE_R	wrpr	%r20, %r4, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01965  ! 793: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 794: LDX_R	ldx	[%r31 + %r0], %r11
splash_cmpr_0_431:
	setx 0x5d75e703b71b7b18, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 795: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_432:
	setx 0x04b1540b6c3d1e7d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 796: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 797: BPNE	<illegal instruction>
	.word 0x93902003  ! 798: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_0_433:
	nop
	mov 0x38, %r18
cmpenall_0_434:
	nop
	ta T_CHANGE_HPRIV
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

	.xword	0x90c1708f9d435852
	.xword	0x00c6af4e70890657
	.xword	0x875a2ad8b1302e9c
	.xword	0x969d9a0bba5e277e
	.xword	0x942ec03a46e6a29f
	.xword	0xf02363dafda92418
	.xword	0x7272f517892dd2a2
	.xword	0x8f3d7cc223378974
	.xword	0x78131e67c2abf1e3
	.xword	0x0da51081b7a44c29
	.xword	0xe667ab992f7ebc1f
	.xword	0x6e812aa34663b174
	.xword	0xfc686b3ded2eb90a
	.xword	0x4131741fa4aebae8
	.xword	0xfda155e6dde55b20
	.xword	0x209e1feac32d8d90
	.xword	0xf079236383c85214
	.xword	0x2335c5faa0c79020
	.xword	0x81b8c310fd23c142
	.xword	0xda1758ef29406e36
	.xword	0x51f91a8acee4a6f4
	.xword	0x10d120a9169c1941
	.xword	0x070bfc77c1a1589a
	.xword	0x6d981c1d9295faa2
	.xword	0xf7cdc6c484187e04
	.xword	0x91ace4f353f60917
	.xword	0xb3118d098d6844ba
	.xword	0xd875004169db48f9
	.xword	0x8d0f61698d2ebece
	.xword	0xa24876b3f2a76483
	.xword	0xe028a249d87252c2
	.xword	0x9557c06775004e19
	.xword	0x62cce6d678ac0ceb
	.xword	0x1fafc8b36db5e550
	.xword	0x4e4d778275b3a617
	.xword	0x3b33643bcda7669b
	.xword	0x47704ce63f13971b
	.xword	0x2628d285a4970219
	.xword	0x8832f777b43fba07
	.xword	0x331291a261699cca
	.xword	0xbc9fe059c5cbdb09
	.xword	0x5c978ad20e815709
	.xword	0x603f752fb4a4261a
	.xword	0x8af2d3f360e1a733
	.xword	0xeba813ba58145153
	.xword	0xa0a4b641425c1cab
	.xword	0xdff3a60f3928501e
	.xword	0x87c755a8f28e9c9b
	.xword	0x46b3ec485bbc1655
	.xword	0x576bd97efb059849
	.xword	0xabdfe9ab8ca4918b
	.xword	0xf9128de1de81e0a1
	.xword	0x28893be15fc1b0d3
	.xword	0x0117c7212b51fa57
	.xword	0x9e3fc0958ec34d0f
	.xword	0x122eb46c2e74800a
	.xword	0xb93d68d57e5deefa
	.xword	0x404c6cc880050943
	.xword	0x7a5d34a715730391
	.xword	0xa4e5698d5510a80c
	.xword	0xd958e831c5ff7bb3
	.xword	0xa2a65056af7b1ec5
	.xword	0xa459e98293c1da09
	.xword	0x59852cbba1c35b28
	.xword	0x48c49ec41dcc6cfa
	.xword	0xcbf846c20415661a
	.xword	0x473799b13a70829c
	.xword	0x13eac2a5cddbdee8
	.xword	0xfbb1f2bea8c5c28a
	.xword	0x3f9a499d1b092a4d
	.xword	0x1fe4aa83271ab0a7
	.xword	0x8d7f11beff7fbcaf
	.xword	0x8087cd09d69af75f
	.xword	0x62c03faeebcf8fa9
	.xword	0x1315340da5dc779b
	.xword	0x1e959fdc6a3125b3
	.xword	0x6c4917cb0e2c7db9
	.xword	0x21612940250ce415
	.xword	0x0d2e41aefafb65b1
	.xword	0x738191c723f92166
	.xword	0xb3805108440d29d9
	.xword	0x5ec165a08a6e2329
	.xword	0x8770dfee2c6abeb6
	.xword	0x1e2468076d64e14c
	.xword	0x1a2d8f7e3f2ed980
	.xword	0x5bed7203cd8c7ed2
	.xword	0x3e0e400f7db310c1
	.xword	0x2f37abf3a9fbe51f
	.xword	0x32cb982b188d261a
	.xword	0x110dc0872e783bb8
	.xword	0xed56f8b226f9ba99
	.xword	0xa32f70e06049e478
	.xword	0xa43db3719884987b
	.xword	0xfd35b22d09b14d5a
	.xword	0xb136eca59f34d912
	.xword	0xa667f7e1a3355f95
	.xword	0xfca495a3cdfbddc5
	.xword	0xe450329e5e7605e7
	.xword	0x4f4f5850bfdd65d9
	.xword	0x5ee8af61dd011eac
	.xword	0xd99bdbd53ac09ac6
	.xword	0x52c55f916aa32cba
	.xword	0x780aa5135411a911
	.xword	0x33f5d5762d474777
	.xword	0x2c3e3a4fca354f0e
	.xword	0x88529edc5db7efa5
	.xword	0xbfdf4ef393db37e6
	.xword	0xcdaa670368a7fb2f
	.xword	0x15f3a662147dc188
	.xword	0xa41137614064dd28
	.xword	0xfef851a04ca3d655
	.xword	0x740a708a169e214f
	.xword	0xc968d7b446c60d6b
	.xword	0xfd29fff819b031b6
	.xword	0xbe31bf78f66fac65
	.xword	0xa42460fcd416b576
	.xword	0xdf72edab5927d56b
	.xword	0x5db2dba69fa5f491
	.xword	0xa53da377ed567bb5
	.xword	0xf3f30603b283c36e
	.xword	0xe184cf37ecc67da6
	.xword	0x80648a4cea940f03
	.xword	0xd597e3dc10bf0e0f
	.xword	0x85ba5eef79e73f10
	.xword	0x78ab0aa5e1cc82c2
	.xword	0x0141658d5c481188
	.xword	0x91d937dafc02ea89
	.xword	0xe78e851c765c2401
	.xword	0x343819100a27457a
	.xword	0x58b460eec747b907
	.xword	0xcbb7d708c84e7abf
	.xword	0xce6d26cbc1a84175
	.xword	0xf1ff9cc67375d793
	.xword	0x7670b7fa17d4cb86
	.xword	0x500c42242fc49e55
	.xword	0x1402f9f334848bec
	.xword	0x2827bd7601c2c591
	.xword	0xae16107ac06a4507
	.xword	0x30dbad6321b5a322
	.xword	0x4d5e85c5484d55ec
	.xword	0x3b364d6d0227f5bd
	.xword	0xef027f331461bfe3
	.xword	0x372b0f2a90b92193
	.xword	0x8a84dd7766356845
	.xword	0x51df41ea0f83178f
	.xword	0x388b8dcfafff741a
	.xword	0x628b34ef46b1b403
	.xword	0x20a8506af50dd7a6
	.xword	0xb304f3b5c58a2cd2
	.xword	0xb9949eb29e43973c
	.xword	0x3681c5f402b379be
	.xword	0x10fc64b27cfc92e6
	.xword	0x7533d815ea5378e4
	.xword	0x1ab71ae552fbd458
	.xword	0x119d897c13a4d100
	.xword	0xf075d3b7788e71bf
	.xword	0x8c4750fe402f7d06
	.xword	0xb3721fecb9013fdd
	.xword	0x68ab4303dd47650f
	.xword	0x450a57d3f5bdca4c
	.xword	0xb599ca243ec1dc52
	.xword	0x8f76a8fe46d92c0c
	.xword	0x2711e4597d79c768
	.xword	0x9f9234695181b365
	.xword	0x2d8d550db7680f33
	.xword	0xbe8ca19e8224d736
	.xword	0xfa9b5c2f22b5f759
	.xword	0x93fe965b64c232fe
	.xword	0xaa8ca4f06b4c4294
	.xword	0x059258abc3752ff8
	.xword	0xc462f1386d94ac8c
	.xword	0x2b4c60f761384048
	.xword	0x727e3acfda698b34
	.xword	0xd92794ade1c4ef1f
	.xword	0xdfcebd958c4881f1
	.xword	0xf53059dedcaaa430
	.xword	0xe69cc04628e5dd5d
	.xword	0x798631599c80a03b
	.xword	0x26894e022d4b01cd
	.xword	0x3684a22373c00504
	.xword	0x18599f3d883cd9eb
	.xword	0xec4635548d249e6f
	.xword	0x166d2ae058c84f1b
	.xword	0xcc99a9d86878c24e
	.xword	0xe20d5c59e84f2735
	.xword	0xaa7a7f31b9c4868d
	.xword	0x6e36917e744d156f
	.xword	0xe08cbcfba25d8a3f
	.xword	0x3d62fdcce2ced7d6
	.xword	0x2d74f5c10e3ec525
	.xword	0x9120ea48c9bafb0c
	.xword	0x00d43b28de4b36b1
	.xword	0x7a181bf3792a4a0d
	.xword	0xf69318344e8262d8
	.xword	0xba371ff64cb459bf
	.xword	0x2ba387bdf09c1ebb
	.xword	0x82ea0dae7cb6efc2
	.xword	0x270736de718a3ced
	.xword	0x315416a16762a5db
	.xword	0xf9b263f84ac60c5a
	.xword	0x3a888e9451e78a8f
	.xword	0xd15d4e27e8f67dc1
	.xword	0xe1e5a873215deb5e
	.xword	0x30f333e63e181aa7
	.xword	0x62b999eb7f86bbde
	.xword	0x6c119005d41178ce
	.xword	0x2341ccd9f35f348c
	.xword	0x739ea170be274864
	.xword	0x4a595ca68e1bcc71
	.xword	0xce145d4d4490604c
	.xword	0x31049d2256339f72
	.xword	0xbc1e036ead7dc262
	.xword	0x8df86f538000427e
	.xword	0x4b784d11501485b3
	.xword	0xa9b74865167a3ddb
	.xword	0x1531801e2a7024dd
	.xword	0x6ac61da7dd9435b8
	.xword	0x4513f5bf414ec550
	.xword	0xf73249638772c05b
	.xword	0xbc5eaae7b7d4a9d4
	.xword	0x7a994f2c479ca712
	.xword	0x21be15d0860960a3
	.xword	0x21c46acdd914e58a
	.xword	0xa91a5088497d8ac6
	.xword	0x2d9bcedceb17a3be
	.xword	0x01e05c2aea0a5efe
	.xword	0x41f4b458bef26554
	.xword	0x584c0160a475af32
	.xword	0xbb6c9cf26e17a35e
	.xword	0xff0a060fbb2974a1
	.xword	0x606608d50970519c
	.xword	0x0b054c7898b89c56
	.xword	0xdfbf6e085791e2ce
	.xword	0xc09de281dfc6d9b6
	.xword	0x850cfdcc5884ee48
	.xword	0xdd56bb65e27cca20
	.xword	0xa74c8cea32f8fb43
	.xword	0xf665a16c3616a874
	.xword	0x6ae68fb8997cae4c
	.xword	0xe9c1b61f153a2c45
	.xword	0x5658fa962a678aaf
	.xword	0x80a4aa63b349760d
	.xword	0x4f9bffcadab62e64
	.xword	0xacbb396d65900889
	.xword	0x779b8b6a22ea561c
	.xword	0x1afbb0f73928dffb
	.xword	0x6773f3a1e22ae4bc
	.xword	0x0a64ae9aaf4caef5
	.xword	0x043c42e437128d96
	.xword	0x95fb5d1bbaf447ea
	.xword	0xdc010f50f0bc4711
	.xword	0x57698b6a25c99dce
	.xword	0x60eb9db184a5cd55
	.xword	0xc26bd261aabb1aef
	.xword	0x40c9df38e4fa1282
	.xword	0xe9916caebe0c7b65

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
# 71 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
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
# 453 "diag.j"
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

